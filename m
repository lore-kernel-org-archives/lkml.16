Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EEA1E7C38
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849983; cv=none; b=Od3Nv7o97k3oY4OqdBUJnQuYR0g9gI2JwRj9eEYV4HHMRrJplduEzrDGtP/kKe7JgTq5VunKNQC4dlON+WtgWWc28dpfqET7WG4qRxGD/Pkt0LRRg6CE9eS9MAIYcaR4VeuR7DNScAEfMFzw5rYgWemfy0MZFgctR8/HHmEkZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849983; c=relaxed/simple;
	bh=qXuKC8wKMseybKQRKVoj0KYHcQgg1A92iFP+uea8iuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SX3fZUqQwaThPdsElQ86gttLZSs91yItwCXlV1S99xex98I5T2j9pMmtOS2VEE27OtmNTiclPgydJ1vtz3uUY2lLCrZ96+eqM+OBQU1Mg+MULFu/VQSzUO9Xn1T6VBXURr3EDuMaGDjjLsiO4jyWK2funr/VX2uuNnAiFovPOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Cfq0cwh5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Cfq0cwh5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736b98acaadso161256b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849981; x=1745454781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=Cfq0cwh5v58J/7Yu+3kcsSB9/5q6pazjAgPnjiLRZKwXqQUGrk6k/J9MkFMWV29ka0
         7Vu6QEbCC1iZOOg7aImOWbPeCQmaj87PWufZBQdm3GDahbC8PBpFhHsVCtf9qYGSfVL9
         rGd7fz1PmMF8ESXww2c5+B6tXdV9Kud5Q2sSvSvAXFmxEfWaxvGo8D9CfzLwxbYKkGNh
         2jAZdj/PoKrPIQlJGs5mBp9o3mRezOnfx4im18JPd6/ULwVHXYRKqIngFo2Io0zOv/C9
         Muh883rcX2REK8ZIJdcj7CEow92UXKV/32yFan0rs/97VOY57ib3vNT1163DSXVBya4/
         S9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849981; x=1745454781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=UmPnYd2kipAc4vvbkVjKVeDgwLysYZfnzOc84vB5gHTAhbFb3DZAydSLUJuzMF3TA/
         IjUfqGUhG72ihsi/xgo7rJgbj7v/Zs+WywDRn1lAmjXHEAAY/fLenlvFhQo8tp7cyvui
         +N16FuDS2nC6rIagjupS221U1MXca2AuMDtG4WIVxmuDcetxSYcLQOQyBlkuIBEao3TB
         qVMZq7WNxVrVGXEI5BjAJQnstdUkl/IXGa91XLAPPgSc0tabdCNF/+4XAoOAyGyoAUmu
         04NMgK7Wi/l6K8tH69yl0tnrkEz8zaub2EPS8NzcU2LGRCGcyz00uIYN4YJm0uvYb/yy
         9eGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn/5SupmnHQhEDsjqmg2DaanNfr7ZqtD71eeoAOo7tHvHnN7wdJzK187Y9KzbueJdhnBghrpa1nIoYcqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlpjEQIVzNV6zHostMFf2tcGrMqqBOq9HZQ77Fr2+pOjCZB03
	njAwN46nhb5TafGsZuX5cNOW9YD5Wr9QIjVnpZYA/uyr7FTLxWj6ZZVQYEhzNw==
X-Gm-Gg: ASbGncuJb+ayLO1NSDXhBDjtE/JeqL9BTRueJvlANb7d0H16PDmJvKW9yGuVUtZRa8N
	nCsauGR5F82BVs+i61EzvTecEpBBufhAaAjL25lbERBHYzz7GhxTr0KoZwxpC9VliOveXhZoJGO
	VXti+JDg27bThJvYJ0hU5VIVgKXkck8c+6xL6wxoCnvvMSoD+BhbsTiVYgVnV/uja1v2hE7arVu
	KWVpJ5hG/uEB84kwQ9xhbDvkarHpSR2U/+G8UdCpEmi2vobl4mXVAGSHeM9SpPIwZvPlNZZ8San
	PwMs2+3lL6ZK4FDJ7UZpVWVJBtg2qE1oL82Uqv7St2lM+uSMwBZ3lRUpCpwXjggf5gLsv4dDxTF
	xfBC3JA==
X-Google-Smtp-Source: AGHT+IHrKH4GUhouJYD9RBko6R371BDH5NugueM0IYjVJ3b2sL/HyvhyTxhHGmohZ5+Ooym7fHDTgw==
X-Received: by 2002:a17:90a:e187:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-30863d1d97emr5761415a91.1.1744849981572;
        Wed, 16 Apr 2025 17:33:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308511d1046sm2909585a91.0.2025.04.16.17.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 11/18] staging: gpib: hp2341: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:39 +0000
Message-ID: <20250417003246.84445-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 5ca0bd2f1a08..1a32a2cc421e 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -411,7 +411,7 @@ static void hp_82341_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp_82341_unaccel_interface = {
+static struct gpib_interface hp_82341_unaccel_interface = {
 	.name = "hp_82341_unaccel",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
@@ -439,7 +439,7 @@ static gpib_interface_t hp_82341_unaccel_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-static gpib_interface_t hp_82341_interface = {
+static struct gpib_interface hp_82341_interface = {
 	.name = "hp_82341",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
-- 
2.43.0

