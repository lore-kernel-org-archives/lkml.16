Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF3268FD0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211051; cv=none; b=h/oUxRnr3j0vvkqe+BAkL95EqbWuyTA81SkEaVkg8Jv6Pmm/eqjvggMek+8SuQglacuU6IQYUE8fmRrdgD0LxP6o/n5QwYFpG5DT0shFHduBiadH/ZfcIyZAiUgDS3NXa/Zb6lJmATJuodCGIxkqlz9yl5zvfC4CkmD97WLf4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211051; c=relaxed/simple;
	bh=ON0n4JmEub+ePDDDrF2PA+G7p7S6y4i8ovbZ+Cx9KNI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=NOva973njlDU7PdNabqcHRlGyHoNGOuc4pGkxJw7oS1sXFPE9iw9+nIdDmespxBNRm+XzAAafudVQmbz9bI79ZrCqwMvO+HHlGUzn2NdgqryVr5OYb9Ay9RBH32P+9wPFxLvAGzB5NpcER5YUABXAW4tA9Kkjgjq7tRY4RipxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2mEN0nX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2mEN0nX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CD3C4CEE7;
	Wed,  9 Apr 2025 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744211050;
	bh=ON0n4JmEub+ePDDDrF2PA+G7p7S6y4i8ovbZ+Cx9KNI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=A2mEN0nX4ouML/QJwmNwynpbX/oNLBaIhxmqqmd+sc7qfdOQ1zt5kVW0/K1ZWg1Bc
	 xMn6pregIoF33OunYfNY2XihIfHSxvaDgPLfVtqXFMJluCV6fdLzX+jm4yWiTcMFhr
	 WpKbwhyaaUeOyjB7Jc1sI3KIg5tO7NhSmZ/4ZLvTzpkB4+w8RgzOLpY6d5l9la1R9l
	 4QSbizHli01IaVyGzqv/9RGhZFqml+YyjUiOySEcxu1nD+WzebIzKNLsqEyHBuKR5x
	 le8kY9LR9592K0ZgyVDdMhRQxLmbzlAhWF6WhbX5JoyyG2/UO9wVU2X4ZrZKHPkOnO
	 +ftQF0ot7RHmg==
Message-ID: <0e79a4c685a9e383303f35911a80d28b@kernel.org>
Date: Wed, 09 Apr 2025 15:04:08 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 02/15] drm/connector: hdmi: Add support for YUV420
 format verification
In-Reply-To: <20250326-hdmi-conn-yuv-v3-2-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-2-294d3ebbb4b2@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 12:19:51 +0200, Cristian Ciocaltea wrote:
> Provide the necessary constraints verification in
> sink_supports_format_bpc() in order to support handling of YUV420
> output format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
