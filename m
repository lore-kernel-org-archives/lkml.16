Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F866183098
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081504; cv=none; b=uyg0XmBavu+LzkxvnK6S4dM8G343DGDjqwqIiUGIhYIo6DCin9FPk/BpykVZztjwQxgib7LcbaX0WDkR54KMnq3iww51x74HBujlnwLzi16bQP+RJCsa5n1nUtIkevd9YF8q4bXXAUVs9wf0c8JFcQL9W9aN5V5Lc/GsDnWvS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081504; c=relaxed/simple;
	bh=yi0nJZG9HpJprpjPC17cymVzwqzBeojV3kBquhceHpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpvXRkn+63UPFUdz5WS5qHEGbwnuy+fNA79qkfGfWsWQ9ITEdwFvtiKT4dd/mv/UkeQ7/meUH8Dtt6tzd+zv6qRbBPw8VHnfkdFCxKgnil4hFOvqNCljdUNSFCyE6v+K4EZTZYLARWGALu/EvwUFZQtSnC7IWLpPKIif8/5DPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jopsFuCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jopsFuCM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O4mjMa004542
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q5Ywd8CbRuq6nVjt49lYrhT3
	U7K9EU94H7oOTbzR8PI=; b=jopsFuCM3uH7xTo+LmcRutvUrKk8LvTQ4RzCmBBT
	Wz5jsSkBvvtseKSNOO6c0U9M6h4usQhgyFrm/nO1UGodVGOJewNzKra9ndhGIno5
	CAffzgMWOo/aAFroUIbYMUgMbmHcekJ5RpylhFA+6h52rRgTDlK8mCzQwYJeuNOo
	++Jo+R/Tl4eh+ypL45h/NOnWao13fq+N4phxwPUHWCTDqLOyf9gd6Lv76aHiSNkr
	/1TLAuvwwNh102RQmDTPq0zmK0Vg/dSLSipkZYZqdBmEtePHcxIVqrwnsfIE0mBX
	VCikBpu61ee2fhcSgW0Yl2xdirPWfnAUQm/KMw35xwgpXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc0e3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:11:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so13055636d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081501; x=1748686301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5Ywd8CbRuq6nVjt49lYrhT3U7K9EU94H7oOTbzR8PI=;
        b=eQwoDUuvWWCIkCzcbbez062BA8PqSB1RXSwc249OgqZW528To6oS3Yaw1cd+s1WMIX
         kHWEqGw81xs90QEEhO20ltMOuk1RhBUfy1NqTSWR5RinpcjXd72rZKd8apznCIvbKH47
         SvLIe2mH9PE5R5D8I7+XdzxxkkDlbcO8bb60T0Qn4nKN/3NJDAqIVct/yDT979eoLJf5
         yNyeeQMNcNCto0R1t/6tuKB2jTprvw8mQMU8EIKevQxoK0WjGCt536p8uhsG7G2inQ7M
         krUYau92YfMF4S6uxXIgqUy1FhALmG0jNLDqW9nIhUlYgMxZ0dsKN7W4RU/Zgm3QJHqa
         AAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmRq3j4mZsfCiGf6jsKjGKr1u9avrWPue1xgxR0xbsa0vNTNda/0Gi6/RNZU8ZDlmjNw/VlnVpd2o0CsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZqM2vMpRkalRLWWAm6YMBBEwqMUl898DI49HIV0Nuq1Wp2kc
	oPOux1Ay3AVSejqo36AjVvp3FM32c5DyDiFCV5p8miPz7GX+xWWmM8I99zRFk2GjYi/Hjpfzu/E
	mH/W/rHea90KQMwx/OHqHwAQ1ptoNy9QPO5siOZ+NNftewVic1Yz4S/bm8loabbK7Ykg=
X-Gm-Gg: ASbGncs68gRJ/lVeaJIp3TeatnlwW3Zm7SnGFFG7Cu40KY0zzZYjEn7LvV6uCCdscAQ
	88b5eaf4VIWQurQ+2Vj8yJ874T1qK8J709m4iBKwK3EbxEnidvDeng9bZV4Gje8uHZM+Y81pNmb
	NpXsXUk8HIbslX3VlmnYE6dfJMh9b1CI+SK9UJ9GLpMY1AOapxFnnDiQgSXaHKMKKfZZ6VUTUjw
	nX/EgfZCLqz+nS4vefoEy10kcGiNcPXgmGsOW9MN0WOSjX/gVwAhiLokJNzGouTsyIcn25BMa88
	ghd1K+yrJ2s7lO7l+2Em8kSopTXS0BSiQ88i605o+7wXR1Sqzegqzx7samWIFnYtkkKUbxsMBsA
	=
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa9cfea4dcmr46563446d6.4.1748081501037;
        Sat, 24 May 2025 03:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3xlcfUJq8nA48ODJlNUBRaEf9+7/QJQDSqq3iA7gxZrJiVGayzAZZZ+Q6hrv/sh+JeoK21g==
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa9cfea4dcmr46563106d6.4.1748081500681;
        Sat, 24 May 2025 03:11:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c78sm39724731fa.36.2025.05.24.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:11:39 -0700 (PDT)
Date: Sat, 24 May 2025 13:11:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
Message-ID: <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
X-Proofpoint-GUID: oOZZAixEdZp__QUaOepoWr6uyq3GIQKF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5MiBTYWx0ZWRfX1Xt/0jOHHdlX
 WTkZMVF3PT8YVVWONB2eLSLQdNrmBLVeegdEsivEGVfT5yXTSgE/c6vVQYcstE5cRHFwJa+TIPI
 JxWb4OqeOcvBk1Di6tjxCdmooU5jKEraoYuQEeYyL18J8nE1LIglGz/FYO1CtONTAb+uVydIC8L
 ej3YAZhSvw0HTOG0MGwtTuVeBjWRaI2XeaKZt5NKiBSrnpNsldGn/1tTfUztUGmRKxtbc84C6n3
 lvGN4fna4zvyFVe8Vmi+/bPF7cXozcx5WeVcVoMaF971RqPj9/IEb7I9/MtQI5FB+QZoddHsxoL
 +6jelYBHPqHmKfPXSbmgjnSPLmxEhxJZAARMnRqybTgMfKYDXPMpo1Mi63gfern9n9sdFlimIUA
 Sc/n26YlY3rp1WZe0urH8hHPA9oQ856kGSX+Zj8o6H99gSbs9d0HBA55jKnnZfkWsmfRJYfI
X-Proofpoint-ORIG-GUID: oOZZAixEdZp__QUaOepoWr6uyq3GIQKF
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=68319b5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=cusL2G7gvvxGUya2EAQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=814
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240092

On Sat, May 24, 2025 at 11:19:12AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Thinkbook 16 appears to be an X1 / X1 Plus only design.
> Add make targets for normal and -el2 variant.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> +

This will break without the next patch. They need to be squashet into a
single patch.

-- 
With best wishes
Dmitry
