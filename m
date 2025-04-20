Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B8205AD7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171054; cv=none; b=iTpE/hjPuZjh27aBf+siTirgRZeRadwZynxNKqb6wG2HOi/2pk5VfAShihm5CQls3dZaHJKnk5SANe0VJpFr2G1LXOLaZmhJqZ1lQI8onZH88WU8sYRtr/YjztGCi8VQSTZuG+vmH9l7vYEYp89kjawHYfechTTW03yKYKg7pJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171054; c=relaxed/simple;
	bh=ixGJ8YSj+QuJ5SIOqypeKBPV8p845DHwtpO2HT2ZREw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiqkFHS65ULjPcjvn9qQvM4UYwgxIQknYHezNnAQRE3HndYkiZhiM85DCLatjd5KE5amWTIIzXF7USpAvDxc3n9f/UTDkbB6cLUlqgDGIsqAsKwmVtIr/cFcUeAD0OCsIwlU1SXzEI8wlZeAUpSw2ebjDUlLDmcWujfDBQL8pn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfThN9cg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfThN9cg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7423C4CEE2;
	Sun, 20 Apr 2025 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745171053;
	bh=ixGJ8YSj+QuJ5SIOqypeKBPV8p845DHwtpO2HT2ZREw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfThN9cgfR5uOOk0klmvHWSYYcyy6nIz1d6bP5Kv13Zl0OwOOmWZxDSliVH7UzZYY
	 g6RWMHwurUfnjq+Q0S9rOwtcm/rQZCnYIOMM36jo1GfpLuVe58X+bZNUiBhvnues17
	 reLvYJIODd0liVlU+xwy0DQkVG8HnmtJxz4P9yKHFNr4w9tLYWHYdzO2cAl6/siESs
	 4o5+L8P5GUFoF9KsZs0U8Bxz37W8RHmvBHqdDl5M49cl9Co8Em+ULz+ExpTkK6QFNi
	 YF56ZShsNTygeCJrTUBM0SlGYd6teyu0rCDiL6/g1ouHhFLjOo14CmMW96+IYss25d
	 IGBCE599GbMsg==
Date: Sun, 20 Apr 2025 07:44:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAUybKUc3LyKZ3F4@slm.duckdns.org>
References: <20250419123536.154469-1-arighi@nvidia.com>
 <20250419123536.154469-2-arighi@nvidia.com>
 <aAPemAFUsJaF_C2X@slm.duckdns.org>
 <aAQDIIPOUAU-nB_F@gpd3>
 <aAQH6Q9tTmLvozyv@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAQH6Q9tTmLvozyv@gpd3>

Hello,

On Sat, Apr 19, 2025 at 10:30:33PM +0200, Andrea Righi wrote:
> Hm... actually thinking more about this, a problem with the percpu variable
> is that, if no rq is locked, we could move to a different CPU and end up
> reading the wrong rq_locked via scx_locked_rq(). I don't think we want to
> preempt_disable/enable all the callbacks just to fix this... Maybe storing
> in current is a safer choice?

Hmm... I have a hard time imagining a timeline of events which would lead to
the wrong conclusion. The percpu variable is set only while an rq is locked
and cleared before the rq lock is released and thus can only be read as
non-NULL while the rq is locked by that CPU. Maybe I'm missing something.
Can you illustrate a timeline of events which would lead to the wrong
conclusion?

Thanks.

-- 
tejun
