Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434C1E231E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368054; cv=none; b=RxbUYaPR2s8DY6869eQ03+haAOvbp2EngsHkN9JWNzCXwZ0EvNMfSVpdkBjShc7N3xZlyUNLGmVFDjXmhKjrWpY0V0Zbu/tl13G5KIOfMzNhRLGG5TdLVtujCZL3dT2t32J/h7QoAy39HMx9rh1A25j49aiv5TuA0+kgP+MsnzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368054; c=relaxed/simple;
	bh=pMTsR7skw2PgLWAfwNXtaDV/wnY5fZbIvPhiMgQ/1CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+wMMobk8rEeebyaP2wQNSEN2NwWgFhTCQgztpFqkx8aHwYmPsH4LlkD/FCKm9mMU/tfzD6LTt9SQMGpaitSQ7Tr+j/oxEtnf9VIJmTDBa1JHIYbJtcqszjs/DUaBJ3kZaZgfE8itPiWvXcHE94DimjC99wmbzKuGTcGTMF5lPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wG0DALbk; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wG0DALbk"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso2287062241.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745368051; x=1745972851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWlmxqNag015p2cP0vSnW/zq2HibDR5FkrpgKq7T/2k=;
        b=wG0DALbk27rCSx3X5VFaAj5Wg+1BX7lkti7LVyT9WZwiwosU6U2FA5G2poPRHuhSPH
         /wk3qjdt+s+Bh+jTMEI4sbpfiABLTEPHrGk0bluJNQo5i8QuUOhNpK5Z5NMw5TeXTZQP
         FExT+avNErBYg98DueqvnSVjoUkxpkm3WZ+rLpCrFHDZdU4RDysNgsLwaidpeGrBAA2A
         donN/1RPz5gJR9GzNNHpx3/9pydOkHG6pdH4U1mmMlTse/angMpXQlti9vYCyFk+PnW1
         8FTbvYqUFPSMCEYTzzgQ2tKlwNFRdJq/qLDsAr6XTQDwbAhDwcHhGYjhq0k7KlTDTEj9
         GW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745368051; x=1745972851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWlmxqNag015p2cP0vSnW/zq2HibDR5FkrpgKq7T/2k=;
        b=k7KTRZw7vB1Jj0rChTMyuwDWglgmEDe8Y7uTT2YM9WINGi3MMeLoIf+mKPXueYdq65
         U2MNxph9COqCvj9rTjUhQ93glIvKHpyN8oJ9rSy2IlKm1Zxpf658NrkUka50dTCl9nlE
         i0Y5TMEvlfMK5702gCtnfE4H5cSq3hiZQZL0tBhDY37Ltq4QGu0Ja+wrbvDbacqb75/p
         2Ii9Cufa3x9N9XX74R37IuNZXQX/wTc68IxFPg54k0xztBqlXN88ef7NXrmBXIWlm9hW
         Yc9vIiTnciYLtuPqPBx9Cy403FjAfi6vmrnPDJoNXne/IFdS/+PkrU6I07iM+T2bpPRR
         J7gg==
X-Forwarded-Encrypted: i=1; AJvYcCUnJdwd0wvrQLIiCFy8yqvvK0d6UQBxllAyfig9HaFoX69TRvKMKEtvLbbk2hRvnL3hxUHqFYVBHq8XKA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLFODxzzv5l1tzUEHRnVq+NoPjvorSJ8nQFawxFAJyj3ac89SZ
	z+0QsJNpknCRKOSNY2ZOU3D7I3QCUNzw/yJsDr6eRG+dazATpMn4Oq/rLspltlQ1DZVqv77X6bv
	xfnGMWKfsd0FIV8bAXTDBXxyfq60ORdRGqYlH
X-Gm-Gg: ASbGncveOMUiAsMjwu3FNUoEHjMY+ovoN/v0Fg/ekak4OWbnQJvi3g+Z/yhgreTz1vn
	dtX9dFhHwDqU3B1K/pNb/tZD4dH8RCMj5/Zb9WKb8anPppVYBE7rOGx2chTZ6qpN3Vr8SBheXJd
	kH/XZYiZe06xAz66n2PjnMX4qJXaFi96k2X/Hvfry0t/nzi8W+RKI1
X-Google-Smtp-Source: AGHT+IHDyONnXP5kHGTU8ef5H6nBwGkC0E2Wv2qdGeM0PJ8We8AEdbOzl6IOUJnmI3YsbyK6kpxBjX+98Vl502S5GJg=
X-Received: by 2002:a05:6102:5e92:b0:4c3:64bd:5405 with SMTP id
 ada2fe7eead31-4cb800fc8bbmr10978805137.9.1745368051103; Tue, 22 Apr 2025
 17:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
 <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
In-Reply-To: <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 22 Apr 2025 17:27:20 -0700
X-Gm-Features: ATxdqUF_aQC6WF23mfDl6QAYTZrX6z_tX0jk3VuE5MUPI5RIXkEte6wNf-I_3V4
Message-ID: <CADBMgpzrM7PMePtWaZLaaNXt6z++V0rX2VXtWK4vzdTCS=BpQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Song Liu <song@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 11:25=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google=
.com> wrote:
> > >
> > > To enable late module patching, livepatch modules need to be able to
> > > apply some of their relocations well after being loaded. In this
> > > scenario, use the text-poking API to allow this, even with
> > > STRICT_MODULE_RWX.
> > >
> > > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Us=
e
> > > text_poke() for late relocations").
> > >
> > > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
>
> Could you please share how you test this?
>

For context, we enable livepatch for arm64 by porting this RFC series
(along with other internal patches) into our kernel:
https://lore.kernel.org/all/20230202074036.507249-1-madvenka@linux.microsof=
t.com/.

The way I tested this patch is: with STRICT_MODULE_RWX, load a module
and a livepatch that touches that module (in either order), and
confirm the kernel doesn't crash.

Without this patch, a crash is caused in apply_relocate_add() if both
a module and a livepatch that touches the module are both loaded. This
happens through one of two code paths:

  1. If the module is already loaded when the livepatch is applied,
through the module_init() callback.
  2. If the module is loaded after the livepatch is applied, through
prepare_coming_module().

In both scenarios, the livepatch module's text is already RX-only.

Thanks,
Dylan
