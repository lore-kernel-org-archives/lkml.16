Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E62459DD
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639411; cv=none; b=IS3ZqjSjGe9dQWE2mYF1e1yMwUtdJzzOOQkoJI5pNA+ggs0BlqKdh3jNwbj7jcahpO4doECP/J0jOYTPyCgre58LkQg8/PJj4be9kgoCBJ1EK91v+EADkN7mEL6apHpx+shgBAdlWBfJimDLMQRZA63b0y4XgrbZYf16SXa+O7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639411; c=relaxed/simple;
	bh=SHc0Nb1St8jt+FbVbFJo4ZDsCFKIWSKrtl56Bf8Qa9M=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=qt9pTol7ycgiVNKCMXIQLJfhWKRp8Wp5Pu6/eMfT9fb9YB8ob4PMMLDAiEx2jkV+bDtZeVcyveGuUIE1Zo+sU/5v2WX5KQ8UtYnADSA/e/lxWHzcdJ7RWnpv+EnT6diJlnBFqa9mUpXoeSREXEU0gJrvXx/sj5v4rbXZB0rP29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlMYPq2o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlMYPq2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F95C4CEE4;
	Mon, 19 May 2025 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747639410;
	bh=SHc0Nb1St8jt+FbVbFJo4ZDsCFKIWSKrtl56Bf8Qa9M=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=DlMYPq2odZFjGkfdqR6pIpKSlqASYxR+dpTCDkIpB1ipKwpjwGwmf03DLkaIqBxFf
	 Qjy56bWZdYOC8nDoMGs+2NKU6Q8E/lfELZOs8/w5cbXx35EZvC3C+0oqdnTcy3Cs/C
	 ef3f34mJxw8U6mHUAR10S6o/MqTzOHmjfcJJbcQvrJb/F/JVOGKSSDDeJmsGXbm3a1
	 PDCDIy4ph/xidYJe/oxPP5q/Aa8EdzbnKYY1dvmnAKGGzw63CWvjg8iv97n+dpihkh
	 ls6RUctIt/2p1hZPb9FkhE/3946TgPd1JB31/ThM5sonvnKs+oUyfOLq3S0WpnR3JS
	 iO0QqoMaKllvA==
Message-ID: <820007abbd94a483350ffe0023b58043@kernel.org>
Date: Mon, 19 May 2025 07:23:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 16/23] drm/tests: hdmi: Switch to
 drm_atomic_get_new_connector_state() where possible
In-Reply-To: <20250425-hdmi-conn-yuv-v4-16-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-16-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:07 +0300, Cristian Ciocaltea wrote:
> Replace the calls to drm_atomic_get_connector_state() with
> drm_atomic_get_new_connector_state() for cases which do not require
> allocating the connector state, e.g. after drm_atomic_check_only() when
> the intent is to only read the new connector state.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
