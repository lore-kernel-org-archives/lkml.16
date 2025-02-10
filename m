Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74A145A18
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160815; cv=none; b=ZU6fI3Lex0R4JMkocfAceR6inrD4CaH1GDzv7ggvBxt0T3Ly0SnFcaZeJuIaVZR9P7AA94XX+rvTXlWf0ZMwoPUo+mxEqHQKdP5C6WDQYur5uvLqEGVuf1fnIbPub7s1ziqJHS4alJuhFDnK8d3ZmK3hZKA+n/dhpmHXxZ5prjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160815; c=relaxed/simple;
	bh=KR8YgCC5AAtujTeVmNhiTBwKPajUFCHJ1ApoimQaqfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbeYLL47Mxu2bf2xcyoQWGasxtSNz7XKb47v2TfTien2G50+IiUnZDrYjrn+Z2LPEofQoaVzcuN3L19kzQ/0dTTv1xR+TrJ5jMc8Jpx3iRGddLA9Bdan46QZKdUDrAkJLYvH7jqQMw+u34wmJ7T0USpdttux36b/BHt9NXPuvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neYWtjbN; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neYWtjbN"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa8ada664fso117538a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 20:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739160813; x=1739765613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmqkAzAtPgRqjxToMePIv1EPR+eR1R4IzBzVzsKXGwo=;
        b=neYWtjbNTGPVCBAm0ZH/kk1pALMzuTTXOc7X7gTGFkgRv+9TPJy5lxnLsOaku3c554
         pc2AaSbz6VpMVgS78hnyXzmEvpvHcdDSmZRWdaGWWvrJbPGqvviyzSYbszlB/ovV6fe6
         AAx8kh7i1Ed+2c2GrcXyS1W4wNB5YbbafkHxPbWvN6HVRcTgcpsjbMbPSVzMUJUZPhON
         pHeHEiwURN/zS8sj5dlE0QeYkJeP11ZatRK6nRZ+lfETa2JDnzyM6TvXZI0jE3/H8TrM
         FXyssQB3/bM+ybUfiBLcR9LJjkiVldrC+73QdgO8akX1J/VlMi1lydg1LRFq2XyizXIU
         fLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160813; x=1739765613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmqkAzAtPgRqjxToMePIv1EPR+eR1R4IzBzVzsKXGwo=;
        b=xFiKVp53c+hL6U2SZYUlUMT92sKKStpa6dgooJ82yuAh1BOsrT3aS6IRq1D+eQvbIj
         zMhgpAv/V9ejksJt+sdfsUhJeo8tOTzkFsCRSTzqFkVPSRSidUEUkS214o4kuqukTsL2
         udHpuiK4mFN8m+kscCYaKsxHg6Bg1vd5oKgjYghW/HwpHbMtpExgoDb6Ejtj7lBKslho
         1Xz5ZdQthEfH8mWkSXRIzHG4wXh22pUu0pQVAVROf92OapGoPvjn++abi402jcc/dYI2
         oC1S6+Sajp4SYkKaMxdEPOr9fRrMHLZRsDeOYHDVTrmb0KBCruG7jITBREKUjMXhQV2q
         p8nQ==
X-Gm-Message-State: AOJu0YwWe/oJiBx+yfgyiS9iaYVR3drfWM8UaixPW8cXDbuh9RzUWg2C
	Lnoo4k0J7E+iLWLUKZU8AwVcSt8RciFSkO1KNjC3U68oSx6VFB2d
X-Gm-Gg: ASbGncs1BPY38j2R+MiTdS+rSrzZ/DPbkeSqhLZ47m5NFDNtbvvkSJmmgx7tOClfOD8
	11DH2PzWVMjAgyAJtZQ7icPzHRCxc1KrFiloBS3JuKzryWXBlTfTy17RT2Rv5xOuJwLrjk47QlE
	yEL4/k3HCwWS9jXvpUjaEs3BcatNUzyewi028Sxnnkeg9G1ZBhvppKIFWSqY60Kc39lzJxnxb2E
	aeNujsca4kwXhrYPJW022a7szcnifUTXuAi6BRRMiJV0Jg3xF9JwuQ7GEvu2iNNMt7svmk8fIYb
	HHTZnz+oQf1fE0Y6jwZbYfkZ9pC5
X-Google-Smtp-Source: AGHT+IEebp22PC2iLR1HXA0SRk7B+yjq2j1utmcKFnUCBJFDUj8sw6Lh7eejk1PBRsjTHZc+5AY4hw==
X-Received: by 2002:a17:90b:5543:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-2fa22b8d0a8mr21386897a91.0.1739160813410;
        Sun, 09 Feb 2025 20:13:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d7d4asm68004515ad.254.2025.02.09.20.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:13:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Feb 2025 20:13:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Mohan Kumar D <mkumard@nvidia.com>, vkoul@kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com
Subject: Re: Linux 6.14-rc2
Message-ID: <038652fa-ddac-4c6f-9dfa-50d981199177@roeck-us.net>
References: <CAHk-=wiGR6aB2oE7VsDkpnSbHaUnxVqtMvcEB0JzdvS-YmT_Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiGR6aB2oE7VsDkpnSbHaUnxVqtMvcEB0JzdvS-YmT_Lg@mail.gmail.com>

On Sun, Feb 09, 2025 at 01:00:27PM -0800, Linus Torvalds wrote:
> It's Sunday afternoon, and I'm releasing the usual regularly scheduled
> release candidate while the rest of the US is getting ready for the
> biggest day in TV commercials interrupted by some kind of lawn bowling
> tournament.
> 
> With 6.14 being a fairly small release, rc2 follows suit. It's not the
> smallest rc2 we've had in the 6.x series, but it's definitely on the
> smaller side.
> 
> Nothing particularly odd stands out. The diffstat is a bit unusual
> just because one of the bigger areas of change was some s390 kvm
> cleanups. So the fact that s390 accounts for about a third of the
> overall patch is certainly not very common, but it's just a result of
> some code movement and the fact that most of the rest of rc2 really is
> just very small fixes.
> 
> We have a similar pattern (on a much smaller scale) wrt selftests: the
> tests show up in the diffstat, but it's due to trivial small fixes
> that then triggered a whole new self test to be written.
> 
> Anyway, it all looks fine, please give it a try,
> 

Build results:
	total: 161 pass: 159 fail: 2
Failed builds:
	i386:allyesconfig
	i386:allmodconfig
Qemu test results:
	total: 544 pass: 544 fail: 0
Unit test results:
	pass: 487271 fail: 0

The i386 build failure is still

x86_64-linux-ld: drivers/dma/tegra210-adma.o: in function `tegra_adma_probe':
tegra210-adma.c:(.text+0x1322): undefined reference to `__udivdi3'

The failure is triggered by commit 68811c928f88 ("dmaengine: tegra210-adma:
Support channel page"). A fix has been submitted a while ago. See [1].
It hasn't been applied to linux-next. I don't know the status.
Copying those involved for feedback.

Guenter

---
[1] https://lore.kernel.org/lkml/20250201171441.407b91cb@kernel.org/T/
