Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246DC22CBD9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877545; cv=none; b=Bk9wiHvUJa300IRkrwTORhlzzH4JYjSDI2SZyr7FAZRLIMnX+aER+I588dF3s6E76wzwWj3eIwCtD6RXHdu0wDqqtoxH+2IJUY3nTVbwZ+5foRbSRbZnHDD4mWcVdeo9tK1O9gFo5ohrKorYOKmozhm3a5LyOWWznmN4q3mzrGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877545; c=relaxed/simple;
	bh=06sqAxtbKKs7o6LiAk2AbUdTVmELzxncQQECi88QF6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsVAlLPpYPyFRg3GiISKW3+iZZy6T3zsThlDqMsvLIeJvglt06eUjWm3Ex7D1TA9BYcCNM2Mu92Xup/wPcIyMXnFUP3SR0cmADWXDR89wIAzneh37Vzt1oNbqgFwX7s9paJw5UgxGk0nvN9f3UZD88BFwC3l3HSDN5wZinBuOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCwPtLrM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCwPtLrM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a36e090102so2601615f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877542; x=1749482342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
        b=qCwPtLrMEa9XfIe28rpNV8P/HEmu1A37O8hO7Hd01kAMcadJp7ZKZwhLGkWJr4zaUX
         y6Kxo/6/Ra0Xn2JQUmXI5Oh8FF50vCmgAK+lM2ItUUNqDJwsPnAWkeSZCzSmufUDWm+P
         QAn/8FDu+3EbiluQPa17SfT5d2z7dwyV8ceb3k17Te0EO+E477mt/Y8Zl5LODjxB7LeA
         Z6MThAB55xSVYl+JSk754nE593kradugbtqeeab9nctLwSGII/zcsY1jx2Q7byyLmNiZ
         jk5oAVpY2H5QhrZZz8/nJKlk8wrqNXeSiXfdUlgSa51nsqUfP17AoIYRbGBKUiivsVor
         fjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877542; x=1749482342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
        b=ok7Pv+Srz6TKq8PpIJT7qCAgLYf9P1pr2r/pIU8W1e5pEMZMj7nUJeDZAqdgRwJmSC
         sNPk/FOHXmTHlqgzEaD8EA14QcOlmhRin7FjUgtOxJm/IySzILEDJe36bAyYTPsBHxa7
         sFp3jGNmTVnsehDYQAmghF3Omukl84CShX/3nE+cdxsK5l4aO8mFoTiPW0sK2D5/kyGR
         fKSvr39BCkkUGyucB2R1zj5ptDT3tTi73fzyn8lEVV2lbxlMfxtJK/Xpo5uxCbLH6TAe
         a3GLhCC5H8JJ+eHqGfVeb18PEcemDIA7Rgh7Ay5UvvilapoVGpzXy7YAzCazTRG26Z3k
         I9nw==
X-Forwarded-Encrypted: i=1; AJvYcCXjEQ82yztsw9XhOcrddQ/wfjT967GYv7DIYL0pfbWeWG2re94tY3hUK+3vr1Bhw3Rfh+TVpqNNN1KZtkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRvgg2jz2tIomwwNznOKXgHBvjjMOFhoMA5eifXDaZWklWLePU
	qfA2QY8aOs302WMDob0T6b27DCP36Svs+23++h82tFNOh9j761Agmi9UE88f7Hm1NEs=
X-Gm-Gg: ASbGnctp2A3uYQ9cJVq9+gobxIrFY59BMT+iCd3J1b0BgRfCZYAnCrwvtc8rq3Ii2Qi
	ODDWxy7gHkCcJj2qmIMzcsYwgKulFTdL1WBsDhe0GkrlGt25jTEIzLrGDPDUtFP9F/hgMsy5wj6
	xHTc07qRtoQhNvgC+kU77bYXg8cbGiH8B5Buuzzn65A64w3YwSFGz3ll8Wfl+N2PJaIiVq7ahzi
	C3XzTOd4nQEF5bV5L2BRKs0wNUyy4wa54hAXbdCYEwh2wDj/m5oPfm8RxFqgpMeNqoQBumL6n/B
	pdhD5dneonMeRiMNTjsRarYedMe+RruAniTFHtQL0OZEwk+qgQ4Ox5LF4ny5t8+Jio9BszFhsYL
	cOcHi08Yi02OxAVOll9DjTd4=
X-Google-Smtp-Source: AGHT+IHj81bY8BwahqqDfoqRAaq8f0rnARhmXR6p0QX+Wj5JW6k3OiLTjugCeEjr1Ne+gZ4EEgbmkg==
X-Received: by 2002:a05:6000:2906:b0:3a4:e2f4:a86b with SMTP id ffacd0b85a97d-3a4f7a6d22emr10375633f8f.37.1748877542385;
        Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
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
Subject: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Date: Mon,  2 Jun 2025 17:18:48 +0200
Message-ID: <20250602151853.1942521-5-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-tegra186.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..56a5342bcf78 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
 	tegra->tsc.read = tegra186_timer_tsc_read;
 	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
 	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->tsc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->tsc, 31250000);
 }
@@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
 	tegra->osc.read = tegra186_timer_osc_read;
 	tegra->osc.mask = CLOCKSOURCE_MASK(32);
 	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->osc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->osc, 38400000);
 }
@@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	tegra->usec.read = tegra186_timer_usec_read;
 	tegra->usec.mask = CLOCKSOURCE_MASK(32);
 	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->usec.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
-- 
2.43.0

