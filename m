Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7561E24A042
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846838; cv=none; b=d91hRaC8dFZMX+5SHUxy5eGH6z0FP35aij+wvY7e7jDHXDCugwUlAqICVGHsocFl+RwMlu2C65ILIteCM0rO9ziYMig03iMtEiPH0kcU71bQ0Y/RszQW2mqrfPWggL4Nrr+k+LlkIp5aiRjkdxcJxkhd5wcRZrz2LSuBlJmbZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846838; c=relaxed/simple;
	bh=6Mxjt3rihuzILbcLl043WrZ7HaX9/u729SBhzDpJcjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lB/QjuIsWr+7RL+0phg8rI3/+UMjPRpEbWNgrc4eUS3QF8gKriEvis+bVDfnEswAPlGb5+xIpKNui37Fi9ePR9+VyWH8vC6EfpAtisEv710MzqQRc7t50H47uChZsHpXrEN7jXYlHrz76M47XRC2j8s/Nu5aYRE5KC3D+9h4MsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ch8in/eh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ch8in/eh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso13525e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744846835; x=1745451635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mxjt3rihuzILbcLl043WrZ7HaX9/u729SBhzDpJcjw=;
        b=Ch8in/eh3ikaKrLW1WquO1Qu7R15IWcKwsqxcI4AXdM+nY4ks5HEojSssKb6uX5VYB
         YcJ+BtKD7odQgXwJLQUpGYk4FX9Qpub/q5u8dCmeVz7FF6pUZMmSY6MR+jnD5fh9OMLw
         c2dcmFmsig2d7azQCOuz6WfB4myhN6cumc2k11KWHdbIn+qWKkJwi0FulYQ8UQmg+LkZ
         Ah+dVxv8ckXzJRGF4X4So4jzLkBGF1cw7GNMhXbTeZJfTwuNhBpOV7rCytVDhHoj0V31
         TilqLxYuEvsJllVh5jWaWa8f4H+naD0BcOXeV5ZMaVmVe33JENh0SU73UVJTBO7PEKLr
         L+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744846835; x=1745451635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Mxjt3rihuzILbcLl043WrZ7HaX9/u729SBhzDpJcjw=;
        b=e9LrpCUr2Vom+y/9TgOpLZzFbQs95hGgYQ3xe18beJU+CZsJ8jPd+lqglQGs86qG+u
         r7V8cLI6gnmWGIXjik+S8Cdx2W8G4R8tZP9blsUYD4IXtebwqKYgNqOmQhXeNaD3zMkQ
         PhTlx9L3nRLL+xtzFqtMF3nbnjI0RFBaeNGpt1C8Kp3ENrsX96mdNInDWyoqW6qkmBF8
         4EQgPo+AqXuhgD/SWIzH+1de9uGc6kJybPsvdB+X5P9Kx+XEVP2++bc52rbD1nKxd2jz
         FuZZcF3E0fAHJperZqIuN27o/AJXx5s4JcSrqzEBJJsHiN4i0aQ+m2r2ZeFyaLlMVHSY
         ruyw==
X-Forwarded-Encrypted: i=1; AJvYcCWnQlEFTFDYJs/X5XeoXPiBshF2n1t0bWUYOfdX4MJyb6HPIWPsoVDPEj3xGxvv1YTvzZ7Fo6lerkFTvs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy55+KmLuqzb43YMT++tfFNKuk1BRlO3YfBHXQBHgDUcN/jmVjJ
	Zl5+K9wZXfcs9rJRinkGUh6NsDziS10LUHGktz4YDPgPRppGmxmRqb4G+7dMhW1taTcHpXFmSs+
	pFNIZPLGW8FOlbv+y6Lwc7+FgKxFcJEsTiRwD
X-Gm-Gg: ASbGncuSdFC9cnwlNxT2+BVC5um3UclFdmKPaLjOAFH3dYVRfgY9xoF2Gjt99CNNlg+
	b34f6PmV7jn5x0Ugujoe9rToBeW78Pj5AmFLJqEMmuKxQ+AY6cGsIl1QML+alUZL1LS4/0ifPN6
	Y2W4K8IeG4kcAi9uT88IR/lNPM6twuHccKG0fL3xq0HQfaDIlyTa8=
X-Google-Smtp-Source: AGHT+IHYwzghKbnTQryW+DgZnRoQaoVXvuuAUTPz6qIMWx+I2V7QXqmb5/BgPuRKmM0AahWplsMUsAlWl25L3C8nIj0=
X-Received: by 2002:a05:600c:1910:b0:43d:409c:6142 with SMTP id
 5b1f17b1804b1-44062a3eddamr573455e9.0.1744846834549; Wed, 16 Apr 2025
 16:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com> <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com> <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
In-Reply-To: <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 16:40:22 -0700
X-Gm-Features: ATxdqUFLZu_g7cAHhskZ0L5MamFR6bpu5Vd8u8TDIC07BpRPPZAKqsf2Wefu0qw
Message-ID: <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 3:51=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > >
> > > IIUC, the iterator simply traverses elements in a linked list. I feel=
 it is
> > > an overkill to implement a new BPF iterator for it.
> >
> > Like other BPF iterators such as kmem_cache_iter or task_iter.
> > Cgroup_iter iterates trees instead of lists. This is iterating over
> > kernel objects just like the docs say, "A BPF iterator is a type of
> > BPF program that allows users to iterate over specific types of kernel
> > objects". More complicated iteration should not be a requirement here.
> >
> > > Maybe we simply
> > > use debugging tools like crash or drgn for this? The access with
> > > these tools will not be protected by the mutex. But from my personal
> > > experience, this is not a big issue for user space debugging tools.
> >
> > drgn is *way* too slow, and even if it weren't the dependencies for
> > running it aren't available. crash needs debug symbols which also
> > aren't available on user builds. This is not just for manual
> > debugging, it's for reporting memory use in production. Or anything
> > else someone might care to extract like attachment info or refcounts.
>
> Could you please share more information about the use cases and
> the time constraint here, and why drgn is too slow. Is most of the delay
> comes from parsing DWARF? This is mostly for my curiosity, because
> I have been thinking about using drgn to do some monitoring in
> production.
>
> Thanks,
> Song

These RunCommands have 10 second timeouts for example. It's rare that
I see them get exceeded but it happens occasionally.:
https://cs.android.com/android/platform/superproject/main/+/main:frameworks=
/native/cmds/dumpstate/dumpstate.cpp;drc=3D98bdc04b7658fde0a99403fc052d1d18=
e7d48ea6;l=3D2008

The last time I used drgn (admittedly back in 2023) it took over a
minute to iterate through less than 200 cgroups. I'm not sure what the
root cause of the slowness was, but I'd expect the DWARF processing to
be done up-front once and the slowness I experienced was not just at
startup. Eventually I switched over to tracefs for that issue, which
we still use for some telemetry.

Other uses are by statsd for telemetry, memory reporting on app kills
or death, and for "dumpsys meminfo".

Thanks,
T.J.
