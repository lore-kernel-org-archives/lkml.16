Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D51E3DF2
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411945; cv=none; b=oeRaK6/yrTe42iGkzIn5+6T8E8lIW0qZuCffaE4F/X+HwuLxY24kzAKoCQ672z6uoDjRSD5THvqczygm/nebGaDIV4PwgApEz8P7FCftU/HXXTqqaogvHIQvXpNtX3MzDh1aveF4RH/RUQbcbDX2xwHqm/cBkIVE+f6XW89wyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411945; c=relaxed/simple;
	bh=WKZqq2YEuAVNJBHG19OIJ1BG7TY/8FPSe5eCYcffo/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8MbTT+J/Z6JvNTSMeW85Dxdiw18dRizoMQzxgWIyrVXcTAhTXDDKjPZXdALNVvfvB/1owDqLSrCA0SajFXpxEqgRgkkMFVomVFFX8lf/+dLFf+vKCNi74o1vYPPQS0Ir+ObkQX55W4KecaZEYpdC8rCrAxJktM92dwWmVBknwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebG/nYK2; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebG/nYK2"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso3261294276.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749411942; x=1750016742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giWfCtGbWEqU63iGbzpmokmH0FMbVzty9wx804zxVgU=;
        b=ebG/nYK2+q8Id2ds3KNCoEdoQ6xa3zWyM2luyX6QQ/9Q41UlE/CGrf867ks1WFd1sg
         Cr1cdUcc77zrlxnd9SGKISyiscUlqKeku4uwYgGrQr2XpCmQcWsGBikiGCuezLcCIjCZ
         Q/3uxfHkmAaI31xg19kwyNEu4JuKQyjy4+XnKZfVr0fH/P3Bp5CUBxAIDzjh2bL6VDr1
         t6W8DBtUg2/7Ip/wkIkyNUSsJfYPFmVVq4djhHqsSu/9xp+ZCPohj+OzK8u/BQjk6/8I
         A1nmTIlNWMm2wbadcyt34T2AtjRO1uyXf98a4g6pHwpjLJM3j1YXp0JbQjYHo6393XEY
         2CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749411942; x=1750016742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giWfCtGbWEqU63iGbzpmokmH0FMbVzty9wx804zxVgU=;
        b=nM4XxngkL2NgkZIrxvV0g+LXCvsdweyfq+GDaJuz/Am5MtPvBJsGMM1x+c9yOBpZYM
         lLIZgttnDqQuYWG/S9IoM6ku805uaqbLyBB6hrcUXWyoFaGjYYA9CqbexHPiRSkQbpC9
         VGWVboO59GPeef+0hrnvukK0DKLX/PFFSl6vgEhI26PW6HoFlspuSmYztDdavOA5HrqH
         ceNzGE2QPuHNKH5LIiOioj/6yLih1mz0dimLNCLM+OK/1IVsapSSQvG5AFj9nHcXAj57
         uqO/0ordzEkEny8FmhJjScV/OSaiOJDlNT33ITVNi4iSsiLM6NjHl7FLYkdaoikmgqiB
         /bKg==
X-Gm-Message-State: AOJu0YzMzXPJr2MS2sjSCxKECv5UWlhGkOTUS67k67FVk/afJEbO7iY5
	jO3egAJFSTq5/L9eWXjJEQ1nGEMWFIyKw9jhuoUe2AZft03kNFnge23XysVD6g==
X-Gm-Gg: ASbGncvrSILh0U8Xoa766EruZ+JjcPslk6wj+a2IpmLw4hIRtiqsueM9Md/6SOcXNBh
	CipDW3ynJk38nAm5F3tYvDDGqPeHIR8a4xJHmrWwY7fFdYYgoBt1jpMGKsnzXdxW/u3Ff1Mf5ON
	O8jCzfOzIi6kt3rXvNuDUcy0Y4wh2kj3tSSeXdXSaYF/7ySVRhj8+v1sIhV5e7Hi0g/oK3kO2l3
	TGXnyD5slF0LF+MpOpg4KdGf1ZhZ8yK8/dO1JQ3PWgNHF7Y/rFuyh1d5zYyx45wy5ASRDxLU8Nq
	q1EFIMCcne4u37T8Uv0DO9CB67VcRoH/QPNkBJSJsexR3Dvqw4MBm3uq84t8o/LkYpTV5asp1Tw
	khhkfaY7nGrj7u4m+crbVSvxYNqIhPzVZ
X-Google-Smtp-Source: AGHT+IHlM3AMPnX1fi9ta4SGXd0hM+FTgie1jPdQ44wmf02Z4hAxdW1CZXUtAAQhLR5B5VMxM7x5bw==
X-Received: by 2002:a05:6902:1249:b0:e81:db12:7950 with SMTP id 3f1490d57ef6-e81db127a0amr2535722276.30.1749411942442;
        Sun, 08 Jun 2025 12:45:42 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a400cc8csm1805622276.6.2025.06.08.12.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:45:41 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] cpumask: introduce cpumask_random()
Date: Sun,  8 Jun 2025 15:45:34 -0400
Message-ID: <20250608194536.28130-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608194536.28130-1-yury.norov@gmail.com>
References: <20250608194536.28130-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

Propagate find_random_bit() to cpumask API.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 7ae80a7ca81e..39b71b662da3 100644
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

