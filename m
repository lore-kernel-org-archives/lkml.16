Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426F29C351;
	Thu,  3 Jul 2025 22:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581757; cv=none; b=ggEhS2HtDNdcqhFTnCLqY1iagsBtWtoZ1RTC4SVuLX3bC1Ch7GqW+VWhTKcsRmsKiHWT1cFkgNp4pq5Jy6v9Tgn5BeemZEqLYzBcEPGql4H17kmShP/L5AuBRBEjUNCJT1A+9crHF/UbIeQOAvvMhSsX7jfxpcjQQ+e0dVqJ5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581757; c=relaxed/simple;
	bh=KG/xX9bya8lwgakjA1rYvT7ciNyxTZH4eiJUApOm8og=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aicw3mOpt653fk1xXQpbYP+d+kRJH3m2G0adMoMZBjNp6a+yQT78ajczkqmOgAlgn3SQm2f1A+NHy2OwcyJ4c/rPH4G3do/EspYbOABuUG/FgTI1UoV6mYiM21E1ZYo3eXXnjsdoh9tFNH9+vniejA37FxZCPUt65S/w8/1RbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUIY1Ghs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUIY1Ghs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E633EC4CEE3;
	Thu,  3 Jul 2025 22:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751581757;
	bh=KG/xX9bya8lwgakjA1rYvT7ciNyxTZH4eiJUApOm8og=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LUIY1GhsLqdNfhyUnSs5yrzXMitmiCeabCJ4CLM2w7s14SNOwQDOEXWtx/TjrUymg
	 WqabMDemAtfZ3WaGwraTU1rwsIwGjXUegXzmudqvgQVK7dhM+JjizJr1OUrlpauos3
	 5NFPyvZ2+riCVRubpduvKIJ3MesQrvPP5EAbswqqt2oFGKbUb4CYWKy4iEPJhImXM6
	 UYUmneR/f9pZf3KI5n7vnnHwVk0pGzBssQHMmfJUTT+95qsQSxAUGoblR+UgtkROpL
	 ns1mqM7DZeMQFLfMt6bN3bGFQL/guX2UPBdhKDnAt3nzkpUaUlVuXsCElGNej2nJwM
	 aXtIcyKrVg55w==
Date: Fri, 4 Jul 2025 00:29:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 7/7] docs: kdoc: pretty up dump_enum()
Message-ID: <20250704002913.13ce8fcf@foz.lan>
In-Reply-To: <874ivtkuk9.fsf@trenco.lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-8-corbet@lwn.net>
	<20250703175731.1a4871e3@sal.lan>
	<874ivtkuk9.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 03 Jul 2025 12:17:42 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Tue,  1 Jul 2025 14:57:30 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >>                  self.emit_msg(ln,
> >> -                              f"expecting prototype for enum {self.entry.identifier}. Prototype was for enum {declaration_name} instead")
> >> +                              f"expecting prototype for enum {self.entry.identifier}. "
> >> +                              f"Prototype was for enum {declaration_name} instead")  
> >
> > Even being a big one, my personal preference would be to break the long
> > string here, as keeping together is easier for grep, but yeah, I also
> > considered breaking it ;-)  
> 
> Did you mean your preference would be to *not* break it?

What I meant is that I was in doubt myself of breaking long lines or
not... I opted to not break.

Yet, if you feel it looks better breaking it, go for it ;-)

> There's a non-greppable piece at the break point anyway, so I wasn't
> anticipating making life harder for anybody there.
> 
> Thanks,
> 
> jon



Thanks,
Mauro
