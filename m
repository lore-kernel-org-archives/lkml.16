Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00C238177
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445511; cv=none; b=BRGPSEHhVnAA+fuFzZDVwRVXXMVcLiSPXRV56wsn9BAtLZUkXfa2AQwbchBgoQkPgb7OtIjYcBN4het/x9stE9LKq0x+nc0pIx80FVfXTDjXstjzUitxPydqnnHMrhJ0KHoSr6vN8HAg0P/dBi1AgFstqU6W4hl2BlDR96tIM1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445511; c=relaxed/simple;
	bh=Oy/Le5wYL1yuUCtebF6wEJ3ycGUPlWMtkoWzd9jO0c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuOmQ1wcDhTeFRYZrr68EEcgaQIxffXLe9iepfmP2eauySujQOljzbd5OStHjduYYQY8IAIAphzeAAIdjMFnR8vVUic/dCX3azqFxlYGgmxLobnraNbbCosn0fK+83Y3Rl3BBZwRi8HURkqEXhDYSGcmaPMdjcAFjrXErXq5frA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TRPqZnZa; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TRPqZnZa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tueLrdkmQRBHr+mzWg5Fwd6/tBSVji9XeraKb1hDY3o=; b=TRPqZnZaTglhLfGTKIh7tLPxoU
	+5a+hIYyCkhf8BSKkYrwSfTZhIRedv3uUNzhBK3my0gTD2jZ5iRfqu6otUzjFfgcGFEhVyE/ipveP
	tQQcfBQkHqRJWlBHogDTuURfwrTWLcHm1nIEihZ7ZFBAwk7geC24w6dhcwA1b5FhLSJ9t0xTgI9zP
	Rd/cX15emOuNXfA54zuGH7djZf5KDRYV7RznAp8J8RR+fzlve7CbSzDm5MvVHys+xri87ET50NbiU
	OO11Y0vL/XX+E3hsJrdEXgy9+BG6n+52ERJSDyfPZIGWz28UrHDWFDdkajIHsDWndJhC0LdmUEhRI
	TML4TwMg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsz5-00000007K29-0lEJ;
	Wed, 02 Jul 2025 08:38:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED2FA300125; Wed, 02 Jul 2025 10:38:25 +0200 (CEST)
Date: Wed, 2 Jul 2025 10:38:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH] objtool: Add missing endianess conversion when checking
 annations
Message-ID: <20250702083825.GM1613200@noisy.programming.kicks-ass.net>
References: <20250514133515.1829691-1-svens@linux.ibm.com>
 <yt9d1pqz6ll0.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yt9d1pqz6ll0.fsf@linux.ibm.com>

On Wed, Jul 02, 2025 at 10:30:51AM +0200, Sven Schnelle wrote:
> Sven Schnelle <svens@linux.ibm.com> writes:
> 
> > cross-compiling a kernel for x86 on s390 produces the following warning:
> >
> > drivers/mfd/mc13xxx-core.o: warning: objtool: mc13xxx_reg_rmw+0xc: Unknown annotation type: 50331648
> >
> > Fix this by adding the required endianess conversion.
> >
> > Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
> > Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
> > Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> > ---
> >  tools/objtool/check.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index b21b12ec88d9..35fb871b2c62 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -2316,7 +2316,7 @@ static int read_annotate(struct objtool_file *file,
> >  	}
> >  
> >  	for_each_reloc(sec->rsec, reloc) {
> > -		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
> > +		type = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4));
> >  
> >  		offset = reloc->sym->offset + reloc_addend(reloc);
> >  		insn = find_insn(file, reloc->sym->sec, offset);
> 
> Gentle ping?

Oh, I missed there were two of these. I merged this:

 https://lkml.kernel.org/r/175137563313.406.6298042704364318030.tip-bot2@tip-bot2


