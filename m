Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE01A5B8E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971318; cv=none; b=LlTiTPTuAKW9dtizw7kUAsvtAc+91r1Ypa+kvZCK7/O2Cb7kaidR5Z0sG5ilZ4uhoGAy7tvUsYQoD5oxDzC0N3dLdC5tzAEBfD/gjAdXzO1+EMjkoU3IawTMxPa4Of+0+qGIphCqDX4ba65MU9wHS9s+82jWhNJHw4eKxNKjTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971318; c=relaxed/simple;
	bh=T/XIC2WFkjEfSRo9EZwjR1f7QsFVGUQ2rb5zT2kkCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPAymDxrqb0tUbipMcqYWXIi28eySgG15+sJCwBA34pJW4pV4jH2QBzAxJC0pmvRl7mfijmnoXU6vIbcEk0os3d7NhBwPEFPMfadw9TnE8fLdNJSBGQahfurerT8ysQJb7CZ4jTPYVyz6Unsr1FVgLX3vYED2V4xYERiOz1mXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfLOy48u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfLOy48u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536Flljj026352
	for <linux-kernel@vger.kernel.org>; Sun, 6 Apr 2025 20:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bsSqtxqI0AJDBH3mPOzo2NZx
	f3VK5S/PNaqBt3C9Mus=; b=HfLOy48uGQgcmXPZYtTP8EgpYk68DnU7pkozMLBL
	VaaXC23YV9OANeJU31lrRmPAKuqw80lFx01PGkbc/BZVznvj7Nmitu8Cy2hclqkA
	gDov4mUfgOUWUNF5adPa1jgdJNxAOf3iJ98Q3GRmmQh2ixwRV+/zWqIij81m/QAa
	Ko25Ajlj/x/z8SkBJDQR/wWpmehKEMsjLc8TUf/JRoDMytjPyMirzXr831EcADIw
	S87iYimwEVuK5ogNTFq/9aaJylhBiPhILNu5b7AN8jhWfcPdaFOoTPWASXVp+Xu5
	pPDGn6gdu7yu12jT19dvKHFykEkgHrsSKsi6jsejYpO0yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcra9u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:28:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso547171385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971315; x=1744576115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsSqtxqI0AJDBH3mPOzo2NZxf3VK5S/PNaqBt3C9Mus=;
        b=Am5FcFB6bHdkyNeilW+36n4tR8tteMaNw9TVCjohBofa58hGe7AgtzTa0D/aHavgyX
         wzv+HMu4pBlly49r2NlRi6cXq2BwpIeDI3GT5iR9b+jol89mzWDWun2zLQgxXlixpln1
         V+z9+BTyZm0hLKbFv8fXGw8fwBPH6VcqjcsI2/JgMIA03ujwamBwHI8R8BZU0zKfwcSv
         Kp1PkJnozV8d4yecCWO1t+yrtYRq4u9EFY488tmvw8pn1S9VzyZ3AUlqgQF54O7R07hj
         oSIs+15RCj0i1BayY0Gd74td3laDX9tnNGtsOtAHKUmQz0B8p0PlT6QPfGF/0gLggkQq
         o5gw==
X-Forwarded-Encrypted: i=1; AJvYcCXMiAyiSnhFRK3x7e1+ATBqLF3k4G6Nt0HEaQapeTvye2twYd/Afm2i/9QGfBUlh5SsgLfWEXuCwmBTwO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyBAaJXnxdcUwW2+Bm4mGbODs1DUshMWy2UYmDb9Wy0BVuOgF
	RsdkSP6HfpRaq2mwCfLNWJmE0HefMPHQk1/y/jhfa/BrmZgdutILJueuw/9Lvmb+jt8F9bERhHo
	OqvAYcFDMLBIRlUrYXLgtMgQEUej4J4Q4riAv3bevlPg3xxGy4swiaS0zw3zvlBPbXPeky0A=
X-Gm-Gg: ASbGncu74LNX0z/xM3vCmpHfrRgsfgMxaLEz5wvlXg8/rsBlKHc08g3blQ2uDc5yUgS
	C0qDqrg2dQ9MIPF6Tdi3dE4b1SLGjLPfFrzhrfi7sMCv7qtQAE7Kli61S6LJwv6GYxU6IGvZIWe
	fX87nW5dmDX+LB0LHHZEzJjlUVBBD2Z69h/OssPSfHfCVMFPaFqLdsMqeFXufBbuW6r3LwSWE3M
	r1ORe4W8xatxRtqLrHxUaLpW/O9Wihz+2oodc/FGISFz8UNEjHcao5YjMU+BgjTUmQH2QWwHXTR
	zpZSzyd7fZMd8L/f29I0xqs5xan40FcZwivnY4c0FXPtQyknehAThEIEEy4RdO0hvSc9mPnf9Qk
	od2g=
X-Received: by 2002:a05:620a:17ab:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c774d32d2amr1368562285a.23.1743971315057;
        Sun, 06 Apr 2025 13:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH5hWPFCmxUw6pP9wS8Gag8pjJ3msg4LETjQccNi6CcqRGLBFxR0pcjx8MhIooTzZNcO6ZqA==
X-Received: by 2002:a05:620a:17ab:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c774d32d2amr1368560485a.23.1743971314790;
        Sun, 06 Apr 2025 13:28:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce8dfsm13394391fa.100.2025.04.06.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:28:33 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:28:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] extcon: axp288: Fix wakeup source leaks on device
 unbind
Message-ID: <z7dybxtykwcig7ztnfndlss5atoa7k3e4ba3g3bwgujagxvz2f@3qt25zl56c6a>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-2-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-2-8873eca57465@linaro.org>
X-Proofpoint-ORIG-GUID: oylsHTT3KFtos6BzDGpZ8M7WvBNM1STK
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f2e3f4 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=161-1wwXmLm0-wC2vyoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oylsHTT3KFtos6BzDGpZ8M7WvBNM1STK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=695 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149

On Sun, Apr 06, 2025 at 10:16:40PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-axp288.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
