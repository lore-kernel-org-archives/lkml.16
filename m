Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DD2BCF51
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574098; cv=none; b=SOTZsYfnGXefkD7/5FCVeJf/hnQVr4lFUwBTBemnHx1taTMyFXsAemLZ86dBQ3cKJK9uq8WgnRIp0ztdNG7AdU8FzSYX+lhpn6PbL93JW+MvB+FWqT+9cfGox8j+9lqZMxDrtohTFtgBE1uynFlSpg97VZIL5Ahk7rDk+B0qX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574098; c=relaxed/simple;
	bh=pyS7Y6GIrPU10d/ryQJM3Wqvm4C9Tt6BQzqo0p89Cyk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BOHHI/d7HNVxcr4JVGrt/gLvlCwOCjLSjVp/I8gUn1DZlcV0JRfEHDUtHX/rg4bhyB7ws61Mt7JFCkpdTWaCaP7bciuGqWKhdmQnJYgtmXIdkgH9rXAMxBbIj99mlTHqoUBcSwv/ougw8Xv4MC7nS6XsESP1kOYzCymHfkGty3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zx4FMsX4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4qoKC9bm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zx4FMsX4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4qoKC9bm"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751574092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSp3/iXHDvBtL6PbWGs8D+kj6lt5OBJlh2r7j0tPdGE=;
	b=Zx4FMsX4jXEQ1xo270ycn9VnZ07F8ww81sc1+SzvfjAzVum7GL8LueoXr2H6qRQhlQwp/0
	UNnwMoOQ7PxBcD/e0/SqBe1QVcjQEtcTtJpBuiUwcdRJBC6PqcAh061MdFO+ZLpNtU+CRs
	x3K9ge9VM0BNDxDOJR2K3Y67zD9NvvqdhdFRpWPUfgfqFFo/23Ad7P99V+hQ87sqoKlOUH
	IQFdQzv6F5PbpNqx8lkZC2r499PMOPTU/Nq9xFe0JwFHTd0dw520spimbv/m8zReU74V9o
	wi1mfPdHaf7xk6W9k+XhfMnKtTqOhXA+F9ukzpp7J1g5nCzIU8ABR8KVSe0O8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751574092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSp3/iXHDvBtL6PbWGs8D+kj6lt5OBJlh2r7j0tPdGE=;
	b=4qoKC9bmn1Nf+GqK8v3tvWutfgG00IqGFI7x8lyHJGzEP1bHjMhgVffpKBNUCFUZX7PeHW
	l7hGh0HuHzF5O5BQ==
To: Himanshu Madhani <himanshu.madhani@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
In-Reply-To: <7279DC28-17BF-4A28-96ED-7AE9857BC2E3@oracle.com>
References: <ABB1DAF0-048A-4373-9007-988D20F359DD@oracle.com>
 <7279DC28-17BF-4A28-96ED-7AE9857BC2E3@oracle.com>
Date: Thu, 03 Jul 2025 22:21:31 +0200
Message-ID: <87a55lt48k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 03 2025 at 18:32, Himanshu Madhani wrote:
> On Jul 3, 2025, at 11:27, Himanshu Madhani <himanshu.madhani@oracle.com> wrote:
> Git-bisect point to this merge commit
>
> commit 6376c0770656f3bdf7f411faf068371b6932aeca
> Merge: 5e8bbb2caa4e 29857e6f4e30
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Tue May 27 09:01:26 2025 -0700
>
>    Merge tag 'timers-clocksource-2025-05-25' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>
>    Pull clocksource updates from Thomas Gleixner:
>     "Updates for clocksource/clockevent drivers:
>
>       - The final conversion of text formatted device tree binding to
>         schemas
>
>       - A new driver fot the System Timer Module on S32G NXP SoCs
>
>       - A new driver fot the Econet HPT timer
>
>       - The usual improvements and device tree binding updates"

That obviously does not make sense, so your bisect got side ways.

> Following further in this commit, I only see this following series
> that had changes which may or may not be related to hang.
>
> https://lore.kernel.org/all/20250429065337.117370076@linutronix.de/

They are not. There is a hint in both backtraces:

> [  514.305717]  schedule_preempt_disabled+0x15/0x30
> [  514.360954]  __mutex_lock.constprop.0+0x4be/0x8a0
> [  514.417232]  msi_domain_get_virq+0xcc/0x110
> [  514.467279]  pci_msix_write_tph_tag+0x3c/0x100

and

> [  525.930478]  schedule_preempt_disabled+0x15/0x30
> [  525.985718]  __mutex_lock.constprop.0+0x4be/0x8a0
> [  526.041993]  msi_domain_get_virq+0xcc/0x110
> [  526.092031]  pci_msix_write_tph_tag+0x3c/0x100

pci_msix_write_tph_tag() is the function which ends up trying to lock
the mutex and gets stuck. This function was introduced with commit

  d5124a9957b2 ("PCI/MSI: Provide a sane mechanism for TPH")

and the subsequent commit

  71296eae5887 ("PCI/TPH: Replace the broken MSI-X control word update")

flipped the TPH code over to use that.

The problem is obvious and if you would have enabled
CONFIG_PROVE_LOCKING then you would have got the reason presented on a
silver tablet in dmesg. I encourage you to do so nevertheless.

I definitely screwed that one up in the most stupid way.

As I had no idea how to exercise that code path I did not test it. It
seems this code is not really tested by any of the CI stuff either
before it hits Linus tree and as some folks start testing only post rc1
it takes some time to surface :( 

The fix is as obvious as the problem. See uncompiled and untested patch
below. If it solves the problem, which it should, feel free to take it
and create a proper patch with changelog and Fixes tag yourself (Adding
Suggested-by: Thomas ... is good enough). Otherwise let me know, and I
take care of it in my copious spare time :)

Thanks,

        tglx
---
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 6ede55a7c5e6..eb26f3816922 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -934,10 +934,11 @@ int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u16 tag)
 	if (!pdev->msix_enabled)
 		return -ENXIO;
 
-	guard(msi_descs_lock)(&pdev->dev);
 	virq = msi_get_virq(&pdev->dev, index);
 	if (!virq)
 		return -ENXIO;
+
+	guard(msi_descs_lock)(&pdev->dev);
 	/*
 	 * This is a horrible hack, but short of implementing a PCI
 	 * specific interrupt chip callback and a huge pile of
