Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960B713212A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848971; cv=none; b=YDlJDt8aAgslNjQuTuq9T5g/frKuUJoSGeHR7eifU/VGGQMbAObAKDTBijfhZZhyIScFuLCo52ibVheYZEkzqTJ37GGzDLZ1NSOVg3qi0ELQBiZ//gIJMp4fZh8hPKfg1ATJ577m5RLXU/mN/sWbyRvgo+Qx3K1HPgvup5VZbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848971; c=relaxed/simple;
	bh=1iBApbOnMwD4s86bJ43Gj3P+hGilvbBdfmvfecQrp48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVmmjrZkb6GKcT/axz+zYUtOwKOfWHCQlOc3K7yn6uJ+93CjIhtAtgoIbbDJqQjGnUIRiGOLRnA0KTEfsRG6h2lbRHECCWvz1kojiuI5Di++DQ5aGsIyYfImtDUitjVoFpjCYtIEPOeH9gnmBgqE14gpxZ/1u3mSbAFglJwDwhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFs612pM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFs612pM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FBDC4CEE4;
	Wed, 21 May 2025 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848970;
	bh=1iBApbOnMwD4s86bJ43Gj3P+hGilvbBdfmvfecQrp48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFs612pMJBeSQnOxBf5rsb5e85ZNPhUoWvDapoXtEUzfI1iPC2rQwdyZMpoKqMZGj
	 HnTecojCZuADgPpdFYTPh9mF/g9DGaEN6PGBWQ2JAJS35KNPxkNMpA6UYrLiJLi96I
	 VMXcIxHbSgVbznk4NOtRuzF8cJyQgTs9bLIwXglrwBaHwFWdqTsR5fDf/OJgbKOHjD
	 R+9hGe0trS0474qx8DfzjBnKHr8aOC+xvAq6lj3/JKl/rAnzfCkq7Y3h8gOUSXtMAs
	 7ihuWWN+124GjPoXY0Jl1dsEbnwc82JwDix1JJoCwlSadkF6NAVe+NDZS/TJDQdEWk
	 JlN/agJ8GZkHg==
Date: Wed, 21 May 2025 07:36:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHSET sched_ext/for-6.16] sched_ext: Unify idle CPU
 selection kfuncs
Message-ID: <aC4PCPVj-84QGQ2g@slm.duckdns.org>
References: <20250521073548.140307-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521073548.140307-1-arighi@nvidia.com>

On Wed, May 21, 2025 at 09:34:05AM +0200, Andrea Righi wrote:
> As discussed in [1], consolidate scx_bpf_select_cpu_dfl() and
> scx_bpf_select_cpu_and(), allowing them to be called from the same contexts
> and update the corresponding kselftest to reflect this change.
> 
> [1] https://lore.kernel.org/all/aCl1nq0hUJ7IdtC5@gpd3/
> 
> Andrea Righi (2):
>       sched_ext: idle: Consolidate default idle CPU selection kfuncs
>       selftests/sched_ext: Update test enq_select_cpu_fails

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
