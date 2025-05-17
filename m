Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6661AAA1C
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747492146; cv=none; b=AtZHyewAyeMvxfdrMsfZwfAzMjq0N7HHoGelJ0rvxEGMFeMvFJIU46kys8h8l1CPvhfhJfB/fE4PW3YzY5BEvre8K1P7EV6nN7G0xbO/mDi9VkWKgaZu0KgVYyhMmqFOBdq0UqcUTqDyEaZqqpKfRLDfR89kIJPm+7Q91/T4h5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747492146; c=relaxed/simple;
	bh=3UPe9BFtbMWr2VwlK6+wK8bTOouMrY3lAsaiitolYK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZwqLwK03XYsfLRk/+I2ucRg09AdjOYXmW+7LS3fGKZTg/ieukdM+dVhe8lCBhPqWGyIhi8cKJDUkhLrEnRT9LQxe7ZQTRlUi9vH135WXrz6faPqMYzSGrUPU5lVwbEe22nDnseFj4Yli8q3InNkcsnJhptlMOrIsideyrZ2PT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6WcWv7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6WcWv7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD60C4AF0B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747492145;
	bh=3UPe9BFtbMWr2VwlK6+wK8bTOouMrY3lAsaiitolYK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y6WcWv7/7Ttbe6/o0fueZslcTaRSvM04Agqx0PZfizyiqvtDL6cZnkNpOesjciU3u
	 zNlufPqh/JzmNb/wjo5jfzGpP7gow8qSHCMKwfrtVNCjzlAD7xs4IV+bxj1LGM39hS
	 k6y0zFJ6CGGnZGMqkMxrGS3ZEdmVLwqbMuQDlZnUV5mGkGqZPj8BT6PHttOAcKsODB
	 rNPqY5o3H/CduMFaROIuPJJtWg7Yxk82TzJpCmKFZExVLsDCdyMe7EmtAQjBPDkkaw
	 aYCJ/iWtEZuOYwtLPvfJtMjFh/qSZh2IqSLAWcyXK//BM3B49iISErr6MTsuCzc4n1
	 bPbgYEkUh/3Gg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso3479153e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:29:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywn/2LohmKEXFdlMPI/UlEqvsFpMphZQspMzdWxxtzPTslrBOOM
	83KQDmNhJ+nZ3shof2wRF/95CagJz0tjvrLitggCeDqFowtVeak0HOXmEVjBBtgG+mXWxWIIhqb
	qLyn4xUjCA8i9Sr4ozL/2jA0TAMBG/kI=
X-Google-Smtp-Source: AGHT+IExZ+k2TbtYYe0ouWFsNN88fcbgCfeOLityNvH5otUE2BH+splL/v9V5qAVwOhr+mYcy/5sJIntx9MTnqa+1ak=
X-Received: by 2002:a05:6512:4508:b0:54f:b8a8:d65d with SMTP id
 2adb3069b0e04-550e722afb3mr2166290e87.40.1747492143771; Sat, 17 May 2025
 07:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com> <20250517091639.3807875-9-ardb+git@google.com>
In-Reply-To: <20250517091639.3807875-9-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 17 May 2025 16:28:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE=-408evLMwPkH5SqK-=QPpONGSXCi4_YeZAgLt06Aqg@mail.gmail.com>
X-Gm-Features: AX0GCFsZVlFb0ZGpIHSOwvnR0zuKBefXs1LNOc4UN1jn8ZHlFAjFz2yu0gy9Q3A
Message-ID: <CAMj1kXE=-408evLMwPkH5SqK-=QPpONGSXCi4_YeZAgLt06Aqg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 May 2025 at 11:16, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Currently, the LA57 CPU feature flag is taken to mean two different
> things at once:
> - whether the CPU implements the LA57 extension, and is therefore
>   capable of supporting 5 level paging;
> - whether 5 level paging is currently in use.
>
> This means the LA57 capability of the hardware is hidden when a LA57
> capable CPU is forced to run with 4 levels of paging. It also means the
> the ordinary CPU capability detection code will happily set the LA57
> capability and it needs to be cleared explicitly afterwards to avoid
> inconsistencies.
>
> Separate the two so that the CPU hardware capability can be identified
> unambigously in all cases.
>
> To avoid breaking existing users that might assume that 5 level paging
> is being used when the "la57" string is visible in /proc/cpuinfo,
> repurpose that string to mean that 5-level paging is in use.


>, and add a
> new string la57_capable to indicate that the CPU feature is implemented
> by the hardware.
>

^^^ forgot to drop this
