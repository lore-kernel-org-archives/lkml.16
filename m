Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6BC2192F3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729896; cv=none; b=bj3rNZdXOkYOUF3xYMnboQ5ERH8CKZ6VgmH3O9K4/8InOrmL1jVg+Ltdydx9XaPSNIyjGCXthVFECtumjWniEntA5BAvb/afEuCwBSHqjiOyRZ877PnjX5JdtAAju1yWR9Rhin1XP31j6vy+gEIHvEhVPutjRuPhIQnYE+CWKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729896; c=relaxed/simple;
	bh=e0DW9foJVDShpIvls+GDptY3uu6gKpPgLM78CyCBh7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6P1tmX74nN4VFD/4JABiZf4IKF3aEkCtJZ3dFUH0xXc/245tG2UUXOKC4bAdnVSwzgdFHhuF3skbHXGYG7pFuyac9PUDZC0/btUDvXjDccYDfJIdbFNXdeFHRGgroa4UGUe2uVINpRRsABssVzdrBC45jFPnW98cEEX3JzxiPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=U7FClcDn; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="U7FClcDn"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-6e8fa2d467fso6659166d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729893; x=1746334693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mls8bi9oXwbtGuyG/ERF8Q73E3QOMn+krLNxxr48tQY=;
        b=U7FClcDnb8B6o72+/92dMwHYikh4zKrozljZEkk5W6uN21OwEQ5WBzlvZ1V8BDgVH3
         DNBnyVPB9klT5VLxYTT521ZaxK2Fr2AVnxCie83di6Y4UEW8GoVQaASw89k1Fz6WsnMP
         jNY6BcWwCH5dppfa4gENlYrhCX7/zFP31hU5pyjz+pxhF+xyxzA8N+z+gVfmOhUbq93Q
         f6eVX2fuWHui2Jsm4K71LsC8WRBbcfAdYrM2VEu9IOlrORdjGAs4lgO1OmoWyrxSuUPQ
         iKwf8OF3N4wyV6axinCRZy2m2EViAlVPgBB2btEShX29+zvLGGawn4cmf7DIXF3jrsQ0
         568Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729893; x=1746334693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mls8bi9oXwbtGuyG/ERF8Q73E3QOMn+krLNxxr48tQY=;
        b=Zee1xwt2vwwwo6bl/s18hA+pccUD/lxXK7TIvG7LxcAFFNnjm+d4BQAnFBlmVu3Gdf
         d0i/f45LD9vY6/O8XNb4MfXhPUB8D9BVFjd/efEOWZl8DYqlCpBW+CUyNhEHOIGg1JBS
         vqgCruW8wbKQ3p+OuG66BrL7IpJvSNFmxygSvtnJaKo+j/nLK/JNYNtF8RM/FvjcM0cl
         T9HZnUVzo4md+yWja9fZF+TCDwIv4plRsqRrMYOOMTg5XwdT63EYfdVkzdFjl0swWvSI
         ZVdXqhWluFXM4iiNqQVcycB844wOZjPf5azljZKmrB3oR1LLvMqGbZV4EiiGsj7h6GQO
         y/4g==
X-Forwarded-Encrypted: i=1; AJvYcCXHA2Lw2osResRpZVZaDhxUE+IEwTKl20ZeYzwE7EYW4uLfbQOBI3mwdh+0kkj+OJfNus73CUtMriaf4eE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztlk17W7d5ax/SioL/jB00L/9Iww2DXTXgPsqrpueq7WN65inx
	bsZ3gIe+B+3bZgFZcWVu0w51IsAN9Dw3uYoPFTD0t4Uw2FsQUVjFHZOeHSyChY9S7tiVQRLUZDF
	HzvMlPYsRFmXmmsEyEGQu/n0ry7+xdITtK+kHMYPnDJa8zusu
X-Gm-Gg: ASbGncuCzkTONHD3siI8JwtCI4shBm5fT1FYvKWmuOqMQ2wTy3fcjELGuAZnvV2DLex
	IIkhGc7pSKvTTDJ86T0tTtrxR7cJ0cS7mtD1k3SqA1VttyApqzfXHIpGohcjI80HguBrx9y3gXr
	YlGvhBfu9bqsaEOvoS/5g0jqfDBp68b6gMaLjU7yqtul03PRegQ7XG9YRu0KjrARtTY3LxCs7wT
	JFJ8Nn5bWmsgNfWXNqZ35XIxWSJK+ipAGEgFfuDAY8IE2hGMJNfkQySrh52WcYQh8dGKfcInae1
	OT5I1F8g1/UJoLSIYhS8ebmhVR75OQ==
X-Google-Smtp-Source: AGHT+IHdNXBk1TNme4nkQxEWedva+R+7J2Qt1t7yuieBpvFMfs2uzzJQtHWXw+UwHKBEImovtWTlhJuV24zR
X-Received: by 2002:a05:6214:301e:b0:6e8:9c91:227a with SMTP id 6a1803df08f44-6f4cb9217admr52468306d6.0.1745729893518;
        Sat, 26 Apr 2025 21:58:13 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4c0a84a54sm5828916d6.50.2025.04.26.21.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:13 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id DBB8334031E;
	Sat, 26 Apr 2025 22:58:12 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D965AE40C3E; Sat, 26 Apr 2025 22:58:12 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/8] ublk: fix "immepdately" typo in comment
Date: Sat, 26 Apr 2025 22:57:57 -0600
Message-ID: <20250427045803.772972-3-csander@purestorage.com>
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

Looks like "immediately" was intended.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 7809ed585e1c..44ba6c9d8929 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1180,11 +1180,11 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 	}
 
 	if (ublk_need_get_data(ubq) && ublk_need_map_req(req)) {
 		/*
 		 * We have not handled UBLK_IO_NEED_GET_DATA command yet,
-		 * so immepdately pass UBLK_IO_RES_NEED_GET_DATA to ublksrv
+		 * so immediately pass UBLK_IO_RES_NEED_GET_DATA to ublksrv
 		 * and notify it.
 		 */
 		if (!(io->flags & UBLK_IO_FLAG_NEED_GET_DATA)) {
 			io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
 			pr_devel("%s: need get data. op %d, qid %d tag %d io_flags %x\n",
-- 
2.45.2

