Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DFF27AC43;
	Tue,  1 Jul 2025 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379392; cv=none; b=ie+GdfD+1U2s9MuVtHMJZJkEmtedXm/rz3uH4p5h0LyorpVHAJLsqWtZ8riHG3s8D28Kmxo8r3EnKfJbcEx97pWj6ZjGfntp0f2Fp4/Oth2NLpX/s0jDua7+ELQzdykT1wA2CAmBfk5CFA1ARklBm1cdo8M8oy9ez4XCh4rK6z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379392; c=relaxed/simple;
	bh=2guxo8yVnyEDpE0m1UzULnlkK4lBR3Z5IjndknPvoz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYuqO9zPmNbAb3XVNczJbe17nWrQcIzoHT+N3m8AwQc5BtoiepJ/qb1XzV+e41sOnhlc1i8lxvrUUi2k2NR+4Otm5yMk9+lotFneNLSQMWXTZmuzr7oAqNHSnpVWYmXpIRVfdKksXz8+xNnOl/09KEvp5fFeMuEu36FPfoxPgVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sm1wrkqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sm1wrkqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A7AC4CEED;
	Tue,  1 Jul 2025 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751379391;
	bh=2guxo8yVnyEDpE0m1UzULnlkK4lBR3Z5IjndknPvoz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sm1wrkqx5rNkA3XRfkLZJvSev5ddgrk4HflgyyUSgF3nZf5TYu/BL/KQcxZz1toiX
	 LUW/I/V21KqB9Ou7GujHhvmAtFDKt6yGHln520He3Wkd65PwFrTPvXrPqdKST6+YY+
	 DIw9g1D7pdSOe41nPNb5r1boeMTBPf3gfuns6byYog86xNXL4PXHzgC9l6cgb6so2H
	 +98nARt2xWssuuEpQNYTc/JjraC9L9VA4vfrAodtIm5OY38UnywHKDsse0a7Ddm0Zj
	 ggaOM073sf84ZJQFvukS/gk4snUeU56NpFWEOe5cxCRBILSfYXWp9T+NN5IrjjEXiP
	 MKSVVKxOHnZww==
Date: Tue, 1 Jul 2025 15:16:28 +0100
From: Simon Horman <horms@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: Re: [PATCH net-next 1/5] net: ip-sysctl: Format Private VLAN proxy
 arp aliases as bullet list
Message-ID: <20250701141628.GT41770@horms.kernel.org>
References: <20250701031300.19088-1-bagasdotme@gmail.com>
 <20250701031300.19088-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701031300.19088-2-bagasdotme@gmail.com>

On Tue, Jul 01, 2025 at 10:12:56AM +0700, Bagas Sanjaya wrote:
> Alias names list for private VLAN proxy arp technology is formatted as
> indented paragraph instead. Make it bullet list as it is better fit for
> this purpose.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

