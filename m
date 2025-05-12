Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374129375D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053292; cv=none; b=fq3fvX9PJ0hhms5P/CLWibPBoDe3Lf///lGa779aVFJDjK/hml/PKISyALQPxocysPlezv9bFk0INsz4TgSJXJztD+MnYMvxAApbYRmPezwpam/N3js1mXglCzhk+BeJ9gCJ3fuauigD34M6X+PdhFTLuq6ojHyXNiKZRLD9Y5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053292; c=relaxed/simple;
	bh=3khWjqFjWFC9CiGQiESB8aVTX3LwH0n7i9MwUmwd6T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtkUom86xObgEYKp7wsO4jk/7LkGmRgVMqXCOopMdV8dlESJYdaMUvx6imI1EzXSJdDHg4ro1GuO2yPVbAxD/AQO/7wTWT/86AsBpWpCGrmhMmyxCYHecWtbNT6di+3CBwKEojtklLNyMKHh0AS288PJfvmUzzvKHn79gk2AJJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cn5as17M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cn5as17M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLXTuxdzeoCOS7HE06BqHxnwP6g0cDhZW8Z+d4gkxmw=;
	b=cn5as17MHOw8zgBvIYF8YjBDCnkRTLxP7LyLXLAooY8YUsRBmaD3Tqahj+lGQRPwsqacwo
	Z5ahnDYJuUel1FsB+sY54PAOXgPyRSj0UX15jaob+tpUar8o+OSkJ/D11tjw4xDqDArwsv
	woVJMz/61U3azVNd4mM9T7JNO1gWE7s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-rfto4gSoOJWK8Z8CJ1komA-1; Mon, 12 May 2025 08:34:48 -0400
X-MC-Unique: rfto4gSoOJWK8Z8CJ1komA-1
X-Mimecast-MFC-AGG-ID: rfto4gSoOJWK8Z8CJ1komA_1747053287
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0b7120290so1943039f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053287; x=1747658087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLXTuxdzeoCOS7HE06BqHxnwP6g0cDhZW8Z+d4gkxmw=;
        b=sSAl4bS5fHAti3SIALb/dsNUWb/Tr7T4jp8QLv/1fFBlA6kw+26JXj5eLnuu2MD7DT
         czt2hZvEZkSY+DBRAmry4/QRfNJMf2hX01NKJy5PVAiUqwZdlilESnAApTlhKPeC88iI
         3S2dWjR2+5Oa01ffYas6bSOpguoVM6JdgxzWoA+qLfbIIec0vNZeF1e8jWBdbgYb1qaT
         NEo39G7X9087A/8c4yEUlVXsqymYJWgl4FyvC6YVyBskQEgq9zvJc9uJzOGKpTs6vqJa
         H+jjaHwoZ829M5fLxTyhmJqfTysF7Hjs9UGPgSxY2xrOVt+eUXZIIvH5gYeBGypGCv6G
         Qmuw==
X-Gm-Message-State: AOJu0YwokRrUbJyoUq2fMW+Hcnw9P5etOvz6aqzj1RnJigV7HZNxBOWL
	z0HhhVfTll3mPR21cmR/WgW62+8l8JBfi6QBbO+UcEsvY8EI4MF+yC8/Ab9cXMHwUz7zKQ/pfu2
	1BXHQ2khO5wGIZ9ujQGCZoegkjNz08AgKL19vsWJ623TUWozmxjnvjPyTRmprdS+XNUQr4YwhEk
	TitDL8ECY5g47XJY97//7YznGdaYRHCVdCzVuLYzubSwF2
X-Gm-Gg: ASbGncsxCRfQJ8fWg91W1AI2VjP1ZeihgDkPC9+3t8rjIG/NNDDyq/96VDzfYrS+zhg
	jNkr3oyPJfiGeIxLAmcJlqdx3PxW1c3WBFh4d3CZ9oQMl61n3Cm5Agj/z+ndJa49ih+0PKxbqJn
	/R1/UKGRGXth65NGMgA9shfHjpRhb4vuW17ORtBq9qI6i6Cjf7Pinhs8MxYcQRBxkSuB4ssOHO2
	gr1ggQdG8E5kwJ4Y9qCD+rcOJOvlYQmB/BJ+l2XIhPRbgJAheqcvLADUg6W8hLpP5befL3DDOf4
	PxMBnIeic3Fo4CKAmln4y/5fx2ZOdd+AftmUw/pIvvZ6tg2oerPhfjhcP05f5gNcdU6HVhMI
X-Received: by 2002:a5d:5f56:0:b0:39e:dce8:1c07 with SMTP id ffacd0b85a97d-3a1f64a43a5mr11025606f8f.46.1747053287290;
        Mon, 12 May 2025 05:34:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXC2JTlHqMNEkDQGwHpsMemWHOSr9CrtHgYnjEcClwN7Gy0FNgR8cW6E5jpqWqORj+so6DMQ==
X-Received: by 2002:a5d:5f56:0:b0:39e:dce8:1c07 with SMTP id ffacd0b85a97d-3a1f64a43a5mr11025549f8f.46.1747053286815;
        Mon, 12 May 2025 05:34:46 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58ebd43sm12647639f8f.37.2025.05.12.05.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:46 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 08/11] x86/mm/pat: remove MEMTYPE_*_MATCH
Date: Mon, 12 May 2025 14:34:21 +0200
Message-ID: <20250512123424.637989-9-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "memramp() shrinking" scenario no longer applies, so let's remove
that now-unnecessary handling.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype_interval.c | 44 ++++--------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index 645613d59942a..9d03f0dbc4715 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -49,26 +49,15 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
 
 static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
 
-enum {
-	MEMTYPE_EXACT_MATCH	= 0,
-	MEMTYPE_END_MATCH	= 1
-};
-
-static struct memtype *memtype_match(u64 start, u64 end, int match_type)
+static struct memtype *memtype_match(u64 start, u64 end)
 {
 	struct memtype *entry_match;
 
 	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
 
 	while (entry_match != NULL && entry_match->start < end) {
-		if ((match_type == MEMTYPE_EXACT_MATCH) &&
-		    (entry_match->start == start) && (entry_match->end == end))
-			return entry_match;
-
-		if ((match_type == MEMTYPE_END_MATCH) &&
-		    (entry_match->start < start) && (entry_match->end == end))
+		if (entry_match->start == start && entry_match->end == end)
 			return entry_match;
-
 		entry_match = interval_iter_next(entry_match, start, end-1);
 	}
 
@@ -132,32 +121,11 @@ struct memtype *memtype_erase(u64 start, u64 end)
 {
 	struct memtype *entry_old;
 
-	/*
-	 * Since the memtype_rbroot tree allows overlapping ranges,
-	 * memtype_erase() checks with EXACT_MATCH first, i.e. free
-	 * a whole node for the munmap case.  If no such entry is found,
-	 * it then checks with END_MATCH, i.e. shrink the size of a node
-	 * from the end for the mremap case.
-	 */
-	entry_old = memtype_match(start, end, MEMTYPE_EXACT_MATCH);
-	if (!entry_old) {
-		entry_old = memtype_match(start, end, MEMTYPE_END_MATCH);
-		if (!entry_old)
-			return ERR_PTR(-EINVAL);
-	}
-
-	if (entry_old->start == start) {
-		/* munmap: erase this node */
-		interval_remove(entry_old, &memtype_rbroot);
-	} else {
-		/* mremap: update the end value of this node */
-		interval_remove(entry_old, &memtype_rbroot);
-		entry_old->end = start;
-		interval_insert(entry_old, &memtype_rbroot);
-
-		return NULL;
-	}
+	entry_old = memtype_match(start, end);
+	if (!entry_old)
+		return ERR_PTR(-EINVAL);
 
+	interval_remove(entry_old, &memtype_rbroot);
 	return entry_old;
 }
 
-- 
2.49.0

