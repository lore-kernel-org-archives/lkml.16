Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1671C8611
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124636; cv=none; b=AczHUeiNZXGtGg6lyTogT2yoecTfQCDrfBX+bSMXbIzGTmXH/oro2TWe4etd1dYxvI8EsiDT3eB9u3gI4TMNEp5SngkPaw7795L/MohtF/LDdAsREJPS7C9ObF0CKjbBMxsP7W43BraR571Qlizjwu2/NcDN89++VcJ9bapuKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124636; c=relaxed/simple;
	bh=mKixHPHsl2x8zrPqtK9Kqr23QXdhN1xhXria8CsRP/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BstAVvc/enNzJfHqmnZJMCiSVdDsUS6Jlx8eaIylMz2htL/Jo5fLssYs7g1s+1+E53b5uI21x2FpwLlFhubF1Y+pU9sV6LmTRPzfdzBYrK1ek0VchsC0IU3Bd7WezXsWWCZ1YGr79wrY9cbI2eeQzxQv+219dGAwe5sgYNuIFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LS7+TBNp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS7+TBNp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SDAL1u009530
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zV6PffrVUkzDxC7z10QqpNda
	qNNap6AdYnPmbW8I2uA=; b=LS7+TBNpO0HgMVDFuOE+T2A0ABY3dsKDAlrCnfrf
	HtLl4g9M4k9asawxH3XX+M7f1l9E0qBrHNefGscfiHCOQ3tWNDTWOMltrR9qzolo
	YiT26QS9NW6ME7nB+ELxDFiR5sGzgojdYZ2Giff9cI9+RNUSJ0w+zOwFtgez0R3Q
	sq4MdL/wUxAn9KfJGPwSEkwCwWYwtQMM+kPpI4dk6bu7b8hdD9uSbuflSDPsUF7D
	zWcNhB1bkYg2byQwh1GwmLnrsX5t2tKC0lMD5w+Gu2gIFeUb8Os3dQAE/Z/0THpE
	xSBc6tz80Vz9cZm08B/ahlmP13F6v8b3XT8Jp6ThJSo+tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jprqkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:30:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso458336685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751124633; x=1751729433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV6PffrVUkzDxC7z10QqpNdaqNNap6AdYnPmbW8I2uA=;
        b=QoOgxDLz84UeFDDtT4XMMrBk9Wvr/ev1Viq5iRZca1PkoDjZXcPlI8AcDUJvIlJcDY
         1y10TmJTH8EdzbbJfF24HYpxXKg0dzURj65KKKnqkAFA2qnJlNhSBV9wDb7+o97RJIPu
         LpFZ52LX2VkHm8RTFGmYAJqWLr1ODNXnncK0EWLFI92q/BkZNOX3qzcU/HsJPU+zGnW8
         RpcFiTehmjBtau96gTndKo4DFvtsVDyiqOhum/YyY3NNoUFElqe0VeKL5ou8e34cPE5M
         hjRC/0qVxiR1IfrFVWzDwF07ePyDoHK+Hkzdv1WLMkJ4+e6RQYamIon+02ow/Yt/CheQ
         vSgA==
X-Forwarded-Encrypted: i=1; AJvYcCUnQ3IsadfZXp3C4bWUXnUJQ8JgXheX6aQveAyIdyuuiE3GpxA3Os5GV8rVesZEH9hZhgXopPAdEGgAQOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pYrtk8XbQrCVrPs+XbzRbo1/FW6rHsgG5mi/NqA+9VgCmbLx
	c6qN079wCQbilyf+T6fZrGCegNzARNgvtOZpQfKAgzsnAxBGt7EqkAOtwvSo4kLpe3Mi147C8Yr
	adfcFDHURRZxcBtASZKgITSDaDjSZKH7Z88HMfGFNhtc4pkbzeTED+Cse+Joho1jOk8laDzVqIU
	mPQEz3
X-Gm-Gg: ASbGncux2hQv6PzuZJlJhYVjj2lfYjR/V8sx31HxU6x2UWSX/E2W20WHLCfrjBGjQbm
	J+A6QZtgSnDy2+dEmD0BhawqXlL/r7/LUQJ6Tv9cj6h5feOkNq5SPyQxhTllZcqhdpC3NeEizrr
	DNVGLZmofpz2rI3ChD2SZzjkfJRGG7e0LrYenroM8o3676UW6X9DfWRWZJfseUwttrUrWhPGKxw
	cCNXnRO4Rv7LWkKID66h1i5olW4KrBgbEpTTLRpzPqtAFJhVglCJrhUiM3IX9csOYj+hAur0X+6
	VWm0NJI9NpVctp0OIelRX5D7c9wZW8kMpcFIYmDzMUCISZiyBhvubXlN6iDhJ7UfxHPX462gRtf
	0LJM1zrLGswr1INlsGnxsaEpP/ec8I2xynzw=
X-Received: by 2002:a05:620a:2589:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d4439344dbmr1111893185a.14.1751124632972;
        Sat, 28 Jun 2025 08:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/EwrvsgsuWmlXmk/2zI+c32/xYaYtcpshstsfFwQVESoPxvE4doxrxiYp+KufrnyB1RKLpw==
X-Received: by 2002:a05:620a:2589:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d4439344dbmr1111888185a.14.1751124632491;
        Sat, 28 Jun 2025 08:30:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cd99esm844943e87.158.2025.06.28.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:30:31 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:30:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: spmi: Add PMIV0104
Message-ID: <zow36rolayslylfozehn7f2gq6bwbkfhhq3sq65xu7qzhpaizf@pvfrmgeshm65>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMCBTYWx0ZWRfX5UciiINDv2E5
 xihLM/o34FWh517DT+MGtI6snSNKO8NdJamuK7dpYqEL2txUKh5R0bDXjjYGLw3H1UwHDjuAal6
 +RcfWcQuPNkdhWTcR8pszNMLsDeNm4yuQ5a4axACu5D/eJ+pFZ+qV+500EMmhkKVL7sWVTCKQBV
 8Hhh8uQ0cWRrKjHll45fSde+4zpJ7GpqkqxlpJ/gzv9WoZPJkRwWsIfokQzASYIt5w6kb9JrpbJ
 RKHUBbRvOMcan4fuDOmCUGxBHAbeGvjVhmRIB4HYSLHF7WeJXAdfWm1TBr/OOFTh3iUWOYP5O1R
 zBf7GYTYH1UzWWLCnGH2tgR7W/nhv0ZekxSlXnoIC9BFvZeTIqxmbKOxOLu73Kc+X61PmEhDkbF
 GzXwnVQJYsz7s6OkTqecdBRsFeabHxavqIt1gZEwCi14jV1eraa6U7kAHDXtgL/ZuerMaR2i
X-Proofpoint-ORIG-GUID: AZmeMGAjemhI8wPs6vNq0uk5rgmc-M7Y
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68600a9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=lH0vaW9HGQP9_1ETXacA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: AZmeMGAjemhI8wPs6vNq0uk5rgmc-M7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=895 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280130

On Wed, Jun 25, 2025 at 11:18:04AM +0200, Luca Weiss wrote:
> PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
