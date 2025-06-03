Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18204288C89
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975375; cv=none; b=JBO2JFRyWy0h/aZhuL61AQX5Ba7/dxUfNsJeqYdo8SEELSMyDzj/D7d/WmDwZEYBFPurl34qkbbAGYZdU1IKRFz67EK4pEK0EUPFnz17hiNKMvRLuAKwkxvAwsOwHnb0BDVfVOZ7jHP8YrdFelXd9ehsxTxsgZ8/AD46o0wpTT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975375; c=relaxed/simple;
	bh=AliVsG6cCQpcJvxGOs9hnvl/gR1H41SFBbFEXBTvDDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKwi2K9f5lIIysqxIuk5ZCX1zZwo3MexhvFZnd5X1nQQ7CelSedsSEcK5fQiV6ig+BG32c9Q2f8IzcpFzZwnDPyjtws1jAHzDWiQ/bOyeiUvIHJWfuWiuly39noAUAxgTjEG7EiwfYvmPjYM60MhXXT4o4Bj0lPHAKKYblGx7PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PescudU6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PescudU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B949C4CEED;
	Tue,  3 Jun 2025 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748975374;
	bh=AliVsG6cCQpcJvxGOs9hnvl/gR1H41SFBbFEXBTvDDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PescudU64s20SdsPi3z1qT/E79ygVZb0Kgtpu5uoI69lY6zRFXDd2NBlhTIqJbChX
	 Kq/t40ytbFKuC9kjeivsPRTZ6sDuNiAfRQIdxuy7hHz3WAPFRVyLgXWodPV/0N/2Bq
	 5tIiJxLNUTUEzbxMpcybplt8+47/lXjlsO88seMKSht5R8gZp3KqB+DPzuOoo790iR
	 hAg6dfyi4fhf2Qa4htygQBkNl71lnwvAPmACj5OmUUQP/3saRA6iMGA/oFH8enc9jk
	 YdcFwVhJkyPzWY3OvDdgU4nZBjCGXnJC8AkRriqsO2iIoLGaWJiz27mmUQDdohdExo
	 hsGJpE4lXioXw==
Date: Tue, 3 Jun 2025 08:29:33 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: idle: Skip cross-node search with !CONFIG_NUMA
Message-ID: <aD8_DWecHHKlZyK_@slm.duckdns.org>
References: <20250603082201.173642-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603082201.173642-1-arighi@nvidia.com>

On Tue, Jun 03, 2025 at 10:22:01AM +0200, Andrea Righi wrote:
> In the idle CPU selection logic, attempting cross-node searches adds
> unnecessary complexity when CONFIG_NUMA is disabled.
> 
> Since there's no meaningful concept of nodes in this case, simplify the
> logic by restricting the idle CPU search to the current node only.
> 
> Fixes: 48849271e6611 ("sched_ext: idle: Per-node idle cpumasks")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16-fixes.

Thanks.

-- 
tejun
