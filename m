Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3413AA31
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854849; cv=none; b=hItiDIPeX/thOTE31ujytRtdfB0lY6Fj5n6FDAfPtKXY0//Sd2KtzXIdA8zH71xdWLKwIuYHHCillh0oTb3VnZQ0Mj8V/YFwnt9etD62zDT9aL4AHzE0yhdBp/gbqRhMYZX3tbOLJyUqWv1dR9rpAEAQNJkwblQxv+DaIALHh94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854849; c=relaxed/simple;
	bh=0hBwvoxh3BG0lGW2hjquqO/cNNQ8t/KhdZFDOIIiOrM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=VCnFVnuIyKPhlWktzwJKMB68lpBp0NTUi9RylQEp2Fc0m+YPLHEsjcKhnbPyZb9xdxuGEmrsoa5j1omSrLRWToOLyuj1cIj1EMlLJCI7rrWwXOqKqXzsNf0pj3TjT0C668SQoc+cDpdbEfJJWVM0onarilmgTGkWx4ENrt7b6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2BHSymk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2BHSymk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F469C4CEEB;
	Mon,  2 Jun 2025 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748854848;
	bh=0hBwvoxh3BG0lGW2hjquqO/cNNQ8t/KhdZFDOIIiOrM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=s2BHSymkg0sfbq1HuhUf/k2UUWXkEwRFYYSriQyrtIrYIoDGfV2kBrSzRGscBwpOe
	 jMAUadFkWKIAV2EinZfU17LkVhQRs0RdFs7bduKhXoXJJap8xFcI8pTWp4+pOOTngb
	 YvDy57+XIDyICTQE6hJyRCS7D6T9ysoe7+TsUTjv014BGO5lpAPzzwbE9UKhXwcnPh
	 q7kENBmaoOgFUB+oqmyD/oyDCEy9KS9+3Idxfotmz+JcLRk9HTAu66pUJpaAyLL+5i
	 j/5ztFLC9+iI2QMHn5/Jp/izTflVFJsPQ3iPJZ4dZBEBMdX3GFILXn8F4I0CJRKTY7
	 LRWAfR3I6b8WQ==
Message-ID: <6423ca1050404aaa9ae3f9964ba98fc8@kernel.org>
Date: Mon, 02 Jun 2025 09:00:46 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 06/19] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
In-Reply-To: <20250527-hdmi-conn-yuv-v5-6-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-6-74c9c4a8ac0c@collabora.com>
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

On Tue, 27 May 2025 15:11:14 +0300, Cristian Ciocaltea wrote:
> Try to make use of YUV420 when computing the best output format and
> RGB cannot be supported for any of the available color depths.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
