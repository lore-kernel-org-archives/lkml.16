Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A723814A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009186; cv=none; b=MCACxk4Yqfta5uzb8YqVj9B3Pzv+0BFU0AqzP6LCM8G0SIY1133iVo7AcWRDmAImeXKZ1M8e0EZgfTo+ANN3i/vdsMMObfLjQXeusEs5ilR3kE+Q+Et8dZ4RSka1F3AV7yKd3LV5oQOAW2irmnykD3u+/uSNJigrSewQ5f/fqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009186; c=relaxed/simple;
	bh=VF5hE6k/MDcqLuREIWpFmNpYxebRlFOo17tVqVOfzy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wj54mSipZsHF4Z0eRGpGW+jNEhxRWBTM6qZu7WCTtdDlMqN7PDCOnMYI85oSjk68QpIyPHP/6DxQeGVTEr0rqX3geOSERltC5xRySVOG7woPASNpqSVz9HHR8b7TkrPgEU4lI/6UxOcm558utjF5T52M1CrfgeaHIqqjRpHP0Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MmoMXDQp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MmoMXDQp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac339f53df9so1378196566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009182; x=1746613982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=MmoMXDQpSkwPOL1N3wM5PlpsTXW1hbo6pivRv85iro2MISs7YSPBZnNDrh8B5z/+dS
         ZEW5KB2ecmF6RlXa8qdhJup7dfwZT+OA7PhnEaieQ84nmcCux7bC88CF9m/ChaY/d+IY
         wNoHrsNgpdnStGgWXKKS9mRRWWR1aN6lEH8AMCpyUJJbChfkefqF8ESYkuKbkmh3qoKQ
         Ax3Ob8NTg+ELSoAxDd+cviyQcMup8UowetRfAMIfTbEjFAQKthUOwystrtGVNUYKnId8
         z2DVGvOnYK7Cq/y0fEGwUFZzJl2LzVfUefE8sq7QnMFCR10Upz0iWp14YRoodxND88A8
         crrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009182; x=1746613982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=kVjDKJPRAW442wAAu0aX6knYnCgBBuW6M0VwHOq2bFzwYhygJa5WQV7cn23k5rrp4H
         6TsO8rvu7lcdBbw3G6Mg0Hj1XuNBQ7rlwT0f9wCxVzbqI6LwWmij+naZ4h0j1E9q4ir8
         AhIENEiC2rdpbupznvc1Hv+MwV0NcrfTUaa8ZkQ/UyefBg1cImp0NIrvWQCuXDv/iocK
         VWkA2k0wG7g3RHaHWM7BWszcpC/mHgW+uPI29cJTRWJby3g+EB+xF7uOq8ec1t06Xd3f
         ndEejKAmsfrCrjOiiwn9fmNhCRQsodafO3cMFkXqfTcpHFWRfMBqPw0PskmU4mM7GfY5
         y8tA==
X-Forwarded-Encrypted: i=1; AJvYcCVcgieZgdNELmS52iffF9wzfdfDwyMERKejtxiZoutfau9/dngHtzgmA0sNLpsqZoi+2/tLzbudq95BkFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFqRGQLmZmpZZVZUMj43N/kW2mqkOJEPQ2JjkaY1aGtV2VWErl
	GknuceGPspii4K/bJTv5aIepw8jtvCKhO2CgiYGanaI6F0+mKk4zCY2MZnF8V50=
X-Gm-Gg: ASbGnct108d/OjAkMagfeEwdUpWFCn0RLhdKlgCT/54zwoWxm56yEkxw7/1LCN0WoR0
	YT9+Wp3tSONcsYqnlbpy/+AZ1tY91kRc4Hcfu7K21vrnDxTM35e86YWPKJaGf8Re/7MYNTVNwWB
	wKbypvy7SIk/FzQY4QUSzv8IRuGqa2h6ow2w7ufwyZqwks3QaGK585dF5buizLKmWb2zM3yeTIy
	nPcQGBn9zNTsle89PoghoPMKlWWbL4pYmjj4m2hfZGuNk/Jbwf+uFhpinDi+viSPQyPdnIqZIwe
	B79OHuL4IWeZ2BZhA9AYiW1ugWCeNzEUOXuTIyG7b2/tJfU0LqCuYNLnSRy6P0qD/NWGYzk=
X-Google-Smtp-Source: AGHT+IH2N+37bdEAp6umDXJ/Tn+PS9iQBAS/tLfvtmUbmUfhbibyBqoqYkGkCT5w9FYdpi9e+fyJqg==
X-Received: by 2002:a17:906:c10d:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-acee1f240cfmr179989866b.0.1746009166269;
        Wed, 30 Apr 2025 03:32:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:32:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Date: Wed, 30 Apr 2025 13:32:29 +0300
Message-ID: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add max register offset.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

This patch depends on https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/


 drivers/soc/renesas/r9a08g045-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..2eea95531290 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -20,4 +20,5 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.max_register_offset = 0xe28,
 };
-- 
2.43.0

