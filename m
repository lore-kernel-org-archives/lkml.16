Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2CC191F7E;
	Mon, 16 Jun 2025 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057335; cv=pass; b=dU1qTExKRhIMPgGVyjWwA+BaE3SWdz6PG6PXUHcjf03UYwcD4SP6UTszEfAwsGDzxzRe8gCDuc8gZt5/jWIiMGZeDOvCJ2/HeQFJ9YQiqk+z5/6kl+p1IyEYE8en9gIET4MQlpTFFxGKRdqiLSa/u42s6Do9r16NhSp4iE4iDQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057335; c=relaxed/simple;
	bh=oEb7wU/bu1oja52oKmgMha7mtv8iISClgAa0+JK8RlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+ydmlMxPBKBrZnNxWj64pM6OUhG4xTsJSO/IVqoPIouJsueqHNxiDaeEotUbmxTv1PwrGWvy+3zj9WV2X7ZLNQex2kVeXe+Lxa/dwn3fZAVqKOkiexY0O7pYjvhj67hg8U3oNRBXkR1OL0fwRI7mztbxsVQBJa8QSE0m7jAliQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=IxQi+7T1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="IxQi+7T1"
ARC-Seal: i=1; a=rsa-sha256; t=1750057314; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jifj7LPMyfhtP30MtT1rMLT80HmtvAWL7dm8J4KTHjHv0ysl3gAQ2JJsye1U79ru0Ptyvm5+F9c0fE0g2ttioPbe+VSLnCipT5Ra++D1TvHI0PnaA1zMqYapDXAoxB78QCEFlwmI0/9Tq1MvOZYOsevhuv/KTBjOVNhT+H7Lv9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750057314; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w2oMih2lbo9iywrNmIQ7860yAhkMUGDVYCOSRkVl8HE=; 
	b=Xl6Z8aNSFfTb8gDV7YCiDulQeCZ4LdwI96+oaLlG0NMP3Mi6u7FGhX1Z/DFfHyRDJb6imFWelRXCPRFzWLM9Bta63b4n8Ys7OIbaYRwjz8k26pIjZdkJOoEDaZrwRcs62hRHyT5RmG/t52K+Rto5nJcuYLtxnSkrM1KTT1p+aSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750057314;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=w2oMih2lbo9iywrNmIQ7860yAhkMUGDVYCOSRkVl8HE=;
	b=IxQi+7T1vu3ihlP6vgZgo5YeXRZ1xjBpC9Gb25NI5BOcn+wqUVXT+L2oBykRhQJA
	BBkE1n6pOQHpPizZw7CG8aBOJVIee2SspJ+EEh4xOf/fcjCTlFKaUykFYEgpwEje0cy
	l6MPeRz7CejjG12vjWB8M7zT3+cmrpQNwWCMamDU=
Received: by mx.zohomail.com with SMTPS id 17500573121561008.1454058676544;
	Mon, 16 Jun 2025 00:01:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: document linked lists
Date: Mon, 16 Jun 2025 09:01:48 +0200
Message-ID: <4657048.LvFx2qVVIh@workhorse>
In-Reply-To: <87v7p48vd6.fsf@trenco.lwn.net>
References:
 <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
 <20250520-linked-list-docs-v1-2-db74f7449785@collabora.com>
 <87v7p48vd6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 9 June 2025 23:20:53 Central European Summer Time Jonathan Corbet wrote:
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> writes:
> 
> > The kernel contains various generic data structures that should ideally
> > not be reinvented. However, it often fails to document the usage of
> > these in the in-tree kernel documentation beyond just a listing of
> > header symbols in the very lengthy kernel-api docs page. This is fine
> > for things that have simple invocations, but occasionally things devolve
> > into several layers of concatenating macros, which are subpar for humans
> > to parse.
> >
> > Begin making a small impact by adding some rudimentary example-driven
> > documentation for the linked list type. It's far from exhaustive, as
> > many list modification functions are currently not mentioned. However,
> > it covers the basics and directs readers towards further documentation
> > should they be interested in concurrency.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  Documentation/core-api/index.rst |   1 +
> >  Documentation/core-api/list.rst  | 390 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 391 insertions(+)
> 
> So I'm only now getting around to a belated look at this.  I like it
> overall, but I do have a couple of comments:
> 
> - Is there any way to talk you into replacing all of the graphviz
>   diagrams with ascii art in literal blocks?  All the dot stuff makes
>   for pretty HTML, but is entirely unreadable for people looking at the
>   plain-text docs.

Yeah, the dot was more easily understood at one point but then I decided
I wanted to wrestle the layout and add backedges and then not make the
backedges look horrible. Now it's a mess. I think I can easily be
convinced to replace it with ASCII art in literal blocks. On that note,
I wonder if there is a tool to translate simple ASCII graphs into dot
and then whatever output from that, which would be the ideal solution
here to encode semantic meaning for both audiences.

I'll definitely drop the back edges from the diagrams though, they
only make things more confusing.

> 
> - All of the kerneldoc stuff for list.h is currently pulled into
>   kernel-api.rst.  Should we perhaps move it over here?

I think that's a good idea once the new documentation exhaustively
covers everything. Pulling it into both places generates warnings,
which is why I didn't do it for the functions I already did document.
And doing it only for some and not others needlessly spreads things
out across two pages, though maybe this is best dealt with having a
"dumping ground" in each section for other functions related to that
section, so that we have an exhaustive function listing even if no
usage examples are provided.

I will work on a v2 today which addresses your concerns, and expands
on the documentation to also include some list modification functions.

> 
> Thanks,
> 
> jon
> 

Kind regards,
Nicolas Frattaroli



