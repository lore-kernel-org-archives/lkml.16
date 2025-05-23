Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031321A928
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018748; cv=none; b=C9F9NLpI6QblVDgp+G3/CIJoL+qscwVi9nAnG2o5SlfeZ/8dGIpOTVs17fclxsBTpEhgfE97ay9hkr2eBaDybNHNqk4nYtVXHWobPHih9ts43wMFH0fl+4h/6SpzxfZTgV+v0VYgNePpcURzpPt79pTqYMtUe1wgdDper9LIb18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018748; c=relaxed/simple;
	bh=mpFi+2LlAim3mrcdlXQrRcd+42FS4GK431HSAs3Pv5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W52ikZT0o/tHVGshfUanR5dXlUYct+x+jCHjvdadFUbD4Br8C5yJrJ74x87H9JxoYf7EH8Qg7iRiBlDQ3wRf02VR92DHgApiAgas2kXUTioXwiMTfaBIgCS0EM5YO7byLx3SZ4Pm0342uNBEpDbStDedp22Heql0o1u4+kyE2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GLXlQ3wk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GLXlQ3wk"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231f61dc510so5205ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748018742; x=1748623542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbEfAILviHMr4oDTgiobfZLOFz+Pj86C9/pKLGp4dvI=;
        b=GLXlQ3wkgDeM6yasxwUfVvW+lErq+HPVSSC27xE7y1HOHpmbKWQz+3HUoYAnxFl98M
         x/B7Jj6mC0J72LpQLc8kfbcBkKuTJKvsK0r9Efk+5PPmdiyFrKwnTwSZ8W9vqwmVlNf5
         96f//7hLPLOcyOInHOuM14ZafQKqPTYt8awHrk1mIkSzLFObOzaw7oLWAGcK/WiSJGLD
         VnwtQxDdVzSxz+HXGAqlMaN33zspoVGcLsgk4YW6L2MZ3JgHGMTW2w0flb1USMnV5Qs3
         H1iy5hkxmAm7Mq3onTiJbKZ5oHmMuNJU6Imssqh6zrMVlTa0SgxMY7FtC03PKS9qMUJ/
         N8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748018742; x=1748623542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbEfAILviHMr4oDTgiobfZLOFz+Pj86C9/pKLGp4dvI=;
        b=sqmT9CtUrdVgVXbQ+RnX9r7q1BGZz/EtuyJjJKqAV97j2BMrFYrRbgeDZqd2T9EK7S
         OV33efHPW2W5ogjs8pIO0WePj5XsNFNPbFQvUG+cBAuGxaSIn3RvM66ikO0Z9GpZqty4
         CE0NYgB4/V8FPIv9gVb6GmtY1/7glguqFLBS8nGJiI1PWX+fcxBBwJ+aUhsttUfjaG0C
         rQT6XzWsT84I/83/HqzR20mvo1HUmae4u9G3sYm5wOHRI54IjZsHKiQ+AbUqWx5ffSFe
         cgxYIaGlRsC4V1jczikNDpRRDnUiKgUm64u5sKLnvYbq92mJoJQpCFP61MJGby+F6VRb
         /Cyw==
X-Forwarded-Encrypted: i=1; AJvYcCUxG5VwATJp2UP+OybnF+o9fh+bxHxrfTpxFOzj4NKU67A/se0sES3GLhI/wbp94ioS44qx5e2NunZPJ04=@vger.kernel.org
X-Gm-Message-State: AOJu0YypircTivp+/wLY4ndZFRI9qLPYdGfgwpejIzQVbU3B3xFLV8Wp
	GCe6ZuGW61ujDsKgB8TqqK1iPZSHgA/8345+1fK/6zz3T4+l8sn0efqR+vNhaDsGJGNsVycw1q/
	Rfquc+e9ZiGcjNoGPtY92h/1PfkdUihF1mCBAC75W
X-Gm-Gg: ASbGncuiPaZndEdln7sQQv9kNEO69Em+QUo0gYSM+L6yctn1iR87TelwuB+P+lr8C0f
	Nk9IVDhnGl/SV+B7Ja/SAYZMYtQMySIRFnzNGHIT0O7omtPr+BZtN/AJ2Wbdju07C83AbDohys6
	3Aov+pIzFLK5U7b3BAjiWnlrUsK9dvQbpLloFQ0Q5DxKVdi9sajxQHLx6VI0lkc9lc/kGxD5XHe
	w==
X-Google-Smtp-Source: AGHT+IHKENtOk1185zLF5YBywUwyLB+xqcNyvyViyfrVAjkVKT7E+/W3igasj3tGPTfHTU6T75kaDQdKqicwHmsdjXE=
X-Received: by 2002:a17:903:3c4d:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-233f306ae91mr3190475ad.12.1748018742179; Fri, 23 May 2025
 09:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523064524.3035067-1-dongchenchen2@huawei.com> <a5cc7765-0de2-47ca-99c4-a48aaf6384d2@huawei.com>
In-Reply-To: <a5cc7765-0de2-47ca-99c4-a48aaf6384d2@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 May 2025 09:45:28 -0700
X-Gm-Features: AX0GCFtkvgsG2TRBwxiCM9xaIIEsYdecLQRjq4ECWuQCPug6wVwy2u3pcYDiD8o
Message-ID: <CAHS8izP=AuPbV6N=c05J2kJLJ16-AmRzu983khXaR91Pti=cNw@mail.gmail.com>
Subject: Re: [PATCH net] page_pool: Fix use-after-free in page_pool_recycle_in_ring
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Dong Chenchen <dongchenchen2@huawei.com>, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhangchangzhong@huawei.com, 
	syzbot+204a4382fcb3311f3858@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 1:31=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2025/5/23 14:45, Dong Chenchen wrote:
>
> >
> >  static bool page_pool_recycle_in_ring(struct page_pool *pool, netmem_r=
ef netmem)
> >  {
> > +     bool in_softirq;
> >       int ret;
> int -> bool?
>
> >       /* BH protection not needed if current is softirq */
> > -     if (in_softirq())
> > -             ret =3D ptr_ring_produce(&pool->ring, (__force void *)net=
mem);
> > -     else
> > -             ret =3D ptr_ring_produce_bh(&pool->ring, (__force void *)=
netmem);
> > -
> > -     if (!ret) {
> > +     in_softirq =3D page_pool_producer_lock(pool);
> > +     ret =3D !__ptr_ring_produce(&pool->ring, (__force void *)netmem);
> > +     if (ret)
> >               recycle_stat_inc(pool, ring);
> > -             return true;
> > -     }
> > +     page_pool_producer_unlock(pool, in_softirq);
> >
> > -     return false;
> > +     return ret;
> >  }
> >
> >  /* Only allow direct recycling in special circumstances, into the
> > @@ -1091,10 +1088,14 @@ static void page_pool_scrub(struct page_pool *p=
ool)
> >
> >  static int page_pool_release(struct page_pool *pool)
> >  {
> > +     bool in_softirq;
> >       int inflight;
> >
> >       page_pool_scrub(pool);
> >       inflight =3D page_pool_inflight(pool, true);
> > +     /* Acquire producer lock to make sure producers have exited. */
> > +     in_softirq =3D page_pool_producer_lock(pool);
> > +     page_pool_producer_unlock(pool, in_softirq);
>
> Is a compiler barrier needed to ensure compiler doesn't optimize away
> the above code?
>

I don't want to derail this conversation too much, and I suggested a
similar fix to this initially, but now I'm not sure I understand why
it works.

Why is the existing barrier not working and acquiring/releasing the
producer lock fixes this issue instead? The existing barrier is the
producer thread incrementing pool->pages_state_release_cnt, and
page_pool_release() is supposed to block the freeing of the page_pool
until it sees the
`atomic_inc_return_relaxed(&pool->pages_state_release_cnt);` from the
producer thread. Any idea why this barrier is not working? AFAIU it
should do the exact same thing as acquiring/dropping the producer
lock.


--=20
Thanks,
Mina
