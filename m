Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D91C84B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620753; cv=none; b=e/Chw91iA5F0owBFtpkwbKzg3KR6RlGo0Jnd9aIneIKHe/R20aJFOAxzlRBsdonjP1JBIGXeFMcomK9jPqEOLex7kMqM5VrQ8B5xoGFqRZGVge8aCFZ8JEHsQJnmH0jEyS4bRka6ciyqy1CVYbUDXpIPLGKYQ8FTYvz9z7mddfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620753; c=relaxed/simple;
	bh=DUJSNwx7FINamTyBYdMyeNWT2agExVQ7nXIfWrce7Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8qnbWG2UWXOu1wbzSciTwVXq16F2b4gyHlt3jv02U4xHq6hqTh50VnaUEL2dUGQEsdPQYqL5KhOKI/eCMXO7xqYvvcuIUDvL7e8bU3jg9LMOjTKg+A7k5AOTyIjxwxr6S9Flu6XX0HnlDBTMOppNzRKBt6P4M73BTf5UI8RPhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBDTP1UP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBDTP1UP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532APmBj000927
	for <linux-kernel@vger.kernel.org>; Wed, 2 Apr 2025 19:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aNv+Exi/x+6zLqx3K598mkaN
	UBCpfHCqFlxecl+OZYQ=; b=aBDTP1UPhADmOUbn7XNTxM1ATs/b3BpxbguCZ0mG
	BTl7b614oFagq5xG2wiO8KkGXLRP+mmQ88ymN1Ubwzr4Z1UG9/j778JSNhl8doWz
	wvFcJNxxZYg6HcH0mdp7xPv9QucGji32dIlKV8/YRok2nLaTzF7/SdF3rujmTku6
	Oxg1BS31rIsIzMjlH0os1UWySW46TpOQgy41mGK73fp9ZVIDfDq+ma7s+WP0sZfm
	7zt55jBgd9hKo0yFItk42jSIZtMV8z7pF4EmJPDDn96WpbgmqJlBzDt6eQh5rJUL
	GXpvazGdqrkkaXoKIzMg58aIwfI/juc65r2MdFTHPjlvJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qmsa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 19:05:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so25609085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620750; x=1744225550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNv+Exi/x+6zLqx3K598mkaNUBCpfHCqFlxecl+OZYQ=;
        b=cc85DsUODRzyLFBhyUyrgKdazN/RFt9BMNyb9dbO6LUufE9R1uaUo7rLvmB8Koe8Bz
         leSELTieZe1JV+9GPBiQ8wNAZePW6sAmmaM7jbtbgIiae+pIYgkNURYS9bEnY+DOBnp7
         wR7Jb4skG0BXsgb848nckmJAZ8xjAzzdTLvBnoGKSkP45/tsYtptInvh5rpsNXvyY7Bw
         U9aGTXaYbr2JOMeIbGuIm1OlUuDPdSLazuvF0miTRno3IPqC/aCUgbEIlGBLI553Du8h
         fTDnCKnkrqvqs8hz0VtOg+8yz91sVs8SNT1s6A2Ns6IMIYIE8uE0tOB+a8XmcY9uYht2
         fUkw==
X-Forwarded-Encrypted: i=1; AJvYcCVDf3N51MkhileHJZgzHAZmMEezv2Rmue/7ibxAB0ArhoX2kV52kcXgXGYdwxEIww3ncDF6L1ieTLeWsAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YziOibLMoT9yTzIA76NKLqFmN7PgpEFcSylhHnpfBsIbKtVDle0
	2SYQtfMFcdp87kW+KL54xKKcSGPqQenMKZKUoYnUYZskqGydu/dgqAimax4rOTqZizG0hfZ6+Mk
	Dr95nDJIcuF85OM3cdKjKkeW3ijaJ8mHFWrAgVZAJpUSR/obZwj8vnenDqTsqAg4=
X-Gm-Gg: ASbGnctv2kcwEiKpppDaKpsSS1LU/fAV4Ae842v47LWY7HaXfZM897hQS3mm9UCVKAI
	dAJ79ntmbhaO4ACZk0gONwZLD8wqflGsyIHEJPUklMwPjV1rMoElLYv40Qb7f9afHntCx3Jrcag
	5nYxTcoYDuFUslxgTUZVDsyT1Wea7/OxaMQpLyJwLRzHPLLwHfaolY7Rs+RdDNcPVJ3l27xoW8I
	+QrjqVlaPSDAQzysEFMvy4AypAOqSF3KqiNbT6uq29dpYbMn4M9958IBpgKauUcMEyV0E0mENh6
	tPJ9cZR+O2Luybo4Rsddb+NE0slsYrsa5dMQRxGAtG/zvxs8TlSaUwkIibFDAomwmrclUSKFkR8
	nbco=
X-Received: by 2002:a05:620a:29c7:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c690896fddmr2672062585a.48.1743620750138;
        Wed, 02 Apr 2025 12:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8J7P7HnsNUJiKk+d80XC3m2q80+v0m+GfXwPH2siZjMmkZCvyDbrkLkhIfmK680GiWDm+lQ==
X-Received: by 2002:a05:620a:29c7:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c690896fddmr2672058285a.48.1743620749776;
        Wed, 02 Apr 2025 12:05:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959fd16sm1753250e87.215.2025.04.02.12.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:05:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:05:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Message-ID: <pqmol3quk562bjwnwyvtlzgukabl5rc7uzmco3b2ossrcn6jsb@kypjeag3zrh3>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ed8a8e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=D80HWN4mW-IyzX5GbT4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kelzEm5t6dgk1jFW2137qaV-DbSi8Fgo
X-Proofpoint-GUID: kelzEm5t6dgk1jFW2137qaV-DbSi8Fgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=663 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122

On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
