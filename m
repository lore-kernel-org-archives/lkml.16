Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F220E314
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989940; cv=none; b=laAUeF4MIKxHNXfHIgubkEopG+aOtXKI78j1/23E4kBXw2ePVgzxtTW4O4W6Li9NeRLjkEibmfgOd8TJF7tpZFfnbXPEqMWGMp5rC1pOrGw0uSlZTlaEGzNKP8JoZqK6NO4kEvOTHxBTLhJf225cDpofGFXbPCNYFInRM1V1a08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989940; c=relaxed/simple;
	bh=KLMQ/sPbd3/qPx9kvWI7kwA5vqce0csvK2YZ+gn9jtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2Y+vqYRNE0cV6+XUrVvCRUSguRrUiCvFyA4kjY0nlVx80QfoqJWTWFiUY8nIsG229ecYQtJR5P/Q7eSa7f5M0xevRIpHjnBuj/gRVD8QE+6ZdTCO5fTiU521HThmoD8TuFZPSinXry7Nno91Z68xCD5rcs2UgJ5GbF4Iw5zy1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TcOkHnZp; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TcOkHnZp"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47681dba807so294241cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744989937; x=1745594737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLMQ/sPbd3/qPx9kvWI7kwA5vqce0csvK2YZ+gn9jtw=;
        b=TcOkHnZpnJ9dkfJMStaG1k/k2pUOgZYR5/wmSGKGVaznHzK+pz/+4Dk+XZfRdAlRUN
         ArH+pOQtKump/RD0EbQCgdFigzdgeuQNM33Z6L3npWgHMdjtWSpYxAg6O1CY7AA4eNXd
         inQULd+tuAbSsNMdht9dtK7ngE0FhD0yKrVlWBJR/Wg419WceL1J8khMh+vZdTOnh5g9
         ignjP3/ytx+dDhPT29BQeVL+I+dl8LmEtdBWe3DJ++CpCZLx0zBhPAe8GzwFsi9zeg37
         jKxiQvwy94yLvmNGcROJUrbKrwznovvOlZTz/v1+Ju/AowQ4iDtTNQPML9xUwvc+KIeV
         88Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989937; x=1745594737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLMQ/sPbd3/qPx9kvWI7kwA5vqce0csvK2YZ+gn9jtw=;
        b=bZfny+uckGC2l3IySExTfRwMsW+mrngo+srSxiHIVSqCoD+Qf+45D8tw0z4Qbk1h08
         tRQyGl7crvskSQyxIzuFD7Rx00P9gbxz/YJALWddoQLwAtHZ7kl0UnKfXfRM9IElxeSg
         G0Mwr5UozVX+Vf6L4D+sNFvAgGW2It9L0SRG3unCG+mNvc1BzanPzHjEBTmdlJ1ilYoA
         DdVyn38L20z9xhnprEDUke0B9EvvN6N7Xkfvchwpz66qb4RnvRrKSa1wExBsPTpDcCbK
         JiHhImJfq2cPFMvEo+PbJMA9OAzRoq8WtBeqbiFUT3QnByXVGtHooJSOJyHcKAtYbZhn
         vt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8MUUZ0OsaXbX2vqZVw94IAfDe6MwG2iCblVSyLMea2jYMaC2OERmnL0te9rSWedkh5U4U9L2Tumk+2lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKdoJ5TWSIlqYvRMnUdBRxEQQUEGBkb3CUq7CgtNbZdLOITY5
	tKCPpctn1qwNBDPwJdLDPdpdc267SJ91kSRh7UOaffiXir2W0LsRVpMd5iWOz4nYZqn2JRHsZyD
	gRJtWA7l4CHEiy3BAguQhYsDGaEYsqnb3oSKc
X-Gm-Gg: ASbGncv0pcHxM7rolfSLogwgX0ldivuXz956F5RNaQw6FjMsSM0ymtVhSqR1iFrtqK8
	lswF3MIykIyXFbgBTpCi3bbMctGJYBRePBZj2uOS+uAn4bfHCQ0gGH052ua0tZFx+v8AadDmhoX
	bBHcW2VaLjw7mEjvKVyBT3
X-Google-Smtp-Source: AGHT+IG8hFCpUPixQxkgnzGIXz1u9OtkRLiT9un/wX7YdVEX+ucM013ElGjUErTcY8lmL4vrTIPIJfqi3eMA/XDrm6c=
X-Received: by 2002:a05:622a:24f:b0:477:63b7:3523 with SMTP id
 d75a77b69052e-47aeb10f6a4mr3977681cf.4.1744989937094; Fri, 18 Apr 2025
 08:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com> <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
 <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
 <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
 <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
 <CABdmKX0P1tpa-jxzN1_TCyk6Cw6drYM+KRZQ5YQcjNOBFtOFJw@mail.gmail.com> <CAPhsuW5bgBNu6zY0rn7ZH4VK54nruryU4bS4LrDDsxnCfqQicQ@mail.gmail.com>
In-Reply-To: <CAPhsuW5bgBNu6zY0rn7ZH4VK54nruryU4bS4LrDDsxnCfqQicQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 18 Apr 2025 08:25:18 -0700
X-Gm-Features: ATxdqUFe9V2DPeKz_fCeXdwNGaeIYNCwZNnBebHg8eIdjjPIFTp9wITPuXs7j_A
Message-ID: <CABdmKX3XaVFJEQRav1COi7_1rkMsx1ZhrJoGLB_wtywZ0O-jug@mail.gmail.com>
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

On Thu, Apr 17, 2025 at 1:26=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 9:05=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Apr 16, 2025 at 9:56=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > >
> > > > On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> =
wrote:
> > > [...]
> > > > >
> > > > > Here is another rookie question, it appears to me there is a file=
 descriptor
> > > > > associated with each DMA buffer, can we achieve the same goal wit=
h
> > > > > a task-file iterator?
> > > >
> > > > That would find almost all of them, but not the kernel-only
> > > > allocations. (kernel_rss in the dmabuf_dump output I attached earli=
er.
> > > > If there's a leak, it's likely to show up in kernel_rss because som=
e
> > > > driver forgot to release its reference(s).) Also wouldn't that be a
> > > > ton more iterations since we'd have to visit every FD to find the
> > > > small portion that are dmabufs? I'm not actually sure if buffers th=
at
> > > > have been mapped, and then have had their file descriptors closed
> > > > would show up in task_struct->files; if not I think that would mean
> > > > scanning both files and vmas for each task.
> > >
> > > I don't think scanning all FDs to find a small portion of specific FD=
s
> > > is a real issue. We have a tool that scans all FDs in the system and
> > > only dump data for perf_event FDs. I think it should be easy to
> > > prototype a tool by scanning all files and all vmas. If that turns ou=
t
> > > to be very slow, which I highly doubt will be, we can try other
> > > approaches.
> >
> > But this will not find *all* the buffers, and that defeats the purpose
> > of having the iterator.
>
> Do you mean this approach cannot get kernel only allocations? If
> that's the case, we probably do need a separate iterator. I am
> interested in other folks thoughts on this.

Correct.

> > > OTOH, I am wondering whether we can build a more generic iterator
> > > for a list of objects. Adding a iterator for each important kernel li=
sts
> > > seems not scalable in the long term.
> >
> > I think the wide variety of differences in locking for different
> > objects would make this difficult to do in a generic way.
>
> Agreed it is not easy to build a generic solution. But with the
> help from BTF, we can probably build something that covers
> a large number of use cases.

I'm curious what this would look like. I guess a good test would be to
see if anything would work for some subset of the already existing
iterators.
