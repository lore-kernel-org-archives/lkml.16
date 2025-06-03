Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27B173
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 00:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748909160; cv=none; b=Q55KdCGWEoZT340mVWfUrmPIKVI8RbXgHSOhriSj5pJWutzvdWqhzky9S6L/vDJiHsZWsPZFfBCoND27g8ngeH2eqwqrUwr1EKuocrkxrWnLFTt2zNjAAO1tzr11S2MzVUSoxVqOCyD8v4RG2pcvygPX+jLrp4UBmfPjsnR2yRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748909160; c=relaxed/simple;
	bh=vmtqTcSnZqXMWIeGRxSwwuim1Pws2pWkAXQ+gjyQeMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etTTNCiepoAchppX7hjHfelNZ1cH5dVXpSjgWWCWKE1Q1AAcgRgFQLkSpTd7GuM3lJWPiWoVf5gf0/0Jz9sJaJySqQ1tDfNurBLRtQ7fkenTdN1Bj2phhKTuLiF09NWDfItG/mrn/q61cFqqrb9uW/6YGv1U+iICLcwKsscBNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MauylUYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MauylUYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06658C4CEEB;
	Tue,  3 Jun 2025 00:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748909160;
	bh=vmtqTcSnZqXMWIeGRxSwwuim1Pws2pWkAXQ+gjyQeMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MauylUYLcJWYjTIUAARLzFj1UbfEFj3/m5650UlGQUwPgUFlsI9MG9oPBgmig0k47
	 u6ui4yZNzQtw7VJ01/40ejkY8QpoDKJTy0TlJH27NNr33HsXdEvQ3PJ9e1IexJdPup
	 qrpsoeezokthQAWRydhytRgtTtBD6nw49j4laf1iZlAH75oWHEiWglEdteKMLjO3Ou
	 C4lX1nAg+yq55ohe6A4/icLquEUtA+1AuNZnMHiYQQ3MCHivVqmMXB46GX8xfa9V+m
	 ltCgvZouaeYD7UAe3Sj5zotUlgIR5sy2x3fdn610RN463t1B/vmkddB9t/itbNT3Z1
	 xBQ04RTKv7pzg==
Date: Mon, 2 Jun 2025 14:05:58 -1000
From: Tejun Heo <tj@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v2 01/10] sched: Add support to pick functions to take rf
Message-ID: <aD48Zq2FdYlBJAk2@slm.duckdns.org>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-2-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602180110.816225-2-joelagnelf@nvidia.com>

Hello,

On Mon, Jun 02, 2025 at 02:00:57PM -0400, Joel Fernandes wrote:
> Some pick functions like the internal pick_next_task_fair() already take
> rf but some others dont. We need this for scx's server pick function.
> Prepare for this by having pick functions accept it.

Hmm.. after the whole patch series is applied, pick_task_scx() still doesn't
seem to use @rf. What am I missing?

Thanks.

-- 
tejun
