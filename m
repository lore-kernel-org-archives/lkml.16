Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1E18FDCE
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738191908; cv=none; b=Ibm3xdjZRh57tACh1vSBC40vtY15T5pttnn0ZmfGy0JYtu3WA0IDGIzw5KfOiNjFBmeCOt6rImQVmtQfi70E11xHGTJWkB8zirVJ5prkpYi26Uy2uqZz4M/NERZh/p8WF0iv+rv5WidDeSg/UQoG9UNEdcpa8MQgpiEMBU9HbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738191908; c=relaxed/simple;
	bh=lx5G7T0aIAEATA5D1Rsv6M6GREHLGVLBeieoUazKo8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQjpQ1Bi/5Bkuyud0i3gbY64p1tsmJSZkAtkyI+DlDl0dxQqplnycr/46gAI0ZxYZYoips7Djo2zyMB3RSNqczQ23Li8PNQyW+KTuidFmigEQe6mTHwgoLPt9VHSNA04/svzhSH8wOo1tTHeCoN8GFIABhh5ICgaRuQ9Kj+/iWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5330Jne; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5330Jne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E802C4CED3
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738191908;
	bh=lx5G7T0aIAEATA5D1Rsv6M6GREHLGVLBeieoUazKo8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u5330JnecyPr6KR+SALgsdzuvWE1MYhKWOHkqmI6Vom6cGvEm26p6GI2nc3c8S1QH
	 ur1VcC4U9V2KFGvAyTU227S2viqXniZNkfCtXgxvVESJbUR/UnIRp5EHGyn0W/JPtt
	 hIg3rL/p2+bmMLzkUw+gM7WV8E1q2UgjMMJFwNOu0jNEg27G5CYDaOXRf2ZcSlTOwZ
	 piyPHKpYd6OneGp1bXXqg/PSJeFPOYsClniAs+qx3dyEtOSRx+Bm9Z8y1mJK2dmDlh
	 IeFbzKpoWE7q+TS3ZeWdPpHZJHA4GqcJV+dMlgORqGvN8gkp8Da+h5Y5fj9QTWlsVU
	 AgTgDqu2qeY0g==
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso1850665ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 15:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXb1T1uIWea62UNDM/ULOayOgXoWF+5CcEiirQStpWygshSvnrL5C4r9SKwKtrNmrA1lRhWN416p+GN3B4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxce7t1ywlYO1tCSPixSR1v3iIXQ6ou/SqOLcUhrWSLMzLpdYCD
	27Ye61dXbHYI3ejxBOOFOzeg9R2uae/S+jL9ipXcLPLpg24DzWdHCrRDMJIL8uRGAvw6yU3k6gG
	ksqtdw0PZo8UEjrohL0To1dgUmjQ=
X-Google-Smtp-Source: AGHT+IFzXAw9fovFRHtVnVT703ppaMiZKEGpYBYSnip8w/zExg8KXp51qNxWCrhB0dc1ZtcGhJrWrORLwTiagsclk6s=
X-Received: by 2002:a05:6e02:b4c:b0:3cf:ce7c:b8b1 with SMTP id
 e9e14a558f8ab-3cffe447945mr58933185ab.18.1738191907443; Wed, 29 Jan 2025
 15:05:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5ec75c39-2878-4caa-8fbd-68cf0aee28de@linux.dev> <CAPhsuW4dC-Wma8EGBxkbftgRtmZohojqhvsixHQ3C4MNrH1+9w@mail.gmail.com>
In-Reply-To: <CAPhsuW4dC-Wma8EGBxkbftgRtmZohojqhvsixHQ3C4MNrH1+9w@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Wed, 29 Jan 2025 15:04:56 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5urLfhiCt2dhorVcZoMxZRady362vbfK78A7Z+3id2ew@mail.gmail.com>
X-Gm-Features: AWEUYZmnjHlvxhPv8c5Us77b0dfxmv69AOl3aw9HttfSYlBLEqp9ARqDAabUTzw
Message-ID: <CAPhsuW5urLfhiCt2dhorVcZoMxZRady362vbfK78A7Z+3id2ew@mail.gmail.com>
Subject: Re: clang thin-lto not working for aarch64 for v6.13
To: Yonghong Song <yonghong.song@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro and Nathan,

On Mon, Jan 27, 2025 at 9:50=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> On Sun, Jan 26, 2025 at 7:48=E2=80=AFPM Yonghong Song <yonghong.song@linu=
x.dev> wrote:
> >
> > Hi, Masahiro,
> >
> > We are trying 6.13 kernel and found that for aarch64 thinlto not
> > working. For example, for kernel/bpf/syscall.o, the compilation flags
> > from .syscall.o.cmd are savedcmd_kernel/bpf/syscall.o :=3D clang
> > -Wp,-MMD,kernel/bpf/.syscall.o.d ... -D__KBUILD_MODNAME=3Dkmod_syscall =
-c
> > -o kernel/bpf/syscall.o kernel/bpf/syscall.c ; ld.lld -EL -maarch64elf
> > -z norelro -mllvm -import-instr-limit=3D5 -z noexecstack -r -o
> > kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o; mv
> > kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o I did some bisecting and
> > found the issue is due to ``` commit
> > bede169618c68379e1be7ace14e8ac85b964a9ec Author: Masahiro Yamada
> > <masahiroy@kernel.org> Date: Thu Nov 14 08:45:22 2024 +0900 kbuild:
> > enable objtool for *.mod.o and additional kernel objects ``` In the
> > above, for thinlto, we should not do ld.lld as compiler needs IR to do
> > cross-file inlining. Searching the internet, I found that the issue has
> > been reported e.g. in
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20241113234526.=
402738-3-masahiroy@kernel.org/
>
> It appears the fix suggested by Nathan is already squashed with the
> commit before being merged upstream. However, this causes another
> issue. As Yonghong stated, after upstream commit
> bede169618c68379e1be7ace14e8ac85b964a9ec, the linker runs on
> individual .o file, which defeats the benefit of LTO.

It appears we still have this issue in the latest upstream kernel. Revertin=
g
bede169618c68379e1be7ace14e8ac85b964a9ec fixes the issue. But I
am not sure whether we can do that without also reverting
1b466b29a3bf02ed95f28682a975f41ae47bce7d.

Could you please share your suggestions on this?

Thanks,
Song

> IIUC,  the proper behavior is to do "cmd_ld_single" only for "is-single-o=
bj-m"
> case. However, after bede169618c68379e1be7ace14e8ac85b964a9ec,
> the "is-single-obj-m" check is removed. I am not quite sure what is the
> proper fix for this.

[...]
