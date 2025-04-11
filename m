Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FB1EE7D3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406707; cv=none; b=d8e/lsHrm4R2WhLjQxmclnalRi02og64+z3pC97ol+QzbWZRQc8kGgXROehpFK+GKBEop7wX6/vmt9B1TLMrlzsIGiKBD7yISbkbUiYDllvLgQ7S5nLgFXbvsVZm4aZ3NakzmcP9SNt1tZ4eViy8zJGB7NYJp4il9P0POl90j2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406707; c=relaxed/simple;
	bh=8gu0sYMn4R7ARHizs8VdzCkZueYec/6SpqKatFDp5gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRzHCYVc6hwQCQ4ZKpMXZar5+Erwfp7MnZ7QjDFPkGFjBzcvDXolQx1+e5YzaJUNm9kadOAw3ZAqmdvyIviW7t8gzIURLa2c51VfmIrrmCsWdHbdPzvMMT0BS5fn5mMb2ArqwCu/4xPS2skN1cOW5K+V7DKntAmPkQW04+HiWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2tDwgpR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2tDwgpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C066C4CEE2;
	Fri, 11 Apr 2025 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744406705;
	bh=8gu0sYMn4R7ARHizs8VdzCkZueYec/6SpqKatFDp5gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2tDwgpRF7Q/GoAcoSLRwzfsW9M4iiigdzYf9IpdMTFgvV+7MgJ6yCgfvE61i2iyP
	 NMmnB5tFKll4BV3bKyJbKtZ85vc26eVw9xXUcyyfkCf8KHUUPI2ssYeg5TG6nNcqo9
	 ADoaC5teX4L7BxhFktQSsiMWN4TXYbnVpXTVy/bhSb9x6AA6r4QXFtmjqN2F/qIuH0
	 j49chTZQZqcsic7nYnpixj4iNA7gZwbkI/e6qGGThFqVnmRmbYRgcK7qMZjaSvyfC+
	 U38YlZbdz5wtNtyNLTfGMilNgcPeLWWtTBd+KxD7xF+Sr2bhPQDSV6EqqgwzyR1Yi4
	 0CuydguTC/Q5g==
Date: Fri, 11 Apr 2025 23:25:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: exporting a device type
Message-ID: <Z_mIrjA5k2CABoG_@pollux.localdomain>
References: <CAHp75VdssCM74oji59QjPMEzrVuBzPOAMadA=Ds_52hOZGJ2mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdssCM74oji59QjPMEzrVuBzPOAMadA=Ds_52hOZGJ2mw@mail.gmail.com>

On Fri, Apr 11, 2025 at 10:39:38PM +0300, Andy Shevchenko wrote:
> I have an issue with this change
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?h=for-driver-core&id=e86cc69186051d7312711565803de586efd9b2cf
> 
> (I think you haven't yet sent it for review, so this is just
> preliminary look at)
> 
> The idea of exporting bus type will open a non-reversible box of
> changes when people will start abusing it. Instead just provide an API
> dev_is_auxiliary() as it's done in other subsystems (yes, I know that
> some of them are still exporting the type, but it's most likely due to
> historical reasons of not thinking through it at that time).

Yeah, most busses export it and provide a dev_is_*() macro, which we can't use
in Rust. That's why for PCI and platform I started using the bus type directly,
see e.g. [1].

However, I already considered changing it up by just creating Rust helper
functions for the dev_is_*() macros and provide a dev_is_auxiliary() API
instead. This also simplifies things a bit and gets me rid of the
Device::bus_type_raw() helper.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?h=for-driver-core&id=d72c42c1da4149fec28e3b180654bf5fd88c2094
