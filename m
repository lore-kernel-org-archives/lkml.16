Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E571DED7C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779971; cv=none; b=AOT1IGkv1lPLOqJlPxnfq5ZPVNC6u1hgZYIH1KfzWzz6VcoF3TrBy5J0TgHNvzWYhfLX79PrnqMN5Xs4QqOMC32FJwVRNBGISmVDGFRe8C6w1LGe5/fPCH6EUhh+epDQ7a88TkCZBUKT7ZWfU/NK/L7lqn8NqskHxtMwsxxStWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779971; c=relaxed/simple;
	bh=+yUIscScO6W9Sugfn+LBZSyzjJ+5sc1HqsohaPrnH1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UM5w40BMLl8S3zVn5nHwOP0AMheZDqmBPvCvSLgYTS/giFwdgT89tsPQUrUSCGWAxjRYwho3lNGAPwPEI8vHrhH/ga/OhnkXqm2BMYei900OegzL+hQEOMMEmLpugsLzapwtJeiJq9kp365M4l2pXiKi+j4myq5P9VPLlGR0gr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TynIz5kR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TynIz5kR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2241053582dso61975215ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779969; x=1746384769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6m/NTTSOwQiMzNwImiTLbzzWwaouvSW4fUwqzHTNl0=;
        b=TynIz5kRwSfVBjIhFEgqw2whYt7Y8SDLm6IIu1sbcrx8Fnkh2GSaVXxlmxdBn5oTtl
         yp05zDn9eGBXQoa9UIe0EdZUopb7UJ7MGOKmd5Oykz3bXQlyZA5WH6ctv3SPJ3nkMilM
         kAxDPGzXh8icHySb1EpJeN7QjU22wzDlSQWJVELfzMjCGa/sP88AinpyxU1nBjpzuaPY
         BB5qu/0WW7Hn91N7m4Ld6u0/cEmC6dDhxtDBti86TgVOOHdXM6lj+OAGVpPTQw0SAacl
         T7j5moSyYQCSaouUwkCktXoW+VgFrQRfbxH6c7ucfH8qi4v9XGjiCnpqoBj8oRDlSDfK
         hIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779969; x=1746384769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6m/NTTSOwQiMzNwImiTLbzzWwaouvSW4fUwqzHTNl0=;
        b=i6z/eo4mBFY5pAkY5gPlx/TB2P69NfBXhXRcSY5tps2AZihv0PWWsOgyjlsvdGfFHt
         jupqTXdQN00iM+Bz9LbESQVCFZqhxSWAuqXoEcGnN5cUcISJoAG+aTt89YlwF1NvOUBz
         SNQVfsEGdclY4CP91VgygQYcfjeW5Ps/2CNRON2sVlI7gneohTmS9bzaqowYUp/DkEyw
         J6y16fuMP4vO8LwQ+AKFOuUqG2GBuZvGth0Djt2bwL8TpQCcORDH5nkpZNlzo1uBijJo
         NBbQEwwdimT65hGKOjqT8v7Wp78zlHJZfMBCgcfvaj0EHjqK7romxL7gj9m87kQqbfXQ
         DPmA==
X-Forwarded-Encrypted: i=1; AJvYcCV8xn6GsiDoXpR1ZK8zbjMh4a/dU7q+Tl92BgtaDQOQ83M9S8tDxpDGnnMsktI6nu0bISJRSltXro0ajN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdM7wYTkX2mAn1JHnBFOIO6kS4mFRffD0EmoNGr5Rr9uAMPT8j
	hpKyRTVQUyAztI2O1bAbuI4LNbYLRIbDFLQM0rSY+ur2bRfk+TzifOkMvO11
X-Gm-Gg: ASbGncuB/ZAJUwYPqOt63tAc0qEZPgUoy9IVka/8/BRZwf1qk/Cj1+YyKvkTIZBIViL
	gsZcnQDY4eXkH0UGDu8NBIoS1rV7un/PtoLJ4nkJ/lFxMgVbSbI6bGmshF872C2TGIvrgVyZ+I8
	s+Hdy4/8WI6UwjYHgplr3LZWpY/1SBGoKTmFA/2jeYK6eoZJUCjVR9qXBVq+GV7RkjDbl8msXVh
	xZmn6gFwiKcFhpHdFJPriWqCDshGpqJf/F6KxSx4rEF0Y+WcgwUIJv1HmIdEdNbkp5LLM3aaMbP
	+dEXYzsEpB0EUpaHoUdNRuBE7Z6GfUsW/ykhLVYN
X-Google-Smtp-Source: AGHT+IFXvnEEFz/Pe0VZ/JgotiAoiUkN8gk7aEgobk0iuX3Yfzml3SC6hNsfkcHCSVow33zEt4imdw==
X-Received: by 2002:a17:903:1a67:b0:220:bd61:a337 with SMTP id d9443c01a7336-22dc6a0f297mr99957415ad.23.1745779968763;
        Sun, 27 Apr 2025 11:52:48 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbbd37sm67676485ad.63.2025.04.27.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:52:48 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] cpumask: relax cpumask_any_but()
Date: Sun, 27 Apr 2025 14:52:28 -0400
Message-ID: <20250427185242.221974-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427185242.221974-1-yury.norov@gmail.com>
References: <20250427185242.221974-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

Similarly to other cpumask search functions, accept -1, and consider
it as 'any cpu' hint. This helps users to avoid coding special cases.

Tested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index beff4d26e605..0c57b9892d80 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -413,14 +413,18 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
  * @cpu: the cpu to ignore.
  *
  * Often used to find any cpu but smp_processor_id() in a mask.
+ * If @cpu == -1, the function is equivalent to cpumask_any().
  * Return: >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
-unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
+unsigned int cpumask_any_but(const struct cpumask *mask, int cpu)
 {
 	unsigned int i;
 
-	cpumask_check(cpu);
+	/* -1 is a legal arg here. */
+	if (cpu != -1)
+		cpumask_check(cpu);
+
 	for_each_cpu(i, mask)
 		if (i != cpu)
 			break;
@@ -433,16 +437,20 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
  * @mask2: the second input cpumask
  * @cpu: the cpu to ignore
  *
+ * If @cpu == -1, the function is equivalent to cpumask_any_and().
  * Returns >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
 unsigned int cpumask_any_and_but(const struct cpumask *mask1,
 				 const struct cpumask *mask2,
-				 unsigned int cpu)
+				 int cpu)
 {
 	unsigned int i;
 
-	cpumask_check(cpu);
+	/* -1 is a legal arg here. */
+	if (cpu != -1)
+		cpumask_check(cpu);
+
 	i = cpumask_first_and(mask1, mask2);
 	if (i != cpu)
 		return i;
-- 
2.43.0

