Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91921506A;
	Wed,  5 Feb 2025 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796671; cv=none; b=PmdnX/FoUKJwDxdWZ4Elljtov8WFVBVSAMyFwMliK+WISvrNwtfpjDfbb8eXawprosuVQSondFRMnOC0Lu6Od16MnJfyi9DxTDmjCstg58ClSANktef+TCcrDe5Sfd9fJv7NySOlRZ2ArbKOtTFQ0HmgSSkUfIBKfmIg5Goa3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796671; c=relaxed/simple;
	bh=S72eIFvgqEoxbQM8qfvjvrlejM+2TfjiaT1i5lkDoBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ng0Uw0cHCP0xk/GLnRjZeUU+c1ON+HHrw8e5SMNjAueYsl6VlpH4CHkFOFZ1K7FAaBzJfbzilt3lFGQUXpnqfROoDX/dzupeUHKOrPB2C1QFEsO5BpuIUkQOW7NnNHfP2xczprouqaVg7Kvp3gb09x+8521HCqQkO5XTvtswoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxyO/DkI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxyO/DkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721B0C4CEF9;
	Wed,  5 Feb 2025 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738796670;
	bh=S72eIFvgqEoxbQM8qfvjvrlejM+2TfjiaT1i5lkDoBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gxyO/DkIBHu33ghmCtkfFrFlUN3JY7dEJtRA4pQwuM07reGkxzbEhCZcgr4IMasDY
	 pWDkdJQ+6UOIgP2OEhJun7Fwn7KpWXACgdOtQGO1CZwId+4GYindFn+9vuM2cQ2Mu3
	 gfL/UtkDZsecXf6mijPtEpfQlDUu2e948Vzba6P7yWbyWXLOsd/ZDfN6AhNhWoHkhl
	 MiDI4bMd97k6Am9qe0I1naMjos9I0Qs8bqqABHo06hyAUdnS4yX9U7EVX45tMXgGks
	 cbdHqt7kn+WXlGr1y89W631siCs+AtscTCkMTFkhU5jbUVc8vOMSbaioAoWksoeGKU
	 WbSixxOzuVMaw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30225b2586cso13535921fa.0;
        Wed, 05 Feb 2025 15:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXAmFXyIClSdkBd6sZYxUGdG/+sI6uYbSFZAQdTDIyXd+TLZR44xnAw0tqI6E+9t+ej2GarndTrMchC79u@vger.kernel.org, AJvYcCXGfhGhGm9T8s7KQgbcHYV4ap2qACyEb1tuOuBJ+gyddHhEVunaxZI/jLY6QLakxUU5h20IdhF6KJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLzsxUoACQd3KlVK8ALJv3hs0NZNBzQHyDGRtN4h7iJIHiwOx
	xj08XmfxZMbWDOI0bCQ5lk1d06lSpPsT3yJlBnruYxYfkpkWhxtm8bceZO0Qa537xPhVXfpnnMs
	BUxVH5X+NYS2KbHJKLV/AQ1XmMNM=
X-Google-Smtp-Source: AGHT+IF89pjNvxORXTiz/KZ99MrP0x5RvRSNjKSsJcaqJGPWoeuT1g3SMmILZLP5X4y5h0x0Un2+f4WGgAowvASu1X4=
X-Received: by 2002:a2e:2c12:0:b0:302:41f6:2352 with SMTP id
 38308e7fff4ca-307da5ae80amr3376651fa.16.1738796668357; Wed, 05 Feb 2025
 15:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <fb30574a-d238-424c-a464-0f7a5707c46a@intel.com>
 <3dcf7631-d839-7235-10c7-30f80d7f796a@gentwo.org>
In-Reply-To: <3dcf7631-d839-7235-10c7-30f80d7f796a@gentwo.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Feb 2025 00:04:17 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHktLC2F=suQoNF80-ZQ93-3pxWz20_L76_6morUGPaNQ@mail.gmail.com>
X-Gm-Features: AWEUYZnX90yX3IKaA52q5S_M7G8eGfUWUp3XkEiKOjpcZPLHNrjrrMHxTq0wSUs
Message-ID: <CAMj1kXHktLC2F=suQoNF80-ZQ93-3pxWz20_L76_6morUGPaNQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Dave Hansen <dave.hansen@intel.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, xin@zytor.com, 
	kirill.shutemov@linux.intel.com, palmer@dabbelt.com, tj@kernel.org, 
	andreyknvl@gmail.com, brgerst@gmail.com, dave.hansen@linux.intel.com, 
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

On Wed, 5 Feb 2025 at 20:31, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>
> MTE tagging is part of the processor standard for ARM64 and Linux will
> need to support the 16 byte tagging feature one way or another even if
> Intel does not like it. And AFAICT hardware tagging support is a critical
> security feature for the future.
>

Can you explain what you feel is lacking in the existing MTE support
in KAsan (enabled when selecting CONFIG_KASAN_HW_TAGS)?
