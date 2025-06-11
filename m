Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12F190497
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664359; cv=none; b=nUxTurVhPMfUNE4sGLtvCXXPxLK3M6z8eicNZKl8fUCy9yAKUMWXOmJyGTR7JW85eaZYJbrrOmsmtClghvDX1c/7qdBkVHO+KWc0AdAFlxIHqWcubL6k4nwm0XGCpFB5Exff+lqT5Y0KXNojSjOLHwC67l9N8dBkrcnOm8ri/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664359; c=relaxed/simple;
	bh=v3gfeWhWlgNnRcklEzn20GE/Y5B0cBsP/hP0KM4rXYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRrXO/CuRadzIHhTH5gvQx6OvFd7Q7MkeDQVCTw+APvvuahouufR7OJdBNnVaCYy3gpEMYTBQP6c7k/f2IVev+jGQeBMAMpoy1X5CTwUtXrx+zFqKKLrjdkN6e3Ql3h0mJSxuZ2GaDxxXw/fut+WE2i/jCcObD9fWexUryiif4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=WkGh9g68; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="WkGh9g68"
Date: Wed, 11 Jun 2025 13:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749664344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4xFAvj2G5VnN2oADUrjOMQLWSOzD8+mWMWxdA4/gXps=;
	b=WkGh9g68gWOHLnoNJXve7+hzhqKiQAdR0Rj2NXjDUlGVWZX161sjbqguO+g/sxHPJ0Hpq+
	KLWaJQh0bx6ndqXMpvcQP/Y3tnZVGEU7ZheePnFoegfMFq5p2wn/CraG//QBRUH032nazx
	HTPz8t4b+NrczcM3aEMNBf8xZeAaVnxIioyk+5t9SolpoofK9fGl/v4RJIFSe/+Y4FSz/S
	xCJ7tetaSPzQk7U4usSIJCroH6cbYALUSXstGLeSR+/Fk4t3usc3vWWZRoHdfMjy19Od98
	jql7hgU2r+FswNQ0YiQY7H7YD4ArtkVbBjV1RA2krIu5r0TsjfqMsKByaXa+GQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
Message-ID: <aEnCUycX_x1zNN1D@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT

> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
...
> +      - const: hw-cal-a
> +      - const: hw-cal-b

For me these descriptions raise more questions than what they're meant
to describe... Maybe "First hardware calibration blob" and "Second
hardware calibration blob" or something. I don't fully get why A is
opaque and B is not, I don't think there's really such a distinction in
reality.

> +    description:
> +      MacOS version the current firmware is paired with, used to pick

macOS
