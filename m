Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79922A4ED
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750266; cv=none; b=oeJXF43XoxDhnoTCtNoNkqo51/DF07RBBbkWCKFvGVxi2xjHk8cFXS6mZnhv52x/VV4RrMlbd3UFHy4NR/exgiQUofbBm1LaSvfeIhWVv2KQZXYQlHJ+B2abeMs+25IG1Td8lrgJV8FdAkpKbj8VVslAhIw/59NC7KiBe/ULOkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750266; c=relaxed/simple;
	bh=RWT1F7pmBqVrbQZz5ukpm2RPLuLP/AznOyHLCJGGqU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJUMugnAlFtH5g0RAUJUhI9pdGeD3FzJblT1ArTbYR5DR1sO1/tLPT1ypfShyWwcMgjqKooG0UlG4KWR5aWPH6VvH236cDV6qrmbwhGxkGJ7Lvt/7Bhn0Lu6ZavjSofptMsd0dSRlVrh6WKwjo77CK/5vlo2j6LwsTmBjYPHLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TdofNe3E; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TdofNe3E"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab698eae2d9so42163866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738750262; x=1739355062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9rT/dn1AcrKmdTCXQy3CKUwFE/pnAM3EwGBAXzi1R8=;
        b=TdofNe3ErOvxQBvRVjx8XmE4kez9pJ6AMobzESkCZmRQToFPCkZ1k016H1RRTCi+i1
         pauvKlcCytYIgxzH5yqaFTfV2fG9jopmv2P4r7UjVZ7S8n31QysFOjuUalcu3J5bkfb3
         IekRSzOnse+hx/AqGJu3WOb9kVBoSQntAqudQVcIfmBimtzdYeYymG1/CdSFUxFtHqCg
         E/N8k1+4ixwzXI6d8OwsNJyeAPFvC6BwhfGAt/QVBujkuEHUvyh3l2nkbyMjhNyYXYR6
         Qd0FQBc36j8z6WKnvO/Rz6ttNywEGIzotmnaF4T4VGJKpZW8j897+EY9NA1sy0RmDAl7
         rMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750262; x=1739355062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9rT/dn1AcrKmdTCXQy3CKUwFE/pnAM3EwGBAXzi1R8=;
        b=YM6cbF/pEDO7B49eSAhCitP50M0qnJ9iaHcz6fmLaj4YmBTE/MxCkEva50wYP6WMx9
         2B1DLX19k3+NZQgOwYEgIrAPTroYQzrpoWvSxwSpWYDYcxxcOGDw2cO+qRZulddgYrFX
         vNZcYgXDERUG5SkG5elrs0CnPgzeOXSls22gWmp7Q9gFY8NuoguqDbVG/Mkicbmg2drQ
         zOI1wcdu8lBm8Oh7COSmD4+2piVJytk5Sf1IG6HiWiVdaFddoWhqJAgYv3PvRRoraMBK
         nJwTKijTJEJ++8FO5xUwvBvrfdoZOapOiVksx2gL3JTJ+FRHd9sIAsgbv8WD+cZUSn6n
         XAmw==
X-Forwarded-Encrypted: i=1; AJvYcCXVlP8/UI8bND1VTT02jAoQJxdUvCMdIpBFsmlYPcemnZmaEQ/cqaQ60syxohGMGpDXNrDiM6A11CLhYQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEA6FyAT16X5Fx/lZ7ytyGiLGnuYRSNLQialJwVf13yOyTvwrj
	ZddQapNQYFh9aR/ehLnE8kGTqMyJZd8hcjiGjJEttWBXUed74KyscXltObdiXc0=
X-Gm-Gg: ASbGncvUrSE9+KKrfEYhheVkA48EaoaigXtLjMCjaERcY/cY7a9nqW8b8aL4oc06uVS
	1tGZhKEvyWdtwEwI7LoGUIqS1rppBPLp7JwBPIOFyXo5ZaWlfNvw0vEfw03sx2pQVAuKb4kFw8I
	92x+RJezJUj6WBUy2tQNftacTSDB0d2gAx2hGM6upTYtb2tMFeNh/383NTxg+yepvlSIwh7ffyP
	MRJL7LnlCJt4f/nbZyVYXLBAHvne6UZa0GT7Xlj2S45n5UF7IyMs14jhi0qpEZpB9i354UzxSiK
	VNzhfd/zzj2mix9tZeTJPdotEhfmeplaCQXfFlGWTF9Btw==
X-Google-Smtp-Source: AGHT+IEBbUlXHEkffcTPN8qkdd5oPHa4MpZilorcDJPzaIEHBuPDCfeXbQm4lsXhEkWWjFh6qTFGDw==
X-Received: by 2002:a17:906:c14f:b0:ab6:d4d0:2be9 with SMTP id a640c23a62f3a-ab75e3235f7mr208848866b.56.1738750262261;
        Wed, 05 Feb 2025 02:11:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff3e4sm1069059166b.110.2025.02.05.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 02:11:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: linus.walleij@linaro.org,
	peng.fan@nxp.com
Cc: claudiu.beznea@tuxon.dev,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: pinconf-generic: Print unsigned value if a format is registered
Date: Wed,  5 Feb 2025 12:10:58 +0200
Message-ID: <20250205101058.2034860-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Commit 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")
unconditionally switched to printing hex values in
pinconf_generic_dump_one(). However, if a dump format is registered for the
dumped pin, the hex value is printed as well. This hex value does not
necessarily correspond 1:1 with the hardware register value (as noted by
commit 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")). As a
result, user-facing output may include information like:
output drive strength (0x100 uA).

To address this, check if a dump format is registered for the dumped
property, and print the unsigned value instead when applicable.

Fixes: 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/pinconf-generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 0b13d7f17b32..42547f64453e 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -89,12 +89,12 @@ static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
 		seq_puts(s, items[i].display);
 		/* Print unit if available */
 		if (items[i].has_arg) {
-			seq_printf(s, " (0x%x",
-				   pinconf_to_config_argument(config));
+			u32 val = pinconf_to_config_argument(config);
+
 			if (items[i].format)
-				seq_printf(s, " %s)", items[i].format);
+				seq_printf(s, " (%u %s)", val, items[i].format);
 			else
-				seq_puts(s, ")");
+				seq_printf(s, " (0x%x)", val);
 		}
 	}
 }
-- 
2.43.0

