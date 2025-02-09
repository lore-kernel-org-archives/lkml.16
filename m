Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D32F30
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066421; cv=none; b=CFdVsLXWwRwx7iBlPPUELJ7kWpHXUocyXJMZ/0Q/DDeMtUscxgG27m8UH7ZlyuFqCMO6iGKIFLZJKhk/S1l1KvLt511jtbsKu9tTLuxQi05KkVPZSowNrb7KOX64FVy381jvswsWwCRHdnbvSkoDBc9J396/PmZFek6nD/d4mVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066421; c=relaxed/simple;
	bh=/RTCJI+yJpSGjvuXHVrDtTwzbJxjO0CWkdqf33wr0Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjAPvqW0XFAcHXUgO8VYmE4pngI4ogkTDwMjP2G/QPGu+3FK5RZUybY1SH5D6pmmdmlVC++TW1QOGmFonf7p2Reo2sCsfBiht+H5nN+e/AqIWWwFfWuzsiZP9qJNwvOzj3fPnNmWHCJAxWKoSoX8OmqKoprCbAh9i5XPpGjCRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NumguGks; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NumguGks"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54508b026d1so218721e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739066417; x=1739671217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiSJBpwJ06y13Y4m32+RLR4LRqNBHBlyjKc73IF8wvA=;
        b=NumguGksJVFNI0idEfBnW4EgoUXVrY5lGZT2OxNIPwG2pq7eyUuQD163D3tVi8cFL9
         3+iyuzMP6v4wCQ0GN2oFnCbHjmNig958doXDqLlhaCn+KtDInAO2tKC88JO3ZwZMvhwG
         rlaZqTUp1/R4z5TDXpV/Q8THPDE5Qy96DBY4b3Mf4nVYKCmHfU50VrEXVw18L7UN0xhQ
         0df8OfMM047OjFUngHp1/OvhRqecQbPVqTUtzn2kqYOI1BGmPyLznu2RHBeQ+m3k28Vj
         qDWvbSfG8+ZbEsnafwTyChZDNE2XBxznsZ7/dVyIBi7j4oWShdXkEFBYX6coW4Nb1RF9
         i2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739066417; x=1739671217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiSJBpwJ06y13Y4m32+RLR4LRqNBHBlyjKc73IF8wvA=;
        b=SNH5gZtpcQDRF5c1aAi3APs6Hyx05t0IcNqukx3+sMGf5Avo7V8QDv+Fidx+EGgA7a
         osKuUBm+2Bf9T1i2hE1psEZ7322MnyriGhduZ4rfR1FKr79L0cmxcpb1NTSn5A90B8MC
         +s47R0rbz7wGGRe4RVBo3Cl8DnzKYc0xaBgHd7+kxWcrjtpCbAf68bh3ct1d/d5pl594
         SZoqaEDNepzCE7BEKGciZ0XQc70z9DRVihzT79NmG/bBwF0e+7al6/hKqQlg3ZCXvAXS
         mXboAe+WqY1ykXisuWFGnXKrwP1r1Yk3HCUGuGzpUrLkT6beas0Ys7hxYaCTzoQioiRh
         u6eg==
X-Forwarded-Encrypted: i=1; AJvYcCUfqBfd80jGXqF5X9KbvXvZLlz7U8kA9L/CpRi/6OO6Fr1fUHGexPSgKniC8igzofBalysYLns+zA1Q6yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMzBfwBZeR2KqLuoqgfYSechciekuYo8j4BhA7vQYVOk6Mk+l
	gH0+6dwZjU60pFpV7GW1Pwk8oAbF9eZ23gr/H3ELnevTRYETAgHJrYsq3/YVqJobyRkUntubA+U
	xQXo=
X-Gm-Gg: ASbGncukqrg8j2AiNU1DtjdMxtODbpy6yhFXhAWRQ87uEHEoOD6PenwHY8Yu3EAQA/j
	EI4tJZysKgxzbWYTVq8AN56mSSg4/ux4J2uC4I2dUuJvg2iToINk1zDvj/QC3wSM4BssCANlWf8
	irNNDdgY/ShsmWTYq3GiI7JRjuNZxTy7JU/1hBOX6EeQxBiGA7hK0jx+uq8IyXwJHgVZni7EidJ
	U7rHap0NVvOavXjjMgmswdnwwh3walXAaOBh26VokQQjGkBQin3WZy+crXuaX7VZxXbTSjkdqNh
	y5hoAIkHzYUF9rtjXc6tCSSLdY+ZXveUJGVF5vZAu3Lf+9xuNTaGXiCQaDk=
X-Google-Smtp-Source: AGHT+IE1RFuoba21V8k71iKwxN4QDWJF/N6Im8G5mQFzaucJ5Tcf1TVvg4WXdL+j+R121vWZVBKCRQ==
X-Received: by 2002:ac2:5f06:0:b0:545:9ce:7606 with SMTP id 2adb3069b0e04-54509ce9eb7mr130030e87.34.1739066417472;
        Sat, 08 Feb 2025 18:00:17 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54508f570b0sm82299e87.126.2025.02.08.18.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:00:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER
Date: Sun,  9 Feb 2025 04:00:07 +0200
Message-ID: <173906639943.8625.1474098563019119282.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250127071059.617567-1-arnd@kernel.org>
References: <20250127071059.617567-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 Jan 2025 08:10:02 +0100, Arnd Bergmann wrote:
> Without the DP helper code, the newly added displayport support
> causes a link failure:
> 
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `hibmc_dp_aux_init':
> dp_aux.c:(.text+0x37e): undefined reference to `drm_dp_aux_init'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_set_pattern':
> dp_link.c:(.text+0xae): undefined reference to `drm_dp_dpcd_write'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_get_adjust_train':
> dp_link.c:(.text+0x121): undefined reference to `drm_dp_get_adjust_request_voltage'
> x86_64-linux-ld: dp_link.c:(.text+0x12e): undefined reference to `drm_dp_get_adjust_request_pre_emphasis'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_training':
> dp_link.c:(.text+0x2b0): undefined reference to `drm_dp_dpcd_write'
> x86_64-linux-ld: dp_link.c:(.text+0x2e3): undefined reference to `drm_dp_dpcd_write'
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER
      commit: 9ab127a18018fb06bd42a54ed38bb7b8c449d686

Best regards,
-- 
With best wishes
Dmitry

