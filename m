Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E221B91D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241663; cv=none; b=HscPcgtidyVOdM8iV/v57caIhtKnuovsfmOOBNk/6p0+pJ+/i0bDnrcSBOUNA5GkE+kweuTG2gN8NnqRySWP0X3rmPavZ84ogn/HT/bKCIv7uMZ4R7gNzO0smtC4pJHnTC1OWyd56lUfK5AOxGac9QmQEynQ/UiTtAGgUruJnuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241663; c=relaxed/simple;
	bh=2ExBq4btEL9f6gFJ611GKCHP0/rYKFM+FGG9C8i9iXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4lyK/CgdtnWL8YojuLo1H8Zw/Abk94hTtztz0JR4TuLsTlp6Ey5aTm3Pmh28jMSDBzqGAyJ4sZHoCmdDjbLoiwaqLRUy6uN8XPjdUUO/ebz30Xen1saS6pyQcLJ7jjxQ7vQELo5gEHm3XV3EknxnpibU9uKuFyrbruDfFwvkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYSWzxJ4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYSWzxJ4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234fcadde3eso30481875ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749241661; x=1749846461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDiZyKcaQebxUPimMBVk6ki6bnrdNDkZ3MzJQYGddWQ=;
        b=hYSWzxJ4ETB8eiCV+o/NrDsPcraajE+qo9TIAHrEfcT0k+FVsBHUw92I0HbFdnzSUu
         lI3z0mUEPaSc3krktnXjlJchWlKJzuXnT3jfOxNlXEKxa2damz0oQJQTR1HVtngCABs5
         JOvp6PpVyEWWPHafS9MWgyU9knvpPTvjHdk54Db7nf8A5f+8qPjpd1zcjjXtohvcJjYo
         vsQJVl3B+ygDHOSQvFQD2iQ59qpnQNI0GJwU6uF8G75mv+j0HBkUKsPIxLySzwCSKd67
         0ydlZuwETi39t8aC0/stF4OxGqvjVK1TGnq9IteoEdg7GaiHFw1baQsvJqJSLONv+afV
         LRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749241661; x=1749846461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDiZyKcaQebxUPimMBVk6ki6bnrdNDkZ3MzJQYGddWQ=;
        b=AkG5+q7S5svK512AMjyr1bj9FmuFjw//q0rSHQMgqkX7jkPgq2AYil3F7DLUuvvvuG
         Pj+mDD6vPtm3IPCK4xnPCwb8MD3+dgUNUg9pIiy7oE64mVkVZ2GP9e8QhtlW9VCMn8Ao
         FlYiQGbiTx+ZuV65doOxbPonj7urW79PJ/OJq+w38rEVzuEVcNKFe/szNIriis3a01K8
         E6XK0ZKli8FryDkejP21z/mnPoyk0xKY2/YsCEh0tv1QxhPJw9XS42Y4opawFUVIsev3
         pQDLBPWYoIvE0ScL2fqhB/gM/X7rxHPGkfKEgV0LjStlihfm/wZ3ZYXxe2Fpq5QSTYEp
         g6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmFmjUBkASxmbPJYIk6GI6Z8i8ksgHsqd+9Bb24cjyxTXOCg1aKIR0Xd8gU6AP+7AaZP4rV7kY2woNtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QdOuM1FdaHfI9ekt6oLNBbdMLOZv9qfOIbJ7hBCCexH1JJw9
	szijYr6R5aQbyfBn6iV0ZuU7r15Xj2QF1Z125r6wJBe2HUz+BzWKFVgw
X-Gm-Gg: ASbGncvOxIejO7oQa3t8aIFRHrRsfoKv660xOYmn2TxybrB8iP9j/SfC4cI6ssuCz/N
	RHsDeWUjurHH+EmttfAZ+tGjE4lbXsx2eSSeVQSP80gE9E5pSWR1/OBfXlbdjDPtqZYJ/Gwib7C
	9rLmMrUfK43uFJqSoBphr6n+5GC38677K8VRQch8rYwNM5Ux7dACAZ5ABPYf880k5goZBDFquQW
	Hm4zFNMm8+Sx5unKiD6QBfZUZ+pDRnfCoiFgRC3VQGGT8h9M+ZffFwgTt6ROLxgMbG1fMIpETa1
	6F4HoyMPct6E1f8DLcY8mst1o5SfcsVujFl5QcSJOTiQ1CwQRUao6+LlXq7z4w==
X-Google-Smtp-Source: AGHT+IFGsBBaUonibtpg5yxv+69bvm1J05wESm/g94ZM3rmsvrj1DBqeqU2SsZoo82VG/F9DsXx7vg==
X-Received: by 2002:a17:903:22d0:b0:234:ed31:fca8 with SMTP id d9443c01a7336-23601d25bbfmr66393505ad.27.1749241661570;
        Fri, 06 Jun 2025 13:27:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcd08sm16411785ad.131.2025.06.06.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:27:40 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] smp: Use cpumask_any_but() in smp_call_function_many_cond()
Date: Fri,  6 Jun 2025 16:27:29 -0400
Message-ID: <20250606202732.426551-3-yury.norov@gmail.com>
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

smp_call_function_many_cond() opencodes cpumask_any_but(). Fix it.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 7c8cfab0ce55..5871acf3cd45 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -807,13 +807,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		run_local = true;
 
 	/* Check if we need remote execution, i.e., any CPU excluding this one. */
-	cpu = cpumask_first_and(mask, cpu_online_mask);
-	if (cpu == this_cpu)
-		cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
-	if (cpu < nr_cpu_ids)
+	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
 		run_remote = true;
-
-	if (run_remote) {
 		cfd = this_cpu_ptr(&cfd_data);
 		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
 		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
-- 
2.43.0

