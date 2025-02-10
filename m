Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78F1EF087
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212217; cv=none; b=BUdUC3eDKO6JR0pBKyUoE1nFkJWgQouIcVw2cbSpzDtizruFkOIv7xwitjhh7uOlAecTA37xLCYZG9gdbG5ZxwpmvSJKJGj3CLopT8cwvv+kuzrFutBI3HYNZrSZkdd/HtTWC+HfGUDo5MbWLVVeenXbCh3RftqAfcqq1M72yYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212217; c=relaxed/simple;
	bh=8HfKPJSfxCZGKLo5/pj9wiJiaiKmqK3oi4ISbP/v9Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITwWxBAsYyAVNGK/PVfhDVeG/PvvnYv28XlGMcyfrrK9h5wyw9az8+haS0qRqAGnAETwbuYJ1lOSwLtVH6MYBADUAO+npT8kR0MZ29NiJXAw+X6x3+SjXbi9PdMEVM+d0ZXwdRXb9iSYPOpFusQcI8zWMfcFoyE5PukmlV6KVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXAESp0D; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXAESp0D"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4718e224eb1so8121cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739212214; x=1739817014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HfKPJSfxCZGKLo5/pj9wiJiaiKmqK3oi4ISbP/v9Uc=;
        b=KXAESp0De4Ze1ewnXld/GKlXq0WXRh+qQIlpc3bQeqikPrfIJh8JQ1n6EVq7kNCm1q
         DZNB9+n5uxXDracrQ7Fsq6y/9cCFyAOP5D8rSrPI4BwRasUoqKFBnP28tEFkFlnCEV5G
         uiUgGHkCnu++YadiyjV90G6qhleESlne84SkvQuiCicL7FivzvZ7Gy/Swf4l2ucRpG1L
         JCTqHz9Y1mAfXXSwJiJs29XCGxtpXRKv3/SatAQq9TSp1Q3tyfoqFo+wOXcWizh7xrOy
         uV4w+vlWT+9O2R72gqNc7fL7qEnUU7Iz9ams217Eefzn6ll4pix+qzEmisXrWt6suvYh
         WUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212214; x=1739817014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HfKPJSfxCZGKLo5/pj9wiJiaiKmqK3oi4ISbP/v9Uc=;
        b=nJf/yNpOtlPgmoYyY9F7hPGrjaQD0M5A8+E3fHEvvp3G0lWBwVl8xfz82gwsJcaOuH
         4FVdU9RtwCuhuXyFhO1ajGJYqTsAkLS4RxckE76QSKvTySbOfkOhaQ2800KQ6nbrDGej
         My9ybxT88qvsUe/URX0g95S5zDrA8f5CR3nU04PbmTXKWjIXVV0raS38e1in9o3YwCI+
         r7Ooc09O//B6oNyMrxtjY8CvlcymJgWymsgyTaOvSZ/BdvUIfr2QhE+KRswVKJicXX5d
         vSQEZquqWjwTDb6NwECy/jwjLk7mmGSd5IcdHPOIPEO6gQmMzM7zYXhScOSqvLzjTydG
         lETw==
X-Forwarded-Encrypted: i=1; AJvYcCWSbtti/qqb/pJcSZUoe7+S71zku0d+TfI0ND27G2JOExFdp27W4WcJMc4kXx4aKmMtJsiXX54Fs3DWtco=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhoGGoJoIPsFUSRrCFM0tM/ehMqfgfhNptctuG+u5RC3gu1EDq
	AwP0nPAU4/p0OKzyvrQi3M/5+j0sULtXSqExRqvMuVf677FkS/wDEezavQt+GDPxvlRny5W2N/g
	Vn0pWVEBOy1Nvd+5bP99wIML+vnNqLZMVmrRo
X-Gm-Gg: ASbGncvzAC7VOHZzM22l7uUBdp8Yse3lQQhwz4cy8gAlzpRP8rr+Dheqj318g1CD8R2
	oIVNuZ7OdUmIbBE91uDcxkSwtCP7yIEwVnIzTXUUA0tCRqZL3Q7nB9rcWi14OrCKbjcU6KQ==
X-Google-Smtp-Source: AGHT+IE607kxRT73YhIc7XgFAfGUhK1Un8bVHLN/F4SZKoqCfdUPo+DWBx7ZLraHfaUBrpN29qbeV9fcVwe023Cx4E4=
X-Received: by 2002:ac8:528c:0:b0:471:94c0:f403 with SMTP id
 d75a77b69052e-47194c0f5b2mr3914951cf.16.1739212214169; Mon, 10 Feb 2025
 10:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com> <20250206185109.1210657-6-fvdl@google.com>
 <Z6n30QhWeAyFea40@localhost.localdomain>
In-Reply-To: <Z6n30QhWeAyFea40@localhost.localdomain>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 10 Feb 2025 10:30:03 -0800
X-Gm-Features: AWEUYZkUNDu2MopHDliIrU8DLEoNOPJxGfK5Mwq14RQDp0x5MQOJjSzyHx4lLZo
Message-ID: <CAPTztWakxktuqyW5bY2BYfC-jpVpEpDbLpxc_QgSH2Bb4DYh5A@mail.gmail.com>
Subject: Re: [PATCH v3 05/28] mm/hugetlb: fix round-robin bootmem allocation
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev, 
	Zhenguo Yao <yaozhenguo1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 4:57=E2=80=AFAM Oscar Salvador <osalvador@suse.de> =
wrote:
>
> On Thu, Feb 06, 2025 at 06:50:45PM +0000, Frank van der Linden wrote:
> > Commit b5389086ad7b ("hugetlbfs: extend the definition of hugepages par=
ameter to support node allocation")
> > changed the NUMA_NO_NODE round-robin allocation behavior in case of a
> > failure to allocate from one NUMA node. The code originally moved on to
> > the next node to try again, but now it immediately breaks out of the lo=
op.
> >
> > Restore the original behavior.
>
> Did you stumble upon this?
>
> AFAICS, memblock_alloc_range_nid() will call memblock_find_in_range_node(=
) with
> NUMA_NO_NODE for exact_nide =3D false, which would be our case.
> Meaning that if memblock_alloc_try_nid_raw() returns false here, it is be=
cause
> we could not allocate the page in any node, right?

Hmm.. this patch is from earlier in the development when I stumbled on
a situation that looked like I describe it. However, you're right,
there is really no point to this patch. I mean, it's harmless in the
sense that it doesn't cause bugs, but it just wastes time. The problem
I saw might just have been caused by my own changes at the time, which
have been re-arranged since. I was probably also confused by the
for_each, which isn't really a for loop the way that it's used in this
function.

Looking at it further, it's actually the node-specific case that is
wrong. That case also uses memblock_alloc_try_nid_raw(), but it should
be using memblock_alloc_exact_nid_raw(). Right now, if you do e.g.
hugepages=3D0:X,1:Y, and there aren't X pages available on node 0, it
will still fall back to node 1, which is unexpected/unwanted behavior.

So, I'll change this patch to fix the node-specific case instead.
Looking at it, I also need to avoid the same fallback for the CMA
case, which will affect those patches a bit.

So, there'll be a v4 coming up. Fortunately, it won't affect the
patches with your Reviewed-by, so thanks again for those.

- Frank
