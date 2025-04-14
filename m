Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC927A126
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641388; cv=none; b=JA7QSO65jCj7K5PHH+K9H09t/gaDpaAGtCS5wkGtEPCNZ8TimEkwUM2JMd0/IHrW/QzbhOV6sLLk0bol5XfcuJYn4l/lTxSiAikMZzZZptgiwCVWr99QY1xB4SYSVLW6gS7QaTChFa8oUKR0qJljrS0hxyNB5JEeADGyfUOASFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641388; c=relaxed/simple;
	bh=aOff9BPFO43gc3mX9Ira9Sxwu7SZfP2N3ALrH2jc/3o=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=KEUEUNcPHfOhwVTyHmUkNd5TZMYZCIWsYI+a8kokATLPBkWiu++yp2+6A1fXiZmds+vRY5HKx/a6e2k5pVwV9ViTLVvcu8IKW19cZHnzNTni7Pq3MBzXJg1MsEB6BMbN3RGUzWPxrb4SWdAr0UhDvsJ5towHFnhYso8Aakp6R2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuL/950z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuL/950z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD87C4CEE2;
	Mon, 14 Apr 2025 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744641387;
	bh=aOff9BPFO43gc3mX9Ira9Sxwu7SZfP2N3ALrH2jc/3o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=CuL/950zA0sGWmEpodNpZXLcloq7JPAb8Am77ZZh15GRiP6HCP8l8P06gE6s0aweZ
	 rGUqXUPfdfAK9rSEq+ccvUeo7uuRuJ7hm81quyzdzgJ6qY2iMOsslleF7pL/iL2Tv/
	 Iy0q53tnr7GpTrsSP7PAVT4Hs196xwD/Ozl+I8soCKUJnhXvrtEAeoJDuLDDtsLDIh
	 uba1faOJb7nzS5kaYDVElDB9K5okkLXbhekb3EypPDYO9eQYITCa9Wc9r/1UC0XQSo
	 OUJCdh3ueZ+gi2SmHm2WqPCIlKGV/ZWlDt6VnBGyibJMoYd0ION9NXQDZdH3Zd8ypS
	 7JnbmvyEOTq4Q==
Message-ID: <e0ea2e93061606a6a256ef8780797c31@kernel.org>
Date: Mon, 14 Apr 2025 14:36:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/11] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-5-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-5-04809b10d206@oss.qualcomm.com>
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

On Mon, 7 Apr 2025 18:11:02 +0300, Dmitry Baryshkov wrote:
> THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
> toggles whether DP_AUX_CEC support should be built into the
> drm_display_helper (which can be eithera module or built-in into the
> kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
> selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
