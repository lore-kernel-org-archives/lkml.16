Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2D25485E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154742; cv=none; b=CoGHSWa3N7NI7hzgpGga5mRaeSeQbBs0vO6woplwKmkFYuDD55NRexBgVpKB9bEP8dEqKqePKa3dptubaiS1v2i7u3alZA8VEAvhZiiiiqcSx5VbR+CMVN1mdKfH9ts/8s6aVLxet8VafMUC8yqcLs3V0zCZBFPXMl3vWApK5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154742; c=relaxed/simple;
	bh=640QD7k20bcrdYb6D3bMaDTYP6L0i7TB5oP6rPlUONU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAehvta9EiEIKxYpSnu5+mwkmfKtF4uNBdIu5/C32XIt3HfyV88LrCectYHxiMDDhEDHPQryC+c42zU3L5lfqif26Z9wMpaD9pj0dsIZNpft5KZcuB9Ir+cagI7IdJhpjVgP4rlAW4HFPikIWSiX68Z6xHX9CY3lvkeSIzGGXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=UUo7MlW+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="UUo7MlW+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7359aca7ef2so8714922b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154740; x=1744759540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn6fMxD+cDOZwdFvmm5E80ak9T8erorYNtCsqpyQQZ0=;
        b=UUo7MlW+mb5osxQqOQU2Nd9k7bCYeI79sErhT6ai5v3+mtzsO2SuM5iMlfAm05sdnk
         lqaRAqCcnscP+s07qTmdUybG+v+ECOBH4CwwesNW0O9HZHET/o4gf9HH8M14fXS/n4ZK
         4TvC5JmhBuw2tS+/W9S3qvduCQS8a1FNA5wukSfVyw3d/pZTcXT/x8JeS+No20j5x4aw
         10jcKlyFwbReJk0vpq+ez1biD1hIGLed0eM3BQd4GNs7Oz2IQVfwVV2N5ScSDpPgFYzA
         psYCTMDRuMfFqLB2CtAKrnQ6NhH1acljI3Jnk6HBn83TXYvXOcAU/3LCJ2t5WmSWqZiH
         BpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154740; x=1744759540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn6fMxD+cDOZwdFvmm5E80ak9T8erorYNtCsqpyQQZ0=;
        b=aqVSaPzDbklfF6kzaAJV3Bw20ysutL6unpSPO0jcN/5KvsK/FruTwa12USfxcAxppy
         HEd+tvFNFzI9JIGmAef1QDD29b2JJ8sBO+EkMLz8wZtnFXkc+GerRNIUZ1gO4O6lbK9o
         bK4OO1WpVzRkmUAVsiTDbUGAZIN6lO7P7dWmUumEN2IvBCKt8jda7KkyP7u3aSj3ZLAr
         VR9suTBn7FaxjosghbH699nXKqhwST/xt6K7zFVmo2c/6VyzzfBTMMtTejSoA+37UTjU
         r6bx1+eiLQj2yCMbHGbRQ5nBKjQyrZ6YdYDtoQycqRlFz3OO2HwsjNjEon/Uoki/Bmsc
         jQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdI+EpeCPMqwH0viLxEt/75n3aiTsmd8sK8c5I6cFWdGyqfOpDW+fw4lYdg7dKnrrZU5duIRlZmqkOFAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxequNO/ItXb1mfqjrYtdHHAKsqHEYLZNrZyL16cRBN4xLIKd0E
	Jc/Ut8M8WoH9DZIUN79/B9d6Smsm5OOrjpIXaCjPUAwzMnlenlSSUuCr+/dQ1dN1ura6rYpEADQ
	=
X-Gm-Gg: ASbGncs2dvTgSlkJg6nGvh+lYAOLwn3xTEWs2k46VKCVGrfIRaU8uEZsO3jOkIdZyhA
	Bf1NpRJ+Cg8nshFb9VK/hNpyHgYUEEszxlZHN2ATAMNDYFQhYK7a31dvEvXIzUO4cmIMX5Obo1k
	LIos64YgW5F0IGMZudEWj71+PrZ2VZjxPXXf1y8xq3A3QY6pgUd7JAIQJdjh9oK/ctptg+id/b6
	+8tc89YvbwDt0rRLQIgCeYpiFMz5JuA0PVDQhwksWvCPykS3419Wm9YdsNC05e4KTBriKzc4Snb
	DrpSCGT7QBUlVjzS64WtFCUfrJ/ea20pjAqhcY1u/l8kIgJ7UUkKF0MNqVBiwAT043mxo8oVCLR
	eoNmx7Rs9bg==
X-Google-Smtp-Source: AGHT+IGl1tqjm2dSiqFkQWDhXy72/QE2y9bkx/rWioiBktFdjQArXQAGyWkZqTAbFzcxtmVR/XhJlQ==
X-Received: by 2002:a05:6a21:6d81:b0:1f5:7e57:501c with SMTP id adf61e73a8af0-201592e0bc7mr970440637.39.1744154739951;
        Tue, 08 Apr 2025 16:25:39 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc3fd3fasm9505874a12.47.2025.04.08.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:39 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 1/7] staging: gpib: Removing typedef gpib_event_queue
Date: Tue,  8 Apr 2025 23:25:29 +0000
Message-ID: <20250408232535.187528-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_event_queue_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 10 +++++-----
 drivers/staging/gpib/include/gpibP.h      |  4 ++--
 drivers/staging/gpib/include/gpib_types.h |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index f2216768d8bd..684faa0c4547 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -74,7 +74,7 @@ static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
 static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board);
 
 static int pop_gpib_event_nolock(struct gpib_board *board,
-				 gpib_event_queue_t *queue, short *event_type);
+				 struct gpib_event_queue *queue, short *event_type);
 
 /*
  * Timer functions
@@ -1839,14 +1839,14 @@ static int select_device_path_ioctl(struct gpib_board_config *config, unsigned l
 	return 0;
 }
 
-unsigned int num_gpib_events(const gpib_event_queue_t *queue)
+unsigned int num_gpib_events(const struct gpib_event_queue *queue)
 {
 	return queue->num_events;
 }
 
 static int push_gpib_event_nolock(struct gpib_board *board, short event_type)
 {
-	gpib_event_queue_t *queue = &board->event_queue;
+	struct gpib_event_queue *queue = &board->event_queue;
 	struct list_head *head = &queue->event_head;
 	gpib_event_t *event;
 	static const unsigned int max_num_events = 1024;
@@ -1901,7 +1901,7 @@ int push_gpib_event(struct gpib_board *board, short event_type)
 EXPORT_SYMBOL(push_gpib_event);
 
 static int pop_gpib_event_nolock(struct gpib_board *board,
-				 gpib_event_queue_t *queue, short *event_type)
+				 struct gpib_event_queue *queue, short *event_type)
 {
 	struct list_head *head = &queue->event_head;
 	struct list_head *front = head->next;
@@ -1935,7 +1935,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board,
 }
 
 // pop event from front of event queue
-int pop_gpib_event(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type)
+int pop_gpib_event(struct gpib_board *board, struct gpib_event_queue *queue, short *event_type)
 {
 	unsigned long flags;
 	int retval;
diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index c9cd1dbd7e6f..6461b330a3c3 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -25,9 +25,9 @@ struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsi
 struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
 				    unsigned int ss_device, struct pci_dev *from);
-unsigned int num_gpib_events(const gpib_event_queue_t *queue);
+unsigned int num_gpib_events(const struct gpib_event_queue *queue);
 int push_gpib_event(struct gpib_board *board, short event_type);
-int pop_gpib_event(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type);
+int pop_gpib_event(struct gpib_board *board, struct gpib_event_queue *queue, short *event_type);
 int gpib_request_pseudo_irq(struct gpib_board *board, irqreturn_t (*handler)(int, void *));
 void gpib_free_pseudo_irq(struct gpib_board *board);
 int gpib_match_device_path(struct device *dev, const char *device_path_in);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 0253ef2c94a3..66a1a1676f2b 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -178,14 +178,14 @@ struct gpib_interface {
 	unsigned skip_check_for_command_acceptors : 1;
 };
 
-typedef struct {
+struct gpib_event_queue {
 	struct list_head event_head;
 	spinlock_t lock; // for access to event list
 	unsigned int num_events;
 	unsigned dropped_event : 1;
-} gpib_event_queue_t;
+};
 
-static inline void init_event_queue(gpib_event_queue_t *queue)
+static inline void init_event_queue(struct gpib_event_queue *queue)
 {
 	INIT_LIST_HEAD(&queue->event_head);
 	queue->num_events = 0;
@@ -283,7 +283,7 @@ struct gpib_board {
 	/* autospoll kernel thread */
 	struct task_struct *autospoll_task;
 	/* queue for recording received trigger/clear/ifc events */
-	gpib_event_queue_t event_queue;
+	struct gpib_event_queue event_queue;
 	/* minor number for this board's device file */
 	int minor;
 	/* struct to deal with polling mode*/
-- 
2.43.0

