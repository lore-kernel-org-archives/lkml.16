Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67551DC985
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863856; cv=none; b=kXivsm2RdiGkXIYrsmOGHhR5tUJDE2mU8Uw05HKJFlMvu5Hl9GdT1Fo3gnuVePLs3vpZ58K0wOveTx3HcQ8yvFsrAtqswx2KM91jas4pvmnDz59o83LaiL/Ld9UqZZUWg7s4E5v8NNRrlmiscKBaWwcgqzG1x5I8ncLV0Cbz6qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863856; c=relaxed/simple;
	bh=IcxqyCvAxuY7/D6iq4+8OLP6e1wvf44VoWVfqXP0B8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpEy0RfEZef7XV+ETh5VZICywPjP4Jy26MH3jjaBzUHQiOCXsoD4PwW2JMox4hSfhT+edaGGPvRRor5UCrll1uuge9crtb+3yNJ84nfxoVocYn6N5+cf3EJs3+6/kOsdkYP/nUw9biBDZdxC7ugmpHPX+6nYnEA4YLEdjdFc7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMzCCeFv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMzCCeFv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24120C4CEEB
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863856;
	bh=IcxqyCvAxuY7/D6iq4+8OLP6e1wvf44VoWVfqXP0B8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pMzCCeFvmNVJ0zjXW5ztkSdZo1DuK94/+EoHlmQJGNcndgRLAJMraqyfdZQjwFqiD
	 tWEBY3XQhOv78It2ke/gQeCjy7IK7CH3tVH5pSyqCIttR7vVL9dCDwKe4IRnoaCqUS
	 V0LQ40Bqa7zGnll9zMImJRg7rMwYknlROArOE1PHlIuH2uvag58bcP0j2vC3+gckr/
	 hvWVUuTIrtC41/W5YNqbDeGG7dQSrjbJ0M2lIsuj/aXYWFJ0HZA20o9iR/sG/1D2HQ
	 krU2jQeH1EswOSAFz4x1iqMS3w/bkS9x05zM5WX8aqGCipOmeTmh2aLlfT9KsQFm/V
	 m9nrwWHQxbE3A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54298ec925bso4229417e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:57:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWntjL7xiLbKd6i4Xmh61hVbjBrKTsE++0q6KUyBgDxGyLG4a/4X7wCFJMBkfhxBpsIhIHFOWb6+QQw1PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQNva9eA54YI9HtipJLy9FesVhioN2tyvLALonleOlAzy5ULj
	VY6Nde9QmYyHMAKrZP3QJJ/ogydxPXVoqFkiNvEMx9M0ZLCpOsimxbX9xbO7K4iw3/AF2tr54iF
	Y7mg1wBRLgyXf8Tjkk1Eu2MOW+i8=
X-Google-Smtp-Source: AGHT+IFpgtPM7/5m0jDyHXM4uIUDKTj2h3kaxyK81rt/Ovk6mMJV0aO5cXooKfpbv1jVAZJD+x+YypgJpcLJnKGwJSo=
X-Received: by 2002:a05:651c:1477:b0:30c:f60:6c6 with SMTP id
 38308e7fff4ca-326c4539858mr26937371fa.6.1746863854461; Sat, 10 May 2025
 00:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505100719.9pE7wDfB-lkp@intel.com>
In-Reply-To: <202505100719.9pE7wDfB-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 10 May 2025 09:57:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>
X-Gm-Features: AX0GCFtsspZDoJSzTIpWIF5K44lx3dUBFQ3Iqa8sTNyzw8WaopdlJgFz-FmjNTw
Message-ID: <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>
Subject: Re: [tip:x86/boot 10/10] arch/x86/boot/compressed/sev-handle-vc.c:104
 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null
 (see line 101)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Sat, 10 May 2025 at 09:43, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hi Ard,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
> head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
> commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
> config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/
>
> smatch warnings:
> arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)
>
> vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c
>
> ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
> ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
> ed4d95d033e359 Ard Biesheuvel 2025-05-04   98   struct es_em_ctxt ctxt;
> ed4d95d033e359 Ard Biesheuvel 2025-05-04   99   enum es_result result;
> ed4d95d033e359 Ard Biesheuvel 2025-05-04  100
> ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101   if (!boot_ghcb && !early_setup_ghcb())
>                                                     ^^^^^^^^^^
> Check for NULL.  Should the && be ||?
>
> ed4d95d033e359 Ard Biesheuvel 2025-05-04  102           sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
> ed4d95d033e359 Ard Biesheuvel 2025-05-04  103
> ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104   vc_ghcb_invalidate(boot_ghcb);
>                                                                    ^^^^^^^^^
> Unchecked dereference.
>

On success, early_setup_ghcb() will assign boot_ghcb, and so it is
only called if it was unset.

The logic is a bit clunky here: for clarity, it could be rewritten as

if (!boot_ghcb) {
  early_setup_ghcb();
  if (!boot_ghcb)
    sev_es_terminate(...);
}
