Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD62116F4;
	Mon,  3 Feb 2025 23:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623981; cv=none; b=Bbi6vaY48CbLyUWtsnEXsbw2SpNkL0lX/FeyY1UvAG687XutsxoA9dPrc8llYEhWcw47KwW3Yo4GK2khOkNTGCJh7FsjFMxBlvzu4xoEAVa2DOCczS1mYh+9x/sZBJszoErIAdE5u4omrsfPkeEVCxKiKHgjMt92a8RTo7IalVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623981; c=relaxed/simple;
	bh=8BS2LzvHcY78r1DdXYDr56TTF+ncuwdpHMuL/41500s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mv3ZRv12H+omImsDkzFBhwSdZgzzcvuvwBFqVMbsmHj1s5mywUlo9bg3WfkN+jRgRr/2SII+GV2cf5q8k6Fkjy4k4CINDL+yJbt+a21muwm3Mcu3IIJp+jMCghU+UmI8u0h2DQ2vseuXWgbNZbsI5ObEohLywUyRzqZPNZ75SjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/Oqgb1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/Oqgb1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A40C4CEF0;
	Mon,  3 Feb 2025 23:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623980;
	bh=8BS2LzvHcY78r1DdXYDr56TTF+ncuwdpHMuL/41500s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/Oqgb1r/aQwrhI+H5DguR4mvIzCqhBGEL1v2+HGxur3qlKR10e5vJyTvtKuLnzpt
	 2Py18GBs3H7WVtbqksGT2LX6xTei47UOovGqk9O6fXrdcnOYIU31eKwhofsVhY9CQD
	 o8s2StGGt9Q303awQLnXL3V9NJiEDaGMjdbfcbybvutzdfXzPji6De2oE8c0fnKj1O
	 CiT83JoMsJQGL+Z+8/G1vO0v8CAKVXxBYyTyM9PGzcf1awaq3Q1bEyMv18ZxsChxPl
	 o0WMur3EI03qosHXattpMjJUmPh9wgahW5UKkBjAswivrhsSbgZLptVjTXwLNAjDz4
	 xSH7cilbv7Izw==
Date: Mon, 3 Feb 2025 17:06:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: rafael@beims.me
Cc: Simona Vetter <simona@ffwll.ch>,
	Rafael Beims <rafael.beims@toradex.com>,
	Robert Foss <rfoss@kernel.org>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	dri-devel@lists.freedesktop.org,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: lt8912b: Add I2S audio
 input port
Message-ID: <173862397834.518293.5664388217181154431.robh@kernel.org>
References: <20250203192401.244651-1-rafael@beims.me>
 <20250203192401.244651-2-rafael@beims.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203192401.244651-2-rafael@beims.me>


On Mon, 03 Feb 2025 16:23:55 -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Add the I2S audio input port for audio over HDMI support.
> 
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
> ---
>  .../bindings/display/bridge/lontium,lt8912b.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

