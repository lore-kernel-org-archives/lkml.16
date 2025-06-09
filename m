Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFC21A45A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486959; cv=none; b=WzNiF6akP/c5qwaCpYYQKTG8ETz03F2Aj7ra9we9MYwOWAtCWsqFb/LKRhPMCh8I1558C/ZIklnBWbQubkQUHME3jh2Tk/FPRA85aOYk3llJX5UglSZpioDxYm1zgZtugMerXpDYdkcoTwPDrxSXz07PKsUxZXvjqof77hQ+rRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486959; c=relaxed/simple;
	bh=NtLJV4p5cJuBKb/UudIAD/NwyNwxAp2MkYQ5AO1pYDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgBBkWiw1siiutt1y6F6/LAyLhUegNeZhjJurNySvIJjAsGAa9Gllb6xf9+9AYWhOJErQGXgXqXQApbjor0COdq7xaun/dH2AmP6lkVFdm6J+UUZzexCrFKSqLiaD2HuMvtcqM1U9x2pwQDlYBjSAT7mXaBBrDwCsRnvGmh/D2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ssW5SxTt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ssW5SxTt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235ca5eba8cso1945ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749486957; x=1750091757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8riTLpg7FvZThdG4JrgKprebdHeRkr/r4Dt6E/RTpA=;
        b=ssW5SxTtchHbpcVkvfUvLZZsivmjJYVViPQsQCMRCYwgha9DpS+nMxZ49/OP3tolC4
         wpIYujgOQfU/mGXO1yDu1vLg4svaM/gg/Dt3UkjrzZhrvQbUIN/fIaB+Ox2T83I0M+7k
         EWvqWteuACbdBtJBs2P/PgN/vqFBQy8Nj1ne4I6f9ZVdgA86R43/c2Uxmii1ZRFRzk06
         ORgafKY2wXxu6ulCCet1Kld3RL7AKEJbgIzDFnSceso3d9xDaswbPFPZeodr8koNGmLe
         rpw8CUHOaWz76yKtcGkHAFrMef7SmiQMxNY4GJMAmiX8S5g3nag48pm8PShHprZAZjlP
         /HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749486957; x=1750091757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8riTLpg7FvZThdG4JrgKprebdHeRkr/r4Dt6E/RTpA=;
        b=D1MhvcndBWxtd8VdE6mtj1UaNXuVf15UUGZ1xtisN2AP1mfXoPvrxszJC5zF4gthkh
         KVhYJ2VqyJHU7kYyomV3HZTUiueXNgiMT8KLWLWTXxV4CqCmdBWBYPgvIIKMyftzJlaQ
         H9lOdSZZNIm3/+uXS6GzX55tLSqpSw+hKXhP2iP9n+2TYUJifY38JUJ3SVKftR2tM27M
         jOVESDVCGlAK5Tn5ppVVWs4l0C+HBCcAvALBV1RD/Kp2LjLlP9elQMJK+mb3qYnN2xYM
         ITYWdszCjNdjuWugZn3JBL0EbSgF6VgoIzFL1fgo1CZPai95nRig9EhuQEWx29/SySs+
         rt7A==
X-Forwarded-Encrypted: i=1; AJvYcCUFHvYNxShs+rLx0OmX9qkwFYHwjNf3R+aVq+eqHRLVLFf7ISs1fmLjLCDqdy0BZ0vDkRr2YYBN9LfzRiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0gZ8Ztc+PY83NKQmzuVAj/Z6n2U4Dyk6H5Zh03xNqQrwaXJLx
	oInMFlRkn4+MiUr/aM5QKS9DrNymfG2OKUIs1+RZ/h1aYyAGaIcv41jsmWzdRF8IgUUyVZEXo61
	tNhAZx8uGWvdsoAuV9rqbd5F5uyqAxA1ZqLOTa9IWjV0twF1CmNoMuQFUHF0=
X-Gm-Gg: ASbGncvB7Raq7kYwcQuwi56U8kzrnwN3VYR2i1Ow0Kl8AQFpKUCMAekjwxcivDuTtlP
	lM6Ppr/v077Cg9wbFLYtWNQFcMILyuEu2wiIia8k9u/+SN511qIioega88jLSdcCWxE3fliBpp0
	YL68+PJ2FA1weRMpDOH8HVrTbOrQCB+Wm57J3jQFpe
X-Google-Smtp-Source: AGHT+IFJ5uam8zat74sYve4mZID4y763DK2+CtglvFbT2zh3Cd8CNhoO1omPHbpqnaUawe9izeWgEgBfeojCRauEmGA=
X-Received: by 2002:a17:902:ced1:b0:231:f6bc:5c84 with SMTP id
 d9443c01a7336-23611fcb276mr5163365ad.8.1749486956755; Mon, 09 Jun 2025
 09:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202506091622.dOo1Na3X-lkp@intel.com>
In-Reply-To: <202506091622.dOo1Na3X-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 9 Jun 2025 09:35:19 -0700
X-Gm-Features: AX0GCFtYOpDP97Lv9FSFuSYflyXsuFsU-dfE8d4vEcVJeWM_FFJyeGYsLbKufJQ
Message-ID: <CABCJKufNv+suE+B2as71y8=sF1kxNSL_zcq3GV7o5GxTRpszHw@mail.gmail.com>
Subject: Re: include/linux/kvm_host.h:1908:24: warning: field 'desc' with
 variable sized type 'struct kvm_stats_desc' not at the end of a struct or
 class is a GNU extension
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:50=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Sami,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksym=
s as an alternative to genksyms
> date:   5 months ago
> config: s390-randconfig-r132-20250609 (https://download.01.org/0day-ci/ar=
chive/20250609/202506091622.dOo1Na3X-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> reproduce: (https://download.01.org/0day-ci/archive/20250609/202506091622=
.dOo1Na3X-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506091622.dOo1Na3X-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from <stdin>:3:
>    In file included from arch/s390/include/asm/asm-prototypes.h:4:
> >> include/linux/kvm_host.h:1908:24: warning: field 'desc' with variable =
sized type 'struct kvm_stats_desc' not at the end of a struct or class is a=
 GNU extension [-Wgnu-variable-sized-type-not-at-end]
>     1908 |         struct kvm_stats_desc desc;
>          |                               ^
>    1 warning generated.
>    error: gendwarfksyms: process_module: dwarf_get_units failed: no debug=
ging information?

The issue was fixed by this commit:
https://git.kernel.org/torvalds/c/173767c218cc1da74704e7863f165ac8a9796f3e

Sami
