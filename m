Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9946269CFA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643901; cv=none; b=TL2CDg3tckVC3ROttICrqTCWjyXxGD1iMJU9fsqOYFkKoQlXJiz8WxyZ1zj47pVtW6Wx7tlNnvVbHwO8URopy9w/tDl+TRty9+gc2uIyFPjILRkrKAsQmv+Ivr6P4cU1pBUOwYo6/KwaLN8/2Hc08v4xUNZp3p2KJopF7dnJoX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643901; c=relaxed/simple;
	bh=2IsWKQAwKOCR7PFthlqk1dlpSS9+LEI+zhI50buMEn0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=fVBq4EFa14X83XMXpRrYVBItjqLvjpfK5aYSea2RgldmRF6HFNGNdS8Fb3p3E5DMezK4/klfI9Fq11wzLA8N8u/wbrvC7s85uXqXoTTiBO6NPxJ+W+19QV2XDKPkh3m3lFWpErhiONlalV4jb+CWoUQvdNyNdpHGpr4YOPGbkvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS1FVU2U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS1FVU2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EB9C4CEE4;
	Mon, 19 May 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747643900;
	bh=2IsWKQAwKOCR7PFthlqk1dlpSS9+LEI+zhI50buMEn0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fS1FVU2UK6je3qeLzUHnyYgFWWQvqTC0nW3p/wGESAZ0FZed8UVitWgo4rfc8QNbL
	 dtsoEs2mCkK0phl1M4aMtrfhdzGm5oyntnIYP8fc+z/xxxFcV+kAgZQk5q88SQC4wb
	 LDsqPVxe9WeB3x57LFlGsMLX9+4FIKGQafQ33cNwULr8GfqRgrGp/OBrvGPwyiZkvT
	 iOJ9jlemMHeEjhIqaw65wrGnqIexHx/rCD5uqmYiUafp542llINkeBnB/MHtUFC0e3
	 Arq8yqJZGcTA/MaIJxPI07VQfzd4kotYoMD4vL65/5M9cwDIDPw8ksj2FdfriGmcmH
	 VNZxzD8bU+lCg==
Message-ID: <d2608056aadd6bf146cb5ffb2ff6668f@kernel.org>
Date: Mon, 19 May 2025 08:38:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 19/23] drm/tests: hdmi: Rename max TMDS rate fallback
 tests
In-Reply-To: <20250425-hdmi-conn-yuv-v4-19-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-19-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:10 +0300, Cristian Ciocaltea wrote:
> In preparation to extend the max TMDS rate fallback tests for covering
> YUV420 output, update the rather generic function names
> drm_test_check_max_tmds_rate_{bpc|format}_fallback() to properly
> indicate the intended test cases.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
