Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07681A7262
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971307; cv=none; b=dUUFoJmTve1rbP3C3P9TPuuVFR5ty/9K/dyxUKja/QjLbNShrQDunVunI6rWwXmrnchmbXLDSKSSCxET3ypuJXFrS9jh4Fg8MDjnGaPywx8ywbRKK1idicuSfmw1YY6jQZ2rBpTqHyio0OJk3OF+X1bH7EC8VJII7YCrL/q30DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971307; c=relaxed/simple;
	bh=XkrNF5IKgdbmwE3IzJFE283KdYEz6p36/+80dwU35/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7pktwAO5rQ+E7NooNzCv/R9/Xk0WK1V0wYCZj/GOqlQQAc5z3jtLDfpenYyFR9wKvPdpiFYjw56MA6QyfIL6wkZAEBWkFL4OxVhO6zrHd7TAnNDbNODiSJBoOiGUZP5Y81If1LkNEqzzqTNpdJHuqyZwL+ljxAZpIrBz87vbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CR/Cg4of; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CR/Cg4of"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536KC6YG006062
	for <linux-kernel@vger.kernel.org>; Sun, 6 Apr 2025 20:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KraUReTbfdbYDuzqBp7Ihx4j
	Rtjr3IIHdNN137Us38Q=; b=CR/Cg4ofNiFjJSZUEE63VTd/8aEf77II2VjB23BB
	JEZfvFFFuMBf/nKt0CcBKAXnDtcUiYLjveALhwHs4o86yUI97QDkejf/CrcQeh+4
	4r0o6UPopC54fDxaAV+iS2+BXsEdHDr5erCdUoD6sBs5j01kP2ogx2meASOF2C1u
	/0fypDld+QBjETR2qWyuzo13MOq3IY8/2+yiZ2UChgR31aMqDJtG5V4aaXYYo1RN
	kDh8JFKVqEEpPflvtuc1A63t8xGWiSPskENzg3V1UbJ99h+dNeGatsWc2k6iBygs
	jjMWJQJ5sFEDeJF7dp9poi8Wt4DfROWO2Za1/Ewk3wxdRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcra9tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:28:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d9d8890fso902338185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971303; x=1744576103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KraUReTbfdbYDuzqBp7Ihx4jRtjr3IIHdNN137Us38Q=;
        b=dLTNl1IsWlaZfwRLDduaz7WIQGAlxxJbbwHTtW1TVlMUb70y4GQRMbF6sobaE7y9jC
         +LPeOPBY6jcN9iwB6Okkr2Mz7CC/KPIJvRyI0W7ZWzxhVrAb5NQvfyxIlYvsEJPc0VFb
         gNNBKdTd5Z1LiaGdPaB3aQYI2sWFPQ7s2wvtfHG/AC61lZTWlWu+m4Qs06M59L1CMoyC
         TkDMpdQWseDKlRLSZNdNTuExPrF8pRHeVPNZjV01wGiV43j7xwVAu78gOTFmcnBgnbK+
         1BrONVtaryJt51NDgeP9RwoEp/o+p9gir4IpkGu4lNq7OgWw0BxPFRqFFCHLnJhwlS5j
         uQBg==
X-Forwarded-Encrypted: i=1; AJvYcCWcuMM2eUdpom+gs8znJSIxjBg3+uSVDM/qnJosC9dj4NORprJ7yJkdmMaFr0qoaGuBJyini17J4PRIO8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWm+oe/jLhkyUQ6lP3Hv7QICCuk7XHT45tMhVlEL1J5b2pAgp1
	Tdy+EvYCltzxJkDKo/D4ZXMDmZI2aWApekaczTamREPqIjAF+J2wwMycZR+NU7/Vu2+gHSvwkRQ
	LjnKq8zW1u74uwhgYYgJOAnrKi1rdlRi/NBFpbzOGYOFO92QqhbANVVgs6+LGcNM=
X-Gm-Gg: ASbGnctEINTT5l8I+D5CRwGYqPl8foa+gs89d0+iKHKAR9HpsZyTua3fNR2S0r5RFjE
	7Bsti/LGTORLsvoVnVbYexlKzHCbjJQvvrVsgSiwWy4RFcTEis/YC0YeQIFehBLZFy0VPcEhdm8
	8AphDsWmDX8wpSTbZraPKT6En61JaAghzS4I8d/STADq8U1sgZ4TnML0il4YzI0tQOUOIy13Qy2
	gzWqdy9cJsQok4sdP44JIMPOH/7DIQqW6lN8GoRhh64hjjw3y4V3azK/fFm7RER1R5SHMMFOyQ/
	XfD+CverUKtbWO5bnFVIEd5vtWA1bh2J96139HPTXztXxH79ne6dNjgYx5oZ3Bm3L7CDM40IX6A
	l9+I=
X-Received: by 2002:a05:620a:c4c:b0:7ac:b95b:7107 with SMTP id af79cd13be357-7c76c97dd56mr2164282085a.12.1743971303621;
        Sun, 06 Apr 2025 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwb/e6X56ETO5bMNkfPwNntaupGvtIBH+LPbaIfir2usR7vHOmcByvAIoN+1A5kl53pvFLGA==
X-Received: by 2002:a05:620a:c4c:b0:7ac:b95b:7107 with SMTP id af79cd13be357-7c76c97dd56mr2164279785a.12.1743971303279;
        Sun, 06 Apr 2025 13:28:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (87-92-196-151.rev.dnainternet.fi. [87.92.196.151])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671ff6sm1036425e87.226.2025.04.06.13.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:28:20 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:28:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] extcon: qcom-spmi-misc: Fix wakeup source leaks on
 device unbind
Message-ID: <y3ifckez3m27ykomnni3jzwr47gzujmh6g2z6fbsnsofyr772d@2mbkxus6b7xc>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-4-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-4-8873eca57465@linaro.org>
X-Proofpoint-ORIG-GUID: mBp-2Yk96XLttU09LBHE3maUCnl112a-
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f2e3e8 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=OTAToBYhIyEwkxHp7GKTIQ==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=161-1wwXmLm0-wC2vyoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mBp-2Yk96XLttU09LBHE3maUCnl112a-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=787 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149

On Sun, Apr 06, 2025 at 10:16:42PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
