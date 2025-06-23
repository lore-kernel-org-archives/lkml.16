Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D8221F1E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679961; cv=none; b=h1LMrISk8BHWJJw3VUyC+oJ17rZVOXGCPwJ3BoLwD6EL4+5X9k/dS/CCj5Yvyqt+stF0T8PbT31WXq1gH2KxoG91wr3wpiSGnZ8ZZuGwG0QwgouWtJ9KU5Q99AwPV3qmod80pMOTFsJXebmjiyRuEtwbVhg7DBw1hfVcKBcMpYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679961; c=relaxed/simple;
	bh=OVtZWEvqTrxWs+fFB85Jr4OAZ+vncZldhZNNzJnUtQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejm2AletqeEMAKTs9KhPz+42ys1PVPQHQ+AA0whNns/rzSH/66VFiGIaod5ifzZRUMvAEjiwBT4fS+fVsiDTxL/pv41iJ/KuPU3WwNTJw5DQFljLlu8eXlCjosLxiCIOnGVD+5QscVLgtKfBEq9EKB/clC3ke1/PNJyNGJQIpIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAnzVDiN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAnzVDiN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fc7506d4so3067020b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750679960; x=1751284760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2gFDaetMHey6dIvIJRhaxCKOYO3Bx8c45WBFbsYOF0E=;
        b=NAnzVDiNxx3FqL7br40O89s9hqzuYkDQ8ke/0sHrBpNcofYiyhM2c2fOuqx9P97sSP
         VyBfbYDQuuL1Vo8HAbWUBBye/CaP3L9jD/MuXFY58LXEK5fa9FgFw4LpSNRbR72C12Q4
         fP+hMKhzEaQLeIZH4dSpySCEaPizxQ2eSPkW03M6o1FdJ2AVwXgD9Q93bzW9CWkZcaaD
         +95hCDPoTVBh+BnnmBZxGkFvJiPiO7aT6jI1wJLx2i3z4AxOAneUBy3n/V2LTPJkE8hf
         BF0IeXwRbckrrac3WiO37fD++qpCmrxVAy9URor5QWROmy+lNaGk2hxfyeTNQkQW/RwX
         WFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679960; x=1751284760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gFDaetMHey6dIvIJRhaxCKOYO3Bx8c45WBFbsYOF0E=;
        b=B+LaQrqHXkfAegE1HHbVW7PkwM6VErMAqtUY6b0wW5lDKxfCxkbAmhry5j1FmWh/Kf
         XEtytnGyTe7n347WKSSnGt+PM/gKJiU8RUKjKpStjqGPEctI2OEiRV1Tn86J5sbeJ8h/
         e8vlChvX6tID3fcVQuOgc6TxZGCRVzdvmVnam6hSRiqAt0x8JToVjZdcIXg3+zdXisrw
         9hMyaztCYoQzl3V+EWSj4tWd6M40AyBIHEQ//q+/g1Gh3eKw6aGPtX+zxtmy3WLmlyJX
         wO/0ttOFD7YtyWzZpqc2IiNaGisOhvEWtv5Zj4Y3eKmaxS2lgUpE7tporel3zt68piXP
         zeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm3qiQI0jojQKPCYZM1c41WlQdU2u1LWlwNipGaNVOn4/Ghk52zc5RxxfkZYn+ya2YpNuaIhwrVzxo4/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnYsAmKrYD3aDMgqEexG/HquF8Qfn9TPuYcSFHMvoUHR3G9tr
	ONZtENlKQwV+uFS1kbRnkPY69Ktj99e2W8mD/RztEmMUOVTkEMEqz4wA
X-Gm-Gg: ASbGncuTJ0caPYNixuzqFUu5/3Sgb4XFdNn2d7bRYxCqyPHopn3uzllNVyi63cS8vBa
	F6ayAegCY/BYQqGlE58RXiOkMXVLnuUKIz8GBk9iBPcOoHWEpCzsrq5G4nwLEjrlG/7uHuqOQPg
	Rzc93FWjrqGxX+x5cdjthE2v04Aco4rw97HIvsIjK7AsL1JN3QNDdfjx9hCzsQa8TTqTlqeOlfh
	3qyqQXAVaIwYN+TMGz/WD/U4wOZbyNjU55MIrgj1pgYT5CxgyKpRUWg7YY8nzzbdodcjKyqxIoX
	Hli6dDogc/MHotpULYgPgQBlp1fef+pb/IDxmbqZTyB0hUI9mbK3JZkZHkAUg+Z+Ohh/MPlB/Rl
	aCowi/g==
X-Google-Smtp-Source: AGHT+IGENzbwd+w5kSORrib4SFE4rljagkxk+oYR70cHi8N8EhVYkvNfh9DewpM7VwsdB7llU3bPcQ==
X-Received: by 2002:a05:6a20:748b:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-22026e92b60mr18266313637.10.1750679959732;
        Mon, 23 Jun 2025 04:59:19 -0700 (PDT)
Received: from localhost ([202.43.239.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a491576sm8196104b3a.40.2025.06.23.04.59.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 04:59:19 -0700 (PDT)
From: Jiazi Li <jqqlijiazi@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiazi Li <jqqlijiazi@gmail.com>,
	linux-kernel@vger.kernel.org,
	"peixuan.qiu" <peixuan.qiu@transsion.com>
Subject: [PATCH] stacktrace: do not trace user stack for user_worker tasks
Date: Mon, 23 Jun 2025 19:59:11 +0800
Message-ID: <20250623115914.12076-1-jqqlijiazi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tasks with PF_USER_WORKER flag also only run in kernel space,
so do not trace user stack for these tasks.

Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
Signed-off-by: peixuan.qiu <peixuan.qiu@transsion.com>
---
 kernel/stacktrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
index afb3c116da91..82fbccdd1a24 100644
--- a/kernel/stacktrace.c
+++ b/kernel/stacktrace.c
@@ -228,8 +228,8 @@ unsigned int stack_trace_save_user(unsigned long *store, unsigned int size)
 		.size	= size,
 	};
 
-	/* Trace user stack if not a kernel thread */
-	if (current->flags & PF_KTHREAD)
+	/* Skip tasks that do not return to userspace */
+	if (current->flags & (PF_KTHREAD | PF_USER_WORKER))
 		return 0;
 
 	arch_stack_walk_user(consume_entry, &c, task_pt_regs(current));
-- 
2.49.0

