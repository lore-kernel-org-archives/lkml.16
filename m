Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AF22040B6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024924; cv=none; b=nVf2l1FmU6GsYrzEUTV/H/NLz1Iey6rpWGuQ2fgRv2ydcjWn9fMb2HYp2JZaP0dWTWYyMkiIOjiDpzaha/cQgXHIgQA6oreQ92EtaBlNDgGwYm8flnCMyKpJngSSizMDycMhuLYwrVWS7WJ6OPtUHHmROyLFA/HnyWkuW+uPLCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024924; c=relaxed/simple;
	bh=cHxGZ4oCqEP6ZY34NFekAOLYkHp3zwwYssV0hJQJZJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGWbRtvVyc54AR1jB4NXHxE8QwBNk0waPjbqLjqpSMZPFez6EViVgScv1ABkmXbMto32kHXp/yEji6RrOkAEnBbfVFjKMl8zDuSxhpsjBdcHrD/boUiEX6HWcRtg3ye93bYd7K/TIqII15iPWSfWWgvAn8zUzASBRi3Z1Ib0phE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Pkp+qUwe; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=o4F20NPK; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Pkp+qUwe; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=o4F20NPK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Pkp+qUwe";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="o4F20NPK";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Pkp+qUwe";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="o4F20NPK"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 38872224FC;
	Wed,  4 Jun 2025 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749024921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=Pkp+qUwe9p2KF745I9PvH0wF9lx56fdLblQEFPHNZ5WhN9EVh3U0200sZ+ncvQtq9b5kB/
	l/pbbyt22fPP48U1QuP43wzoyNUvDbIY13cIDpfZdBIDBIYyhd/QIrpJz5NOtMTapNmYJ1
	JBHviq8i34zYgtZsY16A9OiqYbgbAaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749024921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=o4F20NPKmaZZSdW/WXnZ97tGnBJnGdkOz0Uc+/RHhrYRfSWMhXn0ouYQXL4ospwIMFmF5T
	zPaiKxaaFl+pw7DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749024921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=Pkp+qUwe9p2KF745I9PvH0wF9lx56fdLblQEFPHNZ5WhN9EVh3U0200sZ+ncvQtq9b5kB/
	l/pbbyt22fPP48U1QuP43wzoyNUvDbIY13cIDpfZdBIDBIYyhd/QIrpJz5NOtMTapNmYJ1
	JBHviq8i34zYgtZsY16A9OiqYbgbAaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749024921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=o4F20NPKmaZZSdW/WXnZ97tGnBJnGdkOz0Uc+/RHhrYRfSWMhXn0ouYQXL4ospwIMFmF5T
	zPaiKxaaFl+pw7DQ==
Date: Wed, 4 Jun 2025 10:15:21 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: David Hildenbrand <david@redhat.com>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA
Message-ID: <aEAAmXiF1FrpBKgf@dwarf.suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
 <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
 <da52a835-6a4b-4f11-acac-f4ef995da7e1@redhat.com>
 <aD8b7Q8Z9sC8meGU@dwarf.suse.cz>
 <d7cbbab2-8fe0-4a10-8b06-e47da955865e@redhat.com>
 <aD_4bT1AJv7aKhxy@dwarf.suse.cz>
 <72d1df17-1e2d-44ce-95eb-fe79db3f4e05@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72d1df17-1e2d-44ce-95eb-fe79db3f4e05@redhat.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

When re-using the CMA area for kdump there is a risk of pending DMA
into pinned user pages in the CMA area.

Pages residing in CMA areas can usually not get long-term pinned and
are instead migrated away from the CMA area, so long-term pinning is
typically not a concern. (BUGs in the kernel might still lead to
long-term pinning of such pages if everything goes wrong.)

Pages pinned without FOLL_LONGTERM remain in the CMA and may possibly
be the source or destination of a pending DMA transfer.

Although there is no clear specification how long a page may be pinned
without FOLL_LONGTERM, pinning without the flag shows an intent of the
caller to only use the memory for short-lived DMA transfers, not a transfer
initiated by a device asynchronously at a random time in the future.

Add a delay of CMA_DMA_TIMEOUT_SEC seconds before starting the kdump
kernel, giving such short-lived DMA transfers time to finish before
the CMA memory is re-used by the kdump kernel.

Set CMA_DMA_TIMEOUT_SEC to 10 seconds - chosen arbitrarily as both
a huge margin for a DMA transfer, yet not increasing the kdump time
too significantly.

Signed-off-by: Jiri Bohac <jbohac@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>

---
Changes since v4:
- reworded the paragraph about long-term pinning
- simplified crash_cma_clear_pending_dma()
- dropped cma_dma_timeout_sec variable

---
Changes since v3:
- renamed CMA_DMA_TIMEOUT_SEC to CMA_DMA_TIMEOUT_MSEC, change delay to 10 seconds
- introduce a cma_dma_timeout_sec initialized to CMA_DMA_TIMEOUT_SEC
  to make the timeout trivially tunable if needed in the future

---
 kernel/crash_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 335b8425dd4b..a4ef79591eb2 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -21,6 +21,7 @@
 #include <linux/reboot.h>
 #include <linux/btf.h>
 #include <linux/objtool.h>
+#include <linux/delay.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -33,6 +34,11 @@
 /* Per cpu memory for storing cpu states in case of system crash. */
 note_buf_t __percpu *crash_notes;
 
+/* time to wait for possible DMA to finish before starting the kdump kernel
+ * when a CMA reservation is used
+ */
+#define CMA_DMA_TIMEOUT_SEC 10
+
 #ifdef CONFIG_CRASH_DUMP
 
 int kimage_crash_copy_vmcoreinfo(struct kimage *image)
@@ -97,6 +103,14 @@ int kexec_crash_loaded(void)
 }
 EXPORT_SYMBOL_GPL(kexec_crash_loaded);
 
+static void crash_cma_clear_pending_dma(void)
+{
+	if (!crashk_cma_cnt)
+		return;
+
+	mdelay(CMA_DMA_TIMEOUT_SEC * 1000);
+}
+
 /*
  * No panic_cpu check version of crash_kexec().  This function is called
  * only when panic_cpu holds the current CPU number; this is the only CPU
@@ -119,6 +133,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
 			machine_crash_shutdown(&fixed_regs);
+			crash_cma_clear_pending_dma();
 			machine_kexec(kexec_crash_image);
 		}
 		kexec_unlock();

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

