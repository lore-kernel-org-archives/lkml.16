Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24301218827
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241669; cv=none; b=vFrG9RddograYAVdTBwh4jprwAem1paP8vYxp6iyfnD3T3y8o3fFT4GvOsSL/m5TkrhATmrdVMmiSUIR4ueItujkgHZgqyPh5uvQXXq3IwztYY2KeT9Opz1vin8c4rHPnIesHqT6sfzsWxoDEyVyHTC+hHTY+uOf+Be19udMZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241669; c=relaxed/simple;
	bh=DnmuKb4te8Dpg4MpVG4LfMdpxQAkeF48rj6DbMQ/hwU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2AewdOKevwThZMHVsYmdGujVsC/rPTty74lzhmID6gtX9FWfLorFpRtSEbCHog5o+LTHGXxQUmr07mLT/HECmk5Wae/U9YP24tq+0nwzveGCptLtC3j+x7qzelnkONEKMUx9p66DCUjZxgMQPhAtzr3OP1l1VKB+9wZBh3ZOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3qpBYls; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3qpBYls"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2f645eba5dso594939a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749241667; x=1749846467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc+5CHD3tDL3SNSorIV87nIdNFJZNqq5KxOMmRZzmKU=;
        b=F3qpBYls+ard4gndsWXDYnFZ1DrkE1ObHvIVRyw2954hA6XppJ7/QV47JC50YkQEyx
         BPtkZo+Gv+zRDJBy1UO454vxORVY7UbKAuym6ItJ197XpLcsyt9p3nE3bplPua4hqYfN
         MOAWi0Zaz+i6MHbWSy8FDYHV15jq7fT7htM66SJzVkWYY6xLi6wVs/D6mVR97p8oCYnv
         aryrIhRd0fsO50sEfU1ZtfxuL8tQQxh0jZZPrUEZLy4impssESIG/63OxPMtWiz8sCDK
         p5UFn4qzsy5Olk5s3Aw4MnoYLPgb00/MfgQEl2wLa0wrtFidnUXVoPwr7Pd0jpDF749K
         EAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749241667; x=1749846467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jc+5CHD3tDL3SNSorIV87nIdNFJZNqq5KxOMmRZzmKU=;
        b=moyiVcwI2U44z3FR8NDa8Ux+paJcrN5fjwbJoxCukuxPwvdeFPbanSNl59rTNRUTe2
         YCl8sqHKoQRXjqN0t4RiaS8iL+tFvX+GbPqaLfzh9NgkpTjqbvQIfij/aRMb34jyANMu
         nKFQ/xn1amwkS82SVmUF8KJiTKZ23Ju2FH+t6OL9HhbLO8Yu6ZOTd7qadFr7wB562Qx2
         dIRShSQgeTvw9jkB2llQlz1tsO79MGPGyN+O8qMMrwtU5cwAGPW0GHWdAUZmVa6/+nOp
         fPx4cylZ6H/6Vz5LocqfAvdXnwMYb1Ke4lIngcaPBYm0f00zhq7k3qLtWKyYpfcay3wQ
         aEqA==
X-Forwarded-Encrypted: i=1; AJvYcCUO7F3HOrfNP1x4wkVm4vhwz8EyCMjyhLp/TJ3vx5brIi2JbUIN3VQAlx5LjLx1q3/hGNqYsVNoWxZ+9Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2hn4Li40LzxuE+X6YLIi6u8MgsNCuMZzpi+AERVmOw04efNZB
	5ef6zdbg8UGxozdOF4mxHtwJIfmoBT3pX9zuSxn2evL7cUN8HPPZsVyy
X-Gm-Gg: ASbGncu0Xz8Q0xj6vNnEZLMZyQ5yv14TqDW6vPS0jFlGjH2yr6AOapZcOUYIU4SxoiN
	fX4bcf9K2tyyx7nIEGGtfaWA/LWiGNWtBk39nKY9ZQNT+88yLneB08YCRFV1lAjFdHevqJn75lJ
	gt7gyXbWXFTZvIy8y4e5ABlFRjiB1stqO42oB0/VQlG8xsKqEKUmXyg+JUu51G+eBK30jYDNOs3
	J3o4l0VpvD/lMrqpj+1cBCEL4g9TIwTYxup1Bt5fUVzMtGl2eiFtTr8stIH+fVRbY80wTGg60Xo
	3e2y+CjVmResRTQjFr41BilIm/7GRXbaG1tyAdhbb/ntKJYImTM=
X-Google-Smtp-Source: AGHT+IHIl/2sIz0QzhUU71ZO2gTtcWGbLD5DKJni6Zi4pQpGhtBHoXECcyo381A/ocFKz4V9mKzNlA==
X-Received: by 2002:a17:90b:520d:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-31349f4311emr6162152a91.6.1749241667286;
        Fri, 06 Jun 2025 13:27:47 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc374asm1702099a91.29.2025.06.06.13.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:27:46 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] smp: Defer check for local execution in smp_call_function_many_cond()
Date: Fri,  6 Jun 2025 16:27:31 -0400
Message-ID: <20250606202732.426551-5-yury.norov@gmail.com>
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

Defer check for local execution to the actual place where it is needed,
and save some stack on a useless local variable.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 715190669e94..867f79689684 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -779,7 +779,6 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 	bool wait = scf_flags & SCF_WAIT;
 	int nr_cpus = 0;
 	bool run_remote = false;
-	bool run_local = false;
 
 	lockdep_assert_preemption_disabled();
 
@@ -801,11 +800,6 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 	 */
 	WARN_ON_ONCE(!in_task());
 
-	/* Check if we need local execution. */
-	if ((scf_flags & SCF_RUN_LOCAL) && cpumask_test_cpu(this_cpu, mask) &&
-	    (!cond_func || cond_func(this_cpu, info)))
-		run_local = true;
-
 	/* Check if we need remote execution, i.e., any CPU excluding this one. */
 	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
 		run_remote = true;
@@ -853,7 +847,9 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 			run_remote = false;
 	}
 
-	if (run_local) {
+	/* Check if we need local execution. */
+	if ((scf_flags & SCF_RUN_LOCAL) & cpumask_test_cpu(this_cpu, mask) &&
+	    (!cond_func || cond_func(this_cpu, info))) {
 		unsigned long flags;
 
 		local_irq_save(flags);
-- 
2.43.0

