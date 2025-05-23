Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD06E146D53
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748033826; cv=none; b=nsdIbHJWorMd8oDkgXwah4dV/LeBB8C0XkW/nNdRVeNXV/WK8VK2BFv9gDtmnz3zIELRT3IIODNOaNo7+tpXYCco0eqW4ojDnXlP4jyoRgsVmhRXMiZakM141NF42LVE01oCu8FuRO2uF1lyQ+chnd8MAJn7XLTxYbt9iwkdf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748033826; c=relaxed/simple;
	bh=vy2dw4wz8lFIeYTefVSAFoK/Awuznj5nM7ffCiEK0zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbtvL6NFAuD1Lq9ywkFvuffXPxHnwmDpkVByq+GZjtOFVisliDdbKJl175OvQBRyY35dFXc6co+mtA2g2mI+0gTYKScCltzo0PHXg0Tl0Z3p3wbuhHQooyWl9HkXP7bLSn0EQfYLHs8ueDiNT7BfhTSA7IvvitQ+vDR8NQvqY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TG/4Vp3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TG/4Vp3M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCo7wt029048
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rNIsKJF1mi/LxioSk9Ce9BK3
	pIg2jgjoCqJJ2Z9jo18=; b=TG/4Vp3MopLsVOIKJ5m7+SaqSCGvf4E6s2aa616c
	mfuZIpvNK1BYE0v9y3tA4m67xBaLSCGX+NsF4zyS85nS8kCGmZKUkvZypf7XQTDD
	Q0DvOdx9mTiASt5XjKkfiUy4q3MKxiqoF+/kg0H5rl16wq7PnGI9xpEeFMzfhhmu
	MeR7MxijoOPmWwZ6ivhrshu3dtUb2x8sn5cE/aNs+RhPe8Vuj0+Yf9h2H5lLDCvQ
	pR5n7nqs8A1cPQ9xltRrppCX7ho6TP7OB71PipMJ5LxKiju989Yhc+01Q/YE2uNQ
	a9mfvH7Ji3GePmi07XdKmHOBcPmtc/Sl3o4mvxTcGGTKOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4b97s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:57:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so5269266d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748033822; x=1748638622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNIsKJF1mi/LxioSk9Ce9BK3pIg2jgjoCqJJ2Z9jo18=;
        b=rcJkbAWK5M9BpwdagJix4yoxqSfp2Zy92W0vRyEOSN/MXdZN2Rsz9QeD7RTBOknqfm
         ZHN+NTenVxXLJecM89V1ZxdCfEau3vMFSlkM18TYS3fklPWhWkKteJ+aPuHZ1cSzPszJ
         VMQf9jGzD1Em6Kc/5w8KF5nnWYtlOuANvUfRCwniytHdjGMzvIlBpKA1U+oPkl3vbxgW
         4Rr9N7vKzFoWc19g292+Mm9cylYUwBWNIOBy18sn/F/c6AXAcg6NIgI9ujGFhjM8CsUE
         ODJ936V7vcECftCEhmf3kXBl++J8sQWu3wbrdugGc3/bWKh5jcdfSLWhgWrS7fkAc8mp
         z+mg==
X-Forwarded-Encrypted: i=1; AJvYcCX+BW7YcqWQ0Ftqy1R0RqBHidB4i5jFT1Ro2aQC3HUQkVYi8/5e2R9jhoVAO1WX1gkCOHryGVNv7/5btxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWIz0VobpCV/HN1w2REE3aEonpj0uuFSwnZI9bENPcGjcX66jS
	ibtRk6BW64PrHlZ/YJPS9Tx2XInd57MnkALdw3D3e/2UUugcwuWZozwfvVP/y60A58lfTPF44IU
	Ceoa6DsPLneBqKQ+d1OEXYbMAhDvG5JS2wLFTOUHxBh7nCjNnDKRu1evxtAx9eR+Ui9w=
X-Gm-Gg: ASbGncs4saWZQ4K02Zc4KEZeXE/h5X307CE5ZYcqngsnKu9dGGoSjwomTdz5S4nMzaK
	XGmBYZqVmEbf4yPXi8Vznvd94Ox81XAhH/yrJDvyo9nO94AczluJFcn+64Ghi08u5TW4MWitqcX
	dq9n67pC93AwelKCnF+L47Pfl5Fyz+tLUp6oah6FVZQBtQTXHx3dBgPuPyjL1wfX7l+qaV0mNfO
	azsGieaa5bu5alrCwjbfbFO7ubTND55gqUcJB58UyQGER7uXwUdgFuvYNIcZ2Y6CRiO8ztpT4sC
	jCTeGpGWD5+QYS3jS1wcDlyWNAsTfbD8hkm6+pmYuJLMYNki7uwk1z1twLzEbwhtP7aHwPMmL4M
	=
X-Received: by 2002:ad4:5bad:0:b0:6f8:ad1c:e35f with SMTP id 6a1803df08f44-6fa9d2baa93mr17732706d6.37.1748033822514;
        Fri, 23 May 2025 13:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXgzEI95DBszlLmAprmrtfWsC7XyZmzEiw7PPtjWrRZ68kAwEl7Vk3FXZ6bBDe1BQSmep8gw==
X-Received: by 2002:ad4:5bad:0:b0:6f8:ad1c:e35f with SMTP id 6a1803df08f44-6fa9d2baa93mr17732336d6.37.1748033822111;
        Fri, 23 May 2025 13:57:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cfb3esm38509081fa.104.2025.05.23.13.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 13:57:01 -0700 (PDT)
Date: Fri, 23 May 2025 23:56:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Jakob Hauser <jahau@rocketmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Hironori KIKUCHI <kikuchan98@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
Message-ID: <im3otl524ar2kkdj4zpstrsuemwu2iamoudqdznzlqhq2uvfn4@qlkb4fmgkvsp>
References: <20250523121127.2269693-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523121127.2269693-1-arnd@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5MCBTYWx0ZWRfXxw/2LBXUj7Ww
 kLL4kxKpMZwOg70eyhlx8ElelDQIxWAhfVw2iGgcrS6BVPkiHqWqzgv8PikvMPXLghIg9A/WcpQ
 fRnod3av0IfKHBNekN1MKoLxZbvzv/sRox3EFmM2L3ZeKDv1lzYCttFpuzbrt0DLb05u0Z4ftEh
 5Hp3jTRA7yWm8JuKeV5oujYAYffPI/9EC3Qgil08gk/AZ18j+yRn1ubTVaBxXV6yG/d7Co1tGqa
 VQFqluyDvtKolFgg+/j1jRnWNtL1rcKCqkT0w8SBK5G7dQ2em4JABgm5xt16h/xIuIa8DSppJfA
 ZBjAi6PPVxH0R5SwA1iqk+P3Fm6qLsr+mbC9bwlDo/IoOxEDWSV2WFnX7BFPlFhlp/jC9W9QO1Z
 z1j1BTZNMqUWazJXJn+rwsdH2z5cmsT68mn66T6a6kIXrZp0yjhW2k8OByOwY8cU6xV61N/b
X-Proofpoint-GUID: DB-UgAGCuVqKfmAyopHPslU6vMcEllaP
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830e11f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=n4_WoJYr638Gx-RNnhEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DB-UgAGCuVqKfmAyopHPslU6vMcEllaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=990 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230190

On Fri, May 23, 2025 at 02:11:22PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver uses the DSC helper module, but does not
> select its Kconfig symbol, so configurations are possible that
> cause a link failure:
> 
> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panel/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
