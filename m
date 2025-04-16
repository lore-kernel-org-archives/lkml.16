Received: from mail-yb1-f228.google.com (mail-yb1-f228.google.com [209.85.219.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F61D5161
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744764082; cv=none; b=MJuIXnNcPYs6SUyF9rWFE7ceoI0wJXm/VucUokQTVaOAv9Lo5eWqphoZ6S1TQEIJ8p4iiE2lNin5GNiCdwHevEbKr+Fa88w81UmvFNpoPzVHggURcdPlrJCmzvi6OCsxuNMF8gZ5DBZSBxbbxgUy3oooADytJ9xqY0Gi715Eoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744764082; c=relaxed/simple;
	bh=IHoy1oBggMFnLfKoeLbTx2d3XJ5sGNyUv4H3NdcBGsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZTettMEOv0dOyfKz02gWuKpITTaV8Ay9h+/5bl6OWkopIx15T/KWAyXFB3XZ6NwRA+s1noEdYQ8W1BTS0p1xm/oDhv/76ZPLBXQxjlTI9TUOK7cMRxo+Cq57EzTAfJcRwX+Qmj5VExV6vXxPdyozkuMbL9Ra8TZss5onbAmAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Ry/0lPeh; arc=none smtp.client-ip=209.85.219.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Ry/0lPeh"
Received: by mail-yb1-f228.google.com with SMTP id 3f1490d57ef6-e70a6ece644so190813276.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744764078; x=1745368878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=We9hYP2a4j/pz4Al55wunw35Rf7VsQ4yD4bT1cDaqGc=;
        b=Ry/0lPehAqJoa4zDERgGq3r+2jWclQfqaVZg5M6qClsDZLKapwgItnaWi2Ki9fvzLU
         BTYdXccnvivy/1RIqwT3QEy52D7lv80F1pDDKLs/AYzdnjTERalSHRrFe/mfGSu44/Lg
         jFH6E7hqxoi4qP3D4XX4GY7qZYT4u1TOQNgV1zK+uuR749VEzYCGw62Jexowdcc37DeJ
         MNPTawdTbDhKbY4+PVPZnqMG/ik7nDXJdyG7hI8pL76Y2CZ6JKY1TjlhL/8VL+QkijIp
         TF5XXAR3NCPzXpP6/af42LM7vqLuYNq3zJmI1cREwEiPJIB8mba6WiGNSuUdl+u//FId
         zlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744764078; x=1745368878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=We9hYP2a4j/pz4Al55wunw35Rf7VsQ4yD4bT1cDaqGc=;
        b=PgT5u2tdRoVoCJYud5QDTwKwibeXMAdwOASNy1IldCcptP3N1Yq87GPERT42H7bTkO
         +Yp2Hs2u/YvDyzi0aqgERSToJ5N/4AiLEGcXt+FF6OAuEucmTfz5MSnvPwYh6E2vYaJh
         oqPolIpoArouFOM1OsxvyUiQg2kooSzqTnxgs5R+5sxakolPESpepQBe0zddhbCSQ/tG
         m7sLckibSVDel/xpq0TGgpJQgcgwW+7Ehd6h3vnquO0Y9n0tUZTQ1h9XrBQoLSUJfMRk
         ScMNmxRNffn1NqmqnBmPk9rN33sjr5b9MT+blqeDbCit/w7aNExCdNHJ8Oo98F79/T0V
         57OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQQfEP5EynuHMSQwQMU8ZHULe+yn9pzuQTRTUESGPRt35dk9aKFwq1NJyH2ejVPOtXyXrOvLWMTmmfePI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOhEYFWkfHWQlsP0uAbSBEKnCmjwnlso1FT4qYWQKTWzksQ+X
	dAlf2izu5rmwgjNelsX1LspkKLA9JtqLfyY3P4ogvTjr/GLDow2LBSd2pmtayco/y88/7oDbyup
	MyclDpUm8BznRHfoQWBiqSirXntAYycglzJlvMYLEY8jf5FVU
X-Gm-Gg: ASbGncuHPinY24KoyHH7If56H7dtnCdtM14ZPmq1vmGChGhvj9B13LwSOTD9lulw754
	fIFFhCcxMioVcNGnZ5sMD2+jeCLd0/7QM0XbocovZFG+mqA0qCZNTznf/H8zxmL2C6n9pX/4JfE
	sjJ7G8BOeNC5RX4/mWUHtnSSxBVLdN3yZCeztXeoKtpd2//sEBFWIsBqdicELRLHdMm3AmIECxA
	cZR/LuaCxqIq8iRFZD5u8XxcQGOcbXmKESkCYpwyw6sPpIwtQuvQREPAbZ8PSa4KDKGq+M7HWUQ
	ssI6QYsc2g+3VU/MDoymWwQjmgpxUg==
X-Google-Smtp-Source: AGHT+IH4eWSJkQrrpBMlanNtR2s7qbUIU9WRo2WRGrWkrS8v/Qlmkd9wF65x5vFf0yGNqHGBVulqkmf+MiBv
X-Received: by 2002:a05:690c:6610:b0:703:b7c9:ec05 with SMTP id 00721157ae682-706acecaa79mr9212117b3.3.1744764078276;
        Tue, 15 Apr 2025 17:41:18 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7053e0f432fsm6373617b3.12.2025.04.15.17.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:41:18 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 538C8340237;
	Tue, 15 Apr 2025 18:41:17 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 4CE62E41852; Tue, 15 Apr 2025 18:41:17 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	Ming Lei <ming.lei@redhat.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ublk: don't suggest CONFIG_BLK_DEV_UBLK=Y
Date: Tue, 15 Apr 2025 18:41:10 -0600
Message-ID: <20250416004111.3242817-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CONFIG_BLK_DEV_UBLK help text suggests setting the config option to
Y so task_work_add() can be used to dispatch I/O, improving performance.
However, this mechanism was removed in commit 29dc5d06613f2 ("ublk: kill
queuing request by task_work_add"). So remove this paragraph from the
config help text.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 2551ebf88dda..e48b24be45ee 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -386,16 +386,10 @@ config BLK_DEV_UBLK
 	  io_uring based userspace block driver. Together with ublk server, ublk
 	  has been working well, but interface with userspace or command data
 	  definition isn't finalized yet, and might change according to future
 	  requirement, so mark is as experimental now.
 
-	  Say Y if you want to get better performance because task_work_add()
-	  can be used in IO path for replacing io_uring cmd, which will become
-	  shared between IO tasks and ubq daemon, meantime task_work_add() can
-	  can handle batch more effectively, but task_work_add() isn't exported
-	  for module, so ublk has to be built to kernel.
-
 config BLKDEV_UBLK_LEGACY_OPCODES
 	bool "Support legacy command opcode"
 	depends on BLK_DEV_UBLK
 	default y
 	help
-- 
2.45.2

