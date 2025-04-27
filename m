Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DDF1FDE22
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779976; cv=none; b=XMEVtX5sY2cMByS2dtUgKSsamqoguRCVP333eg1k65vNlS3SvvDQYnM+6mloDsedwLOppntL/uFv+CLGlQgZKlUfzCfVG15Po3VlnTMkWphiVlzezmYA5UBs6IouNNVy9lH8/IWSI6YOLlrKghJHubh8VXis4BWct5WnT69UXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779976; c=relaxed/simple;
	bh=U2miFFKRSAPW3ozQaPz1OxT4XKvnYkF8vzHlwiewPpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndLw1Zsb9YXNJ17vrDq/ow5LAbHyU2yFj6KRinkkrlxQxS1G3axuUKQUs+KFzqv1UOyy6bkBhgWsf3yNe4Z0PmQWYLNyvSMFYbenuMFM70IgN04lC5YxC/nXnBuI54B0DsNiP7qT1p9hfJ6AqDZ2xKupICSsp1U1lsteBB+gFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZGrzl75; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZGrzl75"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736bfa487c3so3313188b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779974; x=1746384774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z46hNAzvS73eByM2wkb0Kh4cMzqI8gNnavxwTBWCHV0=;
        b=KZGrzl75N2UgBnY7IU4GKaRb7GKoHOvMjyBXQ4SPeYkoES0XKd6rTnUS38OUSueb0f
         WoiKqMPDchP4wkg6vWZK7Dnlrnz5qE5ZA75946FMwOWdadyvm99reKYYufATRAWnxT2j
         f5d7iFJR/sRd3str1K05mkxC1Ond5e9F4IYFm2TYko/cqT62eSaxuaT4X1hbkURSoHSY
         tky0iOVouYTUqIRjSNGD+BUrsBXLn4urm+Lzq+NYJo86Fhvk4IQ+76Y9ggv/hYOS9BoA
         b3D+YQXQy4zgxpFa5xcDJ13wuQZy8lPtbB8pl5jXFLp9/IypIiPUave8e/UbXZWD4gm+
         NWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779974; x=1746384774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z46hNAzvS73eByM2wkb0Kh4cMzqI8gNnavxwTBWCHV0=;
        b=BtGcPcb43oRTAfmS1jVgbOC8JTvtUkXIrIEfcos4jy417uXydjUXFXHIKyg8ptc+cs
         CcrtiRTI54k1aA6+PzICS4Vx2fHMHN25RW5ZqkjAxpYofHTsWAkJTqEohUXmyU8WACxw
         2asnsBeen/0/bvW2KS8UkJX6nox0d6PgDf1wNKDVP2AgKycNdvGTtmGOVFfggHaCy4GQ
         05EaSmo5tgH4AZFKpceeOMfAEE6tnhNSYYdKCZByNSdibgJ/WCglGYtBJ2DdDJFe52dv
         vFV0yo2z3H+L3YkaklnyYAZ8JN5eA7zXmcOi5wSxTDHB0aC9wqSlA0yyflfrOHT/obKj
         srhg==
X-Forwarded-Encrypted: i=1; AJvYcCVzW8ElXKrPI7qMBxs5O/UV9fXROxLXN3jjKd7mr/5IRKYgxygDSHbDJ9UzgwakK9au34Cw2p9djNBDvCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtpbYu7N+tZ8ZinDuAAiXESc+Tnn+R189c4dDY2SKivBp/f9U
	QUar11un4jx/2vYdGjzg+IRHXfxVHhPfCFvllHZ8ggBkvpTwpW0Q
X-Gm-Gg: ASbGncvoXAAa1ur2GTYvm3ZI8idioN9AV/bJw0LBwQDrsYyeJ/PLXYnBpDn8l8jgEUJ
	Ehy0ysfDS4ZvHTcPcJ6ZUzyNP+CbBhT1WBi81XoaqWE4WTf87mVttBHusFqo6YhT8Ln6etCF07O
	bkIxI602pHZ84Gs+GyLVWKDGakRvjPhgdywEdkAAHLCPqYa69I9DSLVyG/W+QqoKXKPpVLX3WiR
	rC5lUC9lUhVmJw1YdKQ8BNmx1+7Xba/gyfHzvTlQbYZ0zO+N0aMqPpqRFKAk+a0t9U6mOYNY5FR
	DxczaSLQAAzsdqS1+014Zizf/raIo6QQhi95wMKh
X-Google-Smtp-Source: AGHT+IH4V33+fWd1Xo6DZDLmaGLax9OocWHELdYzP2FbwoFqY9mr79mO3NG3JwDzCCgFnHUJiBziVg==
X-Received: by 2002:a05:6a00:986:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-73ff72bf7b9mr8372678b3a.12.1745779974272;
        Sun, 27 Apr 2025 11:52:54 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25965823sm6483009b3a.78.2025.04.27.11.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:52:53 -0700 (PDT)
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
Subject: [PATCH v2 3/4] cpumask: add cpumask_{first,next}_andnot() API
Date: Sun, 27 Apr 2025 14:52:30 -0400
Message-ID: <20250427185242.221974-4-yury.norov@gmail.com>
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

With the lack of the functions, client code has to abuse less efficient
cpumask_nth().

Tested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 59 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 0c57b9892d80..7ae80a7ca81e 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -178,6 +178,19 @@ unsigned int cpumask_first_and(const struct cpumask *srcp1, const struct cpumask
 	return find_first_and_bit(cpumask_bits(srcp1), cpumask_bits(srcp2), small_cpumask_bits);
 }
 
+/**
+ * cpumask_first_andnot - return the first cpu from *srcp1 & ~*srcp2
+ * @srcp1: the first input
+ * @srcp2: the second input
+ *
+ * Return: >= nr_cpu_ids if no such cpu found.
+ */
+static __always_inline
+unsigned int cpumask_first_andnot(const struct cpumask *srcp1, const struct cpumask *srcp2)
+{
+	return find_first_andnot_bit(cpumask_bits(srcp1), cpumask_bits(srcp2), small_cpumask_bits);
+}
+
 /**
  * cpumask_first_and_and - return the first cpu from *srcp1 & *srcp2 & *srcp3
  * @srcp1: the first input
@@ -284,6 +297,25 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
 		small_cpumask_bits, n + 1);
 }
 
+/**
+ * cpumask_next_andnot - get the next cpu in *src1p & ~*src2p
+ * @n: the cpu prior to the place to search (i.e. return will be > @n)
+ * @src1p: the first cpumask pointer
+ * @src2p: the second cpumask pointer
+ *
+ * Return: >= nr_cpu_ids if no further cpus set in both.
+ */
+static __always_inline
+unsigned int cpumask_next_andnot(int n, const struct cpumask *src1p,
+				 const struct cpumask *src2p)
+{
+	/* -1 is a legal arg here. */
+	if (n != -1)
+		cpumask_check(n);
+	return find_next_andnot_bit(cpumask_bits(src1p), cpumask_bits(src2p),
+		small_cpumask_bits, n + 1);
+}
+
 /**
  * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
  *			   @n+1. If nothing found, wrap around and start from
@@ -458,6 +490,33 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,
 	return cpumask_next_and(cpu, mask1, mask2);
 }
 
+/**
+ * cpumask_any_andnot_but - pick an arbitrary cpu from *mask1 & ~*mask2, but not this one.
+ * @mask1: the first input cpumask
+ * @mask2: the second input cpumask
+ * @cpu: the cpu to ignore
+ *
+ * If @cpu == -1, the function returns the first matching cpu.
+ * Returns >= nr_cpu_ids if no cpus set.
+ */
+static __always_inline
+unsigned int cpumask_any_andnot_but(const struct cpumask *mask1,
+				    const struct cpumask *mask2,
+				    int cpu)
+{
+	unsigned int i;
+
+	/* -1 is a legal arg here. */
+	if (cpu != -1)
+		cpumask_check(cpu);
+
+	i = cpumask_first_andnot(mask1, mask2);
+	if (i != cpu)
+		return i;
+
+	return cpumask_next_andnot(cpu, mask1, mask2);
+}
+
 /**
  * cpumask_nth - get the Nth cpu in a cpumask
  * @srcp: the cpumask pointer
-- 
2.43.0

