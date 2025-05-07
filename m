Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B553283FC9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622245; cv=none; b=YKzrzWRCQQ3NqBtXVN6vCiiCQjudIOlN4eeN2WkAIOe82bsbikdxpzSoxmsaqeNY4DmWaBspoez7q8WCOMyKq9Isgr8b8o0lYsPBFoqMRKu1H2x2cinibkmGtXz5CLyvr4sfkiMlepBFZ/kfTiJYkVcl4iSlTFwZL8WOLDiOY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622245; c=relaxed/simple;
	bh=cSM0SXbi9Fi+cYc6Hqvd1VUGwSL3FdGobsRiWjVTLxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=annz406zuyw6fNV2XTtCfzdmtx0OekEYuQ+LTDTWhdmQNjzknVPrI4/E/00mWJJdSB40zEF8qYl3jZA/gyWAocJZRrbZN5TYfHoYB5np4zD+j5wMwv+P48cM1Gbt9MSbCrDiB0PxLquD385AfLZwXl98CAvK4JHHvrDz6tMrNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lo4kv64Z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lo4kv64Z"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fbf29d0ff1so955427a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622242; x=1747227042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II15ozzD5Ll5bPmianAxLgZ6qAOgIxXenrt045Eb9ZI=;
        b=Lo4kv64ZopQ0mXQOobY7q8w5WtWOeuwyKhu7i6D8uYw9eHObqv22iSMZburpsMq5DC
         vUqE+sB/aNbYyXDsBdSnUU9XaqTypjMR8nXgR3wVKPpuG3y88vuTLdYJB0w0TLOts1Tk
         KQ1VAXahhB3mjqEuPwkBQj/qLPBV+Uq5mCkdWPAclmZwIs1gmxihB7PWaSntNw2qIO5y
         OpWHTDgIa5PmEy7O/O7KDJGMGEeGknxsne+xD/IFjYeDIP4iy9c8UsZ+S+y1CYIGjlXw
         VtSL+22LegsWWWrghttxf0gbO5//1YsyFCEcPM4gZBpvOJYeI3rP9PenGjcYrG0/eyi+
         ThrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622242; x=1747227042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II15ozzD5Ll5bPmianAxLgZ6qAOgIxXenrt045Eb9ZI=;
        b=waWzjyyARhE7dWVfPZ66Z+seJTGvYwxxAZwK38Yz7E1d+87LAfqKRy0pKUuLO2RGqs
         T/GIy73MaOKyMMQ3vARSx6chmjKo6PIiwKWuItk7FVZ8ac6HmLVsxaW2XnQLGd9CfynB
         ZJAdlZK9SMGS4O7tCwgVH4QgWt1UxneXxU7SH2HbxPtcelJ2THIp+10E82VU5oA2+pQr
         M1CEzoW65Av59rWAIoTyV5hFRGqKKpL5uZuXu4oL314Gfwkbz5Ox2JN8URpr6Nh9jxkA
         ULbGFQAEsCnizkgJP24ud4sy1F0/YloE0+TfByaOEGdYhb6DOjSr87wkaipE73XXqlyv
         xpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmy2b8BbKzOaqwMS+dPlOM7TeO/ytfec+dl5p+oEvbjwI9weEzXU9qZViJQ/U4WDmLV2h5aSpaowx5RJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6zjeFSMGSMK/RlbWdsFelISQuLOEXA7rBlZZBKpjBGR+oag3
	g8krwIDACOLwGcnMzaqf8jJzLUL1wlbA7fCiwaR2G9+v1d71cVPrTdLkWfJjrkI=
X-Gm-Gg: ASbGncvYRi1tA7bHmzIrHxl5e9TCixBTjUHqZ56W2paW6Ijj3/yoDesrl9NKBan4/tO
	R3Lh8zmC6l7uiD+PTsGjuafJ7WRyKUHltYRs45VgJjPeSjQLMmY+FZczma+s4j6+AWKVSbOCyTs
	/Dh9icATOZn0mZXL3eNnG2vBH3o117qD+8Vb2Dixet2gDVyxe8TbAhDhke/xH80Y0HenNSLd9pk
	ji6c/P28vgRjmZxw1sO6UzE+kyRdZmkDO6XKcAGcSnbdLHMllKkfmdSPGAQ2BqeQMvMzmIViMIG
	yDiEINuY/PjOwkhmLsjofyd+ZJVGeYbirTWgSX56fGdyTlRcO3lXeZVnslPJsVFBmG1ynkE=
X-Google-Smtp-Source: AGHT+IFlk8miHuB42VMfUHBSf4Jai1MFWbXY60yj6sLC16sMrTufuU3xeUkiepwAWbCikXCtbz3w5w==
X-Received: by 2002:a17:907:9411:b0:ac7:391b:e684 with SMTP id a640c23a62f3a-ad1e8d9c78bmr295475866b.58.1746622241642;
        Wed, 07 May 2025 05:50:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:41 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v3 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
Date: Wed,  7 May 2025 15:50:31 +0300
Message-ID: <20250507125032.565017-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Assert PLL reset on PHY power off. This saves power.

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags
- add an empty line after definition of val to get rid of
  the checkpatch.pl warning

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 00ce564463de..118899efda70 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -537,9 +537,17 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 	struct rcar_gen3_chan *channel = rphy->ch;
 	int ret = 0;
 
-	scoped_guard(spinlock_irqsave, &channel->lock)
+	scoped_guard(spinlock_irqsave, &channel->lock) {
 		rphy->powered = false;
 
+		if (rcar_gen3_are_all_rphys_power_off(channel)) {
+			u32 val = readl(channel->base + USB2_USBCTR);
+
+			val |= USB2_USBCTR_PLL_RST;
+			writel(val, channel->base + USB2_USBCTR);
+		}
+	}
+
 	if (channel->vbus)
 		ret = regulator_disable(channel->vbus);
 
-- 
2.43.0

