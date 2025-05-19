Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC1266EF1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644064; cv=none; b=npQtwpmzlcR9sIZbVXSR0jfS3OUPf+SB+JoLE/QYkl364ejjnjPKvCzcoKuiy4PHNVJnU7UICmNkCaZsEAzKxUsSfX5OvQcev4PyNoQ33s3yJYRsRNPK5AT8TcBTjn4lL67EB/kVzwu5UmSJJmDbot8fT1dYPqdnN9EotVDIKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644064; c=relaxed/simple;
	bh=zXu83HtMZbcOjraZ4lEOlHkQ8dtDMv48+h2HD5ANg6w=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ttuELEOzCdiAMyHgynIrCYLJruq6l+jZwfcymal/Ka7nRSwwMUccElcblGAlJ1QYv78KgXBOmD0cmmgLgeW64o8eETpgXZre7eNUBlKQwWx0d4H2e1XnREWeON7tvAtMtnPBkaKoBfxvyV4tNtyxDfteae4uT3bZ3TT9bj+u53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmiPJYTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmiPJYTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24143C4CEE4;
	Mon, 19 May 2025 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747644063;
	bh=zXu83HtMZbcOjraZ4lEOlHkQ8dtDMv48+h2HD5ANg6w=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=SmiPJYTHZ9HhcCUys96kA2j0J9/NfN0/+YmR1H0NXIeEHw0kjXT7oAP80+T6fo4Pt
	 1N6CptYrlOQBnhYA0VgvLvJKW6Rn2Ya5bsiZyKIbymI1abUhQL2CEDJ5vKkK2m/RgX
	 3WJ7DNRSN4SBGaAoOWu3z1vXR8OZxMGp5nqG1lPeN3WK3tRkhKTtwwuDmDKsO4ROYB
	 w3zc+jStaU20CvEEPVAsv+n3+qn0yooAbCfDMYIfnn4mfs91Y0CJLgVWq3BShh/8yv
	 pVRV18ZqTltXyGFPASvapulSK/lny/ih+wBb7SC4A1EHdttDvhZgpizG+NzF4sJTGs
	 GODjrOYgj5YGw==
Message-ID: <c49af22b1a24d4af6a39875ab35673c0@kernel.org>
Date: Mon, 19 May 2025 08:41:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 22/23] drm/tests: hdmi: Add test for unsuccessful
 fallback to YUV420
In-Reply-To: <20250425-hdmi-conn-yuv-v4-22-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-22-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:13 +0300, Cristian Ciocaltea wrote:
> Provide test to verify a mandatory fallback to YUV420 output cannot
> succeed when driver doesn't advertise YUV420 support.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
