Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49E430E85D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357597; cv=none; b=b7mFvVA1q64EiRy+SD0vEnUWet3cne2iO6fsp1tn9QUcZh62H47GMrJya23hGHIoAsUJZKirT/oCeHn3kGphWxTkS8MQ+NizsMHMNXwDBUosCMAH8IREHcmaXa1FgcvkBr9KO8th22r9mvqTr5Nt0XfnY6zImC054EXyuwmHiq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357597; c=relaxed/simple;
	bh=WKZqq2YEuAVNJBHG19OIJ1BG7TY/8FPSe5eCYcffo/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPsW+Tvax7+mypBqIdPLPzmW/jliyeOWN0+8NpBH/XgCjO2+wNq4oepcNpxvVM598hCROAjHWm/ihstbzjzGSj8eZMUuV+scaXnIuloFSpWGCcX4CBrwaM/RorX4Yq1vmOKukimmgERXyyR62kS30lfi1gLf19tEZdqaFmz/Yww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8U/qboc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8U/qboc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-237311f5a54so10212045ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750357595; x=1750962395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giWfCtGbWEqU63iGbzpmokmH0FMbVzty9wx804zxVgU=;
        b=Z8U/qboc8Yoop1QXmx5rwAB0ln9huw9595ahn85+drmt5BlRLGMRaPQUOplvrNZcr9
         L1h6zSX5kAgoZQWYwD5aq2jyPHfK15BWSyEVTGbZ6BebVvXBCPzsBbuNM55kmbeK5oRq
         IZJHbfWiX/XIGgJNHd3whLEIwas018tHEgk7+iPIGjrgWbfGGoR6WZbrv8AVr5urYt+a
         M/4K8e+WLUyoJ+TL6rXGDE+cyEMxz0HCYgk5Y4u8hu1jpk/jcShpj5dbEIuPb1EQhU+H
         UriQuo6Q4jGyEACQeA/RdF8LsuO6HD6YHF4tqB1MaqNe6GOIP/88/cAMpgmZqjpKeEZb
         llfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750357595; x=1750962395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giWfCtGbWEqU63iGbzpmokmH0FMbVzty9wx804zxVgU=;
        b=cDyFANagMSRDDc6GSMht09xFfgkuu7u8WdR2FpKhjhdmifCwwQA30rz52KJ3NBqXd1
         UOKpHZGpYPXq0BDXNHYwdVc83uClkt922GLiKPkORS0RsqARIbI7hktmnHdhmFzUszhv
         pG1vjOOGybzw2tR8qAk0XUJHp7WLiqi2DFV9jOEQPuaMVWjPT6q6cuZZ2qYm7ie6m5s4
         w0/KjPY9wSXV7PD9wVDH7uOYT5qMDxYtjlWN+gNNWvK7snz70IRaapwCaydov+HtZeI8
         YadMn7n0kDTU6Q+Ou63nsAnk8DM3T2NZqvhixOtAQ8fXJ3dm/HgTDEvoc1WfhLAQMH62
         Vxzw==
X-Gm-Message-State: AOJu0YwyLYFAHMs8sOwVd0rIoiSCtIVgR/oZw+YsdL/NAL9JOVHPqRIS
	ZS2Aam6u8xrXVZQoohVwZxkX+ZHo3ugVojLhLTN2vxj2UheqGEP2Wfv9NvtwAA==
X-Gm-Gg: ASbGncsWZc/s/pE5NuqbvPf1AhpxgtAhRLoSpMws1m5Q31V99TLfASfCSWCtWKp6T1L
	HfvbTBdcMAxErxo0LtShRNAjkXN/qCWjyRK5daObC002bTzoUFD7eKYT3lhjsYL6SHVlIzTpAfx
	Yg1ITThAvgFapLBT/PDOS9kIzRPX9qwQVKOjQs0N1m0zDpqUeUIrYvLhLVO2EdT77Ve76ZOSKxc
	Z8D5dMSXlIQe6SJE6eO4onkRt8KVjPq/BFZxrSUi435jDJDUSE8u9aRlzuBm0PgDt5sPYPGEJke
	vGCUAtUyYfJFic0hCl7O1ZTZiaxN19uW1gb1kjMPcbLaH6hc51LTLaiTxVvZkA==
X-Google-Smtp-Source: AGHT+IFc7OLPaeXXtt3LZYCPYJM1rvPIt9YIOPx4nv7Z7rQm6DdZi/3FQkiBhmTha8cvxFjj1wf59A==
X-Received: by 2002:a17:90b:3c4f:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-3159d62ac81mr397309a91.2.1750357595011;
        Thu, 19 Jun 2025 11:26:35 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df846fdsm22075a91.20.2025.06.19.11.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:26:34 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 2/3] cpumask: introduce cpumask_random()
Date: Thu, 19 Jun 2025 14:26:24 -0400
Message-ID: <20250619182626.393541-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619182626.393541-1-yury.norov@gmail.com>
References: <20250619182626.393541-1-yury.norov@gmail.com>
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

