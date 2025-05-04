Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818C6DCE1
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746382120; cv=none; b=d+2UFPBnamV05zOcI39rSxBgfrpPGd/iII5RlwBF1+jGNlUTHK+6gu0VvPtJTXzbzK51+20Bm2rY2zThkiM09GnOVB9d1G4QnmJp9WshMkYkxzohyBKX6o6IjqvzhNB+AYup6LROBMBvOmwNVMTI4u9pwwV1gzrjPLBp+ho3TFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746382120; c=relaxed/simple;
	bh=Dh4YHFOgWXWXpCPK+kg5z2exdSOEyTpitUyfhcZQu34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eS4NEZpgOewd5u7gEqmkeIGgWOhPi2TCb4zxKHroe5w9Ob1T7jo2oy0mkpFkhD3gWEhSZyZA3FRXPK3xFTHPs6r4q58zD63tOaCcLguy0VV1SGZrGnstZAlp9T7xjwG4iqeUvcDZk1serYP74Di1QUsO8c3iE+eypsW5DXcKs78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=d/T6HE7I; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="d/T6HE7I"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so4610161a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746382116; x=1746986916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZU4OdYYzTeoaOfDkxv0DepdTfDIAIiF5rbb/m2nDE8=;
        b=d/T6HE7IEVPx84WyeJ6S/BrSnE25aARQ7yKd9hj8Qvy6ylgze+2Lg+K+d9YnW0kasg
         AUgLxYjkAIYIW7UGFcBcMpped18XxpnADU+A8RaaEiaAqg45DoG7PC+YPr+VrHgKSxRI
         VG7m3DOq9x82er6UB+G5WLNmF9Szfm7QEay0N4uLfj2wyOWflKslofIfF9IoQLESS+Z6
         +gKTpe+oJ/qij/oCSHAnIhncFIL7AdsmGqsqSr2OvcyvYgVQsKVUn2pxL4Y64Gb7lHWH
         pbPT7e+35vvq8/mSkV8cu/gL0eCcGtgHZx43lYbe47+jG2NmpwATmSz11bDvIlfLGI/e
         xZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746382116; x=1746986916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZU4OdYYzTeoaOfDkxv0DepdTfDIAIiF5rbb/m2nDE8=;
        b=BlMjOIVnngl1rSuP6tjN543T9IKEpN5PWfE1BaishzsDEF56SgZ6RALIdf8TyapymX
         CjudQKsv4LvtZK4JFSJEFvt+uobri4begd1eTLCP6S0hEn17fltCypg3Jk4G0k1aLYIt
         12ZVzbLph5TV9W8GUY/m+11T7cBPZGT12/l3crM6X+K7WqRzBqwa/TyfRAMBiyfnhNgY
         Un61VaxUrjyuKf9ofDubraIFASOyFA9RsOOf46TQMh4yAWu/eUhDS/7BzHq8a2OLcXom
         NCZIPh6FwNrcZ3MiNkZvYwcN7+LyhKNqzULanCR6uwZUfoEF0bpCHL9jTx8XmhEkHzkV
         pM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjx1HF34uHqHFUHfVgGUcNHDEad61cxI8cJz/SGjHbALPOvD8QFkrh4bq3swBuEvTagbc00pqi4gKfjtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3MLU8UhuRO14Odz8m2Aowo8BlMN+5Za+JXkPr1vY54yjV1iH
	PiRKUfA1dmy14paAqU4/Kv+k6pCOC5YNBtBWcX2+p7LwMRJ/II9H7V7RpEOUy2U=
X-Gm-Gg: ASbGncsnu8jnFgiv1oJ8AjmaH7258m/MHFpDDj2+vTB/6SPeMyJT0YHuJlLM9sJLWvx
	JRjMVm1CkE/E72XWPAwssGAqDtREFzPepli8TCNEsBd0Bgz/Yths8dJfh+uaaBWNlCe+PFBUaAU
	GpO8x0b+7F91IUIRat5gP26FphjfzhX7QvznhEPZkwoa1g3e5WRSUqUg+UNp5DOMOJ4lw3YmGAI
	to0RMQQwZN9P2OtVdDR/Teir/GpFvRUyExhF4orSG+g1Blni6GKkItDupFgPBzMYW8OqTlfqr8l
	WTbaRHyM9HdeLHZMYgvhDSfWCCMZjlJQbBD3eQc1CTlz8NrcuiYdcvzRAxSLDqeyzINR5tRAdiR
	D6bAbropGCnjG3ZE3fOJGc1XHebZN1qq5BkwIoHlf
X-Google-Smtp-Source: AGHT+IHkl2u7mKu1rGSGOUonmxXU1goNFR12pI5mEsyHASQu3O9fhryuiMQAK9cNbLQS/kmxaMSopQ==
X-Received: by 2002:a50:cbc1:0:b0:5fb:1bd8:2f95 with SMTP id 4fb4d7f45d1cf-5fb1bd8358amr128931a12.29.1746382116240;
        Sun, 04 May 2025 11:08:36 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b914b4sm4077440a12.51.2025.05.04.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:08:36 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	song@kernel.org,
	joel.granados@kernel.org,
	dianders@chromium.org,
	cminyard@mvista.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 0/2] sysfs: add counters for lockups and stalls
Date: Sun,  4 May 2025 20:08:29 +0200
Message-ID: <20250504180831.4190860-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commits 9db89b411170 ("exit: Expose "oops_count" to sysfs") and
8b05aa263361 ("panic: Expose "warn_count" to sysfs") added counters
for oopses and warnings to sysfs, and these two patches do the same
for hard/soft lockups and RCU stalls.

All of these counters are useful for monitoring tools to detect
whether the machine is healthy.  If the kernel has experienced a
lockup or a stall, it's probably due to a kernel bug, and I'd like to
detect that quickly and easily.  There is currently no way to detect
that, other than parsing dmesg.  Or observing indirect effects: such
as certain tasks not responding, but then I need to observe all tasks,
and it may take a while until these effects become visible/measurable.
I'd rather be able to detect the primary cause more quickly, possibly
before everything falls apart.

Max Kellermann (2):
  kernel/watchdog: add /sys/kernel/{hard,soft}lockup_count
  kernel/rcu/tree_stall: add /sys/kernel/rcu_stall_count

 .../ABI/testing/sysfs-kernel-hardlockup_count |  7 +++
 .../ABI/testing/sysfs-kernel-rcu_stall_count  |  6 +++
 .../ABI/testing/sysfs-kernel-softlockup_count |  7 +++
 kernel/rcu/tree_stall.h                       | 26 +++++++++
 kernel/watchdog.c                             | 53 +++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-hardlockup_count
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-rcu_stall_count
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-softlockup_count

-- 
2.47.2

