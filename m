Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861EE8F54
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030427; cv=none; b=cfQrmZoh8jkHnFbU1PG6nrVyNLglkawbqmbcd9U2mWn8/GFzsVFKXbNPmPXJwWHbPzVGcgyuzQ5s2B3JETv+G0RXSH49DUM9Tml+J5hntvDyGJvepHgdhkaP4Xhud0Bd5s2b5i8Yltpuz2yLBlrPx24vS1GPDvYruPjwzPrhlZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030427; c=relaxed/simple;
	bh=+IqDP/5D898mg5bRqXoKKwUlqIdUkK66zr4cFdrzj/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2YXddD8+FBJCplfKncjtYPhUujxqfaN3i4avQJe5pJCQx5hCmHjzWHK5Yjc5Oe8QlCK49y7Pi/3eStR/m4S5yowp6MeT/mFli8GMy7URKzYqPXJdvF2btMl4cxNbFGhSxx8XN5e0bFSTffCuixS/HDrWGr76sDU7nYJG21Ko1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=WwRuREss; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="WwRuREss"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso1612881a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1751030426; x=1751635226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0DTgOdoz4H3xcb51586P+FsHsDxKEsY87FUj2jmH+o=;
        b=WwRuREssm5SXWM04k7JDNWw5jpQMSUjMeaXkbY8HMMT2sp+iTv5YpwR+xjLik7xQOh
         LxeNrtOwtn4bdGYtJzISFgvF/pD1m9bFtYAJ2xFGCX7ErqtMiNWolgbK1FMpc9RtGltG
         Nv6cDsWc/e9f605MmS8GxRfZhO4csHd7n3LhYO7G5WXib4fW9ax58mzA5VT3oVDASlWT
         OkQmf7NajcEWbwGoo/1A4/f5mwLmkEVmOYgLKaukogKgBMdnNe3HXunRlQVAl47M1aME
         +4aXPfi9VoU9zA+5BpxXWhwyGBrOBS2JPGoJLB53bAlrVRhXOUrqSRuy7kfQGVkRKUrU
         PhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030426; x=1751635226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0DTgOdoz4H3xcb51586P+FsHsDxKEsY87FUj2jmH+o=;
        b=EF2j19HK2st8c4XoaSk0FcX7AOAvZlNlbYcmdpf28v/qei6elIEMnD6FwKLGHAzuFk
         UcfRMhoHTF7bBaLqq2trrI3FtjZp89BSDZ6QguONxNC6hzVRoHKAoM1/AxaNtYuMX37/
         HUEfSJfaOKxJofA77atk2Y6J3ofLFJI5BIOE6ywtxXiaX5crY0Dgr3wIJ1+qXZc+oW8O
         0T0xwDTZt49/ZkD7WrTpkq736fCnYxVgn60J2teeuGd7Kh4F45BXmsWXi0VsVtxFAWyJ
         To1oNCyz3oy+MBPVMVZtsruY9ey98GVAnHSh/P8iNX9vazgtfRcJ3ra/iDc3bb6lJQvP
         wYhg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Sq0LGy73YbL0o6wGQ4B4GG6+BXavLqHPw2Kop7N+EEJLn0JykJ+2VP2Y2K++16PAxLAmAWFHPaf+hb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFFQWEqFKGHEfhWzx31+0bBcztjOkTuUjuksVuKXUGVv+GTtck
	RVd6XyzdAyMfWQxzDKBWTw5vgYT9fH2LfaElkPM4W/QaDOEKan3cJYE7oZFDl245iTT5969NvhG
	KjLP10BACFD3hvdFCrmoJkYtE8Q0+XI9/KZv3AFxY8g==
X-Gm-Gg: ASbGncvHPRAexBNOQXfsSZh6pL/9yIU+feRb4BjTrdSQ2xTXUbWyK6/teujpUJfNRYL
	ZbgS8pKTQapezF5k+ntENgp595hmpntqNmJbqTXkOmVI3nIbVt8pw2LdvA/hlwcT3plVHjvOmKH
	ARNrzYc06rWAUaUMjXslrDM/wxGuo1kLQUBAcxz2f1v1n7isbO/scgdNrNFp4=
X-Google-Smtp-Source: AGHT+IEfj6KWipNOilgU4YAc6TRKNgw7uKe++fgodC0wL269iBd+x+gRxeTrV3RpsmYi3DyHH9GA8SPgWGIDzBMmowM=
X-Received: by 2002:a17:90b:5285:b0:311:e8cc:425e with SMTP id
 98e67ed59e1d1-318c93054fbmr4060647a91.31.1751030425647; Fri, 27 Jun 2025
 06:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616095532.47020-1-matt@readmodwrite.com> <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
 <CAENh_SQPLHC8pswTRoqh0bQR84HHQmnO3bM07UQa1Xu9uY_3WA@mail.gmail.com>
 <CAADnVQ+QyPqi7XJ2p=S9FVDbOxMXvVPU859n+2ApuRQv5T2S5w@mail.gmail.com>
 <CAENh_SQgZ5yVpshKRhiezhGMDAMvgV7SmwD_8u++mACE33oNrg@mail.gmail.com>
 <CAADnVQJgOyBCCySnBkTk-VCsz0dy+ppdGHpggxbtDpBBGhaXVg@mail.gmail.com>
 <CALrw=nFvUwmpjUMYh5iJqjo6SbAO8fZt8pkys7iDjZHfpF2DxQ@mail.gmail.com> <CAADnVQLC44+D-FAW=k=iw+RQA057_ohTdwTYePm5PVMY-BEyqw@mail.gmail.com>
In-Reply-To: <CAADnVQLC44+D-FAW=k=iw+RQA057_ohTdwTYePm5PVMY-BEyqw@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Fri, 27 Jun 2025 14:20:14 +0100
X-Gm-Features: Ac12FXyVwOidNZ4qxei2Emn8exOPUtr44eKiQ-2QcFU7sANj636wNy52geb6bpk
Message-ID: <CAENh_SSduKpUtkW_=L5Gg0PYcgDCpkgX4g+7grm4kxucWmq0Ag@mail.gmail.com>
Subject: Re: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ignat Korchagin <ignat@cloudflare.com>, Song Liu <song@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, Matt Fleming <mfleming@cloudflare.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:50=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Do your homework pls.
> Set max_entries to 100G and report back.
> Then set max_entries to 1G _with_ cond_rescehd() hack and report back.

Hi,

I put together a small reproducer
https://github.com/xdp-project/bpf-examples/pull/130 which gives the
following results on an AMD EPYC 9684X 96-Core machine:

| Num of map entries | Linux 6.12.32 |  KASAN  | cond_resched |
|--------------------|---------------|---------|--------------|
| 1K                 | 0ms           | 4ms     | 0ms          |
| 10K                | 2ms           | 50ms    | 2ms          |
| 100K               | 32ms          | 511ms   | 32ms         |
| 1M                 | 427ms         | 5478ms  | 420ms        |
| 10M                | 5056ms        | 55714ms | 5040ms       |
| 100M               | 67253ms       | *       | 62630ms      |

* - I gave up waiting after 11.5 hours

Enabling KASAN makes the durations an order of magnitude bigger. The
cond_resched() patch eliminates the soft lockups with no effect on the
times.

Thanks,
Matt
