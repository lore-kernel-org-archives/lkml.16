Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13DF2417C2;
	Thu,  6 Feb 2025 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882608; cv=none; b=BjR+2MtnaJzEkYngoqtch5GJnEzKhGgwC83U5U9JgeAchc5ZtY4IFe4WwpUbb3mt9QP1WxJbz3v/oJX8feS5FaCMcNQvqXPwQEyljUCCaz9E0/1SBkG6wXjBcSsjDJ9t4YuxCf+rR7vLlX/E3KkWs0YnXJZrkKfPdLiQZep7/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882608; c=relaxed/simple;
	bh=x5knv2spfc9/uulG9Q53u3Mnpd7d2DiRafDOH5viDeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyMywHaumj3x+a8gOCx2722iW+h2CjSwiz+HPTjiC0cglwsAA11yGffRHDOc699l7OXGY7bHo8A/B1FL4friielnIxgq1TYEyK/ZD0H7ImpDqpkQh5y3SeoGj+fDH/topnfRYK2fITikcPc5XZh9JaLMDXTYiIOwgBFwYn6vMsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7/Vflmj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7/Vflmj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso121318f8f.1;
        Thu, 06 Feb 2025 14:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882603; x=1739487403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPdz+11/bNSSDH103V+kKB8X98fGo5sDYDlVXDLnzsQ=;
        b=i7/VflmjxgLylq4uLhms9vSp6ZzibnU5RZ7OgvPc2xdV53XgNrVoghYaW/s3NOn+Wa
         v67v9ractWYZJLIsdAxFPz7dgVVUMZWNkXoKGCEl2G/2XN+WcHvGwTo0nRifUHQnivCq
         eCj5t0yFfmGeMKnzm2YN8RJCRRlsWTUIdrTdAjRGvSvI+9fMENNFm9dTI2u4x5hBhwme
         OREpZu/8nsH+POCgUPZwJxpFz7tXs32BQoLvUyyfm7oNzBzcSz9Xmbd0pdXUEScmEFxz
         yfb/zMexlKUZN9V+RrKxbtY5eWWdbGPpiUIWgB7enGpEnHYmxvIzZVb4iVognQlE2IJ7
         Vuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882603; x=1739487403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPdz+11/bNSSDH103V+kKB8X98fGo5sDYDlVXDLnzsQ=;
        b=YXEoPGEE+rL6auzxDKZEhkGxKwZ0+kRNcbP2d0TXeoHrF/gkbk3bvaNTMudiaRu/RP
         L8wq3JKZvAzviYX9uzX4/7xgOrYkGYJ59VEo0iOijWZD7ecVGw9jtAWytaN+3KO9jhSt
         Nw/8aXaPt42rRXAa2KdkBN2FsMut+wzI4xw5NXifbv6w5gwcUa7gZ7JzATV0ppwW0f/P
         RLSs0QCKL3ueLCsm64IKB7SnGXvEkp35VztjCftC3d+MH+4lqwhCbTNIGKdtCGpaZQ0X
         69rfcQqMQIc36kSP+uCzECRY/rS3ELyeegd8wUaRTbYAZI6eB2fwO5Ks6/7cIkIulUm/
         l0hg==
X-Forwarded-Encrypted: i=1; AJvYcCUx7opPPU1I5gSl0jkrF8SlzPqL1ZTXhc14WaPapIGSIZ4NUnGJHe7npku1xAoinO1R+1Ii5s78Lyg=@vger.kernel.org, AJvYcCX7muHwJhc06nBu17rRDTDc+du2dmrnJ1SfFouXuf3I+S1tWutMRT9rMxWu63e8Yj/YsQ41DLkOSgCyDr80@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs4kcSU4qyWrA/rJ3eApISVWndpnkHw3TLv2VJBMIh6URnnaxV
	fWcsYnQhgqimaRLjYTZ6vyOXR+ma0Yqb1NkymhTsTDEizW06xZKsrobHUtdPt+QvDzQVUtK2K+B
	CknTpKHaVFhON4aH/Zihp9NVV944=
X-Gm-Gg: ASbGncvcXh16sck6d5J4sITCjDFJ/PvHFGTqsegfLSOgjYbdYGkrVHTrh9KUkuPqwUV
	GtFmCoKP1DapDqy3AYhLcXjrg54KUDnrFK1uBRdeAlMl+L7WSauZREAtdIlj8EXUJjLHWsiWXfu
	8=
X-Google-Smtp-Source: AGHT+IHgNzZylaM+zZeGmJCVW0wzeCzutFnm9tOjVqNinitAROSpEV6CxJxouNvJvwmUY/VWDRJbY8vF9dcNb2OIQgw=
X-Received: by 2002:a05:6000:154b:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38dc9491e7amr426795f8f.46.1738882602687; Thu, 06 Feb 2025
 14:56:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org> <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
 <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
In-Reply-To: <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 23:56:31 +0100
X-Gm-Features: AWEUYZmoPWHhToAFkBuF21oc_INOOZFv4ej_J9A_VfxRgRnaQMcmFMInFI5cvqQ
Message-ID: <CA+fCnZfzPLiBcCLQTwkgBqP1D6Cw-gFrpKEpTHs5PYp07hYXug@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, xin@zytor.com, 
	kirill.shutemov@linux.intel.com, palmer@dabbelt.com, tj@kernel.org, 
	brgerst@gmail.com, ardb@kernel.org, dave.hansen@linux.intel.com, 
	jgross@suse.com, will@kernel.org, akpm@linux-foundation.org, arnd@arndb.de, 
	corbet@lwn.net, dvyukov@google.com, richard.weiyang@gmail.com, 
	ytcoode@gmail.com, tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
	jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, jannh@google.com, 
	bhe@redhat.com, vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, kees@kernel.org, kasan-dev@googlegroups.com, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:21=E2=80=AFPM 'Christoph Lameter (Ampere)' via
kasan-dev <kasan-dev@googlegroups.com> wrote:
>
> I cannot share details since this information has not been released to be
> public yet. I hear that a whitepaper will be coming soon to explain this
> feature. The AmpereOne processors have been released a couple of months
> ago.
>
> I also see that KASAN_HW_TAGS exist but this means that the tags can only
> be used with CONFIG_KASAN which is a kernel configuration for debug
> purposes.
>
> What we are interested in is a *production* implementation with minimal
> software overhead that will be the default on ARM64 if the appropriate
> hardware is detected. That in turn will hopefully allow other software
> instrumentation that is currently used to keep small objects secure and i=
n
> turn creates overhead.

Is there anything specific CONFIG_KASAN + CONFIG_KASAN_HW_TAGS do that
is not good enough for a production environment?

The last time I did some perf tests (a year+ ago on Pixel 8, I
believe), the two expensive parts of CONFIG_KASAN_HW_TAGS were:

1. Collecting stack traces. Thus, this can now be disabled via
kernel.stacktrace=3Doff. And there's a tracking bug to add a
production-grade implementation [1];

2. Assigning memory tags to large allocations, specifically page_alloc
allocations with large orders  (AFAIR is was specifically assigning
the tags, not checking them). Thus, this can now be controlled via
kasan.page_alloc.sample(.order).

There's definitely room for optimization and additional config options
that cut down KASAN checks (for example, disabling tag checking of
mempool allocations; although arguably, people might want to have this
in a production environment.)

Otherwise, it's unclear to me what a new production-grade MTE
implementation would do different compared to KASAN_HW_TAGS. But if
there's something, we can just adjust KASAN_HW_TAGS instead.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D211785
