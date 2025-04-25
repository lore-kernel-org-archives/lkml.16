Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D31192D6B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610332; cv=none; b=Vw8ogSaEIztKkzQ6pT16eO3xqmTBQnUDgCw6awy7QJbz2KBLUdkmOEfvmIGCojfJ1E8eJwpvUT38ciV1DZe4cu76EDS0+DHegQ69aRJ/Of+xFwlPMAR70DZyxZqXsD1crhv2k/JJN16iNqksUFsaoqeIEzZ3QaBQ8tvCHezABb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610332; c=relaxed/simple;
	bh=H5FcDUxhaYKM5O7LhjKQRfFPg/7+kzeMsnb2t9aMKbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYIAVhNxsbRMhq3WT0qfFpvIoccZpKFz35USTRHtU+kXXaZZqDNwYpBs5EVaQXtrfWrtiB5AxRM5q3CBa5Tj0SKMcw4veEu9w4KBy0kgkOMGEWmGqWK04ZLs3m8ut3lTiWJY4993p9U84uLbYNuOJljezS55Vg5pGCME+artcP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOHrzfnn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOHrzfnn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2AU004236
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LOfYZMQ/91UMVPvEeMiVPGWp
	jLbUi9J9o6zxLIbUMs4=; b=bOHrzfnn4wUWvgNhvCahL3AVVJxAg9wKAy8IuvUT
	Rzldm1EwPbMGbgFVOAp+nQOxYqnc/KzhKAHNeOAoHyVKCwuqRj8wFlZ67F9weCJm
	Cdxme/glcgV6KJaPeNNkrHzYoWo5gSKiHNneuddgLgTjAS5waLjVZCka0RYbVbUO
	7+RCk4vYEMgg4Ks9/h96tu+QDAUoJQm75UXhTtIOWNkxnLwkmm2XpsoBweYBKtPt
	oo0bMPf7BqPAaux5FQngQ4TV5cBHCRTyaA+eImyPefazRApi5j+Eq2k4lNM8IJJs
	dmqA6nbHou6BKAghAJ8Ael6L047EBG3oxRIxa0Lkx/4vtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a70h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:45:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff55so674138685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610328; x=1746215128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOfYZMQ/91UMVPvEeMiVPGWpjLbUi9J9o6zxLIbUMs4=;
        b=NPm9e9Q/dNU9AIx0N7S5DwbzPBWRWSXew3qj3azTx4W5IwxxutXTd7sPMDXLKRhvwa
         AjnXkzNM+c/wAt6mQssQCbS9HVZsvBt79jPHs5QxknZNC1A98VMCtLeMnTmqyNxm0J1O
         I7B+S90i+e4LVPCzh+Y5o6om+L9rSPhcHxheh4IY8qCKdvj64+YXs7efuN1ODaHiz8yA
         ptpQhJm8zVgO+nfloSciXt7bolhA+npeW6mZUDXmZp4EAqXmlhZB2S56p4dd6uHK5hd/
         k0mLdiQAkyrlpo8UxNAabYJmn2mepECOrvTeLpi8Rc7s3TMwCerxXwIcQS5kzCjicraL
         47KA==
X-Forwarded-Encrypted: i=1; AJvYcCXV2cvGszSyS+3HYHsPokZp6BRNoU9UCVA8O2e8g9k8AAVGriZ6DzE/PEdoIimbt58XR9LeULlobrXiADQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWj/2exOcwZODnBiiRHWeBHo/538Eo7ZPqOvFs19Uf29Yw9oV
	Mx+YABIxYq8MgjOEn0o8KcfJn0zDtogygTlWALPoIXX6XcAjyoVcTagfroQPju6hZtcngs2OrOc
	nKWiwNzxKCM9lp+VdqIlI1AeCYCo9qdKq57OyPIYj/MjyKtANL5kDjZu+lRB3yxw5STRx1/I=
X-Gm-Gg: ASbGncuQyZDz9F0kBEnZ9YXOMpF7uXZbyKrT+/BV/QFQIl7XIjmBguyFciGiTPjf2JD
	okm53zjNP6A+VnJ5FbTYk6TMpGXuEtdRUPxUaRu9XHhJTlAIF8t88be9cHMvysKJIS8oxcJah7m
	NFOEV6zBhroJT8+cuV5WcfT1SgC1TWr95EKGkdSbG62t2vQe1BI+SxGksUKAFviIGZvoitNcJ/U
	m1rk4Rt872PIDVF8q01bsv9pmqMXAWR+syUqSW80s78VjFIqbDnpgEQ4UdT2UOtFbplw6BMqmam
	HtxSHNj9FHqUWneGg1iYfhKuZNfttYVVwsOXcENrO5EgB7xDWpGz4VN0J4CIgdDcwhwzquE+azA
	=
X-Received: by 2002:a05:620a:394e:b0:7c5:6291:904d with SMTP id af79cd13be357-7c9668c2816mr131908685a.38.1745610327838;
        Fri, 25 Apr 2025 12:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0JmO3FSju392Ty9lmH7ZNg6+Chjqio463MH3nM/hBIQmh+4nIxhv1/ja1zdDQGsYiMwJpg==
X-Received: by 2002:a05:620a:394e:b0:7c5:6291:904d with SMTP id af79cd13be357-7c9668c2816mr131904885a.38.1745610327423;
        Fri, 25 Apr 2025 12:45:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb48299sm8806551fa.32.2025.04.25.12.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:45:26 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:45:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom:
 x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Message-ID: <sxjcmkb5iaevznx2ivmzjuavriu64f6dkwu5xbuhgttaqh3tm7@hbm2ss5vea3l>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-4-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416094236.312079-4-juerg.haefliger@canonical.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680be659 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=DfNHnWVPAAAA:8 a=3eXJRAMpK9HRtNitGqQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: dchh2ByrCMBma0RF2LwFf4EvfsCjeyXm
X-Proofpoint-ORIG-GUID: dchh2ByrCMBma0RF2LwFf4EvfsCjeyXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX+viYW5WhdfdK wR05Rq5IFpqSBDuWhIIMGi0IbayJp8gp35JvjcyL9yOs6UlNfO75IZ48qw4HgN0TPwiRSUCS0HZ H8MkO8I8xr19JCAgD8JP55AC4USUO9lSca6mt6RahBolRDhVMsxC5DG2ft7P0hAInlzqNaIo4Zm
 6W1Odwy7KrsDomxII0/p0CEvH0Mnt71zZZDn3+ejrWGVJ1wZ5It190AAdzMsl1dV12bQ5e8CXz0 xkD2b/Fy6nrnm9GrMcRxWUOIv0QbKcWv+VuxboeRBQIAGJYNnL3zdf0b1YwzkPq2ewGLqoZ0FcH 6oCbHnQCFxrRHcBL1mBlbuRh6Z8JUfl8bSztY7K5cN0duIDqjBy/GfIOPkOGM4hM6aojuAIVImE
 ebqOA/wnNKJxFIBb9+6K1NqURd/W4FDFx19wIIAXWoFrzC+VP2/uFV2pnb55FOtjD6VKKhT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On Wed, Apr 16, 2025 at 11:42:36AM +0200, Juerg Haefliger wrote:
> Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
> seems to be using the same baseboard as the HP OmniBook X 14 so just use
> that for now.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              |  1 +

You can't merge DT and driver into a single patch. Please split it into
two parts.

>  3 files changed, 32 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 140b0b2abfb5..732cc3f6a220 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -293,6 +293,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> new file mode 100644
> index 000000000000..4ea00d823693
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "x1e80100-hp-omnibook-x14.dts"
> +
> +/ {
> +	model = "HP EliteBook Ultra G1q";
> +	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
> +};
> +
> +&gpu {
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
> +	};
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
> +			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
> +};
> +
> +&sound {
> +	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
> +};
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index fc4d67e4c4a6..e7262ad11509 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "asus,vivobook-s15" },
>  	{ .compatible = "dell,xps13-9345" },
> +	{ .compatible = "hp,elitebook-ultra-g1q" },
>  	{ .compatible = "hp,omnibook-x14" },
>  	{ .compatible = "huawei,gaokun3" },
>  	{ .compatible = "lenovo,flex-5g" },
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
