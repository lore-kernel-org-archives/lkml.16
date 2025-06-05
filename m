Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BC1FC0EA;
	Thu,  5 Jun 2025 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749154124; cv=none; b=RTvhNlVjGU1Ewz8FLaOtL8LsEdPbKa+IuvtY2TNkcU9tPluA+zAc4ZqcqWhxIRh1/yVj0IX8nWmGnEvDpMdpJyLFGlbHfly7feJGy2OTxo9+9qC9d7TsO4iEA9VGjgO3C+qLMoL/nV4AeK371ukzFRlcAzAhOC76OaZ4ERHT+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749154124; c=relaxed/simple;
	bh=7JBlwNpwacw+K72jj+tCmXdVp2M0EFjUXTKVJOhRcJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNvBwgtmPtAIaiZT1WKqda1krdfjU+xEk4ZlIvuETJLHTXzP87I88xM1ypXCaDaQswiCt2UhMCC5zpEhYvDwggFgAW/tojhjZlpderStwIomgxvwKERssYpYspd8Zm9iN12hXN9BU9hLvEOdoc4n59z6jnhnr3Ex9Q1YtI4QUWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLgnkLcs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLgnkLcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83BBC4CEEB;
	Thu,  5 Jun 2025 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749154124;
	bh=7JBlwNpwacw+K72jj+tCmXdVp2M0EFjUXTKVJOhRcJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLgnkLcsZzPwr4Ai6P6IXZrTF342k5ZHHcyHZ0LHQyPFYMaQtStpESSI1NfnairT2
	 eabbhROQ0uilyUcBmfWX0g+x4uVs8HHxJSN9ImryS+1HgVbOpvnTjnvMQQR9qvQi10
	 7tIWU9b+T9uRMoDCdiEw1o5tdMPwmD6TVztF+KSJsQPQddkQtkspDOMSqe3V1tc2wj
	 7sziKpnB5gMgnc7c4m328OeuWoE000irxz9IashAr3Hhz3+DteP8DGxPbOQjknJ0+O
	 0KA1C17Ihcxp2tlPeKYc6SWVn/rTVeTjt5WxCmh3nOAo1xGVeepTRr1+sS3oOrDg6e
	 JeP/95ceqRTBw==
Date: Thu, 5 Jun 2025 15:08:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v1 1/9] dt-bindings: vendor-prefixes: Add Black Sesame
 Technologies Co., Ltd.
Message-ID: <174915411977.3161261.2820163642193291293.robh@kernel.org>
References: <20250528085410.481107-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528085410.481107-1-yangzh0906@thundersoft.com>


On Wed, 28 May 2025 16:54:10 +0800, Albert Yang wrote:
> Black Sesame Technologies Co., Ltd.s a leading automotive-grade
> computing SoC and SoC-based
> intelligent vehicle solution provider. Link: https://bst.ai/.
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

