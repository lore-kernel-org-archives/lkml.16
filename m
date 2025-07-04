Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D33F43AA9;
	Fri,  4 Jul 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638806; cv=none; b=Nx4xZiNF3FcEJLqSTjcemiqnZaNTyc+dD/vigFF5QPtV29NkKd8EVmfxq29UUJwszkszioEZT+XEUZO3glkOMcduIwIPVUwjK7OWM4F0stGdv94n5CNv0CAVzmsGhKWSI4QHkbpkdp1obUOx/uPjzIHDgGtrTZ3cbtCHsho2v34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638806; c=relaxed/simple;
	bh=+WJr4rNvGVXEuWnMrvlMSs84CbXFgoGwyS6bbxPe0Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdvM+cyCnRvx1rv/IIvfoD5rp3zp6jH5dxr+KnSJGF48CPtKQ6Zc0eN+KP6pLntK4R0Gl4T5IOd9XAyQtZTeVVCNcJfx1do5TpM/fCoutRRchbq7xUGiN3YItmHy1kgZRihUdqW8/k579UFlkc47NctBPBfiXT36hmYVYl3L01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0DvtRhm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0DvtRhm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A308DC4CEE3;
	Fri,  4 Jul 2025 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751638805;
	bh=+WJr4rNvGVXEuWnMrvlMSs84CbXFgoGwyS6bbxPe0Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0DvtRhm1R+GcVq/7gyBaeuCZIkrAIr1fcS6kotGfCovKX8Opx7oOWvAtnpn9WTCW
	 S6Fv5Ylz07WOwT4CoZMbDaFO56rlZQjMhJvajPVu10HUgfHF4BSrfaQW7K+AL+1Jwl
	 RC8g53tw9RyeuA6839i8DVWRTg4qcaw4Xvs4hZU+aI1nfGMoPP4kdalHpkstr5vePe
	 RuWkEfOJ34BhUKINq1lkLpHYf848iRJY4V6yybWcfIJee6gHx4lJIF+ODtDmX3ZaZ6
	 jkAcKBODPH8fIw7wlwtJ0E5fEzbroIOI/Hinqo/hZO+8Hvo2BvissflwqCh5rNOj8y
	 OnkqLnSII1ZDw==
Date: Fri, 4 Jul 2025 15:20:00 +0100
From: Simon Horman <horms@kernel.org>
To: Wang Liang <wangliang74@huawei.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, yuehaibing@huawei.com,
	zhangchangzhong@huawei.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: replace ADDRLABEL with dynamic debug
Message-ID: <20250704142000.GW41770@horms.kernel.org>
References: <20250702104417.1526138-1-wangliang74@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702104417.1526138-1-wangliang74@huawei.com>

On Wed, Jul 02, 2025 at 06:44:17PM +0800, Wang Liang wrote:
> ADDRLABEL only works when it was set in compilation phase. Replace it with
> net_dbg_ratelimited().
> 
> Signed-off-by: Wang Liang <wangliang74@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>

