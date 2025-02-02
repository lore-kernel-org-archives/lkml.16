Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B45524F;
	Sun,  2 Feb 2025 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738457601; cv=none; b=jDX88H1CyAuSEwPPYcG1cs5+zY9FCz6AYgZ195z0WKcvN93X4pD8kDR2POQ42wdiJA+zpejk9XdU6fqEEdILTnzaSGDXrMXhEnhm01Hyg7+Ud7+9/AEtmx5O1Xxb3KuPEPdNBQpqYN+Kid//yTdW4BFPZitkl5OS6x1lP7pxDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738457601; c=relaxed/simple;
	bh=DH80kHpuNov+0PnEoZZTpvFXva7qhE9hhIZEKRMPodA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLmDPrGmFhlsGPpPmmk3hignG/9HmMw0aDby6HHycPdOIqcCer49DaNDGx8byucqPR+rpNdLjbw5szj4q2eClCPoJnd9ZQWNDbwr4Q0a/sI75XhsdPmjvsq3Ng8FUSenctuBxFGeTDrWRUqCZOqb+1oNs+Yqia5SPL6Kkc+iAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5JI9Ch8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5JI9Ch8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2060BC4CED3;
	Sun,  2 Feb 2025 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738457600;
	bh=DH80kHpuNov+0PnEoZZTpvFXva7qhE9hhIZEKRMPodA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C5JI9Ch8stcUcpS9FnPXoZXRQtAFO/89D79hGn2meo17zuvtLFyNY2kvx+s61nh5q
	 SIUM6aAl4mJl+Dapr8yQDaUzG+Ka3WjgQ1yr07KGlOel9PViYmDmY1zzvQWDq8yiYN
	 L0Y/WY71ia8LuJDZ7SGi3ePsaXP+Vkqm/2BNcHlkspYhVHZSdGHCHNb5bJwYrG2alo
	 IlrhnhdLwT+1SQNDgZfjfS8Uc2jHsasJjHopGFtrJjQY4jHpBVWQVnxo6yeXFyMgQh
	 Qs1hFDbQOvCOdwSGNpApnFI7VDd6Y/0HZQF+COc4L24wYzekXwVWzquoBv8wDXmbhq
	 8Uvd49PdeEYsg==
Date: Sat, 1 Feb 2025 16:53:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andreas Karis <ak.karis@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] docs: networking: Remove VLAN_TAG_PRESENT from
 openvswitch doc
Message-ID: <20250201165319.7319f02e@kernel.org>
In-Reply-To: <20250129160625.97979-1-ak.karis@gmail.com>
References: <20250129160625.97979-1-ak.karis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 17:06:25 +0100 Andreas Karis wrote:
> Since commit 0c4b2d370514cb4f3454dd3b18f031d2651fab73
> ("net: remove VLAN_TAG_PRESENT"), the kernel no longer sets the DEI/CFI
> bit in __vlan_hwaccel_put_tag to indicate the presence of a VLAN tag.
> Update the openvswitch documentation which still contained an outdated
> reference to this mechanism.

Hi Andreas!

Thanks for the fix! Could you please trim the commit ID to the
customary 12 characters and repost with CC extended to include:
 - authors and reviewers of the cited commit;
 - ovs addresses from MAINTAINERS: pshelar@ovn.org, dev@openvswitch.org
-- 
pw-bot: cr
