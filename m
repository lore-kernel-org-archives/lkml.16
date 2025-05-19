Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70D74B1E76
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639935; cv=none; b=sxT+6G90B1QOvTVQktEiFWLZgfwgYxQmfv3V+XjvZqjpnjE2W/GLOBJuwhx7qF33NjIgmnTUYhMy7Jzssvbr1UPnLnCcCDDe1WxDbSoSHOzT0o4ObKdMs/OVeceUAt/VDkUPt8bMX9aRmhSRoVgXfwnf70yB4kwAcc2HZnXniaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639935; c=relaxed/simple;
	bh=9KcIlxiyFV6HmPWWWgrjFCEfEvyEUAzr3hGhU7xi/+0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ilzEJWQY1BjLx2wRAJ/nOQDMGbSXYNUj5+p0hYIp1D/aBmKKS6M4YTYwS6R8p6hyH33neRNoky9ZGGEkxs30GRew+ym7gPhmyITWYdo4ZKdSPCH3OnojdztGoG6//a6Do2ArruXHYBxYlVsfseHfNJsZbdImLlneQyRzVljXuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phek9eAa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phek9eAa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A0DC4CEE4;
	Mon, 19 May 2025 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747639933;
	bh=9KcIlxiyFV6HmPWWWgrjFCEfEvyEUAzr3hGhU7xi/+0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=phek9eAa05F0CFybSrZ8B9zO47AcbdY+ip5nD6Bek6gv1D2wOn20L+qPl84W09/66
	 jNaqih8tQXCYpBBfGP09n2JKsKozwj0A0PaHq6K1/cXO1ZRWa0No7OEwy+77L6LCZZ
	 QApkxp9/Ybcd8WpZhgPM+WudPyNl1jI44Ohz+aExJ/j5umPH2FvFcP9f74hdJVEZpq
	 9HdA71m/1bgqP9Ib3+NOpWeamTeROSy0LPajHEoTUT5pR1rPPwp5u6+3q5L1GAjI3b
	 i/2fztJ+8yHQHD2LPh6nmFFtbBpqdIsEn6rg3E7pJXXAHszwqY2Og3hNLHVMLyZi5K
	 u3xrXZHpH7kgA==
Message-ID: <6048aa6f748b965571ea6125eedc6ffc@kernel.org>
Date: Mon, 19 May 2025 07:32:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/10] drm/vc4: hdmi: switch to generic CEC helpers
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-7-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-7-35651db6f19b@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Sat, 17 May 2025 04:59:43 +0300, Dmitry Baryshkov wrote:
> Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
