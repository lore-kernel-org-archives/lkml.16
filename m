Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B418245008
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843914; cv=none; b=KX4vJcq1AP8xc6qzRnm3in7TodRz3Zz9aHbnGCPFEte1VpRfG9s4vS7f7+5IrL0yq5xJITECgsoDzNSxkkybbDfqH/t+5ja1eJJtQuKUYpZrVHOqXwuCOOOSFbPty6b2CoSuciXX6/E584yF38dtu4962c786X5qkCVjGyVmg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843914; c=relaxed/simple;
	bh=IoJJSCOlCHUpZacswypeEIdZhmajgDkZrYjCwe4+91k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmDRq10w1qM0BzRLyfhKtTYhg7H2cZr5Oo+XG58SRp1S0Z7HyVyJ1iE+TQ9fpc0iRaXkP4Pjuttm4cGF9O+mlXD3zrqW/j/VDd7QAzzfn291+h4+16bjt0DmrnYv8MqDusqBzkgM72zG8sj+6D1/vWbyVv5ZdrkKkB/ml8I7XbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b5/XzFrA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5/XzFrA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso12335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744843911; x=1745448711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgiFznxyXwNZAjYFXBtqbEchRNoGqLP4Udb3wMlePFc=;
        b=b5/XzFrAbTLxITj8fEBhq+9TXE7M2zoaCl27FWagkLvqpsGuFKZYBr15J8SQArMn2X
         PPpOgftSvgtG52poAdg86cS6H1cWhaioEbDgmCFtUH+VpMM0jtAnWrye9ZWXLodMfrDt
         wEJmXouc254BJfa7SMDIwU0fX7vg3dP2tRJpGteI+93EUDDTb/9Acy6KFUtYPRXv+MNr
         b0UCqUB9Via5KtkhSjK+63mulH9PocDSlsx2pV7hDJsl/vsiSerrSxBBIC+Lnizuyn9Z
         3MWviFf41F7XxykpbM6AzcywbT7pYwmQwkH9AGEiHG7Rh6aqxeqkAbScYAmQBqsmUs++
         pKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843911; x=1745448711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgiFznxyXwNZAjYFXBtqbEchRNoGqLP4Udb3wMlePFc=;
        b=k44KaG0ZfLoAklBP7NlNpOniDC1fyBktf63lnvJT04Dv4vKt4IKRblWTVAcfzmp8fv
         gXoQyL/1UO3mCVCUvwjgi7to5RQBHHTR1X6HPTHhK/PMds+rg4EecVKJy9ZNgwzpjx3w
         MmzeJrF4DmuSjCvYmCN3BnSuDPl5k49apc9lNmcHcRoKU+zJ/kqy5VDTtmxTrXNDuY5w
         RUmLO6cW6tecDeK71chM3427L9slmiysUTn6ZVigMbJOwUsgTp79EhWXdiAEf+hsP9im
         fTDzC0jnFTNpOqjW+SWPiY2tu9hAaf5Yc6tYjpRL4XHr2rpAlWxIIu4vdFBSLO6FfPto
         RDmA==
X-Forwarded-Encrypted: i=1; AJvYcCX3V2JOmmNqRtWGsxN7j7RKC4ZTtlXm+0aPTtDyQEUfo0XFV2xcj0mUz9MhpZFjAl93oZM/Ka8Lc8ddhNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXb7LH77HPoxg8hImJVF/RKEZqIV1aWRKHDSUuTttMtEwBoqzb
	N+ZeyI/kCHlNYEEk73XbmDlEbQkoia7rURsEmTu60EDo3VD2J9TrBHhwjFNhcnbFbMl+oEZjLyL
	fkk26PjJ9X0x5mFw6/IsXfo0ML0xl7xyYa9Fh
X-Gm-Gg: ASbGncsdaR/1EEEoiHqMetboOcN7aKHFjFo1Cw5ErGURVg5dk1oH0mXXGg8DxnGjwJb
	O4WkRfNyB6zix+bpEuN7FKdEKqCWNewtk5PMXxHqoEIesNT7Z0tl+9pCUOU0aY/aGJY/SwvUt+p
	Kla+1//v3y883Bfsnmr59ogP8gx1DNO1JCCXm+DhfWE2NXWXwVR4JK4GHeRhwDqA==
X-Google-Smtp-Source: AGHT+IHXWGWfGEo9AOua5ZBzOd3bdHf6i/F7EC52V5Mq1yV8M20CMUTcOJBN7M+4okB7URR+SAXHkZhutXlJ3SZFaXo=
X-Received: by 2002:a05:600c:3509:b0:43b:b106:bb1c with SMTP id
 5b1f17b1804b1-44062a3ef31mr505705e9.0.1744843910585; Wed, 16 Apr 2025
 15:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com> <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
In-Reply-To: <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 15:51:38 -0700
X-Gm-Features: ATxdqUF2F5Lgo5RIa4ABADC_SqcPejYG0M9lcwCAu9guCcJWCuAb8fIDqfWHFPg
Message-ID: <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 3:02=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, Apr 14, 2025 at 3:53=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > +
> > +BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> > +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_bu=
f *dmabuf)
> > +
> > +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> > +{
> > +       struct dma_buf *dmabuf, *ret =3D NULL;
> > +
> > +       if (*pos) {
> > +               *pos =3D 0;
> > +               return NULL;
> > +       }
> > +       /* Look for the first buffer we can obtain a reference to.
> > +        * The list mutex does not protect a dmabuf's refcount, so it c=
an be
> > +        * zeroed while we are iterating. Therefore we cannot call get_=
dma_buf()
> > +        * since the caller of this program may not already own a refer=
ence to
> > +        * the buffer.
> > +        */
> > +       mutex_lock(&dmabuf_debugfs_list_mutex);
> > +       list_for_each_entry(dmabuf, &dmabuf_debugfs_list, list_node) {
> > +               if (file_ref_get(&dmabuf->file->f_ref)) {
> > +                       ret =3D dmabuf;
> > +                       break;
> > +               }
> > +       }
> > +       mutex_unlock(&dmabuf_debugfs_list_mutex);
>
> IIUC, the iterator simply traverses elements in a linked list. I feel it =
is
> an overkill to implement a new BPF iterator for it.

Like other BPF iterators such as kmem_cache_iter or task_iter.
Cgroup_iter iterates trees instead of lists. This is iterating over
kernel objects just like the docs say, "A BPF iterator is a type of
BPF program that allows users to iterate over specific types of kernel
objects". More complicated iteration should not be a requirement here.

> Maybe we simply
> use debugging tools like crash or drgn for this? The access with
> these tools will not be protected by the mutex. But from my personal
> experience, this is not a big issue for user space debugging tools.

drgn is *way* too slow, and even if it weren't the dependencies for
running it aren't available. crash needs debug symbols which also
aren't available on user builds. This is not just for manual
debugging, it's for reporting memory use in production. Or anything
else someone might care to extract like attachment info or refcounts.

> Thanks,
> Song
>
>
> > +
> > +       return ret;
> > +}
