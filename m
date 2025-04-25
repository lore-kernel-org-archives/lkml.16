Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9128F20DD7E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602518; cv=none; b=KWeIxZsi4e+O9Au4iejpxVKAmzxiaAYYXW5I8w9jdCE4GumDBLVeoqPcduQUuGpU89dxZ27iec8kYUqnj+gW6d12jzy3Q6P85G32HroCIdigTwU/xK8kbVWmuPfh86z9HC6EZV6kd+Fg5PHI0WFbYmJZk+5OJ14bkJQYGoavd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602518; c=relaxed/simple;
	bh=hOAgLBo3rmrxxikvNXsfBO4Ojj0ysk7D3E29Qc8z9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfW2RLXSTU7N+v9bdWveCyBnOjU7IW0uzfcHlrFQKRQs9e8k0MbMPpBMrPhy78t3AuujAB6p1yOy59+kgwr+qR0YgD+FmDMwkE9E0JyEgpuilU5IzoLAfKYZdkBD9hXo9qH/reN2SCIiDUMydaVng/XnJBLS6cs/HwQSA+B9jck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aynETfNJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aynETfNJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK30r013130
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iYju3EJrtvAUizjHu0/EruE+
	XkPNrQlYf7FCiID13iw=; b=aynETfNJo4fdKRQLlL/4QlV2AkETluH554IM58lo
	bPQZnOqSUYty0GoJ5DUfpDu58qv+1h6d51oT1a9Ku6stXydR0vQddkzgS6IWsS+k
	z5COtFcIgdKWUChDxwFWTr1AlaknUVn5x/4ZKXVJjCfh+6nVDzB0zs4cE6nbPQHH
	Gcu/VfcJsBy2LPTW2i2z9OKU32k5C02nVEgkdhP0DbNwd8JyacidI/K3z5xsdquE
	9ENN7h5MTPWTuBEMIrbBXoepdX3H7Uw7hSFEycTzkWMtwHO34hDOjkErozm5ix4d
	NW2lqnP6yyBVWpPJXMZKq7RJkuApGDPXeCa+SBA47Sw/aQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1sw11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e905e89798so47885686d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602515; x=1746207315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYju3EJrtvAUizjHu0/EruE+XkPNrQlYf7FCiID13iw=;
        b=rxcCPcSz3Nk1Ju4FL0nFlctRe+Cc5lP13GdGU6osWl60C+0lRTvUK0HXrgkZ8YlaEK
         bIjv2negUNvBIr6GGMjtuFmRAztbXHmBAzKu7zRlgRJziMPEMpvhyMvBdEpWMEwUPDV7
         2Yp/xyMh+qnAhtzzcA7OqzUHTfvKVmtSiEy6r1u+7Em4AdXMOKxFt15GejmaDZFElUoh
         fLb87evdzIvnXy3cUq9TdS74htfCeaa8wyCfwUULAHk5jkRciPGNpdwiFNVn74UQjjfH
         FxrJ337yA78yDI1inGgPzHXyI5HSl7H7VEJPfuRRL9Fmka10VLeRsB7VPD9152wAtul2
         q6RA==
X-Forwarded-Encrypted: i=1; AJvYcCVj3ftcj5JL2lz7RawIY2Yc242u/HJUjJR5jOqN78gNPsf5++IGj0wccahhFNQQ2UXoQlcnA6G09Fgyw88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZb50RfRcBenOfDNDM7eQmThG+xrOj9dBVjowGIe40kkmBfddd
	Kwq3voFlUwJvMZd85bZw4UrbKarA58QaCgLuoOxnwzD7xwjeBwlK+Iii4iSQuaEs3eMUOQczDJL
	3dpBxXhAGRNlgYA/ddcFBNtEeNeQen29+llzuLcYRUyhlCTciHyqBJiEPHwuuCSw=
X-Gm-Gg: ASbGnctQk+gswShuR4gOwO14WRKz8quRdzbarQxjeREpDaSIkqmmVti+cD6sGIpEZ+r
	l36LCIgWIbVkk+50dM5gsxzvtupj6ZMODYL5L9qGrURgmRbG7fj6+ePQUWclQcwkpc9ydvccdxE
	nc48KG0xBRn8JXQTkn2TNLpMDmv6us7u81I805oNCw0KG8f3aKkoVHcoSKAiHe9fRaoNkox935L
	2jbnLSQd8ySxMp7TT4d2ZUBGz+VO9TXwlBFHAUQQsPhQzOg4nfqLAiSIN/VeoKOrZtWIpXouz14
	anwrcadYxikDUSpdaIFHnkzwMTRAEPwgYB+yzTFkZ7e0Ip/1tVG1vEzkMrxM6DixHgHIbdBx4nQ
	=
X-Received: by 2002:a05:6214:3015:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f4cba51c2dmr52746286d6.34.1745602515283;
        Fri, 25 Apr 2025 10:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJZmtrsMUpGVmcWNWgVpvUyF2Bex7W+EyH/Zif0B93/CxbcE+0Ez8V8EAzdLQZ37qeR4952Q==
X-Received: by 2002:a05:6214:3015:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f4cba51c2dmr52745946d6.34.1745602514967;
        Fri, 25 Apr 2025 10:35:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659b9asm8398381fa.19.2025.04.25.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:35:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:35:12 +0300
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
Subject: Re: [PATCH 03/11] arm64: dts: qcom: msm8953: Use q6asm defines for
 reg
Message-ID: <44bdd3fgf2e6wfmlfjcj4cepooa3g3b3rzwdsatzrkzre5rkll@24jxskma27nw>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: IvIqTcm1WoKJ_yn_tDdZTHakvUAqLhtB
X-Proofpoint-ORIG-GUID: IvIqTcm1WoKJ_yn_tDdZTHakvUAqLhtB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfX4L/sliboq1j2 7tuH7U/bPeDCD0Wn3PXqKh2sVrWdjUd1/PdYKTWnhWZh9NbR9NCtT/FrD2Pv/HRi9fCtQS1rsYh U1iJOdUALxBQaW/o9Pihc7u/puOC7wbksajNwRkMti8yJptt7Ez8rLnxGH4+KyJtazAQhRwXBXb
 rAEGauRSwJ/WzDFJRozec7fDtM/qJoMwp3UmnE/DC81S5kguK131G5AF0AJJcuZnjmYWhoPD2iY yqnz8/EpLOPDv+ty5A3U5wmurlZprHL+WyBzIwSLmN+f+7c9FjKf1yt/W+e/CgtW3F9Z+pVQk1p 49FNMBZvs3FWX1Ct4+pGsVoJ7oPDZ/+YbG6t8aSWs59muS7s6piBbg5YUOl/qNrfVipkpuVzTwV
 KPD9bg7VjQeqQSpr6T3xwdngZn+F+yVzBpQQciTczvvZGKF7Lsm3c6cggfTfKSwpAAmzkcmv
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bc7d4 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=624 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:42PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
