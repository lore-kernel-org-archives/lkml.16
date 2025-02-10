Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13C224FD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739155692; cv=none; b=TloZgtw92E1aGnF3DK9Dag0qSZ1KJn5fCZS82nLp76E/FkNAsBlql/JkpE+Fa0QN5/Sf/k4SV+HLe4OeYg2KbCesAb2Wx1eVdXCKBp04+PmAgxXNbdRSrmBOkc8OKEh2Uss1nKJoy1bMvPZbLW1yUkoedDjUPg9AFLo964wwY2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739155692; c=relaxed/simple;
	bh=QpajHgX3Drm0wz4qxg76dLloUu4uYleNAGLY/gKYQWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYmVgBPZxKRsj8ZbtioN94NHdFWR9cLD8rfPO4kKfWbyVVusbdUwnDZG5TMOo6I3b1ROuOHWqdT4vaWdJIIeFUnXlNJ/j+XWqfrqxroqP5JFdcKcTkrXgbcyZ/9bIrLrncAUH5v4uGxT71Iqcvf4K711QuUawDXU/b8g3Ne5em4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTYgjV/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTYgjV/6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519KIPeo009545
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvAj2LadsVPoilCdX1n1BrOSMKvUfEQ91Z4My6HVH0I=; b=OTYgjV/6zIJoKg5j
	SFN029qT/RZcYG11SV1CaV7aASTitdKHfrmjt7ft/Q9jZE9dk+1u8XvOtd246PRF
	E/429QbIsMVIHAjIUCAZUDWQ//ZMt1LQsXZcpMwFkL7+kWCgFyDwukDFbXzQs796
	277W6YwjB+am3PzhBrf6DncWyhbQNSXTmfr20oEiYNn5xLeHxa60AxVk4MjipWpK
	NUy6BhunvWcmJe98l1s8w0CDGiluO2owUeE878DYHGItCaCV/6DjR1BXjHTJ18lw
	pfMgJflHyb+Wk66Y+xcXJx47Jw06Wsoai3vI3TQKTYM2Qq4f7eJYo+fPXlT+zy/z
	SL81Sw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0f72vud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:48:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa562cc2a6so2465622a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 18:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739155689; x=1739760489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvAj2LadsVPoilCdX1n1BrOSMKvUfEQ91Z4My6HVH0I=;
        b=nmq6/uCLTJQAbOWR1C/YEUYKRRzywGc2A4pldDlUGd39f5w7eSsZNG3mwf94TxreWY
         LPkVL5ZR0tQ3u50wz4/cR7CChPsYl/NzHniSfFHqIsV9T8EI8Z/GcvZAYyIqp26+ZIHS
         nmtRlnzqtLH9PdwjjzF7U4PDbwuhLnD/yYXnyvp0ndFU2YeYt9ds+xOgWNifn0RdnEoJ
         z8E5KFF1JIRSHc1HXvo5te8Otyd+jfHRrJznNnxgQEFkMIVMhUXKimaZl0dzRvXnua2k
         Gobs3WSAnF3h7R2X2kDmImhSgJAP28wgj7awcbOhGpdXeIV6Nym+AkK4qlrBR4yJbrrD
         qGVg==
X-Forwarded-Encrypted: i=1; AJvYcCW0grBOTtQkKsganFuX5J1mCvhceaF3DgMCo7/ZG+7Ducu0W6sN9GGH+zOTUGCgcov6RlqUWjjKuNaPq/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsm1VmDmZyp3oUjgeXmX/rWui/k8qm0116ay2UA6RipRz0HHMW
	Dl/e3smdEmFHm3m4DHUplBZ3RMazsvSJKUz7gOgpqtKivyV23ovqa43yeZecaFx/s83xQwRv6Ln
	35jGjYdNLZLlylhJWlUT7vSZgxV4o+INMGADHXV7cP/x6UwVL05XQB8RVb8E4WGM=
X-Gm-Gg: ASbGncs+n0FsY7lUkeI6iojKUGC9SjdRailWQhpjBMuPScKdV99lbboX9GaNHuZ5a+N
	PPN1rZLe+/7oy61v6vY5N7Ld5qcVJ0n1wSusRRtYGTalbAXVP+3hBLFffbR/xSbagC48w4YYvMU
	t1Iz+UM63oiWX/PDbzkRnYBm/CdXFVo6kPfeQroZuKzx76Jx8tDnmhveCIonuBbihOkyA+U2ZNy
	cxD/lTo8mvsriBptdULvPIedfmDO3crMwjd5XfS8ULHJxWbqcMOJZTNzL5y0wVMmyI8ncDPzrwR
	kz9VPxYNOwbAQmXGZYsMQodGM1fgma0h56VOkX8pKFqMj0cOchq6kCfnEAgq1uY=
X-Received: by 2002:a17:90b:2309:b0:2ee:ead6:6213 with SMTP id 98e67ed59e1d1-2fa242766b0mr16642679a91.19.1739155688648;
        Sun, 09 Feb 2025 18:48:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1gOkEG5TO/EuKCqWcjwa94DVMY+rPKs8cM6aFLr0UABclV3X3OkJwg+1xxiCB5alZLClAMA==
X-Received: by 2002:a17:90b:2309:b0:2ee:ead6:6213 with SMTP id 98e67ed59e1d1-2fa242766b0mr16642640a91.19.1739155688120;
        Sun, 09 Feb 2025 18:48:08 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a753dbsm7516184a91.29.2025.02.09.18.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 18:48:07 -0800 (PST)
Message-ID: <383599d8-d124-4c5a-8253-43502702e748@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 10:47:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
        john@phrozen.org
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-1-453ea18d3271@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250209-qcom_ipq_ppe-v3-1-453ea18d3271@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GlVqfGENtbBX1LvLQFmxY0ouPuCwzhER
X-Proofpoint-ORIG-GUID: GlVqfGENtbBX1LvLQFmxY0ouPuCwzhER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100021



On 2/9/2025 10:29 PM, Luo Jie wrote:
> The PPE (packet process engine) hardware block is available in Qualcomm
> IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
> the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
> are used to connect with external PHY devices by PCS. It includes an L2
> switch function for bridging packets among the 6 ethernet ports and the
> CPU port. The CPU port enables packet transfer between the ethernet
> ports and the ARM cores in the SoC, using the ethernet DMA.
> 
> The PPE also includes packet processing offload capabilities for various
> networking functions such as route and bridge flows, VLANs, different
> tunnel protocols and VPN.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>   .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 406 +++++++++++++++++++++
>   1 file changed, 406 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> new file mode 100644
> index 000000000000..be6f9311eebb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> @@ -0,0 +1,406 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ipq9574-ppe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ packet process engine (PPE)
> +
> +maintainers:
> +  - Luo Jie <quic_luoj@quicinc.com>
> +  - Lei Wei <quic_leiwei@quicinc.com>
> +  - Suruchi Agarwal <quic_suruchia@quicinc.com>
> +  - Pavithra R <quic_pavir@quicinc.com>>
> +
> +description:
You have multiple paragrahs here.
description: -> description: |

Thanks,
Jie

> +  The Ethernet functionality in the PPE (Packet Process Engine) is comprised
> +  of three components, the switch core, port wrapper and Ethernet DMA.
> +
> +  The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and
> +  two FIFO interfaces. One of the two FIFO interfaces is used for Ethernet
> +  port to host CPU communication using Ethernet DMA. The other is used
> +  communicating to the EIP engine which is used for IPsec offload. On the
> +  IPQ9574, the PPE includes 6 GMAC/XGMACs that can be connected with external
> +  Ethernet PHY. Switch core also includes BM (Buffer Management), QM (Queue
> +  Management) and SCH (Scheduler) modules for supporting the packet processing.
> +
> +  The port wrapper provides connections from the 6 GMAC/XGMACS to UNIPHY (PCS)
> +  supporting various modes such as SGMII/QSGMII/PSGMII/USXGMII/10G-BASER. There
> +  are 3 UNIPHY (PCS) instances supported on the IPQ9574.
> +
> +  Ethernet DMA is used to transmit and receive packets between the six Ethernet
> +  ports and ARM host CPU.
> +
> +  The follow diagram shows the PPE hardware block along with its connectivity
> +  to the external hardware blocks such clock hardware blocks (CMNPLL, GCC,
> +  NSS clock controller) and ethernet PCS/PHY blocks. For depicting the PHY
> +  connectivity, one 4x1 Gbps PHY (QCA8075) and two 10 GBps PHYs are used as an
> +  example.
> +  - |
> +         +---------+
> +         |  48 MHZ |
> +         +----+----+
> +              |(clock)
> +              v
> +         +----+----+
> +  +------| CMN PLL |
> +  |      +----+----+
> +  |           |(clock)
> +  |           v
> +  |      +----+----+           +----+----+  (clock) +----+----+
> +  |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
> +  |  |   +----+----+           +----+----+          +----+----+
> +  |  |        |(clock & reset)      |(clock)
> +  |  |        v                     v
> +  |  |   +-----------------------------+----------+----------+---------+
> +  |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
> +  |  |   |       | SCH |               +----------+          +---------+
> +  |  |   |       +-----+                        |              |       |
> +  |  |   |  +------+   +------+               +-------------------+    |
> +  |  |   |  |  BM  |   |  QM  |  IPQ9574-PPE  |    L2/L3 Process  |    |
> +  |  |   |  +------+   +------+               +-------------------+    |
> +  |  |   |                                             |               |
> +  |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
> +  |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
> +  |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
> +  |  |   |     |         |         |         |         |         |     |
> +  |  |   +-----+---------+---------+---------+---------+---------+-----+
> +  |  |         |         |         |         |         |         |
> +  |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
> +  +--+---->|                PCS0                 | |  PCS1 | | PCS2  |
> +  |(clock) +---+---------+---------+---------+---+ +---+---+ +---+---+
> +  |            |         |         |         |         |         |
> +  |        +---+---------+---------+---------+---+ +---+---+ +---+---+
> +  +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
> +   (clock) +-------------------------------------+ +-------+ +-------+
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-ppe
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PPE core clock from NSS clock controller
> +      - description: PPE APB (Advanced Peripheral Bus) clock from NSS clock controller
> +      - description: PPE ingress process engine clock from NSS clock controller
> +      - description: PPE BM, QM and scheduler clock from NSS clock controller
> +
> +  clock-names:
> +    items:
> +      - const: ppe
> +      - const: apb
> +      - const: ipe
> +      - const: btq
> +
> +  resets:
> +    maxItems: 1
> +    description: PPE reset, which is necessary before configuring PPE hardware
> +
> +  interconnects:
> +    items:
> +      - description: Clock path leading to PPE switch core function
> +      - description: Clock path leading to PPE register access
> +      - description: Clock path leading to QoS generation
> +      - description: Clock path leading to timeout reference
> +      - description: Clock path leading to NSS NOC from memory NOC
> +      - description: Clock path leading to memory NOC from NSS NOC
> +      - description: Clock path leading to enhanced memory NOC from NSS NOC
> +
> +  interconnect-names:
> +    items:
> +      - const: ppe
> +      - const: ppe_cfg
> +      - const: qos_gen
> +      - const: timeout_ref
> +      - const: nssnoc_memnoc
> +      - const: memnoc_nssnoc
> +      - const: memnoc_nssnoc_1
> +
> +  ethernet-dma:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      EDMA (Ethernet DMA) is used to transmit packets between PPE and ARM
> +      host CPU. There are 32 TX descriptor rings, 32 TX completion rings,
> +      24 RX descriptor rings and 8 RX fill rings supported.
> +
> +    properties:
> +      clocks:
> +        items:
> +          - description: EDMA system clock from NSS Clock Controller
> +          - description: EDMA APB (Advanced Peripheral Bus) clock from
> +              NSS Clock Controller
> +
> +      clock-names:
> +        items:
> +          - const: sys
> +          - const: apb
> +
> +      resets:
> +        maxItems: 1
> +        description: EDMA reset from NSS clock controller
> +
> +      interrupts:
> +        minItems: 29
> +        maxItems: 57
> +
> +      interrupt-names:
> +        minItems: 29
> +        maxItems: 57
> +        items:
> +          pattern: '^(txcmpl_([0-9]|[1-2][0-9]|3[0-1])|rxdesc_([0-9]|1[0-9]|2[0-3])|misc)$'
> +        description:
> +          Interrupts "txcmpl_[0-31]" are the Ethernet DMA Tx completion ring interrupts.
> +          Interrupts "rxdesc_[0-23]" are the Ethernet DMA Rx Descriptor ring interrupts.
> +          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.
> +
> +    required:
> +      - clocks
> +      - clock-names
> +      - resets
> +      - interrupts
> +      - interrupt-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - interconnects
> +  - interconnect-names
> +  - ethernet-dma
> +
> +allOf:
> +  - $ref: ethernet-switch.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,ipq9574.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ethernet-switch@3a000000 {
> +        compatible = "qcom,ipq9574-ppe";
> +        reg = <0x3a000000 0xbef800>;
> +        clocks = <&nsscc 80>,
> +                 <&nsscc 79>,
> +                 <&nsscc 81>,
> +                 <&nsscc 78>;
> +        clock-names = "ppe",
> +                      "apb",
> +                      "ipe",
> +                      "btq";
> +        resets = <&nsscc 108>;
> +        interconnects = <&nsscc MASTER_NSSNOC_PPE &nsscc SLAVE_NSSNOC_PPE>,
> +                        <&nsscc MASTER_NSSNOC_PPE_CFG &nsscc SLAVE_NSSNOC_PPE_CFG>,
> +                        <&gcc MASTER_NSSNOC_QOSGEN_REF &gcc SLAVE_NSSNOC_QOSGEN_REF>,
> +                        <&gcc MASTER_NSSNOC_TIMEOUT_REF &gcc SLAVE_NSSNOC_TIMEOUT_REF>,
> +                        <&gcc MASTER_MEM_NOC_NSSNOC &gcc SLAVE_MEM_NOC_NSSNOC>,
> +                        <&gcc MASTER_NSSNOC_MEMNOC &gcc SLAVE_NSSNOC_MEMNOC>,
> +                        <&gcc MASTER_NSSNOC_MEM_NOC_1 &gcc SLAVE_NSSNOC_MEM_NOC_1>;
> +        interconnect-names = "ppe",
> +                             "ppe_cfg",
> +                             "qos_gen",
> +                             "timeout_ref",
> +                             "nssnoc_memnoc",
> +                             "memnoc_nssnoc",
> +                             "memnoc_nssnoc_1";
> +
> +        ethernet-dma {
> +            clocks = <&nsscc 77>,
> +                     <&nsscc 76>;
> +            clock-names = "sys",
> +                          "apb";
> +            resets = <&nsscc 0>;
> +            interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "txcmpl_8",
> +                              "txcmpl_9",
> +                              "txcmpl_10",
> +                              "txcmpl_11",
> +                              "txcmpl_12",
> +                              "txcmpl_13",
> +                              "txcmpl_14",
> +                              "txcmpl_15",
> +                              "txcmpl_16",
> +                              "txcmpl_17",
> +                              "txcmpl_18",
> +                              "txcmpl_19",
> +                              "txcmpl_20",
> +                              "txcmpl_21",
> +                              "txcmpl_22",
> +                              "txcmpl_23",
> +                              "txcmpl_24",
> +                              "txcmpl_25",
> +                              "txcmpl_26",
> +                              "txcmpl_27",
> +                              "txcmpl_28",
> +                              "txcmpl_29",
> +                              "txcmpl_30",
> +                              "txcmpl_31",
> +                              "rxdesc_20",
> +                              "rxdesc_21",
> +                              "rxdesc_22",
> +                              "rxdesc_23",
> +                              "misc";
> +        };
> +
> +        ethernet-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@1 {
> +                reg = <1>;
> +                phy-mode = "qsgmii";
> +                managed = "in-band-status";
> +                phy-handle = <&phy0>;
> +                pcs-handle = <&pcs0_mii0>;
> +                clocks = <&nsscc 33>,
> +                         <&nsscc 34>,
> +                         <&nsscc 37>;
> +                clock-names = "mac",
> +                              "rx",
> +                              "tx";
> +                resets = <&nsscc 29>,
> +                         <&nsscc 96>,
> +                         <&nsscc 97>;
> +                reset-names = "mac",
> +                              "rx",
> +                              "tx";
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +                phy-mode = "qsgmii";
> +                managed = "in-band-status";
> +                phy-handle = <&phy1>;
> +                pcs-handle = <&pcs0_mii1>;
> +                clocks = <&nsscc 40>,
> +                         <&nsscc 41>,
> +                         <&nsscc 44>;
> +                clock-names = "mac",
> +                              "rx",
> +                              "tx";
> +                resets = <&nsscc 30>,
> +                         <&nsscc 98>,
> +                         <&nsscc 99>;
> +                reset-names = "mac",
> +                              "rx",
> +                              "tx";
> +            };
> +
> +            port@3 {
> +                reg = <3>;
> +                phy-mode = "qsgmii";
> +                managed = "in-band-status";
> +                phy-handle = <&phy2>;
> +                pcs-handle = <&pcs0_mii2>;
> +                clocks = <&nsscc 47>,
> +                         <&nsscc 48>,
> +                         <&nsscc 51>;
> +                clock-names = "mac",
> +                              "rx",
> +                              "tx";
> +                resets = <&nsscc 31>,
> +                         <&nsscc 100>,
> +                         <&nsscc 101>;
> +                reset-names = "mac",
> +                              "rx",
> +                              "tx";
> +            };
> +
> +            port@4 {
> +                reg = <4>;
> +                phy-mode = "qsgmii";
> +                managed = "in-band-status";
> +                phy-handle = <&phy3>;
> +                pcs-handle = <&pcs0_mii3>;
> +                clocks = <&nsscc 54>,
> +                         <&nsscc 55>,
> +                         <&nsscc 58>;
> +                clock-names = "mac",
> +                              "rx",
> +                              "tx";
> +                resets = <&nsscc 32>,
> +                         <&nsscc 102>,
> +                         <&nsscc 103>;
> +                reset-names = "mac",
> +                              "rx",
> +                              "tx";
> +            };
> +
> +            port@5 {
> +                reg = <5>;
> +                phy-mode = "usxgmii";
> +                managed = "in-band-status";
> +                phy-handle = <&phy4>;
> +                pcs-handle = <&pcs1_mii0>;
> +                clocks = <&nsscc 61>,
> +                         <&nsscc 62>,
> +                         <&nsscc 65>;
> +                clock-names = "mac",
> +                              "rx",
> +                              "tx";
> +                resets = <&nsscc 33>,
> +                         <&nsscc 104>,
> +                         <&nsscc 105>;
> +                reset-names = "mac",
> +                              "rx",
> +                              "tx";
> +            };
> +
> +            port@6 {
> +                reg = <6>;
> +                phy-mode = "usxgmii";
> +                managed = "in-band-status";
> +                phy-handle = <&phy5>;
> +                pcs-handle = <&pcs2_mii0>;
> +                clocks = <&nsscc 68>,
> +                         <&nsscc 69>,
> +                         <&nsscc 72>;
> +                clock-names = "mac",
> +                              "rx",
> +                              "tx";
> +                resets = <&nsscc 34>,
> +                         <&nsscc 106>,
> +                         <&nsscc 107>;
> +                reset-names = "mac",
> +                              "rx",
> +                              "tx";
> +            };
> +        };
> +    };
> 

