Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12A21CC46
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460102; cv=none; b=jei407O9ZvKQ1BiqXtPqKbqEFGaxfvFd9laYRezh9/l7pxudZi8+YZkxk3IqOaBm1pB6NRyh0/bouKjoTSsxKBX4akvPNQ70qszJjORXa+onLgVhae674UPG4mGi6P0997SPZUMXdtxgMqieQW9k0TLhcFUT+HOdsHDQFvm8cFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460102; c=relaxed/simple;
	bh=5YkGN7qiUJaRl3Nx6l2MDDYu/ZprV3VXMY9hifYOnPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmTu6zMIjqAMBpDVyIeQ0aCnuvX1C1e/5xVTHwcorP6hhqfcDyc/ULzyLnc6wTjWj0P4Lzm3nIa1kvkXCa2HO5sUeV4yA6th1sXFB1gTZYAQXty8rWfEECyz1GyK7UA7J+2QCr+ipvkjPZTChiBWTYSrdDifZ38KDO0rl4ef7Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eai61nNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eai61nNI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SEYn2M027807
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0gLgWYRWzCLunD/qHvyEBxK0
	5YkGBQTqBuXAxV9jh+0=; b=eai61nNIZrFCYT4XHda5r/y0e/6wLWlVa8+GpSR5
	bnjyvI/XotbJuO1zMciMfrq5n6WPGwC8T2FVPQalr0tpiuKUbz/1JF7nn86sImix
	cxZpwD2P0s/HWQ8cpGxY9nBk55IRPv2khHTxN3UHwWOAaEfmn508RtPtpnuexz9r
	qjM3Bkw+DwnzeTXAjUHTtUOihxFVXg9XJkddSXoEyTQBUvs+p++aXVUfJDZh28+E
	/DlAKUKq3s2/zbzN1fjktNtbcE6bnwnhqfi0JQis+yDNfHyY1LAgECkHZK8bZY2y
	SNHiRxFPfQheoUMZY5o4OTiuSugRbMtKOu/JvFqzb6EIgA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992ndqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:21:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4e28d1a5a08so28496137.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460097; x=1749064897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gLgWYRWzCLunD/qHvyEBxK05YkGBQTqBuXAxV9jh+0=;
        b=oLuDhibJcE1U4O4vM48RTEKFleispEFE+0CNqPXFuUjykVjdJwb5XC69Cg4YDC9+FI
         rhihMUelYodFmRkYQbD8sPx5d6E1VnDtze0I00w1roY9P5BEVUkwSFOCS5ESgNQKuDzt
         hfCtbSD0e3nH+WWk16dpFNJ/eBVXdAC96lRN/cQT/sPFuBflyyluyjpbgZsOwxmBVL/Q
         zmE4kWNApmN7UIgHF7Rh5DjzewIMTvE/1M/mi5OFLxS90amzW+smtQS2C4ss3gvu0GKP
         ZOEsVpJNkIQRe6m561t5LzqVC6W9yPWWOeUnneRhnD+EBA5F/V3CuKxf9niP1pCaQY+x
         y6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/A6bKO0URnz/E/57MC17D2WUqqu7LB0egf3LMm0OCW7uKxwqD9fAsd7SImB5sWMoWUBO683y/rUqa3s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2ipVMAIeYUuTbNrny/mcI4A75NiGuImK7dtPkMZCmw7ElTsG
	m2Oeemh1o+3I3d50AHUky/BGnHsKoSuKPyZedO+66z9npxGvjsp1AnQ4YXkEaFqEKNSu3ETaKwF
	SfuUojaRwP0GvtEaPIla5ki+OGhSmylsB44Q3WBFT6J0GfqOCupeEnPuiQnCLgiAZVmk=
X-Gm-Gg: ASbGnctAZDQibFogYK210um6xe0TPfXq32HXDbmabmcBGJWE11WmsmkHBTuIm9k94w8
	673tMCjEnNgblDp31WSkPg2uAhdEpL95BjCCxGxSKC/zB2mX3RtcKm5i8zXyvc/7joH2dUzMi9e
	T034/Ix9E2jSt/2Lw6olpx8GbqRMt+Gwp5MiqgmrCUKGSVZrUPi/cET/vd/Lpm0M/p9cAybQrGH
	gMOw20T2vVJtafoRJlMpgcb00LSrHw0iIynDTd9WSjK4qqkZwrH4bx+RqUCRTJeQipthPc8QVyS
	fZchlPwxe/reBSS8He43Z1kjpnqRk1iq0++mGlegb0hSsvV57XGZAxPrehPYP2A175j7CKPgOIs
	=
X-Received: by 2002:a05:6102:3c83:b0:4e2:bac8:75dc with SMTP id ada2fe7eead31-4e424107ac5mr16096206137.15.1748460097109;
        Wed, 28 May 2025 12:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERFOoB32HSD5K8ZYFJWnW5A8/+hLXTTrO7fhdopo43CCwU6vsapvR8yzcxq2z2wgo+mX8xeA==
X-Received: by 2002:a05:6102:3c83:b0:4e2:bac8:75dc with SMTP id ada2fe7eead31-4e424107ac5mr16096164137.15.1748460096733;
        Wed, 28 May 2025 12:21:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a6276sm404321e87.207.2025.05.28.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:21:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:21:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/4] mailbox: qcom-apcs-ipc: Assign OF node to clock
 controller child device
Message-ID: <m6nprxug75aifcw6scqpnlx5664zk44neo7v6w6trxfmoe76b7@kt6v5vrdeadm>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX8q1KowtMJLLH
 +q9cZACOF47aqfDLX5fee8hRwiCnBXn7d2AhgRZtES4cscnjldJojdumDJ5MTZIqgJbbyEBg+Vo
 lcXRKy/WwQFc7w+wHoVctD6646DdqPExv9lzvHCvVyCpwGp1mypEN9K3Cvgu2pWfP6q89b25eal
 75gNd6KlC0IdUDVI28oLbTTCzeWtlNUEBaOm8idSHB6XWc1diMhD0f8wIgdF2l6Sax/axim9rqg
 u9gydgJnHk85rCE4yr/JGKkUGlfn5xOx7YrE9xlIYbhSmZxiqKJhc+yB/E5igUvGQ/uqR8V2GIP
 cr0NobCsTfiJNy3Pd6SfEFNnxcHq4Kx4gYM6lTe5i4qZttUDyZbQANuQMgWylpLIHXdg5aHkuNa
 m9Blo1VUNsM7zYR2Fuc2L+2pj/PUn0VT9soD2Vbupim2OHsgj2hwlZ11LrAmgvb43/Y/RjTg
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68376242 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oeMlsxxNoTt8-AEUPKgA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uaxw6fo5PhhNhvcMf8gUmnQjWG30WMTY
X-Proofpoint-ORIG-GUID: uaxw6fo5PhhNhvcMf8gUmnQjWG30WMTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169

On Tue, May 06, 2025 at 03:10:09PM +0200, Stephan Gerhold wrote:
> Currently, the child device for the clock controller inside the APCS block
> is created without any OF node assigned, so the drivers need to rely on the
> parent device for obtaining any resources.
> 
> Add support for defining the clock controller inside a "clock-controller"
> subnode to break up circular dependencies between the mailbox and required
> parent clocks of the clock controller. For backwards compatibility, if the
> subnode is not defined, reuse the OF node from the parent device.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
