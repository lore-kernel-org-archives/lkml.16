Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4571A23A4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641467; cv=none; b=RAhKNLk2LtAFZmZUOz+PGU6ThS+WL8toK/z/gHusUCE7teYhRbEyQ9ZVmy42Q8tnp9QlfQ0YuIBpT66wQQWEl0jkKAOFzhBk8mc0Xw7VlyOjx7jy7EqsI6l5WXpWpJUNxAy/Kw7kZXg5eWN8+c3IbewuNy2EUDh1kMiQHEHUN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641467; c=relaxed/simple;
	bh=7e9NChurz7rY3oirADLtp0CoVANmOBcPDXCDai+k1KY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=prLgnSXEaFFiJpQbrWjlwzBHbGmTq2FPBATDXW663W9sUbFG0225Br+GaKlj78OjIqzOdfHoS3YE9SLtheNO1/5/qOyQbmNn5THAUIL1o1KwiNFU2TnHaoAYNBCs9U7htJ433F2/DWQwtrNkeRsEHTYzKEoAq6mb1jKOd+oL+Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=by2iCWmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="by2iCWmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511ACC4CEE4;
	Mon, 19 May 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747641465;
	bh=7e9NChurz7rY3oirADLtp0CoVANmOBcPDXCDai+k1KY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=by2iCWmHwR+NLH4lc1gHYtbMo4rrQNh+Y/Q7Mj428EUYVPs9tFquaCnlaeinH4LZF
	 EwTcX+ggLHRVModdg0j7VCpmaFlgk+TbBhsiEzreKeqmkMmkpwvxXwwf6WGHSWlP9I
	 H+F6vtLfYg/YN21F/yVa5feMZpkorwKbc6d6dKquuT2ErLC/F0YdVGFw6fNkcr9PlU
	 +cxFcmdNaIT+5ZkzyP9ezAqYTttkcfuQX4hOG/+Z7IYFCYfoCiuACvU74zIBB6zQc6
	 +g3loBQIEIHTSoQ9n//hpW0MboXTVT4vdW/4dkKB6H7jA7kNKg8jhSYO3WWDvWBlJA
	 TxTho3pCRgpwA==
Message-ID: <f29b6348ec26850eaa4cfe2ee1c650bc@kernel.org>
Date: Mon, 19 May 2025 07:57:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 20/23] drm/tests: hdmi: Provide EDID supporting
 4K@30Hz with RGB/YUV
In-Reply-To: <20250425-hdmi-conn-yuv-v4-20-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-20-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:11 +0300, Cristian Ciocaltea wrote:
> Create a test EDID advertising the following capabilities:
> 
> Max resolution: 3840x2160@30Hz with RGB, YUV444, YUV422, YUV420
> Max BPC:        16 for all modes
> Max TMDS clock: 340 MHz
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
