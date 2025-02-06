Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88D235346
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860287; cv=none; b=FyUVVV6AXy4qsXEeEZLXSUmk0ZFXN+qRM9hjOkYoRzsZWed36a8YLZupBLDNx4a52DDx701o0a0UhOjNjqi0WxDuSZLDbu8acO1KSMETU06uM+j410IQ+I8Rr6jTiEDS2L3MU3CHD+qf5GSwTWdG7JmRnh18ibfFjzWGy1D8lzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860287; c=relaxed/simple;
	bh=r62co9mNJfiSNGFb+F4LeTY0HEmILYURR/osDdzL9lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiXHTdz7CZxPREMhprOtbMEEeUrDVy7u3XzzglmgMqPfP7FT52NWVzlnqfv4hdHQu3AevQmZRNv15XOeuhxrMZ64JOQ7YO3wB6GIABIzdY7/AaCzfnPCQf8zkhYPgGCKz4sHA54hyatGzIfv5Ndxi202Mm5ysXfVclgEOTQGTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzQTIg0V; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzQTIg0V"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dcedee4f7bso1799194a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738860284; x=1739465084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IRsUl1DoWd6JSRMlZTMDFPeNqR08JYH5OecHzvHDUA=;
        b=UzQTIg0VrmFxV6ef4vCcqlMhqT+o/S54AtmD7Go9Cjf1R2NEOkYYv4TuTleIE/6NwS
         +wMUBkHL5KbFH3P9WozAARyuFE9Nrw2Ph9HtJ34+G6ceWDMYyTmsFSmBVsCsDce6kekb
         dXA7Z3pzxDWxcL9HPSUhSbEPL2i3U3u1nmZyrQDKbfbRf5GynMPE0OdDAE0mt3CksQsl
         JIf3Xsl1EVqg1oOLXQwVxY8jMlSg3kjp2zB6ua1rIfS7i4tVGLC1qdWmGUHp2g2qXF0p
         AwLBSV1kGAoXI2OWQeR1e96DsCpM3YSgYsnHkDBit8lOcpz3fPi5UogvQQpMpbl5S/z9
         OwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860284; x=1739465084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IRsUl1DoWd6JSRMlZTMDFPeNqR08JYH5OecHzvHDUA=;
        b=O/40t/576sV9WWwvNwgBEo+jTono1Vjne/qqgBaG3OAdRje7hahGGN4Iu20EFfepq2
         IPmCaxU/+9GjVuS3jkJc9b6MH+1BQssSqxjSOB9haKHKAEbAsNzonHGSS7RB97xl03/M
         aZGPjM5snYsf1wloGp2T8J0Q73umh85S1Pe7nl3g5e94byTHKmeqtrPW1j52O8HOwmTG
         GlIetJhAbYuXW6Oksvzco7WC4oS5kEGbjrpoCTCiFSaWDST+n2w4bSBgX1EduWYimsA+
         H3xu9Ezu+LXGHHn6NQrNgn7Eq39620ui7NjUckubI4ELOTBme5CIfdS9dRZMP6gTABUi
         TPyg==
X-Forwarded-Encrypted: i=1; AJvYcCU05ShQ0IaBUcm7ZCWP5RLFM0zAM9PBVczKxSMKWQRXWbXzKK7fGbkaEQO61mlNQrVv5CRH7/thpLo+Rbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoa/wqiqn2q1D3sfVgOUqw920RL8YHuzrTeExqGtys4lHdDrCO
	bEcoq4bO/+6Cd0LU/b4EKFAsof//Uz2hBdVLipJy12B0NfL3XEHN
X-Gm-Gg: ASbGncsyCgMsyymJ2GLdLPx09eoxV74ZiuubD1trx9sy0M7aky+lFDCuBNmhOnMNZrk
	ivkz17yDinoAumGTOKYfqRZr3QlqMC2EUsjmJbJf84T0n07MyLKMzgNr2y4b6VInmGIV5m8jZ+W
	/69RxC8yFmMjrNO45LUHxXz/GND1OwTto+bDWyG4HXBqCnXF5+KA0USV2d0iBTDQ74o5QUuAEUA
	qjOi06vU9uNGIdAf6bNMWjhqQvR+C8uq7OXGeTekBZltCyKJ5jGE7NsjdSJAmN0ScCQ1ANg+MGh
	3Z5NuiqPA1IKwQFfggYfEcWZ/ymt95U=
X-Google-Smtp-Source: AGHT+IF/fkxqlN5OD7wxB5fphZ/GLCgzWGcUDbg3a/MqrOJlCn7w1iI57Nqc7rlNQEyIj4tGWAicDQ==
X-Received: by 2002:a17:907:3d8e:b0:ab3:875f:a246 with SMTP id a640c23a62f3a-ab75e21dd12mr838335166b.7.1738860283449;
        Thu, 06 Feb 2025 08:44:43 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa69sm1121849a12.73.2025.02.06.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:44:42 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v6 2/5] exit: hoist get_pid() in release_task() outside of tasklist_lock
Date: Thu,  6 Feb 2025 17:44:11 +0100
Message-ID: <20250206164415.450051-3-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206164415.450051-1-mjguzik@gmail.com>
References: <20250206164415.450051-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduces hold time as get_pid() contains an atomic.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 9d7acd7b0040..8c39c84582b7 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -248,9 +248,10 @@ void release_task(struct task_struct *p)
 
 	cgroup_release(p);
 
+	thread_pid = get_pid(p->thread_pid);
+
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
-	thread_pid = get_pid(p->thread_pid);
 	__exit_signal(p);
 
 	/*
-- 
2.43.0

