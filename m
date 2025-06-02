Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B837F1DDC2C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854757; cv=none; b=prJEiQ/2j6AkTyFh00nxsxp6aju8g5GHcoT4WXPBSKoR6CMfP6ia8JNDesO4ZYZDChF52a04PrCxPB7QiEiaAnPxk7UH66gnB9vlT1w0AoEHhu1qCq9W0MSnoe2WSQlTLpsifXVIzGfZQXgtyMqgpoMcgtZxkPgs7zxhInbxXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854757; c=relaxed/simple;
	bh=XZCOsftu8I0Hs4VqzNzPuwv0qQ18wzBRVFxh1sq0q+E=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=MHFYCujqSUIlwkocNHqfQIqv6HfB1zsuHB/8PSIxHwTsfGE8RTNITbxn24SHX/GeTUtgBmjSVnC8eZ4L8ipFRibDGKU9l69xB4XfaNWkepMWYR6bWoMwO4rs5G/Vh1QHo/VlHlINoPvgFQ/pvmXmX2V+97p8qBI8gdoiBjae9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln79G2BR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln79G2BR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC1FC4CEEB;
	Mon,  2 Jun 2025 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748854757;
	bh=XZCOsftu8I0Hs4VqzNzPuwv0qQ18wzBRVFxh1sq0q+E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ln79G2BR6whNL3ck4KnCPm9lkcICN6K0trchA5/RYf5vAKbeKjkj1ihtlozSKWGNf
	 FTARXIRzDv8ezskyFMq4ptzyrw2XZ1vNF246+KAVlVlWurHiM2U3Zlz4I9BxvCy+ws
	 VB5gnQc9BNNbWMV2iMFvsBzd6G/Ibw0H724HV9UozZqMmAqvsfLb9vtfLTrR6qhoii
	 fYHUqcabuH95NtYZS36XjO+53sliadhFkaiY7pgDsQegQqkeBWHLy8lxcHZnAX3mbH
	 h21Lq9/lRHHLUBayiZKl7bDbw46gMP6NaWOEaQOvJyPbgnDE30whdcuITIDHKFg06/
	 ds1n0d1Ch0S8w==
Message-ID: <46713012584b1d88c6e2e2bdfb418129@kernel.org>
Date: Mon, 02 Jun 2025 08:59:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 08/19] drm/tests: hdmi: Switch to 'void *' type for
 EDID data
In-Reply-To: <20250527-hdmi-conn-yuv-v5-8-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-8-74c9c4a8ac0c@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue, 27 May 2025 15:11:16 +0300, Cristian Ciocaltea wrote:
> Replace 'const char *' with 'const void *' type for current_edid member
> in struct drm_atomic_helper_connector_hdmi_priv, as well as for the edid
> parameter of set_connector_edid() function.
> 
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
