Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31A30E820
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367506; cv=none; b=RhqSYk1wol0WH4Fx4I8k9sqot6/+JdziA7lvZZwZW9n4+4fq+3+aNQ3dxkWsXK81nscy4isDeg5vpXz9ciGXxkZFXr7TH1Wp1pLZQVKgvRI2jt1yRfB8YbyG5K7Do0RZ9oZgcxfm3FtOMiSzOYeuzVWZhygNM1c8ZfRdKqE85fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367506; c=relaxed/simple;
	bh=+5qBhXMd4tlvB/EfKgFkP9FJHvMEQW4z85WlQU6ae+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2YmaqbXk8N5q+d9dwBgRIbXKsix9MvSIjQ2RjnFEzdQ7Cpl3taZnn/N2Fn6YWwPnZFsm+8hR5znxN5tCJMnPdwa/vv2m+NkzwlxN269uJZlf3ansPKKlwYxODGgACEgWNQG4FvmjU8ls1VZPbtoH7tNECzQUb7rZ8hx4VflAaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td14FkWN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td14FkWN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so1757614a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750367503; x=1750972303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X41yO15Jsfs58r/iidVCVj+kMQkfeHFuu47yqt9CnT8=;
        b=Td14FkWN1SnB1AROhg5CySIAz0crKRIQGMmG5DKN0NIKTFGM3fhOO3EgYLvqgD4Ojy
         ruZOnGkg673PgWo66ly0DxyZ8UB/slOF8FixwCg1otcgSttxpXdLpJ01yfVFFbVwJpGM
         RXmypNZjrHeAfQC3mtvK1xgBBecS+lcKkna7J2c4j93IRW9jUmUkawFdiIjhyGKDkfkb
         39jVBumE1LXKxSWWPBAQK/Zv+z87RBle9aukt7Y4VIsOlPmf8zkS+mbImltWJ9JG2il9
         NBt73AQW4b7gwzLmYlfuq3lpvQudc6lGs0eMtM/75NZTyvxfuPinwWEe1o4rSH4sQSZ1
         ZKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750367503; x=1750972303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X41yO15Jsfs58r/iidVCVj+kMQkfeHFuu47yqt9CnT8=;
        b=hnzLYhrqOMw1Uw8AnfrwO+fyPdkDJYOYOTa8CGEy6MYa9zVCQlQVgFGOq5tZW6cipK
         fWVP9WoxJOnwIC2tqVcueywdu1nCMZhkp6NWIcqsHgtGrj3Emr1cPIM1IC2hfFBJVMrv
         Ly63eS/mYaKI1K0lb0dD8zTkt9mnxyGAWbw6/x1zjO8rEINaSAx/LJnKts+WkeNKMbrc
         0k7RrDwljxV2vfDP8IF41aOe8QSe0DTlnTRdzDX/l7O9Ji5fYYLcEwx1AHuv69C9RXUD
         RG8SlRDyadFGIqgy87t4UzM7EOqGrHW658XMsQT8s75YKSvfyGbVYfURhOVuXXNOn1YP
         ObCw==
X-Gm-Message-State: AOJu0YxVubY06ZUepYHhNb05HGsb5hsjC2aDlOP8vgzUkitBQLMH8wGA
	fnoS6U95RshikA1tbabZPpPdJBHdcQ8W0u055Dc4v6vjoLDeeI/hk9JE4pouNxHz
X-Gm-Gg: ASbGnctwcDRFeqN9fsKtBamiNLx/tp0NUgucI56zQXxnwBVIJj+fEs5IC5Cp7WAyrt8
	WZbsi6tMHq9/kjRChIXwFQg96YA5J5We7eHAA416uH82en28TfORtbs4I7Ned//JfqMnKZ4f5t4
	Avn/1xlcxhXBISxTC8WYjp/aVSsDFMvx6t4atVWGv2SI808iH5m3OkbYBMpP4f5JqJ32KxlNfJC
	DOV+WR8BaJ1c/2WOMsX/50xZHxEhidGmDKBXAo4pvmOXqi+SnKeNoJKRMse9UCriIMzMHZLZtSY
	yGA2Fj0TT2NId1BDvIZ3Jqu0bS8YG5V+ZVTT8PAcGobeRUU2+DnLcEZLxOLA4CyxDDYiNFKT3Nt
	XkeiUcUIaUDj6
X-Google-Smtp-Source: AGHT+IFY88GsZ92n884dWS/n0veAs4VBRX8NemGzruEN7jGlbpvBWFoMAafJ/RXmJfpzRCzWXA771w==
X-Received: by 2002:a17:906:9f91:b0:ad8:93a3:29b7 with SMTP id a640c23a62f3a-ae057a5112emr33838866b.18.1750367502777;
        Thu, 19 Jun 2025 14:11:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8109:8b08:3400:dc31:64ce:8528:9f20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e801c1sm48731366b.17.2025.06.19.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 14:11:42 -0700 (PDT)
From: Ke Ma <makebit1999@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	arighi@nvidia.com,
	void@manifault.com,
	changwoo@igalia.com,
	Ke Ma <makebit1999@gmail.com>
Subject: [PATCH] kernel/sched/ext.c: fix typo "occured" -> "occurred" in comments
Date: Thu, 19 Jun 2025 23:11:28 +0200
Message-ID: <20250619211128.2193-1-makebit1999@gmail.com>
X-Mailer: git-send-email 2.44.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a minor spelling mistake in two comment lines

Signed-off-by: Ke Ma <makebit1999@gmail.com>
---
 kernel/sched/ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index b498d867ba21..d312b950cbf4 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1637,7 +1637,7 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
  * scx_add_event - Increase an event counter for 'name' by 'cnt'
  * @sch: scx_sched to account events for
  * @name: an event name defined in struct scx_event_stats
- * @cnt: the number of the event occured
+ * @cnt: the number of the event occurred
  *
  * This can be used when preemption is not disabled.
  */
@@ -1650,7 +1650,7 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
  * __scx_add_event - Increase an event counter for 'name' by 'cnt'
  * @sch: scx_sched to account events for
  * @name: an event name defined in struct scx_event_stats
- * @cnt: the number of the event occured
+ * @cnt: the number of the event occurred
  *
  * This should be used only when preemption is disabled.
  */
-- 
2.44.0.windows.1

