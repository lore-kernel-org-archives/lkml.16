Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5A27CCF2;
	Tue, 22 Apr 2025 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326661; cv=none; b=BHKwRzup5EHU4wVQtWjSr5x/BJvovrP0GsUEPjJkHyej4FBIeQt+V7qT8GOIix1OB4yDj6yKNTScSc1ZK0l7zQH+k8L14HyKhemwK7nKH7z4V66nIBisS5wn244s2F9MNhbWDKo/QmYZ7GILhddNV5PtXu2EiBVIkezK6ZCkUsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326661; c=relaxed/simple;
	bh=7dlh5sTBdRuZ2Bg+8MdaehXxpA2cWo7MIUoF0rEuoXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6hc+n89Nt/NneG5XG4k6tHPqxesH1K6pIS2KJkjMuQJj8rMIdNmPsYlJQuwaR7UZYoK2dzAf8rrxWTcWZsidP87UXoYPHumJEyWyxMvY40xWM9F8FxinKkI5CSHU5XrUrTrAQI1bkog6ai4WYSL5XQtK7ArFmBErBYhVgaJ4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqv1fjn/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqv1fjn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D928BC4CEE9;
	Tue, 22 Apr 2025 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326661;
	bh=7dlh5sTBdRuZ2Bg+8MdaehXxpA2cWo7MIUoF0rEuoXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqv1fjn/sGIynYcLQiHgIZiXFjkpMvcV4tZpjEBCL8wiiS1iMlpRR9I1MI6taju/U
	 9DUumBe6znBGQvPSZguVS9Cbl6rJzUyX7EeHSHmSvmnEci83aIb1ogEhq5/PQQgp8j
	 rX2ucOVfK+ahR1iHSlai5QSQkmmsFwvBVyPlubnnao3pFXYD8ziH/e5v4cGotdt/Ru
	 lzT4tqiyagrTvEpVExNaovg7YCnpHSWqDWKSSJLr4fogd08+NJMTZkVSMWHvVCcS3v
	 l30mKitkCTHXdmPXRuq9WpN3SlENZfDTE9VfbpS12ffNRCGeiWrzXQXnuRb4QlfAcy
	 Lw/QXtpRGt9Sg==
Date: Tue, 22 Apr 2025 07:57:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl,tcon.txt to
 yaml format
Message-ID: <174532665835.964068.3642003641817141709.robh@kernel.org>
References: <20250417151134.3569837-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417151134.3569837-1-Frank.Li@nxp.com>


On Thu, 17 Apr 2025 11:11:33 -0400, Frank Li wrote:
> Convert fsl,tcon.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/fsl,tcon.txt  | 17 --------
>  .../bindings/display/fsl,vf610-tcon.yaml      | 43 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 44 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,tcon.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
> 

Applied, thanks!

