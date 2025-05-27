Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB3204863
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376874; cv=none; b=hA86AhBLNa+Wydd+JFwKQ0QHNZC2L3y4Mvw2Tz/4SIfFoaLUmNXb4VmMgf0qR9bFKz84JeXFFDz/D1PR3BWE+sF7+yGWIxKcfxavKKgmcoBpYvBqrPT9HQkBMgP91ND8tD1Ura2cIwa+HOheKjAK74XXCvBO027ZdWZk7UCu/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376874; c=relaxed/simple;
	bh=wvfiTjQGeAG7RO/lRmfowdn3VFI+X+3mvUtbJEv7l4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cP3ukG0NZ3Rdy2kHX7Eqq9jI8exbgki0KBAW2eU3ywya3zxZK5Hssos15774hl0EgDm6Afn6dAyyXOuFOY3IIbaWReYnkjpmJalXAfTVGKOuK57U9JSYpFCDEsxEa9ae2btTJT3dPfZ/A1FDMNNOZ5tCjr7nNw6jBs0Nr+l+ZWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emjaZ2SZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emjaZ2SZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJWmqv007505
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkccecuaRKgv8kkDZISo1PP6sVbQ0hZj5Is76ku+l08=; b=emjaZ2SZIK+iYEBP
	xT4FrqM3kEnGFUqa9w/+VYyqPvQIZpuor8iI8oLi7iQqLhfFReXC7wNOlNd+E/vf
	657JrvA/O5gwdfHGPTJB5LQtyKn4euO6e1zfD7EsZKWmrcYdvGbUqzI8X3ivitNw
	AEFxqKjFvs8vla36j46NE/P0CwfixZkrHNkvKvwTQ5sGGfZ7wB3tn4fVufw+9YqF
	PWQ8Cxa+l+dMaZ+ygTvTr08r/90yuJXWhxXkLD9fmy2rntTnddjQ7Nt/eDxm9VIE
	Khxgy1kuGU3Sup8hfK2zkE6Zj0gAnR62pomuQljNFo4HOeeGAe1K1D+kA/PTn0fd
	ozznFQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvkrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:14:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faad1c56b9so39846186d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376855; x=1748981655;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkccecuaRKgv8kkDZISo1PP6sVbQ0hZj5Is76ku+l08=;
        b=dTLPwN1cn54DWI4ymcHSAWOnuFzsuBRgi1xeuREnY1gmYs0Z1+J/Z3ufHzeXLaUzQ2
         p65dCDXaB7A616E3G+hnQZMJHwfWTjKY0YP0PnxXh7luQfsgRX4R++LrAkJJOTsODtA7
         gv8bU//PVqgVd+iIZ5A/QMCqGVWcvDVybSjXsqEJ0EU2iNr2QAmYf4kZIP/B87FiUbb1
         QMq7CGelRN6oi6NM++xO9DpNqIuSR0UE3lyF9tzQ2SzVevZWEct4uoRCEL4FkCllZG6I
         3RzKAG3J4N8XLu0kSS1w+WifAd1aZ+I7hUFvxFxCkdrVbilb7F37O7E5kbvJtcYoq6+2
         81uA==
X-Forwarded-Encrypted: i=1; AJvYcCXWKjsc+pPutdW2o6ei+/AG+oEQJezAde7YF7Zc6YAfPNoaLei7Ist+FlMM37dBkUnSqUTu0Eu4grS7Y+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRR9Aw4o+r7AiSreFZAeGZXhOkcpyRFMnwiXfMOfja+OJI/RFk
	eeTY71vUAjGsnX67ikeTC1hjJRILjy5PIcEbAPkeyVIQqvOtj+cufFsulrNonzVPtOKOaNhltFA
	9jQ0v9cnnWgYnVEbqU1km4t9Y8HqpZ6UdML+WToz9meypHnMhPH0J/Hf4QP5F+GPQ2F8=
X-Gm-Gg: ASbGncu6KMDfRi7JUfAfJZj4ncs0KJtyTtVYXOFESl+qtuhakgz/Qdz3HNJNSkJ/C9B
	BfHEGOyjCiJxnXonZO5WnzhnD3yT4FDLcFZplzHkaevJSb+PpXsE/KctlDliXNEBIsB+RdbuuO7
	IG39W0PLyZSXSHnIXrcQGIhoz2/KysTAlItnISLSe1LCZOGeNnnVMRFbhZSKvMeRpZtVsrTEact
	tUjWOWeNtpm0Qggyj9PMbkWnPEuvkD9FpvpS866edcLmJj4juIFXtkWu8oduemf4yJ6EJoNgv/l
	oput2CyqEqhKAM7P3fPVr3mJvTQ7lDBMDQJSOZhLlfLpYORKZaseZdWvVO8/j7KZ3wsFoZOMXzc
	=
X-Received: by 2002:a05:6214:194c:b0:6ed:12b0:f182 with SMTP id 6a1803df08f44-6fa9d01b9f2mr205039306d6.11.1748376854746;
        Tue, 27 May 2025 13:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3lomDjMQq5VV0rwLalx9S8jqjHkY+CtzDMclEG0zM/y1gsKelTqyg3WWsE9/Ce6+y2K5T6g==
X-Received: by 2002:a05:6214:194c:b0:6ed:12b0:f182 with SMTP id 6a1803df08f44-6fa9d01b9f2mr205038886d6.11.1748376854201;
        Tue, 27 May 2025 13:14:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532ee57483sm10349e87.113.2025.05.27.13.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250302083043.3197235-1-damon.ding@rock-chips.com>
References: <20250302083043.3197235-1-damon.ding@rock-chips.com>
Subject: Re: [PATCH v8] drm/bridge: analogix_dp: Remove the unnecessary
 calls to clk_disable_unprepare() during probing
Message-Id: <174837685066.608167.1736594704385365312.b4-ty@oss.qualcomm.com>
Date: Tue, 27 May 2025 23:14:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 6yhpu2NC8yGc8hQK7VoTe0CGs06-yQsr
X-Proofpoint-GUID: 6yhpu2NC8yGc8hQK7VoTe0CGs06-yQsr
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68361d27 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=gbcPiYo1f4mhb5Ahg4QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3MCBTYWx0ZWRfX6Y7iu1J4CcUn
 1Ha1wdW7G4jiqwucTT/huemb5hzFzwA/+tFsJbKeoPcixsiZVoE7/ErrbUsFlqKm9uQfELPCJ8H
 ZYIJ6kpVbVlJ7ANi1imVaxaeIOOAsY9BQZ2UYhWVZogIDN7eQ5wGPpnSKiHi5wNHV1guvMuxjsC
 kF683XGxQj4GRedtQ9MIiUfwUmsH1LT3+cOypn2c58Jy3fK0fPPADhQaWYbxA6plmmzVaCGN4hv
 Lqa2uzmmae77nPSL9iWPZqJZ5mDF+GPVTLBY1k3XRy6es94wdUtTtPsQUBQAmopYEiyZSBLjLCO
 6WPa4K1QUDUcHuY7wsIjO+lgPBtML4Mxwqj/CZOq1/JezpuRO6ZDJ9C8QIo6kvgrO3dWUFfEqlW
 0zgzNGdXtk3rwXjKxU/lhltVkK3E4KvnP24/dXlMY9L1VTVSXZ/tv13Iuf2rpg0SoZi/GWqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=993 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270170

On Sun, 02 Mar 2025 16:30:43 +0800, Damon Ding wrote:
> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"), the PM operations can help enable/disable the clock. The
> err_disable_clk label and clk_disable_unprepare() operations are no
> longer necessary because the analogix_dp_resume() will not be called
> during probing.
> 
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing
      commit: 6579a03e68ffa5feb2d2823dea16ca7466f6de16

Best regards,
-- 
With best wishes
Dmitry


