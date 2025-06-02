Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB01AED5C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854743; cv=none; b=jTbaHQuJjySIa/N/ibAVBOuNcEGNloVDbrQNQyK/7O+rwnDOjZ09AzxI6LuyCDiHoL8//DAqgYl7h1FusoozA1E9UaFoCpNeFAgMy/Dekua3NXIwTYQjGq6tktsLaAo2h+LX3bs0qp5fjknTfxUlC4XJxpC27qdPsH/hnqMsTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854743; c=relaxed/simple;
	bh=hCLzZJlR7F87Tw5TSuj9Wz5Oj9sb8/8omKIuRiWZMG0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=a8xrwDWjoYgf0NJ39z/V/DBsJLLGxdh9eWiZ6w4mM/qPOBb896ALzENBiK9ak3zfkuntF8FiCxMihMxXvWhhHvX/DJxCUTWdIzFmn0nYjXhDCw90nyMrJOCdpA0buIqLG0aQnCOjyc+UX/9xrfjzRKkdws6szk4kle0dSN+hSZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upXKpJiq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upXKpJiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CB4C4CEEB;
	Mon,  2 Jun 2025 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748854743;
	bh=hCLzZJlR7F87Tw5TSuj9Wz5Oj9sb8/8omKIuRiWZMG0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=upXKpJiq7r90SESNoWtXc1uZhoTPk1z+ES2iEGRBDHqG9GERoeVsINyi2Yr5o4HU4
	 LI/I2VAuUBVlCKxbzi+6P/if735SVT/n1Yyuxy0CZyJ+R7t2rkPP8/zSqJhxKIt2IU
	 NoNQnQyWcW677/4sKVaJ1TSPh5Iv7Uy0k/ogNbS5Y9Edv8StEDctaGUcQTkF64Ze+j
	 FhDeI85lXQoiuB5FpdjYL6NIBslwTtSDzDCPKq6/LrZgIurJ99204c//zPn1DFkBUg
	 sHS28bvPUHyCnZ1RnDDndkV3nH+V2zbLz5QxjN50WdDoUGyzwsPl8BqNN4A/gLxuiU
	 D7wh4eTs8B7eA==
Message-ID: <56432a7b04a40699d749723b68385c8f@kernel.org>
Date: Mon, 02 Jun 2025 08:59:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 07/19] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
In-Reply-To: <20250527-hdmi-conn-yuv-v5-7-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-7-74c9c4a8ac0c@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue, 27 May 2025 15:11:15 +0300, Cristian Ciocaltea wrote:
> Improve consistency throughout drm_hdmi_state_helper_test.c by replacing
> the two occurrences of '[_]MHz' substring with 'mhz'.
> 
> As a bonus, this also helps getting rid of checkpatch.pl complaint:
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
