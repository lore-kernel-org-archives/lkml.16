Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30433FD;
	Wed,  7 May 2025 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614003; cv=none; b=G11xi8e32P4EXpj3Mq+fdJPAXrr3mVHIDlf+euKC+CHqv+1ygPUQfVvjPz37Na99l8fajGdauftmiDJfO9/g+IiopfM2+XSTqLfU1h2wiSj5eUlSvJSL4QscqCYaDx0dyaNjO58yAInugG0pRmyeGQuFqAyH3Mxaljg+CxBuheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614003; c=relaxed/simple;
	bh=Kd63JHwlcqbeAq8PPhAmyUI0pHvj4eFZA8kKk6zJmU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ot3/1BwunggPnGYW4zNw11hDIh76FXz0MAY/LZ/8zfqZ4MWOfvpIhMIzIqnHNOhaNoMatqf+pp89waysszEl8M7Nf9vDS06Pzxd4YXyx3wwnb1DaC4zqEQKasnvBu6sMPYL2YeXgPtLWH/3WUKUwJJv6A1LU2+3UgREni8pJ7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2q1fAES; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2q1fAES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87900C4CEE7;
	Wed,  7 May 2025 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746614002;
	bh=Kd63JHwlcqbeAq8PPhAmyUI0pHvj4eFZA8kKk6zJmU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2q1fAESkR/g98tGbovPO0uUKdD9GFO07YmlW7nY1RM4vIKv+2ORiosQQ9Y9LP0s8
	 m9VsmdpmZ8hpc2KnsSwh2mJknzBFuExqSSYFXlY8g5sP07mM9w7yswt7JU0d+f7aqo
	 XX2ZhYBE9HNmSwGNa1cOqZtRp4tMMNo15i4l9hy/91wHYJKzTo+shfGATpr7K86nVi
	 /j8DqEVFlUb/53lncAqeTYF2N9QqHmYw6f+yfhNeu6BhBJvl03aJGen/m/l552q3Of
	 F4l8acNKn5VHSfuRSfbFgRK66lFghKIrR5m55wI+oJMBfNLRW69aZuUhXggx6yEN6s
	 SpxNgHzFaHhIA==
Date: Wed, 7 May 2025 11:33:17 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for
 the v6.16 merge window
Message-ID: <20250507103317.GH3865826@google.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250502074743.GC3865826@google.com>
 <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>

On Sat, 03 May 2025, Mark Brown wrote:

> On Fri, May 02, 2025 at 08:47:43AM +0100, Lee Jones wrote:
> > Enjoy!
> > 
> > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> > 
> >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16
> 
> You need to specify a separate url and pushurl for the git remote so git
> generates PRs with a public URL people can use.

Something strange is going on.  My PR command is as follows:

git request-pull                                             /
  v6.15-rc1                                                  /
  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git  /
  ib-mfd-regulator-v6.16

And the output still defaults to the SSH URL.

Debugging now.

-- 
Lee Jones [李琼斯]
