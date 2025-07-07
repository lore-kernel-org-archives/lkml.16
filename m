Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6628C2DF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880411; cv=none; b=QW4TWRQug/KUdiJnueTntmd8Olyw0019Y2iSkoXxreRiThLu1FEDJ9B5BkrzmrP6iq4X+Yd9LhZnMAF/kGzj2YTjoi7VWMCBzyvJ4KZUolrcMyVESbuLl8twLZR8GBjFEAK0uedowUeEcVYuQSutZhH4peoZUwvuvwXidjjAhk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880411; c=relaxed/simple;
	bh=lpUWLfPohvcG8KFzHIdM95cA9JBZMwDUXeS0oz5m354=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9T+i5SLXuHN8GiEjvpUMhP1vP51N+cHPFdE/Dlb9IYoRIWpnlPIm2E/e3pMJaDMxGQrJ+5Jaupr/b/jUaGA9g4NcDHQp4PT+/eG93no5BWOXst7T5GFIpwEH3ifyCZOv21p40k5KikDjnU7C0VUkcGNhFF1DQW0sL+dn4/ueXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1Vghicb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1Vghicb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56791STo017546
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 09:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ACLvMD04WA0YF7cGMMn3ZsR
	RQXO56tBP9XFn+27tp8=; b=Q1VghicbjP9qRm0DXRuA7PXr87THvDT/nF4u+p4M
	/UPJTIYR+NCX3qzLuSM/w8rb7XkwCeEf7O01y0tTcQ7Ee9vBKzk8zM+EDVrbiAd9
	GFEvfpiGuZ1+fdnjqcxFaQAQpktA1DjZS2TGvpzom4ucRgW7XWv+/xeTOFKdvN5X
	RPDU6c/sQ18cp7/xB6R22oEH96Px1gTbaSdQbTov/CX+HQnY8i56nu0G64W7yeMi
	eZTRvEUh5F/O7/QFT8SvH3inuEMgufwv8W4r1+dK5UJkva7xwGTZYPzays2Mi+a8
	WgKAk6rNNGl+4e9VwaaLnlcEIDVmrKwF7ieF9jM8qNDfxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97bg86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 09:26:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so496553585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880408; x=1752485208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ACLvMD04WA0YF7cGMMn3ZsRRQXO56tBP9XFn+27tp8=;
        b=tZE94SERhtjyCm7nl5DydXugfygmhTg/bOn60aCs1p95EjLJO2z3lxV+17PO+VQgDM
         3Zt+2G6qMv1CAverCBknqBQV/ovtHn9Jku1NS19Ap6PIdg2YzfeUxWJfYUHleZm+CIit
         zbxHDfKvQU5eS04FJuBTUzMYSfR5H1khyfNsKC8u+HEe1xLPdIL5ChbGyU1TiHKFjLiL
         tWDIeeA7voykVqq178Clv5QmN6DDc89/4ijMSl31k7lLho+2dHA0ZNbT+dho6+4hydvy
         BVR/bZ/ZJ4slXf+Cv0VXBrHwxckXGRGZXtdn/lOr6ndyNQrI9oU4JjMQxw4l0Rzia9X4
         TwnA==
X-Forwarded-Encrypted: i=1; AJvYcCUZaLjxFu5AkNy5h4sMx88Y4yiNR97yFQH/CdG0dBT9NOuvFl3wRv3G/gxu9+jaLWzVVlMKyL7NELXAcwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXfrst1onf6GsMhDl6J4JiUtXK0Jf4NRlNdsqQhlKTGl+fpV9
	01S5ZV2u/nvqqV5DvzNp6JSdv6ChYk8lPmg2FSXSJ4PQYIW8QtiZrcDAe3uMlR+W5VisVQxpr5X
	pOFUzWo3kEGUy245LlH+Hn+CWSMYLEcVuZuyTXCWIJGFnBOJgpXuGjnIu1yG1kOL2eY4=
X-Gm-Gg: ASbGncte1EYvR3q8XkRA7oI4sURjJv3bu/QdSJ+JOhz6+M5FEWOfDnYm43tNxDiTn6E
	m8yEtM4yNGq/1azEKk5aKAYSpazUOBxclm2iTdNSLs5K7PMwMYbztGeLcjMQzS6QrOLoYqE3Cep
	e155M+6Zq/V2oxr7UohWbeiX7OebYWWCWMPRRIXbSXrnD8F1KGfuEdS4d+YXM54Pz+RsGol2eNG
	ZcqEZUPkSAtw8gdfRaRcUefP6JqO1lAy4yTWj7ygmjCe/dIS8PNTyfznlCMLj3tvNN3DYH5UUlP
	oVtg5dQEhQ+TaDvKbmfPR+meqk9QMpZmwU1sLHnmwSkYtAkZk0oSpOg=
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr1653790485a.23.1751880407855;
        Mon, 07 Jul 2025 02:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0cECjx1Uf+mlAgg/C5n1fBtG/LFQsvoOn0p8/ucLcry1XeXAF3J+XDAJNT9x0GNMUSikEyQ==
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr1653787185a.23.1751880407184;
        Mon, 07 Jul 2025 02:26:47 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8e6sm108891495e9.6.2025.07.07.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:26:46 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:26:45 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuS1X+RfX38krpf@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuOMrjfQBNYAjmF@trex>
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686b92d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=DKyoZqHPbrAdFQiOrREA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NCBTYWx0ZWRfX6Ny8H8Qb5cps
 QYp7OufkErtXI0mKw08oKhATZ/YpGM9u0y6LrBFsQ0ps2eSq2mhviAiqegryLz5B76p0Z7b9fHl
 rmWTuD/3sHBCwdtOZhu95cw46eVb5Gsm4+IGfc0PZLy1FLQbs6SiXq4UzNZxH1DESbbzQRJ7b4B
 U8L6NJAkxcgKimb+TMdQ111DKIZnn7pe3o99+64obCKlUAowr1CKld7GR0HpfUifKce0VOf06aL
 aqOMGwsalaM2Cki2O0s9YscCcB/EPms6fo+qDfsDNQG/dZOmBOjbppVX5R6iHopMBgDF2c2CKiq
 O6TJJZYKvNGV5HTv4b+r6e55jf8DarMVs84rJALIVlz/T5lbq4rL2BIWNpvHvP3Wb0/6snih/Ph
 FBsx18vK6fjToG7RrZoEBJ/KYgZdMgJLwTOjZNgQvUufN1OS+CaPWt3EH8EPrvHagnAxKc6t
X-Proofpoint-GUID: k80bqXz3Nd7wUSvRURV291wHjXEWQHxd
X-Proofpoint-ORIG-GUID: k80bqXz3Nd7wUSvRURV291wHjXEWQHxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070054

On 07/07/25 11:06:58, Jorge Ramirez wrote:
> On 27/06/25 17:36:43, Vikash Garodia wrote:
> > 
> > On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > > Add a schema for the venus video encoder/decoder on the qcm2290.
> > > 
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> > >  1 file changed, 127 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > new file mode 100644
> > > index 000000000000..a9f89b545334
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > @@ -0,0 +1,127 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > > +
> > > +maintainers:
> > > +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> > > +
> > > +description:
> > > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > > +  on Qualcomm platforms
> > > +
> > > +allOf:
> > > +  - $ref: qcom,venus-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qcm2290-venus
> > > +
> > > +  power-domains:
> > > +    maxItems: 3
> > > +
> > > +  power-domain-names:
> > > +    items:
> > > +      - const: venus
> > > +      - const: vcodec0
> > > +      - const: cx
> > > +
> > > +  clocks:
> > > +    maxItems: 6
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: iface
> > > +      - const: bus
> > > +      - const: throttle
> > > +      - const: vcodec0_core
> > > +      - const: vcodec0_bus
> > > +
> > > +  iommus:
> > > +    minItems: 1
> > > +    maxItems: 5
> > 2 should be good to support non secure usecases. 5 not needed.
> 
> ok

isnt it better to just leave 5 here - thinking of the future support for
secure buffers - and just update the dts?

> 
> > > +
> > > +  interconnects:
> > > +    maxItems: 2
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: video-mem
> > > +      - const: cpu-cfg
> > > +
> > > +  operating-points-v2: true
> > > +  opp-table:
> > > +    type: object
> > > +
> > > +required:
> > > +  - compatible
> > > +  - power-domain-names
> > > +  - iommus
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > > +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> > > +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> > > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > > +
> > > +    venus: video-codec@5a00000 {
> > > +        compatible = "qcom,qcm2290-venus";
> > > +        reg = <0x5a00000 0xf0000>;
> > > +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +        power-domains = <&gcc GCC_VENUS_GDSC>,
> > > +                        <&gcc GCC_VCODEC0_GDSC>,
> > > +                        <&rpmpd QCM2290_VDDCX>;
> > > +        power-domain-names = "venus",
> > > +                             "vcodec0",
> > > +                             "cx";
> > > +        operating-points-v2 = <&venus_opp_table>;
> > > +
> > > +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > > +                 <&gcc GCC_VIDEO_AHB_CLK>,
> > > +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > > +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > > +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > > +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> > > +        clock-names = "core",
> > > +                       "iface",
> > > +                       "bus",
> > > +                       "throttle",
> > > +                       "vcodec0_core",
> > > +                       "vcodec0_bus";
> > > +
> > > +        memory-region = <&pil_video_mem>;
> > > +        iommus = <&apps_smmu 0x860 0x0>,
> > > +                 <&apps_smmu 0x880 0x0>,
> > > +                 <&apps_smmu 0x861 0x04>,
> > > +                 <&apps_smmu 0x863 0x0>,
> > > +                 <&apps_smmu 0x804 0xE0>;
> > update this accordingly.
> > > +
> > > +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > > +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > > +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > > +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > > +        interconnect-names = "video-mem",
> > > +                             "cpu-cfg";
> > > +
> > > +        venus_opp_table: opp-table {
> > > +            compatible = "operating-points-v2";
> > > +
> > > +            opp-133000000 {
> > > +                opp-hz = /bits/ 64 <133000000>;
> > > +                required-opps = <&rpmpd_opp_low_svs>;
> > > +            };
> > This value is incorrect, fix it to 133330000.
> > > +            opp-240000000 {
> > > +                opp-hz = /bits/ 64 <240000000>;
> > > +                required-opps = <&rpmpd_opp_svs>;
> > Do you see other corners in the reference catalog as well, not just the
> > downstream code ? OR did you limit this as the usecase do not demand higher corner ?
> 
> there was an internal AR50_LITE presentation where only these two
> claimed to be supported - all of the others were not. so I went for the
> most restrictive option (ie, this one).
> 
> how do you want me to proceed then? should I just use IPCAT, or downstream?
> 
> 
> > 
> > Regards,
> > Vikash
> > > +            };
> > > +        };
> > > +    };
