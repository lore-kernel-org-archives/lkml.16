Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497D720011F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040342; cv=none; b=iL/ZJETBjqqOaCHO0GqV0hWyBw7vmFllDEE9sSlusq0Y3X8lkyRfrkMzPz+qtbNyXojjtJjxQqJc3DyXv8e1+Dz9RMba9T3jRaHc3joScG4oBcaUXK0/EYMQRIwFRHn0oS7fKylMRQf9GircjxdeENHEjyqZ2wIGD8IwC5Nn3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040342; c=relaxed/simple;
	bh=PHv3c3vhIJln97xnwqLJo53XteMXlVsowkn247j2FXY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PcWeIvgzHyo1NMLUkZcdtBfOKRg5h6MN1WEbcec75zUUPsLLPe1IhOtka2oAOGwlOLxLXme/nEP8sY+QERn5glU7wUPI1MSIZT3JW0Mt7VSAHYZ2ZuKCSQhGWb2RtAlHLKE2JkSyHiKwn9MDf7LjV4PKBTmgDGeWpiUZl2R4TGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrQxGP+p; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrQxGP+p"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e53a91756e5so4163066276.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744040340; x=1744645140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKcvgfvOu/nIKfn1Z/lLcoSsPpuWPl28y0Pjgymqn9Q=;
        b=SrQxGP+p2rowOgn0FxsmSI5ArdU5fD6DvxLpcgZKGhZ/37jqTyEoLZ1Zp1vFk0U5Je
         KWcvLZjZdQkVPn0X58BW3w7Kl9m4RNny8p2T4qUWvxf/Jw935HsxnqjPLnirYldb21o8
         bO/uXRkSdF1nbxE17usIwtvDEX0LxdG9OkG18Wt3XLP0k2C2t2LHAFcAC7AniXRc5/P7
         l3OOqWy9o2KbNpdRrcDtR6cyZiKFc2q+HNJThnR9i2mrw/qvNa32xYwYnLx8baQlVpfD
         voO1tAAc3ZjcKbQ3lNWuw6fFfJtNrizI22ZsV/ZU5lerYZE4Z1+LO3TupGueYF0oYZem
         uwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040340; x=1744645140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKcvgfvOu/nIKfn1Z/lLcoSsPpuWPl28y0Pjgymqn9Q=;
        b=gx4q2Thw1nh/SbGG1fsaEZf0IM0uBG/0nXlvxTifn4cE5+84zsVcqCpD0x6ZsO1A1b
         M0IbaT1CC9MqHPD/tPRuNYmQ5+X4vFiF8R61NZYPoKdFXY2sw1FmqTE/cjdh+3yPy8xF
         m04LxqLzYroOZpyIWxJFg6WDh1qBCwZZgsWFb5tWRdrLM533lVuosPpuZ+9kmuCiuqCb
         +7yV7opaOFKE0nBmZD7GjT7y60xKCCSj974tLotVGaqEYYmCo5Hne7KyIVERaPeLUQfR
         wBfgr+Pd9dmNg9ypqmpnF/A8BVD3RZ+lhlUXG88G0YGbgvWhcC3lBHgQzTqC8/IUGqmb
         Vffw==
X-Forwarded-Encrypted: i=1; AJvYcCVRFXwGiso4WWBWlA8HoebDAUI7p+CriFKEJtgXsSbUgUgkHU0lNW4McZoZ9eRfmFMVRDe50FxYMlkdX6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgYXkbwyizmrPM9HsbAMR6+LFGY3xXhTJAnFojfbdV/j5SMIC
	hFHhKLS9z2dUyr4XdZkiASxN7sJFnRbpJQHqoOD5HpNeTulXpHzO
X-Gm-Gg: ASbGncufth3NV57QLultZh/NYusITOCh2gwozs0fIXmbQoWjPbY79JnZOp/pV6SVrTI
	e8675ijWKOUJo7cfi/nRjJqDU4xoi3zeF2POTi4ZqoMpwpdJ1VPmCo/4I40HTVgA6I609rsUECk
	Cvq0oly8CiCYfYmaHqLy5pA1V62xuu0Rm6V+AYSYbH8WKxS2gU591em9A7eU9fBbb4hzoSqKniY
	MQ769Tl5g0tWwc6t7t4/EWrqu0gYHnZkg0YJQuiQZFKRxk35uFIk14dsY4VuqxLE7YKq2+R/MBY
	fpJOn41rcGXFF22VFhSakusCE1XkPi6ySV9pjaIbDdh0qQ+QjxSEtDYfzdCkp9gBbXqE22Wb3mu
	6IjWD
X-Google-Smtp-Source: AGHT+IFBngPkA24tKRFHHGc3DSInjf3c16iyEDRDgmoVfT2mUXMgOabZJFmPqbdFAsDYmmRrYdQ+KQ==
X-Received: by 2002:a05:6902:2782:b0:e60:9f50:5d0 with SMTP id 3f1490d57ef6-e6e1c2e4279mr21290835276.29.1744040340121;
        Mon, 07 Apr 2025 08:39:00 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e6e0c8b9b44sm2433580276.1.2025.04.07.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:38:59 -0700 (PDT)
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
Subject: [PATCH 1/4] cpumask: relax cpumask_any_but()
Date: Mon,  7 Apr 2025 11:38:52 -0400
Message-ID: <20250407153856.133093-2-yury.norov@gmail.com>
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

Similarly to other cpumask search functions, accept -1, and consider
it as 'any cpu' hint. This helps users to avoid coding special cases.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index beff4d26e605..0f816092c891 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -413,6 +413,7 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
  * @cpu: the cpu to ignore.
  *
  * Often used to find any cpu but smp_processor_id() in a mask.
+ * If @cpu == -1, the function is equivalent to cpumask_any().
  * Return: >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
@@ -420,7 +421,10 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
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
@@ -433,6 +437,7 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
  * @mask2: the second input cpumask
  * @cpu: the cpu to ignore
  *
+ * If @cpu == -1, the function is equivalent to cpumask_any_and().
  * Returns >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
@@ -442,7 +447,10 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,
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

