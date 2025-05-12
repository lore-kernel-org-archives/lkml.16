Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DE2989B8
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077047; cv=none; b=HxSIUIvkmSxaPVaP4tV631CVc3XNF5lcT7eD43+ftxeMpvTCJwuTbkhDdsw5N14oCJc/+HFH2ZO2Ng5VCS4JlnR/e5XZTb/fZfQM5mR09XUNIIvcpsuVSJrG1HR3nNp4JLoi4HoFexk6uR9hXdMA2CkPu1ge8icCaZ8XK2HcImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077047; c=relaxed/simple;
	bh=7sJCGvd2/PSBwmSbhnI0Hh5oMJHdrnmIUcsLbfEaRDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lpx9WHuLebMck9LzILDPVynPNHIBHqC1BCIZmbcYRy00DTR5gwnOTGcyGDm4LVhnwC2ihsJEDyJgNKiqb/eICXkTmGpG/6euxAfB7g6sXLO+R2yYXw/t7JevNdQ84jsUmTaQqJQ3mj+GW/RpX1UX5McDYZ1hq/NaqJHSgA7YtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YiNhDA7y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YiNhDA7y"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso11755e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747077044; x=1747681844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm/PPoZA1XOQh100d62s3HDVZNFFqoCK54oYIZBXFgE=;
        b=YiNhDA7yL4rhGJEHutNHhtQ2xnHVxjxwIz8kIDpoNB3R1QFs5PvaW9xkyLcJNF+cOY
         4/rqXWayzkl/6UWK4jRdw4PfmcRKzeuyxg3zOTEl53jEVIiZdVTUxaUA/Vq2Gvyw/JB4
         LRgvvovHl/Yb/EHuj5OVMLggoUrEddF7Q/zxsn8mhkUAjcmKDgf+WTvTZl+r1N0MiEUy
         WthZm9BPpOgmXDCIkKGEOobWcP74TdpOcxU4twvI1vUh8nPX6pE/Xjl7CtxvM9/IM4Au
         yyUe5KVoK2cAOtJ9MIB3CvoJVH0D7KVEOHpWeLHia3JuVJICI9wvbhzJC6Rkipnh56Yf
         j+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077044; x=1747681844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm/PPoZA1XOQh100d62s3HDVZNFFqoCK54oYIZBXFgE=;
        b=ssYiWqJ5FF0dL/wQiwua+n2Je07VMWxVTKy67Lu9Eewykv6F9Gb5CbYj2I2Y/MPVCn
         sJAvs3+IakcCiPDTthWTIV5Ut+Q/HWze7RTVSZ+zM8PBUzP8G3ndXXqI49TvmsaYY1m+
         tUj56Jp4+us3Ly+PG6+7IhLk16Ax8XgtyN+uQJrIrv3XV3m+0+Z1TdOYYgFddQlVxI9D
         r5GvLFETGeIgClJJ0pb/Gfsi+qldxhR0iLyLKdilM0CyemjwIEVWXZPIlAPiXkJRIpY0
         drSOXoUAOOvtD5ard/2s+LQHSxKelctt5U1g2Nj3JH3plT/4B7OpeSFAq/I/57uqdqxU
         xPOw==
X-Forwarded-Encrypted: i=1; AJvYcCUQOCBPvSn1XyjL3Q4vuw8cSHWFNNb5I82UrMtOZkl2n+AS8z/wKnNJmHJ7BFBweRkAnIOVNOCVjx8lt5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuz2Cy+lrSm8L71i7509b50taahrk9nALpunOEQwqB7ytnpXI
	SPfCjvTxtv3XTMXtHzrWNNTSFxTV1rI7kh7YouisHW9dKUxuJEIZUSdQt1IeJICuhM8NW6OL+b6
	5r5IVzoGBWitTqmODsL/Mi74L4rM/YYzc3MY7lP8vsHq1+cDQNC/g
X-Gm-Gg: ASbGnctet9iXsswg8Noi/r5yYmy6zXEWNI9tehtC7P53gevM/I9yAT1QJxFTzgzKFX/
	W1JpueZqVyNL8kfASegfmX34gVqwsKG6efA4TnT83qoiSrGLtyazObaj09u7Pr/58S0kDn11Qpf
	Ibvl+9Hjr28fBxpVBtJVe5jOmztYbpUmlrHw15Pvk+iA==
X-Google-Smtp-Source: AGHT+IEhJna6SF6AWqidUoCT2Jm/s8v5ZVMXBVF44DHVGLlvS0U5wRATEd00vS/y2Vx87UPbRiSHB0qxO5c6fEFlwVs=
X-Received: by 2002:a05:600c:308a:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-442eb5c4ef0mr95615e9.5.1747077044127; Mon, 12 May 2025 12:10:44
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com> <20250512174036.266796-5-tjmercier@google.com>
 <CAPhsuW6TUogokra2mJQG6jeuZ1_RZPwr4xGbBOUJZBUg9AqW3g@mail.gmail.com>
In-Reply-To: <CAPhsuW6TUogokra2mJQG6jeuZ1_RZPwr4xGbBOUJZBUg9AqW3g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 May 2025 12:10:31 -0700
X-Gm-Features: AX0GCFuAa1TiNYsj-36X4VBRhiCNdv4k59_jqcRfoVVDhkJg1nA6Timls4X60Xs
Message-ID: <CABdmKX200iB3+_6mVQpCH7agdcwsjbfR5cJKRyySuu-2BsL2gA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 4/5] selftests/bpf: Add test for dmabuf_iter
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:58=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> On Mon, May 12, 2025 at 10:41=E2=80=AFAM T.J. Mercier <tjmercier@google.c=
om> wrote:
> [...]
> > +
> > +static int udmabuf;
>
> static int udmabuf =3D -1;
>
> > +static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udma=
buf_test_buffer_for_iter";
> > +static size_t udmabuf_test_buffer_size;
> > +static int sysheap_dmabuf;
>
> static int sysheap_dmabuf =3D -1;

We don't really need the -1 since the rework in this version
initializes them to -1 on failure, but I'll add it anyway.

> > +static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "sysh=
eap_test_buffer_for_iter";
> > +static size_t sysheap_test_buffer_size;
> > +
> > +static int create_udmabuf(void)
> > +{
> > +       struct udmabuf_create create;
>
> nit: zero initialize create to be future proof.

Ok, done.

>
> > +       int dev_udmabuf, memfd, local_udmabuf;
> > +
> > +       udmabuf_test_buffer_size =3D 10 * getpagesize();
>
> [...]
>
> > +static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter =
*skel)
> > +{
> > +       bool found_test_sysheap_dmabuf =3D false;
> > +       bool found_test_udmabuf =3D false;
> > +       struct DmabufInfo bufinfo;
> > +       size_t linesize =3D 0;
> > +       char *line =3D NULL;
> > +       FILE *iter_file;
> > +       int iter_fd, f =3D INODE;
> > +
> > +       iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_col=
lector));
> > +       ASSERT_OK_FD(iter_fd, "iter_create");
>
> Should we check ASSERT_OK_FD() and exit early on
> failures?

We should fallthrough on error, but let's add the early out.

>
> > +
> > +       iter_file =3D fdopen(iter_fd, "r");
> > +       ASSERT_OK_PTR(iter_file, "fdopen");
>
> Same here.
> [...]
> > +/*
> > + * Fields output by this iterator are delimited by newlines. Convert a=
ny
> > + * newlines in user-provided printed strings to spaces.
> > + */
> > +static void sanitize_string(char *src, size_t size)
> > +{
> > +       for (char *c =3D src; c && (size_t)(c - src) < size; ++c)
>
> Should this be:
>
>   for (char *c =3D src; *c && (size_t)(c - src) < size; ++c)
>
> ?

Yes! Thanks.

> Thanks,
> Song
>
> [...]
