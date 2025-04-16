Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440E225390
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744832782; cv=none; b=kngaz9h+SD7jJqQGm2aCNTlxKyg5/aP4K//LLhI75eAcXv7/2LFgZ++a2NYU341hX6wJS+FGZdBb33Iq/3z9JkUtIp5/5yxVRPjPgnaXwNcq9qlZULmROyPnxJ8sDWfvp1JTZEcdnYramzOr+RrePGlshzNCMLJ/fcFOBYVmhE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744832782; c=relaxed/simple;
	bh=6uOhhTg2M6Xc3JIAa7jixcn3vOphgn9bCMpImyxQ0aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BG3P8I6Uyxc5vz6fK+9ogPzS0wEBhy/JyI7so5T4qLEKmegw6IIWscjTBKXDqxFjjstZnE+8I77TPt3BpIuw+yr+ut/RQtHGL+dmFgVNTpTHXm6u/xrvamiLDzufvQDJzM3u+6vVIFEVjH2Z+wO8WRKvrEtgmazl+WisKJXZrxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cVCFFYKB; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cVCFFYKB"
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso231025ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744832778; x=1745437578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yq5esKCTo1m4AEup60elUDKAMcHgxmTnJjt4cP7Zh0E=;
        b=cVCFFYKBZ8ZtVyS+h53nof2wbdQMKdyHyg74Z7r/2scyY+qDqkSBNXmN8VzLOtCtyj
         CgEyVQ8374B3jqagSCv5Plszp2fmWoM/laYZ6JWTrIbiORWJ0bQwLnKeB1SFUA7hPQs0
         XvkNdsAomqxRWob1TP7jvaV6vR0a7k+2DLEW+SkbQyPqvCv7yWjEArGy6DWRkkTUra6N
         Vhdgb+4Whlet0ThS5P0FRPD91JnG2vgI0bs14ZGsx8hV/65drzbXUlSVYR2EAs4MG/0c
         URYn8QRcGZhRDhfAUy1PQabuTB1c4d2tquoXFz06EbJOnpy7FgngHZob/3LiK9UyxWmM
         ub3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744832778; x=1745437578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq5esKCTo1m4AEup60elUDKAMcHgxmTnJjt4cP7Zh0E=;
        b=WJEWG1i1kkUtmpYy6KatVon9yW9U2qNxfE1uuSCx+JgedgqEEwG58Eac4FL3P88E9M
         GAxgX6/ZTILdE4SSQKzpEL4qAMMRyYCbxMWCac/KjnKwQsdtKCr4TPhXW6bgcyZYEztF
         Gtwz51+mPyA526x9gL0VyKT6sJJEbdrPwi0Q5R4R5XVPQOZ+xscuEPaMWG8WtVDJLDkk
         j4Q+bI42SRDSFQnofYaj/sNyrPz+abg4IKOWCZVZJix6wVlP2Wn27FPAlnLzjz1iO6Mi
         AA6PGBdcLj6Qy3xN7xMpW7jX0Er5tDKJyHwmureTBSUQx6QLyFpgw1Nj0bBquPFPYBM/
         LlNw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5E22RnAEKXNuwrqAMFluwZS/QWjWMYo/zt5x6AVztOdql124PEAPydC7xgc6dWkpHulrWnN9cOnl16g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0FXwbCDFpTziGJzVpbvsKKeY6yHuVhFlScZmEq8RHe2E66ePy
	L18cQ/PoYZ0eeRV8MCjrD99xtZszZJOzkRBfMybGwfqZzmHnKM/YCp2WDcYnv+TsGcYvg8U1r3+
	R4Oj3fgQl42Zb4qwLiGgGng7Ys0IhY7IkpCZLW5t5fbbcT3CY
X-Gm-Gg: ASbGncswaoOj93/i+MCsNvawQGnnfltvLVOvTBARJpFCMPIkzopXwg3IDlMsNA3XlZQ
	gbdj6SR3nY2IIQIZUiyDM4qQsJj+mBAMsjjEBuodqp9sowgEg9ys/LEli0XkHUswnYZL5nlJCg6
	cnBkmf+SnBN8xLw9v9ffAedxGDTmhDI+6eAYpPvoPxIIBRhzyoGFO9P7VPKwxwQMgKpDZAhftF7
	IjOJFG+EqOD74FWDaFSezo//SjPQnBqymt5wS6c9aslqdIIjDzwdQNRPGxmXOuJPLe2NyQWcTlk
	BFGCVa07LwikJttdmUJ2w5bsDqutIW4=
X-Google-Smtp-Source: AGHT+IGFFL/1z+Lvd5ijEsYgZEptvHunfhVfOarSer7ZQyhQrlZqQd0cZQYZgZi9sOPDgPcEnaNHXINcKFi1
X-Received: by 2002:a05:6e02:1fc3:b0:3d3:cdb0:a227 with SMTP id e9e14a558f8ab-3d815b123fbmr33400865ab.9.1744832778357;
        Wed, 16 Apr 2025 12:46:18 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d7dbaa438csm8540685ab.41.2025.04.16.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 12:46:18 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 8F90B3404A1;
	Wed, 16 Apr 2025 13:46:16 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 8E5C0E409A2; Wed, 16 Apr 2025 13:46:16 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Wed, 16 Apr 2025 13:46:07 -0600
Subject: [PATCH v5 3/4] ublk: mark ublk_queue as const for
 ublk_register_io_buf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-ublk_task_per_io-v5-3-9261ad7bff20@purestorage.com>
References: <20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com>
In-Reply-To: <20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

We now allow multiple tasks to operate on I/Os belonging to the same
queue concurrently. This means that any writes to ublk_queue in the I/O
path are potential sources of data races. Try to prevent these by
marking ublk_queue pointers as const in ublk_register_io_buf.

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index b44cbcbcc9d1735c398dc9ac7e93f4c8736b9201..215ab45b00e10150e58d7f5ea5b5d13e40a1aa79 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -211,7 +211,7 @@ struct ublk_params_header {
 static bool ublk_abort_requests(struct ublk_device *ub, struct ublk_queue *ubq);
 
 static inline struct request *__ublk_check_and_get_req(struct ublk_device *ub,
-		struct ublk_queue *ubq, int tag, size_t offset);
+		const struct ublk_queue *ubq, int tag, size_t offset);
 static inline unsigned int ublk_req_build_flags(struct request *req);
 static inline struct ublksrv_io_desc *ublk_get_iod(struct ublk_queue *ubq,
 						   int tag);
@@ -1867,7 +1867,7 @@ static void ublk_io_release(void *priv)
 }
 
 static int ublk_register_io_buf(struct io_uring_cmd *cmd,
-				struct ublk_queue *ubq, unsigned int tag,
+				const struct ublk_queue *ubq, unsigned int tag,
 				unsigned int index, unsigned int issue_flags)
 {
 	struct ublk_device *ub = cmd->file->private_data;
@@ -2044,7 +2044,7 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 }
 
 static inline struct request *__ublk_check_and_get_req(struct ublk_device *ub,
-		struct ublk_queue *ubq, int tag, size_t offset)
+		const struct ublk_queue *ubq, int tag, size_t offset)
 {
 	struct request *req;
 

-- 
2.34.1

