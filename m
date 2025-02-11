Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C0C253B47;
	Tue, 11 Feb 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290062; cv=none; b=UzlXZB33I4azUO7Dv33Vx6eAMQcApppcr4bMIqh95IjhlmXY9vZN8Bk2168Q2vt72aq+x7VrNWUXAw4wP4DGoSa5KXjWJ7Yrda3kjlWI1NsjNYBKnZkuGZkioEyX+fQhDmquOUpFbByYdLI3NnyN9taRJCU/SuWRkwVxR5ocsD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290062; c=relaxed/simple;
	bh=hmIgcJwcpukX+VwNpK4jLYcrMogwI4n2BOulAhzBeGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEfux3ABD/GSW3RuSj/WmDgL3z/ZD22x602v3XPd6tuHQlP/f6AY3ieRW9u0YcqXJ8D04Q+uRW06uShKyabVx55Q7ktdIv/JMGnvVvsC687dLgCQz3uCiASis7hxPw2hjCiwe+ug5CH1wxNC94G7IVoR4yXLFcXjB4EIEnZ+Tmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE1hqjdh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE1hqjdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C712BC4CEDD;
	Tue, 11 Feb 2025 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739290062;
	bh=hmIgcJwcpukX+VwNpK4jLYcrMogwI4n2BOulAhzBeGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mE1hqjdhNQCEbju7Xb3AS5F0bbrJ/CGYyxo+qNF4CarzfZ7FBJLp5EPpyF57UmtkG
	 3xvbYQ9U8J0659+BB+P9SaEno8bSrAr2FGyGKwX8/gCQGX8vPX0SSJNncnfzmvSDLo
	 uKhBpJrwg17hsTTvHBKuKtoLLyBQqe9l9H/+Npho3AphOhKek9TCyxINp4q+qggSnT
	 ZpearuiH1hhvOiKoPM1QJbXFNFHJhOdDiOP1crwCxykV2MXGu07yhmOw48rsW99P35
	 OC47BbRjhVTqUTOr692sjH3DZ1dTgvmSfdhVvq7jMmRZZNaX0kb0XEyhvWmn44G/1X
	 XyBcZgeFm8F7g==
Date: Tue, 11 Feb 2025 10:07:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties
 are defined
Message-ID: <173929005644.349085.18272720642516386145.robh@kernel.org>
References: <20250203213027.8284-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203213027.8284-1-robh@kernel.org>


On Mon, 03 Feb 2025 15:30:26 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> simple-bus.yaml which has the additional properties used, and fix this
> constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied, thanks!

