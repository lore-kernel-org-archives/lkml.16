Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DE19C556
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753644; cv=none; b=Ts0VA1s77wd7W1KwYXu+oFzzNY++ImLR96UIRuvbFxsYwHaXMDdmHdTcj0554g1hOLBJw63uEAcYVyNR69EMr2aEeSPURAjDMgpbEgEKWbFCqzbvtGo381dj6ENYJsoze8AXFLspDs7XLmQt2G4ZFE4RV/Uf8UuCxM7Y3RHfMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753644; c=relaxed/simple;
	bh=8LjujCLqR1bI3+Rfk6d7z0/M3G6LHtXS0m8WvGdnB2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgHzUG4WPb+G4XL1/YVeGmCFOBEm0HO2ljWfoxLznDYYSqE4mLQhFjjttWaiaBIktIDcNtctH5TkXr4CdldAgBcziv9TF7DFX7LqSr+NOg4w9QMzRn4BgZEdl1Jx8KWh9HAy2x9AKJEZSc72c/9eZh0G0ytn8FYnK25B3UUaJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h/X5ubOm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h/X5ubOm"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1657503a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749753642; x=1750358442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VY6xmBvjs8hwfOT8lOuyXsY3GBu8n7PrfHQqMkhuTlI=;
        b=h/X5ubOmOw28IlOeJfwF31ni/fhXrss4fSdsn6bnurSw5jZQp4Vq/jd6QkWGhP+Q2p
         O4tV9BnBay3OZx9wMMZ9cFvBzhL7fcVjidYqC34rhvt9W3EzX5fCebC2+8PCdeE7Dexv
         LifQNCv1ZF7ACpMvSd39X7HHTNCXzvdsDK04E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749753642; x=1750358442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY6xmBvjs8hwfOT8lOuyXsY3GBu8n7PrfHQqMkhuTlI=;
        b=nUs787faa6FSExoJBczkPFOYTdSN+dAeWb0LH35HrHSjljSs8DdM/LS9Ptad4YrcLY
         kthTNiwryU9nziZAVs8yJLVm2EzxSawzW3JTjcTeGEonSlQyBszQRxeb7GCAP65HmUEJ
         /s80faDKyV5GvP7TQ9O5ahFVA7v5Vy1/GijW1WpOZk5KcsdZdbXs8k53auwYd8FxqN5Z
         xWs5dDYHhMBZHiT/7Bvl1+qUt7C4Jye0v0AMFFqnwXifoSlYdtHkkN7hR/swjEAKbWhN
         hdwkMfEGXhTmYHinFQsYWeeawlCy9c8/AOWC9xaNylbQRpnqk1MMoKHbhoqpU4YQ0Yep
         E8zA==
X-Forwarded-Encrypted: i=1; AJvYcCWGrQJDTEMEHZmLntabYqkoks3dMEMLXBt9I63BasXKh5XAB+VvgcXRBekZyb5dlTYIAnZcM0h9xKLSm6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF3zhLpB5iXZwYQGLSJwQgs2TVMvRvbMjmk29PUHmaouSbyfdn
	g9NjOigrF7NyG5gzUkrjzesIkR2sPpHL2dyPcchz0fbXGGeiDpecdIA3qpCf6J8b/A==
X-Gm-Gg: ASbGncvvWP4qFVgRBcrfkOlD+RbKAipZ5xJPGSUCdF4U5egL2mw5G0N+IJqfgXAk4bE
	Q5TxXTFpv0uTZK8vHKm9arr0ZgVXf8gwTviTVInzA5jiIIydQuOg1lNnaKpSKggHHMU7RmMR0xA
	QYwkZtrixxFNG0Jgvic6YqUINQO0nNXUzOuPvOGyn717SckTQnufq2m3OVQ0zwwoEu5YDbrs37R
	n93uKep19Xhj+cmmFEEQhQc7WRp3AUbK7TKytvtx5vFNzUFQOCJKqqaXww+3gJdZwwpMmgaIc1b
	v7He+w1JqVTeMl4FmkDtHZwNd7x2Tt9u91TIyEbHoPnDUaj+F5fwtkO8Gf1jCcUbHhmi7EvKJyT
	Ynznz3q9S3qxmOc88yW0zyVcf
X-Google-Smtp-Source: AGHT+IEBjTdK4ITcEKnnt6GhLna4DF8LasT3/vOJgPPwIxE2SjmZKkK0y4QQrLqfvLj7++NcxmpRDw==
X-Received: by 2002:a17:90b:54cd:b0:312:db8f:9a09 with SMTP id 98e67ed59e1d1-313d9c34e45mr413435a91.14.1749753641776;
        Thu, 12 Jun 2025 11:40:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e790:5956:5b47:d0a7])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19b84e5sm2062886a91.2.2025.06.12.11.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 11:40:41 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:40:38 -0700
From: Brian Norris <briannorris@chromium.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aEsfJj35W7HQlTOH@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
 <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>
 <aEnUHv8xMTDYgps9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEnUHv8xMTDYgps9@google.com>

On Wed, Jun 11, 2025 at 12:08:16PM -0700, Brian Norris wrote:
> On Wed, Jun 11, 2025 at 08:56:40AM +0200, Aleksandrs Vinarskis wrote:
> > Yes. Dell XPS 9345 is arch/arm64/boot/dts/qcom/x1e80100.dtsi based,
> > and Asus Zenbook A14 is arch/arm64/boot/dts/qcom/x1p42100.dtsi based,
> > which is a derivative but has a slightly different PCIe setup. So far
> > both laptops would behave in the same ways.
> 
> Thanks. So that's what I suspected, a DWC/pcie-qcom PCIe driver, and
> seemingly standard NVMe on top. pcie-qcom doesn't seem to do anything
> weird regarding MSIs or affinity, [...]

For the record, I was reminded that DWC/pcie-qcom does not, in fact,
support irq_chip::irq_set_affinity(), which could perhaps be a unique
factor in his systems' behavior.

> > > Thanks for the testing. I've found a few problems with my proposed
> > > patch, and I've come up with the appended alternative that solves them.
> > > Could you give it a try?
> > 
> > Just tested, and it appears to solve it, though I see some errors on
> > wakeup that I don't remember seeing before. I will test-drive this
> > setup for a day to provide better feedback and confirm if it is
> > related to the fixup or not.
> 
> That's promising, I think. Do feel free to forward info if you think
> there's still a problem though. I'll await your feedback before spinning
> patches.

Alex sent some private feedback, and from what I could tell, there was
nothing concerning. The "new" errors are simply about a wakeup attempt
interrupting the CPU offlining process, which I believe is normal
behavior depending on the wakeup actvity on his laptop (e.g., input
devices).

I've submitted my fixes here:

Subject: [PATCH 6.16 0/2] genirq: Fixes for CPU hotplug / disable-depth regressions
https://lore.kernel.org/lkml/20250612183303.3433234-1-briannorris@chromium.org/

Brian
