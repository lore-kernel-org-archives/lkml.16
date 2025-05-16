Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1110776410
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402840; cv=none; b=Sp2TVjkLLcdDTdaUqLVZxmWLM5ZU19Qi2Ccf/IHGm0OmuBCUutheb5LTHzaTNaClhGC7Ygcq6xqoD9xcRzzoGkNHoVnffFAnS4sDLwPWZS9sGjBNGWQmp8Iq29MptitDhXzfQAETybCHE4U1YLpPXcZcE6CVrF+mJKLNqwQVSlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402840; c=relaxed/simple;
	bh=jW2FQ7nR3yq5w2QPtsWE3vTL5Z5sb0QhuRmmVZzGC8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZWsH8RGPRVFvnB/x5fPNJhNw23kluHHdN2+kG32U10vO/2zbkvyuzaqU8CdzedjLKWj5wdJlObEpYjczNwriO5hq3dKQccdh62w3khhFoomKuKH7xGWZEzXcDViqoc2//zY4/K3uRyGo7LRB8fRnR1TVejFATBsoaIYhAnlAsFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZOm98nBs; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZOm98nBs"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso12202875e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402836; x=1748007636; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pTgve1xWELrcXmzWf6SXpdMIqoD+DsmzRfBMgyMmWFg=;
        b=ZOm98nBsY3qZlhFlc7IAvKR+wifU3V5GBiiXKLJVfJ3R/KGcEgZ+KVP7L0gZjpVxCY
         cW6qr//FWj+zFgEXTNlANcvUA0j9j9ByzgAMK3NYh9w39p6e49UUiS67vLIwxRARDaZ0
         bf9mM0EKfCfr/rr+JyxXMoxegt/+aMudrq1L6EqSiq82WFwnPvdpqgE0VgyjkrbGXd35
         OdLsparZsL5qOtDTg2nbuAlgp2iIPxp0DFkK1B33RZr8ckJMVGkZ0IFT6HK/gkifpk1S
         2eDMrDFuTeW6atE2AJebiVGxWo+mVtMWBXDLPYnN1DTCfV+9i6LL7kKWdDqjPMy42Jn4
         q+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402836; x=1748007636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTgve1xWELrcXmzWf6SXpdMIqoD+DsmzRfBMgyMmWFg=;
        b=l/izAe2HCDaNny/S6m/PUsPTYAFHcZWRxEGMWSy7aF5Tmqp5K3LRPaqjUa0uWVXwlx
         YDgsfJ8gAsPIGIn4KzKqov9LwLKDmx+5efnzuGCXgZIcathjF9S+KLx9bSBrH8umCZNV
         4KJ+B3gPJicplYZsq9Cdrbj8sPqaggNOOueDNHk0O3rZ6gKAUakJVbpnh0O7f8tCIufv
         NNxujQiQNiMSaEZ3OgYXwzYmnW6HBzxcFqTUQQcUPuFuAT0Th6pU9BZHH+TH32kltDa8
         vTBEUZNVMhHJliasVCWgcAOdIJo7J/0qoOqrykLH812TJadoXUNjV9FjhKxs8zb5UI2Y
         y60w==
X-Forwarded-Encrypted: i=1; AJvYcCWEk/KCKhpRgZJVvGXU6GunlsznNgiJJhTr1ni/PPLSfnwMtxRvx/Lfm0RPhQsrvwH0vJHp67RwH3ZK4jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBWOLjBSx90Tye+FeethgJN7NHazdxYp6ZtNuP5tHFq17+dVG
	J2eYqcieTXJFPQLRYnyTdotoMI6bwADFafdRxKS6JUYW15NMEnonjVcB1x6MLqj86kYppudQ2dP
	+0b7Yu284bGIoplY6kszEig==
X-Google-Smtp-Source: AGHT+IFL0LVuDvqNNVcVOoiBdDx5TazIXVwWBCNVMeYAJMsyUHLfmYM0SukSyOsyeQgmX+rhBkYVWkj0+YJRRVQg
X-Received: from wmbfl14.prod.google.com ([2002:a05:600c:b8e:b0:43d:4ba5:b5d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:609a:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-442fd6785acmr28243685e9.28.1747402836485;
 Fri, 16 May 2025 06:40:36 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:07 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-2-vdonnefort@google.com>
Subject: [PATCH v5 01/25] ring-buffer: Add page statistics to the meta-page
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add two fields pages_touched and pages_lost to the ring-buffer
meta-page. Those fields are useful to get the number of used pages in
the ring-buffer.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/uapi/linux/trace_mmap.h b/include/uapi/linux/trace_mmap.h
index c102ef35d11e..e8185889a1c8 100644
--- a/include/uapi/linux/trace_mmap.h
+++ b/include/uapi/linux/trace_mmap.h
@@ -17,8 +17,8 @@
  * @entries:		Number of entries in the ring-buffer.
  * @overrun:		Number of entries lost in the ring-buffer.
  * @read:		Number of entries that have been read.
- * @Reserved1:		Internal use only.
- * @Reserved2:		Internal use only.
+ * @pages_lost:		Number of pages overwritten by the writer.
+ * @pages_touched:	Number of pages written by the writer.
  */
 struct trace_buffer_meta {
 	__u32		meta_page_size;
@@ -39,8 +39,8 @@ struct trace_buffer_meta {
 	__u64	overrun;
 	__u64	read;
 
-	__u64	Reserved1;
-	__u64	Reserved2;
+	__u64	pages_lost;
+	__u64	pages_touched;
 };
 
 #define TRACE_MMAP_IOCTL_GET_READER		_IO('R', 0x20)
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 3f9bf562beea..06214588c05a 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6016,6 +6016,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.49.0.1101.gccaa498523-goog

