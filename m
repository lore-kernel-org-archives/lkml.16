Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0B7080E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664486; cv=none; b=LPo8VBzJ4uXlRZAFhsMDjmnVfZRxXjDwNqRbAEx0Wn2qgRYXLhqiRcXSrGpxviAsMoc4wieakSXEfTHuZKave04j19f1PD3g46ziSzQ3Dq3QYXA859EyTCtFuAErvTL3PYifPVKwtv8cTzdzgdEReoJR2ls/yP2mLUOmpEKjjtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664486; c=relaxed/simple;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gURxEeqoS0QmBJ44tptG0qdfJ7tMDxprn3/MzO+Zf6/+nmFLHAMRd6eXA126JD1NqGc1wyE3/xWRJ/Z5d6rN8+zxf3SHOg7vIQlmO0EHYEGRTU4rh9mgU5WcRAvBUWRfrQcPOV/WQtMPxA2MXif7O357im3RJAS1lCw3WxAohPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=R2yckc6b; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="R2yckc6b"
Date: Wed, 11 Jun 2025 13:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749664472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	b=R2yckc6bmzZk4s5WE8kaNgGeZlyfwhXLd8Za/KDmBBgDom2THZmz36Ym3HMjwRgBVG0rWb
	vMiknBmb0KbudvIGthcospMNqqc4sWJfsOjGLl4g4FK9GOHZHwfOZiBAYtkwre3kxYW21V
	z/SPFz/+eXw01gb9S6WqkxjAoewGkJ+fdmRQ5thRQUq3j+6mYlHW4P1GJX9D5t92RWSxqB
	wXz8RyLPexYeBIb3dsHnrq7uciaQTEeNAhp2MiDvjw6v13Db42a3ME4CMPgIAvVBHPoDz6
	YPDa3of5HyHXPXvZtNumP2hCVvJtcynlemUhaFCzf3AXf54vhecjj4lv8uN4+w==
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
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
Message-ID: <aEnCthA1AXrWqxEi@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>


