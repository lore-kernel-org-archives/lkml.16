Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C711D6DBC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192407; cv=none; b=OFzbErhuz+fTP8mI8way2AMQXROk/JKBg0np79v6PJpi5H7cvs/3Zl/H7Ndti379xltaMGzbRpJs7v/jtoK0ez3waS5nIaP4/vDhhoF9sMY9AenhFYb6z6dPDXytF0IC5H5WizzuUjva8IvCPKmYCVYj5FgAm4oKW/4BEQzsVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192407; c=relaxed/simple;
	bh=SSJ8+LNI9Ymj03X2elhN3Ny3K+NdOwrpogHRolCuDig=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Gp5+8EWY3RffnFmtDSc2xiufCrniWsfgv2ODnF/KU65z0gAiT7gswWr0mWBhCP+9j8oydPgCvswB7o3dqkYDR7QXUrN6rnkeA3JJDWmmj4dIBwFy2SinKgaZboO6rwDWqazmcQw5m+oNTRpnZ7p137LWGRN0aTEFKfvj35OsthM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djWdzQU3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djWdzQU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D87C4CEE3;
	Wed,  9 Apr 2025 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744192407;
	bh=SSJ8+LNI9Ymj03X2elhN3Ny3K+NdOwrpogHRolCuDig=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=djWdzQU3aKU1sVuiGi3dARZouB6OSwbkTkV7zKyRC9t9no8iON9JZM3BeQfaJDDWx
	 nB5czlqQknCOcMXUdHPEjYJ2BLXar7iKBmX5UY46pWOIyoYmLbUWLv/EcJ13Fs2PDB
	 GeZu6FOcEBCXjhDES0vG4V7nz8mxHzG4aLCgH7xtd+I21s1RBEbB8+T3snZaybaCXC
	 sgJRsl4wfl4KQFbTWB5cZE6vA5fzZWwplh2cCbsYKfRrOqCSByPMdwSG4d4oCwEYwq
	 oiT5cnzePuL3k2Dp+VUBb/92kJcBot7ffDTUtZFiFzqHIoVFTKyjjC/bJ0WaJ7ObaT
	 xZ9pawpqMdorA==
Message-ID: <7718bcfa86013d711e209f65ee398c3d@kernel.org>
Date: Wed, 09 Apr 2025 09:53:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 2/2] drm/ci: Add jobs to run KUnit tests
In-Reply-To: <20250409061543.311184-3-vignesh.raman@collabora.com>
References: <20250409061543.311184-3-vignesh.raman@collabora.com>
Cc: airlied@gmail.com, daniel@fooishbar.org, daniels@collabora.com, dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com, helen.fornazier@gmail.com, linux-kernel@vger.kernel.org, lumag@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com, sergi.blanch.torne@collabora.com, simona.vetter@ffwll.ch, tzimmermann@suse.de, valentine.burley@collabora.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 9 Apr 2025 11:45:39 +0530, Vignesh Raman wrote:
> Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
