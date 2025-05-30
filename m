Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDF228E7
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597662; cv=none; b=ApUuD1snKakTA9Gc28Aps5tQFi8v0OB9uYzkRFTIWs2TCwLPHGBy5pte3VaTa91G3oI2HrLHgYU/YyxY9MenaJGrsBh5TTPdvp8TMivk5vzHZk7bVxuAox3Zui7NVF8Bf7PEPB6AGNWbGe+GaHKTAEb+1wbRh+zVZSxQ6yMqaQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597662; c=relaxed/simple;
	bh=OoRqkHVJJA6Fnn08xoi8Z+2+DiJAYYu6EEBieJEgtFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AmUejweQ2caiIH/YRfFlo6d44BHAK80+eJSnBqLYfDP9+sOU8R2jVcUcFCP8NEVHvVxsPGgZASQ9Z/DaA8ju0DDTosjcqiFp3rs/+AT/Fgai00KXbpCSS5JOuVW901UtLg4FV54ZB/blu2AtPWGwws4XKCRSo77h3HPZYfhEyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MzMp1xwL; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MzMp1xwL"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1073210a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748597660; x=1749202460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8WmlWSYokiEZq8ImcTa9QlYOraa+eQKx+5TbFt2hGQ=;
        b=MzMp1xwLobGJ+PxhL9U31NFiYdW2e6Es6/fKGhgS9fdx/3RJIOx6Z7xgtAlekeM4OF
         w2FHcZiGe/oaeAj4agy4q2T6ro7WHZAS1OUnyEjYeoN/KU3T2pJlXdCXQth147r09gg1
         upJOCi/JaVg7pKSz9GEHtge688GgY5m+rOiNcbvLzR+b48C5+zHCu0ZzGAMHIY0AOGyC
         ne70J2lkOTTmg/LXAciIlOeaD09k81C+JOCe78G+aFeCLKaqvXAoR5kvpqJHHEp/Nwhn
         iauXi4dGeW6dZOMk+imu/OBgrpZdQKC1ZZcmC0ljhNIEhpfxQnUphQIRRg6qOjrfu/Kt
         Dsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597660; x=1749202460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8WmlWSYokiEZq8ImcTa9QlYOraa+eQKx+5TbFt2hGQ=;
        b=kg6fN7xbJvcjqYeYIE/bEdnSq3RiaOq9qoAxSsh1FIH7Hc8RmpHAanYGkdIbkbfxj2
         jhwbAa0csEupHgOzI2nrAZQSHVQlI8JbNu6dMjLi20YksIVT6WsUQXtWQWAMSBLiGyDS
         NfCaLk6e2e7as69l3JNhTns0FpsHIEnliAghffE0IGc0uWFxB5JdJS1tOPqZcc8os3rw
         WBZIontnF/I7auV7Bh+Rb/IaALL0fhXAHigXDoDaiMfFTvgp3igpnoPL9oe+K1AlUT8+
         CNX7x9ummq9c5h4sIrHaFLdBz6TpHjo46CR01oVD+ZeWkLJR3aL8PPLSeGXOCs3cFxtt
         874Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyX7/B2sbrbrYlE9Xp8B7+1w5cO8Sts7SYrfMw9H66oknqbl6EGitmNKSmoBSe+tnd47dTbi6aDog2Uwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPdSW9ck+kXQYYRVjlpmEj3RVF/5NGG3fPb9Y+i7OiDWQwzzW
	gVY2V7p8id4tjlzG+wK49x+y2VlI2sVVL2f1LJNJltkTXq2JQNHuZI20GlmR0tgukwY=
X-Gm-Gg: ASbGncsF7pAnCn8fyGHKpaAY0DffTcb8B3V51u6qG4lulnXVck28izUMcpUZeL1PHBd
	ZnSNA2c7uVlCn+QsUcw8ro+6GG1tCauBO3KSTS72ci6oX4kUQG8M70qoR0uscrapgzNWfjYnm76
	GaqqUmuTN1LecLCWNhixczl/nuqD+E1ITPfmEb55erzL9HDsw7Wo9mzhdTtlhBoXUzGNXhbXjKz
	Sw48wO1PceiK4QLQJshRS14GRloZgwhhxpZJSPiBZhidEN1g7bssLzD+3h+/EAqob7v9LSGBzDK
	zNGsoeXZMtBqleiAsgas7bsJTmV1dRmHuUgHvdq2Qo860wsWvGr8b4lK56iAMFS71WJnSqLM8+r
	Cz21Zm2pN+w==
X-Google-Smtp-Source: AGHT+IF4zFLLKAk8uepZIGBZM+3fXRB/hltSj95jGD1vqbYt83ikw4yeQ1JJHBQBbftK0SQTg3CQlA==
X-Received: by 2002:a17:90a:d2cf:b0:311:a314:c2c7 with SMTP id 98e67ed59e1d1-3124150e346mr4368890a91.2.1748597660011;
        Fri, 30 May 2025 02:34:20 -0700 (PDT)
Received: from FQ627FTG20.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f7b8sm838724a91.2.2025.05.30.02.34.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 02:34:19 -0700 (PDT)
From: Bo Li <libo.gcs85@bytedance.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	luto@kernel.org,
	kees@kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	peterz@infradead.org
Cc: dietmar.eggemann@arm.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	jannh@google.com,
	pfalcato@suse.de,
	riel@surriel.com,
	harry.yoo@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	duanxiongchun@bytedance.com,
	yinhongbo@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	songmuchun@bytedance.com,
	yuanzhu@bytedance.com,
	chengguozhu@bytedance.com,
	sunjiadong.lff@bytedance.com,
	Bo Li <libo.gcs85@bytedance.com>
Subject: [RFC v2 23/35] RPAL: resume cpumask when fork
Date: Fri, 30 May 2025 17:27:51 +0800
Message-Id: <45c1884aaf21256ed6fc66b4a4a716bffebb54e1.1748594841.git.libo.gcs85@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1748594840.git.libo.gcs85@bytedance.com>
References: <cover.1748594840.git.libo.gcs85@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a lazy switch occurs, RPAL locks the receiver to the current CPU by
modifying its cpumask. If the receiver performs a fork operation at this
point, the kernel will copy the modified cpumask to the new task, causing
the new task to be permanently locked on the current CPU.

This patch addresses this issue by detecting whether the original task is
locked to the current CPU by RPAL during fork. If locked, assigning the
cpumask that existed before the lazy switch to the new task. This ensures
the new task will not be locked to the current CPU.

Signed-off-by: Bo Li <libo.gcs85@bytedance.com>
---
 arch/x86/kernel/process.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index c1d2dac72b9c..be8845e2ca4d 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -29,6 +29,7 @@
 #include <trace/events/power.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/entry-common.h>
+#include <linux/rpal.h>
 #include <asm/cpu.h>
 #include <asm/cpuid/api.h>
 #include <asm/apic.h>
@@ -88,6 +89,19 @@ EXPORT_PER_CPU_SYMBOL(cpu_tss_rw);
 DEFINE_PER_CPU(bool, __tss_limit_invalid);
 EXPORT_PER_CPU_SYMBOL_GPL(__tss_limit_invalid);
 
+#ifdef CONFIG_RPAL
+static void rpal_fix_task_dump(struct task_struct *dst,
+			      struct task_struct *src)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&src->pi_lock, flags);
+	if (rpal_test_task_thread_flag(src, RPAL_CPU_LOCKED_BIT))
+		cpumask_copy(&dst->cpus_mask, &src->rpal_cd->old_mask);
+	raw_spin_unlock_irqrestore(&src->pi_lock, flags);
+}
+#endif
+
 /*
  * this gets called so that we can store lazy state into memory and copy the
  * current task into the new thread.
@@ -100,6 +114,10 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 #ifdef CONFIG_VM86
 	dst->thread.vm86 = NULL;
 #endif
+#ifdef CONFIG_RPAL
+	if (src->rpal_rs)
+		rpal_fix_task_dump(dst, src);
+#endif
 
 	return 0;
 }
-- 
2.20.1

