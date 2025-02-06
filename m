Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626A622DF89;
	Thu,  6 Feb 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847107; cv=none; b=IOlZJMeoHzRaryH3ZvHPghQu+r72YoCjFTd5Tlo1Aj+LHCyUsHCvMetuYRzV32Hzch8O/vEql3QYn6ncDTjNEr/hloqKF9meHwwBOud9GaMRGqXXKgkKIucljbpFhiZsk45sQvhmbzGD2IX4Grfw0z1Kcr2HyFa/Kr3Z6VEtsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847107; c=relaxed/simple;
	bh=W5AM9RZgg67GctX9POakdPYKIrGtt44fCA6cr2QIVSs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=HLYPzi0pogA2wKTDRF91dR4XNjb45f+qomjpKeYLz4DtK7sC4vhqXiCPHdO835SGevEpjgluDVXzQsDvaNafVgAfaIBbTqiOAbtDR3KMn0SndymWzbwWqe57VHTNRwxqvKbq5L3721tj7zIQVw2qhL+uK5+29SQ2+mUPPWVxIl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNxLhGyH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNxLhGyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA308C4CEDD;
	Thu,  6 Feb 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847107;
	bh=W5AM9RZgg67GctX9POakdPYKIrGtt44fCA6cr2QIVSs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VNxLhGyHzxicglO/D5ivZIdSr/a93Mw7FYISk0ur0L+3tzsAuN/rzAcAXyOOb8ZRo
	 aObTLjrNmcAou3cDDtxAN1CWE/ZOtshMUERgMTwb2njUdvTUMOq3qO4O1ZHD0EY6Cp
	 xkVmBmlx6p4kuaXzGeF26Ivx/BUP0PGr/MwXYtJtZm++1wAwBKKKug/lTHWVUXNHKa
	 3/mMDkGQDaXb1YItsZ9va2pNR5YfpzdKsyS6fP6Y0bpLJCkbK9P5NbaOogE5RZNUV6
	 vOxXh39z9lzDCoy1a2lZbMdTI0Yt5qX8h4fxvWoYSf7Xqs+5ksyWzolVDE/+s+pfEo
	 9k6B+CyOAU9zA==
Message-ID: <5ef3905745ce4cc4ad43135c1e6a666e@kernel.org>
Date: Thu, 06 Feb 2025 13:05:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
In-Reply-To: <20250203161607.223731-5-herve.codina@bootlin.com>
References: <20250203161607.223731-5-herve.codina@bootlin.com>
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

On Mon, 3 Feb 2025 17:16:06 +0100, Herve Codina wrote:
> In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
> from errors by itself. A full restart of the bridge is needed in those
> cases to have the bridge output LVDS signals again.
> 
> Also, during tests, cases were observed where reading the status of the
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
