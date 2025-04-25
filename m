Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A7238D2B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569067; cv=none; b=j3+cmBUSRWwFJDJMRfwscBgRg32VYbtG8HoaFmnd/pQvmTQ4So/zMz4n6Jvhb/X4FIeUpyHL0CQahjrHaKSl/sE9sWyJipvnWqB3OREXynl+AJb48rWwE4zC5Dkjc5hySfohopLt902ExfIfPV92LXvgxycqEDA1uYE3uRXXY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569067; c=relaxed/simple;
	bh=UTdvk4e9mPj5bjUj9xrQ9gt4nmgB758NPYuFXNV2/LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLyOSV0EmjGOL8bvccNnmGXsHgY6OcPA/FQFCMlO44F2UMG/O9wqKgjtrJdl8y1uXlkdbiIOAcF8NgmHODwad/OvH5z67XUFtN51JFPub+KD37ws0ADCqRV4vJL0d+Q6H4ZGm+471Byru1Fj+OJRiXhFoGZTvnngEloYMSXuLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dwG8RBFE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwG8RBFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zl4AHm9mXbjqorzBNgFLxI0voD1/7+bTcOR/2Fa4AA=;
	b=dwG8RBFETNyK6JwHDO2k5UKLlZxaiRHM5Tb6f7grtXsvtWrZ4opmLqgvzUYcxDg+jirPRt
	yOxBafoTzmCcIZsNQm5Os39FHw7gefmYIai9EsXhTQu2YbfpES3bH6reTQTmW0LM/xmWKI
	gv5eHVmzCzcXOJUNuLDoBU573JWRFY8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-LCvpcZJoMJu7hwXP9rTwVA-1; Fri, 25 Apr 2025 04:17:42 -0400
X-MC-Unique: LCvpcZJoMJu7hwXP9rTwVA-1
X-Mimecast-MFC-AGG-ID: LCvpcZJoMJu7hwXP9rTwVA_1745569062
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3913b2d355fso641337f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569061; x=1746173861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zl4AHm9mXbjqorzBNgFLxI0voD1/7+bTcOR/2Fa4AA=;
        b=q8O97DRQfWuTefpluC23MfEXQ+lfkET2QLLquoxa7fDrcUwpQhWOLFf4w2P7LF3qer
         w+DCvv9pVJZCexG3xP101M/8SScQH0ISEzor3XbBIPHJyB+W1wj/ukX1B03blUHsalx1
         XE74TkdG59QYTCpTiqH8XxEXmfBwxvpiJW3ygSTKzK1a820BO9/oHpnKJPGpElMoXaI3
         cHaWb4Z5x9FJMQZtFmVPOV7q3j5wJouz9liDr26krm7WQBUkVs1O3FcNPqLyk4eBKSZO
         MA8PT/qCZyWnqUvzDTw7aDXwRZ+EUNllKsm7fLijlDQeKn+FGKaC3KmrUuYsaRW8bewW
         0yug==
X-Gm-Message-State: AOJu0Yz7901DsdX5prNvMPO2vIwTo5CeKyLLxP19qF7t4Dm2Odeh81DY
	cDqyAztfvJ2MwXhtuA9MCtAokpxeeh+ELBo8I75mFvTcvGdQwYH7q5kSxfnFDTG9e2lWUPQbWY5
	oRqOtkHnoPcIlTtvso8mKUOUDHVsZCpmoZN0GHG4uODz5n/fpPFM1Zi3JTSbgrK+bJOAO8cr38u
	ndP0Yrhmh5UF7qsajJEBvNK7hOT/PCXcA5/+DWtNcGvA==
X-Gm-Gg: ASbGncvv8KWkzxaDiJLEfJY0sM/t7hfCbHNVi1mr/cp+tjMWf7adUCEQQkstSTASdDx
	nMojTqAHE1mGzhvS7xP4w5CPObrAHfB5D5eSpvB9g+4TL2Ag+VLE+IWm1wNV7y14tw7JGyLSaf5
	Atx3O6RRXzdvxNAGUiVI2CIZR//+chpNID1CVYgzhPimPv+qdiN9+mvBcWH6tZafMr13qP6VGZZ
	DdTTmBhEl4SxnyRWs2Mh8KHmpeViO7iXwio1amUjFLY/vY0ITFCbwKFIoNCBRBELPrV5OWDJldy
	eHmT3YQu2eIBJZGJEvfYHkfMpRug/yGFYrYt+2ygjxiMlmhOGnGm4H6fDd9ALzxSGP04S98=
X-Received: by 2002:a05:6000:4028:b0:391:2ab1:d4b8 with SMTP id ffacd0b85a97d-3a074e0efd6mr859070f8f.1.1745569061594;
        Fri, 25 Apr 2025 01:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6cbIXolQS+v1W8kKfDd2qap93n7uHX4eGz19p8/zV2hhP2TLcyzd7t5uofpqhlq66/UdpGw==
X-Received: by 2002:a05:6000:4028:b0:391:2ab1:d4b8 with SMTP id ffacd0b85a97d-3a074e0efd6mr859013f8f.1.1745569061032;
        Fri, 25 Apr 2025 01:17:41 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cc4153sm1649210f8f.57.2025.04.25.01.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:40 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 10/11] drm/i915: track_pfn() -> "pfnmap tracking"
Date: Fri, 25 Apr 2025 10:17:14 +0200
Message-ID: <20250425081715.1341199-11-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/i915/i915_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 76e2801619f09..c33bd3d830699 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	r.mm = vma->vm_mm;
 	r.pfn = pfn;
 	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
@@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
 	};
 	int err;
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
 	while (offset >= r.sgt.max >> PAGE_SHIFT) {
-- 
2.49.0

