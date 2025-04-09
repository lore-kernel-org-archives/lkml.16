Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BC266B60
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211738; cv=none; b=TMQaVP6x/5WDctjmvnPzoKM2MsBq6j+xc/DiUsLRk041PG6ECgg9GsIug+jDIUnKzsfPT7NWWARqkMXnViphCZtKsHJlIF/Ay001NSX30vskSjc3O3q7Hb11lRKFrYdU2znkbrGx39NaoT9HZDHBlaFRz9QeoQKbc+hgQDhCBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211738; c=relaxed/simple;
	bh=ijk8EHdNPCzS8fw2wIGDYZPPz5dns1bRD8VMGPY02Fk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=GHm1mr6p2UvKIAFilCM7kGnaAi9vNFLJ5gx1eCbnYJJGj55p17OQrz5Q5sF1q03tdrgwDgRiBzAYOcLXLTz4cb1aL8vogDUjyS+4yev2iKruKhrP4OXLS9M7P5jj7HEgLFs3t540ASwjLPFgO5B9Qj5jASpjXY0zy/dvx0vlV2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdod68NQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdod68NQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90164C4CEE2;
	Wed,  9 Apr 2025 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744211737;
	bh=ijk8EHdNPCzS8fw2wIGDYZPPz5dns1bRD8VMGPY02Fk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=tdod68NQ/Pl+STS253Nkxk/XgtltVIBAlgKbwgQK4q/1daELzmh9xDRMbPXXKRDHZ
	 UnqYeXN1ljn+3DVA0GZxXrQqUdkTXSu5wajAYhmt63RalHKkTZQKt9wuE2xDXUUL9o
	 s/HLFtDGuA+BYrPPJNtjpnqGS68N6BIGO/FnkNPiW0Q/dm552/5/CGdeV2/DnROySs
	 aRe6CVQFHW5cvkP1hi+CFAlIhkzVKqO8E1VLwfEAk83aw3dqAX0OtF6vv+bSoiHMfG
	 jVI9QgRvfyiRP9989PmeU9Wr18rB3h84vE1XP7SCt5rMiXtlsNhTSHGbcw1ZCSN/wi
	 q9ZoToCKnjSLw==
Message-ID: <9281e95d084cfe6a3045bfad8413d9a1@kernel.org>
Date: Wed, 09 Apr 2025 15:15:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 12/15] drm/tests: hdmi: Setup ycbcr_420_allowed
 before initializing connector
In-Reply-To: <20250326-hdmi-conn-yuv-v3-12-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-12-294d3ebbb4b2@collabora.com>
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

On Wed, 26 Mar 2025 12:20:01 +0200, Cristian Ciocaltea wrote:
> Initializing HDMI connector via drmm_connector_hdmi_init() requires its
> ->ycbcr_420_allowed flag to be adjusted according to the supported
> formats passed as function argument, prior to the actual invocation.
> 
> In order to allow providing test coverage for YUV420 modes, ensure the
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
