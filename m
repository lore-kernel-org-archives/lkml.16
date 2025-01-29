Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476342A92
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192970; cv=none; b=g141Y7Ifsn/8Fmw9O9rsFC09E8UN4bpjbqZ2Rs66Iw++oi63d8BXb0c5U56TzSW+C4njXNEXHtZ1geyBPGKWqxbajfxRgCMRxaKxrA3313KkJdbzluZqlNqpmLtkCg+p0sfcSUQwJqQpY+W5xrGjuhWUG8Fkc7kXP16sAdEaX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192970; c=relaxed/simple;
	bh=9CnrW08raLpCx8ibPb5DEivnYHWQl9j7CYympTDXwVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUnYUV8XH6jcwteOcrqDkbnTiOt2QjylCtHvEyMmIiXzNkP0TKYMMcu5NjbqS6tCXmlXXYwmlkJUzSqMHXoQSLyXzkPu3tvPlbeFc/udy+IkUpxqS8qNVQBHQR8tBZHjXjC0yAUJ/iu5/UsjZsfBRnUuDy3h3vLwU7t1ruPq4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3vlSRRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3vlSRRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A1BC4CED1;
	Wed, 29 Jan 2025 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738192970;
	bh=9CnrW08raLpCx8ibPb5DEivnYHWQl9j7CYympTDXwVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3vlSRRmYb+jCgORf/eDIjZiiNLb6vxw1l4XQ0Iz8AtZypWxw/hDSr/YF3IS1yyTy
	 OrjI4GBkBXxNkkgwD+6V9U3KQYw+2+UozNE5Gq9UGbbDYTsXK+Vlo85VXk8XxLGV0K
	 +he6QVcVAljzPQOpqoc0KyiHMXZv3XrZpA74BT8lhXyp52t+3nSa41QbzuJgkqyekB
	 r06cyLXxin07RPPmr/u4htxRMhBjDSkMi8cE+4BfV9AzQ+Nh/iusCYlY4ipc4s5M+Q
	 lRSmcmP6acEQ3DnGKnBIn6yT/7ZG2KteDaF+4s2q0KBTEN8VPMzuBfV9NTBXUv568r
	 N1AOPeSt+ff5A==
Date: Wed, 29 Jan 2025 16:22:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Song Liu <song@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: clang thin-lto not working for aarch64 for v6.13
Message-ID: <20250129232246.GA3387816@ax162>
References: <5ec75c39-2878-4caa-8fbd-68cf0aee28de@linux.dev>
 <CAPhsuW4dC-Wma8EGBxkbftgRtmZohojqhvsixHQ3C4MNrH1+9w@mail.gmail.com>
 <CAPhsuW5urLfhiCt2dhorVcZoMxZRady362vbfK78A7Z+3id2ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW5urLfhiCt2dhorVcZoMxZRady362vbfK78A7Z+3id2ew@mail.gmail.com>

Hi Song,

On Wed, Jan 29, 2025 at 03:04:56PM -0800, Song Liu wrote:
> On Mon, Jan 27, 2025 at 9:50 AM Song Liu <song@kernel.org> wrote:
> >
> > On Sun, Jan 26, 2025 at 7:48 PM Yonghong Song <yonghong.song@linux.dev> wrote:
> > >
> > > Hi, Masahiro,
> > >
> > > We are trying 6.13 kernel and found that for aarch64 thinlto not
> > > working. For example, for kernel/bpf/syscall.o, the compilation flags
> > > from .syscall.o.cmd are savedcmd_kernel/bpf/syscall.o := clang
> > > -Wp,-MMD,kernel/bpf/.syscall.o.d ... -D__KBUILD_MODNAME=kmod_syscall -c
> > > -o kernel/bpf/syscall.o kernel/bpf/syscall.c ; ld.lld -EL -maarch64elf
> > > -z norelro -mllvm -import-instr-limit=5 -z noexecstack -r -o
> > > kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o; mv
> > > kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o I did some bisecting and
> > > found the issue is due to ``` commit
> > > bede169618c68379e1be7ace14e8ac85b964a9ec Author: Masahiro Yamada
> > > <masahiroy@kernel.org> Date: Thu Nov 14 08:45:22 2024 +0900 kbuild:
> > > enable objtool for *.mod.o and additional kernel objects ``` In the
> > > above, for thinlto, we should not do ld.lld as compiler needs IR to do
> > > cross-file inlining. Searching the internet, I found that the issue has
> > > been reported e.g. in
> > > https://patchwork.kernel.org/project/linux-kbuild/patch/20241113234526.402738-3-masahiroy@kernel.org/
> >
> > It appears the fix suggested by Nathan is already squashed with the
> > commit before being merged upstream. However, this causes another
> > issue. As Yonghong stated, after upstream commit
> > bede169618c68379e1be7ace14e8ac85b964a9ec, the linker runs on
> > individual .o file, which defeats the benefit of LTO.
> 
> It appears we still have this issue in the latest upstream kernel. Reverting
> bede169618c68379e1be7ace14e8ac85b964a9ec fixes the issue. But I
> am not sure whether we can do that without also reverting
> 1b466b29a3bf02ed95f28682a975f41ae47bce7d.
> 
> Could you please share your suggestions on this?

I apologize for the radio silence on my end. I agree with you on the
root cause but I am not really sure what the solution here is either
(other than an outright revert) since I did not write the change so I
defer to Masahiro. Hopefully he can answer soon.

> > IIUC,  the proper behavior is to do "cmd_ld_single" only for "is-single-obj-m"
> > case. However, after bede169618c68379e1be7ace14e8ac85b964a9ec,
> > the "is-single-obj-m" check is removed. I am not quite sure what is the
> > proper fix for this.
> 
> [...]

Cheers,
Nathan
