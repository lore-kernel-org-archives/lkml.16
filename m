Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C912320F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062994; cv=none; b=Lx2dvTmbjpfvSphBWblK6AviTo9gCc/r7eo7ucsCtZC7hZoJ6dFdDKq6eImR5AjlEK2UIpMxBz8YtZNmU2aIHl0lBzEiSpTCgfgZMRusSZo+35MQIOPWcAxKs00Rl4nvLOwA0GO51FX8Hy+ETOC/RS6wJ7PG755Ngol/u2AabFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062994; c=relaxed/simple;
	bh=vQxGVfKntyxlGQ+fF41HjgGxpjM9poX/8Z7tSWJvg4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jY388iK8Cw42GbZYZxrXAD6pcZ3ufksgxaxQZFAazt5GfrcpYj01dieilgz65CdpfTnyx9LYnH7P33yLvnMQDanQEN+ZvVQ1l0dacCXk15l7iZ0jnXrjO+B/H6Qj4VnVHMUqQF0E0GJcFXSAKH0E37m285KCveSflruRZ6t2UWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrRDXtzb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrRDXtzb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74118C4CEE4;
	Wed,  4 Jun 2025 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749062992;
	bh=vQxGVfKntyxlGQ+fF41HjgGxpjM9poX/8Z7tSWJvg4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrRDXtzbUmZXEUs397+7yRnGw373Rg46UxdTIWJeXSo/RZj3EFuD/8BNcB32QW9U+
	 Bo6SVJ0UnSqqZ8Wd31TcxPASaKD6sqqPMxaNEUwTwGxHDnNHXzNIumkG+ZwaPxATiE
	 7NcrEPck4FioOh41VsBwHtdsNCtZ4O94PL8nT7ew5donh/5yEm9VTidDAGnJsTq+Lk
	 ffJLtud/SnFRqSpXseqPQX2dED8Edm9vDHDa4ZOqcb/3t4DvHEkrbWvq+UZPWkvo/T
	 zijJTd9zA7ycNLP7i4LAMEMxpZvPvDjS0XS55V4qknhiqcH0JtsnOBx3FflMuEYvCi
	 U7prmulW5v6tQ==
Date: Wed, 4 Jun 2025 08:49:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] sched_ext: Make scx_locked_rq() shared
Message-ID: <aECVTz-ERs2Y-59t@slm.duckdns.org>
References: <20250604143547.708202-1-arighi@nvidia.com>
 <20250604143547.708202-5-arighi@nvidia.com>
 <aECVGF4_qVIEwXk2@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aECVGF4_qVIEwXk2@slm.duckdns.org>

On Wed, Jun 04, 2025 at 08:48:56AM -1000, Tejun Heo wrote:
> On Wed, Jun 04, 2025 at 04:33:14PM +0200, Andrea Righi wrote:
> > scx_locked_rq() is used both from ext.c and ext_idle.c, so make it
> > public and declare its prototype in ext.h.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  kernel/sched/ext.c | 2 +-
> >  kernel/sched/ext.h | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> > index 3e483138dff60..941603ec67e27 100644
> > --- a/kernel/sched/ext.c
> > +++ b/kernel/sched/ext.c
> > @@ -1265,7 +1265,7 @@ static inline void update_locked_rq(struct rq *rq)
> >   * Return the rq currently locked from an scx callback, or NULL if no rq is
> >   * locked.
> >   */
> > -static inline struct rq *scx_locked_rq(void)
> > +struct rq *scx_locked_rq(void)
> >  {
> >  	return __this_cpu_read(locked_rq);
> 
> Can you rename locked_rq to scx_locked_rq_var (or something else), expose it
> and then make scx_locked_rq() an inline function in ext.h. Alternatively, I
> think it'd be fine to drop the wrapper and let each user do
> __this_cpu_read(scx_locked_rq) too.

BTW, if you update this patch, no need to resend 1-3. Just send the updated
patch as a reply to this one.

Thanks.

-- 
tejun
