Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A89231CAE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901560; cv=none; b=KV/SHz66dyhMfSyHgpyjMJhb6bAkN6N2tDxmCU+v9cQR/19UcfhkQbARSyEom2jUeEBsAZUhMNn17Re+Gn3owYVrzzqFdKIUB1VyC5Et3VssZzKocHF02glFxAg7KFfyPhfrcXZ4ObjI46PizwUlm78c2DPnbfBdof2ZHvcSi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901560; c=relaxed/simple;
	bh=ljH7Na1CjKFmZ9WKQeQ3cW1kEi3W80vBZcOQYMb3Cug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gghoKRqoGB6SQxkzT6mP/54oVVMWO3D1pPJ5piRLsQeH+v0HNWUJHX2d63xvvixaNfI03856zDCbDk1L0b1sM5sQ+jTgodgZPwTv5SJVDjshm9fkvIPDKbtA6OFQrRGaKL6PzXeOCu4yOeT6wsk4KX2PZKBjOJ3sk6YIFJV5iJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=WWadQTTu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="WWadQTTu"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7814aa2adso116820566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1738901556; x=1739506356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfKeNd5YsT4IdLY3wC4IJkumtp1al9zTd0Fhjp7u0qk=;
        b=WWadQTTuWKonMg+YWigynolMhGVCClf0b8wXsAavP85s6hzYphW+UPRcyhU1QFLUgq
         2StENoPcal6yBlLhv8brdcj2ek2esQM68qizNaRQYoh4eeGgF4MULInBx4mTbLJgy4lG
         R9pVQkIqSzvvvHjocTH2fhsyNKyldq1FwI9vwIZHqZPnPpaHDDMATfPa6lgMr+jkqC8r
         OkYpr7ia0zXExGujWOV9J+OwE32TF+Op8hLZfxV8fV+sqAzoOqdOkGuN0JWrQN2/1oVD
         Luj4HP2PxwcUDoEUDeqUBihNUjtAa3k5uamvuNSwv59UW29nE/jWgU7qPbR8JvTXQvIJ
         3FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738901556; x=1739506356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfKeNd5YsT4IdLY3wC4IJkumtp1al9zTd0Fhjp7u0qk=;
        b=Fi5IamYypXDC5iRQtGMNf1ejMMUjpIi+pg7gGi42zlXmuqT6ziw7IP29L4cEwtdNau
         i2V9nx/DxKs65Z7i7/JDkfxjy3YIyzzPMO/Dtbk5KeAmtn4UQpbMukhH3Qkw4eYXJ2v/
         jl0x3ttK2u/90rMKbHHsvWf6P+S1x2XqTmJRgQffhdIgnFnu/n3+EKkgSDK38mK+HyTy
         oPEH5/hb960z3cTMhEVMl8qdy5QnMDqo9MjCquXja1BDGsFh5kR85OjiK+w+sjZVwWwN
         Eb/qgR+f3YVYYALhy4TCElFwfwzWhYm3k/XMWwx4puC7uUTids9Ptcx5/kQVJ8CCbZ2U
         GZiA==
X-Forwarded-Encrypted: i=1; AJvYcCUyLGFdk3cdsWBxC2lyryQplLzuy2UuFeefONU8etWUid0jar2Nl92ibH4wM/vvPYhix9uq1+OZ0gCAJWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxb02PIuicQ8GBo7Y2fra/RAQ+FR5z3MNPkny50C71Gsx2E23D
	e5zsPcBZO/EG4P2bitzHUF/F3MBWMmf/Fp8NVhGiGZy+uG2qAZBF8HkslMJYNzLcGs0QaJO4ElV
	G9nkGFBvnu4435yafKPTEZkJllRAdDFSIyX3M1g==
X-Gm-Gg: ASbGncvkNbhp+qbkxv5oDOi0qaKj/AfuNbEn8zkrcCa8Jm4aBCo/B32SKhVcyvHjxdu
	Wf4BXz2szHVozkRriG/gFSI7A+f2RbLTtPkk0QbhmCk5oPS7zrqmFCvqKpG8HmKw+QCfn2gooEQ
	orMIxHCO5xAxDGKEA=
X-Google-Smtp-Source: AGHT+IF+Dr5Nq2mH34Odbm2J6M0KJZHkh2UhWnVHf00IT85KBVmDwpzVa2YALsjOafjhhAQObIf2PDcukGPveI5Ezxg=
X-Received: by 2002:a05:6402:208a:b0:5dc:5a51:cbfa with SMTP id
 4fb4d7f45d1cf-5de44fe949emr4939486a12.6.1738901556568; Thu, 06 Feb 2025
 20:12:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6OYbS4WqQnmzi2z@debian.debian> <5f6610a1-3cd0-764e-0f49-91af1004ea50@huaweicloud.com>
 <CAO3-PbrGR-U0+TxgeUUZHSwvNw2Dx=o6_EYf60ND7BLiLA-xWQ@mail.gmail.com>
In-Reply-To: <CAO3-PbrGR-U0+TxgeUUZHSwvNw2Dx=o6_EYf60ND7BLiLA-xWQ@mail.gmail.com>
From: Yan Zhai <yan@cloudflare.com>
Date: Thu, 6 Feb 2025 22:12:25 -0600
X-Gm-Features: AWEUYZkk5n3m-qzxQp53kd6ix3x2ANE2POQRC5vHVyak4SJ0fxlTXB7Q5H7kjkk
Message-ID: <CAO3-PbqOFMMzcy9VBLaTtvihnuCJ2u38RMPnYNPckjF8BzdDkQ@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: skip non existing key in generic_map_lookup_batch
To: Hou Tao <houtao@huaweicloud.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Brian Vazquez <brianvv@google.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 2:20=E2=80=AFAM Yan Zhai <yan@cloudflare.com> wrote:
>
> On Thu, Feb 6, 2025 at 12:40=E2=80=AFAM Hou Tao <houtao@huaweicloud.com> =
wrote:
> >
> >
> >
> > Yes, the retry logic doesn't change the previous key. Thanks for the
> > clarifying.
> > > And by "skipping to the next key", it's simply
> > >
> > >   if (err =3D=3D -ENOENT)
> > >        goto next_key;
> > >
> > > Note the "next_key" label was not in the current codebase. It is only
> > > in my posted patch. I don't think this would break lpm_trie unless I
> > > missed something.
> >
> > I was trying to say that the proposed patch may break the lookup_batch
> > operation for lpm_trie, and let me explain step by step:
> >
> > For LPM trie map:
> > (1) ->map_get_next_key(map, prev_key, key) returns a valid key
> >
> > (2) bpf_map_copy_value() return -ENOMENT
> > It means the key must be deleted concurrently.
> >
>
> I see what you mean now, thanks for the detailed explanation!
>
> So for lpm_trie, if an element is deleted between get_next_key and
> copy_value, then retry would still proceed to its next tree node. But
> with or without retry, I think we cannot prevent the key from cycling
> back to the beginning: an element can be deleted after copy_value, so
> the key becomes invalid. After swap with prev_key and call
> bpf_get_next_key, it cycles back to the leftmost. Similar can happen
> if during retry the prev_key also gets invalidated. IIUC the rcu
> locking in lookup really cannot prevent the tree structure from
> changes.
>
> On the other hand, bpf_map_get_next_key manual already specifies "If a
> key is not found, the operation returns zero and sets the next_key
> pointer to the key of the first element.". IMHO it probably makes more
> sense that, regardless of normal or batch lookup, it is ultimately the
> user's responsibility to properly synchronize, or deduplicate what is
> returned from the kernel. I intend to keep the "skip to next" to save
> the unnecessary complexity here, unless there are strong objections
> that I should not.

Thought about this again. It is interesting that hashmap batch lookup
actually guarantees no duplicate in output today. If we want to
achieve the same for lpm_trie, it should have its own batch lookup
routine, which could properly lock the trie against mutation. For the
generic batch, it is still better to be simple. Let me put this in the
V2 patchset for discussion.

best
Yan

>
> > (3) goto next_key
> > It swaps the prev_key and key
> >
> > (4) ->map_get_next_key(map, prev_key, key) again
> > prev_key points to a non-existing key, for LPM trie it will treat just
> > like prev_key=3DNULL case, the returned key will be duplicated.
> >
