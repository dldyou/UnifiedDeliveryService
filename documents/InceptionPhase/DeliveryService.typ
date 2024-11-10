#let DeliveryService = [
    = 배달 대행 서비스 
    == Use Case 
    #align(center, image("img/delivery_system_usecase.svg", width: 50%))
    == Actor 
    - 가게 (Store)
        - 배달 요청하기, 음식 전달하기
    - 기사 (Delivery Man)
        - 배달 승인하기, 음식 배달하기
    - 배달 대행 서비스 (Delivery Service)
        - 배달 요청하기, 기사 배정하기
    == UseCase Brief Description 
    === UC1: 배달 요청하기 (Request Delivery) 
    - 가게가 주문 승인 이후 배달 대행 서비스에 특정 고객에게로의 배달을 요청한다.
    === UC2: 음식 전달하기 (Offer Food)
    - 가게가 배정받은 기사에게 음식을 전달한다.
    === UC3: 배달 승인하기 (Approve Delivery)
    - 배달 대행 서비스에서 받은 배달 요청에 대한 승인 여부를 결정한다.
    === UC4: 음식 배달하기 (Deliver Food)
    - 배달 대행 서비스에서 받은 배달 요청 정보에 따라 가게에서 음식을 전달받고 해당 음식을 고객에게 배달한다.
    === UC5: 기사 요청하기 (Request Delivery Man) 
    - 가게에서 받은 배달 요청에 따라 우선순위가 높은 기사부터 배달 요청을 보낸다.
    === UC6: 기사 배정하기 (Assign Delivery Man) 
    - 배달 요청을 승인한 기사에 대한 정보를 가게에 전달한다.
    == UseCase Description 
    === UC1: 배달 요청하기 (Request Delivery by Store)
    #table(align: left, 
        columns: 2, 
        [*UseCase*], [*Description*],
        [이름], [배달 요청하기 (Request Delivery by Store)],
        [범위], [배달 대행 서비스], 
        [수준], [가게 수준], 
        [주요 액터], [Store (가게), Delivery Service (배달 대행 서비스)], 
        [사전 조건], [배민 서비스에게 주문을 요청받고 승인한 상태여야 한다.], 
        [사후 조건], [배달을 배정받은 기사에 대한 정보가 가게에 전달된다.], 
        [기본 흐름], [
            + 가게가 주문 정보에 따라 배달 대행 서비스에 배달 요청을 보낸다.
        ], 
        [대체 흐름], [
            1a. 주문 취소가 들어온 경우 배달 요청을 중단한다.
        ],  
    )
    === UC2: 음식 전달하기 (Offer Food)
    #table(align: left, 
        columns: 2, 
        [*UseCase*], [*Description*],
        [이름], [음식 전달하기 (Offer Food)],
        [범위], [배달 대행 서비스], 
        [수준], [가게 수준], 
        [주요 액터], [가게], 
        [사전 조건], [배달 요청을 승인한 기사가 존재하는 상태여야 한다.], 
        [사후 조건], [음식이 기사에게 전달되었는지 여부를 반환한다. 주문 취소가 불가능해진다.], 
        [기본 흐름], [
            + 기사가 가게에 들어온다.
            + 배정받은 기사와 가게에 들어온 기사의 정보가 동일한지 확인한다.
            + 동일하다면 음식을 기사에게 전달한다.
        ], 
        [대체 흐름], [
            2a. 기사의 정보가 일치하지 않는다면 다른 기사가 가게에 들어온 이후 다시 2. 를 실행한다.
        ],  
    )
    === UC3: 배달 승인하기 (Approve Delivery)
    #table(align: left, 
        columns: 2, 
        [*UseCase*], [*Description*],
        [이름], [배달 승인하기 (Approve Delivery)],
        [범위], [배달 대행 서비스], 
        [수준], [기사 수준], 
        [주요 액터], [기사], 
        [사전 조건], [배달 대행 서비스로부터 배달 요청을 받은 상태여야 한다.], 
        [사후 조건], [배달 요청에 대한 승인 여부가 배달 대행 서비스에게 전달된다.], 
        [기본 흐름], [
            + 기사가 배달 요청을 확인한다.
            + 배달 요청에 대한 승인 여부를 결정한다.
            + 승인 여부를 배달 대행 서비스에 전달한다.
        ], 
        [대체 흐름], [],  
    )
    === UC4: 음식 배달하기 (Deliver Food)
    #table(align: left, 
        columns: 2, 
        [*UseCase*], [*Description*],
        [이름], [음식 배달하기 (Deliver Food)],
        [범위], [배달 대행 서비스], 
        [수준], [기사 수준], 
        [주요 액터], [기사], 
        [사전 조건], [가게로부터 음식을 전달받은 상태여야 한다.], 
        [사후 조건], [고객에게 음식이 배달된다.], 
        [기본 흐름], [
            + 주문 정보에 따라 고객의 위치로 이동한다.
            + 고객에게 음식을 전달한다.
        ], 
        [대체 흐름], [],  
    )
    === UC5: 기사 요청하기 (Request Delivery Man)
    #table(align: left, 
        columns: 2, 
        [*UseCase*], [*Description*],
        [이름], [기사 요청하기 (Request Delivery Man)],
        [범위], [배달 대행 서비스], 
        [수준], [시스템 수준], 
        [주요 액터], [Delivery Service (배달 대행 서비스)], 
        [사전 조건], [가게로부터 배달 요청을 받은 상태여야 한다.], 
        [사후 조건], [기사에게 배달 요청에 대한 승인 여부를 전달받는다.], 
        [기본 흐름], [
            + 우선순위 결정 규칙에 따라 기사의 우선순위를 결정한다.
            + 우선순위가 높은 기사부터 요청을 보낸다.
        ], 
        [대체 흐름], [
            2a. 기사가 요청을 거절한 경우 다음 우선순위의 기사에게 요청을 보낸다.
        ],  
    )
    === UC6: 기사 배정하기 (Assign Delivery Man)
    #table(align: left, 
        columns: 2, 
        [*UseCase*], [*Description*],
        [이름], [기사 배정하기 (Assign Delivery Man)],
        [범위], [배달 대행 서비스], 
        [수준], [시스템 수준], 
        [주요 액터], [Delivery Service (배달 대행 서비스)], 
        [사전 조건], [요청을 승인한 기사가 존재하는 상태여야 한다.], 
        [사후 조건], [요청을 승인한 기사의 정보가 가게에 전달된다.], 
        [기본 흐름], [
            + 가게에게 요청을 승인한 기사의 정보를 전달한다.
        ], 
        [대체 흐름], [],  
    )
    == Conceptual Model
    #align(center, image("img/delivery_service_conceptual_model.svg", width: 70%)) 
]