Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6A42F30
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743132983; cv=none; b=hRYaT20UfpY1u/MsR94iZRvL6wZzzeqxGkO7GeCFVwIUum6tcq+Bc9ieFYZuu+dck9W1IB3IBNk/3Vt0p2aTXluEfCrf34rGR102rH/JAvvrSj2AWfMOfeFMCt5srSZHYRVpgVdp9IE73v8AC8zouELCBeMKNhBd55HUO386ydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743132983; c=relaxed/simple;
	bh=+frlrd9FzA0Y1MLXf/LE9ieO4zWiozcuaEjhCdlsW0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VR59uiu88QHyC8sxHrFJJG4X6ZVPEGOk88kc4xNEcNQEVF4UQgTDcjJw8rbhthX5Y07IEygL7Q51MbJO7e5R/ZOlVDIwaD3a5VsyCACND84XJ8xzfJkkeU62GxbXDywVHq5SkfWcUMDkRmkP/x8RKkJAxCq2yxKOw/UT0L4kMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rw0CAJvh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rw0CAJvh"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so220748566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743132979; x=1743737779; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gEC8sJ5gvGrjdnR5ogccPiUny6HLYEid0fVwKOPDiYs=;
        b=Rw0CAJvhAVN62c3qCYiBTJjVW+bukHmIN7E8M93+tUOjLvIKz7gHYPugzB5oeekELz
         bWBCVz+RwWbAhAbtqGAfU+B9yvozs47ulhCKgYsUacnKUVnBJS8auB1+LcQsXyNNddKu
         DWFceuvIZqnYDJfBbPG2T6WTybW3mgntx8omU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743132979; x=1743737779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEC8sJ5gvGrjdnR5ogccPiUny6HLYEid0fVwKOPDiYs=;
        b=mQBxd2Vp3eWBpxl+5dQqG8Co1sjbtM7DDUTf18gO+gHpYOFT2ehKCg8CbaTrO0Vrzq
         LmpGqzk/NVKOvhIHVw33uethPJXMP0IAKu1KNMJvE8z+cT6Xy2S44tR2cOxP7xd+0Ar4
         OLruFDP8KEEbN4P6g6yuNqA6EMqUeoNnAyaTn5o/Wo+zv8JFY/hsCLtgHNoSMbLbxgqz
         e+UOdWfooKOfy+WIpyYWzZf3Y01VBb7JBNWEWYDl+xq8j+3wIbxnw+8PmhD9mrV6J1Dm
         Z+gSXl+CsUgK0fhqc49mJaH4w9nVhxlHJoZFCBH53COwzICk5VAwY9YTdf1G3e8w9qvD
         BcxQ==
X-Gm-Message-State: AOJu0Yypym2A9CDKeLWTGZ15hEt9y3U0ypSud+0UoCTshtzRkXSgZgcg
	dsOwRBunYj6RtW3hg0d7npZuJXSxfCJa/CLBWHj9AiRzzPLvYxbADdLhZmU0ujXribSFUWAcjOu
	9CcM=
X-Gm-Gg: ASbGncsSz3genCcsbGJECGvh/jss0VY43y8meZmQ2xVaF1LMVM3VMf2lSyL6ztP50uh
	hkrj/yU20jV6YNl85YRkTwsdNOfKIpvgMlPoEENM91D988cbrCcsgx3PfMpkfq6k8kKQXcbSjEN
	NyEzP5TFaBcYnDKTfte42ep8AiIeI4BtL9AjBkOiZkpNMwvi/TBJ58OvH+PMpet68CEOYDMsJE/
	jvPgFmbWSofetiKMo+okTXZHH0d2sERWrtFunRFFFI0yVc7Z6TN4Hz9V9fqVglBRM2l0wMK+iRF
	t4rc6MsXQz2jY+/jzbNnVq5YUxwDIU/BOkpGZ52N0CxrrgwFoy1oBsCLjeslWqYltcA5SBP+/ZC
	Wfnlq+jYPcDLDAcdGtP0=
X-Google-Smtp-Source: AGHT+IHE1NOKH6E6lZG1iZmN5MxxrucNgK1uei8emYgLT6EtGCC354szJDVMVv36hT6zXnogvsDibQ==
X-Received: by 2002:a17:907:6ea5:b0:ac3:ccf7:3a11 with SMTP id a640c23a62f3a-ac6fb14591bmr509117466b.44.1743132978597;
        Thu, 27 Mar 2025 20:36:18 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927af39sm91686266b.44.2025.03.27.20.36.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 20:36:17 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so220747266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:36:17 -0700 (PDT)
X-Received: by 2002:a17:907:868c:b0:ac4:169:3664 with SMTP id
 a640c23a62f3a-ac6faf04132mr477722566b.33.1743132976743; Thu, 27 Mar 2025
 20:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home> <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
 <20250327220106.37c921ea@batman.local.home> <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
 <CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
 <20250327230104.660a4b35@batman.local.home> <CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
In-Reply-To: <CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 20:36:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wio-SF6dm+QeBW7HN7TFOK1noEm_EVob2UGyUwRYz=L9Q@mail.gmail.com>
X-Gm-Features: AQ5f1JryiNvjxwgoALTvZs-teBVM83QHu9Njr2fkTfpyoW5DtDJkGExCdqiy4nU
Message-ID: <CAHk-=wio-SF6dm+QeBW7HN7TFOK1noEm_EVob2UGyUwRYz=L9Q@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 20:19, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 27 Mar 2025 at 20:01, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > Are you OK with the idea of moving the mapping code into the ring
> > buffer code (which I think is cleaner) and then keeping track of that
> > to get to the pages with the helper function?
> >
> > struct page *rb_get_page(struct trace_buffer *buffer, unsigned long addr)
> > {
> >         if (buffer->flags & RB_FL_PHYSICAL) {
> >                 addr -= buffer->vmap_start;
> >                 addr += buffer->phys_start;
> >                 return pfn_to_page(addr >> PAGE_SHIFT);
> >         }
> >         return virt_to_page(addr);
> > }
>
> I think that would have been *enormously* better, yes

.. actually, thinking a bit more about it, I think you want another
level of abstraction to deal with the chunking side (ie I think you
want to make the subbuf_ids[] thing explicit and the 'page order' as
well).

So you have that 'meta_buffer' thing for the first page, but you also
have that subbuf_ids[] array with pages chunked by 'order'), and I
think you need another level of abstraction for those.

IOW, you'd have 'rb_get_meta_buffer_page()' for the first page, and
then something like 'rb_get_buffer_page()' for the subbuf_id[] thing.

Or something in that direction. I didn't look *too* closely at what
the code actually needs, I'm just trying to make sure that you don't
pass random kernel addresses around, but something more structured.

Preferably maybe just the page index *within* the ring buffer,
perhaps, and have the helper function do the whole "is this the meta
buffer or one of the subbuf_id things"?

Hmm?

More clear abstraction is what I'm looking for, in other words.

              Linus
