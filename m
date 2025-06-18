Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5EA2820C5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249755; cv=none; b=DMI06y+zMrn7aUqqbbYaYtaFmqZ/BE7LnWQ8YRKOi3OAIYZcZeg92he7TLY42gl+MB+Q/aK9491fEQmgp7B3K8SmsSQR/6ZS8jMLV0wnC3H/dlcHqM7EKL9w1HSS3XzuHyMO0a2kkP6X1F5XQ72zK2UkTo+/lxXDJGrAinmjLOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249755; c=relaxed/simple;
	bh=k1ToMvPhb2nfK3xpZ0YNG/kZh4jrPc+viBe0YLqGLi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVG1/CKmXodMd1PQ3b/z4mXw0oBuSwQEau+Nhfk28dLWeiXlREuVTxpFJquREl+ooKxVHftKHWyLVWBWRBitTIdTmy6NpOSTgtRU9MEbcCnry+xEQtdb9WISR7Ohw0vdylo5cc5yaiBoGVWS8Vv+IUX6SW+Lcb74LHKcAQGHtDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=j4k3kesd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="j4k3kesd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2352400344aso64635665ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1750249753; x=1750854553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1ToMvPhb2nfK3xpZ0YNG/kZh4jrPc+viBe0YLqGLi0=;
        b=j4k3kesdSClYAEDTF1DrfW8oVmVSSlyKRkPBDTOiPzZRDdv4rsIPaBWMj9aVtH0qtZ
         r5EnU1CiQ9RwrgOkarxNc/XWtmmJqpdOzIkJThdpTZuIRVjGqMfey+REZ62EcKmxIohM
         cd0QDbhS/ijuqIpDfF92OFED10MjaBKO8cqDGbtyCR0sh22lrqi0g8lunxTKMZvpaGRX
         z6B0SxbF8A0y+ErPfT5FygfD93EfIYQcGLZ3mWaCQCMvVjKKVnelS79ri2Yeas85/J/B
         21THAQEYjvCmo5WDbEWow+KQx7g7QoUOpmNcUMoyMN5hl0x/XhsbTmoHhjwfXYM2+NDP
         Jzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249753; x=1750854553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1ToMvPhb2nfK3xpZ0YNG/kZh4jrPc+viBe0YLqGLi0=;
        b=P4Su7GLXUI/iGGXV6oSd+4Q3DGsLLvI469eY0oLKqIAoDXpPkzrmA4j/FdUs8Vv3nt
         m8q1dsOGLXELSs5EBFqDKptranc5zSPMaIpvrpFC2xxwPGUv7FoPtrSnNdNNGzfOmnPG
         m+Ggy8FzD4TdB7xq4f7/svrTxdovubnP+hbS8rsraSx7pSkrvlKPwFSiyFF82O9loDH3
         DG2jwLuuxclYaofdW5G0rUSdQGq4fttSUXCkeAWiW90/GhqiLI7zDEWox/i4fLmkzZvT
         kNMPaH/3XGLr5REme5rBZSuZy6oypvPnB5zYiCBCTKNwPclQ1Yx9jxhpJt/qtSp8Q/iA
         4Clg==
X-Forwarded-Encrypted: i=1; AJvYcCVsHH7PoxwKk88ZM/qiWcmwODs2F100llLalEDoMOzdoPuLqXHfPJujdQqWyY06AokNc3lUpLilnq/Lbfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHaXsYsiPWESWcTn3DodsepD5qiBXXzb1D+BF+JJnoDsLWt10
	9OzrVQ+FfgcdiMxXBc616V5dtS3cvy+B4kjnXpU2Jn/4PzXE15jzTVa+Cqwh+QZRtgnV/yRNmQl
	Pp065cNV3S/0ROsLl8ESw7CC8ooPhCkllCzSzHo7bbA==
X-Gm-Gg: ASbGnct62Pky3BKdA4vj02sV1E04Z7rlOjB5VUuuiRB6K3gQh/Is92NES7WMsAPb6U1
	MHjCkqbSAYf9BfAX3hn2+9oiBueErA1EjS4NZ3UQnE6+sAb4pEEZj7ppTG61WU0edZQULHNCSoC
	KqswEKIJeeQjnnuD9laVfpHvzDmyi4DPzVqd0k0rl0cEw9bZgLJZhbc69/41Yy
X-Google-Smtp-Source: AGHT+IGORnWPn6X8jkI2B9VRfShbK7BW0yz2jVJzmG/TWFTGuZgHTvmgv5OkoiBfEfZxZHJS/HUcsPVug4C43uBDSvY=
X-Received: by 2002:a17:90b:2dd2:b0:312:f88d:25f9 with SMTP id
 98e67ed59e1d1-313f1c7dacfmr27688759a91.7.1750249752875; Wed, 18 Jun 2025
 05:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616095532.47020-1-matt@readmodwrite.com> <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
 <CAENh_SQPLHC8pswTRoqh0bQR84HHQmnO3bM07UQa1Xu9uY_3WA@mail.gmail.com> <CAADnVQ+QyPqi7XJ2p=S9FVDbOxMXvVPU859n+2ApuRQv5T2S5w@mail.gmail.com>
In-Reply-To: <CAADnVQ+QyPqi7XJ2p=S9FVDbOxMXvVPU859n+2ApuRQv5T2S5w@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Wed, 18 Jun 2025 13:29:01 +0100
X-Gm-Features: Ac12FXwDEAhDzTRAN0K4xbEQuq2S3-I5MeDpvbC5scQ0X-LXzuvGn8MnFsuiUhA
Message-ID: <CAENh_SQgZ5yVpshKRhiezhGMDAMvgV7SmwD_8u++mACE33oNrg@mail.gmail.com>
Subject: Re: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>, 
	Matt Fleming <mfleming@cloudflare.com>, hawk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 4:55=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Jun 17, 2025 at 2:43=E2=80=AFAM Matt Fleming <matt@readmodwrite.c=
om> wrote:
> >
>
> > soft lockup - CPU#41 stuck for 76s
>
> How many elements are in the trie that it takes 76 seconds??

We run our maps with potentially millions of entries, so it's the size
of the map plus the fact that kfree() does more work with KASAN that
triggers this for us.

> I feel the issue is different.
> It seems the trie_free() algorithm doesn't scale.
> Pls share a full reproducer.

Yes, the scalability of the algorithm is also an issue. Jesper (CC'd)
had some thoughts on this.

But regardless, it seems like a bad idea to have an unbounded loop
inside the kernel that processes user-controlled data.

Thanks,
Matt
