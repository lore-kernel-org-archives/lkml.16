Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F1225D54A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277449; cv=none; b=sHd/lmaL6ssFuXPDQOaniYltTkqTSQ2aVfM7HxRwbsStm7JZsyjaDyaTRGaboDoIWI2IREEMfpmYuKE4fJdQPrKMDc1uJLhb61Tkuh1c0R91fWFfWVl8hTu/ANYBpKwyHtCDXMUpHLFV6cxrk6z5vGoQyCg5iyRgqA4bf/MT2N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277449; c=relaxed/simple;
	bh=8G2dqMzY6Qb4Uq+M4SKnCGInMPsDcBYzXptNMx5MsJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjT4CkTvpgnJBShW0u/hd6sEJ1Hr6zjupj8DD9Xw7DjJ/Y1ZKyzzpR2X40yOLD1eeHoyH8TQclcMMdKLTfx/HWr9hIrZSfhgZ9DVm9X/YwkoNJjOwsXMSHCRGoTfBdH7fg6zKwYF7CJG28MBQ9INhHd+1Fpmzdu55bvtDdYhWNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4qt6Arr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4qt6Arr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75Jq2028838
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZqtW7bMzYMRTd98Pj3PG0q2g
	Dn33XGbZdcTOcs859xA=; b=U4qt6Arrts/3s5R7WCtPT72fdEBKMGz0cgUJspjF
	yIMtE5/F01t55ETOsLgVxUrPyAn17+4r8EHp3634HwO4WCBRD+mWpiQsZEsfZ0cs
	f/sF1dvg/hYTuhESxL6Okg7UTm896P7eDtlKWNBi2anNT9p4CUeFsoNFsUn3M3C5
	JxuLp9Kki9+dHEHhE8+26uwpYCtAqrAXOL/egYYZ8YtdAMpMKEkMG8Q2ae4RYt7H
	AIzfNzxZTLIFlvtsdO7iCKdrkvUNuBRqeopiuorW5GByHzk9tB6F2Fq96OiBleib
	C1bT+I6nYmPSPTVCsx4D45bGfX/g7D0xq5qQivEQ3sOxSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbupdgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:30:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c09f73873fso98731285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277445; x=1744882245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqtW7bMzYMRTd98Pj3PG0q2gDn33XGbZdcTOcs859xA=;
        b=ku+Ia5CPOg9Y9HL5/YoOTwfjXas8AYn6S9ohgI1fkGsOYkuO7pKSkG5k+XpYZzkdx3
         vN9HvZ4exRRz0ttA9PGPMcUNwR8DBH7vTQFegs0mcRrxwSJjz7mXYBHSHL9A5ynY18F7
         1Ob2xkeQimliQZ8X8f5wZXEM1IKG/td96SIF4v31J3+lgx7QGcS/CNmUq8bCEuYAh1D5
         CS9yWNWYvPdF87/J/kFpGzbV/4X5q/GZYjn/wKBvFW79T/7NqtsRo0i1lBRvs19K6+/2
         fGrigWKXoJetAag4AQXzts+J5EAJHRXWE+vaiSdhD0eNKtYl3kq2dq+zRKvNFGG3LH6X
         PbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPKsPMwmGydnrcdtcZ9a362rD+/7qhNjBvSxBVzjGNrbfVQHxJUk6bd57jFE3+hDwMtbh5wJkvt8FvdvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIlCnVLHNZo6wGAibpuv9tTDzh8jRU2DIE4iUqH8OACQBph1Vz
	Tp85B9OOum1Lk/znJycVrpEdtW5KIiJdIzGrSLVIYzTmkVv6kA9iXs9L+84r4ydkJFSrx6ePywE
	awma4qYq/rWEaTNInvHJgVJcXmtPQBCmnpHa8Kim2loCmAQk0VRVdXHZGhHAUHVA=
X-Gm-Gg: ASbGncum12sLmcgmYutFWYKyU26DJHD+Jyqky0cG6jNHyZT6/BJFfrcSM8Re+zSb2M2
	fYyxmWufvhRjdQUVrDpwjh1QURbvVLPbd0tjfzLQFcsXJwgie34yQSIUG2zFT6stSpKlF9Ws4Wj
	G5Q+xo5RXthH9j1H+tyCJMXuG+c+egCY/E6v38ePjD/BXJieKVhz/kOBZVVD5xp8/jj6SVyODmh
	xsO6HAYuHcn/u3elRWGTQYj1lXK5eMCNyo8feKabfXv/EAdyHUPdcPDvVel4V2OYWg/vHuvYj0p
	TX3x3iQE2eWMRizzoYFtPEIs4nK/OwhQnV+osWuLY0fM2jCb04/nhreftmMMlKETYMHdwu+gD9o
	=
X-Received: by 2002:a05:620a:258e:b0:7c5:a230:30ff with SMTP id af79cd13be357-7c7a76cf8f5mr251332385a.47.1744277445630;
        Thu, 10 Apr 2025 02:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVltL3h1Caq1HEBhiLFJIRZ3Hi1sFgkDZeWmfTeKtna2kWsYnZwqyGx+FPDMlvJ3YI1hI9Zw==
X-Received: by 2002:a05:620a:258e:b0:7c5:a230:30ff with SMTP id af79cd13be357-7c7a76cf8f5mr251329485a.47.1744277445295;
        Thu, 10 Apr 2025 02:30:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d23880dsm91875e87.79.2025.04.10.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:30:44 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:30:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: anx7625: Use devm_pm_runtime_enable()
Message-ID: <wdxowk32hratizv6xr3gqa5nab2zprgtfua2rpyupr7frd7ojh@3q7crhry46wt>
References: <20250409093814.3977025-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409093814.3977025-1-wenst@chromium.org>
X-Proofpoint-GUID: 3mFXuwvlwb5780L0KYxFISKBe8GWsTnp
X-Proofpoint-ORIG-GUID: 3mFXuwvlwb5780L0KYxFISKBe8GWsTnp
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f78fc6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Kv9FL6QeMsydgTWXVFcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=683 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100070

On Wed, Apr 09, 2025 at 05:38:13PM +0800, Chen-Yu Tsai wrote:
> The anx7625 driver is open coding what devm_pm_runtime_enable() does.
> 
> Switch to the common helper instead.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
