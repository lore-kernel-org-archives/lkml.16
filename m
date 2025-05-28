Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DD51E884
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433621; cv=none; b=sm5BUeWdrIC/vup+4TWuOOTulrdfVAkZVwmzXL9WDBAx+FwgTHFaJcCeZ1viKz954+onc9lP/DJizy8+cJ1xRVCnzSzbSriUsSy16Y7dRNWgY23mj8elhWGoUuTI3CqF2WKNqJ9gjzxcMktNPnfUZJbIft589nfzxXOK7y8K6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433621; c=relaxed/simple;
	bh=6atfnO6Hqh06X691eUuocyP2yjAR5z9W7QDo8CWRkJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g29MtmY4hGYoGZ9pvUJXcVFaeJnpRWy6GceZPThKkx8R98LWfOV9ZSxkd00AXqFf7kJWgtmkZLPQ4nXWk8RaQRqu/H6FggNH5f/MR45hN7lE3Zk5TOMh0/J+kh1vVy0kvTOAGTkA3RQsXPL43H72MsIHUaDqDhVVheo2j9fbA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RI3UpINf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RI3UpINf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748433618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7GOEzgV5yycdin9ndY2/7BcE8zwy+mJsf09IHsECj8=;
	b=RI3UpINfbxfJN4/9PIuP/NZrlq7FrFCjHJ4p3KkKaX4dG4YuAvjFkM8qu1ooX8nNfxGpO4
	0Kf/ZkhbBju4ujDZWVpfblK2UBwaHrpkiOtkBryN8cSu717bfg3ACzpGdIfMsA8lHgOfI2
	OyRER8cgT6rAbZk7DS8XEoSrvMB7pFw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-pjCT-GQlMhKmpgH2T3-foQ-1; Wed, 28 May 2025 08:00:16 -0400
X-MC-Unique: pjCT-GQlMhKmpgH2T3-foQ-1
X-Mimecast-MFC-AGG-ID: pjCT-GQlMhKmpgH2T3-foQ_1748433614
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32a6e663a38so9542021fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748433614; x=1749038414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7GOEzgV5yycdin9ndY2/7BcE8zwy+mJsf09IHsECj8=;
        b=fX2pZVH0fxWlzpzDVOKcFBW2CmZ+Wia4qvJ2/yW0JmgkUnniAYIIEjOOjTX/KM7v4K
         MD/UZasGJeqpbQJGLvB92pKXURT+XEo/vVkVkFg96zqUMOA1ZOm0l2SQx2BRF9dLPPI0
         1J3inOiVkNta2pOpghQ55X6N4rbHhzxi0/EUBqwmjba/KrQRcIvomykzqbS5F0cautSi
         8sso4q/XTxwfQ4PcCg+BVpanqjnNC2pmnlvD5snhSH4KldcYjnAD05hF97CX6IfZZSG0
         pW7G55779AA+x515dxRFAk9ckty0+UWKQ7O4whdtpkbFCkI2wdhI4xbVYkrpe30SXw20
         iw0w==
X-Forwarded-Encrypted: i=1; AJvYcCUYlOnj6asA/c5cqS/0ZQVaJEzRh285swI5WvWaojtU/fv1KhgYXNLz1pd/sFjg6vXjwamauKZgfOUsTvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2rY93GXoL++DEcBkBuv3343ejeEmSVazlnXLST4aLHI7WkaK
	KsAJrH5/UTRor7TlKC5yz4OD6s4H4zL4QFuqnFKq0RXwAIVG6f+WFkZtRD74bjvZrDi19f0n2KQ
	6G8eCe+8FHCmpsBYjJLH6dEqzkXZglmuMJv6YdX6qLPZWelAO6hsdac/I4Q9xJzufQn78psLKgs
	Psf+hvKwUVK3Qnn0dt4Ch/y/yyNksEbSkVbS23EEOQ
X-Gm-Gg: ASbGncvL6t4tHxIGRyxWnamSitLtU6PEbsAQwO5+U/z9jFnvbrr29RGTg516cFLj2pQ
	IaXopYFvbQ9qQuQ9GdGT+8vZrbRgmp5U27vBZ3HBF/ODHu7MDHTs0QXUib4SfZfKcdfUEUf7w4u
	A2ipHfCqs9LZ6LtJxy0FHkxnesg8k=
X-Received: by 2002:a05:651c:543:b0:32a:77a3:877f with SMTP id 38308e7fff4ca-32a77a389c4mr8227531fa.2.1748433614329;
        Wed, 28 May 2025 05:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELaCLp5rNiD906NUGLnDvsVyzeESiJg149LhNzGAv/p0TZF497/9wv294JB6S4cCOFVPaMciiSxr2OriNU8+E=
X-Received: by 2002:a05:651c:543:b0:32a:77a3:877f with SMTP id
 38308e7fff4ca-32a77a389c4mr8227341fa.2.1748433613880; Wed, 28 May 2025
 05:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522052453.GA42746@system.software.com> <20250522052806.GB42746@system.software.com>
 <CAK-6q+hOCq8aksDp33utOGwfFngnTbJo-mY3+FiCJVPzwP-xsg@mail.gmail.com>
In-Reply-To: <CAK-6q+hOCq8aksDp33utOGwfFngnTbJo-mY3+FiCJVPzwP-xsg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 28 May 2025 08:00:02 -0400
X-Gm-Features: AX0GCFupcETx_3BXB8FtYUP8-a43n8SHBf9scY74BCrwjEMZFktfd2ES7qLyX0Q
Message-ID: <CAK-6q+j3QJCB6XERbJfEkvro=Kucq0PQHrCyrZ+LxDq5yHx+=g@mail.gmail.com>
Subject: Re: [RFC] DEPT(DEPendency Tracker) with DLM(Distributed Lock Manager)
To: Byungchul Park <byungchul@sk.com>
Cc: kernel_team@skhynix.com, linux-kernel@vger.kernel.org, 
	gfs2 <gfs2@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 25, 2025 at 8:13=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> Hi,
>
> On Thu, May 22, 2025 at 1:28=E2=80=AFAM Byungchul Park <byungchul@sk.com>=
 wrote:
> >
> > On Thu, May 22, 2025 at 02:24:53PM +0900, Byungchul Park wrote:
> > > Hi Alexander,
> > >
> > > We briefly talked about dept with DLM in an external channel.  Howeve=
r,
> > > it'd be great to discuss what to aim and how to make it in more detai=
l,
> > > in this mailing list.
> > >
> > > It's worth noting that dept doesn't track dependencies beyond differe=
nt
> > > contexts to avoid adding false dependencies by any chance, which mean=
s
> > > though dept checks the dependency sanity *globally*, when it comes to
> > > creating dependencies, it happens only within e.g. each single system
> > > call context, each single irq context, each worker context, and so on=
,
> > > with its unique context id assigned to each independent context.
> > >
> > > In order for dept to work on DLM, we need a way to assign a unique
> > > context id to each interesting context in DLM's point of view, and le=
t
> > > dept know the id.  Once making it done, I think dept can work on DLM
> > > perfectly.
> >
> > Plus, we need a way to share the global dependency graph used by dept
> > between nodes too.
> >
>
> Having everything simulated and having nodes separated as
> net-namespaces in one Linux kernel instance is I think at first
> simpler to do and will show the "proof of concepts".
> Sharing data between nodes is then just some memory area that is not
> separated by per "struct net" context.

Alternatively the master node of the lock (this node knows everything
about the lock operations being done including the nodes that are
waiting to get the lock granted) can be used to detect cycles, we
already do that for some simple cases when converting locks directly
[0]. Maybe this is already enough to have all the information, but it
is not just a "wait_event()" mechanism, there needs to be some other
API to use DEPT for this case?

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lock.c?h=3Dv6.15#n2163

