Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1931120DD7E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602546; cv=none; b=XKS9VKgodJFz+bYXewUp5otC8Miw9ZqbMkmDeoS4jnzg4AggdX/CzcRzZ0vpF5X5VCUuQl6HqvTWHow81B6niPRUEfQmv2iYRIHNm7F6e3019SrBeUK5piDRudwH9hMdtTgjAi/7ZyVBQ7ItXholDDJpJjx9Qu5UpL+4CRBLMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602546; c=relaxed/simple;
	bh=g97QnI7TsDtM6koSlVu1VNup28kUC3gBLrfnGPhJwjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvygZIAaAGK42EaTgzJij+cGgXXBRFOP3NUW9YUzcoBhOnu3z/mcIblk/qevKibBCN9xXUYzzy2M8M0VHYzVfkcZROKqej6Zcj/0qrR+LLnQiXMwKWXAg6O44DacXt9/gE8VcGTrKndn5Azg+sAOKxBsG7GZD1XmU11WJKNa5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFgJsbAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFgJsbAq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuxn000401
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zyNlb30tETnAmrNGQNUqaiWR
	HGW8KM+qAPfP+miBx5A=; b=IFgJsbAqJKuOGlBpIFgySo4WWLASEoB3ZQ19aljX
	DrpYDERBeY1pth+PtnFJD7OgtLRxJlz6ECxG20yFzK8u2XjJZgpWGEayswYtyUTj
	1ZZgdve/JUCkWo5088uaTvZzl2XlYnseZAMvmnmMP0KxE6jU/UhDPpg2/BndO3GF
	SIr2jl326ozUOmvYAiQ/v4AitsCrU2QDTCDMAiFMCJ1TlKC4P/zjcRaHbWh7NOQ7
	v+06SV30E89kiBF/W5MJ/JhCWlcz0c7+evCTVfZUxlllas3ltOrcP3HZnp7wwnl+
	e/BxrkyXnaOyqxpgwy7TwcQ0PRciOWJO0ziFXQFx6wNxlg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ht45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso39606836d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602524; x=1746207324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyNlb30tETnAmrNGQNUqaiWRHGW8KM+qAPfP+miBx5A=;
        b=D4jy9cxrbJ0xDQqT3B5lwa60S6C3cQXLcqe6ZY0hTONFUixGHVaE9DJ8vkVaCpYrfx
         1tkGkIVr/xpFwZ0L9TOQXCP/reLIEKYjP0d3dUMsm1pQ39ErZgYVkH0Pa6uCHRu1Vqlk
         ioAZmfeE3CEu2ihLlLJpjR3VH1hb6MyAsGNaDI7r+VRSHwgYDnjEpYLJqJruDDzQj6Zy
         JlX8WKz/wCxdMvMpp/xySPu9AuKXs3fzk+484E2kqS66U1HqJmOBmKnuZPcd+vCJeNxr
         rC1mVpTdpSq78gx8j8korQ9pHXsHRjgxZH63r8Zj7QfxgwvRZq8fxKOziyYgZny5lEN7
         8cSA==
X-Forwarded-Encrypted: i=1; AJvYcCWMQh3Z4My32Vf6INNhOBsPorc6P8u1vJsRxGU9w0IFXGug2xK7AhPloS6Kzy8uH/f66EkYzsciNSd+6sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTuxsbrn+dpRQZDBlVAs3Q0GN1bVI4IkJKLrAjb+zwNZs5EW5
	+3dMkwOjZZX5PICSCNadcX4D327748Mv3/tTN18endsKxgcDrTRLVFpRdAg6y9VwMQLyYdw51Rx
	DHIG6cD/qxCt+FmY+1M21qd3EY1WgDHHTk+F2gwyDN9mE8XmazBh+YpMvXQg7OR8=
X-Gm-Gg: ASbGncv+y1iU4aAGJdZfMZR9cTDCSUWhr/gpCnuNk1Yf/L4kjoQHpY0ghyirLU49CVP
	vkwibThsg4hN0x8WnZSe2w1FYZC5FOSl6RyBIfRPouSTWuUjLUnkzHCh68Ewv4LEEoEZvhMG3se
	seDD9iY3r/FOofSwsJev2Ln1W3ZSRfR9dM3dILLaRL3RzGl5vj3l3CIboT2aPk18LDHELsFUQvt
	bPsgGqnQ0dweGyoymwBi9oWmeQJPs+HXbBPiQO/NrWFZDHSvXYN1ib+qz1w+3vdGbHEufhXgnrE
	Rg0DC3mJSWrpy+YPvzRbc3njOGCzwdJfTuuxGchDzr1yv/ivyrgyzqqfZdR6KpEWBmKQV5WD874
	=
X-Received: by 2002:a05:6214:248a:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6f4cb9d67aemr61638776d6.18.1745602524404;
        Fri, 25 Apr 2025 10:35:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU37Zaa9PWwzxzLZ3L3wHDT45dKPCZDd+e4wx5Rp2/ForS3F+FljJ6cRIuW3K98foPwsG1kQ==
X-Received: by 2002:a05:6214:248a:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6f4cb9d67aemr61638366d6.18.1745602524113;
        Fri, 25 Apr 2025 10:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7fae6777sm612960e87.240.2025.04.25.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:35:23 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:35:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] arm64: dts: qcom: msm8996*: Use q6asm defines for
 reg
Message-ID: <a5ufjxvghgt44sqerzzd3xcf5gdq7uknj7meajja5rst4k7rip@kjxpvi62aobg>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-4-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-4-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: Rier-18DwxVJVHGnT-ZF8UOKFBGmKJ0a
X-Proofpoint-GUID: Rier-18DwxVJVHGnT-ZF8UOKFBGmKJ0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX/xIDcKr5Ih+N cT76N8doJcwkI3TON9Cg3OVI5KJWrVMWKTpQeV1NTxFAmCIjwjmafdUt+2wsJK24SckGHE2yblD OTa8G3ZC35Y3rlUjnJ5NU615FJklc9nOfB51TEIisQEn1s8Wf2ldLEmj9Q92usI+hTM71fCkuwa
 mGoxar/XoMkj6XOdTTzJlUqF57y8TX5RnVea5c5kJjh2qJNgZuZPab9R9ksX2Qs4MwAJ8VzV7JZ zgUk0r2RFP2fs6tK11gkhJSW9sh7kgsq3R+7GuNuYWd/qBOy4tgYmse/39Z6HJQlj7PlYNWSVdL P+9lMW71KdbnIJfQN9lHXNrsZ4BpuhdAwE4CP09xevyxGcqfGVWOkTc6QBMwihjpkdRzIZJRn5G
 3qcGVl6GrGH28ITc5bRANrDAZioTgdI3SOtpva1PCzZj6a9e4nPhlwAMPn+uLCaufZblx8ju
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bc7f0 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=567 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

On Fri, Apr 25, 2025 at 01:53:43PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   | 6 +++---
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     | 6 +++---
>  arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts | 6 +++---
>  arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
