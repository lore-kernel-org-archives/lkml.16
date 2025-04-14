Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF1B2472AF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642777; cv=none; b=UkGmpLqIVLJ/98OnrW57YScE2DcaOqd/hTiZkphtQETiRN0wvn++2i1/jI3JkT7wQnmzS7wv4jC3eq0ueRUjj+m3cEO0Kd+AqpLjMIBl/EuY+qyCuszp1DJjS/f72nEKLKli34mDJrE92KhscXGSfYvg1gnHaly41QND5ilH72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642777; c=relaxed/simple;
	bh=JSlOKcGzOB2r3JhN4Ys1jzqMScEKUVnNyxWGTdDmiyA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=o/N6grhQDNDV1oHi/LiAkOZZrywVcpa50o726nkOGiPDL3a8quwZphGZPx11Q5OIpEtuonmUzSJBg4yGIu4Q39YXC5N1sc2d+AgHXsamayoL+Lrqmu3DuVoJnucZcppJ9QMuO9NFfSHKCoTCNJyQOkNJde1T91oOAsWjppkAxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGz6WlpB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGz6WlpB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02659C4CEE9;
	Mon, 14 Apr 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744642776;
	bh=JSlOKcGzOB2r3JhN4Ys1jzqMScEKUVnNyxWGTdDmiyA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=NGz6WlpBLaoZ46HmWPIZrFI0Aus97Xqr4/xOdQtqvh7k29vXfbWuw54L9jr3om9O2
	 UgKILDwIYZOc7xiMjsUspq1PCM9I8+EnGb2ysEgOU2FXL1Td1hORw1f3GiieAlx++Y
	 JJa522eeygG6XLYNPr6E/I3hIR8ly5mbCkV4i++5NtECB1uKJVZ1suu+By6ItNG2ZE
	 ZF8MPlLCyUsmKohr3iLiov3Vl4PowQtmNwXY3tVQPfO/BfnjGHvAziqm+UJX57hQ53
	 vFHmFk3P0IVc2R5sXZRBbI14EPz3BtFVQ8ntF1hijGwB9VYtDZJ/QbsMxD7eCishvW
	 Q93qsc2opai7A==
Message-ID: <0b514c20a605ed6abd4b5b9bd925cab6@kernel.org>
Date: Mon, 14 Apr 2025 14:59:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] drm/display: bridge-connector: hook in CEC
 notifier support
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-9-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-9-04809b10d206@oss.qualcomm.com>
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

On Mon, 7 Apr 2025 18:11:06 +0300, Dmitry Baryshkov wrote:
> Allow HDMI DRM bridges to create CEC notifier. Physical address is
> handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
> being called from .detect() path.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
