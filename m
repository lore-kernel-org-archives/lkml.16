Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3561202F87
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747384307; cv=none; b=SZOs2ZYPxpBw419NWcfh0AIhXHCwb7kBkyxPGJU45tGnRv0dNimoHejP4u6x+36PreH0N7CLI8dcg3eMGDxErQuswPv3Zc3ibt4Zlx/ZG2z/AHcIdEv2ig4rxgKeEs5NNCUzbTxk5MZZxplayKXFMv86gh8dtk9ihjRKFmTv0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747384307; c=relaxed/simple;
	bh=8l0qT9/aRBclBk4PNIkbOC8IEdpgF6l9qOR492qyWkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YR2z/o2bftc6bwuWwfyxBe10PveojrPf7W99YijaqF2q1j/1/uoOV6CSrCzAVSRGnvdyhwCf2A99KSHvD3Nqhtw+RFvyPRIsicDl3xOiJjmt0SRLwJkBGGDw9EBIHnCOrCQEUvJY7xMMvuevsDot2IL75SGGBJ2lCPmpDssWRG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4lCXG9G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4lCXG9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BB9C4CEEF
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747384307;
	bh=8l0qT9/aRBclBk4PNIkbOC8IEdpgF6l9qOR492qyWkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c4lCXG9GTd8Zs+5y9SeYdXlQJL3FuFCLzg7KBvjbbb2mhwD+5dX8vVM27qbUZNUQS
	 GV2ng7NickaF3yxoDYLHDsCKsIvqn2rm1AfuK9K75PTV9dul0d1dtdB48K0J1jGfnO
	 3AaCqv3FZRTJG9K95bMbZl/cz66EEhodwaDbOF74IQ6kgEF7XOgDNKzMu/DiQ1d0gX
	 9hpRrgKxvYnwQeN1QnilAm7iKTcBC/lMnyDG4PSHlDCPcy/IjiANXHoIZUVfbmkYnb
	 QhHg6T13q/CexoiR4M6kUtQEPw5Rrk99n9OLw4eTDPqG02vTjDQokIUhjG0zKsaRvM
	 7zcwBiNIyBAAA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54fcb8b889cso1744681e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS8NRHeujE/dsEKq/XJy4XBqhlmTSiEgOzgbrTyo/758/3Ci5uZv82ar0EkrL/P8Au9gLQR2Js2YqMAKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZfJZEo31Y3TgB+ymy290ZNR2Wk1vM8bdVLxeIiSDd+SZTCCsY
	lV9YbtvmW3UjWUSr6d8hn/ON+PHyBWAiONt8HfI1etmeBGWWunuus5TJysXV8odi6+VEA2/hDpZ
	p6PynQYaBR+d/XV5uP9DoFejU77pTrrU=
X-Google-Smtp-Source: AGHT+IHp8Gx7A9TEf6K5i+tsTYL9lLwxVIU4HlXvK6/zjhh4lvehRKBfeqzmFtmI8mrOEEu3WNawlCSrNcEfdC4DO2c=
X-Received: by 2002:a05:6512:b8d:b0:550:e31f:1d22 with SMTP id
 2adb3069b0e04-550e71a6739mr548063e87.13.1747384306036; Fri, 16 May 2025
 01:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-10-ardb+git@google.com>
 <aCWbsM1qaMsKNkMj@gmail.com> <CAMj1kXE7TwZU8_3N8xUGUV+XMxC6LcTMCAC0UKpr6i_Hwx=VfQ@mail.gmail.com>
 <aCZ3vvKFMcKcc3h-@google.com>
In-Reply-To: <aCZ3vvKFMcKcc3h-@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 May 2025 09:31:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF4MubA_wRwEbUd=1odACOAV-ja3bPcJt8BVi_kRDtfDQ@mail.gmail.com>
X-Gm-Features: AX0GCFsH_Bo1JXHa3wQ9UVR8xwM0HmxqrHYXB4hxQcdQjXPx2FSNMl5daj477Dc
Message-ID: <CAMj1kXF4MubA_wRwEbUd=1odACOAV-ja3bPcJt8BVi_kRDtfDQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
To: Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 00:24, Sean Christopherson <seanjc@google.com> wrote:
>
...
> Ard's patches are completely wrong for KVM, and amusingly, completely unecessary.
>
> Simply drop all of the KVM changes, including the selftest change.  And if you
> want to save yourselves some time in the future, use scripts/get_maintainer.pl.
>

Understood. Thanks for taking a look.
