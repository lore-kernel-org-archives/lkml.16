Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1BF1DDC22
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235468; cv=none; b=quBqh/0rOC4mTLiHVwT065kHyVQz65CkktS59T/gLVaRMZ5Ag1tM8W7/4w6PIFAPd0GocgwgqLA0wsYWIHJT3yC2oZCidke+XCxroQOxXOsZzdDo1QHr8RsNkjsGxA0RmABKaiQyW1FewuokLZoRQDsbR+gLi/H7T35V76yIyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235468; c=relaxed/simple;
	bh=De5huDuHNfBRJRK8hKACdHG/i0THQ2Gl/veZyb7GF7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ4ibCOfXjqVQekwe/DgNm3ikkTOqzHdjkqsFF5oi8TIUEVydKse2JzQ4r9BEzQaY0nPg2PMeyMTd7dZ5CnX1IU2DXeYVTSdsCy9VDYiWFxfs54n5jC5o9qck/x2gIQqMh5Yu0si6/gbZsawqiYfp0Bk2L/3m+HCv8innnt5Q1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Av/CCwZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Av/CCwZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC1FC4CEF4;
	Wed, 14 May 2025 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235468;
	bh=De5huDuHNfBRJRK8hKACdHG/i0THQ2Gl/veZyb7GF7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Av/CCwZR1U0ZHtd/50ng5e5sDxLRH2IbmgpF/8h214uxTRDKAP5e2kuFwgYMrknkj
	 UfXNWH5kXqKUUU+gUKE5BZmNSpLrP+8coFPO9Xb9tem7SyHlTKEBb/tT9lekkbaqub
	 4y/YHfuwVu8brwswhEB3UuMsHDDYHRLvNw67UDqgr7458fu3iIJFVBO/FmBhlPHCnO
	 TSYjAi+amKwAwc0qMeeTLyPQ6YcQXAOO6Xf2AF7LCuI9TvrmeBzij1S/ye0wF21H3O
	 2oGq+RjgqMoDz2sX+0mMG2/S90ZXXebx275S5HxM1V0VxW/Gwy078OemSLcS5Nn8iB
	 gFfY/O8i75Z3A==
Date: Wed, 14 May 2025 11:11:06 -0400
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4 sched_ext/for-6.16] sched_ext: Clean up scx_root
 usages
Message-ID: <aCSyikNoPIhG_ZtE@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>

On Wed, May 14, 2025 at 12:47:46AM -0400, Tejun Heo wrote:
> - Always cache scx_root into local variable sch before using.
> 
> - Don't use scx_root if cached sch is available.
> 
> - Wrap !sch test with unlikely().
> 
> - Pass @scx into scx_cgroup_init/exit().
> 
> No behavior changes intended.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>

Applied 1-4 to sched_ext/for-6.16.

Thanks.

-- 
tejun
