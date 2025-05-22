Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540B1E485;
	Thu, 22 May 2025 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916203; cv=none; b=WrrdnUbeG5KTaAef+jji5/fMWMOGhaM2kD2Hz0l/3tMaUVRnvs+JPiNW5rT7qpIZQxx9YfBnhKKZs4sRkLgqsxSnMohqwjYSQlg4u4ksji0X7zpYeTPOZ7cd1XSFe7j/DU6cu+UoXuiRONbuoyc/Ow6K0dF8IrzQfoNvLtn8uMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916203; c=relaxed/simple;
	bh=janGegacipRDwPFRgry5bht/UiVsUU8rf1hprM7kBWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZou0szeOYfondq2X4PZoFxt4qN5MWKY+1O693sTBzENvRkLfnJGz0rh8is3df3CAnWD1tEcS24OtparvfeZpol3JjbLrhXyqh5ErnU7Uu/U79ZPBKpVwmnChHQg/rqr31NJUxfWAlFaTzPE/ggneZh5fuvpIN8YuyTogS9ucjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmU/gxR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmU/gxR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876FEC4CEE4;
	Thu, 22 May 2025 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747916202;
	bh=janGegacipRDwPFRgry5bht/UiVsUU8rf1hprM7kBWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmU/gxR74WvXbSu+bOhy1qYNicRMEwtrvSuhMzYVKoRQnLi0Rozhh2dm9jiM1Yxzk
	 QWdD/d6klPn+xdjglaqvz73pTLsoJ/EipbUbYwAG9kwZhpzYFkI5SSzuFuRazec1hA
	 gIzZDHLb/yuxCB+wXFo8gUc3Pu8YGBu48jThkKMn1xfg1SMhmnhz5h9CvWB54OnVvy
	 E3DDvskbZX40AA3rTnNT4Xe7b5YyC3VLpbfypvUhTQT/zngu8S/mWjfYHpZT+4hdo9
	 PtMQ04s9OOHwcOUOD6sAVFxrEiDm6hPnqonbGPu97N5RiChSfYQlZ3bofxQ8+YSzTW
	 SlPz9RdvPZBmQ==
Date: Thu, 22 May 2025 07:16:40 -0500
From: Rob Herring <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Message-ID: <20250522121640.GA2192083-robh@kernel.org>
References: <20250520024718.142-1-kernel@airkyi.com>
 <20250520024718.142-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520024718.142-3-kernel@airkyi.com>

On Tue, May 20, 2025 at 10:47:18AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert cdn-dp-rockchip.txt to yaml.
> 
> Add new "port@1" property which represents the CDN DP output to keep
> the same style as the other display interfaces.
> 
> This patch also changes the constraints for "phys" and "extcon". For
> the original binding, only one phy and the corresponding extcon can
> be specified. In the new binding, one or two phys can be specified.
> Since the RK3399 has two DP-USB PHYs, specifying one allows output
> via the corresponding PHY, while specifying two lets the driver
> choose one PHY for output. This rule also applies to extcon, which
> provides the cable state for the corresponding PHY.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---

Fixed up the typos and applied, thanks.

Rob
