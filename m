Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D864B22A1D5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447150; cv=none; b=Tk4WmFDuQkFlI7m3lnXhL1NmakNoY8xo8rD2uK5RogtzE6lBqwLOsefKESoqsLT33XXGs/TDinTO5hJrWq5TY4Y6EiaAFX4Jj/D+SEnp0y/pC3A3IOU2NDR+kXP62UfMRVsegrPWorqTSEZ7BQOUqcAO/t4tu4ZxxoAkDZbmug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447150; c=relaxed/simple;
	bh=1XG/h2T4lsx3Hn2xXWyDE7pDaQKjx/EoGMimfujl5vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WlNhkD42VGmSprb+QNrbRuayc7kbOPe5u1xho+R+JHz3Xt6XqO+IIuV99a5wA8WeUwxf0EnLzZ+botjIj/nApocfe1xzN6On+SLrfYNzvcm95DVBCG2uSIh17bwDDUoMxFFhJSgLPLrHcQdrSBlYTixqPrZC+zhV+AgPFvAfGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ftxciaVP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ftxciaVP"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso7930880a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746447146; x=1747051946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9r8JZDSLey+LPslkTxL3F3CckoUVLzDnaowPZQJUHms=;
        b=ftxciaVP9UHpr0C4RuKqDi9tbzcviOsJwMNM0a/QyucFIY2/tH8HYXhAcXiWb3z8Q3
         vHIeKhjlTtioZ4c0oKlXrpsXotEfk9Ia0FIkvYcQnPdJ/Q5dj0bJDCKVYnfzWXHSH+mk
         euyVJEPVjzjKw6WuGLhGMgqXZNse3kDx6r6lvqto42ZNlLTEzY2QDBH1nQYTtKLMq2PG
         ZCvgf3HQ/D/BzNCKaLcKy7W5FyzOu1DbbIX+QFIPxifyAPuXB2cZ7ttSQBFwf3G4/l/K
         iSEXe/LWHdKkHaW4+x9t7OBQI3AtlVx5Ksk9/hi5B+lQ/ZR1x6w8m4a2kHT7ptusQq03
         Hzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447146; x=1747051946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r8JZDSLey+LPslkTxL3F3CckoUVLzDnaowPZQJUHms=;
        b=CdqjZci62Z5rjENhh+SVLwde3ZnPewN9CMm8SbjwkTkmMxFp8z9IBtGVNJ/Sg/eyWC
         jTGFrkLMl1rAYLpTdblP1qFGpEMN0U2oqFVdZJrOfckY2+vfsLU1vA6jZbDC466jLetW
         d/Rs/JCj+8oQABNNrwt06SxHwQ3Ks5cNSXt9fO+uAxmILSYXNiMx9CZr1V2q3ifb061w
         V3iFCMvt7gqBnSJgoyYCVu4UddOVMJ8wXssSPy0HP5ZANwG4WfJwVTHAZ90lWucLJYRr
         Eye+uXysgwZzuxnrxbX2VH9K3RXjA7FZA4Pk8TbkgtrPLXmjXKrYFFLm8xQAveU5jp5h
         Jihg==
X-Forwarded-Encrypted: i=1; AJvYcCVzYV9RUz13Zz/rAkvnqcMR2ioT7JVEwjIAeWjSqqudl31K00waOEKh9uEUimPqAuT8SZiEMk680vECVVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcEkzEl/IIUZ2a1i5ET7/JANLdX6OE+ICmUDcEKqsetA5/E3tN
	eUcxb0Ag+zxQerxqy5ViDcc8UgcNxMru7Ljj0zL623M1uHc5DYprzR9HDX5KVoHLPE0l9eRij5c
	9
X-Gm-Gg: ASbGncs7PM6TzcrPjEQZPIILNmz2vnzt5tb9yjNU679QGt49l5/10l9KFxlvE26RLT6
	iw0YNUj9Z2L/WkI4HmG5UF19MyLTxhExlwUt+rjbYw1ZcXrzxjf3oWFiPPBUOXvRhQ08/RYwLUT
	IOF2vMO7j3T6RJxVmDQjnayHsmlXo0OVLp7qGKc8USASsbOXghIQUBcuAdqPkVrYPaI8x66G8tu
	hCOp2hhjJEGB774BfljfEZgU0cnVlwzeSCz3ZktJXgcDMDNXE5dQcRs25q8PRY2iNERVH72P64u
	CHINwOhGpRmanpoQJSWz/4XHi+yd1jTp1PHHSiAof54=
X-Google-Smtp-Source: AGHT+IE/OHvohwyYRi2AzwwzvgyieyFVkqxxZgpAwSf6DvMnqS1szARUl/Rt3CSGxg1XF4uqkSKMwQ==
X-Received: by 2002:a05:6402:274e:b0:5fb:3ad3:cfb with SMTP id 4fb4d7f45d1cf-5fb3ad31401mr449046a12.31.1746447134850;
        Mon, 05 May 2025 05:12:14 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c7309sm5497180a12.19.2025.05.05.05.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:12:14 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: Chengming Zhou <zhouchengming@bytedance.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Chen Ridong <chenridong@huawei.com>
Subject: [PATCH] kernfs: Relax constraint in draining guard
Date: Mon,  5 May 2025 14:12:00 +0200
Message-ID: <20250505121201.879823-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The active reference lifecycle provides the break/unbreak mechanism but
the active reference is not truly active after unbreak -- callers don't
use it afterwards but it's important for proper pairing of kn->active
counting. Assuming this mechanism is in place, the WARN check in
kernfs_should_drain_open_files() is too sensitive -- it may transiently
catch those (rightful) callers between
kernfs_unbreak_active_protection() and kernfs_put_active() as found out by Chen
Ridong:

	kernfs_remove_by_name_ns	kernfs_get_active // active=1
	__kernfs_remove					  // active=0x80000002
	kernfs_drain			...
	wait_event
	//waiting (active == 0x80000001)
					kernfs_break_active_protection
					// active = 0x80000001
	// continue
					kernfs_unbreak_active_protection
					// active = 0x80000002
	...
	kernfs_should_drain_open_files
	// warning occurs
					kernfs_put_active

To avoid the false positives (mind panic_on_warn) remove the check altogether.
(This is meant as quick fix, I think active reference break/unbreak may be
simplified with larger rework.)

Fixes: bdb2fd7fc56e1 ("kernfs: Skip kernfs_drain_open_files() more aggressively")
Link: https://lore.kernel.org/r/kmmrseckjctb4gxcx2rdminrjnq2b4ipf7562nvfd432ld5v5m@2byj5eedkb2o/

Cc: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 fs/kernfs/dir.c  | 5 +++--
 fs/kernfs/file.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index fc70d72c3fe80..43487fa83eaea 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1580,8 +1580,9 @@ void kernfs_break_active_protection(struct kernfs_node *kn)
  * invoked before finishing the kernfs operation.  Note that while this
  * function restores the active reference, it doesn't and can't actually
  * restore the active protection - @kn may already or be in the process of
- * being removed.  Once kernfs_break_active_protection() is invoked, that
- * protection is irreversibly gone for the kernfs operation instance.
+ * being drained and removed.  Once kernfs_break_active_protection() is
+ * invoked, that protection is irreversibly gone for the kernfs operation
+ * instance.
  *
  * While this function may be called at any point after
  * kernfs_break_active_protection() is invoked, its most useful location
diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 66fe8fe41f060..a6c692cac6165 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -778,8 +778,9 @@ bool kernfs_should_drain_open_files(struct kernfs_node *kn)
 	/*
 	 * @kn being deactivated guarantees that @kn->attr.open can't change
 	 * beneath us making the lockless test below safe.
+	 * Callers post kernfs_unbreak_active_protection may be counted in
+	 * kn->active by now, do not WARN_ON because of them.
 	 */
-	WARN_ON_ONCE(atomic_read(&kn->active) != KN_DEACTIVATED_BIAS);
 
 	rcu_read_lock();
 	on = rcu_dereference(kn->attr.open);
-- 
2.49.0

