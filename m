Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37F23CB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743182943; cv=none; b=RJWrA9Gjo0gWZCtywXgD2Ees5LXJIxPXbNp2DOqdr4WXGJkJeDzUs5gQFZQTOSNCH9PvP87HbAQ0a/APG94N8AjA7ak07baelcx79uLdpMBUkZr/YOUBPeLR94FYT5g5jWiHK3UjX5INb1Rk7azwrC299f6YZ9kbktgyw5cOYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743182943; c=relaxed/simple;
	bh=Z4OkGV5PLg3tHCFfRZZ9DrAl5jieNwlZj7RZwLHOBz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5ZXDK+6tyrPSXFxMfqw5PWQiad99DuID/4B50F0TnLGVCJcceI+742y6vtlHZ3iiyY/nGe3os8+cFq+Lyqlk09ObPH5oHu2Vp5lvWehxflcJ4efmc6VUSJaq274CwrkM3VXfHQJWPXwXJwvYpGif+bxKvE9m8ZKFdiLIGu1UGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAAkLQD7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAAkLQD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E237C4CEE4;
	Fri, 28 Mar 2025 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743182943;
	bh=Z4OkGV5PLg3tHCFfRZZ9DrAl5jieNwlZj7RZwLHOBz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAAkLQD73ttzGlDFxpCemiRcQuDTf9x8WNxfCWgzeG1HmhMP0/cbWZpcmsT5+qUqi
	 xMXGqrbRobHjOKdLNEHi2oRj0aigwWSJCLTa6PH1dbJSsjnjT6pIryAkYYZLtV1WS9
	 f6/W7x94QjGZx+fTS85iKB8RgHJUyNIwkr9UJncv88v5AcI6cdAIOlUvKC0UCuSpJm
	 AXY9aBM5FhkQJwtUobfXtbhX0WzyXgrhxpcD2mEpJV8lj1i+jo7ap2Rh1H8ZB3YEaP
	 MPvsWfbhhifWnPGqs8qcpobF+c6puyf42wH11rX3TJzyVdFNLpF2jiTtAnvmilhOFE
	 e4uldHCqhwn8A==
Date: Fri, 28 Mar 2025 11:29:00 -0600
From: Keith Busch <kbusch@kernel.org>
To: John Meneghini <jmeneghi@redhat.com>
Cc: hch@lst.de, sagi@grimberg.me, loberman@redhat.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	emilne@redhat.com, bgurney@redhat.com
Subject: Re: [PATCH v2 0/3] nvme: make core.nvme_multipath configurable
Message-ID: <Z-bcXHLwqU8aI_Ug@kbusch-mbp.dhcp.thefacebook.com>
References: <20250322232848.225140-1-jmeneghi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322232848.225140-1-jmeneghi@redhat.com>

On Sat, Mar 22, 2025 at 07:28:45PM -0400, John Meneghini wrote:
> These patches propose an alternative to the outright removal of the nvme
> core multipath module parameter. Rather than deleting this module
> parameter we control its appearance with a new Kconfig option named
> NVME_MULTIPATH_PARAM
> 
> Note that the default kernel config settings produce a kernel
> with no change in functionality. By default both NVME_MULTIPATH
> and NVME_MULTIPATH_PARAM are enabled and there are no user visable
> changes.
> 
> To remove the core.nvme_multipath parameter simply compile with
> CONFIG_NVME_MULTIPATH_PARAM=n.

Thanks, patches 1 and 3 are applied.

Lacking a better way to handle your situation, we can add patch 2. But I
recall you wanted to invert the logic and option name, so I'll wait for
that.
