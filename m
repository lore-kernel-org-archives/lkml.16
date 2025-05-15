Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13320297C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306655; cv=none; b=aGIfJNEoOTDRuhwJbfqTBjrJDicmOaZlt83ZEqen8tug+YFXQo5vtczctyxxesrhnuSSHd31Ke92Al/VZLjLOZXdPjd5iB4CF0bkSlyvLTxVdfLpSO0pqJPU7OaUJxTSy9hu64XmEroj2ICbHwvLGFWtBGrezIYgL9y0ytlozMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306655; c=relaxed/simple;
	bh=pd35/84oe8FetZxaf+0BxadHSaqItkJifLZ5Ow8SoaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7UbodgDVh3Pga+HpsJkn7hrEXYG39azX/MXGNdqeNhZ2/JUC8psCLQX3bwIIguEO6wO+eUMsa3zlcb38Egr2C7XQtUTUKhS2r+Lb+I+ciiQ59hjh3ynHWd9le5hlsXxqZBwZ43LqdvKR3ix4ToE9dvXx56DSfVBvyBwaHMimbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEsWGQVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEsWGQVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C974C4CEE7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747306655;
	bh=pd35/84oe8FetZxaf+0BxadHSaqItkJifLZ5Ow8SoaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fEsWGQViaZvjmHD/1f0d8XLL0568eLRvQQ9IbLiP1k7+Yt9SQQIwFEOuSYZSQ/s67
	 Rwc46k+ZBgjAW6kO5tUk3+D1+YWh55NvrAy2Kt4MZ6GK0amJmOGIvE9zOLCKXyaQue
	 nDYgFaiABMMonAOLcNWq8ve+4shpS/I/EdgR0VaR6R1xwImyxhQZt0tEfgHHyxy4/p
	 S6efE90NR7WJoGeZbq7o6FkhBe0rr8gBc4t0b2B9oEuTamJQOwJh4KwHu01Ej18WHq
	 EY4/cIio4DUThwI7znwqXCRXDnNlX+gCc1MvphCf3Q1i12mPtXDctIAZjkoFt1sIf1
	 LJCa5IP169ipw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-550e2ac6bc9so347454e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:57:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVs4f5OCxN3gSIIPaFhEYKBOnCTTvVLgn9bVu2v91B7R9Yy+U9FWpXr/WhjL07Sp4eOrH09AcBTt6Jym8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RCL1UMibRMZSnvF8CK9tjvhTeuiqlEhtsQ8aYTSfOqSignS7
	73p0xcKuECEOnEmTNImcJU0QNUBXPuYtGHdoA1NgIyoocsv3mzCuYiXe54YBc/dRihdifRXA7ps
	34jy92FpK7/tNg6H5F3KBA/EhVaw=
X-Google-Smtp-Source: AGHT+IGCkkmHgQVFaf1TBFGmujWJuoNeKiamUr1C+dyrONbRMgjZJI++MzXbdclRcf6bHJKW79Sah79NhhLhbK/aJ0M=
X-Received: by 2002:a05:6512:22d5:b0:550:e04d:2b64 with SMTP id
 2adb3069b0e04-550e04d2f73mr317157e87.45.1747306653634; Thu, 15 May 2025
 03:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-10-ardb+git@google.com>
 <20250515095157.GCaCW5PRk1CTPjEtzJ@fat_crate.local> <CAMj1kXE0Ak9EgbQRCn+hCoO=Va-fpVrVEP=Bur_tUEthy+fs8A@mail.gmail.com>
 <20250515103906.GEaCXESqcyPcQn6xlc@fat_crate.local>
In-Reply-To: <20250515103906.GEaCXESqcyPcQn6xlc@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 May 2025 11:57:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFeRiFRsNwTE0ggFkiO8LG6maWmFJaY=jq8xk_JvFo=pQ@mail.gmail.com>
X-Gm-Features: AX0GCFthVyr-VTz7T38El6ZChy6VciduyKIa9m42z7b-wwC_oPCtQI0CgdLsnOU
Message-ID: <CAMj1kXFeRiFRsNwTE0ggFkiO8LG6maWmFJaY=jq8xk_JvFo=pQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 11:39, Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, May 15, 2025 at 11:17:47AM +0100, Ard Biesheuvel wrote:
> > I'd lean towards not lying about whether the CPU is la57 capable in
> > /proc/cpuinfo if we don't have to - this flag directly reflects the
> > CPUID leaf.
>
> We have a whole documentation about that whole "not lying" thing: short
> version - use kcpuid or some other cpuid tool:
>
> Documentation/arch/x86/cpuinfo.rst
>
> > This is arguably the important one: as long as "la57" does not change
> > meaning, we should be fine from compatibility pov.
>
> Yes, those flags in /proc/cpuinfo should show that something is enabled and in
> use. And it makes sense here. And you can't change that string anyway anymore.
>
> Whether the hw is capable is not important for userspace and there are a lot
> better means for it.
>

Fair enough.
