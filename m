Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49524F5A0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208183; cv=none; b=SZA2h4FvdYJMY7GIsC1jM9WU9SZ+NhWjfeUDqRp+XD5UZHoXxspmV91wVY5xGghHfzATJoSQ4pda4aiL5iNTb24LwZRkZDoIx2eh9dwXKMRAK1vDSI4Qn6676uu3Z3Ie6WZ+9LwudPWD5RKjsWEE75t/y0TyZ8R45N5iiKfPsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208183; c=relaxed/simple;
	bh=aHH2LZ7ZTbROWuIg/NNXS8w/JrAC/2Qk3wbWwJwCcx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY6ScX7Fc3IwGfBWkiTjVxNZpFfOgYw8zu7YY51o3Hx/YP3Il5+jpFa1xh0eYWq+3H8uwOhpq8Ku+TW87XsiEhcDORRYWS5R765izW4JMBuNOwfPkcaC3oRUl6H9UtW5Qhmeux94zgwkkr3eNkjMgbgpK1I0GwAmkrcbBhXmqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ug4Mkflg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug4Mkflg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABA8C4CEE5;
	Mon, 10 Feb 2025 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208182;
	bh=aHH2LZ7ZTbROWuIg/NNXS8w/JrAC/2Qk3wbWwJwCcx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ug4MkflgYjQ106lmnRW/8gQ2jchB5FqJMay6dXlQiGHth4jHyvxpOjMiTO83MIT95
	 i7MBl9kHdypSfCrHRfC+taM8lw7izM9xZiktUR5etUZILGeeWa/GR9zlnL815cRLfL
	 3hFnAIzMemAuy8anmTM8AyukhJ9cAtuMmcRgfnQwo/OTpHqkWJOjhocwU9jMNSQ+wi
	 kHPLH2XcirnaEc+WaD7LAqd4YYn+YaZd7XvCnl0ruPx74gQ8eqRL4KsYQ3TWeRzSYN
	 oGwZUS1GKSphzXZWpgdj/2L9YXOxv2PBcOfn5500kO3m7dEHT4bOE3h9r0SUS1lwDA
	 9/FSG85IBs/FA==
Date: Mon, 10 Feb 2025 07:23:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/sched_ext: Update enum_defs.autogen.h
Message-ID: <Z6o19V5wjmLoKzDP@slm.duckdns.org>
References: <20250210145430.225867-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210145430.225867-1-changwoo@igalia.com>

On Mon, Feb 10, 2025 at 11:54:30PM +0900, Changwoo Min wrote:
> Add where the script is located to the comment lines of the header file.
> This helps anyone re-generate the header file if required.
> 
> Note that this is a sync from the PR [1] in the scx repo.
> 
>   [1] https://github.com/sched-ext/scx/pull/1322
> 
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Applied to sched_ext/for-6.15.

Thanks.

-- 
tejun
