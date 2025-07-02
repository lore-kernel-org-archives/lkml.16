Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1724DCEE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496624; cv=none; b=DqX8cyj4Zwki2CgvbWw2MKjggdEqordVgG9BVi8R6HfOxRLVog4+BECHaJUPp8YjvdIXXz44zFz7g9d2mlev3G6G/8G/nEV/D3uew2SRdNV2bsBxlMcV/91UWIyOkDPKnmptOANB0yHAh1n0MWjPorc0JLjXc/cVzKyLQlOH9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496624; c=relaxed/simple;
	bh=8PXm+FpNtl4YUNoKWPG2VJslFlM93iGTJXz8RaqTStk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLjk6nIyV8OOU+qg2DuO37ksQ5Je8qqrn3CUDABPrMZE639Roqj0usvZ8KYNXPATGnCHhqN5IxG+9uoZbj7OamRkJkcA0pXcUSaZSaXXMs7KETVHP6KwWmqO9u16qu7LNKxoKc3BRAlVpeqc1usBcrSP2rFumW0bmXgYIjIS2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgVGiyNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgVGiyNh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Hu0WY016094
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 22:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KNJiOzzbO5+h4Osyd2A23sTN
	+JdE2BR225dLptBy01o=; b=kgVGiyNhv35DGtG9SjDuoUDcJO/wY6Czd8qwyHte
	KGXX/8vqOOVqLSG2wUio9lzqneJKABtjiAFXj+62PsZ2jfSn0sVFy9Q4ERBuoRN9
	jfl1bQcCysG3n+LdLRa+1iwxFirCW106lPFAPW9NjHyuy8/4bYqtdiv2qRQJpdFs
	HFXZL31e0SVVDvw/4hKQkW4k3YSeStn7abucCcYmd342MNC7PZz56ZzrRt6QyIRl
	yhokSkGhMHGcQxPXLyUAETdbt4IINwqG4Rr8iWaKE/mFOD50xnvlt1lHHgyQ7NOY
	DNbNlMSMG18DO03XWoESo0bxIx8TykJoR1bxl5Yh76BZJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jjq89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:50:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso1114018985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751496620; x=1752101420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNJiOzzbO5+h4Osyd2A23sTN+JdE2BR225dLptBy01o=;
        b=nx52HLDmGGe23CdevHvuhXv76sGhdcxWiLSKmKIK3FEUtkNMPaQ/RGojQ9THn0q9FD
         W9Uixm/6PgiDWejyGJ6SbRWEPK8qZ4Vuks/rHH7uoc1Nno1tABECtPfd2ju3BoSgVPiJ
         MXB+4bMbK5kOADyUSXQCOrYh0STywoBS8a9NY6x6ZHXeKF4hXCWeBAoBySPRNvCQAnZh
         jRK2KwEAJdoylwDsZw6trdzFHXJyKR8g9Ex6mLG08uJrpm4lvUUEr2SJEhx52/XXULwB
         aoPhQNWmMg/d1bjggAB0MK5KvGwrY3fQUrxYFJCZhdEX/VImVpVRHLsP6ZbvhKNdYfmv
         d2AA==
X-Forwarded-Encrypted: i=1; AJvYcCVyzQEMFudpznA0hoMKjlitbVIx8aQSihaCKdordTK9E92e3Z6mrx07Tew2JDV7tsJyV9b0SZUhVvzgdJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEU/STxipWa3aB83/uA25hzk1g573hDXAGr/+7FUBkeQVfLWXN
	hASgaInjo+vFA5uTSdOAYsIkLquTitn7I6H7xUBUZJCX4wyox22UBMFijW6KKv2Ta80tfLXrRV8
	BwWtUoTes1rNzcfPTVyljZkaI/xnJ3e64cXCMvn4Wq7kfv2ugxEX1FQ7FGq1qjpcgg4U=
X-Gm-Gg: ASbGncu6eTkSE2ND1bDi2uQRxMbuoa+dXGIK/GoX9hgUVlvx4grAv0+uAyM7sPHYboe
	rZBzO8/rO8viv/BVNaE77MfItC6c4HNE/eiT1VdO7Qe0gmK5Q0Div2CKjEdxisIk4fkT6OHCP09
	KN2aRN8tdoNu83nXRui4Jkst2Tgp75wyBwvjKS9pmVE+QvMl5VfNytgiOdWxFTYAjGHZ2GQGWxf
	PMljv5zQO2XIHvSbTB/JWL3StVoqtQA1T6ZZ7DcxdFTnrYAKhcTeLOmudEjeg4oJ6WeIDcCUNpN
	fzSm5GM9eZwVzvUUq2AC3iWb9U3o6acfbOTQ0I+A4HWvx8UNl/ug1SiD8lRmpqpWRyROcVnI90R
	/ken6YpTTwQdqQc8+PrVgtQtCkZDWHGALo5Q=
X-Received: by 2002:a05:620a:4893:b0:7d4:4123:6609 with SMTP id af79cd13be357-7d5c472ae96mr589963785a.39.1751496620484;
        Wed, 02 Jul 2025 15:50:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+NZRCRf/AYUnKuCUI+ZRLu8rndWyb5Z3cOZJcoFUG1lXuZ9XMN0SOy8F4eZfw+RGK5ssdg==
X-Received: by 2002:a05:620a:4893:b0:7d4:4123:6609 with SMTP id af79cd13be357-7d5c472ae96mr589960885a.39.1751496620103;
        Wed, 02 Jul 2025 15:50:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d1b2csm2244447e87.194.2025.07.02.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:50:19 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:50:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Message-ID: <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6865b7ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=WO_RV84IVBc_PpyxV4YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7B5rWFEH1OigK0ZYWe76SiNcTBENRe6S
X-Proofpoint-GUID: 7B5rWFEH1OigK0ZYWe76SiNcTBENRe6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfX54DeO8HMQOeQ
 xJIFgg3Cnkk8d3/h7eDBQ4/0ipi1FzGEFJSVGS34FuP082te4jQ+A5u2GWhTvbkgtdLlSW5nhAP
 AwUhXMKlbnFYF/+rxPzylVdvGBTlBtBGd1Rma3l2K53jwuQGn1jhq/xpPOdiSaktG+RDh3mAtdf
 LAYSTp6Ov3JmUwq4mOSKwOBdNGkT1uXYy5xtU/r5YKdDK6IND+EaNjS3/bTgVjp+co66mdO20OC
 qQuCl+ljAsCZewDueTd4mMKhu9nQAHvsoQjNdXKYCUfHl50sZbAH1VH/+2IdjOHx8Xi0O2hto9g
 6NaKHlmYFQWbitpvNyto8tz/hdH6iOPodknxgVQAsLvMWbGhQKDsqcL9G1uePkIY0y3s8nFKvXa
 HaD+c+VI+kD1R4dpUw/qNM/Cn0dhtT68ciJ3W5i7Z3Sdq3WaJjxo3VwGFRGta48fXCv+2vkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=881 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020189

On Wed, Jul 02, 2025 at 10:45:33AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> pinmux_ops say the controller should be strict.

This is a strange commit message, shouldn't "gpio" function behave
exactly like that - mark the pin as a GPIO?

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8650.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
> index 449a0077f4b10666ecd9dfaae8e0057a91e181a6..4ab0e75079cd5dec1d86835dae30c9a09455c7f3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
> @@ -1328,7 +1328,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
>  };
>  
>  static const struct pinfunction sm8650_functions[] = {
> -	MSM_PIN_FUNCTION(gpio),
> +	MSM_GPIO_PIN_FUNCTION(gpio),
>  	MSM_PIN_FUNCTION(aoss_cti),
>  	MSM_PIN_FUNCTION(atest_char),
>  	MSM_PIN_FUNCTION(atest_usb),
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
