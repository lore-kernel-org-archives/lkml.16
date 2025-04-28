Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA121DF73C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872843; cv=none; b=oxZLSizQmX/3lO9hCCF2jiTHmyXAfrxg+27geWbePpY1ZFmieduf2m0kbLGZpPUfc6DoYHFho2DnIpOt023ajI6tCQINe9mMC18xDzqQbaGVbk6+/DRLgCfGq1F0dhm40fLVhoz+nQnNG3E5IuJtBOTADCwBn/+ymfDafk1oBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872843; c=relaxed/simple;
	bh=16e/YgzDjtZcsT5VW1ZKH/kbfB8Ev/B1D3q5d83zWeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImIakJRC4K7hXjdqKONpA8NzzWttEB6X96MeEpcgsaMxutS+d8zmoHPAJ7TLz1y7SBT7lsUTpLmE53wBi8UopXyjM9zgwoQi7d97al+qS0/V1nim/pov5kdbEyv+2BZU49nkAAOihqsjvE2a4Fq/J8CZneDzF9IZbJN/S/2M5p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WiHOSWT5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WiHOSWT5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso64604365ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745872839; x=1746477639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeoT+z9Ix7KNe6MZWCzuaIP+N6t2Dwvzh7IKztB6k4g=;
        b=WiHOSWT5LSdtP6CSAmE953PsM3N2NfOwIv/ZShiL6uOAbrCeddtWGe31Qg0hDG6E4Z
         Y1bwxCn6+1/uwGWhpgxGrL0VgDC8iWGbWgpvzh7i0ytJL962sVRVZbYKXcCizcEmfxsk
         SwGFkikyvQ1RcEGrGnm7k4qc24HYN2qf0kETg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872839; x=1746477639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeoT+z9Ix7KNe6MZWCzuaIP+N6t2Dwvzh7IKztB6k4g=;
        b=laZXCmSrHvZiAHQ1MqRrXgJjJIKdmUIyPEWl/IpJ8bryOiIXTpuGq8r5KGMQbW8TJw
         dScmjJdzTLN21txpZO0fRRlLDhWxQnFrJ1eJfXYR2ThRkTs3nXDsBB+8l1oFnU6FpVQ/
         67R9LwhX1NrOOWtMzYnLK13fhUTnp6gZ3HpkNlwmSZyPp3hOUxYBi8/Z+y5h3plzeym1
         WbuMI4nCLQnlbDcfKMLbxz1WQAERmMNhDuS58LEJjFzuLaOv42D2xmxCPk5ys2HQvcAP
         93DCutz1g34h5hAJBafNJtcF9xmEx1vNyz90m10LyNY3YaXyUbPWuOcoHKQvd3qYdXYp
         Oq8A==
X-Gm-Message-State: AOJu0YwrS+8svzrNjTpINwHb/p7yLe8VpqiV8qCV50nJKyCDwnYgWhS2
	cIily0PAh3nWVgFF2lUR4Z46JkWL9oO6Y3qSXK55D++y4ypqL0Pmo76Alu+ByfNfBREpO65kjX8
	=
X-Gm-Gg: ASbGncvsBNPuWTfTJObyWyGjaNMf/AYKKOs2vfv+d7kc2Wwq3kP2n3YcpAnbGUXJj8z
	IsDZgVYgM0BxXDn5oayuY86mXDmYyZQE2tJUhbRCQ1Kq/zHGqxwQ5IG4NhQ/WfZNnuTdrdDEQPH
	cPp0hdPbgsse5itfLgdpeH+zBgw/TrOF0XFuC7NSi27zhKBsaIzb3NlbB7xh3NtOgpXwWmpoFGK
	MgAshnZ2QBsjM0ElX5Pow64SdAQuaQUNyNTYNnWo05+JTs/PgRlrqLlYpSh0mlB0lrtxmi94N0R
	squydREuqQk/4sC2BgTvaTWh/yFVhbg+TRGKZVTWZPFRgsu+ZFDUidnYRtHIpI2Avpp1QZUKdCO
	Mgz+nTIsU
X-Google-Smtp-Source: AGHT+IHAtt6hxy4f1KiTAKLagYaGlgSxmoB/7q/68dkRAJ0CA0HoGV2usuSSpPuq67giYQeda6oiew==
X-Received: by 2002:a17:902:e545:b0:224:1943:c65 with SMTP id d9443c01a7336-22de7015c0bmr5835575ad.14.1745872838694;
        Mon, 28 Apr 2025 13:40:38 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50ea7b4sm87934515ad.152.2025.04.28.13.40.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:40:37 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so4615457a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:40:37 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cb:b0:2fe:861b:1ae3 with SMTP id
 98e67ed59e1d1-30a23dd605fmr290208a91.8.1745872836894; Mon, 28 Apr 2025
 13:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
In-Reply-To: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:40:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
X-Gm-Features: ATxdqUHkn2To6s-FCGeuNkrJ5YMdp_B_e090JmhY2DphP9BmoEpxztHghXs9YcE
Message-ID: <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 20, 2025 at 9:26=E2=80=AFPM Nick Bowler <nbowler@draconx.ca> wr=
ote:
>
> Hi,
>
> I recently noticed that on current kernels I lose video output from
> my Blackbird's AST2500 BMC after a reboot, which makes it difficult to
> boot the system again (the video output will come on only after Linux
> is booted again).
>
> With Linux 6.6 and earlier, there is no problem rebooting, everything
> is fine.
>
> I bisected to this commit:
>
>   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
>   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
>   Author: Douglas Anderson <dianders@chromium.org>
>   Date:   Fri Sep 1 16:39:53 2023 -0700
>
>       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc dr=
ivers
>
> This commit does not revert cleanly on 6.14, but I can easily undo
> the changes this commit made to the ast driver, and this is enough
> to restore working behaviour.
>
> Let me know if you need any more info!

Bleh. That's not good. If I had to guess there's some subtle bug /
missing timing constraint that's being triggered here. A few things to
try:

1. Add a several second delay after the call to
"drm_atomic_helper_shutdown()", like msleep(5000) or something like
that. That's kind of a shot in the dark, but it's fairly common for
panels to get upset if you turn them off and then turn them on again
too quickly. This would be my blind guess of what is happening.

2. Could you give more details about what panel you're using? Ideally
it'd be great if you could say which device tree you're using too.

3. Any chance you can gather the `dmesg` from a failing boot and
provide it somehow? Are there any errors in the logs from the failing
boot?

-Doug
