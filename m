Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE81CAA86
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185090; cv=none; b=N7xIGqEncEFnQqscjx2LqTQk4CuhFHiJyOc+S4AWROgWAothhq+GTgjXtzoBkpvA1S9KCg5eGGR6OyZxCqiNovPDszi0xyN1+iYlvcZbJaf0wNQw09WwZgCp7Mnxoh3Wrqy9qq0iIH63sB5u6X8WussV4UAtWhD7jM6yrQHyd8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185090; c=relaxed/simple;
	bh=fJWyd0Z+++VvMpzFxRzmAD3YIiTyE0lwLheqAemdONI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7AwiWD7CwXneJIfDUagoZsQT534LYbjIBf8AKZ97IVjXEX34wSuIcwMmJpF+BVWU5sm6Nh0Y+0WIJrD6ZyLAvHjr16DL+jb6sTnEw8OlK0hhuuNzH3+OhWtzel8eZ9ClJ+S+qDy+DShiniqy8v6Q/Y8rB9m7hzrrRWZNyBrKfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=I64Fmm0X; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="I64Fmm0X"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-223f7b10cbbso6495475ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743185088; x=1743789888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1Idek15brks28Nv8cZ778Xz6huRCcZJmLXYMYLMNtA=;
        b=I64Fmm0XjVPGf6PnWGxopZ4ymB6IOIUd+cUYwiIp2UfRY0YSWBXzEcaTDlPHZURMt/
         6KR8NO9g4qkqp6VCpe/V9J4xayHHk8hiem6jD4szqiQZMD+Gcr9dm0vysJO2rTWrjFwD
         nuNGqRvYdxIIqbQJuxa2ZTvCIZT4bOVWC6cFk5IqC2nMAUCTunWya+Om8j9nqYsJ2dAa
         e7cQ0JmtPsffVFvK81pZ8yGAfw3oFIjssfzapfHvM2YwmVzHnrx5d6VVq8CWx0km9fu3
         n5vl9D4K+tISG71KrsC3HQZbVCDx7xBQpDjdk2bXKaP2jVwG+5fsOxZ/XopQ9f4Gs8kV
         tb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743185088; x=1743789888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1Idek15brks28Nv8cZ778Xz6huRCcZJmLXYMYLMNtA=;
        b=uUfv1gPHNRQzo56jETXt1JO1lVsUdVnlwZHFNr7TJuFu/WjisN880mZhCiFzri5BDk
         fi4GIr6pD2vFpwjrFEfvm2eJ6HW5wzBYqFJot5CQSrrJk7x9l7uDjvUpPTu/Ya7y56XW
         p/BgT1BnAjW5AZXwaPK+HYa7rd5NAeG4tQsTNpBauzN5JuBIYmUIxNEH8SQWTo/aOdZC
         6PM6Q4a+OjJ9hZThIqSmlEbuM0ENYqScMlNSSaKuw6BLkkr5BGEfoSkMQ0ZPfuf/vDcu
         PDIPJGVCk8nIy/MSQs5vpmqorMYKUPHKX6E2knlOfVWreDmRp6emjkugPAbs6mdkiQRS
         TXgg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8bqX1QfbiE8eKSP99oD4QfnZ0xuNyl0kRrSMZTho9PEaqY3A3xfBl6SjELtZwLUrteNzZJN5Y4iIMoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFrMWV7OPwidUp48R8g8+uHXRvpaqXP9PW+FhSIDfIKnfU7GTj
	Nk35MYP2KvgqFDc2/JXvmxJn+VWYZ2wlpWadC1dCCqA1OZdH92MeasTDJSikarGneLXDZXk0Xkn
	WGIxjQYw/DeaSYvcrPb6QaK40SwYqFtXe
X-Gm-Gg: ASbGncuFCrFhoJu/FgSlTcSuhQaTbRX1l7PENN8i8vzFFdXnmF8S29VVDsk5NTKajtu
	nnexoydTmIDBKdh3pbfdnDKoe3OZHIgBMkQXtWSi5JZUcxmNMU7nYaFYe1JqxhPjbTgJEU/ymLu
	AvN2IMX6j0lvgfnQqPJUHiv8QM0lmWzfPI9lflub5twJtdY8sK+k+yyFDDmrgl02tpCBR5s/yEH
	NdHnt+L3dgA57q7CqmvjYcHYgqJJHlR0ZJiLPorCCQPfXbyZr5zsv8KtgTDdOdTXpUNkwdqqS9b
	+GkD2lG6bqRByOjR/6s+RtlUdjt824Onc93xM4n8vTkWGDsq
X-Google-Smtp-Source: AGHT+IFvPkRdPB0wYsU59eOlUQEOpUKJ5TxHSxxI6tIebCQXRXwkP/6DyJ5cr05mVyMMf7EOnbwS893QtR5c
X-Received: by 2002:a17:903:985:b0:223:28a8:610b with SMTP id d9443c01a7336-2292fa08a32mr569845ad.14.1743185087910;
        Fri, 28 Mar 2025 11:04:47 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2291eec6156sm2811675ad.26.2025.03.28.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:04:47 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 522373403C5;
	Fri, 28 Mar 2025 12:04:47 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 50DCBE412FD; Fri, 28 Mar 2025 12:04:47 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 4/5] ublk: avoid redundant io->cmd in ublk_queue_cmd_list()
Date: Fri, 28 Mar 2025 12:04:10 -0600
Message-ID: <20250328180411.2696494-5-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328180411.2696494-1-csander@purestorage.com>
References: <20250328180411.2696494-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_queue_cmd_list() loads io->cmd twice. The intervening stores
prevent the compiler from combining the loads. Since struct ublk_io *io
is only used to compute io->cmd, replace the variable with io->cmd.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 9276d1fcc100..23250471562a 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1299,16 +1299,16 @@ static void ublk_cmd_list_tw_cb(struct io_uring_cmd *cmd,
 }
 
 static void ublk_queue_cmd_list(struct ublk_queue *ubq, struct rq_list *l)
 {
 	struct request *rq = rq_list_peek(l);
-	struct ublk_io *io = &ubq->ios[rq->tag];
-	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(io->cmd);
+	struct io_uring_cmd *cmd = ubq->ios[rq->tag].cmd;
+	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(cmd);
 
 	pdu->req_list = rq;
 	rq_list_init(l);
-	io_uring_cmd_complete_in_task(io->cmd, ublk_cmd_list_tw_cb);
+	io_uring_cmd_complete_in_task(cmd, ublk_cmd_list_tw_cb);
 }
 
 static enum blk_eh_timer_return ublk_timeout(struct request *rq)
 {
 	struct ublk_queue *ubq = rq->mq_hctx->driver_data;
-- 
2.45.2

