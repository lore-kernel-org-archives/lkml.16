Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4210E0
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517746; cv=none; b=si/Y7O4oereOckI0o1DON7lsHuADnrSi4AxXTJVyhc4/ufuwu0eEceX84evvEZypaPbT/DO2+G64mWt+18ybhdZQr5s4sz/shqWmFMlNxRZBm/9u/Y7Tv1XP3pzdQhtoGjwwRTw1WYwSg13JMPLI28YOn/1mON2xxlP8wfGfXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517746; c=relaxed/simple;
	bh=aGEBge9Qb74BGSH62LUm33mHmrS2Xd9OtnEo/3jwaQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0kXwc7/u12+2Nem1k+CFqcqCIEIw38xKGZl4m59sV0OUsHaMEVOFaZ79IaKzTentmCu1fYTLKYEo+SSLEPFQV+tPhSDFq1z1cpM3Q+tPvfnMeoN+K+YoPwBTJZ6AewqRa+t+eUlGUD8zNZcFe0VOilrS9WNYex6eq+nQGKKgQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZZ+g00q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZZ+g00q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C48CC4CED1;
	Sun,  2 Feb 2025 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738517745;
	bh=aGEBge9Qb74BGSH62LUm33mHmrS2Xd9OtnEo/3jwaQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZZ+g00q8nv+mPkUeTNXl0aeWcjN6jzMYv3G56rMGE9Gv/EmdmG1p0wWEFb+YN85C
	 bhyARDDCNSTl8+cflkBlSVeEYdIkMcYIibBAurb2q9lNpUmg+J70y0lPo6Yoi1ycsy
	 qlF/6DPhl5aQBmPGOpA1JJLy+J816CkZ3GfsCR6HU9u2xhO6Wjwf+td0j1OruDMXk6
	 qn9x88uA1WwBDMWocrMiYf6C99oNwiVfj6A/CnzT6D9y0h/tvojRoM030JABhnmMA5
	 +j1PVV/x/qmdgBNmvGLuNoZMii8cyy4czAQLLKdLCBJquRvztR6L2MC4WSeC+D0Gu7
	 ABsiSoOsZRYmQ==
Date: Sun, 2 Feb 2025 07:35:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] sched_ext: Add an event, SCX_EV_BYPASS_DURATION
Message-ID: <Z5-s8EdYd9Ad70EN@slm.duckdns.org>
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-9-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131070938.95551-9-changwoo@igalia.com>

On Fri, Jan 31, 2025 at 04:09:35PM +0900, Changwoo Min wrote:
> +/*
> + * The last time the bypass mode started.
> + * This is used to measure SCX_EV_BYPASS_DURATION.
> + */
> +static unsigned long scx_bypass_timestamp;

Move it inside the function?

Thanks.

-- 
tejun
