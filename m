Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A0235C1E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702310; cv=none; b=g+OtUzOy9gJpOEzLWvBd22Jjd1dKTiTuEN0I93jKv0FVo0TdY0VBljByiRoKY6TyZTzAwjqEJjMfprQpjctLGU3+5DdcfrANLW/a+K4lw5JKYL/i6wmMPfjKwLAn5GAnp9I8KPjslg0tv7sNxORcWdpfqe3GBC2XLPby9bjN0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702310; c=relaxed/simple;
	bh=mqOrhv4eHtbPCt66sOwSPU/q3/s7NTaQ/qzlbcmRDN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4J6oSCd3GMyXxmTwDcnXfIzPEGC/Yax2QfSU2JipyEFdyrRYyt4UWUcu5AQn/YeQ+AiFgz9w/2DvN11Fkn4IPOyZNh1cr6Xw2Fo10qPfCKvXL8vSts4SdKHyKuakl7ji6HbXpWPISLd/kWTw8QJ91mVzc7zGHmWAxYJTWPw704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES3c73xB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES3c73xB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64917C4CEED;
	Mon, 23 Jun 2025 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750702309;
	bh=mqOrhv4eHtbPCt66sOwSPU/q3/s7NTaQ/qzlbcmRDN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES3c73xBrGGGepYLPoo/hDGnr/AhfBIpmxRggag5yIw9WzNTJPqin/TTHrxzJ4Sfz
	 u+nBiwxHrLFjspn4iCZj02/+D5Juln7PfW17LfmoZYGpUDlZZRLry85TEnu5JJY7q8
	 7bg5z12FU7tSN9w6vPpJOfkCnZffLC59Mw6kwu6w7Icw+9g0UdMZIOKnRwsPbVsDht
	 xMCBlHK/ARVV6m9wQ46sXn4w7LwSxeqooiMc1P6wWfdKkuRTXd++mS4eZoV9Te3vIR
	 gdhZP0hgezf30sT+LDlyenBGIZkp+hQhBCSZSxUBW46BYnOr2coTEVsY5T63rCzUwk
	 AIbJgMmUrA2HA==
Date: Mon, 23 Jun 2025 08:11:48 -1000
From: Tejun Heo <tj@kernel.org>
To: Ke Ma <makebit1999@gmail.com>
Cc: linux-kernel@vger.kernel.org, arighi@nvidia.com, void@manifault.com,
	changwoo@igalia.com
Subject: Re: [PATCH] kernel/sched/ext.c: fix typo "occured" -> "occurred" in
 comments
Message-ID: <aFmY5PWo2kELBVha@slm.duckdns.org>
References: <20250619211128.2193-1-makebit1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619211128.2193-1-makebit1999@gmail.com>

On Thu, Jun 19, 2025 at 11:11:28PM +0200, Ke Ma wrote:
> Fixes a minor spelling mistake in two comment lines
> 
> Signed-off-by: Ke Ma <makebit1999@gmail.com>

Applied to sched_ext/for-6.17.

Thanks.

-- 
tejun
