Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3C165F01
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917013; cv=none; b=an4AL+Lkk4zaG4h9e18GMQ5MVy9acvYLEbeXnYQmnuN3v2UsrklfIPP6b4aj0sAzjEyFl7tweWgJfdTsmsZN89kgVf5DyvCzTCJfgFTKuP9l8o+oSN2Q+YvpfQn/YZAXPT+Yk+PGfUwZcpvjP6gbN+7Vyy8XaBFOVgT3uAl+rcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917013; c=relaxed/simple;
	bh=Q0G80Tmq5tq9GB3QKskSBR5as3YHNKy/TImPvNfo28U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnjSgf2yTy5WBfojxDOfrk1/dGeuDxpYDmCYxEz+lIBam1Zx3mmXKsmMr5tumqRI0jcberTxbjDfRVBWSHF11r1us73qytnAQlOntyIHuRhbow7kNjsInC0GDYEB/qDuMvO2kEunFzSQ0fuNUdtTcX4LVTm21i3L9BZIDJ1G8Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMjNeUz+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMjNeUz+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa286ea7e8so513800a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738917011; x=1739521811; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WcNq4IW6ynvt4XBAoYiudn0pAf8i1A5mggeWKw6ds34=;
        b=rMjNeUz+DizJETtDaNCS1MEofW116pL4ZmihgG6ojCACLq+CIP07el1HhBgG3iZmh6
         AAhq7g/5tX5H0Pm3q020rgJRHaMhOqDIOg/xc3PBjsmmv9iU4y110wroDVP5SOKh02le
         bSkMarysrHXLHQsZjvFgTlNtk4mzFEWWXc++J5oZ2nTk+WTam+EUPLjVdmOiL1KH7hGD
         zUwRb3zHkAW35XLMgRtDyAo/GADFvSfpoAR3OSrjn2+EOwuGhBOcB2azGoDlxEZaBMPl
         a78AAtrxDCtcGOTBK+sA2K2Eb1XoDjCNM9/OjSyQ5sv0t+g43KczlCtq5qvTBnUVC2Ga
         KbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917011; x=1739521811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcNq4IW6ynvt4XBAoYiudn0pAf8i1A5mggeWKw6ds34=;
        b=NO8RlvFn00Maft/TEZJAkQ0jyYLDef6LluvdI4hOWUG6vGgmI++TOasOqtt9i5UKFl
         eNZD4poX7zWUZn9C6W2gv8fahNAeBRgAs+yF1vBbWoso5u1nlRIcY2u81LfszvjOTxL2
         QLDO1YRvKkfrOc1MA5uSuaZHOhNqvBTMM1myrAyK+3vlzCj19+ehbvEHuhb/2jTSZQBW
         3cGZG0Z4DGlf54wNH0URrILJ6uR+KW/3KiEHCtb+60MnRDf5bPz64IljAXGocwqd4uZm
         x90C4xfUmLz0mC14iaI+jEjH58LWuakandppf71j/y9cikp1ofY4ch4Pn4eac791WmVZ
         eGag==
X-Forwarded-Encrypted: i=1; AJvYcCUEYJaIkKlIyOfQg9zzUsNlCJqueScBvvKTTqXyEVpcQCCs3qtDfL5pHdenppDa3QMGYhf/nI5JYbumXSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzweCm0N4PylfeKrbmSHOmnPct5QkupPTdnVTPKhu50itRPAeQ4
	2wgfv59Ws91L6ZFvoV7lPEctllNHmxTCkYu5blD32kFrcDgo03Us9RG7TJyyrdRDPB1SzrrAIFA
	lArQc9xapmgzfbidNCWUlkd4knaA7PrNWsKFL
X-Gm-Gg: ASbGncsfzZBoC0oueCTcT0j3F9ZW1uZ8l+XhvGpwidlVEnuiVgbUAL4FYMgD2fbSClI
	OjuQPzmHjBH6n3OxLq80r7yiX0e9xCO/YWada9Qzdi36jliwdu+Kyrdo2y3kfbnU8JF6GpeAtxR
	8DBxKDTeXATqDEHLNkd6qP8seakL6+
X-Google-Smtp-Source: AGHT+IGRVhl7HL1Qe0V8gg15Rc1nfgr7gEeZnWikYKcsqVJ+lQZ42vGUUG2gbBr8DqgQs2nF6/a4ShBWmtyPQ+wpMVw=
X-Received: by 2002:a17:90b:3596:b0:2ee:bf84:4fe8 with SMTP id
 98e67ed59e1d1-2fa243eaa37mr3426767a91.30.1738917010600; Fri, 07 Feb 2025
 00:30:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206175114.1974171-1-bvanassche@acm.org> <20250206175114.1974171-4-bvanassche@acm.org>
 <20250207035345.GA4920@lst.de>
In-Reply-To: <20250207035345.GA4920@lst.de>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Feb 2025 09:29:34 +0100
X-Gm-Features: AWEUYZksMIm2vU21HubXDDasVJTO9346k0ZmFZaNqm_EDni4Qmk7slk02COq-Po
Message-ID: <CANpmjNM_5dVaq8NatmTykGveUQGjWx2j4k8PQ92F=hSb+8NzAw@mail.gmail.com>
Subject: Re: [PATCH RFC 03/33] locking: Introduce <linux/thread_safety.h>
To: Christoph Hellwig <hch@lst.de>
Cc: Bart Van Assche <bvanassche@acm.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 04:53, Christoph Hellwig <hch@lst.de> wrote:
>
> > - a struct that represents a synchronization object is annotated with the
> >   CAPABILITY() attribute,
> > - the operations on that synchronization object are annotated with the
> >   ACQUIRE() and RELEASE() attributes,
> > - if variables or members that should be guarded by a synchronization
> >   object are annotated with GUARDED_BY(),
>
> Those are all nasty shouting names, without and good prefixing.
>
> But more importantly ACQUIRE() and RELEASE() seems to duplicate the
> existing __acquires/__releases annotations from sparse.  We really need
> to find away to unify them instead of duplicating the annotations.

This is exactly what my approach tries to do:
https://lore.kernel.org/all/20250206181711.1902989-1-elver@google.com/T/#u
(Make it work with the existing keywords and extend them.)
