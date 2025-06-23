Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCD82D321D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709682; cv=none; b=N8Qa6Lvd6PSzwfGE+EuKQCtTY3H10nALGwxGHFuPk+BDy7D4Dbaoq8h9FSbTWx+xX5oe5gXFzJKKHy8ItrPb+KnT/7IcytSYnxGBRsI3FWgh016rr3nrRcrzlFckNc29faFyic+5tPhRBrXMA47++tDG/0ovL53IBPxNgY4C2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709682; c=relaxed/simple;
	bh=KQXuIjAwFi29xzYFsmCnd524XcTRfPK+dqe4dUVhQuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7mFdFqs0rLFmylYZaEmZvw3unOHVFY7Oj/6r+JqcOW7diUrh39Cbvu4/AbaFpqk+9GQSMDIIin7w2UDV9JmjE97wEZMyzpZrusF+q9JrLS7Qr314OjG2ipRcwQNEMArbwCaPWQwDt3HE1zkHthn751mCv1p/UtvpeZM0gdVVFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io9HoN8F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io9HoN8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558E6C4CEEA;
	Mon, 23 Jun 2025 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750709681;
	bh=KQXuIjAwFi29xzYFsmCnd524XcTRfPK+dqe4dUVhQuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io9HoN8F+kIzOfaT/XSPL0BiRcjA2jxnROjuFZSLn1brXI9WU1GvD6uNc72d3YKcc
	 r1vzvU7nCw0B4V3DIMzwlnTyPDgLfgQBwTFC8yQGF2HCbL8BYulzGHgJx+C55AmJaw
	 QhcpeuxI7G1E10Zmmb4hpzK7vTwufYTaTJUd80Ium1U34q0J1peZngzdkSRQE0Koyp
	 wfbnlJCQ0XZgoLepQ6+vAiIY6IoOWQ73cL9EkIDWUGzUhJ4rf+xMpHCbgIX7cY3Gtz
	 QnKAxTVbO7QvEBLz7ndBvocA3XIDjdq6AdxPnTHiMzuROD4ldVd41rw52wwS4jz/qG
	 qezuk6vtJDxIg==
Date: Mon, 23 Jun 2025 10:14:39 -1000
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
Subject: Re: [PATCH v5 01/14] sched/debug: Fix updating of ppos on server
 write ops
Message-ID: <aFm1r--f6AtzYnB-@slm.duckdns.org>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-2-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620203234.3349930-2-joelagnelf@nvidia.com>

On Fri, Jun 20, 2025 at 04:32:16PM -0400, Joel Fernandes wrote:
> Updating "ppos" on error conditions does not make much sense. The pattern
> is to return the error code directly without modifying the position, or
> modify the position on success and return the number of bytes written.
> 
> Since on success, the return value of apply is 0, there is no point in
> modifying ppos either. Fix it by removing all this and just returning
> error code or number of bytes written on success.
> 
> Reviewed-by: Andrea Righi <arighi@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
