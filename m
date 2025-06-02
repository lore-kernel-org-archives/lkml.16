Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A718D63A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841103; cv=none; b=mAlJsdF8jceZXlsllD+rQ3LXteA/RprPbjUQVmLcfHoZK3Iytxp7mfkuyne1Hwpxn+2LiZ2z0BP80EU6oshMc/sgYHFbcIjdQL8oGkxFQTg+BGYFdFFh+hjTVYapvVVg4S4CRWn49m7oV9C3nfbsqee8bwzXPVgAF1nf4PHibYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841103; c=relaxed/simple;
	bh=+pqB+woQ+johQDR7Xt+BkyHCFQPBmolBse1yy1Pv8T8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RZ0/5apD88INjqFEEQ8e5V53/3sI8eUjCAgl8iaqLRP2nK4ys3R/mUdmREcH2IQhU2iRf0m0AE06XkZuvb9Lp22tSEWuuDbax7LeO9/gLNawGh8E9ppjsLMjHwQs6Xt9AvzaguqeMxIl6P5DOsufxC+SbGr4+f0ozTHL9PivJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=bJHOkuky; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="bJHOkuky"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d366e5f2so51184915ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841099; x=1749445899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX4qDXPOyGHybeO07OFB098vYbgW31M4pU8wGvxmZ/8=;
        b=bJHOkukyjQZ5ifLiEl0myWuNF/sJV1d3PPHO5MY/90iI1fDhbYkpp65Dtqe5HZDB9M
         0RFTbwlu5nlUhrs4MUVP/NKEZtYlBws6R/EaS/507s3W6TZZA+hsGQ4mtM3Iro3+U81c
         WNXnG13HYqlVOA06g+xYFpelzcewdzjI00SC8HVeaUSVeDcd94PMlKgzEeRCISm5SVq7
         9PB55OpjNMuCEgiMDMYyCM8tAXA+9ZdNNlSbCKrFluOvo20Dz2+uDQ3/35vQ7h9T7DlC
         3KbQClvmK5D+7j68OasTakHpYcez/KwDgHTtTLMvj6E6KPuSs+EBEh3mYaS4hJLHzgDk
         D25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841099; x=1749445899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX4qDXPOyGHybeO07OFB098vYbgW31M4pU8wGvxmZ/8=;
        b=GIN4NkMa/OlHj+gvw76PWf/2ZfDwPqCrJjHw2ucaUx00q2AJbisM6t8xQRecFDDQU4
         16TY+ZKKKTnldD4DbUNMMX8YZ1NDpR4gIxCPdS00nLyPvYkwJ9OquW0iUHNQOUq1f/yQ
         3HEr6O1RIJM7Ho/iP84fj41PeccY5B5rfDmGtAhJTC/MclklDuli4Lu0DqFh/8MzSfvT
         bG+ospSkpNrD/4M3ShrikLQFweFCEZ7+xUgmnAtltuJVimGOe87GcfK82Dbq0F+Gwyqj
         oXh3yb2GMLIgk7ZRdg1AMjb5fzW6AFGgHyO9nFNPsuwhMKwFPDN1swQrB8v9fpD2HZmU
         X/wg==
X-Forwarded-Encrypted: i=1; AJvYcCUI3giIHzQqPlZXfgzcLWQ4r7a/oOXJWGdmDZzIkrQMfc0YlWUoQA+CsNgCygWwhhCzaxneEcLvu8iHDDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRWcN55nzGa82Hy/C6e6pWSgsZC5Ej2gCu10/Sxg7B68AZ3sm
	o+CLGQZUiGzcn6hrTDMdYTfepz0eJixVOAMl6j5vRx5clpT1SOLEpZRDVfsCTCmt37Y=
X-Gm-Gg: ASbGncvEJu9rwUOttQlL1P3L3i0ZnzfJV3gd6g+ewpK4Lo7+BefImpAxmGCJzQ0CUYx
	HAfNF67tnHAczxhfDnOXWmR2w5kraZi4M6w7Wfx2hmXUycGtN0SrhdMfBJ3b2l9mysBP27uiWth
	b9fHPR5npdb92N+ALj71LWr8GTrvyVilhyi1Prl56Lu3FABUcfOFc26WC2vKdnCYSSc44BDJ0Pa
	bzuhU/WXrW5ygaUkUyVhEtZMwq1BYEVFuUqk4/XGR/26W0Bu2emiJ3JABT/dozlIw2wYNVG9EX4
	sI4n7haaWl1q25ZNLqmJQDSfZVy06ahQ9Qs2pOg0u/Lc2owPrtSGHV+XyTGSXrtHZhUNilbW
X-Google-Smtp-Source: AGHT+IFaWnoGFbax5U872Z0YWq7JXogH8BZhBsBdP2E8k3bemDAidjl2iZmiByhbIG/70t/jYpFxFw==
X-Received: by 2002:a17:902:f70e:b0:224:376:7a21 with SMTP id d9443c01a7336-2355f9ef4damr87327775ad.42.1748841099440;
        Sun, 01 Jun 2025 22:11:39 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:38 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Mon,  2 Jun 2025 13:04:15 +0800
Message-Id: <20250602050415.848112-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602050415.848112-1-chiang.brian@inventec.com>
References: <20250602050415.848112-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase
(X+Y <= 8) PWM controller designed to be compliant
with AMD SVI3 specifications, targeting
VDDCR_CPU and VDDCR_SOC rails.
Add support for it to the isl68137 driver.

this patch depends on patch:
dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

---
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
2.43.0

