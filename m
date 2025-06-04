Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0D38384
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047398; cv=none; b=c5yVn6iF4dihFCfsj5UYQMgxhIVP42C16qjGjn8KqP82fImfbifiW93okusfHSbq7y/D4fMReZltEGkzmSTAXSoWvJLq1CiqqfPdgN2dNHifwcVgW4MedqIrBy12hccqaNomY+qwPTIlVoh+KCH9VSLBJ9UvwdalBVLtlFDkyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047398; c=relaxed/simple;
	bh=qp7aYlF0MV91SCClGl2CM8m+7fsdEEm/fOdBZkN/thg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZe0IfyZIn7Vh1k9Ty6VNXVVsntRZyAxSxd63CEp4YpAfCDLRfIDVVt+wxWAd+qveko31RwC0SrHFxL9xDg5dQFHeRZPNfCwP88BkcvxAZwLCo5wivwAv2ZATiAAFrgu1ZiD8kt//ceIVQNLO+Be1SOeyd32RNSWRjESSeGtaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3b036G6K; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3b036G6K"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a5ac8fae12so107461cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749047396; x=1749652196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp7aYlF0MV91SCClGl2CM8m+7fsdEEm/fOdBZkN/thg=;
        b=3b036G6KI9RO/p5MsY2yBKie3mkLkjXiqHE0YX+g9Ve8W2y7YF89qLAY271uyEbh7j
         RnCuzTDEa1tIzXwRShETK25wHASDFcm687JIkcqPi4+KH/8Viynty/lxwd47mTagfU9E
         xnSonEayAg4bmoAxqjLzw8PZEwdRymlNFBEcykDOS/MK9OmTEb1U6eJ6TeiW/fS5db+i
         YfeGRJPlDS5AS9Q1LhzvB1LHz/VJOPQXmHtiGy5FQgXE8+LKa8LdbT8hUQ8+I9Z84sIg
         +exsQtHI68vhatesoa2s7h5P4Gg1hk1lasX9B5aoWvYlC9kncs03EYm46FCxfwPvanv/
         beQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047396; x=1749652196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp7aYlF0MV91SCClGl2CM8m+7fsdEEm/fOdBZkN/thg=;
        b=cx4biVszAJ4Ub2WqUWdUYqfTGb2Ma7Jgup+uoW12hB8x0Ml1B838nhXlL4cS3cW4Zt
         HNI0G84P2IKfVzVnRiJQONmJH194lIkPDrIQab6oxj0Ce9YPZDTHrWsx2REIbnzKlKxJ
         chPlUo7okX+SFJYvD4uM9QALnFfIDje/tZkA+Fsw09sjoHP7Thola0JylrnvznOr+egM
         /KFmWrakl5bG5Ev7bVl04Z3YLt53qtkVFlZvbJiR7ilNsYLzjfKlXBf4MD1SP2hDxelr
         yivKwm8BBqljP41FtokOsVBl+nAuz8jwWT3Vgipjt1BVUxWaCk9ys0pZfP4QAqPukUaR
         485g==
X-Forwarded-Encrypted: i=1; AJvYcCV+/4+KWsuue7FJu/z/8Md2DLYZZo5zg8U/aPKo3L6GIBIKn+w4kVV//xer1Wg7aojYwr1b1xMykevObtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSo9P6s6GzPQpvVCtX4vpMS29v5eusDnqq5cmXOIX0zkgXoSxH
	rDybk1um7T7Akor4QYINolzwJJyqcxtBsXAHD7xccC7YX2SdU7wEGqUbGTOb5OIJVMP//r6n3r/
	GsTyDlouchdqV8pZ+ZX0t+y2rlk2oE2Itwnmut1vM
X-Gm-Gg: ASbGncsiJ7zgRZUpVzMhN/Vhpq2qU9PLpkrIZ+3I/+X13D4f0qLcRzwO7vbBpdLHxCY
	7rl0Dzy0sYUUgdnxorb1pafy1E3dZ8tDlRNITiRFmOwC3aAiw+GBz0fwxhXvW/nBDa3cH3kv75h
	/xsWoiroah0GYeZxE1UTYKh3kF2Fdo48td5/bWAeVUh3vh39p/dQo2R++94G+omLInN48OzUIR
X-Google-Smtp-Source: AGHT+IH7QU9THUOIJXkcFhhyY5pE8ZZNfgzXLg84Ex5Q6A11Vwd6k1wi1S4TyvhsAwEvthJSpcOZcMrWncOSW4BQnNI=
X-Received: by 2002:a05:622a:2284:b0:4a5:9b0f:9a54 with SMTP id
 d75a77b69052e-4a5a52d361amr4019381cf.18.1749047395522; Wed, 04 Jun 2025
 07:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com> <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>
 <84qzzzoqkw.fsf@jogness.linutronix.de>
In-Reply-To: <84qzzzoqkw.fsf@jogness.linutronix.de>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 4 Jun 2025 07:29:44 -0700
X-Gm-Features: AX0GCFsIVzK9pgbt2dn3Cpgu7lCKSaLlimWGtVShPPXekcZUBUaMMXaeZ1lEQN8
Message-ID: <CAJuCfpEbRJ7vrptiC_NxSO_4U=mShZoiN+LdX8j5=rPux4cgdQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
To: John Ogness <john.ogness@linutronix.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, 
	Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 1:31=E2=80=AFAM John Ogness <john.ogness@linutronix.=
de> wrote:
>
> On 2025-06-04, Vlastimil Babka <vbabka@suse.cz> wrote:
> > After consulting PeterZ on IRC, he said:
> >
> >> so the thing complains about: vmlock <- mapping.invalidate_lock <- bca=
chefs_btree <- console_lock <- &helper->lock <- dev->mode_config.idr_mutex =
<- mm->mmap_lock <- vmlock
> >
> > so bcachefs is doing printk which wants console_lock, and in
> > drm console a possible lock chain exists that can lead to mmap lock
> >
> > To me it seems all rather theoretical, but not sure where and how we co=
uld safely
> > break this chain.
> > Hopefully one day console_lock goes away? :)
>
> It is a known problem that any caller holding a lock used by a
> registered legacy console will result in printk() deadlocking. This is
> particularly a problem with the port->lock and power management.
>
> One workaround is to enable CONFIG_PREEMPT_RT. ;-)
>
> A year ago (exactly) there was patch [0] providing a "threadprintk" boot
> argument that would also work around this problem.
>
> However, the only real solution is to convert the legacy consoles to
> nbcon. This is work in progress.

Thanks for additional info, folks! I'll look into it some more to see
if the chain can be broken somehow but most likely will have to live
with it for now.
Cheers,
Suren.


>
> John
>
> [0] https://lore.kernel.org/lkml/20240603232453.33992-17-john.ogness@linu=
tronix.de
