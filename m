Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C6D238C3B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877549; cv=none; b=nfBlwdmJTBssxDZdjEisRDTFl/aHjHNJQMFZljo7UGVTYoTRkDaZU2QwzjeRYzntulVRqGJcCwwKSZW/3wnuj667KV1berucvNCF8UaYAaBxvsMLUfPyKAlmpsv24knAMNKbD1Hdjo1VJRxbXtIeay9GAU+Rf4BEzqta8Trjg8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877549; c=relaxed/simple;
	bh=hUv0mIWbDZHw2AgsshB1b4pGaBwY9mA7lDi8KBrhZs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtkOONS+dyXdaASUqzXVLWJluS6Qcazqh391zN2W1GzYF7PdVGYTjYiBkapMSAvSqS1XtwcLJK/jmYUWxIrQLxl8Q/ir8yoHhq8MpE5hSFrIc07fk/2qHIpjxaOtTRVl2mEhOn3PKFfdVGDZOaleMC6Ui7oCQzFZ/sXfNz4DStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlHCu4gS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlHCu4gS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea341570so31275395e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877545; x=1749482345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
        b=xlHCu4gSX4z0tHQl7keEFb/t24BH/inIQkllmmdJ4csexUC0wZS0+DZ3e1WdURxazF
         PF8OAuoFN8QHv1WmHiBCPXyKsRJZ3D7WOHweDjLMhOR0XmCW28zkfTowyoDao+FrMlK7
         8FxhuZ2o+YFmueQon8I6Kxv91DPQ62kssG7FBV4WnTEperdju6D1BaeXarqbwNMjLMJV
         fX7ergrDJ5HNya9tEzP4pbcr9tAAooG6aSM2P8JVQhxvAmn45ES7277PVAkIKm0XHUOU
         plqdkWAQe4+AErD/kEJnU2R85ZRqQw6ygn8Tg/454ZAvULStjx8FnsleQG7e1Sw56Vyc
         m+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877545; x=1749482345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
        b=pOQzHLKj2+qy5ipLHtHO0SaH/aez4t4nefnefxqEATFwqKVPcu71Xey1Gx97wcfpnC
         ljKHXRjqRWRZ10Y9P63FEWQKFjJ/V+vplIzpT5Qy15c9fb5evLeTKqUS6DHtqOXbyfga
         Djyz9tD/Ui9Ax/26YTiF+N22ihQ4gh+yLgC6+jqwEovGBQPT6J6tME1a4IQJrYdXS/uz
         NLSaHqpK2RK1j1nfT0nu96Ppt+u+VXnXZN8/WbHg3+OwBwR40J8kv2q33uLK3RNcZVkJ
         9wk2bmZ1urECA7gCfjbRmWYCg1EgVoIeh6ocju7jpVADfLCK8wQS8NDLgpgpqB1V/n8F
         VflQ==
X-Forwarded-Encrypted: i=1; AJvYcCUispCLg72jIq8k50g9iixFrUCTJWCum+HvpFSjMcuWkSytrydEZUzYJwgsdXdvJnbaS90dCciW65wtark=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6omSdhMb55ANXVEERNlxVN0Yvgu2DC/oJsYhuynsiasD9erTz
	aBoWqDtuVWmB0Cz/bTNfMn3dAz8uaQ3ZXsJcJ5MJWViRDexLITz7fZU7DES3f5LDh40=
X-Gm-Gg: ASbGncvX2W8VzkAPN7VjSS+auLEUOcOTd613bdRXqrLJ202rAiDpEg2bqYS3vG0TIGl
	hL0VLLbJqYhiY1hEoy1c0MBkB5bzPB2zRzhjI9fDpFrGCqSjQCwEJktiYB8If/WQ0jmJdjSuNuv
	+rtXVCzJH4IJAgcB3JY/WLJ9EybpHrgu+QbyzlTx7g9pF5omnsAo+yXPEi/CFn9Bwl3fm5dQx7l
	nqWAQFUcP+5bqjKd2jkpdXdDgtb32wopGWzbCYDlI21Ud6DDkwb8aWGJz3d26ajScMUuKUhHQ7X
	/sfGnV7jL3dEcOiHtGu6DrVCl0M8qm3q/sm323oQUxvJfYNMgMDNEgGsXS96ZRQ5DyWQ2Uz8o0Z
	nhSH1RcWmUiWr
X-Google-Smtp-Source: AGHT+IGtDDtI7FhuuIjfq30FaLggo6siUgKsnVHXy0In7YrLSlYbl67D9UVPet7StdoKw8HT/BY3WA==
X-Received: by 2002:a05:600c:3e06:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-450d888b0femr83074465e9.28.1748877544845;
        Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
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
Subject: [PATCH v1 6/7] clocksource/drivers/cs5535: Add module owner
Date: Mon,  2 Jun 2025 17:18:50 +0200
Message-ID: <20250602151853.1942521-7-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-cs5535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
index d47acfe848ae..8af666c39890 100644
--- a/drivers/clocksource/timer-cs5535.c
+++ b/drivers/clocksource/timer-cs5535.c
@@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
 	.tick_resume = mfgpt_shutdown,
 	.set_next_event = mfgpt_next_event,
 	.rating = 250,
+	.owner = THIS_MODULE,
 };
 
 static irqreturn_t mfgpt_tick(int irq, void *dev_id)
-- 
2.43.0

