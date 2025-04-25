Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0482367A3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569060; cv=none; b=VfJrcrjjgg1J0zqVAmn8786XDCOsjNI/1i9KREW4puSe8FQZOpjU4tqxPtDH5AP3NmB92pr9yGLBKnMJOtXjj1oa1PhL430J5wVXPran1dkBNmrKU5MB28pvjYjaaMdYpgr6H2x0FvJP1blYlNazHRs+uSpLSla2vGZ5wkW1n7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569060; c=relaxed/simple;
	bh=zb1DGhQBoGmzpTwSqI1Egmp9Z8u5JW6+w6xVrEIvOU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPu3vGKMjrDi9WmwHIQCsZE9wLd7ICxIhFKvezwjIopdppeT2dUMESfWkhrFuwFPp4R+XezRCgtarRFHuEy7cb0cQ8WQ9TeMBtXRXEk/NdrTVJG9FyT22C5XJb5EM4Vm5rPIGQER6LqJ1iZsP4nt9NKeKUm3TYWoV04edsoKlOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alqLEVs7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alqLEVs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xNohxILTOPqd/8P2+09zos3Ls7ebzSxsppSFkARpPU=;
	b=alqLEVs70GPJMZR8jrWB2DQ4ta5xpZx/lxuz+gNT8dvwE6NoQYFXDo21xRdDwPNHV9Ay3+
	rdwLKNCAcfsgj8GpET7otpcHE6Tv0kVCrxgdGqpue70B4O3Gb0X/ZszA2G1GRWF1u5bKv4
	ZH4eBI4qrmZRc7/BM8aZhv80glF2nac=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-AEmEq3QMOSCy0JMYZv3o5w-1; Fri, 25 Apr 2025 04:17:35 -0400
X-MC-Unique: AEmEq3QMOSCy0JMYZv3o5w-1
X-Mimecast-MFC-AGG-ID: AEmEq3QMOSCy0JMYZv3o5w_1745569054
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391492acb59so913399f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569054; x=1746173854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xNohxILTOPqd/8P2+09zos3Ls7ebzSxsppSFkARpPU=;
        b=Mwvvwm0k25i7gYGQ2Eiodtgd9gMMnctTCuZFYdFpXIRaU5Cvax9WnU+Y5wnJUxPvqb
         f8FXwPxkXURK8BvGo1kkXXOA+6tsIIeBRlP2NHViGlFR5kxJCf0r/V6++7WT7FimoW9C
         /Ki5HRYZiXxueF6h4NIwogPSyoHWhEy+m794J/Jw8ufBFcnNqTRwOhN2Z+O6d5DKyIn9
         d3sxIjEKsjHHwrJVRwcuG+9IpbB/3k8+H8uXxXRlkHfChfnypIRsElEccZIOjMnZnF8/
         P1ij5fRKvFklNJXyfggyIawVobDz+EMFGun3bi2KbIrDW3yPNxCgB5XNnWYYvgw4plxb
         NAfQ==
X-Gm-Message-State: AOJu0YwoouFoj3LmQ9PHkSoV/BnA2+dBfjSEd3rBOMvoPML+YN1HNqgL
	pNLxH7JBeITM1oDTgRwIOBCGjZbNPi6F+j6VMsWbOIorLYsQd00eN/qjWHd8pDX0Y3q7fe5A22W
	0WzoWjqGrYIJFGFQ90GXkNaVOCRP4jd7AgsbZ5629Lg16uNW7owCZLef01y9p/d35um4n7Ax1QP
	N1Xz1xBZWsXaa4TebuWzVckL/gJvE8tBJij3SRhflCAg==
X-Gm-Gg: ASbGncsn3mQbzeho7/EMeurjfnQgDbpFE+9OKn7ZC8pEqTJB5e2kJzvA5hIgXo5n6Lf
	khwYXBogTKYIu8+wYSrTtKdTrqpLck5+J2ZBXEEsbhmznyHfUTLwTGLhCVbM5ol4wbLw+tbaQo8
	AjRW+ghekUJqOREihckylZ1r2c00ji/KHK1Kg/8sv07FquBva5ro8PnPMdxLvQb7plHr9UNe3jn
	rP1jzrJAGkK4jRE2XqDLQNFElipWJTUq1c4iNZ72DcRk9wYYA/9xDBbGIgBv4l9FOHEWGDbLXdk
	IVpH+O0a+AZLaRbtOCGs2g8azhz4y7vgP2yT/hCvYIc1EJAQOWzaYYKQ3E1rrNEaQoVK6dY=
X-Received: by 2002:a05:6000:430d:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-3a074e2f3b3mr903690f8f.24.1745569054505;
        Fri, 25 Apr 2025 01:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFENsE4+5Cu5ObTVfglloYLU5xkxFPfypsGCDuMGrHDVRAMikMZaqFHaFNkwSVPa60/smc7Mg==
X-Received: by 2002:a05:6000:430d:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-3a074e2f3b3mr903634f8f.24.1745569054012;
        Fri, 25 Apr 2025 01:17:34 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8cab5sm1648138f8f.10.2025.04.25.01.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:33 -0700 (PDT)
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
Subject: [PATCH v1 07/11] mm: remove VM_PAT
Date: Fri, 25 Apr 2025 10:17:11 +0200
Message-ID: <20250425081715.1341199-8-david@redhat.com>
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

It's unused, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h             | 4 +---
 include/trace/events/mmflags.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9b701cfbef223..a205020e2a58b 100644
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

