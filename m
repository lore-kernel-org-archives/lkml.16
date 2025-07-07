Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6AFAD21;
	Mon,  7 Jul 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891459; cv=pass; b=olEKUB9B5UfNvkmxaNXPvDh/py1Xdo+Ido3IyGQQv/40KdHNTehA60l10Sh1dYgX443wbs07bKpjnhhlXIg2Yr+wFjDtxFpg6ViLJ+rRJe0H9dwSCBN1ewd0KSuQ7vVkK4LXBGmSX9iGPMXV46CpZRjYUmKHweI/OkmXprZrrVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891459; c=relaxed/simple;
	bh=mrX151EJF7Pcl37M7XXhv1rCHMoq0+4T4pL6rb4tY4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKla8fw/LmDDihv5QCIFtx4pZN+abqUJhjcqNEAC75KgIcxnAbKpzakLXw+LnT5huFqg/wzXZB5j9DMbUa61H22Z1O0Eoh5OiSArIaJhjgW13A/SN7qdWDnY4xidKNR+r4B7qPnB8kn2Lsh8OQ0VgsGpUHM1XGyVedCvQA3+rX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=JADAi+vt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="JADAi+vt"
ARC-Seal: i=1; a=rsa-sha256; t=1751891423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=guxRtBBaoBOEbe2mv519AShg7WTGKpai/GyzQOpPeKEsp86SflGgsZPw5MLFV9ymNrAVdvxujmsEPkbH+3v3ashCOAsaWRhUxfcNBpU/+SYWaGwobEpeJxTkGvhQ6UwNgUV4RRB+f2mjaeEdYl2WFz74F18SWNOq1B5nycNtwPA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751891423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hb6TrggivYkthnZKYMQ9PhC1kEPhFxpQeSRzkBBHQEA=; 
	b=U36TrsD4eINCTFoWjiQbKwGX8xiddAAgrsQv9DEm7kr40VK5RED1blR2aCsFpH0DN2ODJ+QDbQ3aFmAuHfBoTrcsN76XmvUy7vu36C1A0IrodxgStHQj3Dscm9Ym0wAve+Rrgn7AZdDjpOQns0tydxYpqMpGt99LHG0957B8QQA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751891423;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Hb6TrggivYkthnZKYMQ9PhC1kEPhFxpQeSRzkBBHQEA=;
	b=JADAi+vt3MiH5E9UlXPBZri8ivvFMgidymfePSPtrA/1/z0O8gMJy1zsvbixTdJS
	cad+XfO9xMhL3f7WS8IERNGyh6DEKfQhhhdYRGNmzqqi52dCpVXVIlL8LB/cucdRLgb
	l+Xa1TULSKpav/KTj/fTi31YcwmGmTCK17kco9b8=
Received: by mx.zohomail.com with SMTPS id 1751891419333639.0502213968841;
	Mon, 7 Jul 2025 05:30:19 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 kernel@collabora.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: document linked lists
Date: Mon, 07 Jul 2025 14:30:15 +0200
Message-ID: <2391623.ElGaqSPkdT@workhorse>
In-Reply-To: <20250707101156.2cc84294@pumpkin>
References:
 <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <20250707101156.2cc84294@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 7 July 2025 11:11:56 Central European Summer Time David Laight wrote:
> On Wed, 02 Jul 2025 22:24:47 +0200
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
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
> > documentation for the linked list functions. Many aspects are covered,
> > though it is not an exhaustive listing of the entire set of list
> > operations. We also direct readers towards further documentation should
> > they be interested in concurrency.
> >
> 
> Jeepers; TLDR.
> I don't think the kernel docs are a place to explain linked lists.

That is not what this is doing. In fact, the very first paragraph
of the documentation page that was too long for you to read does
explain this. What are you trying to achieve with this response?

> What may be relevant is a description of the types of linked list
> the kernel uses.

That is what this is.

> For that you pretty much only need a picture of the head and two
> items showing both the forward and backward pointers.

No you don't, that does not explain the operations on them. The way
the kernel embeds nodes as struct members to then do a container_of
on is not obvious to many, as is evidenced by there existing out-of-
tree documentation explaining this very fact. The way this interacts
with how these list operations are called is worth documenting.

> Then a list of the valid operations for that list type.

Function names are not self-explanatory. That lists are circular and
how that can break traversal after list modifications is not immediately
evident.

> What you can (efficiently) do with a list depends very much on how
> it is constructed.

No. O-notation was invented for a reason. There is no way in which you
can construct a list to make it not a linear search, even if you sort
it.

> 
> Then repeat for hlist and hlist_nulls - I think they are the other
> main list types.
> 

hlist literally just lacks a single pointer in the head, it does not
differ from the kernel's doubly linked list in any meaningful way,
and would be an actual TL;DR.

> IIRC 'LIST' is a double-linked list through a dummy item.
> Not my favourite list type and can cause the sanitisers grief.

I don't see how your opinion on the datastructure is relevant here.

> 
> 	David
> 


