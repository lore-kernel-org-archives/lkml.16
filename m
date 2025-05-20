Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8560E10E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740575; cv=none; b=m8+vznD5DbXdRg6oKKtpKNyrjcSyvrv1vM7I4+qtrxnl6YQIRcw1JYVppJqaxe+vYpy9bpog/IEX5I+50OMy+Ngo5OqAfx0TzLdUuuBVXdeyjAvdk1Kerr+IPBXKt5/AxQynYRRtj+08ANlAvqyB8+A4/f8yhASdoaVJLG54buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740575; c=relaxed/simple;
	bh=SDchw3DaHYCHIIrzcYnqUBgMGG9Jx2vsq8pyNQkjnfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=navakZNgpBivrpKJwBvb1HbTdlDBHlozlrEnEq5jMWg3SJB6PhMBEWMHd/+G1FtrGFI++XjREYGKbjTuEjbPPZmQCC8rSy3mt9kUUwbFH7pHPlH90tRkAanMtaPQhSWlnrwSx8g+aZZ2cWxM4jv+MysDn6KLQhTk4e3lnnFgylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s98XdcwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s98XdcwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CCCC4CEF2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747740574;
	bh=SDchw3DaHYCHIIrzcYnqUBgMGG9Jx2vsq8pyNQkjnfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s98XdcwPsdW5VE5N8MQjqf3pJt/++cv9vdU45XzakH0TUAt4jKIGe0Pw8Ld2qGtxm
	 tKBW2ltrlYUXj9cU+opnx7B83ADhvvK2+abDHPsAhexcdWIiajL/cNvPJ8s87Dmq/J
	 uEIv3wQGes7SVCrVXePsvj2aM2pqp3kNnrmnsiDkY+qAaba1u3a3D3CxXuJgRATeb7
	 SvmCCFV9wkYxGwatVIjeoDUFy6A8xffytUQAoR5vxB/6O7D6bhUXUABto1P0O/37wV
	 yGJsIh5pQVFEzKXmL5x9IzEoGObRvDjtlGxrcAybKNkDOymEoU4ee6jTDpDn6JtwZv
	 9Z2WhdFz1o9Og==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3292aad800aso5373641fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtUXzyfxu+TGlwOA0PAEuODfowiR+HQG/LPxXLSQvJBL/zbyfTp/l1C+v5sJR8Pt2gf+veTEkrvT+g3Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO29Kx03ouVuc3ZBmdhqcoXyZgU89vOlhuLVlJrsu5EY7JdQa4
	MPXTnDe9UAUf7BTHiDkt/hUdE79MdPCk8PDVfQNdqKRWxlBjPPrGtcuTnzeyvfA6VkUa6Dx2vrd
	BydPg591ecBj7N4MOFRlkyg81Ocn+sWg=
X-Google-Smtp-Source: AGHT+IEqIQksb+9Dgr6SWr38ps3c4LFnIjGjO2kyZm8miqYUh/Hwqsc8+aN0+C+uH0XYaY0to422FKdobVPTolDn1PM=
X-Received: by 2002:a2e:be14:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-327f84f67d9mr68948031fa.14.1747740572387; Tue, 20 May 2025
 04:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com> <20250520104138.2734372-12-ardb+git@google.com>
 <nlkjrtpuohrsg3u2gqhia7ns7ogrik7ztmks5q5bdhn3y4kfhi@k7yxsyc7j4fe>
In-Reply-To: <nlkjrtpuohrsg3u2gqhia7ns7ogrik7ztmks5q5bdhn3y4kfhi@k7yxsyc7j4fe>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 May 2025 13:29:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH2vD4VWMNroScbf1KpnODR4TW5MryTYOXchmso0yjimw@mail.gmail.com>
X-Gm-Features: AX0GCFsPTVHuo6mfgELJ7ZpE5QwaMYjnN2-9WYEkbEtVbWNq6V1OWtJxatdLAZM
Message-ID: <CAMj1kXH2vD4VWMNroScbf1KpnODR4TW5MryTYOXchmso0yjimw@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] x86/mm: Define PTRS_PER_P4D in terms of pgdir_shift()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 13:08, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Tue, May 20, 2025 at 12:41:42PM +0200, Ard Biesheuvel wrote:
> > @@ -61,7 +59,7 @@ extern unsigned int ptrs_per_p4d;
> >   */
> >  #define P4D_SHIFT            39
> >  #define MAX_PTRS_PER_P4D     512
> > -#define PTRS_PER_P4D         ptrs_per_p4d
> > +#define PTRS_PER_P4D         (pgdir_shift() & 1 ?: MAX_PTRS_PER_P4D)
>
> "& 1" is a hack and at least deserves a comment.
>

Fair enough.
