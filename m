Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487841CAA7B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075585; cv=none; b=nYeWLtFLy3OQv3a2yVnpFlF/7fcjKX1Aj5NVaRuG/XggkBxkf53uomILY0xRDZVSWhxghBf8ldkBufc+56ROL3neEZVWvRF08Dba1VzjJg3ywTL6HZouoPifjcvFGLY2BNmZxkXyV6jKwpgT+emznMNrlD20fNiORDa9OCj1n1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075585; c=relaxed/simple;
	bh=AWWKKzYmc9IVZA3SgaMZf0tabllSk5IbLZQqzMMobPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzzhkWWvZqhL6cRHsIr11qgHXp4kkNEFJNo1NKNbf775/W326NLnkPxuTaJWJdkRQYIJIBVFNwC6T6tbbBZgleWU7FwlQaZesch22W4QntDY3ezZTafWb5Px+ffBU2DxpgDB7Uc5cAvV3WuoEkpdcAObryypBaHo27pLmEdgW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4WMGLRA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4WMGLRA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so646959a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075583; x=1745680383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWWKKzYmc9IVZA3SgaMZf0tabllSk5IbLZQqzMMobPg=;
        b=J4WMGLRAi3kSFE+zNVAyt04q8ybzMdUEdx7RUaR9dqt6LfV3yOgRNx0gQ6j6oAM1rC
         +v0ICX3iG1Vh7Cc1y+EFL1Dk0AWzIGuF5FM/0f4Fh+/qZxkyzbcro9n6U1U61eOTiDdJ
         7HqrDndfv1BZml0rZQGkAVt4fLowXOs6GvrzXfnva8NWS2ML9IeFCmsaE4TuHISC0y52
         gtdRSBl9DHgc6u2mOVnY14LZnFKaG7j+ArgucnR5NsdXf33C03xjOB06W2hUxPQhKWZo
         uYFxer4vhs6OfEHbM5zB8fBzABfuYnlIZdtV+r5OqviK6c9+mWXt3tr9LLqYIqA9i3T8
         wLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075583; x=1745680383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWWKKzYmc9IVZA3SgaMZf0tabllSk5IbLZQqzMMobPg=;
        b=XmNKGEQzJNX9wLvJYJytGAesJ2R2slRIr+zuiRmDFZOEZBbXjRK1TNPHlNtbK2vofI
         x4+hVKeu+nDuidJfHPSq7qoe4X/RUiivfGY3d8AcXBvA3kjPwRiJMg1G7AcuZSgAkXYs
         FuDUEqsvga3Z+PXE3S16fbwiVYmCWu34rbDsVvk/Qg4CI+cVsaAHYycwR/En3jj4AHfl
         Vq6P9uGAliv+z5QWsGvc7TUnS6TC2nKeYPI74jQJd3lDnUAMNLibZbALhQMNi3MlWCcP
         LSPf4Ots54NcCEa6RNtZzT603pnwUDNOlACHy/8M5wqlkSD/4q85ppgzb8wqht5QWcfq
         9ACQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZAV0+xvpdQe2A5+xA6pfD4iI9GxqNvfHd0uwGdkfH8ahILd9x9ibo4OfKK0ZKA/t7O+WCeomXncXHmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5StirUE9JiC385oHxNZAoOVIe2yNDwGIs2WgHmiuDcMLqwhCi
	8oFsCCl+Dx30TT4T69nbk5XrCxuuFTWy/SWsBjC+ym90Qdml/t9fy8m3sctrrQgQEt1fUfzJ8Vj
	kCc5og+nlBFPGglJ8Wq8FtwA+Z3oCke9q
X-Gm-Gg: ASbGnctZzvKhxGW0aYjrywASW9DBsX2EI9svKmXZhSeRsrZQrvPM/r5secDDiuX2/yq
	gcQcKkcW17MyHJxEUt/ZNq/e1uYp6GjLwOqJMNctnDVLBq443zDHGLRq28LNcYgTKgCCIFHKdwF
	vaD4xgX8HOUTmVAQohizMggA==
X-Google-Smtp-Source: AGHT+IFy7kXd0JqlXptok6RmBFLaRWEBkMjR7nEvMBdI4nHtelneF8i6wJ+PqkEICbTjQS8hOWXQj8vTsrvjZ/uwLPA=
X-Received: by 2002:a17:90b:3851:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-3087ba58fb6mr3524690a91.0.1745075583514; Sat, 19 Apr 2025
 08:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305202652.GA2791050@ax162>
In-Reply-To: <20250305202652.GA2791050@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:12:49 +0200
X-Gm-Features: ATxdqUGdTQDpPBTYJdSCg0gsZLBOl3nBtXsaLNgCQc0u3vhdfwX1jWlcvlByDpo
Message-ID: <CANiq72=W7T6UW862TZ-c0+Ygr_VxOB_q-WBcL_yjeoJOo9egAg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.0 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 9:26=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 20.1.0 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Build-tested with a native defconfig+Rust x86_64 build -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
