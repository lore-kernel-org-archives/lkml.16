Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C69238157;
	Fri, 23 May 2025 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001545; cv=none; b=qflh6LcJQkdypEorrnuTmzaouKmyh7aLBb+PpXrTy2u3NkwtlnE/EAB4sZuaqCSRvlOCqLIcgf2dLX3QFekUmM6cRP4Z5iydWKAQ79ZFIgiFJgFSF41wNBvw0eXcTjhESyHUcfEYVhoNNBuRMGqkDkYR/40enVL4Nt4s0N8QFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001545; c=relaxed/simple;
	bh=L/oF+HuUHpDovaLplgEEobJhCmRhF+0OByIxukce9ZE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j2ytgP6b0qcqpeZTk/Ax/kKk/TzKqpliqYwuHHfOnq7MLz6YowunYt6UhdaARctQDm/LJcWsgDBoBr1Lcxwk4Wur9z8AovUxe/uFvfy0RaLsWTB2Ko7xdL/ONjtKg2+qEWuhso/StbO4V/lXWDMaHXcTMD6BjN2hTTjQAimvBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kTt9lQ7L; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kTt9lQ7L"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A58D541F38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748001536; bh=KM1++pXYBhtAAWDBUXHsFQxXUKcJo+l383CqjWyzFB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kTt9lQ7LSaDD7BiJKFvhYYZRRpEvRZazu2hL7x2RCXVkLcGKaqVTjO3WiSMFrZA/x
	 nFl5a+EzSImMHqYsyh1EZKuGCt+z2BBqi+hlcD8ZneXeAMhrs4s1YSmOw7qRimIW3m
	 CK/o2XYOqhKT7Luv8LFh5INAjv18I8/PkJAtsM+T2GIt0g/33ttLr1EBaujPY03tNf
	 Pw1A4v5igQCUXr9WWbcS1pwMAoQtub9dUdV+OdrgPy4jFsdZCgV1l1fpN73/4AkLVF
	 2HY03S/8dZkSjwpJtqaZ+PELUO/NDrJ70hSXx/RgJuOmNufo7UVX5ecWfovESKYLzp
	 292Vb+7I7YSHg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A58D541F38;
	Fri, 23 May 2025 11:58:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abdulrasaq Lawani
 <abdulrasaqolawani@gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
In-Reply-To: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
Date: Fri, 23 May 2025 05:58:55 -0600
Message-ID: <87ecwfczcw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Abdulrasaq Lawani <abdulrasaqolawani@gmail.com> writes:

> Add an overview diagram of Linux DRM architecture for
> graphics and compute to introduction.rst
>
> ---
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> ---
>  Documentation/gpu/introduction.rst | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c5265b1431fa18110a7a 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -14,7 +14,43 @@ including the TTM memory manager, output configuration and mode setting,
>  and the new vblank internals, in addition to all the regular features
>  found in current kernels.
>  
> -[Insert diagram of typical DRM stack here]
> +Overview of the Linux DRM Architecture
> +-----------------------------------------------
> ++-----------------------------+
> +|     User-space Apps         |
> +| (Games, Browsers, ML, etc.) |
> ++-----------------------------+

[...]

Please actually build the docs after a change like this and look at the
results; they will not be what you expect here.  You need to put that
diagram into a literal block.

Thanks,

jon
