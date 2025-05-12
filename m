Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8329374B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053288; cv=none; b=IWDXYOKTUg8U+TwzPDwXCmfvARFh9t3vCsXqCn0Na/xOvPGMTmwwKtWkj5EVnJc3DTiAL/GLEyf3W/zxUgk6sRQ0TIYIUeL1V00OkCpeXZBc+TpwhNdeknKpnUAbYrKUxRoZJtvyo7Rhz8fveKrD1GPoPFdJGIcNJTM/g49qmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053288; c=relaxed/simple;
	bh=MUI/AxEhqRJImsU/nUpWQjiOz2C1jw4sB7/CH9k9y0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4RXxg8ZQn3dQQkSfaGykSs7G7IFLSEY3sO64xKwjG+ral1QU8axgDfTNODs8io2W9TDI6vDxNyHCofKiOeH+VQSi43HycpKdluqFqDjKnADjGAwYswW36Rdfg7PmSJ1cMk+NAqKF2PrzL0ImBvA0LfZou3+9sTZOuWeNfrzOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CHGpSvaJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CHGpSvaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/UT1PJepYZyksnYsraxL/8N12b3Ge+B9agKxkMscSY=;
	b=CHGpSvaJTMKHpXiAhnP6n4LZ6AQ6fImDmcQ79k7mbzAhcD+tCIS/cORRaHfKqyMdpxFXLd
	fGuOYaf9KJCAlkB+YhXA1zr4pLYXEvCYQyxHNhi1BY8U7n4AWmszwQ1dLWJwfWNNur1w0E
	72Ad1GL0Cn4LaJ9NAiw35bA9fSqzpIQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-lA322ZqgO3i6m8I30WK45A-1; Mon, 12 May 2025 08:34:43 -0400
X-MC-Unique: lA322ZqgO3i6m8I30WK45A-1
X-Mimecast-MFC-AGG-ID: lA322ZqgO3i6m8I30WK45A_1747053282
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442cd12d151so28660225e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053282; x=1747658082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/UT1PJepYZyksnYsraxL/8N12b3Ge+B9agKxkMscSY=;
        b=idjsZTha5xIrPXGmyW/xLDy8m6WLRkVzXbm8or6bDao/jroYWzPSTqJBmUdIpXf409
         sVp0oCV4fqkxBTWUnbOVbMjlnrRWjFZsCGjw+k8RD83F5im9MQAvqXAH7MYn9twNzVFF
         vTVfAOEoB9fwpZQQyYRr0/lLOZ9ZxhwmnI4tTG0hbwVbUoyC4iSiNz1feu4oGwf6ElPp
         EZZLl9loJRbi+6ctgIAar1HMpbJ75Lx0uMQAW4/ohgiSg9Gn2xPk8buMkeBR+/S0r20u
         etsGM6o8eYFFQ3oAB/aJgorabnSHonm79jV/DhTy+XxHU97JX/HdOp/6iXM33vLFD3Un
         PVsg==
X-Gm-Message-State: AOJu0YzAwAokddTN/P0vAIuphlHxggXu16eU6KSGvTJ8F7N+W+CdhJXG
	84JLQvBmCecG2EWnmnI+HUZ/Jmq7E/mwCB0DeZP4+IiaIJ4D2u4ROZ7/mQiU8c2LViSWkmKnHNj
	rP5rkUhNRlIly6t02flYlc1lKXXOZN7SP2BnmEsCeOLKrPUT0hsvZ9vOLFRf4XkHH2TFRCLbEs8
	I7Zi0ubxD79jt8WHCClcK39KsQbQbgiNgCDmvNCIg8hqLR
X-Gm-Gg: ASbGncv9bUzKzqacKJVsyCVRNrV4L2aG8Da+2yjDtFxTkBsK5Q3mdyA2mjtRKmaplb6
	aOTXz7uKREiQnsfKVcoDLiigjxB943ntrJLrpObK1iZAIHI4X043Nq0YrhJQASjy+NpU9F2y0Dx
	kmn1CF6MCiRo9VnawlVLzTRwbQuXzkA8KXTae5ZjJekM8wwrR1GzcUxG+h3tfrlH7Jnj6QYop+I
	IchVs5Wa96cxqgrC5b1mS4xxezoIyaco0I9X0BfzBhf2krcvegCPm1doaxtOmzaFF7cnFf/Smpv
	gEy5/4drwyAnIzw05oWUj9YQj2cPLoLNnZVeA3/UnLIbbwDW7lqJ/+bj9T4YG2ccraookA/K
X-Received: by 2002:a05:600c:5297:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-442d6d0a9dfmr115315605e9.3.1747053282449;
        Mon, 12 May 2025 05:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFywN6624bTf4LyaE2Qvs6JUb4DihepKIjEJxodQ9QeZ2Wkqkhy5X7PHmdPSSD8j6qE1uzKzw==
X-Received: by 2002:a05:600c:5297:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-442d6d0a9dfmr115314985e9.3.1747053281990;
        Mon, 12 May 2025 05:34:41 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d773f794sm82894295e9.0.2025.05.12.05.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:41 -0700 (PDT)
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
Subject: [PATCH v2 06/11] mm: remove VM_PAT
Date: Mon, 12 May 2025 14:34:19 +0200
Message-ID: <20250512123424.637989-7-david@redhat.com>
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

It's unused, so let's remove it.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h             | 4 +---
 include/trace/events/mmflags.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 38e16c984b9a6..c4efa9b17655e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -357,9 +357,7 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-#if defined(CONFIG_X86)
-# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
-#elif defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64)
 # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 #elif defined(CONFIG_PARISC)
 # define VM_GROWSUP	VM_ARCH_1
diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 15aae955a10bf..aa441f593e9a6 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -172,9 +172,7 @@ IF_HAVE_PG_ARCH_3(arch_3)
 	__def_pageflag_names						\
 	) : "none"
 
-#if defined(CONFIG_X86)
-#define __VM_ARCH_SPECIFIC_1 {VM_PAT,     "pat"           }
-#elif defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64)
 #define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
 #elif defined(CONFIG_PARISC)
 #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
-- 
2.49.0

