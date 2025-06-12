Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55A235076
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723524; cv=none; b=X0k1mdiwaMeSQeKMWeAcOdMsUxgaTpG4iYLJHDCR4eUWDI9qi339QuJfDYQrrZJH3De5ZpgRg1KxyLf5CL/rLHFBQdMUaJd2OEOoTliTStKXFZxnjEd6TNgtjjV1SbmPHH6Jer9vjbokyrJhIl29svFT22uzSZeXY8dJwaycWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723524; c=relaxed/simple;
	bh=cHxGZ4oCqEP6ZY34NFekAOLYkHp3zwwYssV0hJQJZJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9BLTlhuQd13Yb7pqeuX15gHADkqj/UD2zEo5ozD3WDivaP9PJ1YvUPj/tU56YYdYR7vn6/IdqRBUvaHbdxFPne8eGsxRlDBtvpdeGoa16J98i9iUTuo0tt6PmYRROO6Qokzu/39LiVseOhg6MYjmZQk0DV4W8Lf2HoEpCmJADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mfEWIO+9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9EssITg4; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mfEWIO+9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9EssITg4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mfEWIO+9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9EssITg4";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mfEWIO+9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9EssITg4"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id 067EC1F78E;
	Thu, 12 Jun 2025 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=mfEWIO+9pRR0fr0UwJ3AOpdjt1kF+uz0K1plh8Jz1EHciLtpqsgUiQseZCBybDOCfn7Jzj
	WO1C6wD2qw6Vv3wMCAoIAYdItCQb1frYIm/WTfAHu8H3zFfkJ8XEnbSvM55vz8JtLhmBoD
	Y2KytekB7lT6K9vQhxY6DEQUEX/yV7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=9EssITg47xLzey9iQ1XkMQueuhMaePHLbiI2cZ7JS6Btg1f01FbPOIoYKNS+kOnci/jh3c
	K2zzUVuwSqOR+sDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749723521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=mfEWIO+9pRR0fr0UwJ3AOpdjt1kF+uz0K1plh8Jz1EHciLtpqsgUiQseZCBybDOCfn7Jzj
	WO1C6wD2qw6Vv3wMCAoIAYdItCQb1frYIm/WTfAHu8H3zFfkJ8XEnbSvM55vz8JtLhmBoD
	Y2KytekB7lT6K9vQhxY6DEQUEX/yV7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749723521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sbQj5PaZtpmNrKn+KyxsA3+QUNkgR2OaWn0POMIpmM=;
	b=9EssITg47xLzey9iQ1XkMQueuhMaePHLbiI2cZ7JS6Btg1f01FbPOIoYKNS+kOnci/jh3c
	K2zzUVuwSqOR+sDg==
Date: Thu, 12 Jun 2025 12:18:40 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	akpm@linux-foundation.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA
Message-ID: <aEqpgDIBndZ5LXSo@dwarf.suse.cz>
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


