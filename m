Received: from out0-213.mail.aliyun.com (out0-213.mail.aliyun.com [140.205.0.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AEBA2D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743398283; cv=none; b=WmCYqyNTlLcov6TJbAbkv/f5KDgcUCVe/6gFDu3W9tX9M7XaeDOel8HsVjsTIOHlqfqiUrLSxEbMPFcAWy+VLD6o8Svah52NL5IKsMoYuI2279E7qqEctqcZ1Nbqm4vZ+nR6FuKEiYL3vrXZKBuh3TXNwSEs5gsxWj5eIfXrlPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743398283; c=relaxed/simple;
	bh=Q7qh74MIbDKunOnEWtjSwRnZkUE5A3WixCCJyPZwuoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBskkY4RhZCjCn41ByskteDfao5ezSCxzxTD2CyiOcJCc5HZCvwqF47pVDEOnLnbyTsk6cDetJKrhSSOWo3KtWWn2EFQAHB5FWeldekmg7BMeA9KgKhvkZlm1vy5x6ZVs4vc52MT+V7PwwX9p8Qs85EEzDLhYirKJiBt+IOKJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=VfYnkmNv; arc=none smtp.client-ip=140.205.0.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="VfYnkmNv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1743398271; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=2VIO12yr/eoZgbXnona64/WACIZvypX6zd7GDmmhW2I=;
	b=VfYnkmNvnmZ0XdMhFu7kfXs9jMCt+IdfJEfk2jqWEsybafAfEL2wvQ5vRlfD0nYYTrToaqEJg67IWTKbXPIyGPbHAKNhy9PPUkDf33xtHN/wtBYBXzGjJCJi/trvavPV/jaq/500xEPTXoq6wdg4o4hraUQhi6gjo6kvltQaVAk=
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.c8ZlJwh_1743397954 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 13:12:34 +0800
Date: Mon, 31 Mar 2025 13:12:34 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/3] mm/tlb: Fix wrong judgement in allocate_global_asid()
Message-ID: <20250331051234.GB88569@k08j02272.eu95sqa>
References: <cover.1743250122.git.houwenlong.hwl@antgroup.com>
 <b014aea15c01528ce30187e92d1de0df94e76af7.1743250122.git.houwenlong.hwl@antgroup.com>
 <df4f0ce855b7acd6fc9777457b89359e075a5cbb.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df4f0ce855b7acd6fc9777457b89359e075a5cbb.camel@surriel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Sun, Mar 30, 2025 at 01:33:44AM +0800, Rik van Riel wrote:
> On Sat, 2025-03-29 at 21:05 +0800, Hou Wenlong wrote:
> > In allocate_global_asid(), 'global_asid_available' cannot be zero, as
> > it
> > has already been checked in use_global_asid(). Therefore, the warning
> > in
> > allocate_global_asid() cannot be triggered; fix the wrong judgment in
> > allocate_global_asid().
> > 
> > Fixes: d504d1247e36 ("x86/mm: Add global ASID allocation helper
> > functions")
> > Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> 
> Good catch.
> 
> Reviewed-by: Rik van Riel <riel@surriel.com>
> 
> 
> Looking at allocate_global_asid() again, I wonder if
> that needs to be turned back into a loop.
> 
> What if we have no global asids available, and then
> an asid gets freed that is smaller than the value
> of last_global_asid?

Uh, I think this can be an easily triggered issue in the current code.
Moreover, reset_global_asid_space() is only called when 'last_global_asid'
is 'MAX_ASID_AVAILALBE-1', which means that free ASIDs are returned to
avaialable pool only in that case. So if the 'global_asid_used'
bitmap is full, but 'last_global_asid' is not 'MAX_ASID_AVIALBLE-1', the
allocation can fail as well. So I think the allocation may look like
this:
```
index 0f86c3140fdc..7f4bcb0e3d8c 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -312,17 +312,27 @@ static u16 allocate_global_asid(void)

        lockdep_assert_held(&global_asid_lock);

-       /* The previous allocation hit the edge of available address space */
-       if (last_global_asid >= MAX_ASID_AVAILABLE - 1)
-               reset_global_asid_space();
-
+       /* Search the range [last_global_asid, MAX_ASID_AVAILABLE-1]. */
        asid = find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE, last_global_asid);
-
-       if (asid >= MAX_ASID_AVAILABLE && global_asid_available) {
-               /* This should never happen. */
-               VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n",
-                               global_asid_available);
-               return 0;
+       if (asid >= MAX_ASID_AVAILABLE) {
+               /* Search the range [TLB_NR_DYN_ASIDS, last_global_asid-1]. */
+               asid = find_next_zero_bit(global_asid_used, last_global_asid, TLB_NR_DYN_ASIDS);
+               if (asid >= last_global_asid) {
+                       /*
+                        * The 'global_asid_used' bitmap is full, so merge the
+                        * 'global_asid_freed' bitmap and search from the
+                        * beginning again.
+                        */
+                       reset_global_asid_space();
+                       asid = find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE,
+                                                 last_global_asid);
+                       if (asid >= MAX_ASID_AVAILABLE && global_asid_available) {
+                               /* This should never happen. */
+                               VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n",
+                                               global_asid_available);
+                               return 0;
+                       }
+               }
        }
```

> -- 
> All Rights Reversed.
