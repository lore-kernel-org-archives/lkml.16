Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609A224AF0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804500; cv=none; b=oq0wOzmHgxIGHL9sF7Rk0B+kQmvNaYaPiThGzNMyeORR1R835SuPoiFu7jeCG775I59KBz255cy5VTOKamUf+81TcHC3ZXz79TrFaHjG+2rq3IwtcfPTCfz/N8B9ECxskAPHgf9+ucPawoFo0nFLGk8hSzJlMBoPgXfqtl2iws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804500; c=relaxed/simple;
	bh=2ozwohrkKW6jzyFX4zmg3wCs+LLA1PA5JDo1GxztnMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tb4WR+Y1NG/G1lzJRXwyrgs1nL5g0M/YS5zABzCpNa+JlNCaT5DO6A9kM4qG0zsnLLoWsqIos9S5470j6eoOjvpditgWhQx4SFaHcVVI1ZU442dWY0m/95Pxnrb+mXxfZSFQb1gz8HjhqEyMtGP9CnIkrzSZwYoX8CFtdQuEsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RP/ZNErZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RP/ZNErZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so372081cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746804495; x=1747409295; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V311r9l6O55gp0nuzr0djX7scAYmilyGkTeDqrs0OCc=;
        b=RP/ZNErZ8qBJUGphEvnzVh/NORbobzuaA3qoFx596Y2gx7WeoL5ZfmmnwPQKZtWofe
         67RS0C5o9W0MpI3m26G1qSZFEhof3YYJqCk4coxRvy3JTfvS+MQF2FRPf94jGqR44Ra5
         xVlMXrlXhRNQEGx/ai0jPMve9ZgIAEenIvTzPfq4pTevwvB4Pwt6z96Wnn1kikeJ7TSp
         K0ZOmCgdk778rm0iRNMAyIy0FL4OS2m60koGljvNQxR99bGqrw3GqBKhYjOC2gwmbhW4
         WKdeFeM6C23wWvKi5esfNh58gC9602vHN6C0Uz/BJra2jv90NfFMgrWsguSLgWCPFKKR
         VAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804495; x=1747409295;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V311r9l6O55gp0nuzr0djX7scAYmilyGkTeDqrs0OCc=;
        b=jyAqfW7ByV5b2vECxZgPYKzQ2rVI0mDj1MiJ5sM0tdIpBFt7mIYrSQPI86bVu6ztEq
         XHOdw9p+KKNFAct7p7vGc7ZbdUZPMkxy62hxM80D5RDfH5+p1/3lEq/30UEc6nSWQLXg
         H1O6SQz3+FT5/+KPTJJgyElBbwZS7eGa+oogUT9ne34CPK4HT/rSpoML7a3RnNzK4fGQ
         gFQKT80v6OyOjJ+zNv6wW9Yki5p0NYoKprcERFmtfAoZYPkNtc5HQhuZnAe/sSU+8tLa
         MAXpxRRt251ZvfO6hBpljXJka9AmXHApKyfkloECWhmH+CodI3jHgb9mhMXDl+0XGYhs
         Gjig==
X-Forwarded-Encrypted: i=1; AJvYcCWrKEV32DxdO+9fMdK5ygvgYJJwy1ZQ+GiUBvjaDrgy/cxRymgvs6aUQuZhMZH6UeRVjdq/ZuXbYM13yRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMO8Os1f4z5vIZSxS01F5OZgQm7IoB2duNV5B3pIV1JHcA+pP0
	F1oXKtfKJFddl3ZKghI5g4d1N7nRf8lyYPDrzbUj44lzcuR741vdHCZCatFPHDs+eebI50vJV1k
	8ZwXIeF4sOWrvRghC3hoPV4D2OAucUTmcsRwy
X-Gm-Gg: ASbGncuLenkd8/pAc8V3Jp6D3fwSsyLK95YZtGOhw9Qwjnz3JZ1+sZXUpVxQzbLJqKa
	2DFXV2uyzCj3N/i/ucH9ctmCKNsa2Ho7I9ki71AjN7PcM7C0sIqxCUw9fkJeAbu3yzuk8YaH3Gu
	Df4IHVfn1/r72ZyIeOqjIq
X-Google-Smtp-Source: AGHT+IEf4rn/YGj/XrmQfH/DUtip6Yk+lqBTTCh9YWRX30erKjKuTXT6Tdc+oQtXqJZ+Nw9ORBlAry0gV3ZCDGnL8Qs=
X-Received: by 2002:ac8:59cc:0:b0:480:1561:837f with SMTP id
 d75a77b69052e-49452cae732mr5183091cf.8.1746804494901; Fri, 09 May 2025
 08:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
 <z2hyuganxadlf7guskolgd6epu75jutipt7uwg5sqwew6a7lyv@6fbcue5r745x> <CAJuCfpFXuyg+otnr2uHauGi1-UD2sxxS26ONQNBwuUUisOssQQ@mail.gmail.com>
In-Reply-To: <CAJuCfpFXuyg+otnr2uHauGi1-UD2sxxS26ONQNBwuUUisOssQQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 08:28:03 -0700
X-Gm-Features: AX0GCFuOglRGV1A6avdyhNrn378-Ve7Y2mRC2kJuq8A5ZPWpN6wHWrZjijO6HaY
Message-ID: <CAJuCfpES=9QeDEQLZCt-Cm_Vosz04-nT0WXWjtVOUyutqqzo6w@mail.gmail.com>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Hailong Liu <hailong.liu@oppo.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, 
	Matthew Wilcox <willy@infradead.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:27=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Wed, May 7, 2025 at 8:50=E2=80=AFAM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Liam R. Howlett <Liam.Howlett@oracle.com> [250428 21:48]:
> > > Temporarily clear the preallocation flag when explicitly requesting
> > > allocations.  Pre-existing allocations are already counted against th=
e
> > > request through mas_node_count_gfp(), but the allocations will not
> > > happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> > > avoid re-allocating in bulk allocation mode, and to detect issues wit=
h
> > > preallocation calculations.
> > >
> > > The MA_STATE_PREALLOC flag should also always be set on zero allocati=
ons
> > > so that detection of underflow allocations will print a WARN_ON() dur=
ing
> > > consumption.
> > >
> > > User visible effect of this flaw is a WARN_ON() followed by a null
> > > pointer dereference when subsequent requests for larger number of nod=
es
> > > is ignored, such as the vma merge retry in mmap_region() caused by
> > > drivers altering the vma flags.
> > >
> > > Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > > Reported-by: Hailong Liu <hailong.liu@oppo.com>
> > > Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> > > Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd=
1@oppo.com/
> > > Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howle=
tt@oracle.com/
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Hailong Liu <hailong.liu@oppo.com>
> > > Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> > > Cc: Steve Kang <Steve.Kang@unisoc.com>
> > > Cc: Matthew Wilcox <willy@infradead.org>
> > > Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> > > Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> >
> > ...
> >
> > I have a version of this for mm-new and I'd like to send it out.  Once
> > this is upstream, it will be backported to the stable kernels with
> > something that looks a lot like what I sent out here.
> >
> > Did this fix the issue in the longer running tests?
>
> - everyone else

and of course I forgot to remove everyone else :) Sorry for the spam.

>
> Hi Liam,
> I think the delay is due to the holidays in China. I requested an
> update from the partners but they will probably provide it next week.
> Thanks,
> Suren.
>
> >
> > Thanks,
> > Liam
