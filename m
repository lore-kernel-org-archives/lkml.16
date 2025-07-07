Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17159218E99
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879232; cv=none; b=jn32wprhe9dgOAjl46J+q5dvD2zwqMp1I9TPijhkC8Y3azfJ3aiivtUi4mySHNVECM/H9j1KauSBGaovVLV4IMJIa/VBV1Eb+EUzLoHQ8bIvGZyDw53jxWu0gt8+kCyHFdVHPl3u7/n6t1XgpniavI4g+Z2ISjRNE/2rryqoLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879232; c=relaxed/simple;
	bh=u/pepq4BlOtHJye8dzjJX8y8BCLsgtulB2ZBsmpIUPE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8HPzBaXhvmeKcQbXYxOmCat0gbU2TJhEz3tEPvSj6rhU7AijeHIdjPGIiARl8U+qrdRz0TJikBOFpiTy1gllmCQjt5XCc4yfGEd7jU2xoi6qdI1U7EZ+n8ITKs63IUfrz4raDwoe+C/4ModyKCw3vWUnqWBrWl941Iy9rYg6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0EGxl8O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0EGxl8O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NR97g023446
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 09:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2M3NRLxqF+ccW20K1HLg5RAl
	uxCezcoEWGabcXTrS4Y=; b=W0EGxl8OlDx/66dFOGPcYOTy+HP863eRChCHK88s
	lqA/lBYvF7tGSO8drLynCVWan8+9IMv6BAFiZPNNyhXFmDWw5tC5tPhGqF1eMAtJ
	kCEkc7senHsc3mn0ccnwgS4ndEPkz/1/OHA7mcGItMHzo1vEtT/b8A1q+cXtk4P5
	LbyKqKFR2pCJDgHtw6GjcAmX4IA9mB+UYk6oxbkj6WVUggPi7nOqEnFdqOsrqmd/
	5npKvpCGnYkbrS+Hkbh4ZUwKI4gEQPT1S92tP+mCXid6mwjJLRzI/pqE/yuPZ7Hq
	Y/OL1h5rSPJtcaBmdUZJUUIDbv2uGzTPyjN1v9uF6TYC4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqm01q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 09:07:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso399307485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879228; x=1752484028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M3NRLxqF+ccW20K1HLg5RAluxCezcoEWGabcXTrS4Y=;
        b=svyXnsF2i1kWRP08iBvxDZNHYTNH098gGUTLXvvXaaBin+FXiQaXro7QWfw0ByMWL3
         rrxPfQM14ZJKZlY8EaF+FMAm5sJIcVyhJ1W8XFU82N1CKD0d37ugHdIYGWLkaOoehOfF
         7MCAzIfT456Ws5+4481/O6dw6RIsK42sEUpdWmIBDphlmjkQdZmti7LXKAvjdlXO31sX
         BXa4tCLdMl+V4hMMWZlSrNhxWYD2IbbF2KD2vxfA2ieBcUApK00ad6B7eAgcWm/4DMQ8
         f/WqF9lJtf85iJ0SW9Qqyh2L2waF87oXNa1ALeQs1VDngpw0O929wCxV69uH6q0+wAMV
         Teyg==
X-Forwarded-Encrypted: i=1; AJvYcCVu3nqPO7ubqylsOjjOx9EQTwcp2OzQBcCdH52bGLjS3YAQvcKb+e1i7irYIlBULDrSdOGAEzB2V42N1Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVBOeR/ICADcCJviewpAHXTAM1GFEIeGrZlY/60VebjE1dQqY
	cc14MdiXQs6VQMSuS74ULDIevjf+yc5AdUXVsEJHT1TdMntwE6lnH1miK6CK6nlvbTUt88XYqk2
	JBCma3Aq2xXClJH52VPSRntZFkbipz6vy2LOJgtBv2fpVgo5GSPRTyn5qZViXbGta46Y=
X-Gm-Gg: ASbGnct0e9mbpgn3JrBHQWYZdfwI//+nV7NqKl/9o00+v9/ApGBHkmFu10yNYky0noh
	oS+1CTQHfxDCJGEfAYFZD7nHnS+08QC+syraFqJJm+ZgQnUlWasEg5Dmo2G/bnBS1IzYtTm8uLd
	yXnscTnYyO1AWLUll9gTq332hCF99q2/Gm1tUaAG/3pINc6rKbiTsTjdGOFm2FLDUM08XTKDy89
	ZXIZIxGvFqNrZrzsjEvNJMKU1ZrX5CG5xgMt49Qvn7NiAa3Tu/0pusyxYXm9NcNv8ZXUCKIjU5/
	2BQWJJUpHqDQXuaRo4+Yf/UPoad7Jux8W6/z97wmd5Bs2c7w2snmn+c=
X-Received: by 2002:a05:620a:2949:b0:7d5:c317:f656 with SMTP id af79cd13be357-7d5efcbee2emr958580485a.18.1751879227865;
        Mon, 07 Jul 2025 02:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6aD5tvb/dCyF6gQiMcQ+/KS1dIVJbshrVTbBQFRpZDKpCPBqDRVXm63NJT/XXUHJchE6ljQ==
X-Received: by 2002:a05:620a:2949:b0:7d5:c317:f656 with SMTP id af79cd13be357-7d5efcbee2emr958575985a.18.1751879227344;
        Mon, 07 Jul 2025 02:07:07 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm9696139f8f.98.2025.07.07.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:07:06 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:06:58 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuOMrjfQBNYAjmF@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686b8e3c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=JD67tWt7rTSO11IQpAQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9RnnNpyFmGWrD2Yuj6MYY4iEn6aZSluU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfXxNBFVRwLWHbP
 LlYXXbpD6/g0gz3dPqVQPF0W875rQlZ6Ppm5M2/M2D73PMV8yuc7w0wuj7+JX41+T8tUtcRnjMI
 e0RXZJVibmZfIC5GIH/kKT7p0qV75bAm1kB3ljSsoPOIKi1SFdGgAh9H3HRpNCEXD5H2H/4pb3S
 ZOSo4xJzcNMqAxJ1Lv0t3Qn29+oclO+x5gIGpws7mb71P1AVNP0PnIfyXHCl6Uq6/Q9Nv8jqH8X
 RnecrGK9xhOCrw2ys0kePBGnV+gI9LknEtAgbqKmvFgYXcgB/a6QEKgnJ84QbdERGACr3IskhaE
 3aPQyat6voMeMFfghyyQrO0yaXP5qmPvT7QM6usggY1p/iXPj6ZgkXQ4rlkS4vwf0QSquOWsBag
 bUV5D/545yN34az8eI9UzCnKDer6M+XrpQZdIu5KOMQtsGrCv8qEeiPeKo2vXzt7woACNsrw
X-Proofpoint-GUID: 9RnnNpyFmGWrD2Yuj6MYY4iEn6aZSluU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070052

On 27/06/25 17:36:43, Vikash Garodia wrote:
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > new file mode 100644
> > index 000000000000..a9f89b545334
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> > +
> > +description:
> > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > +  on Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qcm2290-venus
> > +
> > +  power-domains:
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: venus
> > +      - const: vcodec0
> > +      - const: cx
> > +
> > +  clocks:
> > +    maxItems: 6
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core
> > +      - const: iface
> > +      - const: bus
> > +      - const: throttle
> > +      - const: vcodec0_core
> > +      - const: vcodec0_bus
> > +
> > +  iommus:
> > +    minItems: 1
> > +    maxItems: 5
> 2 should be good to support non secure usecases. 5 not needed.

ok

> > +
> > +  interconnects:
> > +    maxItems: 2
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: video-mem
> > +      - const: cpu-cfg
> > +
> > +  operating-points-v2: true
> > +  opp-table:
> > +    type: object
> > +
> > +required:
> > +  - compatible
> > +  - power-domain-names
> > +  - iommus
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> > +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    venus: video-codec@5a00000 {
> > +        compatible = "qcom,qcm2290-venus";
> > +        reg = <0x5a00000 0xf0000>;
> > +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        power-domains = <&gcc GCC_VENUS_GDSC>,
> > +                        <&gcc GCC_VCODEC0_GDSC>,
> > +                        <&rpmpd QCM2290_VDDCX>;
> > +        power-domain-names = "venus",
> > +                             "vcodec0",
> > +                             "cx";
> > +        operating-points-v2 = <&venus_opp_table>;
> > +
> > +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +                 <&gcc GCC_VIDEO_AHB_CLK>,
> > +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +        clock-names = "core",
> > +                       "iface",
> > +                       "bus",
> > +                       "throttle",
> > +                       "vcodec0_core",
> > +                       "vcodec0_bus";
> > +
> > +        memory-region = <&pil_video_mem>;
> > +        iommus = <&apps_smmu 0x860 0x0>,
> > +                 <&apps_smmu 0x880 0x0>,
> > +                 <&apps_smmu 0x861 0x04>,
> > +                 <&apps_smmu 0x863 0x0>,
> > +                 <&apps_smmu 0x804 0xE0>;
> update this accordingly.
> > +
> > +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +        interconnect-names = "video-mem",
> > +                             "cpu-cfg";
> > +
> > +        venus_opp_table: opp-table {
> > +            compatible = "operating-points-v2";
> > +
> > +            opp-133000000 {
> > +                opp-hz = /bits/ 64 <133000000>;
> > +                required-opps = <&rpmpd_opp_low_svs>;
> > +            };
> This value is incorrect, fix it to 133330000.
> > +            opp-240000000 {
> > +                opp-hz = /bits/ 64 <240000000>;
> > +                required-opps = <&rpmpd_opp_svs>;
> Do you see other corners in the reference catalog as well, not just the
> downstream code ? OR did you limit this as the usecase do not demand higher corner ?

there was an internal AR50_LITE presentation where only these two
claimed to be supported - all of the others were not. so I went for the
most restrictive option (ie, this one).

how do you want me to proceed then? should I just use IPCAT, or downstream?


> 
> Regards,
> Vikash
> > +            };
> > +        };
> > +    };
