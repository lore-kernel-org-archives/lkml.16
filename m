Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB24238C1A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831614; cv=none; b=fmnF8lqZQu0NqUCk2JdijMavOU5g3l/VhBtgFjot7QBpxFw3/SDmLJ8i2BH4bq/K8io0fIBXnxzsxkr5sf4tMlybZHNhotM5St+3pdcsK10wWYJ5cFXYzbNadVap4k4dZTCF7cM3o0XlXc2OowH7nFl6nQOqoLwtKpqaL8jV2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831614; c=relaxed/simple;
	bh=Xqeu1aJ9MItEqCaHvO4dZVDW/+gda4kJKzaek2qb/UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljHPNAe7lNWw5fBKyC9COYlWPPggwVtPFSbGzytcjEuxAXRCzZ9qY0pSq0HUl8sAEXBE2Kjnav3B4m29bsHGRR0CGGf3VmNPMKLQI2kuCXBeY5gjwVqxYAWGqQwmr9AxN3SHUrdvo6zNtWdfKso3H6ZmWfy+BzF5qqWb42fPp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFdTEngw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFdTEngw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9Xx3N032698
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDTfHXY5P0IUFKShT7L/9f91
	7VhrL5k2KweIDi5wmfs=; b=pFdTEngwWRO0CNSUUa02wThitfFtqjr336BgyA80
	CTQ9jIeELHzB2Vjs4HosseT/LLzKbQ8EXjrr+IU0cZepeiYK51O+IginuP7ffyU+
	jTWkC7yv1E27pZxpHYWNxy6Etoa1mnHoknH7m6VFIT2IzFkn4Itjqg5BekNhz6Jh
	bhwxiZCjpUZldll7dOmJMZ2bTs+pCb6s8vP+JY9Sdfbr3TPOxWD2kNNWDzrHg9ts
	QXrQd0ZL7B/SDWKRtcAGwRafT8aSa6LHK7iKijXh3z3UGz2q+c/eCmiy+jNwH8cB
	M9HPqXCeFJBQbxv7XQAgRwqP7RFZIAYz860dKnJpCrfVvA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21fe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:46:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c8a36dddso79136216d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831610; x=1748436410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDTfHXY5P0IUFKShT7L/9f917VhrL5k2KweIDi5wmfs=;
        b=rTAfdmCwuO0Mj6SvuHT7He4C0Tsvh/IX8NolMhMIYNDyHz03zKgG/TiyQvw56VHkQj
         YgQd91Q3kSBnsncNV7Lm5X+clOG5PIBFPcnegr/Am3DXVqHlEsOrmX6ym9YFeF1mixA/
         qo3Ye0ab+395pnGKAvUDPYz327xK1qVn9dG5K0GTjKl/V3UBc6y28//kWkMUZJYGJ7oP
         7a8tF9zIwabvbl8BTmiwlrv7ue0XNK1y4wYMIBqiytV4YEi8QrxXX75U/1osT4T1uto1
         klcCparjXV04hQ+yLDOE9Tpsk/L6U1AuhasicwT5m+OXC4eFopnM0+RgzPRukDSrgso+
         /jgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/GDUSDczXMBRH3HNimXD7xuDWR3/eIYkmU0b2MywjR1B5iLIqGvToLCRwYwWKeQ6lmn79MEC+WzXJaa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuLlepCygKxYQOKnYnIpQg6+NSLexdl0dLrHtcOX4ul7mSbAE
	EgVrkqcMfb9LJD/9hbOqMGHoV74x1AhZftLk9eNno/ejiOEJgkCMdodx2YeA2fFQrUcIYdQD/X/
	WeockdbK4H6I08kH07pbgEGpirvhcHIk5kt0+QnXBlTtozizFybN75VOBZdBRSVTc5Ng=
X-Gm-Gg: ASbGncsKZnCg8iEuky44q+HMH1HzqQy70R/Zhxecshmn8xvuyrsRInU3wZB1Kl5f7vg
	ZUc/P4eUHY1mBHDJh5iXbpwEA0TC+O6G5S0Fc3b9eWiCjaN9Bj0ZCPuijncFDV1Mq3FaLCE2Mfh
	fYDPwMTf1q5XNsSDNM/BOAt3xYfooLJq3Yk/lVNhlHsWkP3nIOVXxr+BFsBpP6QnvoBQkrAF/08
	xypaRtUAvfpgHxbZnrKzY9oxS9invl/MbsJHcpaGIgxvgqlr/QBUNOvZOCRAixPHT2rtVF+mwbT
	VbVJ8jqJjH5y7rqKO6VHH7wGaOHHdJHhh0aLLkJb0SqeOsI7EYrKvLjUHsTvpk3jnEXVLNd50KA
	=
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f8b2d44cb2mr310211916d6.45.1747831610317;
        Wed, 21 May 2025 05:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrrceDDu+GLUk9ALbLga29Hnv6Ac2h9d892IylQS5MNstSZj4gPJnCFx3NnyAWf0EeS1rWw==
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f8b2d44cb2mr310211526d6.45.1747831609859;
        Wed, 21 May 2025 05:46:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm2798700e87.214.2025.05.21.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:46:48 -0700 (PDT)
Date: Wed, 21 May 2025 15:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <the3rt4gwb766u5tmzzugoozkyt3qw7kxvy6mlemxcqb5ibs37@szcq2rzbukma>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
 <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
 <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMyBTYWx0ZWRfX6KWG1buJ8ScH
 gJ35HzyNmZzxwlQu5jP5rnhsRC9YpdU894rbxDs43Fjn2bKIBJ1PhAUAD3C94Cl1IE4RS5gNrBB
 Kfwa/VIx7OgVjn1SwGArBQvORkoRuj7PGKVz/kjWyck5IGyzaKNGjPcdIEeXFK713Y8Q3RzTdYi
 HJ/5MK/qHORdA6X4qxmkNvi9pcHtEIeylh+ZcdEz/LpapE61EjssGJbafqM7DvdeSuksq6axkA9
 +yOMLQWEC2eaGN/+iucTD8lKEtHwQKJnZeprBgwPUQPARpfYF8b8Ws/heOgi2WW04VUEK/rPKTE
 z0NL1vC7m3uNFQaPJhxrFVEhvzwN0hTrFsfsV8OKuEEBvAb6bHXEdTrgUQ9rbjC21SddNr6ulZZ
 VSF/n+cRDQaq93DWUcpAtL6z8783rGKR+WH7YreMHtFRBsdgMRAaNR9Lfii+M+nj4ErDbq8F
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682dcb3b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=mlDIMNG6S_g-ndTHxx4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: kjiDVW-C6BUnV9SQsQQ4BvQYKmCeNeSC
X-Proofpoint-GUID: kjiDVW-C6BUnV9SQsQQ4BvQYKmCeNeSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210123

On Wed, May 21, 2025 at 03:32:34PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 5/19/2025 1:48 PM, Krzysztof Kozlowski wrote:
> > On Thu, May 15, 2025 at 12:38:47AM GMT, Jagadeesh Kona wrote:
> >> SC8280XP camcc only requires the MMCX power domain, unlike
> >> SM8450 camcc which will now support both MMCX and MXC power
> > 
> > I do not see change to sm8450 here. This makes no sense on its own. You
> > do not move compatibles - what is the point of such change?
> >
> 
> I did the SM8450 changes in next patch (3/18). But I agree with you, this needs to
> be more structured. So I am planning to drop this patch and instead take care of
> single power domain requirement for SC8280XP within SM8450 camcc bindings using
> minItems and maxItems properties based on if check for sc8280xp compatible similar
> to below snippet.

I think it is a bad idea. I liked the split that you've implemented:
separate bindings for platforms that require MMCX (and MX), separate
bindings for platforms which require MMCX and MXC (and MXA).

It might be better to start by changing SM8450 binding to support MXC
and then adding SC8280XP to those bindings.

> 
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
>      description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: MMCX power domain
> +      - description: MXC power domain
> 
> ......
> 
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-camcc
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        required-opps:
> +          maxItems: 1
> +
> 
> 
> >> domains. Hence move SC8280XP camcc bindings from SM8450 to
> >> SA8775P camcc.
> > 
> > Subject: everything could be an update. Be specific.
> > 
> > A nit, subject: drop second/last, redundant "bindings". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> 
> Sure, I will take care of above in next series.
> 
> Thanks,
> Jagadeesh
> 
> >>
> >> SA8775P camcc doesn't support required-opps property currently
> >> but SC8280XP camcc need that property,  so add required-opps
> >> based on SC8280XP camcc conditional check in SA8775P camcc
> >> bindings.
> > 
> > Best regards,
> > Krzysztof
> > 

-- 
With best wishes
Dmitry
