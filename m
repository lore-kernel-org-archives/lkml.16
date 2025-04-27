Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D022258B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729896; cv=none; b=QdhMzUG59SGu1uKse0IvEa2dXcI5nWnmmQKymF4gqojXvqc33VPS/2sllf9le33q0yPiW1O3wQdAPTUBC16RZ+MkfnDPfLM7qDyDxakoYNDSd66lJBFXPa9E+MvXIljLP6c/uKhto+rAgkvh3p97bXV/11jLINFH/MoQnaYpZnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729896; c=relaxed/simple;
	bh=gCtryARbd63GtwhGlpj7q+PNl0/S0Yitl78V0CxPUc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UB3w+2Ko/27uUbYp4sJKDwJmQCf3C/i7mIacmn4g1JVJL/5qIgCNtN7pgFm3DpM5ngyJsVd854ns7Teq8ByPt0qeJRNMFY4zoEtJZXbEnLndwBrYSKYxPM5d9an/qaymYPPeVuyB6FvVOeUc6PoTy/xQXDYk3xS0Nz2yLCcG560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QmbqHvan; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QmbqHvan"
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-3d8081a2f4cso1014445ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729894; x=1746334694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKzTeZL1yXOr28Rks+lyXg8sYjXSH1fjcAG3Y1vo6AY=;
        b=QmbqHvanyxS3eTdHAxQP+FLCB7Izox/vkBNAmSefG4qs9qe0yapMFoUQAt11DuqwGf
         qkv0VObZ4nwRbeLeH7P6qAdJrHlOtk9Kpn612pgqWwXxgeL/eXRGhF8Q5KmtWFgcBiKJ
         ppBJr4AtuBDxysJca4i0CyPbLaauIXX2GCP1v+gT2l/AksZzfPJ8Cu4j4IXh1kmomTDZ
         0BbRCuPNqEggIe5PtU022i5YLAhxGM6ucELjklcexOtBTGBDNpNTmtvsWALDN3aGAkZQ
         ciL913IDskM2USSMLdn4GUyTtr+LZUwdI/m4CxI9nkhqnMdbhYJYHXgxltMfU11172t0
         0d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729894; x=1746334694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKzTeZL1yXOr28Rks+lyXg8sYjXSH1fjcAG3Y1vo6AY=;
        b=rBWWg5r8+r+toAezuB5fm9rtZBXH9MOnADZqvdbqCu9ZOC+KL2sdLL+kzMO91n0O8X
         XDIC5dxjNVsCpXcmjDj/kpepOgHUAAklx6IwLwENiCNmhXzT+ie1+Kn1Us5kv5zNg2zx
         atH0qk5F/tyPNUuquQ1mhbkXqf89dGh1HIed6M/8X/D7TndYcHWdJCn2x/IDPiZc8gM+
         olwiNFsKtLEeEjkmLiFMg7KG35QRgV5PlD68IzGWHRJJnZ//xNpJHU+TDAC7a19EIwB1
         pqIQYLI6I6GPZKgOPoG8UudbgnPWdIE/H4FrdDy4sBYZmyUGnMAqI+E3M0FYT1bIa3kp
         +iww==
X-Forwarded-Encrypted: i=1; AJvYcCVkxhnn4ux2SpO7bNwiUI7YZnoJa4W8AZus3sUCRzgnzhtKBy+6i2QYgQnQltwuCnqEPHqybCvL4mz1W8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YysgrCkriB7fruODPYmZeJPenFD8N9WJasN7NAZ+K0hEM1mkUjI
	dmJ3NRD4zZq4PBdzs400SxIgJxkJqPa5gFsV7x4JJvZGlH6WWi7Ky8MiX52tt8Hz/Ef3mpp/EZu
	LkefLYkcF7KdtNv6IZo7OvadkfJqq4ux9QV/3t1EEw+u2zNSV
X-Gm-Gg: ASbGncupO9w0vNPVFDcd83m9sj/0QtaDWHjIThu2xfs6DiA5rgMuIKbOkctskVeZhlb
	5QKyIMOZ2j4KTwijgKKCAxBNcWLpQNNd74/pUgXgWoW5qXcL87443akqQDQZOyEnz/gC/7vT36B
	aYNhPC2wA4z7H28wHOwi2CKgQzxTCP8VhjYb44RijqrccU1ZNqGisSg5X6U8S/vvnsZdwjKGU5D
	PYrxoZrWzxNh7kqssbyG20F9vutpB1L1HMEBdCdCBXE16pGFXA0CkImX9U7S58QenbiX19PCoGB
	EW24/jtNJ9P2zFlVLxHC3SCF8M92Lg==
X-Google-Smtp-Source: AGHT+IGlDXcQpM69Ulfyz4NaIIkNHSS1Fqz6L555JNy5K4KbBjL1kXGpZJ0lk5+vRmRUrzFQ0hIPo19D30F2
X-Received: by 2002:a05:6e02:1c24:b0:3d3:d13b:4de3 with SMTP id e9e14a558f8ab-3d93b634e9bmr18463165ab.5.1745729893840;
        Sat, 26 Apr 2025 21:58:13 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4f824a850f3sm524480173.43.2025.04.26.21.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:13 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 37DF93404B9;
	Sat, 26 Apr 2025 22:58:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 35AF9E40C3E; Sat, 26 Apr 2025 22:58:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 3/8] ublk: remove misleading "ubq" in "ubq_complete_io_cmd()"
Date: Sat, 26 Apr 2025 22:57:58 -0600
Message-ID: <20250427045803.772972-4-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250427045803.772972-1-csander@purestorage.com>
References: <20250427045803.772972-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ubq_complete_io_cmd() doesn't interact with a ublk queue, so "ubq" in
the name is confusing. Most likely "ubq" was meant to be "ublk".

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 44ba6c9d8929..4967a5d72029 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1123,12 +1123,12 @@ static void ublk_complete_rq(struct kref *ref)
 	struct request *req = blk_mq_rq_from_pdu(data);
 
 	__ublk_complete_rq(req);
 }
 
-static void ubq_complete_io_cmd(struct ublk_io *io, int res,
-				unsigned issue_flags)
+static void ublk_complete_io_cmd(struct ublk_io *io, int res,
+				 unsigned issue_flags)
 {
 	/* mark this cmd owned by ublksrv */
 	io->flags |= UBLK_IO_FLAG_OWNED_BY_SRV;
 
 	/*
@@ -1188,11 +1188,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		if (!(io->flags & UBLK_IO_FLAG_NEED_GET_DATA)) {
 			io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
 			pr_devel("%s: need get data. op %d, qid %d tag %d io_flags %x\n",
 					__func__, io->cmd->cmd_op, ubq->q_id,
 					req->tag, io->flags);
-			ubq_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA, issue_flags);
+			ublk_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA,
+					     issue_flags);
 			return;
 		}
 		/*
 		 * We have handled UBLK_IO_NEED_GET_DATA command,
 		 * so clear UBLK_IO_FLAG_NEED_GET_DATA now and just
@@ -1227,11 +1228,11 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		ublk_get_iod(ubq, req->tag)->nr_sectors =
 			mapped_bytes >> 9;
 	}
 
 	ublk_init_req_ref(ubq, req);
-	ubq_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
+	ublk_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
 }
 
 static void ublk_cmd_tw_cb(struct io_uring_cmd *cmd,
 			   unsigned int issue_flags)
 {
-- 
2.45.2

