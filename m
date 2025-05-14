Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6817993
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240689; cv=none; b=bmw3BTYsrQj3v2e7v2LEiYO83jKqBCXb1/GlWh2bfwcvFosT0RywngQge+DQ+iPgReg24K5tklt0E5hT/bfVeLIw9njlj8GMaHUywctWLnZA2yhHF4zLidGClitOY7AuG+PNjGaaeT8aW7swo913o/rGIY4scHVBiNmbxN5S1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240689; c=relaxed/simple;
	bh=v7zf4XXuwJLVXVcM56Ut4k2cCMyk2LGNKG+tcwbHJjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbFHHUSF2YBN9QJ1otZyi/7VlB3cQ9RD1xNaTv1LZgIJDXAUxR3+6I5xw9+VJZtjEJb8MTvhMWiFgVcFGoiY4W39xGFU/Ytcx+i7YPE9n8KxJTOvUGMcUO5vOHZ5xlolHMW3KB42fC++Tihfx4ugoGAD1GOM7ofi2qGt1aLrXxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bd+rc0E4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bd+rc0E4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60121C4CEE3;
	Wed, 14 May 2025 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240688;
	bh=v7zf4XXuwJLVXVcM56Ut4k2cCMyk2LGNKG+tcwbHJjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bd+rc0E4hbESlSSaqoFXNBkqeIA/H7MHsMqucs5Syb66Yxzj9Qe+5YzPAExgh9+oC
	 sF4mFL55XGTk3yjxSIPwVXd2h6TryooU4C+JEpq7tnf/DcY2N4HgFkPxedB5iuo72y
	 +nv0X5SEBFrTq2u+toFfkfjwW85QBxLl32cAYAZtd1LwFRU55aFtoapjJyedtL96fm
	 iXHSRpIpWXST0HxoklDBSBHrVF11Q0y63qlNqnq4XHzWXeWKpTXw9TuBqAmIcymzGD
	 fMZpveRtz7m3PJLdzQRdiGIgWU7GAo1CWT526VpL9GD9QBEF8eS9eqcCYjv1q4JGZu
	 fA5+Dx8jpPClQ==
Date: Wed, 14 May 2025 12:38:05 -0400
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Explain the temporary
 situation around scx_root dereferences
Message-ID: <aCTG7Yp-WCJwy1BI@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCRjUQJ_97-B0Rpo@gpd3>
 <aCSlvpiraPTKUqOf@mtj.duckdns.org>
 <aCSoKBu0l-vTlScT@gpd3>
 <aCSyYU6EZzm4fJUa@mtj.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCSyYU6EZzm4fJUa@mtj.duckdns.org>

On Wed, May 14, 2025 at 11:10:25AM -0400, Tejun Heo wrote:
> Naked scx_root dereferences are being used as temporary markers to indicate
> that they need to be updated to point to the right scheduler instance.
> Explain the situation.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
