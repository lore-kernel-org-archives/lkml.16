Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B28A20A5F3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636631; cv=none; b=nmKuFO9i3maQkO0J2J9qhx0NwqzU6h9JacUcj+yv/0djwJz9rFHRdtKTQxcCBVHAJSP3gA3didpwSBXjylnUsAjCPBH9t0DF5sTvSBjRFKGz3Nc+jHUweiWJ8YUKkfQ0Ny1nsbZLKsdmrPINsPjmHdgrDbDuOLZHfOryZyLiodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636631; c=relaxed/simple;
	bh=rLbpbSM7GmOQ1hkUmtDapLCX+hikhRT2YWxYznYINck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlAIHTRIqEEjc1RbgpXZH1zv+7Fq9Cqr8CoDJCwXgf9TXjW7wo0sciIP2CiWA1Vo3bo5OXhyo3rpmp47H7v8oYFu5pTPxCXd7FTafMPY9JhZNIz+b7cRGXE2FBEf2Msxw8jHujahE4H1hTwpt2Qxtytn2RsjKsNr4SxdlV3Felg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CIgV/6yI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/YXWDDnE; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CIgV/6yI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/YXWDDnE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CIgV/6yI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/YXWDDnE";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CIgV/6yI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/YXWDDnE"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id 88B6F1F45A;
	Fri, 30 May 2025 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748636627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ed7tBYLUKp+hnprjtZCaRYQrJV+Vm4MJKAZpbr7ziOM=;
	b=CIgV/6yIcXYjTP+y3Umh0B226YSAqVSOO6Fp4bh8JdBhhzrVO7Cl7Ee+wyUcznQFAPApZv
	L3EIRbxTACFe1exCk7CE2sdfmryCntGiOZQL9NQoFkaKXCocuqCRakshPGekpKeFdyKzzO
	YMnJMC6SNh9/7SBSgIsskjiA7gkgbkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748636627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ed7tBYLUKp+hnprjtZCaRYQrJV+Vm4MJKAZpbr7ziOM=;
	b=/YXWDDnE0HOQLURABtedsN0nMOjdtaVREOxXtR0MWzAg+rqVAcpmT7QRuTsgDILK0mRrhL
	CMzVVe1rsxsCLDAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748636627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ed7tBYLUKp+hnprjtZCaRYQrJV+Vm4MJKAZpbr7ziOM=;
	b=CIgV/6yIcXYjTP+y3Umh0B226YSAqVSOO6Fp4bh8JdBhhzrVO7Cl7Ee+wyUcznQFAPApZv
	L3EIRbxTACFe1exCk7CE2sdfmryCntGiOZQL9NQoFkaKXCocuqCRakshPGekpKeFdyKzzO
	YMnJMC6SNh9/7SBSgIsskjiA7gkgbkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748636627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Ed7tBYLUKp+hnprjtZCaRYQrJV+Vm4MJKAZpbr7ziOM=;
	b=/YXWDDnE0HOQLURABtedsN0nMOjdtaVREOxXtR0MWzAg+rqVAcpmT7QRuTsgDILK0mRrhL
	CMzVVe1rsxsCLDAA==
Date: Fri, 30 May 2025 22:23:47 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v4 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Spam-Level: 

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
