Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B073A17741
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749390595; cv=none; b=I6XueZuLmpsJCEPhvgjBf5v/8rYo8kxzr48jgo12RFwp2UuHMXj1ySPIW+uIebQ3MgyLoCjHsbODhE5n7jDn52oyA0clBmpRi1vf5fXduqOHcC9zSX0g/Z6IwIFMDLeareVHppsWwjydhT6weagaBu4CkEJdKxmt4CJwcmsKVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749390595; c=relaxed/simple;
	bh=y6JmwckEqgiW/QsqsF9yxQ8WonK0AHTU03NDtwyJasA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUw5l1aISJWW/Tt9oX/0SUI1stPqDtLd7MOwm49d+Wz5QhnFCiEPtVeLSbv0r5g+fgU/Fp3Ph1RYhEY0Rfr+M7AMZXA25vKRo/NnOvjhny/IhLxPGx89WSCkNhVBz3/fBGwjNIwBJvEjCt4GNQ3WlOqmXhe1hCgziFdIjjxFS4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=S2Zf8Avt; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="S2Zf8Avt"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58d95ea53so39692101cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749390592; x=1749995392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hF+6UtRohKpdwZ1oZTfYRlxr9mBlwqZ6G0URvhQTB4=;
        b=S2Zf8Avta8J2h4PUBPVM2zBAyQnAqqselXBu39w5p5n9oVOL1Avumoiw28D8POh+4u
         asZ7vKL30bjWyzg5gVjSfSBHEP8dpymY+VW2r24XZTzLqi7L9aNwvUSxV8xCAxxQpA4f
         Cvmfo0IsvDuGZ37Z2+5YH6nvvPwMqmezbabsO04HI/yPOE2bC8qji4wG2vSFUS5uTVTY
         un8r3XtLZjPpR0TCvxR4c8TJIlPOOPpAKFhKEFwWUd4zzh2iCsged/rBATx5RreRtLvr
         czu5wg+BZEav/Lh8QHX6D0MmKyAWbUkpaks2Myl5I/D6aMxdbGrlV8Shb6cz9+7pG8xZ
         FHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749390592; x=1749995392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hF+6UtRohKpdwZ1oZTfYRlxr9mBlwqZ6G0URvhQTB4=;
        b=dp0mgpHTInOqwAhf+0xtDstQVroQA/NqntoLVmF+6OGkThaAMkH0xdvSisBt9suskm
         ptqnO/Z8O2bihINLVDOgtdbs7mpZ0+pJ5FoDQtwc/+J+aV7B9iRQ7nHvo/87Bb3h2IvA
         IqX1jO2uWSFtsYUDBrUpFA985h8VgHcVytZD2cSz6iQOZNg3QseES2CQzGyUT7JppXLG
         GgD6NNQLnUfqYrkG61wUQTOLe0nwXPyfRVsQiHs0nkEjcYU+7hd4s2j59C0nL1he4FYV
         UtXMLKUog726SOLxDo3C9Ap0Zfvgal5zt7tlk7SPIwRlTNKscTa/C8v3v69N1PlgYXKl
         +57w==
X-Forwarded-Encrypted: i=1; AJvYcCUxq5tvxoHI5Ng40BLm3UMYjkUaC6VnFQF6z7DhYikN8oyYw+8nAF6qz+iWMSOJtZMNjNvutfpdqchMTw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6olBpmS0cfD7Y9Qt6YLRkj7fZ93MhAaoMXf6qnKKPDZJ/FKa
	zw9EbqaQtfDLEqO7f+NHHcVta5Xpf/SHoXRHmCtz9GS+dI2AxPYClQiOq11BqLc6jLoBulA29zm
	2sv/Fj8/LfESGkk+dOiZy/+rfBcV9ftmTc/k6rlHsTQ==
X-Gm-Gg: ASbGncswTtGqJpaWWaLvt13c4cjPp5IImc/ZsgX2/P5n8f1ppeCyLgjL2ClvxKuZOYg
	Js3Eel9YAac7pmn1xlD8yNMrz+dRo3JSVuvzbBEOqKFRqIbFQ9N1eYD9K19w2KbcyBgT6c3zpqC
	eUmQnihYpmwi7ciVrn9tXNB996RzC1xw==
X-Google-Smtp-Source: AGHT+IGaVOqjIzAB561vdH5Hbbg07f5eH4frJqvp4egHE/9NCFYNrscEPGV/Tobtkh4P8BLSDloZ7s9mOifSf/ln61U=
X-Received: by 2002:a05:622a:5a0f:b0:4a5:a598:bd8d with SMTP id
 d75a77b69052e-4a5ba9952c4mr182042171cf.0.1749390592477; Sun, 08 Jun 2025
 06:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-10-pasha.tatashin@soleen.com> <mafs0y0u6rx8y.fsf@kernel.org>
In-Reply-To: <mafs0y0u6rx8y.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 09:49:15 -0400
X-Gm-Features: AX0GCFsi4mFrjkMNphkUTbPiCT0VoL7ft4Nnhm6lamBfB757JhUYg6mKdNCbvJk
Message-ID: <CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
Subject: Re: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Implements the core logic within luo_files.c to invoke the prepare,
> > reboot, finish, and cancel callbacks for preserved file instances,
> > replacing the previous stub implementations. It also handles
> > the persistence and retrieval of the u64 data payload associated with
> > each file via the LUO FDT.
> >
> > This completes the core mechanism enabling registered filesystem
> > handlers to actively manage file state across the live update
> > transition using the LUO framework.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++++++++-
> >  1 file changed, 103 insertions(+), 2 deletions(-)
> >
> [...]
> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
> >   */
> >  int luo_do_files_freeze_calls(void)
> >  {
> > -     return 0;
> > +     unsigned long token;
> > +     struct luo_file *h;
> > +     int ret;
> > +
> > +     xa_for_each(&luo_files_xa_out, token, h) {
>
> Should we also ensure at this point that there are no open handles to
> this file? How else would a file system ensure the file is in quiescent
> state to do its final serialization?

Do you mean check refcnt here? If so, this is a good idea, but first
we need to implement the lifecycle of liveupdate agent correctectly,
where owner of FD must survive through entering into reboot() with
/dev/liveupdate still open.

> This conflicts with my suggestion to have freeze callbacks never fail,
> but now that I think of it, this is also important, so maybe we have to
> live with freeze that can fail.
>
> > +             if (h->fs->freeze) {
> > +                     ret =3D h->fs->freeze(h->file, h->fs->arg,
> > +                                         &h->private_data);
> > +                     if (ret < 0) {
> > +                             pr_err("Freeze callback failed for file t=
oken %#0llx handler '%s' [%d]\n",
> > +                                    (u64)token, h->fs->compatible, ret=
);
> > +                             __luo_do_files_cancel_calls(h);
> > +
> > +                             return ret;
> > +                     }
> > +             }
> > +     }
> > +
> > +     ret =3D luo_files_commit_data_to_fdt();
> > +     if (ret)
> > +             __luo_do_files_cancel_calls(NULL);
> > +
> > +     return ret;
> >  }
> >
> >  /**
> > @@ -316,7 +402,20 @@ int luo_do_files_freeze_calls(void)
> >   */
> >  void luo_do_files_finish_calls(void)
> >  {
> > +     unsigned long token;
> > +     struct luo_file *h;
> > +
> >       luo_files_recreate_luo_files_xa_in();
> > +     xa_for_each(&luo_files_xa_in, token, h) {
> > +             mutex_lock(&h->mutex);
> > +             if (h->state =3D=3D LIVEUPDATE_STATE_UPDATED && h->fs->fi=
nish) {
> > +                     h->fs->finish(h->file, h->fs->arg,
> > +                                   h->private_data,
> > +                                   h->reclaimed);
> > +                     h->state =3D LIVEUPDATE_STATE_NORMAL;
> > +             }
> > +             mutex_unlock(&h->mutex);
> > +     }
>
> We can also clean up luo_files_xa_in at this point, right?

Yes, we can.

Thank you,
Pasha

>
> >  }
> >
> >  /**
> > @@ -330,6 +429,8 @@ void luo_do_files_finish_calls(void)
> >   */
> >  void luo_do_files_cancel_calls(void)
> >  {
> > +     __luo_do_files_cancel_calls(NULL);
> > +     luo_files_commit_data_to_fdt();
> >  }
> >
> >  /**
>
> --
> Regards,
> Pratyush Yadav
