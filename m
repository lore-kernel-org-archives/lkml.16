Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0C1E0DDC
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235504; cv=none; b=QSNERTs2+rHVquSLD2D8786H1BMBDaRahgYdRZYqC+jdCupKKDM/CvauIeBAOVu8zIRqDRbGUBW17ZcJv2nByxH7NWqWT1ZDGZMiixIMIWc0bglCUUAlqJzFSwIvs0Gfb41bpb+eeRmqb1lPbu/6AgULvIO17w4heYaq5FSE1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235504; c=relaxed/simple;
	bh=Ej/13Gy59hq4pSeuXyYtdu8JOFvxFaLu/EaPO8MCcTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7dda+0v8PjdjQj+bMsli9L/niBMTWf4vFXecyQ6EVGOHIXKp6OEKMmQh+D0yTX5Cnr06tFTRMXHThuECIxV6Jvv5V8MwcNwHBhPujjIwtApG/YzbTQ8EL/kbp7JZDOwwSYR1OqT0RMnq+9tBxCHnmvoYhr1r8TU7nmzQMNWruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b3dvqlFu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b3dvqlFu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so744391a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235502; x=1738840302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g614UtqxTvOkBYeQdwAP9Uo/j0Alc44lQaUMvbAkkk=;
        b=b3dvqlFunxfbNMT/FwIBwAptXBp9qLgF4DjTYeDLl2ckmrgxFgIHO9BMWTDF9G4DAU
         Emj4dc/QwanfssbgT/64F7RqGsU1BNjhLJQlGoQ8k68in8D6PUvIwGS3Mmjh0C5uYSU7
         JsHjkxzeqYT8h29PSVmjd1opBEAsPfA+UaN0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235502; x=1738840302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g614UtqxTvOkBYeQdwAP9Uo/j0Alc44lQaUMvbAkkk=;
        b=gpGBy79LQB06FSR5sysuLXXCv8nFzZsl2s1XmKxORoRAI04gqw+C/iGowzi2cZSJY3
         lswOQ2qlkW+FRp05w1zVhEb9G/a+eMCNvdUUVn/3QEcweTB4Kn6czuiF7UZRleDgnVdy
         a62sJHHY25eG4RW+p+8HRpPNUwFAfFRAjIhpf/jhRArNfxqxkEgri6rjPcIzbD6mLstz
         VBUxo8i+BWjm7EaMgYkMjwYUIHbfjW6smL+3MY6oHcX30qnIbker4XufyGwT/pBL/cgW
         TmIOBDCEVzVhxggrPaBvIVy2FGKQnue5xafe8yzG8Ag/vV9fOtR7BJ0yuA2WDWx5RAwl
         8bDw==
X-Forwarded-Encrypted: i=1; AJvYcCVfqljqMUccADmVrEIL5Elgq2euVVfJnJopEEQT5zSBlWU4Sb3MxEHyKEwZasADqixCACa3QCPBNCSqlho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAqcbM5C5tzhhGDF2l4vrbKw0NO2tcyHn5bbNbg3yY0D8HyU7
	LXsUksUGZ2hBmcbLMvs39KqCZAtbGbUp8PnE50oW9Bz+1SBAhqihw9U/ykO8Lshpw8nGmh1puwk
	=
X-Gm-Gg: ASbGncvqxvcunEZpczf8Qv1yC3A7+r4knZ47wMshIbGHnNDlylOy8V3PN1myKLdP8ud
	s1s3ZFbXF3O/+rQQ46LjQeZIyXn38g38txxzmUVkwY9oB3Kw9Gc6AQomhGhDq8al15Gj9ClcGm7
	c8aLGz4nCS11kxqzkxuDJCLpJgtV66UM7rv59awsdlPymmSQU6EeGJBcXjD+ULCr6gPloel0MXT
	0Qn8H+OfD8iwvmmS4qVxvx6pDRGX8v4l/MIhiRCTctS90AnwJt0hvJ4AZpdO4QHi9HS5dZRg2yw
	wDk0MlgIEyG1ShMH
X-Google-Smtp-Source: AGHT+IHg3heFJ21F+Ok092BsmeTSf/u5V4ef9+jPuKs0cnRlT5yUCtdKYPEIddDVnItYsVqEn0xRFg==
X-Received: by 2002:a17:90b:4d06:b0:2f4:49d8:e6f6 with SMTP id 98e67ed59e1d1-2f83aba9d34mr9404404a91.3.1738235502347;
        Thu, 30 Jan 2025 03:11:42 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f848acbda4sm1333892a91.45.2025.01.30.03.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:42 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 06/11] zram: permit reclaim in zstd custom allocator
Date: Thu, 30 Jan 2025 20:10:51 +0900
Message-ID: <20250130111105.2861324-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
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
2.48.1.262.g85cc9f2d1e-goog

