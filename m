Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395228541F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550614; cv=none; b=eZThFoDWQhXmWwxFUaae8T0uDOT7e6qjnH40RXcbdsoNErikXvuTnouMrXfrAutF94FxCFn/6Sah9qvGHYcuVhrF9/HdJOHRESJbEEYruBOeGAjsh0P/jRzyQrGs9PWUX+suqwFB3mVQeFtIJAkwhAPWMQlG+kGnx+AdGWiDix8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550614; c=relaxed/simple;
	bh=UPskQvYkrxUpUKSU6eggRkM0kZhs49ZXn1vsmfjc6oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF6qQ4UiwgrkP33ES/EXLYZ90RKo3Lsp70udVcA2/c7UzAu0dpa4STDlSo7NzjaBDH7KP6qzPApwOMtyTVPbEgDtA4B6jVOyc7To6IfU7QKxXB2lNwRBbdohXjcQvu4Rlq9OIqNapF41tNOybeXKEqJlBs2g6odr+eKvlfd3kqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MyKuLXmp; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MyKuLXmp"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4033c70577fso2919159b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746550611; x=1747155411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q5nunoDVPugDexOGX8IwjfNJm1uYPE1x3M/IebA2LI=;
        b=MyKuLXmp1f+PAZE6g23DeYb95coDdQN6l2lBVaoSVI12dJvCjyNayW1Hv67aZgqdB9
         87zYSHrIIgNdf3ghPUyTbkNR6xpQ1Nte5rBohb3C+DkgrBrdI/lwJ8EkvvvKgOnOP2ml
         d1aYqK58+rePsfgDcTukJFaqiHLH7BicyxgMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550611; x=1747155411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q5nunoDVPugDexOGX8IwjfNJm1uYPE1x3M/IebA2LI=;
        b=Z2XFczKW78lsmvdes5HOkHcMRTwPw1dGCZ2ymNqcWVNXncGnQG5PI/FlRTpylHO4zr
         hs2XyOWtK/if9bZfKfvO5Dai0tMCG9nOYrc578A56MCERcZhN3eASwU2nlxrzXr8TKrw
         8eIAmOzSPI+1Hdq90wC3TZ0H/IpS1tcKVOEmMCOLKFigTXGNN+rpayQmhHTZaG1pIAQ4
         53r1efnJC37ejhNm+7LbPtouInSqDcsyggvZLFwByWerA8ASMAxM6RJNFlbiIvqQErl6
         qAMuBkNxR0opmfsukU+LX1YACvkBKNG8oVrHHTY0spzNWr8QErtILS4pGqhkRZ5aLjff
         LSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUzV5G2MrQAYa/ND28JYwBcp2pillmsNeCeZ/GiWL51DPysetrzRxnO8GhNHpRt2h6h1Y8NUP+kwBRAok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3YvVPvqNqte+8iv3YbqSQJIdfn0aJ1ya5s+VvyhwZWaqtz0Hv
	muJzxyEK9Mltub/Wxpp8wWoSHMA2KaUNSv4SW2gK/FrDhqofgFVAjjRFwJWtbNyaC9sEOKaPdrE
	YBC2x9zX8Ux0R55NAvHCSGCkeY1qyKr+cHM2aOddliasBcQon
X-Gm-Gg: ASbGncs2lS0W9zd1geNw3oPBNQBmQ/vYjgkkQ/ViK6wBjTfWywnhhXytdiszdlm2qQ8
	mtUa7lNTrVoIyVmfaONMa9i9lnEt4gDUy9eS9PeX+E4QUh978EJkJ/jtowv1n/elodvW45RhAPy
	RSNxAilngn0YiHXjf6y6Q=
X-Google-Smtp-Source: AGHT+IGJjJepn0gOwuwpfhMDAKJN4TqWIaIZ7UsEzwpTg1tX++SC/L4yjFUv3kDEAUslSG6hvBlXPYOAhZxrMKo+VF4=
X-Received: by 2002:ac8:7e96:0:b0:476:77ba:f7 with SMTP id d75a77b69052e-48e012633afmr162547871cf.34.1746550601068;
 Tue, 06 May 2025 09:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421013346.32530-1-john@groves.net> <20250421013346.32530-14-john@groves.net>
 <nedxmpb7fnovsgbp2nu6y3cpvduop775jw6leywmmervdrenbn@kp6xy2sm4gxr>
 <20250424143848.GN25700@frogsfrogsfrogs> <5rwwzsya6f7dkf4de2uje2b3f6fxewrcl4nv5ba6jh6chk36f3@ushxiwxojisf>
 <20250428190010.GB1035866@frogsfrogsfrogs>
In-Reply-To: <20250428190010.GB1035866@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 6 May 2025 18:56:29 +0200
X-Gm-Features: ATxdqUFT-fIsXKRHea9-EZCmnVWun07IHA8kCr4QDmzIP2kON1JGlU4dzmYDGDc
Message-ID: <CAJfpegtR28rH1VA-442kS_ZCjbHf-WDD+w_FgrAkWDBxvzmN_g@mail.gmail.com>
Subject: Re: [RFC PATCH 13/19] famfs_fuse: Create files with famfs fmaps
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Luis Henriques <luis@igalia.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Petr Vorel <pvorel@suse.cz>, Brian Foster <bfoster@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>, 0@groves.net
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 21:00, Darrick J. Wong <djwong@kernel.org> wrote:

> <nod> I don't know what Miklos' opinion is about having multiple
> fusecmds that do similar things -- on the one hand keeping yours and my
> efforts separate explodes the amount of userspace abi that everyone must
> maintain, but on the other hand it then doesn't couple our projects
> together, which might be a good thing if it turns out that our domain
> models are /really/ actually quite different.

Sharing the interface at least would definitely be worthwhile, as
there does not seem to be a great deal of difference between the
generic one and the famfs specific one.  Only implementing part of the
functionality that the generic one provides would be fine.

> (Especially because I suspect that interleaving is the norm for memory,
> whereas we try to avoid that for disk filesystems.)

So interleaved extents are just like normal ones except they repeat,
right?  What about adding a special "repeat last N extent
descriptions" type of extent?

> > But the current implementation does not contemplate partially cached fmaps.
> >
> > Adding notification could address revoking them post-haste (is that why
> > you're thinking about notifications? And if not can you elaborate on what
> > you're after there?).
>
> Yeah, invalidating the mapping cache at random places.  If, say, you
> implement a clustered filesystem with iomap, the metadata server could
> inform the fuse server on the local node that a certain range of inode X
> has been written to, at which point you need to revoke any local leases,
> invalidate the pagecache, and invalidate the iomapping cache to force
> the client to requery the server.
>
> Or if your fuse server wants to implement its own weird operations (e.g.
> XFS EXCHANGE-RANGE) this would make that possible without needing to
> add a bunch of code to fs/fuse/ for the benefit of a single fuse driver.

Wouldn't existing invalidation framework be sufficient?

Thanks,
Miklos
