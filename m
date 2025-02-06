Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E80225A59;
	Thu,  6 Feb 2025 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847068; cv=none; b=Tnv118zuA9lZ529Mg+Qg7mM5kcBkawOx4U5mVYfy1UjQZeDcBYziN7N5TdPmpl+Fz2qUsupTKRfhhzYxGVKyzEMlLhB6DJmB9xTBKihry7P8WR8kRyFX/wVFrRKyviZCYFoicWSDmOj+FyWOc1SmZr/EPDbHjsTBc2zehRyWZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847068; c=relaxed/simple;
	bh=HcPtGRcTHAOfFGOkTyn/W0r0zfnZmlWtrN18FEpXJh8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=KaoIKE64qzB+NmFTKD7vQ7akOHylnHXw1gfPtEtacVVQo6lJ3FdH1TdLItcoxWi7TvCW5h59WZI5hMFP8I8XaF7oPfH2Gg7+XY34SOp6UDG2GLBKV7kYh5LGZ3QsEjMNaPbGA4e6tWi7aqetlkx+LOhZuzHQDLodGWDx5C0g/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDZ2ygPJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDZ2ygPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773E5C4CEDD;
	Thu,  6 Feb 2025 13:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847068;
	bh=HcPtGRcTHAOfFGOkTyn/W0r0zfnZmlWtrN18FEpXJh8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=pDZ2ygPJsmDFa8WwJ3UD3N5GE6qpleBBL5vG7ZH/EnrMA+YS+Euxx8GgnLzhwSC3e
	 Mk5a0IwDMiUW13tzHVnwrZqM8PqUTbEt5UeLzUSdxFjSfBjh4f5hsk24BkpzE5m6Yf
	 pJ8E2hhl4IYgr5mYL854fDdkqVJKP3nz5MsZA842RI+JCzvt65rFQtQL9dL+8Guvmo
	 N0msJyO/UuXWpzRfEa6Az05uyqbHFlBAQ6l3fgz13Ho0DD4gSALD5xQz9JtQ+0l6/x
	 i1W39I4VgyzT7A76IR5D+W2/rdNNy5jveHMG9NZmA2OeVjiSc/fTX+Q3byEdInWMXn
	 IDVqw/q55Aw0A==
Message-ID: <cc915f4a4aa81e1a26e768c54c26c195@kernel.org>
Date: Thu, 06 Feb 2025 13:04:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 3/4] drm/vc4: hdmi: Use
 drm_atomic_helper_reset_crtc()
In-Reply-To: <20250203161607.223731-4-herve.codina@bootlin.com>
References: <20250203161607.223731-4-herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Conor
 Dooley" <conor+dt@kernel.org>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Herring" <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 3 Feb 2025 17:16:05 +0100, Herve Codina wrote:
> The current code uses a the reset_pipe() local function to reset the
> CRTC outputs.
> 
> drm_atomic_helper_reset_crtc() has been introduced recently and it
> performs exact same operations.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
