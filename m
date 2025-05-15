Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD32193402
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308768; cv=none; b=Dr7Zp10cJ1DLNtyZZKrmit1ydqIsjT8pogaK2REZzTPPNZivFQ9MCmxXeY5FqEA54jeL6SfYIZFrvsmAh8bTo69eoj+UbRR3fj0DfT11UAOgyZa/Cyt4F/HPb69cVpRMcyXGLX96VLDpPV8KqgC/NRoBLxMa0Dmdpkq/qgHKxVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308768; c=relaxed/simple;
	bh=h7yXW5eUEUuPRPWiXCPJh096dbx6vh64+bt9w79poI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAzgijjjawblqSeCEWZ7N5YEddbILyzdW+imfWk+V+3ElavMO7qNmpuFMeATnIGNC/atOaNoBeXYlVRhjv1BDdtc31AcjqfV1/Ez/QTvbJQOrMlwVg7ICXi03JlAoIexl6W4DD9UIxzB1vwLcv4Gm/j5JVRUqFtKznispVxnmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiP6jdc8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiP6jdc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B8BC4CEE7;
	Thu, 15 May 2025 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747308767;
	bh=h7yXW5eUEUuPRPWiXCPJh096dbx6vh64+bt9w79poI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiP6jdc8rbWrZ4Jw2V56mdD1DpaSSTGdnbO7ZcTyMWw9/dKrPxES/UjGOzqWgb6+G
	 uHr2PGqzY1ZdD0JOjGc8A5UbFCzw7cEPBmJe2OfU6yBCTylGufRvIbKIkPdAHZ3kzO
	 PuT0S4cuWe0i/nZijWEXAo2w3Kpb7O7dSQ1CiRaumv9jAli1pXhcrmMJUETKGhdHNW
	 ph8Qi3dKvo+/5ux7daxjRASvkTVdXVtbJJPKjBBaDB07jMvu1b4D5tXsre2A3ncYBe
	 2zRqyn14Y/L46XhjrQxDafEIq3OQwlqnbCEeWNehZx1viEDF5vfDeV80gUedbAvDYm
	 QuhqVxHZXxvsQ==
Date: Thu, 15 May 2025 13:32:42 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 31/29] x86/boot/e820: Move index increments outside accessors
 in e820__update_table()
Message-ID: <aCXQ2mdVU_D4tFiS@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-18-mingo@kernel.org>
 <aAduCoINHUkFwIzR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAduCoINHUkFwIzR@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> On Mon, Apr 21, 2025 at 08:51:57PM +0200, Ingo Molnar wrote:
> 
> ...
> 
> > +	int idx;
> 
> > +	u32 idx, chg_idx, chg_nr;
> 
> What about sanitizing the type as well to be let's say unsigned int idx in all cases?

Not sure - I kind of like the brevity of 'u32' here, and it's also the 
type of the originating ABI interface.


> ...
> 
> > +			change_point[chg_idx]->addr	= entries[idx].addr;
> > +			change_point[chg_idx++]->entry	= &entries[idx];
> > +			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
> > +			change_point[chg_idx++]->entry	= &entries[idx];
> 
> Does GCC 15 not produce any warnings here? Linus recently complain on some code
> with index increment inside the accessor. Perhaps just
> 
> 			change_point[chg_idx]->entry	= &entries[idx];
> 			chg_idx++;
> 
> ?

Yeah, good point - patch attached.

Thanks,

	Ingo

===================================>
From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 15 May 2025 13:26:46 +0200
Subject: [PATCH] x86/boot/e820: Move index increments outside accessors in e820__update_table()

This kind of code:

	change_point[chg_idx++]->entry  = &entries[idx];

Can be a bit confusing to human readers, and GCC-15 started
warning about these patterns.

Move the index increment outside the accessor.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index aadc46f3d074..b758c0632d0c 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -421,9 +421,11 @@ __init int e820__update_table(struct e820_table *table)
 	for (idx = 0; idx < table->nr_entries; idx++)	{
 		if (entries[idx].size != 0) {
 			change_point[chg_idx]->addr	= entries[idx].addr;
-			change_point[chg_idx++]->entry	= &entries[idx];
+			change_point[chg_idx]->entry	= &entries[idx];
+			chg_idx++;
 			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
-			change_point[chg_idx++]->entry	= &entries[idx];
+			change_point[chg_idx]->entry	= &entries[idx];
+			chg_idx++;
 		}
 	}
 	chg_nr = chg_idx;
