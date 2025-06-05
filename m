Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087DD211484;
	Thu,  5 Jun 2025 23:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749167053; cv=none; b=hihHa1GYeqxisWFaS/eTqB28NMe1K1DfjGwnZOwQyilmuI235vmYe0uJn8TkBsnmD7tr4ahVwm1DEOsGBlrJ+fXMy47diRKVhCs2BRKY1zQ8CyLVVOYkvL9sqBaUjIqYVMW8q6MoInNl+23ZTV8RyuMaJ34ikudGaKfjRy6EsWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749167053; c=relaxed/simple;
	bh=ci1tb/wXcXuwrPfKM5LKaLeTe08xlJRjZvzDC9gp/jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM3nqrSBso5EwLtgX1vwKSSrlvsV/j3Ay5CzaNqcKHqhDQ998OMlPzJg80P2J9kEwJX6ox4V6Jg2u6RY844nyup7XOKzsg/9TPlaoDXfc4/ZSGuAGsn+O0MMqp1RlE3G6m/SU6tZXO7ViPnppmJqRwidQe0vizNZlFJHi3KhJUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1Bqm2Dj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1Bqm2Dj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D478C4CEEF;
	Thu,  5 Jun 2025 23:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167052;
	bh=ci1tb/wXcXuwrPfKM5LKaLeTe08xlJRjZvzDC9gp/jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1Bqm2DjqrbLuHTabKUdf6xvl3KXQiqUlfetXxrdz5ncjDsH0m8vUjilY2ecMylD3
	 HrSVk8zr9NI3fE2rK2buaHCY1IVR15VXT8JepKXyCZvwDl2QnjVBirdHZuII7WenxP
	 kpnXCHJeG3kon0P0+xv5YWCdlcztnKdSxGonNMfiHDvMXSxY5tEKIG/Iuw2bcyaBN5
	 QDsT4xTDpDJwqyV36zq/l3ECN1MQ4sF3KdLPmPxu14UFKwz7X5ZE+j3aep53RSwedh
	 YPPFG4cJ2Y5LDK1taVW57xYP1pK7M9ZSR70IfAoTq7HycjmquvQp0TGz2CWnOGVpsl
	 xMUqNjaTdxU9A==
Date: Thu, 5 Jun 2025 18:44:10 -0500
From: Rob Herring <robh@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <david@lechnology.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: convert sitronix,st7586 to YAML
Message-ID: <20250605234410.GA3479190-robh@kernel.org>
References: <20250530-devicetree-convert-sitronix-st7586-to-yaml-v1-1-c132b512ec57@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-devicetree-convert-sitronix-st7586-to-yaml-v1-1-c132b512ec57@baylibre.com>

On Fri, May 30, 2025 at 06:05:42PM -0500, David Lechner wrote:
> Convert the sitronix,st7586 binding documentation from .txt to .yaml.
> 
> Also added a link to the datasheet while we are touching this.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  .../bindings/display/sitronix,st7586.txt           | 22 --------
>  .../bindings/display/sitronix,st7586.yaml          | 61 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 62 insertions(+), 23 deletions(-)

Applied, thanks.

Rob
