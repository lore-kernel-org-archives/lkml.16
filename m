Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B00D258CF0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345058; cv=none; b=jj6JfFopdVo6Zg6NCyYJxduvpqKelaQPvBVU2R2DdnsE8NDT2BJkqcUQNROVGPB06c2DaUyk9pPHV7wuLXl30T5dqJU85JJpNTHPDh3FUPn7EWxV862zVdMDcoGDijP2LbX+W1+mJNoo8OMVUaE7iR6NQCfuj4PjM+p6aYEJ1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345058; c=relaxed/simple;
	bh=ySv8MiicG70yIYdWD/VWDHOvRt6DoXeDwWbcOVt2NPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VK+Go04ktCkBlDt0zBWScpVec23xj22wzwVFqSJheQwicckP+3XJ+QZHMs00aciVmySoZA2ok3DUru5VzAZRWfI4s2OqTLf4dWbll24OoCHcv2tsKaIjRZHF4kMj5/MtqvG0M+gCE7vQ66a4qN5+jRlRbyiNZ7pRpiQe80rhMsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j3+vslsy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j3+vslsy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad52d9be53cso459258066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345053; x=1748949853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jQMddyz/b9XXlkxpzbvlzuW6mWfFvIUAfUlht1RCuA=;
        b=j3+vslsyH1dtFNBODGdVCCgWnY3MUxuhLPYUAaGWlBHlt5ChsZ53g7hABUkP0piTub
         +HdNhwBushnodlSCxAqfFXZasHfgNgxB/TsUIySrGl5Fce2GlwlifXZHJAcXspGXhQgF
         iS5eN1GNAAfxFjAmyGqu8Si+35YipzUJb1ZHBGtOEgLOwdIYjKXXfa1c2Hnf8T0h8Kew
         O2QT7d5rEwEhCUNE8Ke4eIoSL0p6aq7BgQG5FZCfx51lTqcloS/Q2N15e2P8YoY62FWe
         SALGWm7tz7NkQViI3A+UjE0Sr8chvrGeIOI1ujq37/cagkG3SxSWUNfUXNEApluz5Eos
         LKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345053; x=1748949853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jQMddyz/b9XXlkxpzbvlzuW6mWfFvIUAfUlht1RCuA=;
        b=TUZJLwzubRqqVtCYBun0WCOf2C0xh+2AiTmvyodJKoBMOZDYI4izLUaQ7PjUzwApSV
         s5cgKTXmzfUBdwGHDkD8RCRUq3CV5uoE85Ss1GUtgBBTZlo+wlMKiw08CjLPj22AGKzO
         n2YKTi+DEQvCZoyb+0fNXDdojNs0UxZW7zv2ISaPPdMR7CZD1kshpeefIwkOAeT2z+pj
         ovjxMjQKFXUr0rSyXkWI/d34A2keEcsi55Y3wZ8LRHpguSeD49lppU9BrUAMdKrjYMlI
         sUe84z/7Yyfhp1JZaJYoFjov0rER56OqFqvNGeGnt5sgRvot7Eyq8HOhzJ+Z4m/5qKQd
         avEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4bSFajlyn1Wh1AYsAqjE2Tv8g6Ho7CByZSrSqf1HgAPUqIyDnHQQDuA3i/JhV6e8gp+VcQ1IRorC8jec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxojVYHig5y1T3l7lsb/HkdoLuHt3Ind5o3Ka8DWCkrhlk67xt
	r6uwrv1R8qku58iQ2dMmNHB1LOGb5LvPpBOcjhSvuKPHZk+gXDsEv2XRg9bIjh3UztM=
X-Gm-Gg: ASbGnct5xVSq8QlAcuOQLDVuNol0F1/wO4m2iYhpYQvs4lOiA2EuGvjgnW6SROGQv7y
	URyXHhI7zgYBYcKhCHLvnnGWMqcv+oDEvTKlGuEvDYrxQb2LxCsOjVrCaLbO7unkTf3rcM9mJAf
	lGoiNoXm3GpXTOg0l1o1oqnbCPYUw5D7HfQCBj0AczC3oZm+VW7egGjp4YUXDSkibDZZux04FiX
	zCqUErIIaO0qxj4eejrS6TpJkub5fg2FhxKu9ouWmeXbRm2aLQoaa0MMsFlra1+JTxwr58/Rhlh
	+HSrzvaon8llSMwi+jzGPCstQJnvNUL+xpdQrPDo+VFEvAJWZ60gxyl7ArZO8YO4oxzvTipCeIl
	wvbUB
X-Google-Smtp-Source: AGHT+IF5akmMqw6CEUbR/QQ6FymHHooQEWDKvO6sDDOO00kXHdchwWD6GzRsG/MefjnDhLywbLaIOg==
X-Received: by 2002:a17:907:869f:b0:ad5:a203:b6ba with SMTP id a640c23a62f3a-ad85b22bbb6mr1281210966b.43.1748345053131;
        Tue, 27 May 2025 04:24:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
Date: Tue, 27 May 2025 14:23:56 +0300
Message-ID: <20250527112403.1254122-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- postpone the update of priv->clks[id] as suggested in review process
- updated the patch title and description to reflect the new approach

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..c87ad5a972b7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1389,10 +1389,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
-	clk = clock->hw.clk;
-	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
-
 	if (mod->is_coupled) {
 		struct mstp_clock *sibling;
 
@@ -1404,6 +1400,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	clk = clock->hw.clk;
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
 	return;
 
 fail:
-- 
2.43.0

