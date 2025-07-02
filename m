Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA423C4F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495353; cv=none; b=P2As6p4P4FnS43EvX0AXLS/hoz7rFYYiGr+js8Xdk45ej4PFFXBRI/l3tRQQCLrR67P2tGBI4Qy9JdE6PdIbhvXygs0rlsG0HB01pTbaww8axUlyswksUjbWV0SbkQDxjqtrwJhDVZw9utdIzCaSH5+6epYBVdLcKT5RqRH8q+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495353; c=relaxed/simple;
	bh=up5bIfuRe1fh3Im2a2gPebVavaYz7/DHfHtuntIyrf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NszH9sJnATfSZHFR+VkylP50b0o6FeHI1irsIvfYvd2+dtW3dvnhjomcQhZAuEaMTNhHMmIlaLyuNs5NxSGMwe+jLKr0jhpWQQSfH/ldmsU8NX//hfu8rHzrEqNPo0KFvqxxbDc3JYnhuW4Xq0ESG5HEZRud2djcK0ZO3Zt/lhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz3TSuHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz3TSuHy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Dcdl3028664
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 22:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BgDDI86k+9nrqehhROmR+AQC
	x3airBLaLzyH+/CSltk=; b=Wz3TSuHy8B9lSuyMjnWMsvL8ffmgZOBUjpAb9o+B
	WxvSXCHUXubtjRRdR8Hwf1xFjBDhL4n+XhdVygBtclHUPRU6vCW1Utc2QjFVGEyv
	EDWTZd4a2i42N8SKSwIBMNFqf4tlzdvsoinqos4/7/6Wp+G02mGS/BKtZYEqptXc
	fFpaqvJcU5pUSWI9Rh30GRqNYsEvErvQ6IzXWIVtx9HZc6vuEIaMlZXtABs6+a35
	g5vz8OPC3uJcuGso2lHWIfYtSiP3I3QKKcg1l4bKfsILU2ZJCk6G2cvkzdKSXcTh
	3177S7rczzTCCKpAyZPFKaeOAxn4r5A4zXgNOBqt4F0Agg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvxara-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:29:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d45e0dbee2so709249585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495349; x=1752100149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgDDI86k+9nrqehhROmR+AQCx3airBLaLzyH+/CSltk=;
        b=bMHeWT2ohvGbxDAvvnFyj//OJxLEKKoJg67hJE9+1qYjNj9GDTsFJKgsvUx+3AG/xJ
         KJQG61LRqwxdSQGwp+L4Xx85kHKvJHEDNI2xVpEfIeANM3VHcU2HO3zpDdUYs/1tvx2a
         HXBWksPyZRvHUrQ9VBzv8LhvXF8GzUq8f2l8la5mDjb/H809lu63h9xnHIrGWh/WSL1H
         tuM79G/KkJCpTdkGCZp0C8Ng9BKN2JI4OrlI1orACPF0UBShcGViXnDJ6/h6uDekZ/sB
         uqZM+yalHl1LBiyPqr1NHc39c5AlfKi8OcwcTOs/5EIul6CIOKSkhGvIMrdt52oNggod
         6gjw==
X-Forwarded-Encrypted: i=1; AJvYcCUfb833OPwMmJGMFUFXu3ib+BSbgCf1VCri7ZnwKw4vqgMHFog35tFa1Ls7zwi7lQVEQlNksjq2YT0H/3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAb4jUZkNf6kEj18Q6nQO5NYWJJudRkdP8JDU9B01zhCIE5DH2
	c/lm0X92zpUvmHskCvOz4UyKbA+aBKrb256ZfyEOyI2JSDAsRGSNYgH7Sc7r8TmdbeVSDxVsLK8
	+aCOKofXwaY5RPeKgr2qtVCW292ARP/KutKJWgfwoyECNXQpmFAQRU+4Z63dzqxiCF7g=
X-Gm-Gg: ASbGnctLVDnjvtnOG9+biEwLSEpVfoa2hksbip06eFR9tbg2MqFYP2BCl0EMQHLwFwm
	lswD8lenUva+Y9AwaeveQxdxLd+CEpRen6GgbMx9x5Iqu395x1TkBXNELuVeme3y9xpKnqlmJ0P
	vbv8+1hvufXcOXTv3KHm9IHuWZLPayD/ZDgLGIHDNXapu257Oghl+Qn/eoZfxG7Brl+FzuWPsUK
	3/N0lbCjVD+Vfs3+vQnqJ+srKcTB9WUuWilnIub1h9INRX3CvspmS7UdqPu4oBKSV6eR6VKiYiH
	9Tl2ETrocU2JCdw3FvnqWUcksmVxclwVsoHmnauPkVTssPlpvE/bXNlQCaJFYLLVnzK2hY8upIQ
	2m/AIXpDe9Dn2i1RfywFvWp7Wr0pQ9UVOF68=
X-Received: by 2002:a05:620a:46a6:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5c4717717mr613056285a.28.1751495349303;
        Wed, 02 Jul 2025 15:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrSVTOJQ9y1rva3UBmjLIEBviVC9kwZsRJcNapTvyl3wOwWuQm4n9kgbG/8VBXUhQbv5kwMQ==
X-Received: by 2002:a05:620a:46a6:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5c4717717mr613052785a.28.1751495348903;
        Wed, 02 Jul 2025 15:29:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2eff7dsm2261580e87.246.2025.07.02.15.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:29:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:29:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Message-ID: <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
X-Proofpoint-GUID: U0nmkGvWQ0zI_EBmmlzvYrVaM4igG7Kf
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6865b2b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_TNEKbHo1ymzoaDRxC8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: U0nmkGvWQ0zI_EBmmlzvYrVaM4igG7Kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfX3qzMQ1oSV23o
 NDVa/8kRnM/aVzJx3E93axX5bxRq8PwDOnvhTIqZBMM4HcI5wCC2dq0MjtGx1oPQkkc0+JM3PcZ
 6oluOC0Rod07qFi+Af3BcPsXS7W+fVeUHJ9byZyJ9ECUc3BQalrW7x/Wju3s82G65pIjDhEqMux
 urdNsztTCr7TMmnTvW8XnyvBEDmaebwAvQLpLlPXjfHPbZG1L/xPA2LQu2xzYUeSyMnO+8xP9od
 v6H8ETVcKjAhcL6httuwZOQ7cvPxDtn15Yqke6cWEO74QdGwlku0nfYIswekOcfCWH0zSO8QFwG
 FxUXI1ebb68OP+Rbm7R4X1hYOtGuuQZToIc0rlBc0KVO1I7OSVEaeNMtJ3QvbAbX5ZO5sXAKLqd
 lq9Q193XujdXg0UU5jsAjPOFEXoHo22FI2MMt/xZHZiMquBX5WXN3N+Ce8y4zL/o1Y9Fk9Zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020186

On Wed, Jul 02, 2025 at 08:43:13PM +0530, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 5f7738d6835c4ba999402e163fc85a07e3a47a5a..b490caaf843243a7a96395fdd2b99972a45679f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -23,13 +23,17 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sc7180-videocc
> -      - qcom,sc7280-videocc
> -      - qcom,sdm845-videocc
> -      - qcom,sm6350-videocc
> -      - qcom,sm8150-videocc
> -      - qcom,sm8250-videocc
> +    oneOf:
> +      - enum:
> +          - qcom,sc7180-videocc
> +          - qcom,sc7280-videocc
> +          - qcom,sdm845-videocc
> +          - qcom,sm6350-videocc
> +          - qcom,sm8150-videocc
> +          - qcom,sm8250-videocc
> +      - items:
> +          - const: qcom,sc8180x-videocc
> +          - const: qcom,sm8150-videocc
>  
>    clocks:
>      minItems: 1
> @@ -111,6 +115,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,sc8180x-videocc

Is there a need for this? Isn't it already covered by the SM8150 entry?

>              - qcom,sm8150-videocc
>      then:
>        properties:
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
