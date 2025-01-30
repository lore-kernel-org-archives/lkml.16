Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B41B425D
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738239904; cv=none; b=DsGoxoIanYOkkgT4YTOeLZxRdjEnHqqJutRWEtZ2S9cqjWuY4c3F8gWKtDONdMwtRBtWNZOz5el52qplRlsybfIQq1TKgbvWvAgnxmJeMBAZAeIpfyU4BK3mLjSnnCLCpUJvaapxH3BRXv3aUkdFaxTqEjk0vp+lZEY2E6SCg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738239904; c=relaxed/simple;
	bh=5LO4eMC68YLPylVF2NHqcr3Ey1BFCeK60Od8wI86GU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtNRhP4VNhejrDNa8pM5FWuyFHVoGeE9X6c7bfy6BoENipyDCx+O/amPGi2gzqw3P6GDmzKD4U2159mzc/lipzj+PlQBSLJCM3b2uUGJTPnBPhey+6FHiPDyK6P+gfhlXpvFFnV3ss4k2uNll5Exhve6eHOUxrF1mmUjn4McUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMysNzZ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMysNzZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D098CC4CED2;
	Thu, 30 Jan 2025 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738239904;
	bh=5LO4eMC68YLPylVF2NHqcr3Ey1BFCeK60Od8wI86GU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMysNzZ0m2V+PwBpaq97VaKxLQdVaCj2dAT8cwo1NrBTOSeAif/atl8Yw1YdGWCti
	 hhdP0JVwwoX9yZasbe59E4OvbPnHJksAQTfl/SuTLgLEbGSo7gXoR4EFxb1yx89CHS
	 mdwCUxfCjOGqtggEo+P0DTOwujUPdJeSVExGB7nw/GCiJT/ZJdfwqFTlpG2IYBwY+O
	 LKGuhRuESH3L5+YoD4dQXmTGgCYpTh2wfvZMbbsi3BgeRPPCzc5SmPq+Ai90iVZGLj
	 d4fexRK/o8h0YNQrpXIOUZ7PQDuPWOUNyELh5eg2XOD6gU1ZZgMskbIIcxy7tbVbmx
	 XGm5PpP33nMCg==
Date: Thu, 30 Jan 2025 02:25:02 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] sched_ext: Add an event, BYPASS_DISPATCH
Message-ID: <Z5tvnjpNeuFZzdwy@slm.duckdns.org>
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-9-changwoo@igalia.com>
 <Z5fm-ylLemMG-YiQ@slm.duckdns.org>
 <1b3cd342-ddcb-4d53-a0bc-07e4ecc2973b@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b3cd342-ddcb-4d53-a0bc-07e4ecc2973b@igalia.com>

On Thu, Jan 30, 2025 at 03:26:16PM +0900, Changwoo Min wrote:
> Hello,
> 
> On 25. 1. 28. 05:05, Tejun Heo wrote:
> > On Sun, Jan 26, 2025 at 07:16:11PM +0900, Changwoo Min wrote:
> > ...
> > >   has_tasks:
> > > +	if (scx_rq_bypassing(rq))
> > > +		__scx_add_event(BYPASS_DISPATCH, 1);
> > 
> > Can we do this at the sources even if that's a bit more code?
> 
> Sure. I will remove scx_add_event() and __scx_add_event() and will use
> this_cpu_add() and __this_cpu_add() directly.

Oh, that's not what I meant. I meant that in the code quoted above, the stat
is being incremented in a spot where most code paths converge and then the
specific stat condition is being tested again. It'd be better to update the
stat where the condition is detected initially.

Thanks.

-- 
tejun
