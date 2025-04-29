Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E39A270EB8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933349; cv=none; b=BcNbrqb34SCsRoDST+Gq0cUffJltkjM99x9aFLEIyn+dVB7qwP2TILRsmMqBV/xVDQgG1URTbrniL5qdE3t8wXfDnnTwdMuYpcmES88r+yPEvGHbK3E0oDU/CRafilJPmDWaLYl2HdvUE+dPzvcVA9wQbE3yynjdRnNEMID0bxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933349; c=relaxed/simple;
	bh=QV4YByIzP9I4bKgAUEqZQnDOeP8ggRVUxaTKA6l9XAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qhx4OE3YNmfJH7Osfp0z+P+2mVhYo9MLWQb495TzD8uSzmaVOHfIIQuNE6mOD4wlpDWYXnFm92kNom5xYzhUCnQnoUPM/HQalFFtT1C0vvAoscD2F75m+XWOLDpc9ILErH8QevXtrVAbegDPVGqsuGLLzQpiSnDLwBOHux16ZAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=nMjKPaSH; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="nMjKPaSH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745933345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t4N43kcq+EG1O2tabi3Z0JaJWUv3qgGXlKWPJrpiSI=;
	b=nMjKPaSHK33LAZsqSyqODSyU7VXu92qKWBV9TzlQhDIFdf6IEz43mR9xXfTwrelImsxcl6
	SYT+/WdHvLFejBzuMS6qt0W4yBVaeGx878tRa71g34jmQCTTq0qZxjajTKCV4gxb1viYyq
	WMogfNGpWlxIgfkoYMf+1dPURYzQwF4Nfc9sIciI3PoB9kA94XCNPeqK+AexW5tUrp+B6n
	iboa+eSraBWHHF4a9P2ABr0Itw5NRbQ0W2scEws3bupxTJQjOpxog2HKf9VizF7gA8VuYv
	kBdzV+DVCC/itIPJBgbv2hJk23ZrGq8ylsmtG9S7foeG1WpDDEzXJFS/rv+uAA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>, Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250304-drm_debug_dp_mst_topo_kconfig-v1-1-e16fd152f258@jannau.net>
References: <20250304-drm_debug_dp_mst_topo_kconfig-v1-1-e16fd152f258@jannau.net>
Subject: Re: [PATCH] drm: Select DRM_KMS_HELPER from
 DRM_DEBUG_DP_MST_TOPOLOGY_REFS
Message-Id: <174593334421.31053.2925170432781781609.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:29:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Tue, 04 Mar 2025 20:12:14 +0100, Janne Grunau wrote:
> Using "depends on" and "select" for the same Kconfig symbol is known to
> cause circular dependencies (cmp. "Kconfig recursive dependency
> limitations" in Documentation/kbuild/kconfig-language.rst.
> DRM drivers are selecting drm helpers so do the same for
> DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
> Fixes following circular dependency reported on x86 for the downstream
> Asahi Linux tree:
> 
> [...]

Applied, thanks!

[1/1] drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS
      (no commit info)

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

