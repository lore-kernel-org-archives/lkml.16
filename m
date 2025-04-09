Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D23E2777F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224686; cv=none; b=i8GbbTHeIG0CR5o4EkxbLyUr5lTbkOmCMBy1lnwAq+CJyPQT0dvLeDenbkvr8zp9ZB+EauWlyRIJjzqvdupfky+HQrlev5sNzTfr7zn35A0ybG5/bREnWz6uLy6VjJTe8AemDqcpM6kJvu66r38lZG0QHg0TDoZPqLgAeBqvTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224686; c=relaxed/simple;
	bh=/id6ddo3PRptX87DK0aoKwwxpdepi4g3Tp1k/5PQ7Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEu/2ABXasR2Q8qs5cA7s/dmHJw9QfSAq5o4OzLgoOaJUoSPWCCllOJtTU5gH2/KzAO5lmDZLH2sA+ZasmqKM1nAem4kxyfWPahGHzWqU4R7S87Y9hAYv9GSLrL17z/JianNohRUWw6RBypBcNllSl1RlUPwWw/FWDx3uVp5M0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf90ZxbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf90ZxbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B38C4CEE2;
	Wed,  9 Apr 2025 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744224685;
	bh=/id6ddo3PRptX87DK0aoKwwxpdepi4g3Tp1k/5PQ7Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vf90ZxbA5zW5qrNrismdx+feXiMEAIMB40Yymap3KN/ewWwuGw/H1LqYqqr/fPBcr
	 qrk3/KBo6dAHk/5lvzB9DBUbAkRU8BggymQeW69f8cbfe5YVkeH69KlkhcWPs7NiFm
	 EMNbMs5S+u4DiLn3cu5wDf5YGMg/4VVt3txfcBBh4ALEC5LUK6Rk3fSTOyhIUohnMd
	 7zSzXoVPecLcjmepacxpq/WLNm8zPccX8iGb/723ettOOR6X6GL2q0rBxHsQ28F3UP
	 qvo3URh3q8x8zaQVRbVzrjY4JC6Tb2iZq/P4osBTRgTTFykWFFJqV/QkqpeJislrzh
	 UYLEE4dTPuRFQ==
Date: Wed, 9 Apr 2025 08:51:24 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 5/5] sched_ext: Make scx_has_op a bitmap
Message-ID: <Z_bBrENa2luRC7nT@slm.duckdns.org>
References: <20250408230616.2369765-1-tj@kernel.org>
 <20250408230616.2369765-6-tj@kernel.org>
 <Z_Yoh6Is2BaxwdyC@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Yoh6Is2BaxwdyC@gpd3>

Hello,

On Wed, Apr 09, 2025 at 09:57:59AM +0200, Andrea Righi wrote:
> On Tue, Apr 08, 2025 at 01:06:05PM -1000, Tejun Heo wrote:
> > scx_has_op is used to encode which ops are implemented by the BPF scheduler
> > into an array of static_keys. While this saves a bit of branching overhead,
> > that is unlikely to be noticeable compared to the overall cost. As the
> > global static_keys can't work with the planned hierarchical multiple
> > scheduler support, replace the static_key array with a bitmap.
> > 
> > In repeated hackbench runs before and after static_keys removal on an AMD
> > Ryzen 3900X, I couldn't tell any measurable performance difference.
> 
> At this point I'm wondering if we should just do something like:
> 
>  #define SCX_HAS_OP(op) (scx_ops.op != NULL)
> 
> Do you think the bitmap can provide some measurable benefits? For the most
> frequently used hot paths (enqueue, dispatch, select_cpu, running,
> stopping) we likely have to fetch scx_ops.op anyway, so cache-wise the
> difference should be minimal.

Performance-wise, unlikely. However, we need to be able to enable ops in
stages during init - CPU hotplug ops need to be enabled before other ops. We
can do that by setting the op pointers in stages but the code was already
structured in a way which is easy to convert to bitmap, so that was the path
of least resistance. We surely can change it.

Thanks.

-- 
tejun
