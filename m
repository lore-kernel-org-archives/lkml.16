Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368528EA77
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518660; cv=none; b=jjz05WR0tfopRq7AZqLbv/nJXC4Z/PNckKxH7fRIRSRRQu7W5Hz3Vk8UXLz0oQ7WA0viWLVBIXwp+BcmostLAr+657zjRave3Jgx6BruzIpyefG8OHBwQt2Lg6tTTgB977hiyM0/A7EccW91H5T6iZ9LUHg8UlZ6k1+A0UKTmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518660; c=relaxed/simple;
	bh=bYuTN1lzzJp0S/KXCampda7sf8j0POvQwSgItljisHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3nU+sNNUg6f4UX2RHCUI5tgMte3fKVVkZKkQ9ihnRpjgMU8Rsw15SXn877uPLvWbkhojGBRTawewGiqB7EpAyMCJtQqtE4PkNcakqW6wDm0BvJUFzmAPPFhQXIlCJiquGyC7UGElyxzHSwLyBHKHvAm0ECBmn/s7kFgkNglZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqIgarZ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqIgarZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE38C4CEE3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745518659;
	bh=bYuTN1lzzJp0S/KXCampda7sf8j0POvQwSgItljisHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tqIgarZ0r3JD+R8W9rhM9BNXYYwW6kMe8qm/MUpODN84eo3J1AOKyJTSn2RTz8mye
	 CTtaXFOdwq3unz17hEs3k6WzZddGiHM/kXnyGo8TMk+/H740B6YU7EP+lEpj5SG6aQ
	 LwnDA8VD0MWo6Y5NUU7KkSWI9+pgwWyTax9QqvHtO818wGKFLSjL3k388qijWn06wm
	 hL4l+nlrT4BAOkNWPZnLLKz+wmHkmNjYIW8xO/zv40pQM6RaAgPzJ7CvFn3gefoGSQ
	 C37+/HBAegW1gfjijyDwjwAEdru+HjKlOkoiMwxIfdP8RWtZ9uMOvTw47eab8gdx2F
	 Dt5nMYl7GfIxQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-317f68d0dffso11078931fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcMo2Vn3hn769Mf2JCAAo5HxxduqA1FXVcizpt3f6lEk9ATblOetc4gxjmhb1R8Cr3uthzWcrlc3aqcYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBulzCG0DeAP0gGEcj6mQn4kyXgrdEAbNPH8+rMSNVSxbKBa2z
	CN8roBFnyYC+fSpU7/8Zt52bVbqOZEMd/r58izTBXjymFrZqkq7TfkpxAXeS8MCtOdOGOyPvEbM
	TlIzWeTICbmzq//eTHuvMbPuy6c8=
X-Google-Smtp-Source: AGHT+IHxiG+nTuBjec15io9GjMYOoU6fsD7vDX9He6co7X5a7BspwXg7X9n0/eZKtCqYuKKygohSm8cWcvJWgdotFrE=
X-Received: by 2002:a05:651c:b0b:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-3179facad86mr15677261fa.32.1745518658232; Thu, 24 Apr 2025
 11:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
 <20250423110948.1103030-14-ardb+git@google.com> <aAp9dMyCJ982GvKY@gmail.com>
In-Reply-To: <aAp9dMyCJ982GvKY@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 24 Apr 2025 20:17:27 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG4umHx6ebVRjg-C+_xJRRBrxmqhiDKqVychCPF9PJoGQ@mail.gmail.com>
X-Gm-Features: ATxdqUE2WWjPDnNhaWMCk4rdZrJQx6z3Bsp85x_MwKZoD0Fy9ZkeB8U9nIfIpJg
Message-ID: <CAMj1kXG4umHx6ebVRjg-C+_xJRRBrxmqhiDKqVychCPF9PJoGQ@mail.gmail.com>
Subject: Re: [RFC PATCH PoC 01/11] x86/linkage: Add SYM_PI_ALIAS() macro
 helper to emit symbol aliases
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 20:05, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Startup code that may execute from the early 1:1 mapping of memory will
> > be confined into its own address space, and only be permitted to access
> > ordinary kernel symbols if this is known to be safe.
> >
> > Introduce a macro helper PI_ALIAS() that emits a __pi_ prefixed alias
> > for a symbol, which allows startup code to access it.
>
> s/PI_ALIAS
>  /SYM_PI_ALIAS
>
> What does 'PI' stand for? 'Physical memory Identity' map?
>

'position independent' - it's what we ended up with on arm64, but I'm
not attached to it so happy to switch to something better.
