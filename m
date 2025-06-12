Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C93C1F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723463; cv=none; b=hfyIsLR2dQrhRh1+mbNgs8FLcixixwC60gKIyTLH4uGOvYDIBlfzxobcYHy3UQzJU3VYuQkgvmxKannMU2oCcn4ynsBM9TgR6C7vMzaK6kEnz+KD9n1yow1TYgtH6u4GkquIKP0oc3pV0KRxvW1qOht2usjJR+7pDHp5L+sBoi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723463; c=relaxed/simple;
	bh=3VS2CXhVqpFrEmQU9HpV0X8mS7in4Erpbb/MLjMw30Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyyhFVphV6P7liYC2GtHHKHcxxvlUAgpzw7ckrMXcbib70GKJ+SoK72tzcHwlWN7t3yuj6G0z8BzCOKBarAm1RPktpEybQBBuj6yLszqnU5ZeyHduXuRLkJId++OAMzm38giMvx8tq9x9Xcr1rk5QnO6HLEGNFdC7N73Ykncsyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=yuSN7z6D; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Q8TprLYy; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=yuSN7z6D; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Q8TprLYy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="yuSN7z6D";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Q8TprLYy";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="yuSN7z6D";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Q8TprLYy"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id A81151F7EC;
	Thu, 12 Jun 2025 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V683jXcvBO/wNHAZuQXuIAcraBnYtRvfHmOlvfeKHUA=;
	b=yuSN7z6DhLLed/W2OioNoE2AXN+M+85NxG1sRDtk5jG/P3iOQ+MRpHKEiQuOqsMV5kNdTS
	eo5keclbNrj6Be3KaV+T7qKUJN78TyivfDTRU/5yU/63sVCITxV1yHtwmdCPl5ooBiADxD
	2W2pSlfB54kzszBPRUksSNEWcdlgXO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V683jXcvBO/wNHAZuQXuIAcraBnYtRvfHmOlvfeKHUA=;
	b=Q8TprLYymlMK5MppTEwWlQMn3nQMmWfTBB6lgrzTzx/K6ixAqeOk+7Zv9cyP36zuD72ozJ
	WxUeKMMK0oAc0hDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V683jXcvBO/wNHAZuQXuIAcraBnYtRvfHmOlvfeKHUA=;
	b=yuSN7z6DhLLed/W2OioNoE2AXN+M+85NxG1sRDtk5jG/P3iOQ+MRpHKEiQuOqsMV5kNdTS
	eo5keclbNrj6Be3KaV+T7qKUJN78TyivfDTRU/5yU/63sVCITxV1yHtwmdCPl5ooBiADxD
	2W2pSlfB54kzszBPRUksSNEWcdlgXO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V683jXcvBO/wNHAZuQXuIAcraBnYtRvfHmOlvfeKHUA=;
	b=Q8TprLYymlMK5MppTEwWlQMn3nQMmWfTBB6lgrzTzx/K6ixAqeOk+7Zv9cyP36zuD72ozJ
	WxUeKMMK0oAc0hDw==
Date: Thu, 12 Jun 2025 12:17:39 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	akpm@linux-foundation.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v5 3/5] kdump, documentation: describe craskernel CMA
 reservation
Message-ID: <aEqpQwUy6gqSiUkV@dwarf.suse.cz>
References: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dwarf.suse.cz:mid,localhost:helo]
X-Spam-Level: 

Describe the new crashkernel ",cma" suffix in Documentation/

Signed-off-by: Jiri Bohac <jbohac@suse.cz>
---
 Documentation/admin-guide/kdump/kdump.rst     | 21 ++++++++++++++++++
 .../admin-guide/kernel-parameters.txt         | 22 +++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 1f7f14c6e184..089665731509 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -311,6 +311,27 @@ crashkernel syntax
 
             crashkernel=0,low
 
+4) crashkernel=size,cma
+
+	Reserve additional crash kernel memory from CMA. This reservation is
+	usable by the first system's userspace memory and kernel movable
+	allocations (memory balloon, zswap). Pages allocated from this memory
+	range will not be included in the vmcore so this should not be used if
+	dumping of userspace memory is intended and it has to be expected that
+	some movable kernel pages may be missing from the dump.
+
+	A standard crashkernel reservation, as described above, is still needed
+	to hold the crash kernel and initrd.
+
+	This option increases the risk of a kdump failure: DMA transfers
+	configured by the first kernel may end up corrupting the second
+	kernel's memory.
+
+	This reservation method is intended for systems that can't afford to
+	sacrifice enough memory for standard crashkernel reservation and where
+	less reliable and possibly incomplete kdump is preferable to no kdump at
+	all.
+
 Boot into System Kernel
 -----------------------
 1) Update the boot loader (such as grub, yaboot, or lilo) configuration
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ea81784be981..ee6be52dd8a5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -983,6 +983,28 @@
 			0: to disable low allocation.
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
+	crashkernel=size[KMG],cma
+			[KNL, X86] Reserve additional crash kernel memory from
+			CMA. This reservation is usable by the first system's
+			userspace memory and kernel movable allocations (memory
+			balloon, zswap). Pages allocated from this memory range
+			will not be included in the vmcore so this should not
+			be used if dumping of userspace memory is intended and
+			it has to be expected that some movable kernel pages
+			may be missing from the dump.
+
+			A standard crashkernel reservation, as described above,
+			is still needed to hold the crash kernel and initrd.
+
+			This option increases the risk of a kdump failure: DMA
+			transfers configured by the first kernel may end up
+			corrupting the second kernel's memory.
+
+			This reservation method is intended for systems that
+			can't afford to sacrifice enough memory for standard
+			crashkernel reservation and where less reliable and
+			possibly incomplete kdump is preferable to no kdump at
+			all.
 
 	cryptomgr.notests
 			[KNL] Disable crypto self-tests

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia


