Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDB26AABD
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832867; cv=none; b=nu5m31sXw6tMGTyYrVx1u/0wiMqDDQRmpRauyeG5yoT+M+bd1Uk+JWQI4qdAMLiBhzWnREqQLol4sah/YhRCU/XKy5Scbps0MpLfQzcMGjCiS7eWj5afN/J+q96mteM+w6DQHaVXp3iA12ClvfgFvAj+VZW1u5/t/A75q1wiOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832867; c=relaxed/simple;
	bh=2h5eOk+PaQWfro9Vv3yg0j/RpaNifxflPxmCSX2uz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb7K7dpFfo/BalnrcLkKxsuXzxMnyL2QagostrGz1N8S9WEy7q3v6jj7v/A69k0RQ3E/kxP2hjbtOGHXkBNBaIlIJykyo6zOfH+NRjQxRAYJqtLAwgPQTn4Z51K57b4aJbTmAbu2zBHvXCspHUlFX6EaVj/ww/Fgl0HPoreFrzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcpFgHnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcpFgHnx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJV0031705
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYODI0ZMM8S9a1zlWL7NJhRC
	dLxf6RZlwDt4Yz1bkk0=; b=GcpFgHnxSiB98S20oARs8LRm/+kkzMFsOSSpDBnK
	U2ROZCnZ4LVNA3UhTSEEPJ5Ub0IWVwIw3wIHP64Wg1m38TKR8qg8DsNFW7fovOR5
	nJaOtktTUfo0Rd3RyPoyIvJFEXsKVlWS7/kCVsG0//qXujtM0tjAMQn64bbz77jm
	mJrn33Fer5+/pafL1VnGjZIr+LMRGOJb/z+NdlwDyU3XZyPq2nz2N3LDEPWS1yol
	YA1dLPLVsw+AZzjrJQHbcWkiVHGOm2MFQJrO0P7OZNJd/mIVb7r9WY1OfQ8MqFwf
	q4fjHzMrMrKSE1G062aMCqSRbK9PEnRfvR5R5WXd9JKvuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21hdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:07:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e6980471cso5471893a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832864; x=1748437664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYODI0ZMM8S9a1zlWL7NJhRCdLxf6RZlwDt4Yz1bkk0=;
        b=Ln7Bx0077JMDbrkIUnugMoKMpTNVDVh3CpruSxUofe7hVzsmEFFueKHMB/zpO0e1k6
         le+hbtUTcA//ZTgDgmyPLKVHMKcHnaN8+7gipSkkN0OHgNXrN/evmyT79qfOhq3esEwy
         NtrS6Jar20m/UDq53vIqgXKqz/IqFZw28MKU7Wi2vG7HVmrxR049RkFixEuzNVEL8/Yw
         f3/szMfik0L/W3NLNK9GAsKTNlHlFbQdJ+2KErBcLhm/o51/3XWbLD7PfsnZjz15aWs8
         wGJyrcCVByBDSkiOs8P3qcdQHuYG97V6TgUc5tGSEY6zZ1GhiQoLRsb/BNZTbezfCCCO
         fksQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwj5qkjZyr7DxmdoyxjxdyGIAl9acaoN62M8wCBQGLrFONsLUaGA+jQnODCfcqqposP9j+CQKy22te11s=@vger.kernel.org
X-Gm-Message-State: AOJu0YySfO3o6w9+3TYTn2XlxQk3b7vOa4m721jmmQaVyUl9vXDVHoVR
	xNpIaxuBZXMCX90BVdUv4zby1waRwyZBbmUVFzjXYo2fuOv0zqaw8GTSdGV9HqngIBdUe+MNlGZ
	3qpZEgKgwBU5s4C8mRAcXxbNtVJ+aiX0GJW8EyM8zx2irNqmkLnaaPYI10k2fpOtrodA=
X-Gm-Gg: ASbGncsgEKEkWiiqxNm9J5GLSy4Ia8SoIE4CgPoMjK7SsE0zcM+PJeiw3+0mW+bJg5f
	GBJ78muC5azfP46vDyVEUXWBHSSip5M5LNkQGViG+o89EHVwXDE/1lpEWPoDZ6cKx9plgYSpVcO
	XeA10uacU2zvMHFpNbJvgyPwzyQUNCYnRn5+GHFiHLA+fqlDJdsTk7MVqq9K/qIBtn+6gwpWCbW
	lSsb2IpE3w0hoYkXempmuoAw637oztFgQmsN2G/90aLGRNo95o85ZyakRTM3UipWahPVx3kszVS
	j0UZUfgLB2DTCr/yozBfKeq5L+G5ghUAL3KHO5V/iz42lwO2dewssE4fGxBHeUhNZSImvX4Z1as
	=
X-Received: by 2002:a17:90a:c2cd:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30e7d5212aemr31974557a91.8.1747832864066;
        Wed, 21 May 2025 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQTcM0DEewfI33gItZD9j1h0bGLelB3UY4zmdB1KWV9XM4V5233w4DxRV0kJm45wKsrFEaSg==
X-Received: by 2002:a17:90a:c2cd:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30e7d5212aemr31974498a91.8.1747832863677;
        Wed, 21 May 2025 06:07:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c19csm2813012e87.170.2025.05.21.06.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:07:40 -0700 (PDT)
Date: Wed, 21 May 2025 16:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Message-ID: <osxdr3czofrurub4c4tmqv5vciv7ub3gm3vxygqee6uizjmmq6@mju4r54hpk6j>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNyBTYWx0ZWRfX/5xGfyUMVhrn
 E8BHE7NXXcEjepNJx4Z8q4qShKZaoJRet6Ii5yFPVm0at0Zt2CYMODxPftOQrYO6JZm3U3QhqYB
 O9w7/k6Uf5aNzKGFw9zEJcpvPZ7YWpXSh+EKkL8k6eTQBChXVQAB4Ha0/08PB8c8lYs/qVo5c4F
 ei7UORLj2hKRWN3Lk7s6f5Epce3z5tFItAJ5hK/qw414YVRlBLuAp6WShT2BA9IJIFnnVbYzc41
 Ltd0yck9W53Ocgl/ftRD5kYnfXjRw+2avvSVWZjBP3YWgiU2Q22xd6xwXCPwwBf777vbgcgpELx
 rSOAtHjUSOkvd4yz3Gtg578dLydsIdRAj4n8JPHav22kirmAM5Owi8MHV/UDRjBhAGiLWJatLWL
 iIwx/U1RON7JurcSuHy87mfMyeJobqde12Bb1NUDsCPeYZVtJIX26LnEtonS+APaGlap2BlN
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682dd020 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=D6KgBE5joMCqelrfVo0A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _DuWxAGGbreikOfSfhyMQvO3mkAlnu4G
X-Proofpoint-GUID: _DuWxAGGbreikOfSfhyMQvO3mkAlnu4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=834 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210127

On Wed, May 21, 2025 at 09:32:00AM +0800, Wenmeng Liu wrote:
> 
> 
> On 2025/5/20 20:19, Vladimir Zapolskiy wrote:
> > Hello Wenmeng,
> > 
> > On 5/20/25 11:56, Wenmeng Liu wrote:
> > > This change enables camera driver for QCS615 ADP AIR board.
> > 
> > what is the rationale of enabling CAMSS on the board without giving any
> > description of any sensors connected to the SoC?
> > 
> 
> Hi Vladimir,
> 
> We can perform validation through the CSID TPG(Test Pattern Generator), so I
> enabled CAMSS.

Are there any _actual_ cameras being a part of the RIDE platform? 

-- 
With best wishes
Dmitry
