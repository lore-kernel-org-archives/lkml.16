Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABF299924
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083892; cv=none; b=E6hU3EvEDDXlDhMA3FzKsedPMY5MslUGo4eMzSM4Brb5DhvgSgQ0eBpg/ME3J2aQNjpEt1AJk8SC1QNTB6Gdn3N+j+teJ42lBqC0BnIL9N+ZjsfA7f6MqUJts3uLhbHEIiuuHSRU0jxFHqNMcwxhM5OQ/iYSVTo7JcKwUfQnhZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083892; c=relaxed/simple;
	bh=Fa5oXFBgKaZ6VyL327hvSH4F43ImIjpa6dE33ADenfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MubMvBY9HFo7/tQ9l5EzNlfubWHyf2HJkuyRKgSbxIUkizuhmlxqwU8MWWfeaEa4rrto2kyqFW7EePUMTIlHBb8W2CpUwOAgCRyNHysD24zjwczti7I99s4JJIz+f27yCZyzmI+Bo14tyzKUhs62YQzrR5b+uMjN1z0BYZ5EAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07V5YZ6y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07V5YZ6y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso18855e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747083889; x=1747688689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocHMf+lpxFiUglMvQ3QmzmSqN/TDDldlcwv8ib7D0M4=;
        b=07V5YZ6yB1EFOAkq9FTUQGeOSW8giYiLbHWAitYHwJ0W0M5K3RH0RwhZJ83AGtSlEq
         38VkEfKhPfH/7AKmp13wbApNJiJQNAr6xlcX2zRPKGHOv553n9wgroiqm6T5f92NCQLL
         kSepEQ91Ft8oy9ZqwSLNlDQcn+4hK9TKrKHs2fJj/r1gL4sqXCoRKAKOEFhh03ld9v4W
         t5iwbxxD0xBH80xP9iWsNJyLXU9zvAz9Qs5L0KKRTt3koulxVg+0h5me20JLldjNmXkW
         KXZCXHCDLrph9jqUXNZH6B5xDpvq9Gz8+W7xtTsH+Fy/SLz/U9OTVB1xzCZWU52Oyb+c
         NHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083889; x=1747688689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocHMf+lpxFiUglMvQ3QmzmSqN/TDDldlcwv8ib7D0M4=;
        b=XhyJXzuA2AaAAzfTwZFhaN5rnxFmV5F9I8SO3nr29UEifpVvg5ErejU+Gt6bafSRuO
         xKjDuE3r+cQgxxjjmB5uuj8uIwqOVZ1PRIgFuwFJkYNiw23wRwpK7eLuAN4yPg1GIA8v
         InMg04aJLfyleFso1Nh3GPJ6OeOlzuNgGlm5av7YQh+BYLWgtmwApKqLANaUS4LEMfvt
         CO3gyhmFGaUbnWvb+z91P634xw8UWr6p4J74Gc35uvdhBqSmtB9YtMZGF96vJuyDrYFK
         1gyPIHNF78gl1oYsDyfg+SncrWZzYg0uU9FWuh6DZr+KiPUVglwIo46aoTSCBYEGS8FT
         viOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcOKWJODuw6elkS5Bh20VGeAGaxdtzXRgl2oHpQM5YUOFf7Dr/yZmHhB4ZeJv26SLIxQfyw3f9J/1wY3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIRz2prPm6CErWUwDUdejw32JvQSUUbME2k3cQK+e9GX8471la
	6I5adOfa0lGpdulWdHvYKoa/DmgyUFXLAeHtX7fn/zTyU70KDBSwctls4lAn4jas9j5fraaLQY8
	KsMPTHVV81wqPKXTYn4gyk18YuQ84q9Tsy81j4RpR
X-Gm-Gg: ASbGncv0QkcWh+WWyMizhO7UHDPWaSxh8zN8xuTJ7xu3fo7+fIXwChoWfZwcNdfcKlu
	ZPbFETiw56K/Y4YqcyPCZEFHS7wk4MN13OU04nhXMLCN//kSVMbEg68H80mRaIfBM3WzJ9DnrAK
	lvRqm8iTALIKiCwF0pYOa2uq5bd6w/5+w=
X-Google-Smtp-Source: AGHT+IEr0EA2T8//ChQD2cQVB7Yv0cif1v2Nya6VTYqVvclVsxQ7gPAjPiVgt+BRhoXxGJfdm3L5Wdls6puG9ko+yOc=
X-Received: by 2002:a05:600c:1da4:b0:439:9434:1b66 with SMTP id
 5b1f17b1804b1-442ebbe7e80mr37045e9.1.1747083888729; Mon, 12 May 2025 14:04:48
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com> <20250512174036.266796-6-tjmercier@google.com>
 <CAPhsuW6KEtKu5C+Y_X3EFkUFSg8=LnQ9nJFUD81rYgwvBvqzHg@mail.gmail.com>
In-Reply-To: <CAPhsuW6KEtKu5C+Y_X3EFkUFSg8=LnQ9nJFUD81rYgwvBvqzHg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 May 2025 14:04:36 -0700
X-Gm-Features: AX0GCFvIOd-tF5p6eczt7ynOfdOnjScDBhB5U-GpV17T4Ix1WysDKZAupTNpB3E
Message-ID: <CABdmKX20zo5FhUGf2ZJXvcSetbK25HV9Z=AG8MhLU+dnT_kP6w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 5/5] selftests/bpf: Add test for open coded dmabuf_iter
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

On Mon, May 12, 2025 at 1:30=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, May 12, 2025 at 10:41=E2=80=AFAM T.J. Mercier <tjmercier@google.c=
om> wrote:
> >
> > Use the same test buffers as the traditional iterator and a new BPF map
> > to verify the test buffers can be found with the open coded dmabuf
> > iterator.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Song Liu <song@kernel.org>

Thanks, I'll send v6 this afternoon or tomorrow morning with all changes.

> With a nitpick below.
>
> [...]
>
> >
> > -static int create_test_buffers(void)
> > +static int create_test_buffers(int map_fd)
> >  {
> > +       bool f =3D false;
> > +
> >         udmabuf =3D create_udmabuf();
> >         sysheap_dmabuf =3D create_sys_heap_dmabuf();
> >
> >         if (udmabuf < 0 || sysheap_dmabuf < 0)
> >                 return -1;
> >
> > -       return 0;
> > +       return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name, &f=
, BPF_ANY) ||
> > +              bpf_map_update_elem(map_fd, sysheap_test_buffer_name, &f=
, BPF_ANY);
>
> nit: Instead of passing map_fd in here, we can just call
> bpf_map_update_elem() in test_dmabuf_iter()
>
> [...]
>
