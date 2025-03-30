Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E244207F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743355344; cv=none; b=kPtY5uJfixN9g5FG8F1j1Li3icLSpSnGbLl17wXGP4m6vugcQ26PLcgCfx0DK7b67ayBmxqaGH8aLtjnwGotMOopET6bELuR38vJ+uGEwPkdU5TE7gr+MvbdQAyFDb4r/ej845eVOmWZn8kIGBuN+0YM1FfotCUKt/GgX6xCMhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743355344; c=relaxed/simple;
	bh=JW7Tzbq0ChBNWMM0495c3hXOPTiCIY5D51ufU14wtxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuVl3iOfhQshvSbTIUh8IbsEHit1NzHW0zYBjRl32Qfap8M3wkQQv0pvFCIF6e3xLau+LsmlMIsHgclawH8gkHmMlopCT9H3dYd6bulH0sQ01PPtreOahJY2OEjFFFhWzRQGZKxLI/Y7BeUGKoOSEp0qX728qygjjQL3mVcLFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJa85vAo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJa85vAo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U5TXBd015511
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MpstrBktHoiPo2cjbWcg5qOx
	X+BiuBgnPlKTlDTx9Zw=; b=RJa85vAoxvvC85w5M55/qcng0Svpd+QE0aSk+oim
	aKts9P03N7D24lfioMjfFQ/EtGHV8zxXdjTOQ0JOGD6tUiyKl6hJn7Td74q76Yjf
	DQ+pCWcelqvLdOaBwdKzFzufU584VNrmKNjVNejN62JA71gLXvIq+Id52PACV0P/
	5Y2XhNLQgYeDOrcHXMVS8BRsr/v9+Llk1lcyNISk550WeoD8ijdsAR52kQ8Vwbfl
	KWK9HSV7usavMjGWZF5KmspnQWGGQLnjm1MQd2QVt6pN+Rq9ij53y8HCVlo9ODLb
	45oVSG57gdba7Qcoq+KI2ViiS9MPK0YtqisWdbfUweQzeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ntff7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:22:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f7210995so226862085a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743355340; x=1743960140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpstrBktHoiPo2cjbWcg5qOxX+BiuBgnPlKTlDTx9Zw=;
        b=L+lK02CWzNn3R2RRHt3P+qmCMKFfcfaOFUjyU/R3xDwPxWRIp21pLV2Rxsz09EKMyB
         BWbEdO/3qu+f7IP2iynxx2QZpUTrRCBJ2nUxjwNT55VXtMplpGp2aP7ZmAabKhrkOWVz
         dAxh2uyczIAdexkE/AKJzXB3tCt5HP68YnQMwSad6d9HCCnUj+c+7jSo6ZxLKn4j7RoX
         4y3A1+zGcLyfzM5YlTbx38cLHj+B8zxRJ1xnm12R6O35w8ffckXLv25ehgr6b7jqxtgo
         k+c85ymc+y/dvszuq/3mMYylbHpfa20s9+C2J6GOX2AyvNerSw/ONjAtpsUay/M5t4fb
         8/8w==
X-Forwarded-Encrypted: i=1; AJvYcCWJzukPuDaVnQM3HhY+teDE8xIpBXb7qsAZPqFr9u/gj+Vc9UDw0PE/mEIi+9RX3cuvBtbinYz3p6BQZgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG61AHZJYRrCxqpX/GKKCgVslNO5qg6NW/pZpL6IJYAxb6q7Us
	pV8hdRdxVeSc/AUu81QaYPh18iyiGvkFlh/5Z27SNP5I1tI9B/nUgak7amGIe2pCkAkdaNi41ML
	6L2UcnhKJ1CHJcOq22Bhzk5X5ZWU1XqkaHuvFSLLbEaPMzj2mKbH2hTRldWFzFPY=
X-Gm-Gg: ASbGnctoP24i3sG5nHV0Sqo4guXCboo6OBI2SHHD+dDXqkfKo0JY+sx+FHfQ72o9ME+
	cm0IxbbsBzcLnF0NInX+3NFtfQ1omUUmknWltDAvmA7ehQhrUEkw1JXEBXIO9iOgHLf3zl3Vx+O
	W7DeKasE9S1Ke1h9rNoxYUSFnZmckgiMvzxiHUAuwL4mxrLNF92p89DR9k8Z2/8fSUwnbw7LTX9
	6J1waefR76kNL2oAWGJTRmuxakWMSWqEJ6nqkguDNOnj69lC7P7iluSHj1jZA/bIg/nEddgvBDB
	L0/FpTLQ8DcOrJJQqq3xtTjREEzwk6Ap8e/Y/m0hgdeww9WK9x7tACYQpPkXuKzh2D1NJtnQTAr
	wHuA=
X-Received: by 2002:a05:620a:2412:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c5f9bf8935mr1234068885a.22.1743355340527;
        Sun, 30 Mar 2025 10:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSoBC4dUGhh5eAY7d9B2uxFl1IY0/AMu+wvbdzmOGdBqnQEleuLNcum0aJAyOX+e7Wh6kjiw==
X-Received: by 2002:a05:620a:2412:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c5f9bf8935mr1234066585a.22.1743355340139;
        Sun, 30 Mar 2025 10:22:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1a7asm931739e87.86.2025.03.30.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:22:18 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:22:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Baransky <sanyapilot496@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Visionox G2647FB105 panel driver
Message-ID: <eni3k3dj5le52bjpi6m2yurepgnx5u2wijb2ds6vdivdj7vi4w@2stfkhhadvud>
References: <20250327163750.986815-1-sanyapilot496@gmail.com>
 <20250327163750.986815-3-sanyapilot496@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327163750.986815-3-sanyapilot496@gmail.com>
X-Proofpoint-ORIG-GUID: vqlOVfteu8fw-tBhzkfPtukKG7mv0LqD
X-Proofpoint-GUID: vqlOVfteu8fw-tBhzkfPtukKG7mv0LqD
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e97dcd cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=cT8Zqm98tluRgYDMnLUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300120

On Thu, Mar 27, 2025 at 07:37:45PM +0300, Alexander Baransky wrote:
> Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
> support found in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
> 
> Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-g2647fb105.c | 282 ++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> 
> +
> +static int visionox_g2647fb105_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	visionox_g2647fb105_reset(ctx);
> +
> +	ret = visionox_g2647fb105_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);

Unfortunately, you can't disable the regulators here. panel bridge
doesn't check for an error (and it can not further propagate an error),
so if visionox_g2647fb105_on() fails, then there will be an extra call
to regulator_bulk_disable() in visionox_g2647fb105_unprepare().

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

LGTM otherwise

-- 
With best wishes
Dmitry
