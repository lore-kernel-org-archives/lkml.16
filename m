Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981191A4F22
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314451; cv=none; b=ZIBfzR9lXFO1Az7Vf1VBdUgNU7fkL4ajuxnB1N9INmtIkX9hsM1i3MFfRfZkswPC2EKdUzK9ReqOYmSzbN7vCDBJ75jMpApyU/gBV37j4O8x17sMuyE3hyPhm/YxcfVFO+mrWbeKo3oV/f6guPp7t9/lS8cOwPSTPZYtSBo4eIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314451; c=relaxed/simple;
	bh=PxF4UB7sFqCoWDXL7GdQZVe6pIKAQICwHDrxpS/XzVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E02RfpQgjSewVC0s+gf4RyhjESbunehbprl2N3mmXuxkVe68GOvqUB0hZIi2sELtSfX3f1HMZLf4nUiaSppSzqvay5VkahUSny5uikP5o/2piYUXO9Twk4zRTn2MXODfcTbWw3eegzZRyfpB5TO19wGQM+ntOL9kosNZfAO3DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Paj7LqZA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Paj7LqZA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21644aca3a0so39626225ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314449; x=1738919249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loywN5MAU0/S7v3h/0kjXpkRnG0c8JJBzlP3UvQhSOM=;
        b=Paj7LqZA4/s8royIhodXUoUAOEd1pieLjaNCmkUnjU3kNwkVagdgWDFW10rrz80fOG
         c1jCgYdm7lrfzPMFcrFyZzBhyVyprquMQkTmjk7goz3OwsVY4S/BFxOq+Gm0C/Wnwdtk
         6DgJLTvI6yfEFyEkGQ8OO3a395h3pgNPL9m8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314449; x=1738919249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loywN5MAU0/S7v3h/0kjXpkRnG0c8JJBzlP3UvQhSOM=;
        b=jce/v9NNVm4q6QQtTnxslmCp37rIQNF7Vr2QPivjkzhwStuolA9Dov9LAsXvJze1/n
         wU8u7+01f9RcwPcjDAFAigKawj+5mx6HFDH+Fp7+nDR25ewybnjU2afZoG/ECgX2MdHL
         e+mB2H1MmwzPXE/gBjkzJZhbr/ZDC6H1WBHgNOstYs9wPVnsDXj/3PJweROydHlM4XFq
         uZCOcj1jO/cw9YWrt7aFA0DLgAMyVsSpCYeOifEyFIBUkdepvtMQq/Bhf/sjw20NSbiS
         FcmGCB2pYKuKdCfssH2rxj3+HwsJGSrs//F5N1ydEOBALGHssronKEmkmHFnnvEBEMQO
         skDw==
X-Forwarded-Encrypted: i=1; AJvYcCV4NdfgNOiePozmoFoEvf5IS87+O26EqS52XNZ0/Hpjux+IJBworRyanCBrba/aBoMY6q1hFI+jEcMeqrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Ibk7J66uP68RPYlHv0QAEYMHK9ZlRdmAkfinECmn6BE830oa
	4xwGtiXlNmVUjHk5rrDglD9pIkW5xw9I9rMfpTEFU4QmNSiVeAoaMSRc5w6Feg==
X-Gm-Gg: ASbGncsMJZTOY7pEuEs3kXOPrsY+EUwHyVqRHi9cEYHUVrI0eAsu+eutLgVyjd0dAMf
	m999v5pZ1gKsz+fwZH+PWyChJVqu7t9+bA8NUj5rjOsw+DMHhRc/f43FFb+bnXRzi9ngC0Zikw6
	6BO21YpHG+TcGEyeTzFOu7bzINXA26UzgRBv1isY52x6UByKp7p2kFVq7mCL/baisCSpF/1VJCV
	/S3djJs6fDsrwKDPF4G7xNYTpyGjhzHFV5qzmnKA2npDQrTkhVYW024iuxKT+O0GEpdXJvq0jqN
	yIqjAaKl7LQy6Do0UQ==
X-Google-Smtp-Source: AGHT+IF+0FKD5xX6XHXYkP+petrD53hSmc7lcGie6WBqsrwN7A64ICQ6XETnp7Q7BlhjDUtZHY0kTg==
X-Received: by 2002:a17:902:cf0a:b0:215:a80b:f6f9 with SMTP id d9443c01a7336-21dd7c449ffmr131180925ad.8.1738314449146;
        Fri, 31 Jan 2025 01:07:29 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f83bcd0d9csm5896824a91.14.2025.01.31.01.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:28 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 06/17] zram: permit reclaim in zstd custom allocator
Date: Fri, 31 Jan 2025 18:06:05 +0900
Message-ID: <20250131090658.3386285-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When configured with pre-trained compression/decompression
dictionary support, zstd requires custom memory allocator,
which it calls internally from compression()/decompression()
routines.  This was a tad problematic, because that would
mean allocation from atomic context (either under entry
spin-lock, or per-CPU local-lock or both).  Now, with
non-atomic zram write(), those limitations are relaxed and
we can allow direct and indirect reclaim during allocations.

The tricky part is zram read() path, which is still atomic in
one particular case (read_compressed_page()), due to zsmalloc
handling of object mapping.  However, in zram in order to read()
something one has to write() it first, and write() is when zstd
allocates required internal state memory, and write() path is
non-atomic.  Because of this write() allocation, in theory, zstd
should not call its allocator from the atomic read() path.  Keep
the non-preemptible branch, just in case if zstd allocates memory
from read(), but WARN_ON_ONCE() if it happens.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 1184c0036f44..53431251ea62 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -24,19 +24,14 @@ struct zstd_params {
 /*
  * For C/D dictionaries we need to provide zstd with zstd_custom_mem,
  * which zstd uses internally to allocate/free memory when needed.
- *
- * This means that allocator.customAlloc() can be called from zcomp_compress()
- * under local-lock (per-CPU compression stream), in which case we must use
- * GFP_ATOMIC.
- *
- * Another complication here is that we can be configured as a swap device.
  */
 static void *zstd_custom_alloc(void *opaque, size_t size)
 {
-	if (!preemptible())
+	/* Technically this should not happen */
+	if (WARN_ON_ONCE(!preemptible()))
 		return kvzalloc(size, GFP_ATOMIC);
 
-	return kvzalloc(size, __GFP_KSWAPD_RECLAIM | __GFP_NOWARN);
+	return kvzalloc(size, GFP_NOIO | __GFP_NOWARN);
 }
 
 static void zstd_custom_free(void *opaque, void *address)
-- 
2.48.1.362.g079036d154-goog

