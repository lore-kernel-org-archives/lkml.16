Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388013AA2F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955004; cv=none; b=aTW596zOoOq4IQYLpgCisnOqS15qdxdoh2B48PQfVF1PRrCeseAH3Dj7wfNGTuALoU19J/SR0AGGIJlXj6/1B7aiTwysJcInmDwwTJeE8waX7C2ZySDl1cDk5MDTOgbANhlVY4QSxc7Jx9vbPT57civvG4T6dnr0gpSJQ707jZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955004; c=relaxed/simple;
	bh=oHxJu3J1I3/pWQoPXHgh9afJCpFm5sCTLU1HKlRrQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLZ5LPycO12jRH+hP+Gc+6HgTU/uJtmLgSj0M9xryiVbZPK9zOoEOTu/P72W8V2zr+ltIh2RkaAsWrTsHKeC9oMLaTIQcZ97W+eZ6wBqrndsRgi/PoicTLrcXXiJ8RgA3myNO6mwoCOP+Q7gjgXOVyoRb9RTQSyLQVqK3mIIdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AARRnun2; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AARRnun2"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faf66905baso19030866d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750955002; x=1751559802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Y+w9GjzC4NkgAs20WBoFAeBxQI03y6T8/aweQBwbw=;
        b=AARRnun2soXLFgaBihH6VgkXNXtdLaYowFeOwhdbCJ+3xBRkRVgxVPiI1zZYTDKggq
         bzI6xMoQqYKo9jWiUVaH6cfXiVuwb0jsEg00xpuuPnh8r4W9iaTrm0hxbNqc0ltZVmxU
         9S7r3ShwIK5Az+NSiPKwGfF9Eb/nlC125P0xZfZr1dRkxC6M5em6r0RiDH5rTbW/GZJC
         aqV1tU0r5JbT3y8Hw7MkRo2ndh6RHDodDBkP89HhmYzeWaYM5lO9PX6be4aDfFenzRGe
         HGiaxeUjzgnPL+9kMtcKKmxDdFvEkykT5pCZxG+weRsR44dtLZmqzmOsuaqw7J16btvm
         btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955002; x=1751559802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6Y+w9GjzC4NkgAs20WBoFAeBxQI03y6T8/aweQBwbw=;
        b=MFK9qeCw3Pj+Ear07NiSiYSgq4n+WuihCbgUU5Ho7pvEQK77wH429wRX0f5SQ+Qz+z
         Da8hMuYsXPRXI2s2flxDrEcDBXAUak5Or89DvHv8wwSMFUbvBHdC1at9VGD1cyeJpLAG
         bJT0uigz/Jo8qDvCjH/1OsYcJaZeG23avqJDbp5vsvMrwnDQPOLcdS82Pl98ZEGHp1Aj
         GfnmiodlMfwIao4Gbp+hRnL4hI6FLc3rm6oIOGwLfKsL3Ml5YSJ/mpNm5W3EAKf5xsCF
         B/d0xxjsjPh1wE9eVJqA0aS6czborVM1vbi1RFQ0M0cfIZrWZ+y5WVLBUENrTh1qWuvX
         ZNng==
X-Forwarded-Encrypted: i=1; AJvYcCUUQURAmOrXBR+DB7aVkDfRKUcJGmDbHEZjPeQjtBY0vs+38IhZzpTH9XV48LE5rzb+f7Z7Py3f7aJqYh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2hmNzJAfFfzS0Vpo2ei1I5xohYDDXPgmdkOy1S2JPGgF/z4u
	zI1GF67HKDG0oscIH8HC3Oj8kaGB2oDC7PySaQmHKvH9ipXl63IYmMGGE8hmiw==
X-Gm-Gg: ASbGncvtxUwwymdz57LxILHL/oxs/qaCd6mqJt5G9hf+CN+AfA6jDYOEAH4AkG+wt6/
	0lS0SFjCeue9LTDWlrg1X0AOpxZNxCZ6gsmqgAIQXNxDA8gk20wN/R86HjBvc7+GofsB2BKd7pY
	bHlP1KbcA7DYTYEkc076TS3EdXtn6NEFSyBXOjAJ40nmd7CAgu59dElPrGD+9gi90nqI+eWBUNq
	XJQ7ZqOJGuksDyiWJz97DFH99xl6xAYHDpk9V5Gk4tkR+NrUIslWHZS3gmPQPhgk2QAMR0HnduW
	zuVmy34daSlAKv3dLjO2eFlJCzAX7GQ5ZlxrSrxNjeYgUi5Jy7zL
X-Google-Smtp-Source: AGHT+IF92fh20uqupRSbTrz3EZxc5rnpNNYG1cPwViPg2EoTI5DGFO19KIqfaC3A64cBBodaNFkTKg==
X-Received: by 2002:a05:620a:1a84:b0:7ca:f41a:546b with SMTP id af79cd13be357-7d4438f3bdamr25768285a.6.1750955001524;
        Thu, 26 Jun 2025 09:23:21 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::50e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443230127sm18430685a.97.2025.06.26.09.23.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:23:21 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5deb
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Thu, 26 Jun 2025 12:23:20 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] Add Fizz board variants, so driver can detect them
Date: Thu, 26 Jun 2025 12:21:29 -0400
Message-ID: <20250626162235.445407-2-pedro.nariyoshi@gmail.com>
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

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch).

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

