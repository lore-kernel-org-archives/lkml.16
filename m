Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A820E338;
	Tue, 20 May 2025 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729062; cv=none; b=Jl5eHGGCg61waz8AWL6I/P2vvc9keysd4/LUx4a+onf02MgcFIp3C2i97NAI6147Hi/jjjvnMBFJeuYzYwB5hwnJ0nAEHChtHNPxfZ3RTIeafPQu0B4SJIZue1LySBIHvtT5U7bwEwWocbNf787nLN8RayovZNd0KjkqFyQskBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729062; c=relaxed/simple;
	bh=kbpozp3j/eLGMojc0eFOneic8ZeJYYZ6W2Nl/p7w0UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWnoTMnUzATYU4uvkNRQgESz47gjg4/siObDaxxP96kMv4NDpeIlIx7SBBWV2Tx1/zKHxbnpTJHR5o3SO6zgc91pAXhoqIEcNSzZEfG+3El4hL9NcrMLmJ0YSIs/CfzvoM7ILimqSZLtkPoJcqDLcO8mxI5rPM8lcefjkDbwgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWhgBjkc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWhgBjkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E3AC4CEE9;
	Tue, 20 May 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747729061;
	bh=kbpozp3j/eLGMojc0eFOneic8ZeJYYZ6W2Nl/p7w0UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWhgBjkcd4WqAunzlKxP2mae9tvYwJGIyOrsHwpsYqklmq4iO9HKsT7Mkvl/vW4i4
	 KenT5DfFq5Kl8tSroApayqD5Xgd5yJnV43x4SAs7q/5/9ZY1Ya3CiHJqvriVjyd/4D
	 WnUgfmU16r7CGRHnti4HqDAvh8DltvI0cdOyQCMiA7s3dPsP6Bjf0zLLTyy+CKeIa1
	 LrnQPEFEEYJY+PY6/PTTi+R1lrS9H/WxN3zHnXfCbqhAkzjVT9pnkRSdGoEKdztRaS
	 Kju66pzj3LCwr0rR3nBUykYmML4fFKpXEu1TXQWcK7nWIVXR3Pwp9xa7evqwR3hoS+
	 ODIAXv1Edmc9Q==
Date: Tue, 20 May 2025 09:17:36 +0100
From: Simon Horman <horms@kernel.org>
To: Suman Ghosh <sumang@marvell.com>
Cc: sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
	hkelam@marvell.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, bbhushan2@marvell.com,
	andrew+netdev@lunn.ch, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net PATCH] octeontx2-pf: Avoid adding dcbnl_ops for LBK and SDP
 vf
Message-ID: <20250520081736.GQ365796@horms.kernel.org>
References: <20250519072658.2960851-1-sumang@marvell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519072658.2960851-1-sumang@marvell.com>

On Mon, May 19, 2025 at 12:56:58PM +0530, Suman Ghosh wrote:
> Priority flow control is not supported for LBK and SDP vf. This patch
> adds support to not add dcbnl_ops for LBK and SDP vf.
> 
> Fixes: 8e67558177f8 ("octeontx2-pf: PFC config support with DCBx")
> Signed-off-by: Suman Ghosh <sumang@marvell.com>

Reviewed-by: Simon Horman <horms@kernel.org>

