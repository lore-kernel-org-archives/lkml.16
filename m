Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AB3241678
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150847; cv=none; b=Hud/Kw5qPOd8DW+k+uVlsesx+VHEEN+HNy7KL+fbq8A6P7qcPF+PuC44P9Ee3/D3AYHac5u9TB4/lHVJZmz8ryCXPtV5KC5npzoGufBjaK8Dtkl/gT2fSlwclLERdEjzeEYtUFp6C+GofAEGKq42MB9rYjFpCXmgL5one7xj4gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150847; c=relaxed/simple;
	bh=EacArKuOdvvxd/uZyx+fyTlpctIMfRi4lYwDe618O94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7boeJbAUt6fVJl7yVTdkWAUg3KOwVC+bCN0Q+8fTjZ1wTChBqumxKhN82YIwz6aybuyVyHkUqlBHjAk+MHzx/Kmk2Yp+NfyVgYAsRRtBzwk9SjqSQE/j/Yk927bu895w8R49c9d2sbb1l2+AL2nCTfsKbBM2cF0lsXfAeOQMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OdvcLp/Q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OdvcLp/Q"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fd89d036so74301295ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150845; x=1744755645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1xu+hNXXWAOIIXB4B7ulClJQ9ITbKc5uhrOA9YRLQs=;
        b=OdvcLp/QmrX0+l3SBktZDZP9jEElH6DOwI6rHWeVw6KlY1NwH0WANZchUDjwVyBbFD
         lTqVq/WdeJH8M8W/PSuNXmNpaF9CJ/Pv3luRBm/QNM1rhvlC+Zbxd59tpRS67E6i9nLD
         l9Qv8ZflpFpaA0Y1hjJzHSosLFJZf+4daVC42CK1QxWfwf32bvJueWF1XvlVJtgThJxn
         oQrcCg0k5sc/A8zRjKpFIClCqLoRalS9z1sAcA0CKMx/BA7TR0f0BlPDrYqC4wjAdpbu
         vMt7hEBkrGfrG5S/mCD6Zq9NciUBR3v5WD4Ms+e+zO4W1hqlR6YfT+X/wr8VV2t08nsS
         lYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150845; x=1744755645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1xu+hNXXWAOIIXB4B7ulClJQ9ITbKc5uhrOA9YRLQs=;
        b=Sm1BMWtGIEs40l4YMre5Qf606B9c1UK8yQW0JiS9aiL4QXSXa0R8TgNkildjI20YIo
         s+kCJuBWdZtXfd6PQ9QnswEPHUVc9u0GozNBHMrgUa196PkE4zgpXXytDLeN9H9BicRN
         l4Ield/rX0kYxQxY524JI/XoNqEHhmcN04x1SyrAIq8DhSFNUQiKR3U+WlxTmRsW3pK4
         JhXWec9Wy0Ly9ziXis+fGpMD80thA3Ygs61hzph+iE6ryIPU/1Ow9BStXyYenjwOEO14
         laJ1swJyJSceZjA+30przG4FQexrcrTbnhBDjPT7KiriE6D1Vrnx8EBYptxxxBsmnegv
         v8dg==
X-Forwarded-Encrypted: i=1; AJvYcCVlfTK2lJ4XIHrlkyNVBX7fdBkvMlqRBGbdsA03wJWEYqNrn/131JkjJ+ZxxwiOV74J41gdrvwOpe4jf2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDH319UXYc4FSNyjsEx7YJTHvrlghodu5qoPHSdlfFQDFt091l
	GYPYdIACjsGFrcACOFw3I2FFmMwTtHU+ceknm1IEQxV3HNZaZQRnmTRSCyAfNA3RntVIqC8iviw
	=
X-Gm-Gg: ASbGncu2jAtK9kqVw9tdQR3QEZFE0BeEg95QgozQlDRMacGaKzJ7Db7m1WwOzb80X1R
	SzSspZcYOXBQbLuBSTwNxvjCUWK56N2UAnX+FsVOi6li63ezRVbwqX8lP08gdE8onzIcxzAyFR+
	qwIOSdStl1T+hvuniluxJ7S1kUNc/mzwaiyBETddvHA+JdkGqqk8zNdr5NjRgrTcyvm8M3g2v2m
	JR/ICevBWAKd4Sb23PmHZhSxWda8nelnpUy1Im+N4xQ5Hkko+cEOyAlPlTzVJ3HDNFZfHSG1L+Z
	IPPIuSxqG61PNsV8GiInmV6aV3aTq1S2r1vOdhabjd0NBH6OcNIxWE93NYogYpEjcsT/pe9EkoZ
	DtvMm6lkTL78VkNlmZr5D
X-Google-Smtp-Source: AGHT+IEQNsrU61s1qVJmyRn4znZrq0nCeuew6EqFOk5LBT3KNFFgIxK4nBBw6fwCpG76KJqncT7chQ==
X-Received: by 2002:a17:902:ce04:b0:223:5de7:6c81 with SMTP id d9443c01a7336-22ac3f9a90amr5410335ad.27.1744150845581;
        Tue, 08 Apr 2025 15:20:45 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983db5f2sm11644140a91.48.2025.04.08.15.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:45 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/14] staging: gpib: Correct CamelCase for EVENT enums
Date: Tue,  8 Apr 2025 22:20:27 +0000
Message-ID: <20250408222040.186881-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch

CHECK: Avoid CamelCase: <EventNone>
CHECK: Avoid CamelCase: <EventDevTrg>
CHECK: Avoid CamelCase: <EventDevClr>
CHECK: Avoid CamelCase: <EventIfc>

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c       | 6 +++---
 drivers/staging/gpib/eastwood/fluke_gpib.c  | 2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c    | 2 +-
 drivers/staging/gpib/ines/ines_gpib.c       | 2 +-
 drivers/staging/gpib/nec7210/nec7210.c      | 4 ++--
 drivers/staging/gpib/tms9914/tms9914.c      | 6 +++---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 +-
 drivers/staging/gpib/uapi/gpib_user.h       | 8 ++++----
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index cb77fe0a4b9a..8d2f2a663958 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1888,9 +1888,9 @@ int push_gpib_event(struct gpib_board *board, short event_type)
 	retval = push_gpib_event_nolock(board, event_type);
 	spin_unlock_irqrestore(&board->event_queue.lock, flags);
 
-	if (event_type == EventDevTrg)
+	if (event_type == EVENT_DEV_TRG)
 		board->status |= DTAS;
-	if (event_type == EventDevClr)
+	if (event_type == EVENT_DEV_CLR)
 		board->status |= DCAS;
 
 	return retval;
@@ -1904,7 +1904,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board, gpib_event_queue_t *q
 	gpib_event_t *event;
 
 	if (num_gpib_events(queue) == 0) {
-		*event_type = EventNone;
+		*event_type = EVENT_NONE;
 		return 0;
 	}
 
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index a6b1ac169f94..d289c321c153 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -802,7 +802,7 @@ irqreturn_t fluke_gpib_internal_interrupt(struct gpib_board *board)
 	status2 = read_byte(nec_priv, ISR2);
 
 	if (status0 & FLUKE_IFCI_BIT) {
-		push_gpib_event(board, EventIFC);
+		push_gpib_event(board, EVENT_IFC);
 		retval = IRQ_HANDLED;
 	}
 
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 53f4b3fccc3c..733433d7fc3f 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1136,7 +1136,7 @@ irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board)
 	fifo_status = fifos_read(priv, FIFO_CONTROL_STATUS_REG);
 
 	if (status0 & IFC_INTERRUPT_BIT) {
-		push_gpib_event(board, EventIFC);
+		push_gpib_event(board, EVENT_IFC);
 		retval = IRQ_HANDLED;
 	}
 
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index d93eb05dab90..93897088f6f2 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -295,7 +295,7 @@ irqreturn_t ines_interrupt(struct gpib_board *board)
 	isr3_bits = ines_inb(priv, ISR3);
 	isr4_bits = ines_inb(priv, ISR4);
 	if (isr3_bits & IFC_ACTIVE_BIT)	{
-		push_gpib_event(board, EventIFC);
+		push_gpib_event(board, EVENT_IFC);
 		wake++;
 	}
 	if (isr3_bits & FIFO_ERROR_BIT)
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index 846c0a3fa1dc..9b4870f1b421 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -932,13 +932,13 @@ irqreturn_t nec7210_interrupt_have_status(struct gpib_board *board,
 
 		// ignore device clear events if we are controller in charge
 		if ((address_status_bits & HR_CIC) == 0) {
-			push_gpib_event(board, EventDevClr);
+			push_gpib_event(board, EVENT_DEV_CLR);
 			set_bit(DEV_CLEAR_BN, &priv->state);
 		}
 	}
 
 	if (status1 & HR_DET)
-		push_gpib_event(board, EventDevTrg);
+		push_gpib_event(board, EVENT_DEV_TRG);
 
 	// Addressing status has changed
 	if (status2 & HR_ADSC)
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 2abda9d7dfcb..f7ad0b47ebb8 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -774,18 +774,18 @@ irqreturn_t tms9914_interrupt_have_status(struct gpib_board *board, struct tms99
 	}
 
 	if (status1 & HR_IFC) {
-		push_gpib_event(board, EventIFC);
+		push_gpib_event(board, EVENT_IFC);
 		clear_bit(CIC_NUM, &board->status);
 	}
 
 	if (status1 & HR_GET) {
-		push_gpib_event(board, EventDevTrg);
+		push_gpib_event(board, EVENT_DEV_TRG);
 		// clear dac holdoff
 		write_byte(priv, AUX_VAL, AUXCR);
 	}
 
 	if (status1 & HR_DCAS) {
-		push_gpib_event(board, EventDevClr);
+		push_gpib_event(board, EVENT_DEV_CLR);
 		// clear dac holdoff
 		write_byte(priv, AUX_VAL, AUXCR);
 		set_bit(DEV_CLEAR_BN, &priv->state);
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index c35b084b6fd0..caf53f8ded2e 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -566,7 +566,7 @@ static irqreturn_t tnt4882_internal_interrupt(struct gpib_board *board)
 	imr3_bits = priv->imr3_bits;
 
 	if (isr0_bits & TNT_IFCI_BIT)
-		push_gpib_event(board, EventIFC);
+		push_gpib_event(board, EVENT_IFC);
 	//XXX don't need this wakeup, one below should do?
 //		wake_up_interruptible(&board->wait);
 
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 5ff4588686fd..b0c131196a00 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -335,10 +335,10 @@ enum {
 };
 
 enum gpib_events {
-	EventNone = 0,
-	EventDevTrg = 1,
-	EventDevClr = 2,
-	EventIFC = 3
+	EVENT_NONE = 0,
+	EVENT_DEV_TRG = 1,
+	EVENT_DEV_CLR = 2,
+	EVENT_IFC = 3
 };
 
 enum gpib_stb {
-- 
2.43.0

