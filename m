Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3F279904
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140128; cv=none; b=UJJ5TSDs7n1/ICi04RQW6bvOq0OA75OLxMwnOnEl0XxDuuOrsOqVhGblPsgn/353LZ/m+TnnUET/IuKL6ATfjNCErsxSnsUWt0QMihdHzcWiZksxRIN277OxjTBcaiR1W8BiJjexPjL2jaE+Ly5LvpSnDjSUaAjNSXEoyjaXpiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140128; c=relaxed/simple;
	bh=K99Z3NzL0rnLbJZnRsYusQ+/686qxOvpuiDet9cYtG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bM/1j++nUwRCsByWsR3P2h18+LqoeMa3JgHwb+9as9g9nvugcx03mN/9ot5gVj5dpIeAef0PbG9TIVTeWVA34qPpkwvcFo8x1RR63S957QIe+iYUAPIMJdVvSYQ2bUUzzTtM5u8NwcqO+BGz4ltIlWykaPc/zwMeEZNevGihtfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zHyYvy3o; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zHyYvy3o"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-225505d1ca5so13145225ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140126; x=1746744926; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGO8byd0TkM2xA40/EGnrAlxr2Ydy4LQeG9Cn/PTvGw=;
        b=zHyYvy3o6EHsXXok1Y+1GTEundtdgcCCgFfjdiFXtMGhauEdALsoSQxKIPSJiwrC5X
         hMAXS5hfHekww4h4kz3O3U1xVwRtUlRFTdD+q6SEyoyxl5PyOBdHC6tIhJ2gzT3gTwyh
         1VuPfaJnHBzwGrPJee+EnUbrPL1T7Pp8bEwAQK7sEO/W8hbE60eQ+jkUX0z6taZmL/rZ
         7cL7LY5YjO+WL6cz8QJ1D3KWeHgUzkM75Tmo1LHYGxVzKVsYxUk5bySIBgNb2uVhLRFZ
         Go9emO8XgRPThHRWm3T6CN3DLKBF64uUMGpOjNxbK0nw6YqMbGjfL0ZXO0p6MZLRE3y7
         cKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140126; x=1746744926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGO8byd0TkM2xA40/EGnrAlxr2Ydy4LQeG9Cn/PTvGw=;
        b=txdaSvlDnT+22groJC9uasy3kLbLsZw/mlyQp6MIrtH8nTwLPYwgSQ7y1KM5z3fdiO
         4O/zf4bZ1PELBOoHhp+/Ya6DX2K14TokysNaVLalSlnxR9lheyf8/S61KN3XN6UFlfKt
         bBl4BVivUHGUBqk+z9lvz9kFen5c8aAQojcmkls4aNonz33tFlNHC0+5mUhbHFiXs4P8
         5p7r73C+gWJeCxR3xdPntFHv9l17bXV/RVY1e+jH+uzgWaNHayd8G09ESSt48N9zhKPz
         X822TcfV7HW29y4xjdEmu9/oEgsWgbgBsIOxzWWRudaD+ySYLoflXGB+plT+lRdtGP1G
         08rA==
X-Gm-Message-State: AOJu0YwhjEpZlRnsPGUJ5YUJNBcMPoEAfvW6Kv+Di591ryGcVcm/YP62
	zEH53EMgzI9eGX0gjUIe4e/u3xMIVrvOTVjASb2Tie4XKPpbU3pXIqQSZzcKdjTwtFo1Ou9hftv
	P7pCJVtls2bcPbSH6kfNzbSuicG9e/xW8NRIt4W6UevyfDal/e3itjxWb+avdT8ex4vIQEFT/0P
	vTpZXzV++FSIQZeJ+dHCbE1QdjMINRuASQWD2cmQ2GUbr7oED5caWbY03nrNZeUQ==
X-Google-Smtp-Source: AGHT+IHJUmwT4tOhxLskkrWxieqEKxrv6qbe/rS4uJuA/C3JPb20dm7HBzJjo4+K34ocPx0/uIvvUYW+1UT+7DwM
X-Received: from plac4.prod.google.com ([2002:a17:902:c2c4:b0:224:2ae9:b271])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3c25:b0:22c:3609:97ed with SMTP id d9443c01a7336-22e1031f6femr10317175ad.30.1746140126491;
 Thu, 01 May 2025 15:55:26 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:16 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-10-changyuanl@google.com>
Subject: [PATCH v7 09/18] kexec: add config option for KHO
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

We have all generic code in place now to support Kexec with KHO. This
patch adds a config option that depends on architecture support to
enable KHO support.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/Kconfig.kexec | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f8719516..4fa212909d699 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -95,6 +95,20 @@ config KEXEC_JUMP
 	  Jump between original kernel and kexeced kernel and invoke
 	  code in physical address mode via KEXEC
 
+config KEXEC_HANDOVER
+	bool "kexec handover"
+	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
+	select MEMBLOCK_KHO_SCRATCH
+	select KEXEC_FILE
+	select DEBUG_FS
+	select LIBFDT
+	select CMA
+	help
+	  Allow kexec to hand over state across kernels by generating and
+	  passing additional metadata to the target kernel. This is useful
+	  to keep data or state alive across the kexec. For this to work,
+	  both source and target kernels need to have this option enabled.
+
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	default ARCH_DEFAULT_CRASH_DUMP
-- 
2.49.0.906.g1f30a19c02-goog

