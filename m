Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163681A23B5
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751092299; cv=none; b=nE0rVulfOyWk88oKr5MwKi+A9VOFH2OvwJXEGUmCD+6ow0G/MtXOcq8YLaRyrWeDqw4TjzrZVJVcCeNWHnPpfqMudjOEoqNTS2hrD1sZ3oBSidvnP7WhZoank+wdIRPum3Lu7LaVUlYvIujIXD7+nySGDjxiCAvYlPbGWP0KUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751092299; c=relaxed/simple;
	bh=OcjJRmPKs4f/dFfmS1CrK8xQIj20niQNZEq7XVMVMXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SegjAcHrEFkYsshQGpzul5uf4VjozRp3D3ZKdxk4fhZ+/nMB4HEnoaeCBzxSK7DqhIzbeHjd6LQ4EcBg/p6ThySktueQ818gD5w2yXI2bEYfXUcE9z4sgLTgejtM5rHQ4HjMYQO5dIG59Z7R2kkiWWm1BpLINqfClsT0XQOGkvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOqWr6KA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOqWr6KA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747fba9f962so2915666b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751092297; x=1751697097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOBUCLBuTfXdSALdN6Vhehv2a8w9yUjOo7KeQ2AcNNY=;
        b=mOqWr6KA9DGP42DWRaK7oc4g2AhMyTFQCr0F1zdrDkHTG7TZeHggCBJtDItgCy9OPw
         yoxtaMZVRhW8oSGSQ22Av7497q29o7nW8iXpyI4ToTSkzOfz2W0BaQAGbrXqjK0Sx4Vg
         hrfvhMgxMM386eScpJ3giQzx+voEXbKHI9kJd6LgF7oFqCO4lQKZjZik9oP/yHQicgCi
         1z8vbUuLDA5Dexy8b7ZNnY8/CFb4IX83nM7QIwys0vCJ6mhB5w3h3pp2a5vNUGNIeuBK
         WH9bzbNDx8BhDbeiHwW7O+2q/FQQStzIhJa1c/4mNnzO+ozYSFRb3miJLpeyCAevbcob
         JOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751092297; x=1751697097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOBUCLBuTfXdSALdN6Vhehv2a8w9yUjOo7KeQ2AcNNY=;
        b=FQN7i2DYcks6EiQTH8ajCKByR2i0U0ElZAMKlPIZ0ltvjIZtHAnAWUmRL3l6QuUZdF
         gaObVAkqoluNmXfOqBe/DaJs707bOsShauqlaEfx3NBjs6TX5auVUd9LYdYmZjw2hyv2
         +26BY6+0lw1SkHQWyfEHmLcqw3Bbl10nUFDJ9n46GOSY1XJixAhSldTrmbt2v1QsW3z6
         +xUZ4ZAnQEpMocaBZpaG8j+9jPeQfkpA1tGfjMHbA+itTU7ZLknvL/O2a5FFhcaup99Z
         yznZKecgcFzf3TDIRBN+9Yikelhc3/8MZ4kVWDOxQoPSHihLha6D/X2DkB51BCikiXJ7
         v+RA==
X-Forwarded-Encrypted: i=1; AJvYcCVxmYbKcrFwBVwjM5CV0kARUiakxjN6ujbpcEbFkemSZuM2FQ5odaix44cLhD4/yAQOuxknf0xtKQCZPXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWl2GPWxvLxdwCsiUKWKkH2LLhTy7XR6o17OH1swDumInBz1+V
	j9yyi12Gkij1wio6L4gSDLjvthlD6WDgmFD4fCkIQqqroryvItvycWz6
X-Gm-Gg: ASbGncuxelTFgwamw7yHvmGCf72WoR+24oTLhZlgVNw7ObA9/vs0muzoTVTAlcshwA5
	QddGAlA+F5unzQjK7FU9+yMzJp4O0mWKGRFYodE8UxtLpUPYnAXJl0WukL1UiwWZhvAiKDfcIsT
	BA1yoGDuoOsoZWwtymUk3wK21q73gGzCIEfj2lvNZRDTD/vx2B2Rw8ox1BflsuJET152xuuFpej
	4vBWdU1aO2OOckYsytZVmUnP0Ny2dlnZEEIl8Razl+kJrJcitzrG8nxslXivOvyNt2wHS9IkiuE
	mQkQBJFe5HOQWVgOXdCJDhi94TCAUt541nL6TCSmJkjzsvPQUCufWoyY7edMMSSXJSbt+LsPY3a
	tF797Pm+ubPH4VvunmA==
X-Google-Smtp-Source: AGHT+IEWpizPCQsGrOAiyMcr0FAuPQFRdWyOcJk3cOZz1JJvdwfoh/5L9YaZDy/VEMzWehbaSMmfOg==
X-Received: by 2002:a05:6a00:ac02:b0:74a:d2a3:80dd with SMTP id d2e1a72fcca58-74ae3e7b7f9mr15110492b3a.3.1751092297180;
        Fri, 27 Jun 2025 23:31:37 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:2179:50ec:85e6:275e:cc56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef669sm3656147b3a.158.2025.06.27.23.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 23:31:36 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
Date: Sat, 28 Jun 2025 12:01:21 +0530
Message-ID: <20250628063121.362685-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant gb_loopback_async_wait_all() as connection is disabled
at the beginning and no further incoming/outgoing requests are possible.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/staging/greybus/loopback.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..9d0d4308ad25 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
 	gb_connection_latency_tag_disable(gb->connection);
 	debugfs_remove(gb->file);
 
-	/*
-	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
-	 * is disabled at the beginning and so we can't have any more
-	 * incoming/outgoing requests.
-	 */
-	gb_loopback_async_wait_all(gb);
-
 	spin_lock_irqsave(&gb_dev.lock, flags);
 	gb_dev.count--;
 	spin_unlock_irqrestore(&gb_dev.lock, flags);
-- 
2.49.0

