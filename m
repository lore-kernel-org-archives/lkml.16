Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64272283CB2;
	Tue, 22 Apr 2025 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330277; cv=none; b=STvMsqJ4MCf3DI7ZFen7KvHkINNhxFd7T07Wqp9H2ph0U9tx0EHwaSea0yad+8haxNiQxyhxDWJ13WM6BY1FN8KMamRY4TwS7EWSmBwB75hcK2OBlvK2Bx0Xq/9qZxEREbwTPCzG8PeMb9KP5FV94O6WMCD+Af+jiRqM9Pb0j5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330277; c=relaxed/simple;
	bh=lbd4EVnXouia2uzORsnINqHx0ONzqV4J7Riq6tAAL0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEKh+ihoP6gUwxmANKgD/JTNCMeyfgvIHAd9RoBr2dorXebRsV7byiPK/DGqgVFOJ23GRrrfLA+56Hgqsq4t9uVR6MniI9N3oI9twRsURe4PnErrfWjzGMZR/jsQSCZYc1UjtEBMwc7CurIQug373i7mN0KRX9qgI7Upf2tl8qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfVAL+vh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfVAL+vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFD4C4CEEA;
	Tue, 22 Apr 2025 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745330276;
	bh=lbd4EVnXouia2uzORsnINqHx0ONzqV4J7Riq6tAAL0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfVAL+vhTAPu3EDwsHI7ODIk3uAZa9/mxkgv28/Cb9UQPkLEeEl+1K6XcWGJEmEna
	 JU9rDjxqdMG3O/RPJwfeLCs45cMKg/0D/6O6w/vZUtpFsh0DkV2Hif7Fx+BnKOreDS
	 ii/C68qvU5YUBW8pFlvd8UvUxF7KYz4pdpbENNdb77kTJFOljesMwO/wzYsbZChiKJ
	 hzloX3GIYySM24Ew814nMPvHVD0MQy4tIMvIRT6vi6NukrLQr3lhV848aickRb0pUf
	 Y6oNrx5hxCNxXZJSQevoLHW49Q7Rd0EH6uKi9XD1MEf/KN2XD6ngZCzX8xN0bJWqpd
	 ilXkzbaGqE8jg==
Date: Tue, 22 Apr 2025 08:57:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-sound@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,mqs: Document audio graph port
Message-ID: <174533027316.1138988.868442565020756721.robh@kernel.org>
References: <20250418053050.2755249-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418053050.2755249-1-shengjiu.wang@nxp.com>


On Fri, 18 Apr 2025 13:30:50 +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

