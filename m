Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8F24B34
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745795268; cv=none; b=JEEbdmdv1hcJcgjD4Adh1/t7iNl1aK6kt3ibgHr9VvkpQlhyrr/FH1cc3xVVAS/cWGbo/IhVa0AHwGHRTeHf+vlq7enrBPv+VPB+SOSPGoepqcWwtrB1YBcVcx24Ndooyc8TyGWXQONevRh0Y/mNFphe0JFAL3Pz9P2hLf1O9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745795268; c=relaxed/simple;
	bh=tT1ToXBHwKrWkNCx4aAzO7gnt63zYs1WN6coWvYxIAs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=l9mnm0yfEsZTVlH12lEJrhv2yL3jKhGd3saMkAByzpoPX2oIQ7kSlyOywIRa2CvZD0eBRgwSBDas7xDrWLNI5cpD6wRLkhVUoB3KUUbLVvTmlJ5Q/dRUAF4NLWKO1ElKQD4QtPi/Qc7M1oeEuyzqvs+IFXCxw86fLrAERJItOl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lmomKp6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lmomKp6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C04DC4CEE3;
	Sun, 27 Apr 2025 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745795267;
	bh=tT1ToXBHwKrWkNCx4aAzO7gnt63zYs1WN6coWvYxIAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lmomKp6H+Z5yPVT9yORPYvCT+AEUZgKZQEVE44c1cE1vaJTgybO2JT9SQS63XTBBU
	 a05feXjoXxpbHDOtXEZUYWOLwzLO38mBm6eXCBLgKyy7IlhOH1vgkmG1QEC3/DPMAd
	 EQ902A6TjoVIMR4JUKWFjVKfO7GfT5r9XgeZ0obQ=
Date: Sun, 27 Apr 2025 16:07:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, "Sauerwein, David" <dssauerw@amazon.de>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand
 <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Ruihan Li
 <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-Id: <20250427160746.13040000164752386b936be8@linux-foundation.org>
In-Reply-To: <ac77c07ecda8805a5f942f5c71b3a2ef0f9183ce.camel@infradead.org>
References: <20250423133821.789413-1-dwmw2@infradead.org>
	<20250423133821.789413-8-dwmw2@infradead.org>
	<e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
	<20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
	<ac77c07ecda8805a5f942f5c71b3a2ef0f9183ce.camel@infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Apr 2025 09:30:50 +0100 David Woodhouse <dwmw2@infradead.org> wrote:

> On Fri, 2025-04-25 at 16:38 -0700, Andrew Morton wrote:
> > On Fri, 25 Apr 2025 17:11:10 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > 
> > > Andrew - can we drop this from mm-new? It's breaking it.
> > 
> > I almost did, but David seems to have a fix.
> > 
> > --- a/include/linux/mmzone.h~mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix
> 
> The symptoms only manifested when it got used in
> init_unavailable_range() but that's actually a fix for the sparsemem
> implementation of for_each_valid_pfn(), as David H surmised.
> 
> Please could the fix be folded into
> mm-implement-for_each_valid_pfn-for-config_sparsemem.patch ?

yep, that's why I named the patch file
"mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix.patch".
To tell myself to fold it into
mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range.patch.

> This is what it should look like with the fix:
> https://git.infradead.org/?p=users/dwmw2/linux.git;a=commitdiff;h=55bebbb093

We're good.

> If you want to keep the fix separate, then that's the patch that it
> fixes. Do you want a commit message? I'll certainly give you a proper
> SoB:
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

I already unauthorisedly added that so I don't get grumpygrams from
Stephen ;)

> Happy to resend the fixed series if it helps; it looks like you've
> already basically sorted it though?

THanks, it doesn't appear necessary at this time.
