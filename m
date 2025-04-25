Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ACB1BD9D0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606263; cv=none; b=Frd3vJ1l/du9KbH8AnHkYwN80l1Jgggm0AJQ2qQ9UnZY0zevk5SlBsXgELVdLGp1MQccvHAeU28nzDK7QQZ1DNVW3h03KsdopNXE42OONZ6R9H0Ahw7A3RcIptHVOEm+XnNUK0wTZWOti2h3UvVcUTqcjODA0rz8plO5ezlPD8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606263; c=relaxed/simple;
	bh=sci7nbeV+YMK27dwFXuG1VPRzxjVZNi+I0eALXkSelE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPd/Ez+UusJyTDENkwb9sj8ni0bLhkN10LSvjko0p416VmHV735ceR34udcufyUrjiCo0Gqp/YEDYxPbjalgFl5gVGxGiRAhVRmi8t7s/8MSdu9hjaXx4bWy3WKwJqpnGrVhbc8Qjva0OUjUHa3zM3a8aosa7jXqdTXyPYxj9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30F3C4CEE4;
	Fri, 25 Apr 2025 18:37:41 +0000 (UTC)
Date: Fri, 25 Apr 2025 19:37:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG: vdso changes expose elf mapping issue
Message-ID: <aAvWchSUlnAfg42x@arm.com>
References: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>

On Fri, Apr 25, 2025 at 01:41:31PM +0100, Ryan Roberts wrote:
> ldconfig is a statically linked, PIE executable. The kernel treats this as an 
> interpreter and therefore does not map it into low memory but instead maps it 
> into high memory using mmap() (mmap is top-down on arm64). Once it's mapped, 
> vvar/vdso gets mapped and fills the hole right at the top that is left due to 
> ldconfig's alignment requirements. Before the above change, there were 2 pages 
> free between the end of the data segment and vvar; this was enough for ldconfig 
> to get it's required memory with brk(). But after the change there is no space:
> 
> Before:
> fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> fffff7ffc000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]
> 
> After:
> fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> fffff7ffa000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]

It does look like we've just been lucky so far. An ELF file requiring a
slightly larger brk (by two pages), it could fail. FWIW, briefly after
commit 9630f0d60fec ("fs/binfmt_elf: use PT_LOAD p_align values for
static PIE"), we got:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xaaaaaaaa0000     0xaaaaaab5d000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
      0xaaaaaab6b000     0xaaaaaab73000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
      0xaaaaaab73000     0xaaaaaab78000     0x5000        0x0  rw-p   [heap]
      0xfffff7ffd000     0xfffff7fff000     0x2000        0x0  r--p   [vvar]
      0xfffff7fff000     0xfffff8000000     0x1000        0x0  r-xp   [vdso]
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

This looks like a better layout to me when you load an ET_DYN file
without !PT_INTERP.

When the commit was reverted by aeb7923733d1 ("revert "fs/binfmt_elf:
use PT_LOAD p_align values for static PIE""), we went back to:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xfffff7f28000     0xfffff7fe5000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
      0xfffff7ff0000     0xfffff7ff2000     0x2000        0x0  r--p   [vvar]
      0xfffff7ff2000     0xfffff7ff3000     0x1000        0x0  r-xp   [vdso]
      0xfffff7ff3000     0xfffff7ffb000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
      0xfffff7ffb000     0xfffff8000000     0x5000        0x0  rw-p   [heap]
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

With 6.15-rc3 my layout looks like Ryan's but in 5.18 above, the vdso is
small enough and it's squeezed between the two ldconfig sections.

Quick hack forcing the vdso alignment to SZ_64K on arm64 (not a
solution, it can still fail in other ways):

------------------8<----------------------------
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 78ddf6bdecad..9f9085e3e203 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -111,7 +111,7 @@ static int __setup_additional_pages(enum vdso_abi abi,

 	vdso_text_len = vdso_info[abi].vdso_pages << PAGE_SHIFT;
 	/* Be sure to map the data page */
-	vdso_mapping_len = vdso_text_len + VDSO_NR_PAGES * PAGE_SIZE;
+	vdso_mapping_len = ALIGN(vdso_text_len + VDSO_NR_PAGES * PAGE_SIZE, SZ_64K);

 	vdso_base = get_unmapped_area(NULL, 0, vdso_mapping_len, 0, 0);
 	if (IS_ERR_VALUE(vdso_base)) {
------------------8<----------------------------

gives:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xfffff7f10000     0xfffff7f14000     0x4000        0x0  r--p   [vvar]
      0xfffff7f14000     0xfffff7f16000     0x2000        0x0  r-xp   [vdso]
      0xfffff7f20000     0xfffff7fdd000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
      0xfffff7feb000     0xfffff7ff3000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
      0xfffff7ff3000     0xfffff7ff8000     0x5000        0x0  rw-p
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]


Not sure what the best solution. IIUC when ld.so is loaded as an
interpreter, it wouldn't need brk above its data section. However, when
something like ldconfig (or ld.so) is executed directly, it should be
loaded like any other ET_DYN executable at ELF_ET_DYN_BASE, e.g.:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xaaaaaaaa0000     0xaaaaaaaab000     0xb000        0x0  r-xp   /usr/bin/wc
      0xaaaaaaabf000     0xaaaaaaac1000     0x2000     0xf000  rw-p   /usr/bin/wc
      0xfffff7fbe000     0xfffff7fe5000    0x27000        0x0  r-xp   /usr/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1
      0xfffff7ff6000     0xfffff7ffa000     0x4000        0x0  r--p   [vvar]
      0xfffff7ffa000     0xfffff7ffc000     0x2000        0x0  r-xp   [vdso]
      0xfffff7ffc000     0xfffff8000000     0x4000    0x2e000  rw-p   /usr/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

-- 
Catalin
