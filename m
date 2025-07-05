Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CF17A5BE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751743193; cv=none; b=Qj52QSCDRJayYgXsjLJV0nzt/8xqA6nMiLtkmFLPlFfHWs/xqWuryEFHo9a/TuwS9Dwv51EFqa0nz5wcZklSm8OTWssAZQSbdxmJew99UsRAc8zUBhOExUT04WPC5NeH+ziDDKRDBP0AANEBlgA8E/TzAy7EnOYmoWf3A7hldRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751743193; c=relaxed/simple;
	bh=i4WxrmKI9aWJ6AEjMvCbpjm6UX1wknH9/ZWOyCQ9puI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMUTPBA52sr6HrOBqP830O9f8evv5/f9ISZWFJXbXvyt02PayxjY+4XejgYA6NXkCC1ww6tuwEGjmE4GzWcYP34BVs6DacW2R2irI+SRCLUwM8cJ+Zsoi0kVaYwEA1nWGngdL1fmXh6gj+4Y6s2n7ExBq2GBZEbKy+H84w+t6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hg4m6If+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hg4m6If+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565J28xa019689
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 19:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h0r+raSjr3qG0pDwi4k/j9K+
	amUMQGQ1pbpuuZU5sz8=; b=Hg4m6If+4HXMvUgCd89eTqWygkAs5ZjYu7MAaC2N
	umwQ0U4X9fdcF3B24dGZ8RySl4FRkfBgM+v2QTX2+aw3BgIflky9qEL9HkDDVGK+
	jIUTsVSTYLCTS/AB//bqqSn/U2q8+iTSGUQwCtRSNVK2im98q56fqfc9kupmjsGP
	Z7prLTlKUzkNkqHFejuTAUCh3/p7bgTZRui1bWSm0RTOh+QQnfbZY8FlR9JVxek3
	/MzEj5TbRJOcYsHZL9JxPsdov4dsBjFL6koEgaQXZae64oTSSR0RVb0w2FZ/gPoL
	gFlsl91FciN7fIEYgNriwIHDUKdV57CCgsRkxGilkRvG2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q1pj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 19:19:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so292085285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751743189; x=1752347989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0r+raSjr3qG0pDwi4k/j9K+amUMQGQ1pbpuuZU5sz8=;
        b=wUfDCkt9coqzuQjAgh5H9VliqvetinIDFQwH3invDzRB9d5xqRWVZGNx9ReyYHQB0A
         UhrXpgNos6XvGMmnecZIpqgoWY3pryWoKPft+VZQ4YEA5ANkrICfc1KMmXIzKwL8iQri
         MjmUdHDgZLggrx69zIuO+9pnSZCGMhzOSKScs6EbNiYLYRG1h9U3u+jhTJ3ZHntU/EYw
         39xsexho/VCbgBHNoTfSiEG2HsUz1zOTNoyrH0rOR7m5hHb+YDK+RHH6x9iNFS+yl9eU
         /++vZwWsSWB2g0Etp7mr1BQfu6QLE8qKZMGneNGC20jFc08+Wxf8ejhxng4qswqfbLlT
         8A3A==
X-Forwarded-Encrypted: i=1; AJvYcCX9I2BR6/1le9IOihmLIIj/J6gk8w1tcxE/kTjmEiyEEKGD6tIwEafx+RMNzTv9PyrLIATivUk32F75CDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSenP6kxte+m3FkuK53b79327dHwH13PcFN084vX02FktduuO
	FFm4cha995svJ8X65QZbZ3w+qRf++6o+zzvsgyhVmG7+RgaR7aWoHFk2zgb1zG1J0J9sfWxnNXP
	1PIwLPkaARMA/Ebw3RlU6QCBPAJNoEB6PlDeLVZq9vNRobTXETzEtR1SUCXnCraPJjMA=
X-Gm-Gg: ASbGnctSXMcs4RGWLgWFrruvEzkp2zFOoolE2+H3HVDXaLhJdFqxp6zWRr5mOswN/xq
	1hY+o54dgyU3UUUvyUIhbqvKiDSsCWlqyf1uxV2WiH2DtLG5jMmwrwyh1OJeE0Ba513nPgt76jA
	Ckg1h4XroR4ZAST7GTTVl2Lg2/puycan+f9KxNl5rDPUaqHPa5e3G2L5xTNmDlYFadfWXcEc6P1
	aT8Je3xqLhdSEps51BTGuIZaAkBrPsuvlrQ7FkXSEXhyHaciadFDsn7LDCiQFDvenXKc33rT7Sd
	T2KfAUjc4yhg/uA2lF/1/iCeRLib60mSJQ/L7Le4DwRs+2/x4mqP7jwb/AMWS1Zk7zIW19Eas1M
	9VpTGIOLf+Jc/J0B0OLD8nPywxkZXFNABMoM=
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id af79cd13be357-7d5df102b4amr936998485a.6.1751743189418;
        Sat, 05 Jul 2025 12:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAxmBHCJAc86I5mwaeJPv9D+3BoHZHqIdYljEW4zYDWfi2OGcqvLdGuYK+a57w2SLv7bRiaQ==
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id af79cd13be357-7d5df102b4amr936994885a.6.1751743188975;
        Sat, 05 Jul 2025 12:19:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb16dsm669107e87.24.2025.07.05.12.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:19:48 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:19:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Colin King (gmail)" <colin.i.king@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: tc358767: fix uninitialized variable
 regression
Message-ID: <m4bitkuvouisk6ebhnz6yzkmrojuocos4tvjjmxahjg2dp2kgm@sxjmymi445vy>
References: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNyBTYWx0ZWRfX2rKY/MbttRi5
 eR5wFTx17xtwS16i6zRMOBAwOOVMXuAHpB0a4HL/3pbmjd9U/uxHMJf7TtPMHqkJCoLZTgHSjjn
 hdkAh7RDdsSvHn5xrGL6aRLhIsM2aaHB8iNJ3Ste4gmsFGtO6dlTJ47N28vieM+5w2TSrRKduQN
 O6zE+N+DLd0Rkcodwe7scZHcF48nQqMslZDIwfrU/22wWGyvtNpPO4iDQhlUmZKCXcKt60KabBr
 ogx7R0zoQwkRsR9JCyY3diS3OyM6w64y3hdmO1EF/CAgwrm8BwC69fOPeakPoZ+RCUDQFvL8aRI
 5Vy2cqs1zjo6sf5pGOSRlkB2z/DvcnDJntUzYX2Wqj8RiZFMJ6+FC/crh8K8UhMkiJNrTd5/Gwv
 FQkdxEut+dtuPCOAafCBFgBRCpxuPigaDoat7iacCSSmBWpCGt+6aZJ3PLGmIIeNht1Vd3WV
X-Proofpoint-GUID: cuv2GT_lnj4nusqDRQtry5bdOc7LyR_W
X-Proofpoint-ORIG-GUID: cuv2GT_lnj4nusqDRQtry5bdOc7LyR_W
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68697ad6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Nrv5o8RMzHmR80szmAIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050127

On Fri, Jul 04, 2025 at 01:30:18AM +0200, Luca Ceresoli wrote:
> Commit a59a27176914 ("drm/bridge: tc358767: convert to
> devm_drm_bridge_alloc() API") split tc_probe_bridge_endpoint() in two
> functions, thus duplicating the loop over the endpoints in each of those
> functions. However it missed duplicating the of_graph_parse_endpoint() call
> which initializes the struct of_endpoint, resulting in an uninitialized
> read.
> 
> Fixes: a59a27176914 ("drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API")
> Cc: stable@vger.kernel.org
> Reported-by: Colin King (gmail) <colin.i.king@gmail.com>
> Closes: https://lore.kernel.org/all/056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com/
> Reviewed-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> - Link to v1: https://lore.kernel.org/r/20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
