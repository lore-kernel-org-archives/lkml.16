Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF01DF24D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190995; cv=none; b=sA/D93a2iQXmLoGEX7PYGP1vf9ovk1r4MqcqACGNteYSM8I91hQVXeXl7OYmV2LtRhwOcj3j/S3Vv7fpgu/cLwmzRowRXFqEZYUE2eL294mFV9OgPrcIWksUbOgItvtMhWBL4fV+fCb+B12ZKYnyUAIboop+luHiTYdb8xvoAW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190995; c=relaxed/simple;
	bh=flOtsZf7EBjh13FNyMsTD/5FQtLGeN9iZpmU8bbk1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHNm/RNJ8i947fKAn574/LaFbW9uIeNzUCq2ZyVqj5W9UH+l3CpwU7fuKSHHKJkOQKs6DvczGshKzfnyb+zAbY3LWp37CdyDAgMW160ygJJ+jh6QRvbXL0X2p95cMBt1CVvGVEGVFkXEK+WpbZYGREeuc5ZO0+kTcDc8bse2AeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=XyjY05Iw; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="XyjY05Iw"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-6e8ff1b051dso3830946d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743190991; x=1743795791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx6Kws4EehWQnJaxPytGf8blP84+Tos6v3LWW/hBgTg=;
        b=XyjY05IwJf4CtrRETT91urQ3w1rKNhpRDzT57zdo7OEYwR3ZDB64EyuaT2BxVCt4+s
         jZzpIxPNXfOBGdkbagHa+PPIMyZ0+FV1LJAcHr8C3jEP6+eFilqmlkapncB8zJbQQVWr
         qfx5Q8sWGqkidWiXE6lGInnI/xPnWTSz/5mEd+JLAlC0bKQnTLsp2UgT+RWjsMkAgTuK
         jylwsyFtAexyLd30ltuA04rsZbdK4u7H70y3uiCjeTiFrII9pyyNyytxd89zkhYugIRW
         oiCJ+MlBOnku7vM0Z3Uvzfm9Q028K61jHBqFVvmwtC7zhVfh9oi3mMm2GWvPO+jG1JqH
         HxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190991; x=1743795791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx6Kws4EehWQnJaxPytGf8blP84+Tos6v3LWW/hBgTg=;
        b=X1y8nTe8OloItGLG7tdHgNrYsc7tcqMB8Y5hs/r9lVH/fL3rEZB+rVi33HsGPApavr
         9zmLzZFk4UN0CobIYcDzkJdS+o06ZzCoRhMMpIavZDwylYzr7nyeA4zur8esanhEqzDz
         uvDk9sgHgUWLZa14pUtvMElvuxcaVLalX0Wd0EwdYm6DhSGPoVUVYOMD4tth5RcwCHTg
         biId5bY/BASqqqIF+0lvXXG7s9AScg8hD9e26i+td85hhLXcoF7enitoUliz2TxuzYvA
         nao8x9V0fn2dAAb9eWObyiev2dIWZj4DVmMJBNR1xSc3Am3ng9kaJRPDIGjI2fEqE6Eq
         Wc5A==
X-Forwarded-Encrypted: i=1; AJvYcCV+HsqMa8qcy37Bm/F6Ge/3SjAf40A+l7QB+LYzZF0IVHlVETEs8F/pVrXC64wBlMkzLf7vh2FAgp9CqH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/xg/nQ+ppYI1itFPQgdkYl6YEh/3FC5qzJXWYKMwCdJg1zm0
	hSKb63LntZQNwyf6kXM/1SbPUcG/rk1mMT8k3dx53mBmBTUQpZoJFLsE8yis8rujF0v871zl0m2
	fgbCjjXv4HgrukSgPXKCnI1Jm2yG4AJqD
X-Gm-Gg: ASbGncszf/vbpucGE9lQNq92+9F7+ddJ/NRFaufNgafej/8OCa5ZQcbQ0Xvg3MOevU6
	55TdcBLWIQplvA4+gYGVyqNecnnr2AbBz3Ixwy6FYoO6/diVzuK+oZz9r5jQYVQZ7RTlKIeh2AR
	1IEqwl2ArvXGmpydUebkLECz5SM3fiGQyNJ+P/K5vIlKQdwPWSM4uimqa9O4ILrUpYwo2P7Zhhp
	NdDYcvpUgYE5YiS+OaQNfFUBO+B+YC9uvmSQ3jw5Ouyufspi8SicTVXCn5M4rtyHgsLVaxgZ/Hp
	3DNdp2l8UtPMZIdLrG4YRv+HygKYdbnhqqcUflXH06LJ1WQz
X-Google-Smtp-Source: AGHT+IFQh9Pcs5CAbScmakAUo+ucuKKnoyChirklEpCbSZtv64yiMBBKapJk+vPUTDfe74Ad8xyLWKkPfmB2
X-Received: by 2002:ad4:596f:0:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6eed61f0b0bmr1762166d6.7.1743190991334;
        Fri, 28 Mar 2025 12:43:11 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6eec963b60bsm2865306d6.17.2025.03.28.12.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 12:43:11 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 479CE3402DD;
	Fri, 28 Mar 2025 13:43:10 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 3CDC7E40DF3; Fri, 28 Mar 2025 13:42:40 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/2] selftests: ublk: specify io_cmd_buf pointer type
Date: Fri, 28 Mar 2025 13:42:30 -0600
Message-ID: <20250328194230.2726862-3-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328194230.2726862-1-csander@purestorage.com>
References: <20250328194230.2726862-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Matching the ublk driver, change the type of io_cmd_buf from char * to
struct ublksrv_io_desc *.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 tools/testing/selftests/ublk/kublk.c | 2 +-
 tools/testing/selftests/ublk/kublk.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftests/ublk/kublk.c
index 05147b53c361..83756f97c26e 100644
--- a/tools/testing/selftests/ublk/kublk.c
+++ b/tools/testing/selftests/ublk/kublk.c
@@ -320,11 +320,11 @@ static int ublk_queue_init(struct ublk_queue *q)
 		q->state |= UBLKSRV_ZC;
 	}
 
 	cmd_buf_size = ublk_queue_cmd_buf_sz(q);
 	off = UBLKSRV_CMD_BUF_OFFSET + q->q_id * ublk_queue_max_cmd_buf_sz();
-	q->io_cmd_buf = (char *)mmap(0, cmd_buf_size, PROT_READ,
+	q->io_cmd_buf = mmap(0, cmd_buf_size, PROT_READ,
 			MAP_SHARED | MAP_POPULATE, dev->fds[0], off);
 	if (q->io_cmd_buf == MAP_FAILED) {
 		ublk_err("ublk dev %d queue %d map io_cmd_buf failed %m\n",
 				q->dev->dev_info.dev_id, q->q_id);
 		goto fail;
diff --git a/tools/testing/selftests/ublk/kublk.h b/tools/testing/selftests/ublk/kublk.h
index f31a5c4d4143..760ff8ffb810 100644
--- a/tools/testing/selftests/ublk/kublk.h
+++ b/tools/testing/selftests/ublk/kublk.h
@@ -126,11 +126,11 @@ struct ublk_queue {
 	int q_depth;
 	unsigned int cmd_inflight;
 	unsigned int io_inflight;
 	struct ublk_dev *dev;
 	const struct ublk_tgt_ops *tgt_ops;
-	char *io_cmd_buf;
+	struct ublksrv_io_desc *io_cmd_buf;
 	struct io_uring ring;
 	struct ublk_io ios[UBLK_QUEUE_DEPTH];
 #define UBLKSRV_QUEUE_STOPPING	(1U << 0)
 #define UBLKSRV_QUEUE_IDLE	(1U << 1)
 #define UBLKSRV_NO_BUF		(1U << 2)
@@ -300,11 +300,11 @@ static inline void ublk_mark_io_done(struct ublk_io *io, int res)
 	io->result = res;
 }
 
 static inline const struct ublksrv_io_desc *ublk_get_iod(const struct ublk_queue *q, int tag)
 {
-	return (struct ublksrv_io_desc *)&(q->io_cmd_buf[tag * sizeof(struct ublksrv_io_desc)]);
+	return &q->io_cmd_buf[tag];
 }
 
 static inline void ublk_set_sqe_cmd_op(struct io_uring_sqe *sqe, __u32 cmd_op)
 {
 	__u32 *addr = (__u32 *)&sqe->off;
-- 
2.45.2

