Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3E21D018
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072093; cv=none; b=nwP1/lBlzf5wKWKHQsuipBlCekjsEnDtdbjlxPSmpHZphQ1il/8cZg/WY6GkKP+WEgczs3JgWIONpQ4MFOf9TqnofHz3Izoe63gHqgrwwFU8E/K/ZClfXaMct2d4x6c7vWb2mdDHC1a0RataBfV37YvbGNcpZgPC/B3F1frB52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072093; c=relaxed/simple;
	bh=vjzzopack8I4k/m/kpKdg/2RSq7jGGFEH9F9qiwZB1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzXd/cHk/6v8ptLN5sfBRgyIcd05H7tjQb/5FP5p1p0t9pW7gWP4lbBfwBd8M28SBg8NHLoKhBc3bqoQyuqQuM/bvWKZjQZqphCe+W/c14IJuvqIYQ6sm4G6DaBgxF8rPLTJF7NhrDaKkAiPZIE7f0KkGEGYq3YJkCxn8zhJ240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHWIMZBT; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHWIMZBT"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e102eada9so3898677b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749072090; x=1749676890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCjiiCRB5X+ASYeG/IGBi0ZaM45gz31jONUYysHS3Ts=;
        b=eHWIMZBT8h7aEeEVI5VgQ6u55kUgY8VbJPWBkx/ZvlqWuB0e+j1Iqk95h+ec79TtDF
         l036s3kBUkMK4x4k7oE1AR/Y9AdIH0nOggwElhZOTcNkYe6r1ZYUfve9/j14aBHdUJvk
         RLV8TwawmJSqIFrQT92s2kMEpDY/q1LbNn3tzpCRpqWNHel9IatZ6VBI2G3fNuhmxt6Y
         xJyCX2WqZshS8+4gkzMW3p0KF+b1eXL6PGYZiDrapqgfZQyoPcYKIViBIOE5QPaQVWlC
         LIImeP2ARhD+EGkI8DT32HuEy9POsVAeT49ct5B8MA0x0P2WtHNj6gSB04uh9KeXFfy+
         znEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749072090; x=1749676890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCjiiCRB5X+ASYeG/IGBi0ZaM45gz31jONUYysHS3Ts=;
        b=gpukVkR2lh4HZ+a0Pq3MXw8pxejtKzaz+DWn7UJjjwJN7Th5A1aCyLaY0KgfJTFGx/
         q1GSjYgQeoOAJw+qbNAGtNPrsDG/OgAWO1G1+3dVJj1UjMJwWurPMbTSpnkn3kF2Kp9u
         M6DJeW2jK0ewJPiVLJdhAuWzQCFWlNkyKPuq8DDypv6570/sYzTeKV87eNK1Ig+Jk1ZJ
         slFpYg1RZEcCtpXHU4Na8KwpFWFNzNeeTCjS2b7GWrvgH0YaIimmzW6aTeUB+FCofphr
         1XWvmxzq3y0Um/P9dkDAIdG0q+vSH5HjWW7OGnpNpmKdCfClsUl31eBVqlMvF3PRZSDs
         42lw==
X-Gm-Message-State: AOJu0YxpTWiw3Vj5UnZS67sl8f6K1t1NHRip+PaGDYPw+ZYCOavDJoT0
	oDLwf0tcftu1jUgB+dhQKLShroD4AgDCLkyojqHogKYyGhxfWOax3llLCsbOkw==
X-Gm-Gg: ASbGnct4rT9ZhA9x22i2wOhPpGp763TSbz9JcZduJ4CnAf11aqOf3Kc2PlsNnFaTIwU
	QEFsG9ub6YuJy8k8sJHEEqvtU9uqRjLtaSIk2SbvrtXf3XuUgW/FGjV1SIJ5t81aqA+4X4bkO8z
	wHocbNEAbdFkmMq4IJnYLB/YheVWIA426UqZU/uTV5m7VkrvsdCpLpnibMyxSntTtETgNzdUy64
	rmNXorCUXfCLf2SBLUb6f6rySIa9xfCoredqC4cHR/hFaflvOFnDt2EXhgd1vyEMGjlEVV7a/T9
	iYJ4GSJ1v83yKYPyybfwQyJkNpNdwpcHS6gKPgECqtFrbe+R82wcQ9JIa+zAnqCI7Gix6lxqjod
	TtptBNwX82OfVHb84DOM9Bg==
X-Google-Smtp-Source: AGHT+IFGEFG42O18ggB3SfyLdVuuv2qQru1F89BNl0E92j8q9obO7eJetkyv2QNQmL5/KnXZg04hJA==
X-Received: by 2002:a05:690c:6305:b0:70d:f420:7ab4 with SMTP id 00721157ae682-710d9fb647amr59422067b3.29.1749072089862;
        Wed, 04 Jun 2025 14:21:29 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abee777sm31663287b3.40.2025.06.04.14.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:21:29 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] cpumask: introduce cpumask_random()
Date: Wed,  4 Jun 2025 17:21:22 -0400
Message-ID: <20250604212125.25656-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604212125.25656-1-yury.norov@gmail.com>
References: <20250604212125.25656-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

Propagate find_random_bit() to cpumask API.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index ede95bbe8b80..4d3505acb5e0 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -354,6 +354,18 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
 	return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
 }
 
+/**
+ * cpumask_random - get random cpu in *src.
+ * @src: cpumask pointer
+ *
+ * Return: random set bit, or >= nr_cpu_ids if @src is empty.
+ */
+static __always_inline
+unsigned int cpumask_random(const struct cpumask *src)
+{
+	return find_random_bit(cpumask_bits(src), nr_cpu_ids);
+}
+
 /**
  * for_each_cpu - iterate over every cpu in a mask
  * @cpu: the (optionally unsigned) integer iterator
-- 
2.43.0

