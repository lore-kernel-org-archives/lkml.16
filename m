Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0623817E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569065; cv=none; b=RudaTzPg27YGL5hVfXgz+BzuU6vpjnZTrZHNaI7RciXv5GLCRlMCQLgmENwNVNYwTh6i1bemo8O27ZEvsid3XIbY60mlkFRIvD4DQq1p5+GLHYRrC/Y9QvMhjG00kwoZMpRZWl5yUeXX2D6y3EXC5PT/Hzsk68ZbAYVytC7Wq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569065; c=relaxed/simple;
	bh=3pu/JRmizV3sTEFqn23N+eBiWBLA1us5qDw3DkZsmds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ij7uwKuhlXmmMpPbx+IBbNUG9jOax59FsNS8p0OgklyzqKm9/X5jN3RwZ9m9JiPQh2FrYEDELNnvUPKU+EHCX1xX1QQQPrN3ohsZ+/jhVwfi+Bbo+6biuNpUE4yfBPQb2Q4LoIdl6Xeuerdjy87ZfA2/m0DvT4IaIb5YMThjpj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HXitVtvk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HXitVtvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqCDzyJE3N7q1dfRPTJIKewHsgjJcYj+B7llEZA1rCc=;
	b=HXitVtvku83b/NbuS9TYDrfzGvgCzXP3nhu79QsSF64kBN/um5tgszlkxfCNpZjfAdE0z3
	pnptNT9erv773zWxSlzsJ5GNlx58nFecPwJ3mnWIWAxqXJN+jfXkiz4R85oe5saZsjEu0T
	XoEK3CCThdSuIP/OMP4y2HkQYJBhb6g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-WxaiQOkHMay7W_8rfMV1Nw-1; Fri, 25 Apr 2025 04:17:40 -0400
X-MC-Unique: WxaiQOkHMay7W_8rfMV1Nw-1
X-Mimecast-MFC-AGG-ID: WxaiQOkHMay7W_8rfMV1Nw_1745569059
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so12005765e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569059; x=1746173859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqCDzyJE3N7q1dfRPTJIKewHsgjJcYj+B7llEZA1rCc=;
        b=nSTe3ccel3W4Ly+p8k0j638LCs7cuQJUEO4ie00TEHuw2IeVmOYpoH9A9l5vb3tI4h
         jqEOui05IY1MQ5Sl8GnMBg+TfRS4fj4MuS1etDMpytuXcdCOwOi3ntC5MtrLPzax8kP3
         Jzo21ru3jPiGzy2WyHQWzoUy6tRjLLxGqzbRjokenY+Kz/lO1cuEfe+7x17qxlKuJE2v
         N7sTRBX9w4oZMFPtLlAkXP4hYXUXfkPt6x6Ac9ir/BhleIvEZaIcvAyvW6NKbI4VMKpB
         b/Rxg8dMRDajPxgz5DrtK+EDsy7xdpmxKuV6bDoI6Dz6C6/1uln9Kq0yihcAHOQrI5H9
         sW+Q==
X-Gm-Message-State: AOJu0YwfOpjcI7QP3V1J/JZesxWLJj5xVLTOrUCGdNhdWeJ4ElXFeIg+
	s76R/e75x55vf9BODQdZwbqgJ9Qn6/e/8GY1OegZiDJG4eDJnnAh2DPvf0OS10/c0ixWck1Vpun
	xZUptsy1IYztk2Brc/TC1Kgx3LqMATBt/Lgmegra1G4kS9zZqS3KTUvvLCMfERWSypYqHgJ57nA
	RxlpspFQc7eq1xMaSC5CTyuSdpLFqSaRejBmD/iy/rRA==
X-Gm-Gg: ASbGncsyIJJ1v3a9hUPR3/KOHVBEIrJUasVWu0NcrXAVH7oVWcVEH6VchOwEL/0H9TT
	pc9Evfb4rHeXuUbRZGpfAbjlStW/tG24pfzxnu7MFeZBYzWb1NQB7T7i8pmwET+kHj3LQXZwcxb
	OAw22PnMyPFs3mvLLeVwnG92PsARPAadVmkcYRLcSg4MZC5HthJRKt8JUxSK6gmX1NKqwTnXKgd
	BjpPsjsNrhALnBn7f5VXoGI8eOyyeB0m7QDQOp246A7DOOxsgND/GzzXEUHAWDp6nOSyFlAe3cf
	gDsLoaLjIkmcGeZJMOkj80BuOQsYpk9QOO1r5HWpKcK8U6Qo/U/rAX4Vt8CpyXqzahYvZHQ=
X-Received: by 2002:a05:6000:4026:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-3a074e1e7c1mr893904f8f.17.1745569059420;
        Fri, 25 Apr 2025 01:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeMJVro3CtNN/nAt/kzydgqpqMLMz4QDAdVYj55uYz4S+yOKx9n2ojCFKF9ThYiE7nLuy7NA==
X-Received: by 2002:a05:6000:4026:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-3a074e1e7c1mr893849f8f.17.1745569058900;
        Fri, 25 Apr 2025 01:17:38 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4408d8d191bsm78695765e9.1.2025.04.25.01.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:38 -0700 (PDT)
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
Subject: [PATCH v1 09/11] x86/mm/pat: remove MEMTYPE_*_MATCH
Date: Fri, 25 Apr 2025 10:17:13 +0200
Message-ID: <20250425081715.1341199-10-david@redhat.com>
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

The "memramp() shrinking" scenario no longer applies, so let's remove
that now-unnecessary handling.

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

