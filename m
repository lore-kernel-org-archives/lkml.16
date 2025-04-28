Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704BE1B0F1E;
	Mon, 28 Apr 2025 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825627; cv=none; b=DrY01mUIthUlHCSdX9z/BMR3XjuUsupBZWpMGh2JbJOUe4qhO0X4yuMaIfHcqk7DolfnDQUemvDjJE/0YU1Tg3CqKGjVAsVURJiLKSymcczGYkgaHppuFaMsExj5GEC+kRG5BUxkTGS5LZo5s7bVeWaEHL8yr//TpT9hx2ZNhrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825627; c=relaxed/simple;
	bh=XKpU8zNPyDsCQA5Q8cj48yTBFsShn/3ZGGxL741ISWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puO8abKoUB3sC5UqZ60xBF47okp13VonPfvkKfUsJlkuPPzvqs3UKsAGLg6qiMhSK5pwtGpKgKhPWvzwf6G3VBdF7wZOYJ9wPi03pu1QRPZ5L+b8Jw3Adea/W6HZx/NIUkI2UFvysi2XO5eGbTY7PRbk7Es+VFenrTudbkGWb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unUU/Akh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unUU/Akh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EDDC4CEE4;
	Mon, 28 Apr 2025 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825626;
	bh=XKpU8zNPyDsCQA5Q8cj48yTBFsShn/3ZGGxL741ISWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unUU/AkhCOp4usx245M9wzfpW+MZVEAYh2wi5kvjjtrAEuse4Hxf65cJZoCT5sjuV
	 DhNEEXjRjD2fn1YM58jsIunBu/BGcB22rxV4r3/+nuPNwdHfzgoDCb2r7jA3tIIVyX
	 qSrhXSFd63f7St+heKVnmsmBySarcNgWxIXBhumT6fg/6WHWRasbX7zBElD6iC3U97
	 t3VzgnlGrintBwXh6fR30kPfcr4cj0IOBhrPKDHpWn1PcQMWZGgPZE+qVV1s2JHgHa
	 1e0OhZQMe4E4RkxqZUy6GrUw0JJmfmrbWcJrRZ/1QeRVgWpA47DPaYcEKkRmcqeD3Y
	 +GRalgLikh7MQ==
Date: Mon, 28 Apr 2025 09:33:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/5] dt-bindings: display: panel: ili9881c: Add
 data-lanes property
Message-ID: <20250428-celadon-termite-of-music-74b5eb@kuoka>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-2-ff7da6192df2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-feature_sfto340xc-v2-2-ff7da6192df2@bootlin.com>

On Thu, Apr 24, 2025 at 05:07:40PM GMT, Kory Maincent wrote:
> Add the data-lanes property to specify the number of DSI lanes used by the
> panel. This allows configuring the panel for either two, three or four
> lanes.

That's the property of DSI controller, not the panel. I do not
understand why this is different than every other panel binding and your
commit msg should explain that. If you do something than everyone else
it is a clear hint you need to explain that.

Best regards,
Krzysztof

