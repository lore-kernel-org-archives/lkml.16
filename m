Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33115AF6
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746341167; cv=none; b=rs1F02mj4e8A3QHx/WA+bWO+LWFq7V5SMx6BjtF83SIfVV4c5l8AUXCHYotI1HFuyfhdhJgU36msZzezi2jQaK00ofGT2+hqlIR9RsL5R3QUk7FMECblORQCE1WiPDSxMw8NaIRGN7urxO7xGglHP0vUCL236V6afZe5/kh5XKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746341167; c=relaxed/simple;
	bh=51T2H+nV5meAOaX2rZBwkpSKfRUq+Iq+o3fb3uLam0I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UUIeRU4USPEXNAZNINAYU8dTG9QYadHjT2Eo87bP5Ecu7r1F10zhLAEfwIeqrBG/ZH/MELBEWqSATbbwrNDepwlKvP0HObMfzOaMS3rPRRUOmJEAMoZYn17sRCkmKaC+lWCj+T9MRR3nGs5IDvAC4OiaUXi5RdOYzdGK9UXN3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sSm6QIs7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sSm6QIs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439FDC4CEE7;
	Sun,  4 May 2025 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746341167;
	bh=51T2H+nV5meAOaX2rZBwkpSKfRUq+Iq+o3fb3uLam0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sSm6QIs7UUo//Vxcje3XenbcCi8K+Bk9507Ht37AzXBePl9BkbNmB1OvxBuYw68OB
	 Pjsz3aaG/49dZjGQDIUnqf3+Jz7Q71EnMTy4Oq9VQt1nrM3ujGw/IFpcbkkRXEpoGQ
	 NB1u8Rr105CD0o1NGvGChLprqnRMyZRaaw00obR0=
Date: Sat, 3 May 2025 23:46:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, Milan
 Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, Daniel P .
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Kairui Song
 <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, Baoquan He
 <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen
 <dave.hansen@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Arnaud
 Lefebvre <arnaud.lefebvre@clever-cloud.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: [PATCH v9 6/8] Revert
 "x86/mm: Remove unused __set_memory_prot()"
Message-Id: <20250503234605.94d954b6ca70ea09c0aa8004@linux-foundation.org>
In-Reply-To: <20250502011246.99238-7-coxu@redhat.com>
References: <20250502011246.99238-1-coxu@redhat.com>
	<20250502011246.99238-7-coxu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 May 2025 09:12:40 +0800 Coiby Xu <coxu@redhat.com> wrote:

> This reverts commit 693bbf2a50447353c6a47961e6a7240a823ace02 as kdump
> LUKS support (CONFIG_CRASH_DM_CRYPT) depends on __set_memory_prot.
> 

x86_64 allmodconfig:

In file included from drivers/gpu/drm/i915/gt/intel_ggtt.c:6:
./arch/x86/include/asm/set_memory.h:40:57: error: unknown type name 'pgprot_t'
   40 | int __set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);
      |                                                         ^~~~~~~~

I did this:


From: Andrew Morton <akpm@linux-foundation.org>
Subject: revert-x86-mm-remove-unused-__set_memory_prot-fix
Date: Sat May  3 11:38:32 PM PDT 2025

x86 set_memory.h needs pgtable_types.h for pgprot_t.  Obtain it via the
higher-level pgtable.h.

Cc: Baoquan He <bhe@redhat.com>
Cc: Coiby Xu <coxu@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Jan Pazdziora <jpazdziora@redhat.com>
Cc: Liu Pingfan <kernelfans@gmail.com>
Cc: Milan Broz <gmazyland@gmail.com>
Cc: Ondrej Kozina <okozina@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/x86/include/asm/set_memory.h |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/x86/include/asm/set_memory.h~revert-x86-mm-remove-unused-__set_memory_prot-fix
+++ a/arch/x86/include/asm/set_memory.h
@@ -4,6 +4,7 @@
 
 #include <asm/page.h>
 #include <asm-generic/set_memory.h>
+#include <asm/pgtable.h>
 
 #define set_memory_rox set_memory_rox
 int set_memory_rox(unsigned long addr, int numpages);
_

