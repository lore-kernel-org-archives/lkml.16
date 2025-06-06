Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6929A2;
	Fri,  6 Jun 2025 02:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175323; cv=none; b=RB3hT0OxpbbH/rxS9KPb4tqniI/tZ6zpDWvmKmH7g6wCXa4i/r0ZIoDi1uSRscRjDM5/NbLRDMjysrmayUaGBbRMD/+pYeHocxPWQUqfqkr9/NBHad6ra/dkpVYsbUgJBz1HauOhxUva6i3h7oDToQggE3eNJDUDtw3yfVLvT5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175323; c=relaxed/simple;
	bh=LRmymu8UUy2W7antytOmjzRPVVtM2VXO/F85i67eYP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0QSoIvBNx3l2O0zBDicQTTQCl59RBhlkQt8eJ/6IkTyvKrA7+KqubmMWvvxpGZBd/RAzxA3bAFy4rV1aU5PksRYfkw+4HRw5o5BjGbVKTwtLoBky2LFIjom2c23qNNVKLSci0XxxDiqSS6YCXnLxO5+bhmXOKw7aY5t8nmX8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tURgWcmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tURgWcmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0E1C4CEE7;
	Fri,  6 Jun 2025 02:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175323;
	bh=LRmymu8UUy2W7antytOmjzRPVVtM2VXO/F85i67eYP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tURgWcmy9A4DZP+QMCLj/6QS8ysZVZProiZ7mBjwZBZm0paF/6WCpFEKfgvoB0y7N
	 o4GudmX7mmamSj6MKH6I7IHT9ZcwNsp2Oq8otL9K0vv7Tnjj+r/JTD4kXRp7uHFsrr
	 CsnIkcw6Vi5YfzPghvKmb1JUT4FoSa+FBd77JsyS9X4v8uz/ZWNpScLe36XfLoAvBF
	 MSmII6VuHegn9jt+LsBg7D/xpUxDeVoXK41erTGyYzaSTtv4vtlQmngMDo+2w8zssE
	 RAkxSHZ1H6mxJ792/z5SG7rtMLJyH1lMLNanywbRE1gNt6BgB/y3foj4brmz0LzHRP
	 FY4jb5fahC+yg==
Date: Thu, 5 Jun 2025 21:02:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: reset: convert nxp,lpc1850-rgu.txt to
 yaml format
Message-ID: <174917531864.3770192.7582378502827790128.robh@kernel.org>
References: <20250602144046.943982-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602144046.943982-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:40:45 -0400, Frank Li wrote:
> Convert nxp,lpc1850-rgu.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> - remove reset consumer in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/reset/nxp,lpc1850-rgu.txt        |  83 --------------
>  .../bindings/reset/nxp,lpc1850-rgu.yaml       | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 83 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
>  create mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

