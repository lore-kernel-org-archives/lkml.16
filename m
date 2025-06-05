Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF38C1FF1C9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096545; cv=none; b=nwK31dnO1mDsfBkCMfM2LP+gn4hjGT7vNM6+iBgF+U7WNjWu6gVwsQQwnHzTFoKAsbrpq1x/iWrRJ/S5XMyF1o2UXfCFDi4etiKqUlnAgPLgEyRSVNLEgaKaiTZjYakyaUepWcq5+F09TeKpYl1mIjUMpynRQQ5stvfSSkjaaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096545; c=relaxed/simple;
	bh=Du3nF+4TgAoVorAuFPh7JS2xEyp8iEm1n0JyZQ91gOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sIjBZjLdBb5ELOzSafugMNZNoHs9s+3V23GH4NL0Wzol02dMb0bM2Ck6iw7x8TpOSPHyMnadW0YnDjqMG356ejapshylGa1ePuYzNfLZ6i6EQIO7Sld8pGoRL32Uihepg6TpsyB/AEO1hGxHzE7wELuUy7UOkymUHyevEFhQDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=ZL3s7Jij; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="ZL3s7Jij"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so607318b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749096542; x=1749701342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX//QoBGHGr5lY3j3Fpx+uZHdmH7HbmvrluHo6+r6xo=;
        b=ZL3s7JijpBHSJjY37LY10NFS3IkO55lREIVNBcpWzhi1E408kmDTHs+bc1wAizsL+m
         5CBbGJUlLM4KiayAZprriu4IeuYuCtOhro/xIL/sjs6ma0PpGMei/1jcZM9JcJ6teLtg
         LOLVFEXHhDxOlBUlTp3UN9zojC9ISr9zeMmYE0lUf6z1wf1pdyBO1c0dqo/N10ZStFN3
         mI1IyWLZEygmacI5ZNeJgk7fBmuR3fECHYACYB6ZWPYHyoKODtBkVH1ywv0GSuvnk6KW
         FGLB5CEl/Vkl55iARr9DYKbu2PqexsQT8FGVRbwuZYj7bdFOr3YCUZ2yqA9yzg7q05Du
         q/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096542; x=1749701342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PX//QoBGHGr5lY3j3Fpx+uZHdmH7HbmvrluHo6+r6xo=;
        b=rI9w/9ozHg6bR8etUiReHdIYHpaxYuEVSSwnh5AzdONvMalgiY/iLCWRcke4r7L+j7
         QxIGAcMbp7UH+S+nbGKdTajRh2X70dhNQAT87TMnod+JO7KKoa+dKPI1TF8ohiOeajLN
         9j5WaCpKWxHGhye7NrTwgZkQTn30/5/P415EzT6eWKtyczRxUplHnuD3OrRYSyj4dTlB
         yumYyx99j54Y0mw8FZmxYPnyszubCU2ycW6Aa72L7O5ewZd2GC73t69lVmZ5MoAmdtLr
         Hfb2JO6ZLUp99SlB6M3esTVcyyeY6NeOMxVGcG/FhGfWDVqljSgTpJx+0HLAoovVCzDO
         dHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCMx8WiU1bNWcDTif71Ry3pxcby65fuQN7mTRh1MP8tqxq1feXl3D09cuAb3bggk2ZB70KS0QsYcqx35s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyha1lsrEWJXsvWdu40df7mydw4CCOSoGCTfJaI9P/o0h+suS
	Ai7v+GXSoFm8nmTJRll13uK2WHAFKsQ+KA3TKbHX5YTvWjEcWaLPdDmToNJacJ4eOLQ=
X-Gm-Gg: ASbGncuG8gVESjcNIF9YlCnljZk64NB00Zy98nSpiglGU5HntgiFB939KAx3/phgKXg
	3gUm3wW/CEQUbR4PHLs1DT5xVVyX+4QU4dwNMa/1xFw1VaJcERp0VQZPzI/z6FhR8XpZMrmwz4Z
	tH4LdCyBUGQgyhag8kQQW4ljH7gk4gwZyzMFY/ZKT6N55uSx8T3HNzLWAyTHH+ne8PcPHoX3dGM
	Y//etePlrbvtYKJnSEL6li7tDv2u53CIgBk5z9aI/9SuleinbWptqMWi3Eweaa9BiAxd4EgwkiL
	AfxkvUFtF1GiE1v8xP9tINJwU1/q0n1SexayZrp9PU1UJ9QDEhLWa1glzUl+uzsA/6SkqEQlISo
	HiE9m8KykJpBrttO0N4XYL9UVCBkrSw==
X-Google-Smtp-Source: AGHT+IGFn4s+BWHMZpFajqhE9M4XL5w1WKIteuwhvPtoIG8N5fx8W5N53z/3lQF0q6Q5jNGNoeQXng==
X-Received: by 2002:a05:6a20:4325:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-21d22b46de9mr8166458637.3.1749096542055;
        Wed, 04 Jun 2025 21:09:02 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb029fbsm9480924a12.13.2025.06.04.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:09:01 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: [PATCH v5 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Thu,  5 Jun 2025 12:01:34 +0800
Message-Id: <20250605040134.4012199-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605040134.4012199-1-chiang.brian@inventec.com>
References: <20250605040134.4012199-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase (X+Y <= 8) PWM controller
designed to be compliant with AMD SVI3 specifications, targeting VDDCR_CPU 
and VDDCR_SOC rails.

Add support for it to the isl68137 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v4 -> v5:
- Wrap commit message body at 75 columns
- Remove the incorrect description about dependency of dt-bindings
- Link to v4: https://lore.kernel.org/all/20250602050415.848112-3-chiang.brian@inventec.com/

v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3:
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2:
- Modify subject and description to meet requirements
- Remove the override of isl68137_probe
- Add the of_match between raa229621 and raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXm-fPD70uN-mNJdJkzf9B526y8p=Jh5E+W5cwJ0NVhEQ@mail.gmail.com/

 drivers/hwmon/pmbus/isl68137.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2af921039309..c52c55d2e7f4 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -63,6 +63,7 @@ enum chips {
 	raa228228,
 	raa229001,
 	raa229004,
+	raa229621,
 };
 
 enum variants {
@@ -465,6 +466,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
+	{"raa229621", raa_dmpvr2_2rail},
 	{}
 };
 
@@ -512,6 +514,7 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
 	{ },
 };
 
-- 
2.25.1

