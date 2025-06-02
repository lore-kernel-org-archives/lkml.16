Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D022D4F2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877542; cv=none; b=FZ14njqE2AOWGcm4zxU4n6DpfqJkMdgQauv2lrUctuHCDJ8Bwga3anirl5AcV3AHYhwYVOk+2NlOuQWNXRGwZ7d+fmuzFNca58jTzCH+uuXOJQbol3XJDC0mN9PE3rLJrVxnusjXDBsCXerVHkYZEFNkeJrJ4zrVw83TkxYoM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877542; c=relaxed/simple;
	bh=e1Jb8L4233LQhQU2TG7JzzCgR61N68NgK8m31ehsPJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOVjMyFHh0yqb9D4bC4uqLZR4u1KcZgmoxcSv0J8VSR0rU/uJTs+9UC1TILVEfLbMh8VY3SdtyE9Ko4ZJGfyZe4XoYbnd2yfSx5nZiSGGF94gVbfxU2ykIR3YyvrG4LyLC5B97ZR+pOo4MGbzDejK2EQXMyrbEoZNVmTc/kKO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJfiOSAn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJfiOSAn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4339818f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877539; x=1749482339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=qJfiOSAnKdobH/LAGLrhqRq+uoIqkUauZZ3Z53pXpgxg83HFmehv9TGx5SA8eDN2DD
         gDxb1CTS0DjLO7cU4cVt3bkVvWdJ54ENbNHO7n2DULAtpn+FnmFYhsN9d0M/L62RZpxC
         UJf6RijOtUHxqrbgjoDUxlXIu5H+t5ukVqF+mxP3jtrAYIzSdQSIEYfP8sWW5BAPAHiX
         G/4+I+pwPvUExPQpwsbSGqx5SnbyZpq4LQ/RcvYeybmMrYShz97Da0A3bFhBRXqfEGJU
         9jwI0NKX9S6+f+6wFnJne4Z3M82Rxq7aQF4LxmUD15Scg2YLNRl/WMj2B3bAeXu4P9Kx
         dgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877539; x=1749482339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=micFkFznGhvtwMYGtQxa19z9pfkXD6cHujOzXVbuKyph2dfuLZ3+QLDs5E2WjTZGQ/
         Ez9iD6sEbWDXYc7WITbxQy17IMuJpAgzDRcFpqXbUZx7JhrpbDHa/Az10C+bAYBJEfI0
         l/846SK3TWvSKNFz78xp5ypz7odQRBRV8dUn1b8UVHW7Wpp3JAL5/O5ztrVraMAgzuZU
         wIsmOq4KrHQ6O0Ay5Y0rnD8dmb+GP4JNmq5KwzdnPkwrDZ6fBO0ZjyxOGjOlwYsKQFZv
         +zhlGJEal5eo86jqq2Yo5zdtWFYh7iGDtOwhZj2FoYQA2bjmvE4AxUBM6tT/j6R5W6T7
         EqTA==
X-Forwarded-Encrypted: i=1; AJvYcCWffxA2bED+GFhhiQtLn0lrWU5H+JhuEGqMoJKSQmC7PxiS1Umh9xF3xITOIr8qu1j2Zb5dkKpQz1FRljE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7SztQDzyRYPcniFFSOnE6IUCCXgJyEroMSfACWDYdntsDsHb6
	WYl/h6SzLDFpwHwb6NNK0U+NXoYRhWMagAUzy6gCqNBpkzu79b84bJRHLm6KRsOpr94=
X-Gm-Gg: ASbGncvTHJKgwQtn2SL71cPmjO4hHi/4qbSJXyT7m0MlO7m1HakYbAsVNQHu1PCMJXH
	pa6StRnkbl2C0UFRk14Txkn4FeSZeNS7JnBWTHuTZ2S48u09VEWHgaNDizKeTSX8oHaIXCwdptl
	O33KLCClJs2MdI6kTEol9lAbSx8pA7I+lfJMdoAcE2kRharPEiIEsQRHYQeuJqQ2mJephZQc2zP
	lHGeqE/HSuRyiQVxR8M2lM+XcMXmYxrr/z8G8lja7qo7/h/0jfLd/GAVsbhU72sVamzRZl19nzu
	UV9NLp4PtYayojCFQV/8vV374KWX0d5TaqXgtcTcCKM0zbfqsJ0cbBgkBcUfOr6UIdIy5ZyzV4H
	yY0gimBtDwRv3
X-Google-Smtp-Source: AGHT+IG1GHyy8b8GYVbfzlnN8+J2RSq7hqEKi6/Yl/QaRXVbKZmvYaubZ7QAl5jOTOJVDXQoWBizUA==
X-Received: by 2002:a05:6000:381:b0:3a4:f893:3eff with SMTP id ffacd0b85a97d-3a4fe39a982mr7159013f8f.57.1748877538797;
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Date: Mon,  2 Jun 2025 17:18:45 +0200
Message-ID: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/scx200_hrt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
index c3536fffbe9a..5a99801a1657 100644
--- a/drivers/clocksource/scx200_hrt.c
+++ b/drivers/clocksource/scx200_hrt.c
@@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	/* mult, shift are set based on mhz27 flag */
+	.owner		= THIS_MODULE,
 };
 
 static int __init init_hrt_clocksource(void)
-- 
2.43.0

