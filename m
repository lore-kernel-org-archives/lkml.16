Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DD4214216
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235494; cv=none; b=n1oXBkOBezAxvdVC+hEiw1bK6XO466R1FgROJGPb1V0c+9ehSGt484w0l3Yt7Dl2E/lfhJhC5GLoPCJL6gDpRRjPp6w0AuPIbIxcJV8nR5frWduowR2+klGnyDREbxI2rNM/kPaKFe0ahHq/xAh4zG7Lwf57+8s2lHpnn9DqpWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235494; c=relaxed/simple;
	bh=2s6G6NN8pctq/sF4oerqQIuFbDQd/irN4UGnuhIszHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRQXjMwcJwx81rij5h+YBKf4Maru85OguRvzgR5JyDb7hYbdv3uLIPR+mTo6vLOPfW9EK96I6HhwmF/Nxfzl8faIEmJpqpSNVlz4apf3cKs25wgyTvvrrYgvVszDcNNP1ShqrbhHba8ucP8WycZ1fnfU+eqSKNAJeuzS4kA2Ov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PfjNO3pM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PfjNO3pM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso22755e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744235491; x=1744840291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ9m7o8BNfZNKhxtAZke//FBuAyJAD3R85kLu3E10C8=;
        b=PfjNO3pMMkpJMUJZgEBIENZ/7ItdjF9BqOxFjvpkXmWDPZqAEOJxmzUEnIaEwZJdrY
         kU0gbt1sZt1qFuSsi2/qr7JjxjR7OgTXY2BKU07SF/SlxQ0eeQzSWTSje5eBieQIo0ii
         GEqG8DcI9/H0whhdixXd2FN6hytsICOKL9CwED4o49AaAjQXgoGwKBWnvLpXf3AZy344
         qY1AFWA6FO6VDUvPSPorHqE0fT4U8Aa7hG5rMHOpzKRM5Qv4+lzhBwRh77z0Wf2lwKdo
         /VyB1RPY1gdIocd6AGjg7HE4VQl6VGSvW3NdxW6L2aAwQ6ivJ5tubf4tWIqn+qmscU6i
         k+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744235491; x=1744840291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ9m7o8BNfZNKhxtAZke//FBuAyJAD3R85kLu3E10C8=;
        b=Bin/bON36Hn9lvCp9ZiKf7yeaht1/f8tqYA/qk1JW7NO8Ctyk5IfbqsaeTUw7sKNHG
         xO8Cwe2iABEcFTQuTaqIlOKVxSS7dVLUxRFuo/R2RmkBZDf7u8xpRnvsUaxc0/iZwxtC
         9WJfQ/p2EjmeRECbHZ2XSD7uQoO4YMNUUkZmJY9rabLMrkeguDjS+BnhUfeqVDVaWUIO
         cmcfw3UnjyuBYqPjYex82HbNMXYSYruS8VxuAvirXjDR33DlFv6SjebCJ9VdWJel04oX
         BYIFjKAVtTKsotoCbesPHL61zyb54yQPNFVGtSOWKCRYnt3/3I3LTaFSK2ZG0khz1Eg1
         KbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeWJ2u3rHThU01/I+I9dA+gx7Nhu0VlgEcayLGJabYv0aJphic1r6SpXZALBVelXNpFjdntCfzBDUNUrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKRP3MSzOfCx993oHb+97AZIgVWY7ZboO4pkXhWhYFoMsUdAPW
	wuOLusUN5hcR99IW/O8kADiUUNJ5fRSFFE5VTTIoPDsptla6qQ3Tr+GVPK9Aj20zywuxWG4z0Q1
	exy4MOtzu7mhJlCQUShqEeHfZyiRcyZKUsB3/
X-Gm-Gg: ASbGncsmD+Wy10+42LTrSyzPV3eQ64J7gBosGQVwO62KAZwyWpdAED+ILvyB6Z494Cq
	DchPWWn0n66YQz8fG5E68pRjrO4daQbIvrHxzVfFw0Q5GZmzGPkFIPqTvhEf8BOOahXny7kVg1j
	DiWpELt0bbOtcTfCQeF0vV7YEEqbVxrJLha7mKi0zpljcW1VrbO5AhoMqnLVRjsQ==
X-Google-Smtp-Source: AGHT+IHN0lJ4bXZpLnqdXFhygICbVtpTpU/VQGHVO4WWAFzmD18+VA98yrFI9aD6MbTMYixzWe8/RAnsoHXVrS4Tp9k=
X-Received: by 2002:a05:600c:4f83:b0:439:4a76:c246 with SMTP id
 5b1f17b1804b1-43f2df428ffmr330925e9.6.1744235490609; Wed, 09 Apr 2025
 14:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409195448.3697351-1-tjmercier@google.com>
 <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org> <20250409141131.bd67f6b19ea7e770dce40ac7@linux-foundation.org>
In-Reply-To: <20250409141131.bd67f6b19ea7e770dce40ac7@linux-foundation.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 9 Apr 2025 14:51:18 -0700
X-Gm-Features: ATxdqUFDZuKNqNrOKkvsTDDv1fjAH_vEsQQV6NxL-XiRE2f8P6_-EN0bGuR0fPk
Message-ID: <CABdmKX3D-iCwkuAXLsFyyJD7LikoR0rygR6CnR4Fv-u9+OjnZg@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in vm_module_tags_populate
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Janghyuck Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 2:11=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 9 Apr 2025 14:08:48 -0700 Andrew Morton <akpm@linux-foundation.or=
g> wrote:
>
> > On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@google.com=
> wrote:
> >
> > > alloc_pages_bulk_node may partially succeed and allocate fewer than t=
he
> > > requested nr_pages. There are several conditions under which this can
> > > occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> > > enabled causing all bulk allocations to always fallback to single pag=
e
> > > allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> > > allocator recursion with pagesets.lock held").
> > >
> > > Currently vm_module_tags_populate immediately fails when
> > > alloc_pages_bulk_node returns fewer than the requested number of page=
s.
> > > This patch causes vm_module_tags_populate to retry bulk allocations f=
or
> > > the remaining memory instead.
> >
> > Please describe the userspace-visible runtime effects of this change.  =
In a way
> > which permits a user who is experiencing some problem can recognize tha=
t this
> > patch will address that problem.
> >
> > ...
> >
> > Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
>
> A Closes: link will presumably help with the above info.  checkpatch
> now warns about the absence of a Closes:

Hi Andrew, This was reported on our internal bug tracker so there is
no public link I can provide here. If it's better not to add a
Reported-by in this case, then I will do that in the future.
