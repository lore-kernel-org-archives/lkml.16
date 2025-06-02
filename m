Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE08022C339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877543; cv=none; b=WDNWyw8V+g2FgysWQYyD+yEs9AJ6WFu7c2FeshmXuGLCzjJ7gu19RkvyAuAqC2Mf61B9xQ0rTrFDc+aojyjEa++7iT8LHeEHj+FvbU0HiF+0APWZSWemb6Bk1/3PnwP77Fj15jCLSA8ZdO/W203ubqMgM2Q+cls8Uwk4PXdnTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877543; c=relaxed/simple;
	bh=2hHPT0ZatQTm44Z1t6wExkfhxFsepGpoQ7pDrN0NhyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5UdSVc56nlQGICQvXmqVjQmh7l4qxZW6ZWYCdHnU3jHeYyzyTWDW7kZ3Lcj6zRKc7YW9KkSnHDobb3g8XqobLnhEDPUwOYGHSToJtYCzQY7xljhkDGkZfNGO7089tqoI0baI7rHvrWA29BGYQEUTR/MWHHY7REbK8YG8WT/lM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qb5y5AB2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qb5y5AB2"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so3975629f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877540; x=1749482340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
        b=Qb5y5AB2UShSbakIMXSN+0+5vBOLXH6pHqvbwCquWt6nG/3PweqsOqc3OZCudupF+d
         tgdvf5Bh4QfEm0SoNvsppi4O69edpfq3A+JkVMi6IEJ7lS8S5+LAsoyASzzzMhaH40we
         Dx4Y34n0nnmBFwRjpWX8V2kd17eNbIV/yyRyU2MbCscmSgCx425hClZxZIupE2hD1FQh
         3d/qIh2D8aasyMNomFQvF8aRFZqfTtn6zDWmQIx9biOSzyRoPG4ANNGa7Kxe0+lZyCIb
         MWITk5JviQGDESOfLXYu7KNv8WiKp1DWe6ox63zbcD5eWjg3+9vBo3RK9tOYsbQjPLC+
         WGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877540; x=1749482340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
        b=d+qY0J3Rn55VtDcSfaZd7l2IrJtuQK+P30tQjQ7d/ZwvnGNn39d5ffhs9TNSU2I94D
         X3SL+HXLeaLNqVUC9+yGggsHyvKefdXLNbXc5lZeXBD8X51XKu4Xtd86dUXU8iLBuqn0
         Wzywx62DFcB+Mz5XPgAGAQpb9Zfu1Ao1GpvbaX5mBI3wwSCW81yBnx55oX1g8/8FmyP8
         fqHDPZYj62ZgvYW00oaHY0dFDBOpdhNuGM35T7fvMB/nrCjj4Ptnf4pB1K2oy8BGM53b
         dFJqS/mJrqZDoH0F4Cg3Df3DsOCtQBo+aAiJPnk0HNSJ788HA8h1KHeKW3aFRzW4oKPO
         Vv6A==
X-Forwarded-Encrypted: i=1; AJvYcCXrXoEuL0AKCeuA1kyrbRtI1x34O4G6fCLzDipsGGWgKTQfrQPN5T/mYRrFXikXCGDV0yo7jGDRl2aw528=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI9aqFg5irfjYOGfAsTHxbjjVwD7r1N6pPNrWhJs5kI8yfWWv1
	H3ZpPKknI0/1hOjKfpP/59e+GKyBrnJP+WFMSUKr0ijWQ8q5BaQdwWEhTbw+KCihhaI=
X-Gm-Gg: ASbGncvVXHg05pqsyljDeOC8kIY+/8aSH17DI0D0PTUMSxA8tQHYXz6R6Gkb8Tc5/hU
	ABElMkpQZW8XBMIc869iqzCpjLrHIT8EvF0BQDiP1hMBfcoXr3Ojh00niEsn+9q4OfYLxhqyAlN
	pb37aQEXs2VyfligUiN2/FPawbttDOQRFWje6vS3CfFBSX/MG4tgy7VzdLTKtzkSItX7PtVh35x
	MWD6BmQM2hsM36owOC/sBHV+lgT3gkKUdryZS5JqHhEEyfZYgSnrLF64JcGCgwXMimzOvEiAOmJ
	iSrcXT6sVgfDm212p3JTE569Rrs+S1DIXd3GaA3REA3EueO4kti0snUh6Pe6vl03yjU0apY3jvs
	pqny3jnvh+LPS
X-Google-Smtp-Source: AGHT+IFyISAqwMHhCGLRj9aCfOACSARamwm5CChRIpOs6jPFxpI1R1pUgcUMERHo5kjL0SIXDlP4UA==
X-Received: by 2002:a05:6000:18ab:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a4fb3388bbmr9485326f8f.46.1748877540038;
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
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
Subject: [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add module owner
Date: Mon,  2 Jun 2025 17:18:46 +0200
Message-ID: <20250602151853.1942521-3-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-stm32-lp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 928da2f6de69..cf1423ca00d0 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
 	priv->clkevt.rating = STM32_LP_RATING;
 	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
 	priv->clkevt.resume = stm32_clkevent_lp_resume;
+	priv->clkevt.owner = THIS_MODULE;
 
 	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
 					STM32_LPTIM_MAX_ARR);
-- 
2.43.0

