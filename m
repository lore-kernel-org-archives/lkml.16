Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C3232787
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836131; cv=none; b=G4d/7SkXgvgKSxxssYBqqivBh9a+08OL8/ozPHfaOh0AKx8kZtNuVp+tZIjhaX4QHuRJQ8uoHaOIGSK2rB/hLZXF9bzN2KxOANug9zHeBN0lDkoYA/t4hCZOeywwdgum7KdSQlVRiwq2qN/Yc6a/cObxTW+SuwveA/Wg4CeFfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836131; c=relaxed/simple;
	bh=TRUv0Lx9qIYRkHYXYiephf2tTbsRuyIpmQ7XTHKKyrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH4eXrGuilNS/hlpUE43ExZBKTB2z31zjfoo+PInSFFXpYcULa///9B2du8W1rSKubWzW4GpKqQizvmBPbb1qwegKf9pf9AU3nbancKyyb8nN7wOuPHSD+GlB3FzUrUBHUgPEtwi1hWuRIBIr4ZOV1KMHGi8YV4BU3nCMVef1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=IZx0PLmB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="IZx0PLmB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33e5013aso1357015ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836130; x=1745440930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=IZx0PLmBetz8GlPZdVFH3GcSev0udJos7OWui/7ZYwgMzvDvvE23ntkHKGdhtusnU4
         zjFnRnRJvHJnf4I5Bb2Ut3U9RDaZkdhiEfwxq6i1kUGMKaHInAR6RQQVe2XHylgoHt1j
         Ar3Lcw8NDJE9ZFZFmsOwScnQ3025hzHZPpuD4TIKtdXiuE0KHFggh9vU/m72sLFHab/X
         6WaesRNl8rBov5VDGysrn9mu4uwVbuwjhKWiIbmddctmj0W8YYv1bzkz7O3PbeVuewUa
         skBQNMld+DGY7Lm/q4xhI6qTWsDL11OCEHkPtVv1SoNzKUOTsEEo5PydFYccHfdC45Ik
         T7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836130; x=1745440930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=J03GCey/vJ2zfJG8n1RYayv3QymK3RFlYw9+XRKlqX7Xm2PGic739kWXney8LTLsW7
         z7UyqLJxeTQSmmTm1CZhne6JGGUQ5dGUyj1srlvaLZY+EEJvaA61cVl1PYLuEGCkhF1i
         J/r0T3tRCQzrgpXC5Twa+5SE1ZAI/6XiBIVoIduxpVkhWNBe7a/e+t+J4yaFZyPOYn5y
         qOU80i9RQs0Yio5SYct3M2mie+w520kCXP+/UUZ3We/o9caJUSOoerQ8nu3A2JsRb7QB
         YKG4Yy7xpJgE0SEKjVuK4xt9n5O3IlEvZN1xSyfXKUzOWgZ6uy5dQe9M4NxJquWqEpTF
         A6HA==
X-Forwarded-Encrypted: i=1; AJvYcCWkwmtjU6sYb3g+joPTt0bCkmCsmPf38Z4WgxKZzyHIuTFtPge+hp+nXyO45CUemP/a8uz1nn5wlP4zRx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHDMr1dM7FpxNBGd6KH9rLxN2khvPd1rn/hq/9vPVQAYDo22R
	pONZEuqOFGUNjByYAX0yUzFO7k0OaBckumfJDBLyKeLLVPb0nN4RVJ8ESwdt6g==
X-Gm-Gg: ASbGnct7On1k/UCRZOKk84uwex0lXyiwvkUlbWbVT/roF9LxGdljkb0X+f4q8DQbIbu
	Fgywf2k900YOSr2m+39X22DlqdZx9nv6/p2uqV6vrwiiej7p5leNYFOzQ2sO8douHpgiQX6GqE7
	fOzMyrqrQ7ab4aRY/AQirA8WHu38Y4eCy75kQEem5gko8h8dbYShCh9J/WqoENguuqHMUpcdNP3
	0TOGNyrwrxcb694qED3COw66wGd0FOWtWLxZBNiNyUZIHgRD/PKYja7jt7BnXzAD74CnRNvLbAa
	qwQ3c2pncPaw4uYU2r51WFS6FscETFQW9jwl4m1J5tjWsOueJj9m/1bzBp+qGm4Y/Pd0ud2e/3G
	RZOzJ8Q==
X-Google-Smtp-Source: AGHT+IFchMugIT2n9/0iO9Fu/n4Z213xFLKHBSZJPWGuKhQ/ZsCoXn/li8GCNELI2QxNen8CwXI5Ag==
X-Received: by 2002:a17:902:cec5:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22c35983aa0mr41389005ad.49.1744836129830;
        Wed, 16 Apr 2025 13:42:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219894bsm10934022b3a.34.2025.04.16.13.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 02/18] staging: gpib: agilent_82350b: gpib_interface
Date: Wed, 16 Apr 2025 20:41:48 +0000
Message-ID: <20250416204204.8009-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 97717afbb214..901f7182502b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -773,7 +773,7 @@ static void agilent_82350b_detach(struct gpib_board *board)
 	agilent_82350b_free_private(board);
 }
 
-static gpib_interface_t agilent_82350b_unaccel_interface = {
+static struct gpib_interface agilent_82350b_unaccel_interface = {
 	.name = "agilent_82350b_unaccel",
 	.attach = agilent_82350b_unaccel_attach,
 	.detach = agilent_82350b_detach,
@@ -801,7 +801,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.return_to_local = agilent_82350b_return_to_local,
 };
 
-static gpib_interface_t agilent_82350b_interface = {
+static struct gpib_interface agilent_82350b_interface = {
 	.name = "agilent_82350b",
 	.attach = agilent_82350b_accel_attach,
 	.detach = agilent_82350b_detach,
-- 
2.43.0

