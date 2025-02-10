Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA35D189902;
	Mon, 10 Feb 2025 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182579; cv=none; b=Am3PEN517lEu2JFoptUg6ex1rdhi8LMBsMjaH4zMf621mfaG9158Cewbj9DWaROLJH/9GuFkA/sQwE/U3yvJGrr32JLBzdCkjZlEq3eafZg/ghG7/1pqns3HXin7x2dKKWkiQ+IjmKMtfnwwsCgHyflOHjXw4sal+EmTf7T0pQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182579; c=relaxed/simple;
	bh=khZXx91+JHrmsBYXqnk7JQrqQDlRf4NzWNK9wU6n4+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKm6ZXZmLUv/b1hUqimxC+w7Rwtffz3HQ4T1qdrPpV6vLyU7ikL/LCRm4svUwHUENFnjmFfE/2gAgQulOa9VfT0shbfzVvNfkWfuOl1IPboDRAE5Gse892Ss8/c3E3dddsTGzLuhFj7uYMGYyKcLFY/jJoIYj+ihy/Rug2+YFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWMzrev0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWMzrev0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D65FC4CED1;
	Mon, 10 Feb 2025 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182577;
	bh=khZXx91+JHrmsBYXqnk7JQrqQDlRf4NzWNK9wU6n4+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWMzrev0ggNe8eoKxQm+U1lbahltBJjAXKVSz/smDpUzkkhIZu2twI3+LjaIm5Wpx
	 0HnIZn0mk9dvUBzzuL5HHSE5oKNNB3GxpvK3+6G6H0RrhK3bQ+rzl9oZA98TA7xNdX
	 r5/q4zsjLxeY8RvBn9fYDFymdlylfGoL0mM6B0Yzai09jXYu2G01ZchIUHTGjhS3c5
	 zMNNEjBZHE5DBUrVNdlsc9ib//rQ+ttRF7BfgH33Lxloas7VtSW+372K80bQoI/6lb
	 WUV9z4ndnF1tUbfBIbk+7vFG5I9xkKPvO5Uliho2y0h6425omirpy2OUaOHraCnVXY
	 1e5I32uXrLYSw==
Date: Mon, 10 Feb 2025 11:16:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, sam@ravnborg.org, dianders@chromium.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible
 for the panels KD110N11-51IE and 2082109QFH040022-50E
Message-ID: <20250210-rampant-uncovered-buzzard-c96e31@krzk-bin>
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>

On Sat, Feb 08, 2025 at 06:53:24PM +0800, Langyan Ye wrote:
> Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
> add the compatible to the hx83102 bindings file.

Your subject does not fit at all at any reasonable limit. Keep it
simple:
Add KD110N11-51IE and 2082109QFH040022-50E

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

