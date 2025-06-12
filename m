Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787523027C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723083; cv=none; b=lg2WzGri6oW0LxethLdVbhT3jd0G0RqMHWBhPn1k13riH6zh9eBhq76hBLqysuVHRP/dsSChgPfqswZ75EVHVj8dlaaAGSJthu1lfmfbm7SEPgnyQzMNtooeTBGP5UUEIDAAFhsW+/o2KiistI3dtp4XuogvHsBpXo3tJUPzj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723083; c=relaxed/simple;
	bh=0e4k4P4C/MFFrOkfxYQtEsZCb9pEL2JyFtAlMCvfg18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azmq5N8vq1LtZ1JUnIFlST56pioNFm/vOoNb7K4sbRrdfL6woe9yFHvwRx5YkF5PR28Bo+4Rd6TfcJ8mDeNIhxf4Kr9UWe6B3Hh6kS96PAeOzuQREg6ICDjb6JLSMKTZ+kTANTAVoA9Lq/1SfjWSXQB7UI8BLSwEoppxu9BRzKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3GxPco8F; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VtKoCqHS; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3GxPco8F; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VtKoCqHS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3GxPco8F";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VtKoCqHS";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3GxPco8F";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VtKoCqHS"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 9C90C211AD;
	Thu, 12 Jun 2025 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=235N1r216Y4gt83LncqEbLZ3GuC11ur0UQtPbyf3pi8=;
	b=3GxPco8FwKweWzkZrHtRpXQ2bI+yP35opo0TeKuXJtG4rkQmmYP4zMYtS7qZy2EiBy+gZ9
	YmW3g6CxTWzqEQy5nHSKxaO3s5V+PCu1OBQ9UcycwxwFHNnQ3WAV3W7HwRbgdfcYfA34ru
	h8T+Hwk28Rw4sOSib2BHwaiLmeLMjvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=235N1r216Y4gt83LncqEbLZ3GuC11ur0UQtPbyf3pi8=;
	b=VtKoCqHSn017kwnlVAlt2h+lBjmFTxlif8sEjD7H7JgJTlvWgylCvyspLdXmgGS4wmy9Q7
	6dBVtoQziFKimwCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=235N1r216Y4gt83LncqEbLZ3GuC11ur0UQtPbyf3pi8=;
	b=3GxPco8FwKweWzkZrHtRpXQ2bI+yP35opo0TeKuXJtG4rkQmmYP4zMYtS7qZy2EiBy+gZ9
	YmW3g6CxTWzqEQy5nHSKxaO3s5V+PCu1OBQ9UcycwxwFHNnQ3WAV3W7HwRbgdfcYfA34ru
	h8T+Hwk28Rw4sOSib2BHwaiLmeLMjvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=235N1r216Y4gt83LncqEbLZ3GuC11ur0UQtPbyf3pi8=;
	b=VtKoCqHSn017kwnlVAlt2h+lBjmFTxlif8sEjD7H7JgJTlvWgylCvyspLdXmgGS4wmy9Q7
	6dBVtoQziFKimwCw==
Date: Thu, 12 Jun 2025 12:11:19 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	akpm@linux-foundation.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v5 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

Hi,

this series implements a way to reserve additional crash kernel
memory using CMA.

Link to the v1 discussion:
https://lore.kernel.org/lkml/ZWD_fAPqEWkFlEkM@dwarf.suse.cz/
See below for the changes since v1 and how concerns from the 
discussion have been addressed.

Currently, all the memory for the crash kernel is not usable by
the 1st (production) kernel. It is also unmapped so that it can't
be corrupted by the fault that will eventually trigger the crash.
This makes sense for the memory actually used by the kexec-loaded
crash kernel image and initrd and the data prepared during the
load (vmcoreinfo, ...). However, the reserved space needs to be
much larger than that to provide enough run-time memory for the
crash kernel and the kdump userspace. Estimating the amount of
memory to reserve is difficult. Being too careful makes kdump
likely to end in OOM, being too generous takes even more memory
from the production system. Also, the reservation only allows
reserving a single contiguous block (or two with the "low"
suffix). I've seen systems where this fails because the physical
memory is fragmented.

By reserving additional crashkernel memory from CMA, the main
crashkernel reservation can be just large enough to fit the
kernel and initrd image, minimizing the memory taken away from
the production system. Most of the run-time memory for the crash
kernel will be memory previously available to userspace in the
production system. As this memory is no longer wasted, the
reservation can be done with a generous margin, making kdump more
reliable. Kernel memory that we need to preserve for dumping is
normally not allocated from CMA, unless it is explicitly
allocated as movable. Currently this is only the case for memory
ballooning and zswap. Such movable memory will be missing from
the vmcore. User data is typically not dumped by makedumpfile.
When dumping of user data is intended this new CMA reservation
cannot be used.

There are five patches in this series:

The first adds a new ",cma" suffix to the recenly introduced generic
crashkernel parsing code. parse_crashkernel() takes one more
argument to store the cma reservation size.

The second patch implements reserve_crashkernel_cma() which
performs the reservation. If the requested size is not available
in a single range, multiple smaller ranges will be reserved.

The third patch updates Documentation/, explicitly mentioning the
potential DMA corruption of the CMA-reserved memory.

The fourth patch adds a short delay before booting the kdump
kernel, allowing pending DMA transfers to finish.

The fifth patch enables the functionality for x86 as a proof of
concept. There are just three things every arch needs to do:
- call reserve_crashkernel_cma()
- include the CMA-reserved ranges in the physical memory map
- exclude the CMA-reserved ranges from the memory available
  through /proc/vmcore by excluding them from the vmcoreinfo
  PT_LOAD ranges.

Adding other architectures is easy and I can do that as soon as
this series is merged.

With this series applied, specifying
	crashkernel=100M craskhernel=1G,cma
on the command line will make a standard crashkernel reservation
of 100M, where kexec will load the kernel and initrd.

An additional 1G will be reserved from CMA, still usable by the
production system. The crash kernel will have 1.1G memory
available. The 100M can be reliably predicted based on the size
of the kernel and initrd.

The new cma suffix is completely optional. When no
crashkernel=size,cma is specified, everything works as before.

---
Changes since v4:

- v5 is identical to v4 for all patches except patch 4/5,
  where v5 incorporates feedback from David Hildenbrand

---
Changes since v3:

- updated for 6.15
- reworked the delay patch:
  - delay changed to 10 s based on David Hildenbrand's comments
  - constant changed to variable so that the delay can be easily made
    configurable in the future
- made reserve_crashkernel_cma() return early when cma_size == 0
  to avoid printing out the 0-sized cma allocation

---
Changes since v2:

based on feedback from Baoquan He and David Hildenbrand:
- kept original formatting of suffix_tbl[]
- updated documentation to mention movable pages missing from vmcore
- fixed whitespace in documentation
- moved the call crash_cma_clear_pending_dma() after
  machine_crash_shutdown() so that non-crash CPUs and timers are
  shut down before the delay

---
Changes since v1:

The key concern raised in the v1 discussion was that pages in the
CMA region may be pinned and used for a DMA transfer, potentially
corrupting the new kernel's memory. When the cma suffix is used, kdump
may be less reliable and the corruption hard to debug

This v2 series addresses this concern in two ways:

1) Clearly stating the potential problem in the updated
Documentation and setting the expectation (patch 3/5)

Documentation now explicitly states that:
- the risk of kdump failure is increased
- the CMA reservation is intended for users who can not or don't
  want to sacrifice enough memory for a standard crashkernel reservation
  and who prefer less reliable kdump to no kdump at all

This is consistent with the documentation of the
crash_kexec_post_notifiers option, which can also increase the
risk of kdump failure, yet may be the only way to use kdump on
some systems. And just like the crash_kexec_post_notifiers
option, the cma crashkernel suffix is completely optional:
the series has zero effect when the suffix is not used.

2) Giving DMA time to finish before booting the kdump kernel
   (patch 4/5)

Pages can be pinned for long term use using the FOLL_LONGTERM
flag. Then they are migrated outside the CMA region. Pinning
without this flag shows that the intent of their user is to only
use them for short-lived DMA transfers. 

Delay the boot of the kdump kernel when the CMA reservation is
used, giving potential pending DMA transfers time to finish.

Other minor changes since v1:
- updated for 6.14-rc2
- moved #ifdefs and #defines to header files
- added __always_unused in parse_crashkernel() to silence a false
  unused variable warning
 

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

