Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFB616E863
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022833; cv=none; b=q5/xBaKasfQHo62IFNtA8VtJfGBgA/F7R9+M4VAX4D0PrsLvxgD0P1xHT4JCggC7fUyHb+9B04fHa95y4aDFYRsT6TdIT1RtTSvEPypzFim7DSW9JqCel6rcu60IYOMF84WN4LOn2Fmzxj3+VfVC/f+EMI9nq+26UbxkhCksa/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022833; c=relaxed/simple;
	bh=1qcwXgW33nS3BMVGkjxB3msLwKyZmt06U/NLNmM9Wa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WigBH6/6xZaeW5weVAh6sCyOd0LmEu6PJVqO87rsspAxhHWOnSm8kq34+2LvE4d2TuKRXT+Tdjjzlju9svSoebXFDX4vIX3+5GwIokzmJLvItaf8NdMhXh80J4v6Whva4Kn17uxYo0ExMp6tNmzAn9FTN3H3bgtO2z25l5Mz9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OxVEDYUs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UZIaHJ3R; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OxVEDYUs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UZIaHJ3R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OxVEDYUs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UZIaHJ3R";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OxVEDYUs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UZIaHJ3R"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id C0D1E203E5;
	Wed,  4 Jun 2025 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749022829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56cQPDkweYJVMIO8Oci9vsmGNfnHiTtULArO7sVXI0E=;
	b=OxVEDYUsfzYZ8xLXAyKnAep5+KO8k1PveIDBEEmCWHTQ4eS8oThZT0+ho+B5Wb1NmHnGW/
	MH6K6tJXSf730OJJUAsmL1esZW6+iYIjlDSn1Gb0NBGikfEClqbPI8KDiECcHXFoLYIeGN
	RenGbSrvnINQqRQdV9GAd3eCOvFhYEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749022829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56cQPDkweYJVMIO8Oci9vsmGNfnHiTtULArO7sVXI0E=;
	b=UZIaHJ3RHQIdgYLYuU4/PIRCCWguUqwjEreL+bp2SSgkwji2YmH80JvHeYeKO8HT6ILLiv
	wndEVd0nFMHoSfDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749022829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56cQPDkweYJVMIO8Oci9vsmGNfnHiTtULArO7sVXI0E=;
	b=OxVEDYUsfzYZ8xLXAyKnAep5+KO8k1PveIDBEEmCWHTQ4eS8oThZT0+ho+B5Wb1NmHnGW/
	MH6K6tJXSf730OJJUAsmL1esZW6+iYIjlDSn1Gb0NBGikfEClqbPI8KDiECcHXFoLYIeGN
	RenGbSrvnINQqRQdV9GAd3eCOvFhYEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749022829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56cQPDkweYJVMIO8Oci9vsmGNfnHiTtULArO7sVXI0E=;
	b=UZIaHJ3RHQIdgYLYuU4/PIRCCWguUqwjEreL+bp2SSgkwji2YmH80JvHeYeKO8HT6ILLiv
	wndEVd0nFMHoSfDg==
Date: Wed, 4 Jun 2025 09:40:29 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v4 4/5] kdump: wait for DMA to finish when using CMA
Message-ID: <aD_4bT1AJv7aKhxy@dwarf.suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
 <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
 <da52a835-6a4b-4f11-acac-f4ef995da7e1@redhat.com>
 <aD8b7Q8Z9sC8meGU@dwarf.suse.cz>
 <d7cbbab2-8fe0-4a10-8b06-e47da955865e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7cbbab2-8fe0-4a10-8b06-e47da955865e@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Spam-Level: 

On Tue, Jun 03, 2025 at 06:25:57PM +0200, David Hildenbrand wrote:
> On 03.06.25 17:59, Jiri Bohac wrote:
> I'd phrase it more like "Pages residing in CMA areas can usually not get
> long-term pinned, so long-term pinning is typically not a concern. BUGs in
> the kernel might still lead to long-term pinning of such pages if everything
> goes wrong."

...

> > If you want, I have no problem changing this to:
> > +	mdelay(cma_dma_timeout_sec * 1000);
> 
> Probably good enough. Or just hard-code 10s and call it a day. :)

Thanks for your comments, David. This would be the v5 of this
patch:

Subject: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA

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

---
Changes since v4:
- reworded the paragraph about long-term pinning
- simplified crash_cma_clear_pending_dma()

---
Changes since v3:
- renamed CMA_DMA_TIMEOUT_SEC to CMA_DMA_TIMEOUT_MSEC, change delay to 10 seconds
- introduce a cma_dma_timeout_sec initialized to CMA_DMA_TIMEOUT_SEC
  to make the timeout trivially tunable if needed in the future

---
 include/linux/crash_core.h |  3 +++
 kernel/crash_core.c        | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

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
index 335b8425dd4b..540fd75a4a0d 100644
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
@@ -97,6 +103,14 @@ int kexec_crash_loaded(void)
 }
 EXPORT_SYMBOL_GPL(kexec_crash_loaded);
 
+static void crash_cma_clear_pending_dma(void)
+{
+	if (!crashk_cma_cnt)
+		return;
+
+	mdelay(cma_dma_timeout_sec * 1000);
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

