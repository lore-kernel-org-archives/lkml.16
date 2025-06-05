Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C11C84D9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106764; cv=none; b=A4/wbHdwO/CUPI/BBZKlaiagp3qlUY+p7HVXDeg0rrWRjEXFFbpZQ8E4QNKzh22ZBDrR1q9jiCFRIYanYsFjY9p4f9RByjgu92/Sqsid2O21xo9eEoi8xXd6FEV+kEZDHYxvnBYQmILwEaaLc1GiuBmywujC4RcXKR/9QiH7UJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106764; c=relaxed/simple;
	bh=LMQwdkqBvo1tgNzwCTCypcT9U1AB6t94rtPJi2KqwuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yn/eGUWT7a+FOyoP7mr5kpKeW+vuFnq2QFMNQcKDM44YpElu8hlKU8WmK49JMLIpgKXNCCZk92s+rWa5NpWN/U46UEXvM7vSB2UIEPcFUFgRyajrAMWIEK3ZszPM6gRmAtAFv0+0P8Ht0DQTOyCgtOQW/p1QJuQbJ/gdvePzBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqVDtx50; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqVDtx50"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a52874d593so452354f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749106760; x=1749711560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2+w5qDlvAp457KpMnxq0u5sHkVOO1dTs6W/hmm8fgY=;
        b=pqVDtx50eg4XXhJCUm3djyF3foLOQV3Kc6T1PdcAfTobwBftf/4FWuz7MuafZnX1Vc
         BVDiIoWxpL+oPDM53yArchhmh0m5IKL7UgbQYpvV46+DRWl3wZqGJI0eeLWrH6xXlJbX
         09pRRq9ZNZGWZt0k8K4n27c3Oh67G6QSqLnIsVlo3t574zibwqx6IbS2Ji9GW0uoA5ir
         vf9KBP/5QZstF5ky503fvCvOA3pDOEZKSOnTTFKRd8TS3jIpjtfe2Yatvtr9W/jyQ6X4
         61rz92/UqXg18jNXy5DW7boHoeDW6L6ZyZjJ1+FKoLg5pI5ohJLf+f+/Ox0DVqeYYZDI
         GiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106760; x=1749711560;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2+w5qDlvAp457KpMnxq0u5sHkVOO1dTs6W/hmm8fgY=;
        b=uRapc9nuOwfQQjz/4pNd2Ysv4rjxScfEAU8PGIRNBeDX2uTsJbokV67Aj0oUVIYRAq
         ZPt2CtLQmPZConrcHZfKYLZAhPdwtzxsFGHkwJzaKA3GVEVG9nN6C9CAqxae/EdRnJAl
         W9ijsla7DrHRkj6Y66IVoNlyxNOXNFUaDJa87FsTgn091BRUDilbKqaHFpduOwj6u0AO
         kCVdb/sPirn396jgp8Q6no17Y83rPUVvJGaXhi1MXw9g+2zYJYtyzAXUpbhMC073O7gd
         myf1BYJ2U0OMpBnOT5JJoR8qDq+M6j3ZdLnLfWi2QBNoSAV9UbO6WfV0UJ6arz+pUIST
         eb6w==
X-Forwarded-Encrypted: i=1; AJvYcCWCRVvm/4ixDq6Hoasz+YHUYfYfCI7wMSuuTNcanW1HD62OnLDH4jzTXNW/4NNLcFb/nE5kiSGAkD49Nyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7X86QHDr9lS2VrLKyynJU9XX5vNiueX5zgP8wbIXCmoU47MB1
	D1Sk/ImgrxWYpfXaR6ot/pYYC/OuzsWkxQoQiCXE0tH3iIsGcoUdiugEGhVaxmpiKIE=
X-Gm-Gg: ASbGncsjOiAT0FHW0Sb/iPOB3qsV+yxOl92et1k3xGsyx50G+5UxTYS9BZqY16M1dM1
	cEWUM3yzbE1P0KtXF2Q2mtDptr2FZ1mudl6E8nQ9ecWLhWWAc0vZC9UFYTglgxCDpCVt7R3ooll
	6cTVil774tLwWWIH+HF23+k7NpGmfxiIA4Aco+EwVIer6Nl9ckIMucLwg1qbTkoViCYzDpyPuUI
	m/5Z2ODfdK54f0j9MesUXfxrsAbd/Nogd9yflGbFdqChNGgWY2MVgZjyHbWkf8R8c1mSUVeq7S6
	xUdaSy/dWG7MKfi/w54qug/zVg/HvxGx6WCv0E7kUJLbxuMjCzAWDCvGPiA3oU1/f1kkxi7mhr8
	8DAxer2yS5fa+kqlitg==
X-Google-Smtp-Source: AGHT+IGESUUU1RW1xUlGowA7kg5K9C6Ccu9saFql9en1faQOIZ4stoUT+cAx7nQdlpFweYLRlEcrSg==
X-Received: by 2002:a5d:5f95:0:b0:3a4:efbb:6df3 with SMTP id ffacd0b85a97d-3a51d8f5e25mr4573586f8f.10.1749106760421;
        Wed, 04 Jun 2025 23:59:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f3csm23245470f8f.42.2025.06.04.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:59:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250520074110.655114-1-mwalle@kernel.org>
References: <20250520074110.655114-1-mwalle@kernel.org>
Subject: Re: [PATCH] drm/panel-simple: fix the warnings for the Evervision
 VGG644804
Message-Id: <174910675945.1443717.10418020148498727713.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Tue, 20 May 2025 09:41:10 +0200, Michael Walle wrote:
> The panel lacked the connector type which causes a warning. Adding the
> connector type reveals wrong bus_flags and bits per pixel. Fix all of
> it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel-simple: fix the warnings for the Evervision VGG644804
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5dc1ea903588a73fb03b3a3e5a041a7c63a4bccd

-- 
Neil

