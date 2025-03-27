Received: from mta-64-136.flowmailer.net (mta-64-136.flowmailer.net [185.136.64.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DEE216399
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084401; cv=none; b=uMLvjEk8beBmq9PHx1ISvCjbd1c1PqBGkUfzadOefZfHJgOH4vhF/nRmQXGha27ghLJUkQGMEBwllMYUIGZe32LErnoGLT5dA2PqcOszT3r3RGPfgDPm7kuHOs/IwhDg1GK/x+Hf0iaYslwkA7iUl8eTmZjUCr9cS98R5ae0KQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084401; c=relaxed/simple;
	bh=QiQM3Ke3a5HaM7yD69OcmUzwddZc0OwQ/SAP3KnNP00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iKLXu/gZ0/09hhUrOWw8Q8+Hm6fX9s58zT3npv8Mjv1MfQZ12WyCuHypgt+oc4Y/pTrwtFI4FJPltahNsxFMzpl/pjgXvCLRjyfjFp3Ffk2a2Tcb9oKhLTqG8fj2LjgnQblgOZbcuO82PxGKOZELF9PmkZ9bucfSKKIeeNDTtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com; dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.b=Kl1Vb3SG; dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.b=PbU/WywD; arc=none smtp.client-ip=185.136.64.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.b="Kl1Vb3SG";
	dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.b="PbU/WywD"
Received: by mta-64-136.flowmailer.net with ESMTPSA id 20250327135626e1f5d2a07a0019fdb6
        for <linux-kernel@vger.kernel.org>;
        Thu, 27 Mar 2025 14:56:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=0y+vCEXObwRf14H2gu9bmDNRRkYqorvPJYhQByXDzmE=;
 b=Kl1Vb3SGk4HuJnqz7QVwtBtblzSkN/9AaGNm9BMdCc2gDdntAbobvqe9fN8ugL88cusQp7
 DYxNkUjCyQi4pjaNTqXi/w+WmWXxhvSFWv8QrMNpRfLeyqPvoIcbak0sb0UoO+gJl4nrGzS0
 lT3MG20Mxqzwag9/XArzkiovxqdn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm3;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=0y+vCEXObwRf14H2gu9bmDNRRkYqorvPJYhQByXDzmE=;
 b=PbU/WywDkwNtybokyqGnE9Hpc6WMX+XlKY3Wo2mrsLWYUI+RyP7wd/ETPCn9WxoGp7UNUu
 VFtXxHy67Dm7fj1sAY1BUA6mAlfDZRCOymsoCiGGfF7vOxuXtgqQ/jhA7TFgGtmZrLszv3Pf
 KO8KA73TsMLRUhVfqqu1hcT8sVgxqJ1hmGQZJF6HYZmRjtcDsSn6oTC6/50CV/quyGtmDu4v
 2+lAKYJn7XtNrJXiy9NzBMFoC4y2WVLVjrQNXVWz2PL3rF2OX56JV8nW0IhsGYr8/mwhk+dR
 sZN6j0Pn1Z0K38nzggOItTntirkObVo/yoD4hZ/om+JNb+PgSNQ2UQ8w==;
Date: Thu, 27 Mar 2025 14:56:24 +0100
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org,
	Simon Schuster <schuster.simon@siemens-energy.com>
Subject: [PATCH 2/2] nios2: do not introduce conflicting mappings when
 flushing tlb entries
Message-ID: 
 <fm-32642-20250327135626e1f5d2a07a0019fdb6-JTnh8c@errorhandling.siemens-energy.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fm-32642-2025032713472354f98643960019fd6d-cXH63M@errorhandling.siemens-energy.com>

The NIOS2 hardware does not support conflicting mappings for the same
virtual address (see Nios II Processor Reference Guide from 2023.08.28):

 "The operating system software is responsible for guaranteeing that
  multiple TLB entries do not map the same virtual address. The hardware
  behavior is undefined when multiple entries map the same virtual
  address."

When flushing tlb-entries, the kernel may violate this invariant for
virtual addresses related to PID 0 as flushing is currently implemented
by assigning physical address, pid and flags to 0.

A small example:

Before flushing TLB mappings for pid:0x42:
  dump tlb-entries for line=0xd (addr 000d0000):
  -- way:09 vpn:0x0006d000 phys:0x01145000 pid:0x00 flags:rw--c
  ...
  -- way:0d vpn:0x0006d000 phys:0x02020000 pid:0x42 flags:rw--c

After flushing TLB mappings for pid:0x42:
  dump tlb-entries for line=0xd (addr 000d0000):
  -- way:09 vpn:0x0006d000 phys:0x01145000 pid:0x00 flags:rw--c
  ...
  -- way:0d vpn:0x0006d000 phys:0x00000000 pid:0x00 flags:-----

As functions such as replace_tlb_one_pid operate on the assumption of
unique mappings, this can cause repeated pagefaults for a single
address that are not covered by the existing spurious pagefault handling.

This commit fixes this issue by keeping the pid field of the entries
when flushing. That way, no conflicting mappings are introduced as the
pair of <address,pid> is now kept unique:

Fixed example after flushing TLB mappings for pid:0x42:
  dump tlb-entries for line=0xd (addr 000d0000):
  -- way:09 vpn:0x0006d000 phys:0x01145000 pid:0x00 flags:rw--c
  ...
  -- way:0d vpn:0x0006d000 phys:0x00000000 pid:0x42 flags:-----

When flushing the complete tlb/initialising all entries, the way is
used as a substitute mmu pid value for the "invalid" entries.

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
---
 arch/nios2/mm/tlb.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/nios2/mm/tlb.c b/arch/nios2/mm/tlb.c
index f90ac35f05f3..a9cbe20f9e79 100644
--- a/arch/nios2/mm/tlb.c
+++ b/arch/nios2/mm/tlb.c
@@ -144,10 +144,11 @@ static void flush_tlb_one(unsigned long addr)
 		if (((pteaddr >> 2) & 0xfffff) != (addr >> PAGE_SHIFT))
 			continue;
 
+		tlbmisc = RDCTL(CTL_TLBMISC);
 		pr_debug("Flush entry by writing way=%dl pid=%ld\n",
-			 way, (pid_misc >> TLBMISC_PID_SHIFT));
+			 way, ((tlbmisc >> TLBMISC_PID_SHIFT) & TLBMISC_PID_MASK));
 
-		tlbmisc = TLBMISC_WE | (way << TLBMISC_WAY_SHIFT);
+		tlbmisc = TLBMISC_WE | (way << TLBMISC_WAY_SHIFT) | (tlbmisc & TLBMISC_PID);
 		WRCTL(CTL_TLBMISC, tlbmisc);
 		WRCTL(CTL_PTEADDR, pteaddr_invalid(addr));
 		WRCTL(CTL_TLBACC, 0);
@@ -237,7 +238,8 @@ void flush_tlb_pid(unsigned long mmu_pid)
 			if (pid != mmu_pid)
 				continue;
 
-			tlbmisc = TLBMISC_WE | (way << TLBMISC_WAY_SHIFT);
+			tlbmisc = TLBMISC_WE | (way << TLBMISC_WAY_SHIFT) |
+				  (pid << TLBMISC_PID_SHIFT);
 			WRCTL(CTL_TLBMISC, tlbmisc);
 			WRCTL(CTL_TLBACC, 0);
 		}
@@ -272,15 +274,17 @@ void flush_tlb_all(void)
 	/* remember pid/way until we return */
 	get_misc_and_pid(&org_misc, &pid_misc);
 
-	/* Start at way 0, way is auto-incremented after each TLBACC write */
-	WRCTL(CTL_TLBMISC, TLBMISC_WE);
-
 	/* Map each TLB entry to physcal address 0 with no-access and a
 	   bad ptbase */
 	for (line = 0; line < cpuinfo.tlb_num_lines; line++) {
 		WRCTL(CTL_PTEADDR, pteaddr_invalid(addr));
-		for (way = 0; way < cpuinfo.tlb_num_ways; way++)
+		for (way = 0; way < cpuinfo.tlb_num_ways; way++) {
+			// Code such as replace_tlb_one_pid assumes that no duplicate entries exist
+			// for a single address across ways, so also use way as a dummy PID
+			WRCTL(CTL_TLBMISC, TLBMISC_WE | (way << TLBMISC_WAY_SHIFT) |
+					   (way << TLBMISC_PID_SHIFT));
 			WRCTL(CTL_TLBACC, 0);
+		}
 
 		addr += PAGE_SIZE;
 	}
-- 
2.39.5

