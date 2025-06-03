Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2A229B12
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956303; cv=none; b=i0DgdP6w8oEaW5RoYGsL+kzhixYBwC0eDmb0CQ3ukSaJhKbDR3xVLXLJobuVYChRcPZ+NTssJOaAYKd+bko8tmNgYjhOoFTkhfR4fJIGKETQcpQbDUVlgGM6FVMcLkzGqFQJKm/cMEW6Ny/FBTn+la3PnEBhBpNaegAxDWJzKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956303; c=relaxed/simple;
	bh=DSxHBEJTE3+uuOMUX4IXmCl9C9IKgdtq7Yhg2vjoBWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrKj9XvZHH5IpiX5WesmZ77f4W+omLfAXSwS6uMAxwA732I6pT6TgbhC1fPP8919Qt0FEAGojwFqrRQe8RBqlVe/bIkczSmll1vIkBXJCbY+AoQw1mQ1+9qmWK37eXCWPFZ/YPywfKeJMWgXRGNaXZLhqB7eA6/em2sGsMugwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rufqe/D8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rufqe/D8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JFXO004254
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 13:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hkowjwQkIBoerXsoTVXb43GI
	N60uMuMxhmK0iRDbVQQ=; b=Rufqe/D8kes8A+oWpf1AyhIj2j2I3Ay5OjESE69n
	aNjJpAklteOXnWpFTb4qravFc2D9X4A8JTG+kvPtG4Vx3XYwWDDCNX3lskS90cVU
	nWa3tuQPkQIq6gMLFJUIMTIFYyK8+r3Oz/GoaTJtKx/K8+8Se2IKn9nvVXX/sc89
	Wx9Vt0Zr/Of7fB7JOg1rDHi9mYE6d2/YeJoQSQqE++R7lSfW58iUcjT52QBX8ZjK
	p47geWL1PLqV4T9pSSOizefyYhOIHeqHjDh2JOy3tCJNGMNRdNJRNsyKpOjhnZno
	kO1gPlrEuIGAzKEG7aIkBlOydGNo5+I4i2mAd3peXdNhyg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rtncj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:11:40 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-736f88d8e02so734724a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956299; x=1749561099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkowjwQkIBoerXsoTVXb43GIN60uMuMxhmK0iRDbVQQ=;
        b=ZAFwPP3IGxonTxLeggfbPXHHrALhUOWEX2pxBf6EkCBKofXL9BD48bnY4SFmTA7d2b
         kipWIqWViidMRgOcOM/Af0Fl1nBdB+2wejCckSd+XTlQD+ZUCbCbFKQpBwNsbClqs5Mj
         c16bQ8JH/ihJMrLNdwpZGIFTOPUsIPsjR64ALa9iqb2yht83GuwPjPkb5gcNNn4wi9p6
         3oBAUOg/QRwmgtBtvAGGqtaTalcxam6Tt2GIrxc6CGxYw5d5bte2UBkdlaNzvqXP0rgr
         B9eTQedmkmdfG/AdmbLNAFWKdqV/0FxTi8Bh1wc0cBAIMv74dtU8mpwbU8YZcSdyxQEH
         wSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8hkf8fSDXOdNG/o9F3Dy3h7DX4+Zok12BqS3H/gmVtKofHyGT6qe5GWshcYVWnsvc/oxbT81NonnLCPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9vvVyPsxsH5suHOm+sDkQSQ3u5f0nVVkEExymxusoE+wJgLB
	fgq+cwkUigAdSqLCOl0+JEPvqK+T9ipbskxgAavjQL9LwcQo2KkvYx2hrQxMdPs8dS7mxXuYSSU
	NjxhxCAYjEmI4G+A2wjR9oW6EhBZ/q2MwpF7gvwDX7Bj+nFxeG1JmzpE8bGlQQgibalE=
X-Gm-Gg: ASbGnctbW2CD+rIygAWMQtyhZc+CKN7F/wIL6oQtFA6YzUuKjKfEAJEaFdJKq5++i+m
	3ZW/RLQLuaVZ8OYWnj+wpC+ZZhBAV9O2BuLX09OnKyMCtiqZfGjePOJWTjHju7hovbjDSYrIoIO
	2R4/iffzF6GEoP3UOAkHC/olOdNkwnoAKJAZbi71zNYC24L7jMZd9Ckj8OW0h3DmbXGkHCs9J64
	0QCb3t1mEWFsiSoxOmPbsAfQXm63zG2Xv/K6GaUUU1s0BL2pOonqNEi+I+ud/cW/Oylf9Q2HBng
	8gynRHqzQgvR0WI9+7SWPs1TdN/ud+fHL7UBo9dEsAlaStlqs3BwzZ2zW3pfabm90r2JRcb2hes
	=
X-Received: by 2002:a05:6830:3c8c:b0:72b:8297:e988 with SMTP id 46e09a7af769-736ecf38198mr9861958a34.25.1748956299373;
        Tue, 03 Jun 2025 06:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrv6xy9Z9gKos6U7bwZdGI8uQ9F+7hgkYBjMqaT3/DoXyQAJAhoI0Awytxg6+zEQ8YdBqDPw==
X-Received: by 2002:a05:6830:3c8c:b0:72b:8297:e988 with SMTP id 46e09a7af769-736ecf38198mr9861924a34.25.1748956298927;
        Tue, 03 Jun 2025 06:11:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f91sm1920796e87.157.2025.06.03.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:11:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 16:11:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org,
        manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com,
        krzk+dt@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v1 2/4] dt-bindings: PCI: qcom,pcie-sa8775p: document
 link_down reset
Message-ID: <drr7cngryldptgzbmac7l2xpryugbrnydke3alq5da2mfvmgm5@nwjsqkef7ypc>
References: <20250529035416.4159963-1-quic_ziyuzhan@quicinc.com>
 <20250529035416.4159963-3-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529035416.4159963-3-quic_ziyuzhan@quicinc.com>
X-Proofpoint-ORIG-GUID: AJKpuaZ4896xUFRfIb03b1zHKGr3-ir0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDExNCBTYWx0ZWRfXwudN7+QnbGee
 E4F3O22QkTQw3FqLzFc37E52IxrYky4MiVioxsRrc882BwWIgp3pDdUC3N4k+15a2lherOpbXnG
 r21UrUiayrqd1lx2P/xxI+ZVseQTmYAOsl46ttQxnppkesKNxAKl+8luKsriBM7C6w14/dcF4eh
 7yUDVO+GPy32+nedHQ1YQqVpSW10GKnb3eapRIhMG1m94+qslPrRlBpY83r0qnP2GxaN4Opp+mA
 8DU6MX0NwdH2vPIphVoOqfbTy89iIeCU1654GmiZX6I23zFH1/iZq/jK+2/vq0S318Ug28g9OAZ
 QaUFGhSW6aId65gxwiAy+KWcUBkiqEqhZ/JXsc4PROqoN06h4NUl0L9vwC5HtPLWe2Q5rqniUeC
 J8Iqe4WrtRlbHY0W5E5Q0/IyuBQxz7O2TuePefK5M3qM/Tn7D8Pz5c870dNmrWdY+XNRUfe3
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683ef48c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=MMspel2jwrA65jTUX34A:9
 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AJKpuaZ4896xUFRfIb03b1zHKGr3-ir0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030114

On Thu, May 29, 2025 at 11:54:14AM +0800, Ziyue Zhang wrote:
> Each PCIe controller on sa8775p supports 'link_down'reset on hardware,
> document it.

I don't think it's possible to "support" reset in hardware. Either it
exists and is routed, or it is not.

> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml  | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> index e3fa232da2ca..805258cbcf2f 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> @@ -61,11 +61,14 @@ properties:
>        - const: global
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

Shouldn't we just update this to maxItems:2 / minItems:2 and drop
minItems:1 from the next clause?

>  
>    reset-names:
> +    minItems: 1
>      items:
> -      - const: pci
> +      - const: pci # PCIe core reset
> +      - const: link_down # PCIe link down reset
>  
>  required:
>    - interconnects
> @@ -161,8 +164,10 @@ examples:
>  
>              power-domains = <&gcc PCIE_0_GDSC>;
>  
> -            resets = <&gcc GCC_PCIE_0_BCR>;
> -            reset-names = "pci";
> +            resets = <&gcc GCC_PCIE_0_BCR>,
> +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> +            reset-names = "pci",
> +                          "link_down";
>  
>              perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>              wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
