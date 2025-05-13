Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED329ACDA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143923; cv=none; b=eFiIqrxZd4aNmuYHUEo6dgZctn84gFhGyw3nyPh3yq9RACiDnRhSDs8Lq7lpzv1orWF8VNGnTNI74aUBpejsHU4k5nOZebo97qtHi8bK4/FZcaEsK8yKzaDW0lHM05yspM7qz2BG2Jw55FgA+84r8Etyjw0JZYcZqoIggHWgHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143923; c=relaxed/simple;
	bh=wyi1K/mQRKcgeOduClrr92m+zGYgb865V9MDCljrAU0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=fh3gt10nzFBJHDncMj7mbihHJt29SsSXHR/ySl1qa1kC84a9pDM+4ZtVlfOHYzPJOZp+udkPAkur4PpZxWDR62j7KR3cAiUT2AZYBHk7xqCkcKu+sraJULat7cHcRChMk8RQAfKBO6aBByCtXhnLjk6wyGQSFC3n3V2jKJLeNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCT+qWEn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCT+qWEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A84C4CEE4;
	Tue, 13 May 2025 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747143922;
	bh=wyi1K/mQRKcgeOduClrr92m+zGYgb865V9MDCljrAU0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gCT+qWEnhoVeMeiAsPNKDC9o504ET0alM79BTkA7vosEN30Qr4j2W3/vRpl2DIpR8
	 NkVFsHs0N1kuaj66z3NhbKh4XMjq6Yq0+knkmc2kgfnc0inWWF7kEf8rftILt6SGXT
	 ipYCxmXLV2ltwpqzh4HhwQXH5MbwJAThrAI7/xts2PbMLMhDy3OUQkmSk83qnRMcg3
	 4pexeA7ETGmrsUBnoB/q2AFQz26V88AF2cwQjo1KMUowCahiMZk8eVVQ0+ZJEihaoE
	 8gHK0TSAh6n3aiPG3mcxVrsLvtSJq3NuiV1lAzdfsbWg/Tu9g21Wbgflr+K5AiNQYO
	 V3xGDIq9K+FFQ==
Message-ID: <5f8954e7cf2aa2e2d61588ecb15c4c4b@kernel.org>
Date: Tue, 13 May 2025 13:45:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID
 setup
In-Reply-To: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:26:59 +0300, Cristian Ciocaltea wrote:
> Factor out the HDMI connector initialization from
> drm_kunit_helper_connector_hdmi_init_funcs() into a common
> __connector_hdmi_init() function, while extending its functionality to
> allow setting custom (i.e. non-default) EDID data.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
