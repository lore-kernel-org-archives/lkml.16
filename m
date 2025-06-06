Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC2217654
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241660; cv=none; b=afZaoTV/r9xZWQN7ITi6E5PP9OWYCUPPE8SICfp+7fBOb3musya8OThbyY4uUZ/G151OuvvGQZE47lp8fpG4JSfq96Ny5Fr5uNXd8xF5vtJpIehrsJHzwga3S5eFGe5RvmKxZGheFjznf3CkdSfc57b4CVZU14zu3m3CyEtj5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241660; c=relaxed/simple;
	bh=c9XzlPzNbHPZv5CZbjDoLXJvrIRlDE9rLXfwLl+VDZo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/OPGjodoQ965fjbtPuj7zx+KPalvxcca0kW80nmVlepGzktCh4pJsMiFwgRe3mVr2IMJwPu591w2oPWnm2Pzc0L9uxC65KINOdNLW9SUaRAUW8PHIZINDBj96csMxH4rzyto+ARvakpGm84jh/OTJffrr1Glzhnc9WM8faieEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/Kw52v6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/Kw52v6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22d95f0dda4so32468745ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749241659; x=1749846459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nytlBN0i+cuzwSh1IkdjpnTfFhTj3b2gPCYDP83uMJI=;
        b=G/Kw52v6iXOk3z3TgwNlKd3S5YBlH4A2mHrNu6SrtUFG/exjOEmkCaKoZAGh7F9CM2
         SZ0heKK0EzhCjwjltVxRt8jQBD3xP1O0ghcySQJptFSLNGu3ne07WBvY/chHekm5nwe5
         diO2VYsO1GfBMidMnQpUL/iFeyhhj5N1QqA7rcNSmkluyMXx5yTwo78vhLQdJWQUdpfi
         8ef4Y2shuYfSu68n+wBy0dCWUuZr9OSNZKndsZKwG0FKyjTA2XFVFSV4XAFR6QYbyvOk
         M1b/uKQmtPOw1QlGTztoF5sl7DL6IXoo8PP9H/O+p3Km23mPgjXgO3I5X4oTvDcCWcgc
         79Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749241659; x=1749846459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nytlBN0i+cuzwSh1IkdjpnTfFhTj3b2gPCYDP83uMJI=;
        b=u03gdRLDE4qIwZTjtIuwsi6LEposBZhJo7qoWrg5MQ77g2GUC0K+acC1NRgzw4bLar
         r5XlRS4LccCOtKqKcXR0VWYgaXh2NFTDn73PLAD/DvfWwggueHo5Mduna21Z+8FqxCPa
         D3QBmmlAZh8Zc46VOI3+nzc5kB7M9hF6DYSSmk2EGnKHeukv0KHdjPycOMzwmSnacMvJ
         SaedlT3PUj5tJ1xu0F3mYJ5ngVqa4Xz2G4t9wat+8dllb8rxES4UHkcLI0gGcjsNFtyV
         ubzVxPDuZgqqkxlqeAmMHSsY+Fb545LzW7SWQATlok2jrpTDjGuNng1SymvahtTObE2v
         DNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4hql1sguXzTzQz9P45aGZ7Y2isQl+RxEdY/MGY0dOpxG95tT+ZV8lydkdawvSUljBFJ6F1qyzL6u8X2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBoTyu82FhHif127LppW7RJXqGpR5z/WgtZoxkvPNhNJCvMyOQ
	bCqIabewixyxQxxnkzbvDC5cEirsddjafc1YBetn2TFJ9XVuviUvuM2feDJ5hg==
X-Gm-Gg: ASbGncswomZY/fpm7Wt77H0d9CLXSHRuarkZhdlHrqz/L3Ht+KDQasNjYoE//WvBoky
	9UmvkGq5THyWpVZ0mPxkYurHBMTXwvQFyALlvmUgDvCdXu1iztT2C4xMWLBgRDESRyaepgqGxfU
	XvG7HDdvGqqkSSN99iEj/BXreE/Fl/MGupSvoaK3o6AsHi8/J1L4iODOUDtQdG0Xy8iGyzvsolJ
	lkbG9NxCvxrMIGIY9QeTF6iCrlVLkxqbZU3qB+j68dklsOz6cA1/zgyBCAMZWnf0FsH4oBPBnZE
	fJAbVo3/sUZSb176Tz5qVo73WN4f2vzHnfwWrbuaClzPF0G5FovEJR3+LnXXgg==
X-Google-Smtp-Source: AGHT+IFvSK04vs3WhWQHLT5eN87+FQg0p3ufEnJAhQcEDMjpkFCRH5jzoYPAxHi1IGln1wO8fWOUJg==
X-Received: by 2002:a17:902:f54b:b0:235:5a9:976f with SMTP id d9443c01a7336-23601d14fe8mr71371145ad.24.1749241658698;
        Fri, 06 Jun 2025 13:27:38 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034109c4sm16331475ad.210.2025.06.06.13.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:27:38 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] smp: Improve locality in smp_call_function_any()
Date: Fri,  6 Jun 2025 16:27:28 -0400
Message-ID: <20250606202732.426551-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606202732.426551-1-yury.norov@gmail.com>
References: <20250606202732.426551-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

smp_call_function_any() tries to make a local call as it's the cheapest
option, or switches to a CPU in the same node. If it's not possible, the
algorithm gives up and searches for any CPU, in a numerical order.

Instead, we can search for the best CPU based on NUMA locality, including
2nd nearest hop (a set of equidistant nodes), and higher.

sched_numa_find_nth_cpu() does exactly that, and also helps to drop most
of housekeeping code.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 974f3a3962e8..7c8cfab0ce55 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -741,32 +741,19 @@ EXPORT_SYMBOL_GPL(smp_call_function_single_async);
  *
  * Selection preference:
  *	1) current cpu if in @mask
- *	2) any cpu of current node if in @mask
- *	3) any other online cpu in @mask
+ *	2) nearest cpu in @mask, based on NUMA topology
  */
 int smp_call_function_any(const struct cpumask *mask,
 			  smp_call_func_t func, void *info, int wait)
 {
 	unsigned int cpu;
-	const struct cpumask *nodemask;
 	int ret;
 
 	/* Try for same CPU (cheapest) */
 	cpu = get_cpu();
-	if (cpumask_test_cpu(cpu, mask))
-		goto call;
-
-	/* Try for same node. */
-	nodemask = cpumask_of_node(cpu_to_node(cpu));
-	for (cpu = cpumask_first_and(nodemask, mask); cpu < nr_cpu_ids;
-	     cpu = cpumask_next_and(cpu, nodemask, mask)) {
-		if (cpu_online(cpu))
-			goto call;
-	}
+	if (!cpumask_test_cpu(cpu, mask))
+		cpu = sched_numa_find_nth_cpu(mask, 0, cpu_to_node(cpu));
 
-	/* Any online will do: smp_call_function_single handles nr_cpu_ids. */
-	cpu = cpumask_any_and(mask, cpu_online_mask);
-call:
 	ret = smp_call_function_single(cpu, func, info, wait);
 	put_cpu();
 	return ret;
-- 
2.43.0

