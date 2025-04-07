Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550D201258
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040345; cv=none; b=T6pIwj3xrVPTqOdwDZ2myNqFrnfx4uDA74k57pGlxWaB8CK4COiTDmb1dBNjjXMTNf1b1We2iU/PIRZxx6V6bekUN89zoll9ydvhfWV67AukgVkSuseCTaYAb3ceAcLTvmXxipmWAAXOxprgJLrquM60ltEm+93vSEPTwb6UHOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040345; c=relaxed/simple;
	bh=/j3M1uu9C+F77GujjQypyAKgz544kzX0sqIEJgki2CU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQlgBTPh7s2ipJzBZjh+uI0jRqmOXMhkQ+KQ0KLqZ4OdHnw5RlH7k2xqlaxIXONGiqUhbvCx8eI5d1dEJQBNVnaxsCKkwvrjZlfgG1pfAzx04qd7Z5TTqb9zRpEkK0HFOLk9zQ3Bp5l5oX1PJ/f/FfAoTimgSmxtwjT9/slzfAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTwqHIc5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTwqHIc5"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6feab7c5f96so42556277b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744040343; x=1744645143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUg9GEd9vWrZ/rj86A40MHUOre17ooeFUfErMtu4AI4=;
        b=HTwqHIc5xPY5Lh5zVMZJoQMUzRwgyyxmB4Dxk+IMwKoE98g+L9TOUEjo7mTj6grEOw
         1PYYjZVWavIphxNL7uevzVsbwRVIVZYX6X34ACBgtd2p2I+yf7KAKwh0aYUhDz5IuvfV
         a8BVhb69XMAeGHTf/w0L3aFl4R1tu0UvENml0IZdxjA0Rs3hmk+ya/I7yS5Tc8RNLpxn
         Q2eQBOd+a5AtoXA1m3DELzdNvCWnshqsiPrUH0MLckhM8468fp9hscw0MHatYsssBhVC
         rL6YpnP3KZvHxDDU/PIjUuLz9k6muDZg7G8zNJBcqjbQaNh9KZYfzrguh0DqC519ftVL
         pHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040343; x=1744645143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUg9GEd9vWrZ/rj86A40MHUOre17ooeFUfErMtu4AI4=;
        b=E16ckdm7LIXI3QskcJHFU+XqKRdkmJgEUcuopNiJwUb7cDmcW6K6YIAUh9zMsJMUZs
         djC5q+QZyti0t7p1ary/totv4PyMYHhpb7oBLq+tGJ5J9IaGt0nBC6cvrD8CtHouKGAY
         +aLphyAdLuc9BLdZ8zk0LkyEjM8RwboDHJMP5dlh6aLEyT3lS5WKWBVCIbDcckMbD+4h
         z0rLCm+ZdsNwmzCE51drC7MgNNqCKdIDxAe6hhc0in0hP1vx4+L93F0TY+bahZYQJUOK
         yv2lMrcPGBWFkBfYIpynA7dqx52H/qO32L6pjzFoslT2NRwpzdDH63FlfA8LfE3+hoZD
         T6gw==
X-Forwarded-Encrypted: i=1; AJvYcCXKU71qll+Silh9526zQ8HBcU8VHFNo8YwcQmVx7kkT7ENnEi7ra2l5yY2NS34P6q/mHNg3HthF46UxrK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUDt2s3yTBPeB0TcTw3hT+xEUpKqlmfE3hSb5K8xtfLVZo8QH
	vjqRP8VWvhxPwJcSEuFuS3DUF2RyHpqqc/IB+6fCBBrNYYAN/Wnk
X-Gm-Gg: ASbGncsPLJ3ecaC1IjH0ifP7MujK1a/hUJu24XvgBfKbjt9ByJgyKrHsbB2PDr+YOJo
	zul4s+bMzV5amB4c+ggzLBFE/Lzs+ZG2hoAXMmFRWrEObVo2MglCkDXGyiODifcsLEXen3QIDlt
	io3IzmR78e8VkN165Hb0tAYXA9aYCHnPMVPdk7XhNho5Hf6vyOzS+trtQL8BoYlaGMK+Fc767h7
	DlaqdVs269ASnKZbO7N56pRAozDY/KB1Oxtn9V0sp9iUOf8mYODWkSdtYaxRq6m6YwYnJf1BacH
	vpO1fz1FQOQIOVnMAk8LLkN2ixlAS1XAFKvGyDFsZkbSkopyL+2ECT2dYtUwEks1qO1wuZep4Pt
	6qkch
X-Google-Smtp-Source: AGHT+IFwIENfljndIrpGt9Cf8l7TIOozxBCW4Fb9t7PBibicOkS4GOtf842XC6W7UgHmvMuB4aWZkg==
X-Received: by 2002:a05:690c:998e:b0:6f9:af1f:fdcd with SMTP id 00721157ae682-703e1545832mr254558847b3.11.1744040342591;
        Mon, 07 Apr 2025 08:39:02 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1e4dedasm25946297b3.27.2025.04.07.08.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:39:02 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] cpumask: add cpumask_{first,next}_andnot() API
Date: Mon,  7 Apr 2025 11:38:54 -0400
Message-ID: <20250407153856.133093-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407153856.133093-1-yury.norov@gmail.com>
References: <20250407153856.133093-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

With the lack of the functions, client code has to abuse less efficient
cpumask_nth().

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 59 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 0f816092c891..9067c3411cd0 100644
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
+ * cpumask_andnot_any_but - pick an arbitrary cpu from *mask1 & ~*mask2, but not this one.
+ * @mask1: the first input cpumask
+ * @mask2: the second input cpumask
+ * @cpu: the cpu to ignore
+ *
+ * If @cpu == -1, the function returns the first matching cpu.
+ * Returns >= nr_cpu_ids if no cpus set.
+ */
+static __always_inline
+unsigned int cpumask_andnot_any_but(const struct cpumask *mask1,
+				    const struct cpumask *mask2,
+				    unsigned int cpu)
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

