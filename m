Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3428DEE5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298297; cv=none; b=KeW1jHxT+bEAEOlPjRDetuL60HYfBHjUq1QlWU2oF8d/0eOrm32hnLNRRhE03g3okf/lkUx8J2yKY3Jtc5XH3aATD7c7/z6NTQwE3LpqCW1OXLyUwoJ69Eewk/jVuG0ILLUI5UvRaHifG6UWMJ2Bcg+wv+LSVI8wQ3PinuZE2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298297; c=relaxed/simple;
	bh=OjPVjiWGilZC7Eul96lE5NZ0FTT8FLb2GaxNCKb/UjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X+yA6w6kQ3ux+QUN2ML9tW5O+HohuA0qVGU32ZAxEx9eQWS8+O1A7usc0TCz0nyWC41xjPGjDz1z2vfSxYcO609T4SJkYq6sRIvj5iACKKp4m7cgwNKn/ptTazgjlppwL+JEVGYM6mUBOrn3Nu/upw4PnvSsE2e+X7o0bg3+yCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyIyXXDj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyIyXXDj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso2517251f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298294; x=1751903094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeVzWwNkoBBqZJtVN+edAm9nLWzeultF12pDHLy0tUQ=;
        b=zyIyXXDjxUGh/3R3ThlYoJuSC0SKRl6rWXA+GsG+ZTgMbeTzeL4QBKWQhaajjrYZJ3
         sfZfMRaMvElUAzRwBhQmEevxbnV8BjK9Uul1w/KFesGxtoqPp4skQfzyD3pasEjozC1A
         Yj+qeAYPz6k1a6cPcZR6L2VjmZLYjhPL3xQRCjnXP6IB2ILpzwMC3G9oLLxa+IV+ONJv
         oZqzbPSuTZGcSxtV7a+sM8vL8xQwq4iVmqUa3xLpEbPuhEFVQQ0amtYjieSDIlWNsJWQ
         tYa+FiWZvtLCa0XxfCPlPkcmSYHO1OBIv2/p9Yivf1TsYVHGU6DgccK5KsW+g4xttr0f
         GWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298294; x=1751903094;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeVzWwNkoBBqZJtVN+edAm9nLWzeultF12pDHLy0tUQ=;
        b=oiwb9IVksu1ppX7Fj2gm4f6Q0F48e2eWe5elxaEB1WbV4xTOR9S3JpoIcXIpJOf1Yp
         csSDzKmaoTmiTar68km4zPz82T+d2XA+t40ZXWUUZ6FHA5hGxmxu5lA7Qow54RF+BYzH
         ADfXKAlh1CF0ic09m8WbWAWgFkK9QVAu8CscsR0J6yyGS0j5ekvQ/ndLO1vVaesbPoog
         T6rMB8kgQWaE/FmsTuw0IwF1dpYkzZuZAKkWBSekd4equMfazgc++PN1KQ4Jzp3dKTFA
         ErVLLYGEE9mMllNzkXl061xnLxVhlmOmM/Inyruljv8ojq2MvFjjbdtkCzB9qTLj67WF
         2Z2g==
X-Forwarded-Encrypted: i=1; AJvYcCWaWHOd3rI10s5HlzJ6dyZ4m1ijxGKNmjU1y7Y/QzWQAg2hWSUMfrgSsDnfMK8vDvvjLg0134NuqQrZqhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yoZUpx8/XuarTy2YIXGMuvikMiE2jbKg4f3a6/xRQoyuGxJi
	IsP7m73LEPwqo0JMxdiWaWE+KYyXgcaD9bYPwDE7BxNniVd+byl7/82ON+uVKvXNRjs=
X-Gm-Gg: ASbGncuhFgw3uJUvKjdkMFzoZohEtQkDyB0C6lyOLDAwkrCImohfai0ls37nYH0/v1U
	lVrtCVLxq0d14AOuZQjQ6E8RPMdELELB1qn+unKN/B5BZS7MHCc9qU+my+CjfwIS6/8kVUx2+IK
	m6JWQkGoXmKU5ZT5R8dl0HMYCV7yi5lJWYEhkitSpVTZmuVNdmFDHs61bCzIL7V02u1SFmXKQ74
	oo1kEadqK8TeaCx9q2aDV1csOV7o2AVMmpjm/qia+/R2aWBfK0Og3Bft/KhCi2fz7Fuw9Ys8na2
	Z+XmpRZRlC/jQDV2DYKTBXjeo2vA8V+KiH7LCtp4CglVNZZEKkDLUO0cAsizW/kusoTdYowmhnN
	c21xVnzA=
X-Google-Smtp-Source: AGHT+IE54hqVNFYfuy0JLh3yRJ09i1zRjrGwAGDzhoNtqX53CK3xe+yMOcVBS5HMp08OOGC0/6C+rw==
X-Received: by 2002:a05:6000:1804:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a8fe79bb4bmr9095245f8f.46.1751298293833;
        Mon, 30 Jun 2025 08:44:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm10834062f8f.12.2025.06.30.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:44:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
References: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: fix assignment of the
 of_node
Message-Id: <175129829317.2307732.14905194956807398865.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:44:53 +0200
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

On Sun, 08 Jun 2025 18:52:04 +0300, Dmitry Baryshkov wrote:
> Perform fix similar to the one in the commit 85e444a68126 ("drm/bridge:
> Fix assignment of the of_node of the parent to aux bridge").
> 
> The assignment of the of_node to the aux HPD bridge needs to mark the
> of_node as reused, otherwise driver core will attempt to bind resources
> like pinctrl, which is going to fail as corresponding pins are already
> marked as used by the parent device.
> Fix that by using the device_set_of_node_from_dev() helper instead of
> assigning it directly.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e8537cad824065b0425fb0429e762e14a08067c2

-- 
Neil

