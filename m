Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06831202998;
	Fri,  2 May 2025 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746221039; cv=none; b=g7kTQknofa6cihSsF4g7SZ7otfFYnPl5xP2O+7PMF4uiUkobRFLdhyd4lxtnEJgVThNCkvRp46s9kWXmLH9pVUEtJK5IMsqDFHdCaOa/1x1dZhW1Ww22jVKY5MHh1nHXv38RSvQfEdBPGklelBqjRXKsH9BE+TgClT8yeTnB/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746221039; c=relaxed/simple;
	bh=Rl5Ew6f7CIYjW+JZ1pQ6GPbP75ryntp1aP9dj42EvdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwWbhh66Y7maASTmEz6sdBha4/eBCdnzE4xSzttmjWfIFEDitLf3UOpEMh1hX1eikLC5tBfj1pg9jU2GBlQX0e+y4Z9jORie8KHKB8guQlarYHuw9F+w3+wEDAyxppMDH1Mzovc0znUqe20WfOc8hkm0NA70yGVZstKqCrVef1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyqxX2ya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyqxX2ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3308EC4CEE4;
	Fri,  2 May 2025 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746221038;
	bh=Rl5Ew6f7CIYjW+JZ1pQ6GPbP75ryntp1aP9dj42EvdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyqxX2yaP32j3fozZwG2OfZHhBveaus+vL+qwZ1B6P3oOXsJTmRybZZMHur/KCh8p
	 pbI79t+8Zz09z/BML1dhVTMwJbRvI1Nfx9TMd1fAo+RnDQCl5R8BOFiUABcC856c7y
	 obqS6wWA5HVSJHOfXj/V29KNQvQL6/cnlHxJoI0/XRlAA6MfDq8UtRGJPbJ4v3Cdi7
	 1x6w/vhl2b5VRXdWn3hX5Hsc5LNqGf8P8Xc35BackW+xPjgVBpEub/Zhbzc+kRMp1A
	 9jwUHXsMk6n52XWhDBRf7c6hgHse3H01HGFjohCjREuvpEKE+dwRaDINCbu05zVxyI
	 Qg0+Xp5FcL6kA==
Date: Fri, 2 May 2025 14:23:56 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Song Liu <song@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	kdevops@lists.linux.dev, Jim Zemlin <jzemlin@linux-foundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>,
	Greg Marsden <greg.marsden@oracle.com>, Tso Ted <tytso@mit.edu>,
	Gustavo Padovan <gus@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: The future of kernel-patches-daemon - folding under LF?
Message-ID: <aBU37LAD6Fvz4olv@bombadil.infradead.org>
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
 <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>
 <aAEV2U2A1sXdVffx@bombadil.infradead.org>
 <CAPhsuW5avVeJMZpCJut8EDOxsTOafa3pf_Ncn6To5AfvKzHHEA@mail.gmail.com>
 <CAPhsuW4huT=MxbnR8FrsEoB9His+NoW+TBLHBLs=k-hPiYwA2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW4huT=MxbnR8FrsEoB9His+NoW+TBLHBLs=k-hPiYwA2A@mail.gmail.com>

On Fri, May 02, 2025 at 01:41:32PM -0700, Song Liu wrote:
> Hi Luis and folks,
> 
> As we discussed, we moved KPD repository to an account that does not
> require CLA:
> 
> https://github.com/kernel-patches/kernel-patches-daemon
> 
> Please use this repository as the base of development.

Perfect, thanks!

  Luis
