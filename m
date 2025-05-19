Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F5372639
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639926; cv=none; b=B/Dts0g1bGwFN1IXi0VOz95N5kTQ802buXKOYpiNNO5ot/iMMKAg8Og7BqN1EnwC6uZwsQoFyQzZWmNTfXWHGq8Yq+sQfrm3I4Pfvoqz9OiufPHpwdA/K8BboGtbqeXVWyb/eK8KD6HykeOUN00qn3+yDZsJn7Yh87o4jqbd+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639926; c=relaxed/simple;
	bh=wmV9Nk3P/DCJitzLgR8F6v55Zaso5AOuu5tFLBo7mTg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=tu7a/baSJj0khcHVHKaLnlpNatxyHsbEy28VZj3gpnWgqXK7b5OW9yh/iA/uuVDwxBL3mDqImG7G4zX1BbTjExdB29f2zF+yorpGeyr7980WKeJ1fPgx4mkzvmZOjb4yHE2mr3hWfAjpn+G1CX/S+x0F1q+0kdg84pAWys03fcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK4lGIhg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK4lGIhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146C4C4CEE4;
	Mon, 19 May 2025 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747639925;
	bh=wmV9Nk3P/DCJitzLgR8F6v55Zaso5AOuu5tFLBo7mTg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=MK4lGIhgIA7t0kPZFhDFxk/bnDMtxlZX6DxbX+AUP57ZwsQ/HDu3ii1YzcO7+bHe9
	 O3z5coaXV1Q7WaCS6cP/tYb2FQLl228LDgFoOqDpc/G9LKd5/eNG/BvMqNUu26Evkc
	 28MU673SmN04cQ42rGSKUQroo29r2WiesLyUlndcHYxeDLtfnB3aIBeEb3BBmk7K6H
	 dJGXctX6f6meMAQ2r4ducoL4UcMTRLbqNra48qGbE9d12tJnu22yW/YgB2VpHVjNgY
	 /+6wdUAw7suw4fy7Kbci7SFbcAgk0ugZ20yzn8846IEUMj27znqfdz4Bw6qcQh6Oz+
	 bLERKumvilvHA==
Message-ID: <c8d571f42923971606646dae0257f23a@kernel.org>
Date: Mon, 19 May 2025 07:32:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 05/10] drm/display: add CEC helpers code
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-5-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-5-35651db6f19b@oss.qualcomm.com>
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

On Sat, 17 May 2025 04:59:41 +0300, Dmitry Baryshkov wrote:
> Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> and adapter are supported for registration. Once registered, the driver
> can call common set of functions to update physical address, to
> invalidate it or to unregister CEC data. Unlike drm_connector_cec_funcs
> (which provides interface common to all implementations, including, but
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
