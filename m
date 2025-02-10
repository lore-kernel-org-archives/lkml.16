Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4C2580C7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204512; cv=none; b=g9FppnmCpYGz0l5H1IRBJrEn+lDFoBzDniigQa6BtjpsvBtx5aymE4yijRtgs+rwYBg7UufYCxlF4sUE0I575CScjcdpToSHSfM6+uy0XWvWZOUEDuA27CS/Xt0Y8NCehKqqbPCH6Q+wbrZeTOKkXOuPL9k32L/Zw9d9eJm3aS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204512; c=relaxed/simple;
	bh=KIqBkUSyhCVeVPELNP6ISV0HCnomhljLgtcM2pOAoUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1/bBYrLwqgWdG7cNSQNb78YXcSkHkr5IEL+kJXI7o+23ApQjZ+gbP/qJTKuOsUvtgOmVrnMUUqevUwt9el+BLxJ85dgXfGO6wTdj7h9J3dpb4KUF7UEHXl+B7ewb2D/muxPN6c45ULrPK92qVTMuzcSr1Inxo5SxDAiSHcwCE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Spyl11ur; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Spyl11ur"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so3502606a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1739204509; x=1739809309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIqBkUSyhCVeVPELNP6ISV0HCnomhljLgtcM2pOAoUg=;
        b=Spyl11urk48vjBb63Eiqe68b5dQQq6kwPba4Aww0qcYBhgagSi0EPHuHxnciOeTC5L
         dzooTKDnsUyYYh04/vSp/9RjLK5ptplUHlvc+v5uctevsHfuinmlIkmnkD/uak4Elcjr
         3oKPGFa2R4bt6cs033p786DCzVIJnM+JZfvSOG+GBBh+m1nG3bmNzGTSkw4H8fNDPg4n
         61D42Wcxw4QV+x6/KEnodlLdXVtU3uv+8usJlMntfuUhdHBaXlKTL9d3YmYaHN/LTkJB
         qUwuWRi6kEg5mJcxYBfvaVKsiUs5QYm+ckWfotS+yGiiQzUG1pF0c7EiqraFGyL/KPU5
         0aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204509; x=1739809309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIqBkUSyhCVeVPELNP6ISV0HCnomhljLgtcM2pOAoUg=;
        b=RQgA8ghfCGg8sqB9dv++alcMVVBGOju9b4VuWECje0AK48PPe8v5vBCpPKHST/OIvD
         8Mnl3giSfM1jtcx9D2pdiF0hbCFE/HJ0jTkv4ivZtO2EcfWatXHwnVoywTS4qARv/YOA
         fzymbt0hlb5GStHqjC43VWaaDMN5mQ3joKWy9QInppftTeHO/gChH9JuXwB++qPtDjht
         S1o1sqZ0Ea+W6956vrLJKDQorLSvjCLQG63gZcQ38XYqZsJyVh5R0+zW/EM53fLtA6jd
         3+0IRg0gR6FTFBPnzRNdlHPMAdXXL/LePF6COOs6ZUR+s6BONUB2/tpS+z3CFa1qQUt3
         AEAw==
X-Forwarded-Encrypted: i=1; AJvYcCXTnwlN0rRetUeTPEcAwt1D1vopfgaHSxja+KRVytZQ2uw/h8qG+RRsjYTROxQK1VtBmTyqLabD4CSnj/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjnsyreQVLP5JrbLjjvjA9hh9eN2PjcIwLD0p4bomzLDAuZYwY
	Z++tYEHU6f0OazQW9cOM1xKNEpPDlME5rQWgj2n1tQ7nJA192o86+ifOSRs3M93RtwqvUm60Zga
	pwJLgCG5ucqUKqMLiX7z3jagL/At1gCC8z7ubJg==
X-Gm-Gg: ASbGncsjpalFO+jDz+03gwSCzyTDqF1KuWKTOimOuGWrZf91I6Khvie7IIiSprumw5A
	iqHAdXNgA3GA0AfMgQGtqH9SLeUgoJFJ5yiG8QvKZ0HGXzTbS1HxLpNrLH1Ltu689WvkHIS4mOS
	5WwSjpFascDcKLU9I=
X-Google-Smtp-Source: AGHT+IHy71NYgSP/cCvRFmJ3G6I8GQkkK8vW2MV7RYTmiEkeOtYPIG8dZEldxTbMHipBtrY+5n8UQFrBgYq2RkcMjZw=
X-Received: by 2002:a05:6402:13c5:b0:5db:e7eb:1b4a with SMTP id
 4fb4d7f45d1cf-5de45005a3bmr15164299a12.10.1739204509076; Mon, 10 Feb 2025
 08:21:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739171594.git.yan@cloudflare.com> <85618439eea75930630685c467ccefeac0942e2b.1739171594.git.yan@cloudflare.com>
 <Z6nEsGSbWqCSaVp3@krava> <CAMzD94QZQjpwOA8Os3khG32d2zgH8i=Sy1VoudRCGqZudyHkag@mail.gmail.com>
In-Reply-To: <CAMzD94QZQjpwOA8Os3khG32d2zgH8i=Sy1VoudRCGqZudyHkag@mail.gmail.com>
From: Yan Zhai <yan@cloudflare.com>
Date: Mon, 10 Feb 2025 10:21:38 -0600
X-Gm-Features: AWEUYZlnLuiCJjRJtIJZwpaZNOpATxR3bl3tZuwbBXDssS0d0dx6XXBf-mXpTzk
Message-ID: <CAO3-Pbqa_oOm-u318mTwqPfuRJ2_kdk+ou99BOu53A3O_wEyZg@mail.gmail.com>
Subject: Re: [PATCH v3 bpf 1/2] bpf: skip non exist keys in generic_map_lookup_batch
To: Brian Vazquez <brianvv@google.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
	Hou Tao <houtao@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian, Jiri

thanks for the comments.

On Mon, Feb 10, 2025 at 8:47=E2=80=AFAM Brian Vazquez <brianvv@google.com> =
wrote:
>
> On Mon, Feb 10, 2025 at 4:19=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wr=
ote:
> >
> > On Sun, Feb 09, 2025 at 11:22:35PM -0800, Yan Zhai wrote:
> > > The generic_map_lookup_batch currently returns EINTR if it fails with
> > > ENOENT and retries several times on bpf_map_copy_value. The next batc=
h
> > > would start from the same location, presuming it's a transient issue.
> > > This is incorrect if a map can actually have "holes", i.e.
> > > "get_next_key" can return a key that does not point to a valid value.=
 At
> > > least the array of maps type may contain such holes legitly. Right no=
w
> > > these holes show up, generic batch lookup cannot proceed any more. It
> > > will always fail with EINTR errors.
> > >
> > > Rather, do not retry in generic_map_lookup_batch. If it finds a non
> > > existing element, skip to the next key. This simple solution comes wi=
th
> > > a price that transient errors may not be recovered, and the iteration
> > > might cycle back to the first key under parallel deletion. For exampl=
e,
> >
> > probably stupid question, but why not keep the retry logic and when
> > it fails then instead of returning EINTR just jump to the next key
> >
> > jirka
>
> +1, keeping the retry logic but moving to the next key on error sounds
> like a sensible approach.
>
I made the trade off since retry would consistently fail for the array
of maps, so it is merely wasting cycles to ever do so. It is already
pretty slow to read these maps today from userspace (for us we read
them for accounting/monitoring purposes), so it is nice to save a few
cycles especially for sparse maps. E.g. We use inner maps to store
protocol specific actions in an array of maps with 256 slots, but
usually only a few common protocols like TCP/UDP/ICMP are populated,
leaving most "holes". On the other hand, I personally feel it is
really "fragile" if users rely heavily on this logic to survive
concurrent lookup and deletion. Would it make more sense to provide
concurrency guarantee with map specific ops like hash map?

best
Yan
