Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C781C84CF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220563; cv=none; b=Vgt9NyxkHLXx4g3MCBxGtWaRuXQHWUZKMLgp1EhPDIWN+aeapTU6gKwDVGYCKAXti9hfJpd7NUS9pVw/wTechA1n9LOr/4zYHEIV0y7CeNQN/xh6K/hW/tbRE2EaEuZ47wlZLf5ys5KGfNckguVhIGaVjmb/OGuz/iY2ZUlNWo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220563; c=relaxed/simple;
	bh=6nNQatqaorKzv92tvaje0/GNGx2i/9tcg23Gb8LTF+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4AvfIskVXlIs0XXZNm3Ia1cXvB+Jx3lsCTXhJdTo7Ffrgm/9yeXeIpqmwMz+SbqggHTqaXpCHzdLJEedrEYI/Yqrs3Tl+y2KUjUEkXu28Lptbsp2RyZD5RwomGcH0D/0T0akGpc063WJEegnZHnJj/3QiFAMX6zerRFOLjdpfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dheEA5P6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dheEA5P6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so12307929a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744220559; x=1744825359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qoBR+vDT5PVn2pWN/hnunYWhxqisiDADqelTleC033g=;
        b=dheEA5P6ud67PKRq8WjAQEOSGhc7/Aoj3rEwgFyI4YeQemuR3QY/HHtred2aTBICvg
         XgjaJW2nVB2vtYLc3HQGdRPfYf5oW8btOxGthgj/IQn7qEbUBtEi7RiLpzsM5E79sJpz
         rGmut3QubtgInrpvzCCyXsbzVE9PjtDlw4WiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220559; x=1744825359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoBR+vDT5PVn2pWN/hnunYWhxqisiDADqelTleC033g=;
        b=N8+t6BjCrquFfCOaYv7JUS34hlrV1zVN4E6c9E2/O4OQp6v5Fuj5pxd8WxjRdLOE39
         0dz4HKwvkq6cdQ6nPR7kww8IIyan0aLemJz7f8Bf4mYJ0btVRFUKYEBMRgrWHlQNCryz
         1CHTtEKeZ9wTDBlKiMxMAV+VvjC7HRiCTBr94m+E13ZTZ2rUBLOvfI4r1wcahhGjykSz
         vpt6vzhXY/lCd0njfyN1Z5Iefz0si0Rr48LNQJESorFL4mx1XUUz+3yT4hZPVou2Hl1e
         CLeSN9hi7cSRy+5rLI0FOxLNzrBV1OIsJo5V/y5uKhmSvoIGxysTGofYzbOYRATt1lPN
         mTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiYMU4dAkLOO11i0wFiTfv9iT3W1ukmZtxDhQJUi281DXLKJg/RvoHg0HC/ARmDkKxSJr4mHh3SIVOzTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTpjPBj3IRm42IZ3FilvAXpTOChT2vbbO2F7J2qVt8NCHf9Vj
	w/2uMSar63q8oNlc53upYDbQX3aJCUnDGN6JAU5q+FclQvZ3jRTQlzEQ6OT5Eg/3Kozosl01ngZ
	klv0=
X-Gm-Gg: ASbGncv+NLOi/j11v03kc8RXWh2ecW09VrARFLjn3tUhOPIid1lSiEsIauHZlng9GbV
	EkzaDIF1hN7TVJ/jDHx1sbVmJrEfY/iIRkCGY5Y9IxjigFxWREFxjTwD2e9cHs64BjuA3he0ovU
	qB60K9e5bOeDD1s/B4iZ/XofypbUTQznOVFsmzpjHVWAfHCwiu8VpEcyjouo7s4SGxUPQJ40fXW
	p7hjbyL7gKlDZX7RAQTajUXo4n1Ta6xnYY0j6+EszK8Nk9DZHz+0a5qfcsEqX8rXU+D+ZAwpTRo
	hVj52ywh2fdXWLSvhqHdiF+h/JLeSCwX33+D5r/WI4x2udyRodEH+bSat8qsK76Q+9VR9KqX9qS
	+OkavKlA3+tSG6Vk=
X-Google-Smtp-Source: AGHT+IHCfpm0ncDaWg+VH81qLMR7q/WX7w6ZTBqpezICa56Y9kx52uJDMxhQAwmJ0XWEI5HBNsbnUQ==
X-Received: by 2002:a05:6402:1ecc:b0:5ec:cc28:1a78 with SMTP id 4fb4d7f45d1cf-5f2f76e4cccmr3807958a12.20.1744220558768;
        Wed, 09 Apr 2025 10:42:38 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbd35099sm1048370a12.68.2025.04.09.10.42.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 10:42:37 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1340326466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:42:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrXt2DvmAaduYRPWCv2a2VJ5AGNN4MqIsd4rGEwxNX7aqLOYfipfeMXtnTSRRE6aHV0XP9uu0jqiev6HY=@vger.kernel.org
X-Received: by 2002:a17:906:6a1d:b0:ac6:e20f:fa48 with SMTP id
 a640c23a62f3a-aca9b697344mr478182666b.33.1744220557177; Wed, 09 Apr 2025
 10:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-kbuild-disable-gcc-plugins-v1-1-5d46ae583f5e@kernel.org>
 <202504081630.4CE88E855@keescook> <db50faff-7290-4193-b861-f60e36f1d1e3@sirena.org.uk>
 <CAHk-=wjc+piYyUw36s4ttEkY32jVkxhRtyrt431wew7XcDS2Qg@mail.gmail.com> <a9a459c2-674d-43dc-9e27-41de0471f602@sirena.org.uk>
In-Reply-To: <a9a459c2-674d-43dc-9e27-41de0471f602@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Apr 2025 10:42:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKEuQQh2JymabBQLrLs=pEfx0qYVmUnYZRq_tOFj90sA@mail.gmail.com>
X-Gm-Features: ATxdqUG-Bs73VX2eSGz8XZIzzueOW3xC6j3KpNJoIRi6w4YuDwZR8xbIvrtKvKY
Message-ID: <CAHk-=whKEuQQh2JymabBQLrLs=pEfx0qYVmUnYZRq_tOFj90sA@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Disable GCC plugins for compile test builds
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 10:29, Mark Brown <broonie@kernel.org> wrote:
>
> Sadly it seems like the build bots didn't find it, or at least if they
> found it they didn't identify it well enough to end up with reporting
> the issue to someone who'd fix it.

I wouldn't be entirely surpised if a lot of the build bots end up
running old distros (because "enterprise").

So this is presumably only happening with certain compiler versions,
and I expect the build bots have a fairly small set of compilers they
end up testing.

            Linus
