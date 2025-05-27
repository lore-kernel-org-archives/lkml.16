Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE42725A337
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345059; cv=none; b=Ofx2JHsCEgb3DmDYyCAr8yIT1QaNq31OHxCbDzuBZGgwwhR/vSpX1JP/zNyEE14ubFFsYQzI50Ghs4sltXDXUAsTjcckgSNmWwG9rx9/uR0LVu/fLX3LgHGYd0egN6OcseM7xsJ5G/SnSDQQmkGMiDWa8UV0YEeF/xBrLk1psC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345059; c=relaxed/simple;
	bh=PcZ3HrcegfnXqs3zq2KhUtyO7SNQPGKEOh8eL3A9+lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q28klWSU+w8PedfxYJu3UZKg52COfL9nfgIVHHxwi+76jS5Kv/TNTS/G3CeB7srN2CASddzbOtJxbbtMu5OlYtu1+kzgzSOiZwvEL6bbtz8lzQIcVsGBmGqG1qn4oX3bxoOf+d9gaHvAw4NDuIQsTRtxMT/tU0081pTZGSggXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M+Iei9aX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M+Iei9aX"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb5ec407b1so541849866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345055; x=1748949855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDUY/udCFbCQ/CxzHCrSVeL89fSktFtkiZrjui4aduo=;
        b=M+Iei9aX+uPj/9YBtlwlzLDtUdKJgKpKQGWW5jWhq5Y+tNFOjLFDZJ+vTQOP/G09se
         I7vdHGsY8wEm2XFe5Erchvl1lL96HV7nBTjgbEMAfSvb6qhC7eJVVmqqwjQOT+oJAAWa
         ckongLEym4348QLaeyfgNUQaifMXNLNfcY09IniINPk85QJxh4HkvrQqxvuc9WOFq5Re
         N3mtmvSsmdHH8slxgmihNQQQzpb+ein65MC5DcIwC4zHoaCrx/OCoGnKNMNcBAFtsLjA
         7zqfCHcB7CEqjW/vpuzbi18EiQ+aufhz0UHmd9Kyplmoq+Y+tRQyVM3NlURTe8YEa9+O
         I73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345055; x=1748949855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDUY/udCFbCQ/CxzHCrSVeL89fSktFtkiZrjui4aduo=;
        b=eDpPnLItc+U7MjNhU2KZ6bJYwNnIgBoTwoO8uQUS1RppBLy0U620oHx6bqxE9enA4N
         9aHDiSnHdGgUZ4oiFCUWPDk3l9dc6QskRgn+TWK5wnsMsJFLSpUd2K6YByO3dJHpPoZ6
         ItoGEGHOfNELqqWK4qnYzOdHN8wF/erAaBKYQb5hL571at6jv2QdpCEraZ3vexgQ6UuD
         FoGfaZ6iUlrm5dkUGGgu16V449XsojBdUU219RXBUrtbkMjaDn2sVUP8Nm/hUOHw6Ytw
         YDMZ5jjxlwWuzgp/Ul7q/+GQp+mOCwsRVBraU7mdRwnjeVb0LrPteBpCXaU74ppNIJlt
         Xn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIlnn9XpQTae5F4LuqoeYM0JvFXjOvD04ge+mFJOUwjsmFSjzykFeZ0CtroqUEdqN5+hQzwAQz7DIkRHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsbJdkXLq9MYwmPhcM9Ok7tQtk+qE10stsg8Gcc+Su/vRItnJC
	LVYQy/CAWQqRGpXuB3nGviCujr5+Mraogj7Ye8KU45QD9bKJFYwm5R06udWF0k6mzrA=
X-Gm-Gg: ASbGncsF1vM3Nw/6R+VM5FEuHB1zxKaZmjKm9+0RTsZMJW7YJMA0zo0qjMm38SurzAA
	EQSqFGNCP0LqtqqsbLTmy55DpNlxs3hHlBzk+Nh15jABT+NppTMn8JBY5xBkTF7AgE1QjeuFVVg
	XFwGi6s/viTgPk9GpQuBs5Q5wzhwhsJSJzpj1FvBFJ43ZfBD6/uF6xBZdC9vfUKtEqzBAE5Iw1D
	p51RKk6e1TVmQzSFqFAR7LwvroptIyrgsa3bDKKX6KmLTfvzWB+HAYzCH7XAVisxVKJynL0R2j2
	YAtgBSSz/1yn3RA9AIAehl7XtBH29YKUgR+bPxXYYSFbnTjBkMC4Z3HkasgHj10QZtosurLAPMs
	zv3bR
X-Google-Smtp-Source: AGHT+IEapw+oDUNYJWzRpbqivOuZHluFTkHfFwaB2YzuwZtTgF3IVbvJeRzozPCVZmCAbTiyVocwyQ==
X-Received: by 2002:a17:907:3e9b:b0:ad2:2d60:24a1 with SMTP id a640c23a62f3a-ad85b130284mr1127859866b.11.1748345055154;
        Tue, 27 May 2025 04:24:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:14 -0700 (PDT)
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
Subject: [PATCH v3 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
Date: Tue, 27 May 2025 14:23:57 +0300
Message-ID: <20250527112403.1254122-3-claudiu.beznea.uj@bp.renesas.com>
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

Reorder the pointer members in struct mstp_clock so they appear immediately
after the hw member. This helps avoid potential padding and eliminates the
need for any calculations in the to_mod_clock() macro. As struct clk_hw
currently contains only pointers, placing it first also avoids padding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- moved pointers after hw member
- updated the patch title and description to reflect the new approach
- collected tags

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c87ad5a972b7..767da288b0f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1185,19 +1185,19 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * struct mstp_clock - MSTP gating clock
  *
  * @hw: handle between common and hardware-specific interfaces
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0

