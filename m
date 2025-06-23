Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269A146A66
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750636821; cv=none; b=d1togWsEk8jrq9v1Ut8bj2KGXT9sQWkh0U5znRp+vBUk5TBno/cqa5D41Pxn6Uf3jLLKgJIPmkdc5jRlAfBe08e1TO6P6K6NeDKJr29L6nV2ZuXbn45UnKiT2fEGWuZX7daiJw6g7iE3xxrxLahJFlqIEzRVyXaqy+OkVePXArk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750636821; c=relaxed/simple;
	bh=c9XzlPzNbHPZv5CZbjDoLXJvrIRlDE9rLXfwLl+VDZo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ra383xnz+YfT8eF6LSlSHvfPAt1J8/Bmz9IzwUN321pZJGHWTIwr9hK7x2pSLjYg/jBaY8pia1Emo5zfANjE8mvQD6fA32pnce4ZE/+mvy4dMqQT+df82lRp5dZcDgqLt5I3vq8F/EnP8WgNSZlMdeVp4tflUxxM7U/3TflIqKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl8ewu27; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl8ewu27"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7086dcab64bso29336367b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750636818; x=1751241618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nytlBN0i+cuzwSh1IkdjpnTfFhTj3b2gPCYDP83uMJI=;
        b=Pl8ewu27zh3m4wfl18IR3cMfD7x0I7ZxY6No61tZNlWWNoF4XsTk1zOwnxCZ6YEsgk
         ZNlj3e+DZLpNyyVusLHzfvzITsuPWTKcWXwp6w3RyHk/3NmbpkDL79kB6bSMiyQDgkoG
         uGWg8ohpLBUImGufvfOyQwHUaSMn8JKWmL68iG3SajNxvBxca72ITijG9YfIS2i+gml+
         Gy9ixIGymw8mdGmAWntvdRTF8rbPH/3LRSxABmoliLBiSwg1aiIfRhQmZFoEnRnAnsQA
         ENpwUP4HiI7xK33Afg5dCLRONKrNbhvqmC3bN2PzVRm1iKoAgB35Hi+Z3DVaHkk2QgTz
         as6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750636818; x=1751241618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nytlBN0i+cuzwSh1IkdjpnTfFhTj3b2gPCYDP83uMJI=;
        b=WVLTVSt87prwvcztLBqWsYx8M1gunNuJ1XdQqn7xTKImFQzv9qQ9l/+3qn6Y8c880g
         hdIrRHS/ex5Z8tWm9vQPV5v3gnHsvpLhjdMtkd2R/jEg5BrlZLo0ysKi3E7wdC0YULf7
         klgcs0JXy5OrmEgOoCjGflzfJ0A1yvjUcaaLBYtjXkXcRG8xZfFjU93RS4FgXLVqzYca
         Y4Jza2JWLOLB3IEGYFTFspNV83m3YSfLWUSJJgq5SsmptQp8exYGioYUYEe0uWM3e9eD
         S3NfIUOr3r8jP7dCsXGEG8u00FOQyux7mKZHFEcKwQpjhsZCAdRGvGP+2g5tSxqSbUqQ
         7LUw==
X-Forwarded-Encrypted: i=1; AJvYcCUWzyGFmt5NhP0TYOXyYDOZ47hAemNGZxD9zupeM0D2OPIDWoyHWZE9uLiKyKNyLGiSzbtv7+kKjiKycOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YziULnnAZSEMPAYVtMjEkDcB6F4iLrZhHjwesvcHnmgWY8izMLv
	pcte3EgTdIgCRsUTGH298b/Ob1r/sbbx9KfYDA5hQLWnuDblQKPTkDgg
X-Gm-Gg: ASbGnctAgdhm5ChawpakxxYhC6EpYGH7F+7S8SX8zpl24izq/heb133ZZejxh9FtRUg
	8WIl5ifl6znGv2wc8kDOqtB68ot9x9oz0PbgpJpSe7kXoU1lbWNErQSSZC0nIGTayBQfd7+SWKi
	2rWfX04oiKAr4bL9q10UuQR1tuVoeHpc+YpGrxvDrRDNm6jyopszcLIjF9QZmjiX9jQmeYsooZE
	1h/SGAHSSReya4I3rgX5J+Lpo4MKAYkQ7C3IIj7e+caOOV0LKSeuDoWBfJ6TrCFeWn2OyWAg/xj
	hEr+dsZRsoIeM/DOjcS7Pb2Qdtmkq/T+rppIDEEnfAvX8NIn5F3PjvZVMGBWb2l+wH6kX+7d2hB
	vM1hANc2DXSMVi6L6KuOlLA==
X-Google-Smtp-Source: AGHT+IEjndLSyL1o1cfH1lCo7hIJwKaxxNNUvv/OmcR02y4Gcge7cAXdLe9SYVgvp2ort+THaj+9/w==
X-Received: by 2002:a05:690c:6ac2:b0:70f:8884:17af with SMTP id 00721157ae682-712c6386e26mr159251457b3.6.1750636817719;
        Sun, 22 Jun 2025 17:00:17 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4c1d4basm13341037b3.110.2025.06.22.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:00:17 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] smp: Improve locality in smp_call_function_any()
Date: Sun, 22 Jun 2025 20:00:06 -0400
Message-ID: <20250623000010.10124-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623000010.10124-1-yury.norov@gmail.com>
References: <20250623000010.10124-1-yury.norov@gmail.com>
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

