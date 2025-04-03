Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0018DB10
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672438; cv=none; b=RFrkjEKzPUOJnbX8T2aWc3mzWsXB9v+fL6Jgo6Na+fUQPxMwWRC0wOD+fbxcnDn9kBT4ZGApJc/5bZDgTGPbMEO2REA9fhl6so3mim9jJYphYh9eyoBOTLs4K7vVFUK/WimSF3BBxNWYYqFzxGN3jsl/pLx/eZogl/aKLM2xHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672438; c=relaxed/simple;
	bh=8Wim55GQSSQZ3suXOPqnLbIRcIj+P05X/R3WrzXgTv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sihZmRWwD4m5RU8DRb7gwx6sFHdciW+SApsi9ohI5knb0CmqDLFKtMvGEi/wmaFww2Rgwf3kHFflyAOFM9Ntu4jr5potjHMGbwpS0KJFGFvtwNlMtZhuBkdt6IyViZ2hgjUGX3E77lH/FWdNAd2vnSp6mOwyJ5M3hNN2MpktuAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLtOwqSF; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLtOwqSF"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e461015fbd4so544060276.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743672435; x=1744277235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Wim55GQSSQZ3suXOPqnLbIRcIj+P05X/R3WrzXgTv0=;
        b=SLtOwqSFek8Z4T1fSR9uMN/MebB2w8tp6/uNgUUHU9+wAFc4REvhjw/jYBzMiVxZyd
         lyFTXjkJGV/moMDQw29Hqw/5JXmkF9y0qsuDkswVOnEfSXOxE/FFUc9EQsAD81TaYRwL
         YodD36YZ9DN4ef31C6qZIHUIe+bSjYU5gQT8GKr4V5UPUJjYweR8fTaDJXYf3lxtBOMI
         VmnERUnZvVACqqhMlXNiuqUc69B3WxJ5fyaIZogp4oVcIyUGvarZ0S8faqoZHabHbm5p
         ELfu3c7S2J/CcXr+1bnQwDe/4kuZQSqSrs860eIof+UkAd6gABB4Htofzx+0celkO1Ot
         ALpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672435; x=1744277235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Wim55GQSSQZ3suXOPqnLbIRcIj+P05X/R3WrzXgTv0=;
        b=sf2qBP+JJJjKi4esjh/i7oft8vf06QFeD59cVb3RIiGXV0155s8k9FjnVJk5KMULpL
         kZslw78o8X35Ysv2cOUmE523W8Imua0CsMjfB9low+/QDPFK7Ig4Dp1NHAzrhfvPg6lh
         KcrwkcLXIenXdAV4R+G6e+ymoMSQkz6B2JISRVA8vS0dLH1SkNJx9ID1fTRCDpJbweZ2
         YbftFlFDteG+1UZOaNa0buKW8RNtgmCYoe9maZNdvpuHnqsfqB0I34gjFcBy4+TZHx65
         bZ+JaNW/wgwaI9iLLUGaS1wcKbgSRns9SmQBG//twWcRecssEwNFKhTwfIPVwF/+RlML
         XuLw==
X-Forwarded-Encrypted: i=1; AJvYcCUNvBqAzc0YXbWrKKLCx0DXGF89H9DUo4wg7S3MjHRMp3osu5xedPU/V4TIK6r3e3o6gKI59jcykpGW5nE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJ0tIXvhW4LFaU8+skqia2N4lF5TwmkfXMRHyJCtd77bLBONK
	9f6b2aRKFtoHF263nSbI/HhFbDII91bHc1h1xj7ZQInCyqbvJGhF92ftGdiWybepbbIRPNG2ehU
	1rRR/70fDbpwnnWGAEOCpjzkBct8=
X-Gm-Gg: ASbGncs/W4cLrImo9SIGCYhty/ITTJWet/qdlvvhZahq0Tz7glyKhF4EMLVE2mjzTND
	2hpXErb82DRrbiKw5MAh/hqDV8RjurgCS8cBofMYa/K2Ux/ImJxHKnetDUHio1wCzjc8UT+TBJP
	EZhgFtYqV2LTGg96pxPIIIuCeccQ==
X-Google-Smtp-Source: AGHT+IEb2HiPgljplXFT+AGKyQzvdUoVsPHVwifO2PILVLDJ7XXBDLb37Qwzbi2NclfrbSMIKi7vQhYJNNnzWtMxLBU=
X-Received: by 2002:a05:6902:2012:b0:e6d:fc1f:3cb1 with SMTP id
 3f1490d57ef6-e6e0a233765mr2431715276.45.1743672435076; Thu, 03 Apr 2025
 02:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403070453.214190-1-ubizjak@gmail.com> <20250403082508.GAZ-5F5EMVZq3-6Zoo@fat_crate.local>
 <CAFULd4a49RRMKrSVh3Q5zpeK4EJVW61tm=fCN4aOWX8=x8rKnw@mail.gmail.com> <20250403092218.GBZ-5TSiyjNRAcBxQo@fat_crate.local>
In-Reply-To: <20250403092218.GBZ-5TSiyjNRAcBxQo@fat_crate.local>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 11:27:02 +0200
X-Gm-Features: AQ5f1JoefwxlbkfyQlTfxdFEjY7L5dPAYmAuI3vBr7qkxaR9EbDEdxcUUI4oT_8
Message-ID: <CAFULd4axo8ZOVJwRkqhi0nFYAveX6mBpd0Bwte+rYp=umHTP8Q@mail.gmail.com>
Subject: Re: [PATCH -tip] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 11:22=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Apr 03, 2025 at 11:06:02AM +0200, Uros Bizjak wrote:
> > The least common denominator is an insn with implicit operands. I'll
> > post V2 that fixes it that way.
>
> I guess.
>
> You don't need to post a patch ontop - your previous one should be remove=
d and
> the whole effort can start all over again.

IMO, in this case the fixup also documents the LLVM bug, so perhaps
the fixup on top is desirable for documentation purposes.

BTW: The test with CC=3Dclang make argument didn't expose this issue.

Uros.
