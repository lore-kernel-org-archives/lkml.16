Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD981148850
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636992; cv=none; b=FYJXXfjnF/eHhTk5I9wQ5tZ0oOn0mCjeCV3T/HQy6ILXxf95lgLWIBFZ1JYutlAWtfHNf51oFzUaiOh44i9+KRi7s2dI+CPZjmK9O8jsKgVLwVzPNgi31BEUwtzhWtlDz6kdm5HuN8wgRGQ4KaXrVsTzEwUr8RZvoj4axD9NHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636992; c=relaxed/simple;
	bh=SpU9owmCITna5Vx2PE2Vbs9LcCqtvuhYlBD8xj0Gr/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScPRVhc7dtQ13A/LcFae3dpmu5XvIrz5c7Hl+Tqw7JoMI07MU1zdsRLg4r5rt2BHLe/zxwB89Q7tj5Zx2nPQyAUngoFyFyMwv9UfxXf8Bxdqmw7a2uhjFiZAJh2aZYEsapz9BbND0GJSKQiyf2T2nFjuoWhOsASnD0csSlE/Pzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sPCe0juk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=L5cIR7yP; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VuzI0KDa; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KTvd80OB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sPCe0juk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="L5cIR7yP";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VuzI0KDa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KTvd80OB"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 706A421D73;
	Fri, 30 May 2025 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748636988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U8NQd5gasV9yRZqY5QWuXoZowjL9igfGI29jVx4p+xA=;
	b=sPCe0juk2gRzEjKs/wIkQrlwja1m4lH6TcAx9qF2PXnGd7QRQSYKMJHQXd5rxNz5df3MKW
	9y+YNkgEmqaD4xxksrkXTKg33CVpvG1Shqee0sjFbtoPj8Cbw3Rc5iqa/QR0hFgKkhCk8t
	nExLP4UXCkyJS6xoymP0/bb6SS3clEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748636988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U8NQd5gasV9yRZqY5QWuXoZowjL9igfGI29jVx4p+xA=;
	b=L5cIR7yPIxp+QWjYotUGRaK2tUT3rpneVdr9c3XW79sPu8fMPosHmdgxF9LgW8f2eYR4CY
	Qg37mxitiBx9MNAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748636987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U8NQd5gasV9yRZqY5QWuXoZowjL9igfGI29jVx4p+xA=;
	b=VuzI0KDa2nd8/KkZK/0HKK3UkJ23SsQOpTxrrWpUyeG4Fia2ynyW2tfxxF5KuZnPpu8KO0
	snYfDUCybBrfpRw0nr4T6S9j4J/rcrx8cRzPEBNvtCtm9DRZq+QMPmGRYvKP6CpVx4n2Jw
	cFCaNwMABb+EIkAgiAWj7toKiBkbhuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748636987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U8NQd5gasV9yRZqY5QWuXoZowjL9igfGI29jVx4p+xA=;
	b=KTvd80OBspms3JDqJKanOM2Sb6RLhJ/7dfDKmaKOLSWpvjj5ihlBESa6yiyDJ9jlcO3ybR
	+j1uwCryUjL4ByCQ==
Date: Fri, 30 May 2025 22:29:47 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v4 4/5] kdump: wait for DMA to finish when using CMA
Message-ID: <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dwarf.suse.cz:mid,suse.cz:email,localhost:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

When re-using the CMA area for kdump there is a risk of pending DMA into
pinned user pages in the CMA area.

Pages that are pinned long-term are migrated away from CMA, so these are
not a concern. Pages pinned without FOLL_LONGTERM remain in the CMA and may
possibly be the source or destination of a pending DMA transfer.

Although there is no clear specification how long a page may be pinned
without FOLL_LONGTERM, pinning without the flag shows an intent of the
caller to only use the memory for short-lived DMA transfers, not a transfer
initiated by a device asynchronously at a random time in the future.

Add a delay of CMA_DMA_TIMEOUT_SEC seconds before starting the kdump
kernel, giving such short-lived DMA transfers time to finish before the CMA
memory is re-used by the kdump kernel.

Set CMA_DMA_TIMEOUT_SEC to 10 seconds - chosen arbitrarily as both
a huge margin for a DMA transfer, yet not increasing the kdump time
too significantly.

Signed-off-by: Jiri Bohac <jbohac@suse.cz>

---
Changes since v3:
- renamed CMA_DMA_TIMEOUT_SEC to CMA_DMA_TIMEOUT_MSEC, change delay to 10 seconds
- introduce a cma_dma_timeout_sec initialized to CMA_DMA_TIMEOUT_SEC
  to make the timeout trivially tunable if needed in the future

---
 include/linux/crash_core.h |  3 +++
 kernel/crash_core.c        | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 44305336314e..805a07042c96 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -56,6 +56,9 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 /* Alignment required for elf header segment */
 #define ELF_CORE_HEADER_ALIGN   4096
 
+/* Default value for cma_dma_timeout_sec */
+#define CMA_DMA_TIMEOUT_SEC 10
+
 extern int crash_exclude_mem_range(struct crash_mem *mem,
 				   unsigned long long mstart,
 				   unsigned long long mend);
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 335b8425dd4b..a255c9e2ef29 100644
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
+unsigned int cma_dma_timeout_sec = CMA_DMA_TIMEOUT_SEC;
+
 #ifdef CONFIG_CRASH_DUMP
 
 int kimage_crash_copy_vmcoreinfo(struct kimage *image)
@@ -97,6 +103,17 @@ int kexec_crash_loaded(void)
 }
 EXPORT_SYMBOL_GPL(kexec_crash_loaded);
 
+static void crash_cma_clear_pending_dma(void)
+{
+	unsigned int s = cma_dma_timeout_sec;
+
+	if (!crashk_cma_cnt)
+		return;
+
+	while (s--)
+		mdelay(1000);
+}
+
 /*
  * No panic_cpu check version of crash_kexec().  This function is called
  * only when panic_cpu holds the current CPU number; this is the only CPU
@@ -119,6 +135,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
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

