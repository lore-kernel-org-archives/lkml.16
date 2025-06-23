Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327242056
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662193; cv=none; b=ReldCnnTV3I1mnk0QARBCqEM293KLIiXVXjpJFvpN2SgN71pk+XRNNXNana213i7TO5s7Egf9QLq7SpTpDvINcDd0+X29Xxu1/Krc0kvpStvDj0KN3OO3a5M+0SJYv5s4Jb51rV/mVKguzWNXf7k+My1R6Q2FtYxzkMHOjujuFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662193; c=relaxed/simple;
	bh=gmxFbTpAAd+V5Uwe1Id3TDHjRoNK+WvylpdR1sWz9+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBn1bqK0r90DSzmv/9OENwJCt58tvHfBXJI7Lt8MLEd6KQ3glX4qUWOenYp5H2pLRPZzdChDCzHOTkS+zdCUNujTuFlyc6MutavOZR3qvtpD+G796lkWUalXQvNKXOI+PQm94Uj7tMnUByQvDsdRmRWq0CTwwKKPyXBk5rziaMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUfnaxtj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUfnaxtj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso576138766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750662190; x=1751266990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyW0Vxub7iaUTttsq0MS1TFDSsOqtzVU7YIHaIk6w5E=;
        b=GUfnaxtjrpQxzZXPpdXLCpFBKy/COFUCLhyq/bvQPqzN68tMQo3Nu4/+4izQSzxj8Y
         9/I+nOn9ol5ezfF5/AF2Zfk341fqfuaP8+TkA/6l22J8/5BNzBYgEOOYlP950YUf4KBf
         Q46okZFSvta7PzYj8MKsVo91UVLbpMYrkcSXlXM/TZEfoC3UlTBrMwUWw3oQHvmcmBoo
         dqlirhcCnO+L9SoU2jnkowp3uvEnUG0mUHBPKsro+m8y4RJw6x6zvoKNF1sKGX90w50Y
         U4idP0125TeRJw9ttluVkSkMp4ZlONnBfTVkFGKZT9SDiHvuRUlwMu06oRWgKbEx0dP7
         aSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662190; x=1751266990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyW0Vxub7iaUTttsq0MS1TFDSsOqtzVU7YIHaIk6w5E=;
        b=vMCyPqkEl41FnAgqQaDFB39gdRmMPx6tk3+6k7dFVztvsIlIdae1+qMPxBBA8JJhyx
         SxcLbkSib4uSMu90TlqVpuWdj0dBECKIQCt2tLaByXfVDaxrDyCr7XGVJmTkcALC0OXP
         uLOh5ZWlJSpHjHoAjYLSR08dbOZ3CucKw9ZHKhM/IwPSwjjwLfXXcJAWyZ/KFL4MDDLL
         LbnKAc/6SpFTiX+d2rsFgSyaQ/7i8+bYy1julxY9jHbgTBQqkglcJxm/FR3hQdj71CPS
         GmdGyPDZsfm5CrDXghIrz+jI/KmZzBYYiCfy/3Z0XOeJ3CD89ZYPhLkQUzHdgQUDpUAX
         VRRA==
X-Gm-Message-State: AOJu0YwEy0e5Oxyw6hxPpXFyOXU+/gG88NWSzi16wbfzpiK6cft9bIEo
	NaUwhHgsNSUQ1dO5fRUB2CK5s3qmT/T/uhbS4pYCH5LoZekeTajwesxequAaRXI2
X-Gm-Gg: ASbGncuCEi3qmPUnJc4mtzeXtgaOM0k6zDGPxrJHWR87E9vkJdP+0pu3i3s1KpB6B36
	SIkk++R+E7mv/bE3n6oiuOXKbChaF0IOIgNpZvAEJqN8CPAF7yB6EkqYQaqOHTcXHUN+Mi8MEQ1
	T8m4ECpZUZkb7eq7y7YhWG2hvKsRQsvdToDJlTbW0bmEPwV48cKcdJp1LKOrpezN7votakCnmoz
	lcnOrPgUx5ihAeJIeva/REMoAg5Eo1atjKkdn21JXvpYm1unSwgO41D5MQISCEWIJpzXWFjmy8Y
	PyN/LCnbWg9SWlfgwFh5fP0dXav0Qfm2b8t2eNWX2LSfKNetdWenImGhTBF9V61p//SOspZ0pUg
	1
X-Google-Smtp-Source: AGHT+IFVetoG+plYeYJ8SzR22pJXfztqr5pZfQE2rEgqL8yAtpXKGunGRHaBeC0rcHFptYY/q2OKDA==
X-Received: by 2002:a17:907:3f0c:b0:adb:2a21:28b3 with SMTP id a640c23a62f3a-ae057f3d649mr946727666b.54.1750662189415;
        Mon, 23 Jun 2025 00:03:09 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e36sm648948866b.120.2025.06.23.00.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:03:09 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v2] entry: Use syscall work for auditing in
Date: Mon, 23 Jun 2025 07:00:30 +0000
Message-ID: <20250623070136.662-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use SYSCALL_WORK_SYSCALL_AUDIT to check if audit needs to be done
instead of audit context for consistency to other syscall work bit
checks.

While audit_syscall_entry() also checks the audit context, this patch 
replaces the upper audit context check (i.e in syscall_enter_audit())
from using audit context to syscall work.

This makes consistent with other syscall works. It also determines the
auditing should be done earlier before syscall_enter_audit() called.

As privious versions of this patch discussed, using syscall work is
cheaper and more cleaner than checking audit context in terms of
readability.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 kernel/entry/common.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index f49e3440204d..3e9f2d40230f 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -17,12 +17,10 @@
 
 static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 {
-	if (unlikely(audit_context())) {
-		unsigned long args[6];
+	unsigned long args[6];
 
-		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
-	}
+	syscall_get_arguments(current, regs, args);
+	audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
 }
 
 long syscall_trace_enter(struct pt_regs *regs, long syscall,
@@ -65,8 +63,9 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 		 */
 		syscall = syscall_get_nr(current, regs);
 	}
-
-	syscall_enter_audit(regs, syscall);
+	
+	if (unlikely(work & SYSCALL_WORK_SYSCALL_AUDIT))
+		syscall_enter_audit(regs, syscall);
 
 	return ret ? : syscall;
 }
-- 
2.49.0

