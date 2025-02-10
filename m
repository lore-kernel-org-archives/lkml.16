Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857D1C3C00
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192722; cv=none; b=BvIczqdcN6Ep8w5n7y/0/uCOTqWxKAfSKzFjve0sb5C/F/0VkuCWbunovzeObFPC5l+0MoRJ8bYvOw1qs+ZFg+1PFXgZPLKDGWqpGs7/hAUswtEHIwPDjmjlbcOgfnl02ryl6dLVFO1vsW2IHpeFh9fG6z0Eze73JCIZfmUeoxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192722; c=relaxed/simple;
	bh=mOuLjG4HvOr7s2/eJN9eNQJDWNjOV+ufUPdVlMdB3LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZBYQoJKpKyuwHFNj70VnP0bbph730mrG/501jlKBEQdBBm41YLjL6tTeWdY2Dq2qop+7SFQpkXWfLF4PmHt8SmIfdsBn7vwFsNLP7zesHUfMaYtXHwoRU1nXcHvCxSoD3qkSNYhYlueVM7n8MVW+aFNqwYnPMRPLTy4wXnvJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=On2PjgH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="On2PjgH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E07C4AF09
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739192722;
	bh=mOuLjG4HvOr7s2/eJN9eNQJDWNjOV+ufUPdVlMdB3LY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=On2PjgH5huB/3tUtxfoCEwwkmDKR6BMfkU8zFauStUcTeNUDRa4ouxtj1fPusvlLV
	 Qg1YNOSz6IWcBTDVlWe3Ty53B5K9vAjKsedI3P91WBMctv7bMjeFbu8QTP00fDaBC1
	 tttRWXeCSXR2YP4afiwZ7zesR22/eNgzRJhufSrthdmjjt2255PJ103o5kyl3EN7vF
	 N8HW2W/kpgPfbtMUt3GVBnS0N9quvjaUeYHJ2B21m6KnlNsCE3bLfwOguUe1S5q/cR
	 lEwL17VU7qMJSTLxRiKVkhIL4yP92fhEshVS8b/Xbt4kjCIqn38YqlcyLA04Li2qoJ
	 DttOdDd9eFI0g==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de77a5d2a2so2012178a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:05:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHk5rUECovGRAJ0OF07OZvDrO7SsEtPt51FPqW9juvgyZq7LMeRfdlv0wa8zj43qXGzr/3MIqbflWPOlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8qtrpSKdaM2imROWowLHCbrCVxhtbn2h6I71UPHhY9XREWYa
	ot2W16FzX1ild9bTptEvoCcVqKDjmXsmDpV5AdxDOdhoPa9cEhmLd34b1BwaIuDBraoMlJAHCAz
	0cEzxDnMujCwS2pmLBvBoSnV0QRk=
X-Google-Smtp-Source: AGHT+IEkfRt7YjPb0KMkBFoPeu30Y37MTdWx6pXWpmrd7dcLDVULaIoVKrW6CFBvxfzLJUlJ4KrCMqsrFtc2mU2K9ek=
X-Received: by 2002:a05:6402:348c:b0:5d3:e45d:ba91 with SMTP id
 4fb4d7f45d1cf-5de4509996bmr15458378a12.32.1739192720709; Mon, 10 Feb 2025
 05:05:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9C6990139B46AE19+20250209050258.2090416-1-wangyuli@uniontech.com>
In-Reply-To: <9C6990139B46AE19+20250209050258.2090416-1-wangyuli@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Feb 2025 21:05:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4aap22B_jaRVxJQDGThg-6HQQ3oC4ZeaT=v_4+5R5zqw@mail.gmail.com>
X-Gm-Features: AWEUYZkFIAYsZd1aQYEMoOqwA_MhJT8_fqFQ4Oj3A5WL4uSTnDaoQnsVfynOqdM
Message-ID: <CAAhV-H4aap22B_jaRVxJQDGThg-6HQQ3oC4ZeaT=v_4+5R5zqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] LoongArch: Remove the deprecated notifier hook mechanism
To: WangYuli <wangyuli@uniontech.com>
Cc: kernel@xen0n.name, guanwentao@uniontech.com, jiaxun.yang@flygoat.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chenlinxuan@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Sun, Feb 9, 2025 at 1:03=E2=80=AFPM WangYuli <wangyuli@uniontech.com> wr=
ote:
>
> The notifier hook mechanism in proc and cpuinfo is actually unnecessary
> for LoongArch because it's not used anywhere.
>
> It was originally added to the MIPS code in commit d6d3c9afaab4 ("MIPS:
> MT: proc: Add support for printing VPE and TC ids"), and LoongArch
> then inherited it.
>
> But as the kernel code stands now, this notifier hook mechanism doesn't
> really make sense for either LoongArch or MIPS.
>
> In the process, we identified one instance where a hardcoded print messag=
e
> could be changed to utilize the str_yes_no() helper function.
>
> Furthermore, the declaration of seq_file in cpuinfo.h should also be
> removed along with the deprecated notifier hook mechanism.
>
> However, it needs to be added back in a different location to ensure
> the code compiles and functions correctly.
>
> WangYuli (2):
>   LoongArch: kernel: proc: Use str_yes_no() helper function
>   LoongArch: Remove the deprecated notifier hook mechanism
>
>  arch/loongarch/include/asm/cpu-info.h | 21 -------------------
>  arch/loongarch/include/asm/smp.h      |  1 +
>  arch/loongarch/kernel/proc.c          | 29 +++------------------------
>  3 files changed, 4 insertions(+), 47 deletions(-)
> ---
> Changelog:
>  *v1->v2: Combine the patch2 and patch3 from v1.
>
> --
> 2.47.2
>
