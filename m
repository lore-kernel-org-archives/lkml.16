Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37331DE3C0
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686996; cv=none; b=pc6YCW9bNTyrgqAAsUSoyl6RsmKO6kU6yflhaXdGc5uRbnfDHsdTIi5QqmPLeYfo5PNexkkd0IdTydMl7pf1VULQoaRRGIS9CTkWFmIo4TNqK012xBqYPi0amfglIILAZlEMUcMk7wTFCGzeh+507XiJrJ13ViQO/zCgKHL604g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686996; c=relaxed/simple;
	bh=6Pdq8UjW7XUKf8ZU4jAAM9wQBDbZW9x9Erd2SUItiJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3Suo7u2VW96wP3uSo9Rl/v79X5B4axU1k8pbKqkaz1aKgd2zUnfimlpdZwW1m5icqN6LdDd7/cMAm6aed5vyyBeCKJceJzKNJR5gYGSX4RU+wqjAcwEQNIEwN3U2Yns1uy86mgS6/wBtSDQMtbb/0Fe591i4dK1/Bx8zcGVi1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSRptIu0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSRptIu0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso96894666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746686993; x=1747291793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yENSIxJzlIHC39VpFA+sJfZvEm/2hEzXRCerTxBt7gY=;
        b=cSRptIu06zgIuzatC00qTtOExMhiK91xOb8xfmVjm5bPhSMETb0Ve4a3maXBqMM+wx
         YKJdH7F2IUjKn1DfRcYbZ0g5OJKiMkb7HYOWoGdvPol319oWirm5f2xd45gSktp67mjJ
         MAprwXI2TR6ymA5rnV+fwmSfXC57gIrGDwaJdOpz7bu8LuaBPWH3cwVTvKrM+3+NeOa4
         rxEgc09mR+vQpAUQh/JaaAC0+94nMieKV9uZrJVQ8FZJNmy1KCwrWqjA5mmgMb83HNkG
         4c1T1N1bSWmiLnYlOAalEcFEqm60JlkgIcBsA5IxUPw1G3JUMNuK26DPg0HwHxvBOIb3
         Ny4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686993; x=1747291793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yENSIxJzlIHC39VpFA+sJfZvEm/2hEzXRCerTxBt7gY=;
        b=bBLAnnYiss/WViCXEV/gGt2c0ccrHErqJJ4otpWwDYpm/6OGV0gAI4vriXlzNzLQ1e
         hgWlkW6SnDH6/jAEJRcNj6Gvc8jhB2gyrlRoJlHU3JUoEm4aYn7EXyvOQ6OtGRX635q6
         EXaAclMwveLMRc4jICnm2iFXQ7flUAIqZb3ni07SWJ38OteUTMBUrjuh0H/1bH+clZJm
         fO7tRgF2TYRce6jaIny0idfEqVwIPnOEAAegb0wlSsjsMJNxMf73eJRcKokVmVkQvEjc
         lXa0YmffmtKWpMhf0Xft8ejle/RfIAK6lOF4BRwHUrJH4rQb14pJXL5+oG038yVj4VU8
         Q7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBNQSC0oABQsikMDQnHEDzDyk/Gi2pk7939uwaTzbGH2iy+2oGuj/MymzY0fjSd0jQTnMCzTZ9Q7Hv/g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymiQyDW0DtQHfD6jdP1E8DlYss0df84xWKCdcpx2I86lOeJ7ki
	w64ihpIMFJ7lzZkop1VvreKuMQb/U4BHr4EhrJFrvc8VNstT4/Yw
X-Gm-Gg: ASbGnctM8VWBRSrjAmYOBGPP+MAjuVCTwXqnWI/rf+2nrrF23a/I+1ywcpFIU6gUloR
	J0Zf+5TsjEo3EAXz9BGq8YHmvp8sEj+Vk0pekkE7SPmyl9jtESle6So3JiymyYV+KlJz/Gc7EkX
	sX9/0ibW7vqrvZY064TQfUlOeTGPPJ0CHb5k/sx06ZKTYwXQGUIuYNARq6epEA9KxueSTz5KiHd
	ieDzRwBoaIUOcxuXuABpim8lKbFzBQPUAesxGP7NBV3jheN+sSCpyjONTOxDNE7LCHFYPFIoxtD
	RHYH0V8fp7p94DGnYWKmcSiZaIn4P1Ppxzd69jbeq7qHxTFEtqUX
X-Google-Smtp-Source: AGHT+IFdZ0EwS+O5dKgeifxn/dGiIzxV2wWvJj5ioEzbl170vOFngtanfl3AHANA6AlZTfpgBP6LPw==
X-Received: by 2002:a17:907:a4c1:b0:acb:8a2c:fcdb with SMTP id a640c23a62f3a-ad1e8d00e73mr716485266b.38.1746686992990;
        Wed, 07 May 2025 23:49:52 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914740esm1031227666b.31.2025.05.07.23.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:49:52 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Watson Chow <watson.chow@avnet.com>,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] regulator: max20086: fix invalid memory access
Date: Thu,  8 May 2025 09:49:43 +0300
Message-ID: <20250508064947.2567255-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max20086_parse_regulators_dt() calls of_regulator_match() using an
array of struct of_regulator_match allocated on the stack for the
matches argument.

of_regulator_match() calls devm_of_regulator_put_matches(), which calls
devres_alloc() to allocate a struct devm_of_regulator_matches which will
be de-allocated using devm_of_regulator_put_matches().

struct devm_of_regulator_matches is populated with the stack allocated
matches array.

If the device fails to probe, devm_of_regulator_put_matches() will be
called and will try to call of_node_put() on that stack pointer,
generating the following dmesg entries:

max20086 6-0028: Failed to read DEVICE_ID reg: -121
kobject: '\xc0$\xa5\x03' (000000002cebcb7a): is not initialized, yet
kobject_put() is being called.

Followed by a stack trace matching the call flow described above.

Switch to allocating the matches array using devm_kcalloc() to
avoid accessing the stack pointer long after it's out of scope.

This also has the advantage of allowing multiple max20086 to probe
without overriding the data stored inside the global of_regulator_match.

Fixes: bfff546aae50 ("regulator: Add MAX20086-MAX20089 driver")
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/regulator/max20086-regulator.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index 59eb23d467ec..198d45f8e884 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -132,7 +132,7 @@ static int max20086_regulators_register(struct max20086 *chip)
 
 static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
 {
-	struct of_regulator_match matches[MAX20086_MAX_REGULATORS] = { };
+	struct of_regulator_match *matches;
 	struct device_node *node;
 	unsigned int i;
 	int ret;
@@ -143,6 +143,11 @@ static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
 		return -ENODEV;
 	}
 
+	matches = devm_kcalloc(chip->dev, chip->info->num_outputs,
+			       sizeof(*matches), GFP_KERNEL);
+	if (!matches)
+		return -ENOMEM;
+
 	for (i = 0; i < chip->info->num_outputs; ++i)
 		matches[i].name = max20086_output_names[i];
 
-- 
2.49.0

