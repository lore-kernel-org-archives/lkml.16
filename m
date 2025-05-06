Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895024166D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553978; cv=none; b=n+ZZtd2r/vvxjvBwwWZ+eXbpB9U8q6aBGBOAVuXnuie8frwaYYH8dvQqpCf/DsYAFFblEvWPRNnPyJoDdkW+QyTGxg/GWgM6o4dnGKG6pnYp1fWS4TI8gJ4tKtILl7+KfIN++F+c5NvWffxBDcDfWIRerp0vfPfWr7PjA6wUmJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553978; c=relaxed/simple;
	bh=ix4XPc6aZ0HI07a+pFORwukyAUHQXJv3KChLa9empAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9QSOnr8ZGafpqtGjfun3ru2GgdVKyghVQ1WU6Tw9nDUhoYujNN49twGASXaZgB/sr/0s3/eNXIOy33J+Heodkhzvlq1nyEkwGOD4OX0fQp815gPMns+00WUJ0+MBGCczXh2yLC1/Tq/W9Xtdj7GceCKRVyQIz2mpRyWovVtuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUN6nH4H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUN6nH4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE76C4CEEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746553978;
	bh=ix4XPc6aZ0HI07a+pFORwukyAUHQXJv3KChLa9empAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RUN6nH4Hql8QDfZVIq0SkoQ2T7Qsk1JK6MbqsXhbR888bKg32vIMEEfU3QIycrEGL
	 uXCoZZdhIQ5isYj4x+fP12+GT0yRbX70gS0Z7vzo18/Olq/KzKKgRqFMK8GBNe6qj8
	 KJXjhSrpXCdlbQCExyp9Ef1a1QuFGEqcMXcGABi+Heaeh2FnMg6X4/X4th0sNVRWD2
	 YDK1xkctarCYFt3X87UJmwQGogcUU0YoNtzzODM1qcCcgjZJz/xTfZ10aEn1uTpwdi
	 Q/FXoOM5NF7bcN/jEkBPkFZp7Q/uY9zR+gyJBE28lbcJNmOFhIrwPtQbmTzO9THr0R
	 TaBRLf7Vk9TYQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3104ddb8051so57644161fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:52:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVi1kmOslxtyxNqwhutz2auZTh4cNesdeIpIAnTLy6/2dsgXsD5PVwNnJAUzuH2Nx1uWuhTHNaHblEdSlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywye/aMaddfTVq5flxD60nGE0gn9+bq22mc63MMzCFscPCHg+pD
	MIwcEV+NrAMls1DuunAGb4S2f7KQwXO/bd2W1ANOOfC4SKXa93NoGz6VziJmZF9Xq/uxGotCK7W
	3K48+j2xWVKL9I7jI1FtBZ0+GXr0=
X-Google-Smtp-Source: AGHT+IFOhXM0K5rp9YtHmb7moTaI4AP/pmsjx7uxN4nWFCGZg3JklwKO0Kgss646B2gTiQTl4NMPmcZANRcPUQcL+DU=
X-Received: by 2002:a2e:bc21:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-32352504dbbmr52575971fa.33.1746553976679; Tue, 06 May 2025
 10:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com> <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
In-Reply-To: <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 19:52:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
X-Gm-Features: ATxdqUGD-fR3MZE0e_dwQyE5OwAKsE7hwXmyAjKXs_EiNN-vYs70vxVKswEH3ts
Message-ID: <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 19:44, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 6 May 2025 at 10:26, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > In the light of the above, care to comment on the previous approach?
> >
> > https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/
>
> I have to say, I find that one much more palatable.
>
> That said, I still think it would be better to get rid of the early
> case *entirely*.
>
>  So it would be lovely to have a subsequent patch that just makes the
> "before fixup" case result in an UD2 instead of "read cr4 and check
> the LA57 bit" and then fix the fallout.
>

Pretending the early case does not exist is not going to get us very far.

The very first thing we do when entering the core kernel is populate
the page tables, and this uses all the macros and #define's that are
based on pgtable_l5_enabled(). Alternatives patching occurs *much*
later.

cpu_feature_enabled() is currently built around that ternary logic,
and so we could use it this early as long as we set the bit in
boot_cpu_data. So that might be the best approach.
