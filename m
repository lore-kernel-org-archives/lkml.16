Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DEB272E46
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369391; cv=none; b=kcD1kkNkIh7QMzpEEU7lQwN9rgFcnxpc+35yDqboch/0jIUex+YH61EpoITo1u4haRKCuICjwaicRb5FUXDwKNSENWqdlh5rH58q9+ZFxPY0uWGri7SftyPtQO1n0Ht6GwjUzujGFF6XeOrVScsA/6bYPDU02y5WKTxpc9LXvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369391; c=relaxed/simple;
	bh=aecfqIgcgMS8NEZYswyAdEeWrhP/4nJk5uApShw52ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLBBnnsx1udJa/y4b/cFHQumd4MUxybhzpI8VczI61bVv4PUctmYwZiNsUqjhJ5ysXfn2StWQVY6ZgN5m5AEegun1a7iO+E4RqUzVEHOi51Z/DIAhH8P0KSL8iDRbTdCVDCiRuiSEEu1dMnp/7TtbPw0WMsd1SMJ+xJcicdzjHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIOPd/uU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIOPd/uU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619pTUg028431
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 11:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HeCUTIvo2J1PhAD2wDzz5Zb5
	XHzZC9YruSB6ZaOdH04=; b=dIOPd/uUrm1KFxuvaymajs9D5M53DEntgx/u9nzu
	yQbOgJ1n5XwxciyfA5G3aTNFJwP314unQHYkGGGdAd2w3e+YFUwp1wjNOe7yuQys
	mwPB4uMJCR242jdy9hjaWPvRRi/7p6yiSADi+3EY5WU6NGy+3RzQo+BRosJKQmfB
	pnKXC9sTCSedMq4zLhi5gKQcKVGxPaBYlNRuUn4U1OR0uGamvj0PlV0i//3ZYgv8
	pmDcdocRb1gQlxbUnmRD8SGB/B/LyXtUiQnI5c3Q73pNXKGJcZ/qUMduPtHsnaIN
	tCjbEZlJC3RBixAoY6Pa2Z9AegRiSw7Qf+r6oMe9TRNpeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvrmws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:29:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399065d55so746824985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369388; x=1751974188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeCUTIvo2J1PhAD2wDzz5Zb5XHzZC9YruSB6ZaOdH04=;
        b=v2cOzEpAxH8h4GGO50AQSx1UxOUXvDHcakVt8z4T08oIntrZ/DH+psdxSt4f/KrwMx
         bZo5LciIyxMLDooKHREi8k3eOhqhGbplVjwc5DCXiS/KJ+hnV+rLI9xOiJnQNpbH0GDk
         gzUjTDoH09Y4MxeSsQBz9Fm4fYEAAWwXnTj62HpT1eDIViH/czvFPXn5jMQkguEA2NZR
         RxzWdydflhX3Ol+baBHlj/KOwXubE/K+iWGV/NxsGYCJh/gTSM4yaQZbhOVCoE/xfAQG
         anEHefNuDwhtIWn1+2rH115X3kX1cljCnY0qgFCpjxADYH0XyQf16n4mCV/Y2vRHJU4m
         ZicQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWZErQyBzAaxX9MbgJ2g/TGVe4BQU/sTCZX54pFCj9ZOA6dMkdP7eBDlY9oxHHM6MknPCy+BngJlc+ew8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMnwt06rlR8cQqel+I4uHSQkKmfUpO+gOn1P6hEpe1vK12lic
	SFluoYCcpvml8r3lHvO8x17kX36Mi6W4g08sQbWyjSYGVYz0J1nr33fiUFyEK+AfyImvTj2un4b
	/3Qm3WdIINmUTsquM3Ak5iCB7+qKsv5x8F5dHL9AorfkMyxFc0OiZO03y2Q2d0pM7Feg=
X-Gm-Gg: ASbGnctJV83p1N5t1HTXWduCiB/gX5bUNZcTUXYAT+xyMc74w/CIlEhgKPPOF/mhXTf
	BMSYVVzDFfeWo8nqk+3xpvl1xNW47203S22QVggX84sy/NEJVrBCDMNCP8lazPmjlsTQBgRYM1W
	3ajhotsb24BaVIafr+QTBRHRUFl29zkYft/GcoT9f4Jz2yq8oVwpz1zbZcWLMB13zZL25qflsyA
	yirkjOhF+krUjSN2pMEIrhk73iVEjx1R/fALZCQyXzK+VPEPEYU9HrFVpIbIu84r6TA3Mqj3C7F
	NbN3DVFboq3XoojdI2l38cDPSPvqvh3/Zxb347Z3KgFJiuvd0ijDFB4R6rFp8k0Phbry/Rw6Zze
	11zM2oDfLbWRMhz8FZR9JRNC+4f5GqTUiAOQ=
X-Received: by 2002:a05:620a:29ca:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d44390de6cmr2236946685a.20.1751369387454;
        Tue, 01 Jul 2025 04:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlEPq2TzJvQkQhhpGX0KRHwjYHWsll+9h6ewOO18Z+pocOSxBGiQFARtIuoG0qr8FCuX/VUA==
X-Received: by 2002:a05:620a:29ca:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d44390de6cmr2236942285a.20.1751369386888;
        Tue, 01 Jul 2025 04:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2da80dsm1785087e87.220.2025.07.01.04.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:29:45 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:29:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: add missing dt property in
 QUP SEs
Message-ID: <3qji4ppbdd5lvalx6qmbr6f7jsvyhyulfshchlya3ajsykbkel@rlu5uwvc2biz>
References: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-GUID: z7VzdJV1GZdnF3hAYdjFunrjvuKDHKVf
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863c6ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mQHHEpzZ3wyIVHhDumQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: z7VzdJV1GZdnF3hAYdjFunrjvuKDHKVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MCBTYWx0ZWRfX055tx7QKHdCk
 Kd2kcKfTmjtE0Sqz3lWJhtwz6CPbAm2c1Kpx+042oJwMU1RlW0BGhbFp7R++n7hWs45pO/epmeV
 dDMqDSq1aEMpQKScMja3oOjy6bXSPCH6wesOSFO0E7oVsrSbjtwa85QzfhzkZNNOK162jYbFCQg
 2ICcNn1mn7CqpYZuybdV9PoWyDtm1dXiBRvVRMWG8h0jbKL9MlH5I+rdB2C7gQGhV81dMvfc6oU
 VEq40Qk3vHW9GQfHdPq3xfBIu8zN7X8CMSilzxXZG7UcxQ09zHS+nObMrPVjBlNgtxp5hjWv+ug
 OOa/xxvhEmXZVia0kLtN9FbbeYBDpq3qcGzv3XeoPqht4Oo8t8whgp15YqNYNmnfc4Ms59iX2TI
 RG/7BCAJ/aLsTrmmSLNyTAKSlaT2CZZuTuD0q8wQ92/ZEBeWXeN3r/en12VJpaxk222lbQLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=719 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010070

On Mon, Jun 30, 2025 at 12:13:38PM +0530, Viken Dadhaniya wrote:
> Add the missing required-opps and operating-points-v2 properties to
> several I2C, SPI, and UART nodes in the QUP SEs.
> 
> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
> 
> v1 -> v2:
> 
> - Added Fixes and Cc tag.
> 
> v1 Link: https://lore.kernel.org/all/20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
