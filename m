Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004B2E64A;
	Thu,  6 Feb 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847047; cv=none; b=nO0oihN+rEeyyEdFwhhnoChhv9/0Zth87s9SgDSXbgUMUDfAuCz+O9eBbQBmEmsGcIC+x2+iQj1G2x9ww6/Sa/kb3PS8df86FX5+fy4SGuJ5xERHP3+g4I+X5DwRCKKGWdQvrddRxXbBd3rPoz5LhfeY+gduJgjrFSxEyPTgQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847047; c=relaxed/simple;
	bh=nEw9U9zKQZOmhf0lCPoaaFIM3irBFL5tnMAQWLaVNjg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Mv5XoDlhxe+WBrV2VWdRRXdTZZ9EBH5yNL+OxI/Kp3taEjkQDTM0voGrsI2TuYQIsqoo71WhtVZdg+3p32JaB+4udhDYcc8bsQ3accRFeVR8c6XCYkUT2w6Em9ommDPtLzfAQLKuzqVJ4VGWaqEiNyHdsOdkQy9Y+5zJP7+sgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DleS3p4T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DleS3p4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E98C4CEDD;
	Thu,  6 Feb 2025 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847045;
	bh=nEw9U9zKQZOmhf0lCPoaaFIM3irBFL5tnMAQWLaVNjg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=DleS3p4TanF27Og5zEN1U+io0qGAhkISDs+uE6LRtQtVavqlq0tg7w6P92gFWgK0K
	 DSVi7y/jCQfimVOPs1gc1WDQrTf2FlNPxMLZX6r3X7/eiuhJmtyu2dYib+CJLQVnnX
	 W9HrHSu1MYsbPvkMCeMQazI4maM9K/hKqcmiItpJfxCUdKPk5xGloL1iag+Wq0Ya9f
	 3i9BoKLbhsMmu7FDc8XQwiUKH4WtZ0ZmOqWtTSscdR2zYBmwezvASFzq4VOrcuXnaH
	 Eyz8HLMGp43pD+fIh8NEtjr3gYGvABY/3RlUE9D+gahm+sk8qf/eljsAe2tHZwQVZb
	 XU7+qewuWk50A==
Message-ID: <85d06e9dd86691976049014aac756327@kernel.org>
Date: Thu, 06 Feb 2025 13:04:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
In-Reply-To: <20250203161607.223731-3-herve.codina@bootlin.com>
References: <20250203161607.223731-3-herve.codina@bootlin.com>
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

On Mon, 3 Feb 2025 17:16:04 +0100, Herve Codina wrote:
> drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> 
> This resets all active components available between the CRTC and
> connectors.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
