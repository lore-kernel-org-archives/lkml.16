Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA4235C01
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257804; cv=none; b=WNW94UsTMVvRiDTABKKIBLQhsfQfOBTHoEUBaRCmVCDmq+OqK4xTWSyKmX9NimXnizb5DrTRnYsDcowe+Pi+X4VrZW6nUtEcm+do7KJ0Jhs3aD6xPaScm/HNWs5iK0yDpDXzxUbo/h2KMbiLcFRU6gvsrj6Lqth8ccDOF996iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257804; c=relaxed/simple;
	bh=EyFHYmawDsHmKWz0s03ImTnfgsZtZdH/tEJm1DPqlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYbe2nUOOf52fDvn4hhUU5/Tgm9ylnr/ZXjVvPxUQinoNw+u0qMn5eEFAXtk4Y8cxQ9czAhq52erDIPFDOHLDfyoWHao7VDVTVLs0TZY7ficwbpYRMoYutw01nXjG4rDI+i2Q5mH80wHWiXWijSnnKSJ3cvqzVDZsIyblr0dmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLAB6yeN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLAB6yeN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKlUlZ009075
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mj/Qz1xUZrhHvcNTBOii7qww
	2wIfBNbFUlMQ73vGEn0=; b=lLAB6yeN31GjnivygSuhKjuA7cozJw2fT8ch/M5j
	KprWIGx+InHADt0gskFhP4MKJp6xhi36Dv+6SSquYpnZTVcAIrVbOtRXtdkLLike
	0GvC+KG7OsVNEhJkbownjuuKjUQ5QBjdLpHghcCjEimZDnDUFnPQnN0FHIXhm4sv
	etfIkUB9eYQwo1vwWflE5t0B4Gl9X5C9wD0yAa3h3+gLXVQLWFJPThrQJEaRo/ls
	QQX5+iCqbcdHi8ao1xVulzAfWqTYpd/KyaZLPdKV2wb8HFnvdfRKaoqMz2WNQvQH
	UzsWGK5q0wXcFNh6bbV5T6+SbaEw3aTOcvooVQTSRLmo+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpv4s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so37781585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257801; x=1747862601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj/Qz1xUZrhHvcNTBOii7qww2wIfBNbFUlMQ73vGEn0=;
        b=Qdvm5Qs5zCzGFcGcMzmZaJjM+nnfP8EI1ic4Cs3h4NMPin8rImqKJ8MG2T0ErPekZG
         nDOVMSKDZ8MVUu1cqFujbbtAwGWlJF5cch6U2nv55tmyaS5U19seDSNVNlzc6WzLdpXh
         jmK8iNEEwXcruCLC9cnV0NjZaVgAiO5RziX1uAe8PZgRK9Kx9GxghQwdxM2hybc5jYH9
         /w3GxXqO8zdccSeAFu3A/inQElcylWv9sJoM1rVI8+XTUYSzvNHpgIzZIIWV4uiacbn8
         avxMJqwsiuba1U4/f95MUopannHLBe0ScwLXzqemXzc5lbua405jdGWrolZhsThfdngN
         SsXw==
X-Forwarded-Encrypted: i=1; AJvYcCXrsMEzrZM73gSQ8k/dUSznqB7/HMXWI/bQQbhxAoCS5XJL99u/ozdZJg2gtDj9ih1n1bDZwR1Hi7s0fbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GK1umBAWxBvi5l0uMJIO01MrWXy+xVumARjgFh6oWvUTxWqg
	BXU2kPp0CTykSwiyu7MelBlZAABGv+688Ab77yqlIdHqDawPtxBO20+MvYI5tsEwpqP/i4PcA+w
	IwK7pup/Dc5pDUc78Qb67wJqTB7Nme/LK7fa79FjqWLY/gb+UUS6Rs3Zu9JdSn1g=
X-Gm-Gg: ASbGncuLvmiOBvcgnAjhUkO2u18zWU7jwoKpRvu5R8p8QfYjcmnM3m2xQULlrhJqgQ+
	ojjv7Ddv4VT3RvQeGj6D6+gj4lqyQ4DJcXfXS6QzZxBRqeFPZTNnwL5F+8sW6PZuO9hrrIeGRbw
	IZzIangG4TBNyZcA0bS06aeMiAQed0mV1iCm787RyLNJNikI/4Y5BA/3PXOzKCJKZUCrYu4LBD0
	WmijYPbgDad7LcKBhGZHA3VmYbaDi3tfjFQ6u8FTl+3xLXpg41tC6meSH3kjAzeA/2R9lhmBzUA
	PhKWE28bvTv9UH0SF4MdZC7CTF2Dojs2ffuN+z/2Tb1wMXtPKSFdemyY+BEJz0Ouv79yOQriyM8
	=
X-Received: by 2002:a05:620a:1a0a:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7cd287e10ccmr787436785a.13.1747257800852;
        Wed, 14 May 2025 14:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmG7Ith2nDW7+gN5BCXeJ40qkWZAYm0kLVgIJGyOikn/H+ldKhixf9JhMX4xvT40wy57vdvg==
X-Received: by 2002:a05:620a:1a0a:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7cd287e10ccmr787433785a.13.1747257800520;
        Wed, 14 May 2025 14:23:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550d8aa7039sm314977e87.43.2025.05.14.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:19 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in camcc
Message-ID: <5zbpbn3f5snf5dbsbp3vfbahnjtreoqdalg2n6ddqxfocnjtpw@6khojzihn2mn>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
X-Proofpoint-GUID: NANHGhcgujQNZ9kNctl5aLidXecG-NL1
X-Proofpoint-ORIG-GUID: NANHGhcgujQNZ9kNctl5aLidXecG-NL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX3qAXh2TMQx7A
 LCIh8giDQVHm92q4Mr0I6ViVBV7iliTB8nuqoY7Nn1yG32MlZYODH0BGOBrgpizfa+MdIFC7/k0
 nLbS53jTImhvCr/muX9NqSetx8ipWv2J8KU6fV/c7srLAGcFklMMlqica1nG4Wby8ve9MAaEiro
 OztHusQKtZbBgK4AtjS4WIZvZ+Y4TZLSaSaMM7FE2BOHzFHCR6WMwiulQqA0lk+i7CDJgVHlb2C
 JuXTaEKnr6iYv4R4JrC1Mjoimxmii5xBZ0tlJPMbkddgYEogB3YBr+axNTRbXAFiSttrWn36t79
 zW6H8XNfQqmcnP/tMqGwtL284iCJ0AzDJGttm7T3KJMorFTFnjztNxYMVtRQ5zXsdBt9zRJoWXO
 Dh5Pz/6C6UaB2abHKabGpkiuSDp92G8EGU083MPUCPhygfGzb3Yf3yXEcjBNdTR1Xu0Xahrc
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682509c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9_CkSsT5FSWxdIVEpLUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=622 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:01AM +0530, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
