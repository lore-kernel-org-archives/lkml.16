Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98761DED42
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660829; cv=none; b=qVQ+ea0j44SSn6Y7V65AjCazWDdRyAxM5zbqkdJHJZWv2h4cIV4/uVCs5rEgbqTzofjdUqQXXr1qfPU7WcG05EVW/ZmxzCy7+apEQqGmD8epeM9RIEtf8fSS3UEMIdzgBz4kbXvseTtQHbdy3DXaxjm9C4VVLbYa3NmmM3GTEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660829; c=relaxed/simple;
	bh=zCQz8reKW3Gzs8l9axUjAYNyAFFEzKogKMzC6QHOp6U=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Y1hvhcEEnP3XWyBbZCRP/WMwFeuP46PrdtC5OSSbH3prw1fGe7zw3LJyeldDwa2R20tZPqcV0XG3btauuQBIVSCuw3E/pf58PzUx3QHLF2icOtTbmE2bFjTRXS53MOuwT3PDTOI0yJm9mpX2TtzqMlzXsRmsPQNh9DXNo2SnE2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2912Q90; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2912Q90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23EBC4CEED;
	Mon, 23 Jun 2025 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750660828;
	bh=zCQz8reKW3Gzs8l9axUjAYNyAFFEzKogKMzC6QHOp6U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=R2912Q90VgRmdjxh2YCszp7rIYKaMkHCS8CKzIBkQjxDcG+IIpln3cdq/blnz6+1x
	 FqZGVwgeKaIYslbfkZAGs6PNAXIWUQP97e4lNuF6j13c5tZZ6ZoEjSdHz4w6KZA5is
	 WZTl7kWBug7pa5Ggzcq6Zur+UhtbUmI7IEMmcJLCyXP7gSFQcj/gi0xoiPnXyQ+JRz
	 GF3evS8XDy/jXjCw/avFjLk6UvC3hR0ce7C+JAjtL2eCN3pp8vf8qwGNmC1Q1Riel5
	 Ji88kedl/BpnjpLRWxx5/F+nz6XQHSkdfj05QR4rxRK8kQPgJjWdUJsyfd3V2hWym6
	 kVa0tRi+IR4Mg==
Message-ID: <dd169e5617e160873896b46e94f3d0f2@kernel.org>
Date: Mon, 23 Jun 2025 06:40:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 20 Jun 2025 17:59:55 +0200, Luca Ceresoli wrote:
> To the best of my knowledge, all drivers in the mainline kernel adding a
> DRM bridge are now converted to using devm_drm_bridge_alloc() for
> allocation and initialization. Among others this ensures initialization of
> the bridge refcount, allowing dynamic allocation lifetime.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
