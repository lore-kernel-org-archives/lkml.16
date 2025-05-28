Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA6027815C;
	Wed, 28 May 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449573; cv=none; b=L4kqVJjUN9yFU1LLLzxI3P1aVKJxgszVdzZZCbQ2AcLltE4lWpC9HxMh5bXKehX73y1Dv2kvPrTDgBlzhZBtYLFUcde+vGoxTXfMk5aj+dMIt8zn21Q2jCRRf88F5DaCOMwi2CAYZkszZq54lJhZfvWa03pD3fPqEfB4ctXRH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449573; c=relaxed/simple;
	bh=ppeisGF7inZtJ/rAiiNTGDEtu5mM/udLxSQimZXVfp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKm/vptTKGG0Zeh6CaEFGdE0unzEuovMiajq2coTP14tbmK9Ila9SO+0PeAw+7nLepsa3bhaUu9w27gmzO/T3pZpkpPrXjdGsImyb9j9Wam3sU4dIS9j4IKgZcD+Rn93Y5ohOdEdK4M8TYxjmoyvKBypt3dV3dTIaG0XLLcoBRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvRMGV7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvRMGV7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AF2C4CEE3;
	Wed, 28 May 2025 16:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748449572;
	bh=ppeisGF7inZtJ/rAiiNTGDEtu5mM/udLxSQimZXVfp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvRMGV7ZnYTXa67+AwtnpVH62x5TC6saSJNaY/b0BB1+F5dr40G/wezaCwgxi9xcI
	 7qQJ6Q1HlBzBom5qn994TNcfgeJ0RUqCIZ6FyfbX4S3NCHZTfQTRYkB1KW1x0feIig
	 lEEnh9l6i6ujWulpk5aUx3AvaexqGpUUJj282NtTW69wOJ/QwkJDMlo87k5Hy/xCnL
	 hYqrj55DGbs+NTSJRs9ENVFj2s5tEpOemiNVgnK8bu7EzdaE35onpUan2ryoaUFnxs
	 kp7289MMSrS3Fk21dHDE9tsezHF4Kt/it+41/f5I+Mtbez/HWfzcinKwWFG8ByPiBO
	 5t+70sZQCI7bg==
Date: Wed, 28 May 2025 17:26:07 +0100
From: Simon Horman <horms@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] rxrpc: Fix return from none_validate_challenge()
Message-ID: <20250528162607.GF1484967@horms.kernel.org>
References: <10720.1748358103@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10720.1748358103@warthog.procyon.org.uk>

On Tue, May 27, 2025 at 04:01:43PM +0100, David Howells wrote:
> Fix the return value of none_validate_challenge() to be explicitly true
> (which indicates the source packet should simply be discarded) rather than
> implicitly true (because rxrpc_abort_conn() always returns -EPROTO which
> gets converted to true).
> 
> Note that this change doesn't change the behaviour of the code (which is
> correct by accident) and, in any case, we *shouldn't* get a CHALLENGE
> packet to an rxnull connection (ie. no security).
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lists.infradead.org/pipermail/linux-afs/2025-April/009738.html
> Signed-off-by: David Howells <dhowells@redhat.com>

...

Reviewed-by: Simon Horman <horms@kernel.org>

