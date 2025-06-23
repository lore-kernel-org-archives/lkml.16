Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077C21D3EC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750636824; cv=none; b=lJIQwzNF2iSnKjnTY2428XSYs9159CtSLvUb/UInfZt3mDbKBhBfxwrsNVkAa3d8lDqZD+7HjYHUahpu7xrDJerqKK71snD+6ZQW5KyTx/WAWn0Y7GlJQ7rfN/x0e7zcs2h+kHCLM8DsjTKb1M0Wxq/7iioqq+5Bf3JzrzzoqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750636824; c=relaxed/simple;
	bh=XNhTVp0zHBlF+0PsXbzMdH+Fm4DPs2k4Bhj5e2VKuYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqtbaWo/zCoKt01h8hwRNMpaBIcX6/HQz7tVv9DAMUbOL3qVm5TPH3U7eW1hWXUv+smoZJGLcRAAP4Aa6aNRzJ60Wu/dHTE+cgi1VScCgeKvQRJQuX2a3p49DIq8qP8+W7mPdAYYai3Kdmia0XXdO7OuuBC7dl0u8msVmwid3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mze+4VuT; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mze+4VuT"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70f862dbeaeso32656997b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750636822; x=1751241622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTdIBCLwszMjDGDcQS0PiAhY3upxjYQq8cnaKLJOLs4=;
        b=Mze+4VuTozIEc3i8gMvzFVL9CvBFQcpQjEi4A839p8mFCDZJFuwveZi50aE8/1fEKf
         G5faF+6ZjcUebVOrftMDMzTITbDAtZBo2ZuYQCEJC+3slTxpi4xMNUd7BkF4RBbbstKF
         mHD2ciKx73PLw26IzXXNKAfa1kriXTodGw4JLHdKAqyQ2QekglMkU6W00Qz2rgbO3kt5
         n6frnnxT5jkV1c/SkgpSdeonOu2KkY2dp1JIlZWBd063dGsCBUow70ZUXDiPjUpjB6PX
         YCo9bkXpcIXq5UJLqJZr42HFiD9SrRpCqAn46bEw9+zuh7aFcqRxgTw2zoxhAiKWegY/
         Qh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750636822; x=1751241622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTdIBCLwszMjDGDcQS0PiAhY3upxjYQq8cnaKLJOLs4=;
        b=dERXb/Abc53SAEZwjiyp3xDB6+uDpGWLjfRaBsNqDL9cptTZKlA8uMO+6hL29e4Dui
         Y9KyncfwxoydD16/S7uNZkBtk0g+HdIAbuODLQySEHObHx3VzXOrWErsCv4EB5yEFvSZ
         S1GifJZ/nvOHTuG/YrXbqVORcoF5O/EFPI5kWuVOGAdw8DGr56ndLp7ulJ6lXBr8YSAu
         dKwXutaLp/rQjBM0Utn7BxYqRvaT6zc+lkXBpilQk1jvH7pPW8lOwdFiEx3mH5B3kLC0
         IOtqkbf4XZDKMeBJ/+pYiY6V6jfLyRCtg/R4r0+x1SAoHXiCbKfURByeMbNNYnyC4ITQ
         6E5g==
X-Forwarded-Encrypted: i=1; AJvYcCXravfjvXzl/UUZ2PRmYGSkAxWqJRkeSYMqPfKPtwExJbcTLJW11HDaIu/BxRxHQgw0VAWUAnJPmcqDM7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1xeMGPzgaTzzndt6H5tchsOg8O43GSaPakXGNASfeMbVXs9A
	lh+ZDCr36/aQ91CXfYAyoC4SJz/gMbvghry6R8T9Cya7sqsVMTpqNFfp
X-Gm-Gg: ASbGncumsahEVpsBZN2svwpFXzhirhCakcHbnsRckIKGPZ3E4rc5jI8xyFDm45USJCc
	rlALBrM3efV7WJY31f4Kxrk10vIo3SBwkYqscwFaVwdyPEZ9JbCUweEvCQthIn4Xo6hEOw5p2Vj
	u/9BtjX/0/bShP+P2w7PuQYXDCrGcv9f3oXWZGq8lnMXRyx0pxb2eKx5zxppHeyAYTmiTS8S+xO
	LWhDU1OpMwTbOQn5vYfUyCjwu0T3yWyG25SUZpAdr47s+c5zRhPxXaJ+s1quH5UJUs/caIL/o2D
	kmR/iGfEdxEmeS+qNBLSLhVPAKuJpE2AB9Y+G2Qk+6b+2oC4vHRHJVXkNNbzFVhpp90ui/NQtAA
	RRAYhD6kB3o+CkWwNMIqzmA==
X-Google-Smtp-Source: AGHT+IE/FToaPD7e3stm/h5Nd5LdAGsbRpIXHVZILc+iD7zhtzS2H6pcFI5YM5xmu9Jobq1oSeuY7A==
X-Received: by 2002:a05:690c:6213:b0:70d:ff2a:d686 with SMTP id 00721157ae682-712c6511072mr142592417b3.28.1750636821915;
        Sun, 22 Jun 2025 17:00:21 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a23909sm13531887b3.46.2025.06.22.17.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:00:21 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] smp: Defer check for local execution in smp_call_function_many_cond()
Date: Sun, 22 Jun 2025 20:00:09 -0400
Message-ID: <20250623000010.10124-5-yury.norov@gmail.com>
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

Defer check for local execution to the actual place where it is needed,
and save some stack on a useless local variable.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 715190669e94..84561258cd22 100644
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
+	if ((scf_flags & SCF_RUN_LOCAL) && cpumask_test_cpu(this_cpu, mask) &&
+	    (!cond_func || cond_func(this_cpu, info))) {
 		unsigned long flags;
 
 		local_irq_save(flags);
-- 
2.43.0

