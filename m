Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5B2ED853
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961115; cv=none; b=S+xIR+GEqQGs1djiNS0dwy2zRmmZz0xBC5J904SVDiB0ilr8LzrIIL33KRzOhtXpecloHUYpMt5oyW89MWU+ailu+oW0hJUgWpx+HLpIsbDoPqjVqaQBAH2DfxemlYw9kjMS9T4qNuogemrdsEYo7kWMyZD0jeYbkcQ333xBa9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961115; c=relaxed/simple;
	bh=HT1PZrDkhp6DI0bsi07qe2ZDkBoSKcXmqoFHOkEVHss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hh9D5CS9TcJ3y/I3sU9CWZ+r6f/BDzg9uIzOLbbyANhHFqbB7WABWaJNtu/pbRizyAV8ytFXV9+QIHnLBNVqZ+ZEG2a3T0AHborUAG0PwDLUsgluKKTthhOZpcGyJ9D6zlwXryyNNvpafrNXDwiW3bSYT+iQvG9z3UAxCgrFHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjSKrhN9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjSKrhN9"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fadb9a0325so12650896d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750961112; x=1751565912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiZwuPd0AoWibuQALk3DmH+qz68nVTZ0UFoYX05f/uk=;
        b=cjSKrhN9i55CUBkiyawY16YeZ32z1ZbKIEHysAUDgdG3OjTTQxNoh7nV/xgWHZToPh
         q4mljyeq9MvIzCuymj3ZaNmLS+2lE4yxDGEyzQNGzRa6PZ4hReiB/FohTTjLZ7qCT/5C
         NWxyd62SMS2oLgqfGKw2UczbCIbdbRMKdLpjE9v7sy9Fx97OcUmYZWY4C8yAG9QqonNL
         5LUqTepr/sjwDt31BtF5Mfb+uTkA8FqPdscZP/NEbmhUlj27XeNBH+aN9rbPa1TRNjSV
         W0vSf914mBLeP9Qagn3NLxwwNQfjXkdGEg2XpR2NbtahWFCsCWPXgYjjII+JC2ALZ9Mv
         mRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961112; x=1751565912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiZwuPd0AoWibuQALk3DmH+qz68nVTZ0UFoYX05f/uk=;
        b=eNskp7w4j/ZB8edo7IC8WYYl/FVhu7FuFRr4QgNYDDpBwqaCHV0sHB5lRz1D6kMhku
         EVfBHOJJMnN0ZWIeg7U1LDsvMg1QvDK6OZ6QC4zSQqQ9v55IPQS4JAdDWLqkVpyJT3QM
         ZuJmmkT6sWpR8As5Qwt8DJA8CH0B50ymnvhlNDlUIE6oVuBx1VslcNAfPSeXvyrx+5nw
         wQpQQ5b3e7BoeUPfee7wJvaVDZjCM7gLhEYAtNhswuoZKdJj51CBr1CGWD9LVxXIv+z3
         bYI6nT3b5bNpce+UkRn74a+TvpoA9OSMjJiWffcR0leFhESqr7GdkYnpV0qnG+xTC4K4
         YgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuxTy74ueq36NDCrL04Fr6Ij0zWWQyRkqt42cVPwfUYAJ4HTfrJr5AqJNDAkH0befRSXFqF9DN/7xKPEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGgHiJ1BTwXPu4heDnHGO9vdt8pK/89GII15NrcRQxMDi3Biz
	mR0EYRQxPpHrGk26nPHglT6zQvMhjpR4yCautY5G67qfqLo6z1F/jlW/GM5Q4w==
X-Gm-Gg: ASbGncttbrOU1S3EKiu2sbtFQDMWmNtGx9Z9c4X+D+/E/VEzLG3soHpGlZ2DnciPvWr
	lCUoSpUQn/hyLDZcZ0jX+b4O9cYEZrMOxZe8yE5y9FWwcov3sGM2mM9aj2fPc8YJd1XTVENCDDv
	MJpLgnJLIoyycT2Wu6Dhh5dJhCTACa9AaP986fEGcXAAhqdmarXAeqBoKYE5qNHIOWHS5RZ9/7q
	XCfnlD7VKMODAFL95VkNysOnXHqzwcGPSE4kkG8IZPUuTYCY0Yu8vVQNs5W93sOyr3nkZxo+nKG
	vv75PwJFmFaP6lVKLInWVGTKQVqNhvKrjmcfqbIyQPPpwthx6LxR
X-Google-Smtp-Source: AGHT+IFgwg9byY7wnJjSTsjkRMLnfpRN05Qu3TUP7ur9Y/iw0TPz2j48zy3H+eunzSHMiSdxwVpIsA==
X-Received: by 2002:a05:6214:460a:b0:6fb:23:4812 with SMTP id 6a1803df08f44-700037a5989mr7609226d6.26.1750961112038;
        Thu, 26 Jun 2025 11:05:12 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::50e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d340sm10275906d6.4.2025.06.26.11.05.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:05:11 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5e35
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Thu, 26 Jun 2025 14:05:10 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MrChromebox <mrchromebox@gmail.com>
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] media : cros-ec-cec: Add Fizz board variants, so driver can detect them
Date: Thu, 26 Jun 2025 14:03:41 -0400
Message-ID: <20250626180429.463420-1-pedro.nariyoshi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
coreboot and I noticed that the cec driver refused to load with a bit of
tinkering, I realized that the dmi_match_table was expecting the product
name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
am not sure if this is the best approach, but adding this patch lets me
load the driver and it works properly.

Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
"Google_Fizz".

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch). (And sorry for the
previous error in the subject line)

Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..a26473c3cd84 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
-	/* Google Fizz */
+	/* Google Fizz and variants*/
 	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
+	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
+	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
+	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
+	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
+	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
 	/* Google Moli */
-- 
2.49.0

