Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B54223DC1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259952; cv=none; b=pl5q+EWqLm0MQltveh+9rMyfr3fyWVAQ8l0LMAllN0YMmPieIcwpqjQ5QOdHYagnNjUy/Knqi+skmCzZEJ2dYh4Ou+PRRvfzo/bFFAsFosgBYx+uW2qz22XA83fH59wB3FwoRvsGf/1rUkxArKp4SRVjF011gbpJFG7xbdKlGXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259952; c=relaxed/simple;
	bh=TWcw01T/w6LATvvOxnm+hi0n7GlTE/e5VE0POQyIkdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XH3IkpQi0uvdViQUdzSVJlhO9PFhiJW7xfDKbkxfyPGQSu8QQADDHO7ez60sYCHq3SWtmfPoFoZuHbaeKHnA5cRGToXs8yWzea6qmanHfx1fJWnHnvch4nupehp+2irbgG1ghnajBUPy4EFXCgYah1Sd7lZO1/lusjf4mxXNRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0MEKTI9J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0MEKTI9J"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso22185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747259949; x=1747864749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6BjLggY6RYhBduHWEU2r/0qSGTtOcmp2Rv7SfgPX2c=;
        b=0MEKTI9JkWbPmqdbIMQad8MqxocU6iEyWj+GDKhmo9EITGFBnYkfatuJJscQvu32it
         Rz7W4+RpO52lhuN3KPVYkfXjxznMMvokL55fIHChPtV+XsWCTc+AbFOBBiMp1U9bovFU
         6BiTYB3oQa7ZJcO2h5cVNP8iuqRcAod9dp7zhQyso4t4hiFgjo+cJDVwNlsfXy51YuBk
         MKAE5WpdoBqv+BvDVpSvDoyC8eOrNiw4XIj6nxWWOQArkXjKtVpW172OWFyrs8EqFZ0H
         bnfJOjI/QaLVLw3PCzY2gi9nVFbR/5GkURkTqj8HWUX+WRecEbTcG0h5xyySbJCrW8ya
         bTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747259949; x=1747864749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6BjLggY6RYhBduHWEU2r/0qSGTtOcmp2Rv7SfgPX2c=;
        b=iqDzaWad/3p4+HrX8bbqKuQVJdILC8tPQVzTIhFOeOOKzf9S/a/pW3KHf4/jzUOR5k
         x2ySiDZRShWK2mGdVzgNxaFdHMHZIJI4uAvu+ex+3FuZiIyltPUkBcdLhv8eU7rj/H2Z
         aj4F0lWPdPXTJISxD7XBI5v48zEfNmETG2gfTPRzi6Q/mdYWJyripqt6zMcQd/sfotjt
         mKDGCHQ4lFpL6Z+So/ixqi+zYKBbiP0mgNmJHpUhhQKpVBGvdjEkmP6OhiuqXnPVX0Ze
         /ZQKNgsZQXktKvfUG29It12DRkJMMTevHXalhvKz2t1zaY0QXHdnxyhO0ckZwSvwbpsT
         6NtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtx4fuhPaNP21Ps6hO2IQRygzDJ8oZzqXdHwvaTim644pY0Q+xfNyBB6+5E5FOQCVOIYDcByTQ7mxroHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfMsi+6ObJaAYy24zUcwROBD7uT2pwPglasAqFfXPgDH6Pjh0
	qnmiNMyyViIL596EVxAJJ7PQj66wGY054qCJLdgmNWQ567jwmGRcrnOD7E68nFYfq//6Fl/WBVU
	98rSUj4xTVkovHkr4DK30RYsiXUgmBWV/0ZYuS1H1
X-Gm-Gg: ASbGnculSwIGtpla7yIzoSHc9PucmZMbPAUanp9yZZFEz/KMz6w4kjMHCM+okUyYj7H
	yIhIm5Y+SNtOfXZT/qIDd2wWoC3p7QgPh7KmxO5+vuwPKd6Sgn4i/CXk8NKA2d0C1Pfzib15UUh
	NMR/e5wV/oK0qTWvRJZFOy3nzQSKZuTUbcB10nMW9H/gTYAufPSZhz/sqI9Ue6F0Y=
X-Google-Smtp-Source: AGHT+IF9CkMy8uQHae8tBwjfZQnl2xTDU2FaaHSwjDP6uOoyICX4dbqTYj1/pDGgkaVhdrmo/aPKYQuBWpB4B9m3R6w=
X-Received: by 2002:a05:600c:6095:b0:441:aaa8:312e with SMTP id
 5b1f17b1804b1-442f8b45ad1mr472635e9.6.1747259949004; Wed, 14 May 2025
 14:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163601.812317-1-tjmercier@google.com> <20250513163601.812317-5-tjmercier@google.com>
 <CAPhsuW4uKxFP=i2KgaKPvezD5sBcVheQRBF1fY5DyYafin_yFQ@mail.gmail.com>
In-Reply-To: <CAPhsuW4uKxFP=i2KgaKPvezD5sBcVheQRBF1fY5DyYafin_yFQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 14 May 2025 14:58:57 -0700
X-Gm-Features: AX0GCFvBkYq3GWDHm1043uOPWEQY2osVY6pw6Ua9BcA8wU905Xni8mQWiWzsG7M
Message-ID: <CABdmKX3Q5+bfbBBndSS6mxUhapFGY5zLr9CV-p0+CfNPOzuvGA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 4/5] selftests/bpf: Add test for dmabuf_iter
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

On Wed, May 14, 2025 at 1:53=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Tue, May 13, 2025 at 9:36=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > This test creates a udmabuf, and a dmabuf from the system dmabuf heap,
> > and uses a BPF program that prints dmabuf metadata with the new
> > dmabuf_iter to verify they can be found.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Song Liu <song@kernel.org>

Thanks.

>
> With one more comment below.
>
> [...]
>
> > diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/te=
sting/selftests/bpf/progs/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..2a1b5397196d
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > @@ -0,0 +1,53 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2025 Google LLC */
> > +#include <vmlinux.h>
> > +#include <bpf/bpf_core_read.h>
> > +#include <bpf/bpf_helpers.h>
> > +
> > +/* From uapi/linux/dma-buf.h */
> > +#define DMA_BUF_NAME_LEN 32
> > +
> > +char _license[] SEC("license") =3D "GPL";
> > +
> > +/*
> > + * Fields output by this iterator are delimited by newlines. Convert a=
ny
> > + * newlines in user-provided printed strings to spaces.
> > + */
> > +static void sanitize_string(char *src, size_t size)
> > +{
> > +       for (char *c =3D src; *c && (size_t)(c - src) < size; ++c)
>
> We should do the size check first, right? IOW:
>
> for (char *c =3D src; (size_t)(c - src) < size && *c; ++c)

Yeah if you call the function with size =3D 0, which is kinda
questionable and not possible with the non-zero array size that is
tied to immutable UAPI. Let's change it like you suggest.


>
> > +               if (*c =3D=3D '\n')
> > +                       *c =3D ' ';
> > +}
> > +
> [...]
