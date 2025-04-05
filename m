Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA0625;
	Sat,  5 Apr 2025 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812894; cv=none; b=XQXyz9Q2NxSEO994IjECWlnkfKwdZwFLRFWSUiJwBQFHDsiGQyWOAivR5pl4DnUsgPtVqRIdNVeKYn3VjzyrQb/oDh7v1uqp/ZueMfFHV+1Ctm/TfhlEx3cx4VNlLYLFKLDdsA6/uj1wZZSPQIEVUTg2KCqU1eH4vJvxaSKqNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812894; c=relaxed/simple;
	bh=52hIKm/EcVzVGzamHJCHAV9kvjOFBdWT2MrAaflINn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd0UCW3iGTP6HP0N8VmgBMJgfxm5JZCKVAKTs7+70bsg9CwUJiwE+w//PA0JKomoGN0iMrBolJYSzGyULCAD85k+JgGrb2W9Rn17H7U3we81vqLnY8ctWtNkW2dktCev40ZR/VE71zLgxeka4s/lb6IrjiaISixP0HlhIqgaAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mx/9IGX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mx/9IGX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32630C4CEDD;
	Sat,  5 Apr 2025 00:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743812893;
	bh=52hIKm/EcVzVGzamHJCHAV9kvjOFBdWT2MrAaflINn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mx/9IGX0EyzAZ8DYWIGiIPqsEb3ZehO/Qex5lKxqbdyjPov96p61yngnyEByTZj4l
	 GCKmmlzVwjTpJmjJX3UGbOEAwab1rKTdlQ42D3Be6IZQ6+HVErKO3dufk/2mQgvxvm
	 p4nllFE2uHZWkKibUvmY9b/m2z1NAQuqJcGRQ1dsCE76FSmY+wHPUYKPYzFgAkjKgh
	 zrskcVjTd3PtkCNNCaHQ6/bzXin0OqEHo50xi92jwVT7h1620UsurYsZoCG1YAKX5H
	 hVR8ZShg7+dv4VqagRZC5bzbR/liHOHab6ysOMKv3XFeu1rv0+AzelpwlgJBzt2W0D
	 u2U5pk9fETtAQ==
Date: Fri, 4 Apr 2025 17:27:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
Message-ID: <20250405002757.GA836042@ax162>
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162>
 <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>

On Thu, Apr 03, 2025 at 04:17:44PM +0530, Naresh Kamboju wrote:
> I’ve re-run the tests to validate the boot behavior on the Rock Pi 4 board
> with different Clang nightly versions and the latest mainline kernel.
> 
> The combination using clang-nightly:20250319 successfully booted the
> Rock Pi 4 board.
> However, the combination using clang-nightly:20250401 failed to boot
> the same board.
> 
> "name": "clang",
> "version": "21.0.0",
> "version_full": "Debian clang version 21.0.0
> (++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)"
> 
> Reference:
>  - https://lkft.validation.linaro.org/scheduler/job/8196258
>  - https://lkft.validation.linaro.org/scheduler/job/8196275

Thank you for verifying. Do you test with clang-20 and if so, are tests
at that same revision passing? I want to make sure this is an LLVM
regression before trying to get into figuring out how to bisect with
your setup. Another way to do that is to see if clang-nightly boots are
failing on the stable branches, which would point to Linux not being at
fault.

Cheers,
Nathan
