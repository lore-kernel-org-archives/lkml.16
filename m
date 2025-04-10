Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344B1EDA28
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744309277; cv=none; b=O8i4kqFSQs7RvHE45QUKxfxyIcCTHGGDRV0cQRj0CZKyE7FoasJDH56I9eMRivqjCMK88kvYtaMfhtrskahQiry0TC1WVRocc4rv2r9+b3lRvzDEjqf/zJt6huYcQ160SXl7jup8QbimUXRAmNVHVLXcsUgQ1iOKTPaJ7jRwp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744309277; c=relaxed/simple;
	bh=LMMiWkKkR4e3uh8Yj1H1nod/gwowUFCxmiaYm3bD9SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBnWu+JG26mLtRxGuz+KbtiH+Uyxzz9Kc3hDepCUuW2YhOHQ8folUUrIS2deYmRxZtKeTQt9acxB4UUd2YQNKr5busWDeb3pboJp+eyR/mzY4cssyBMNkMj7teRzv1sTR3kLm1SNklv1E/MUCX6JKnbhzrd8HpoRxGiBdTx4/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=iAL42bgi; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="iAL42bgi"
Date: Thu, 10 Apr 2025 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744309271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iklVYSYu+XLZ9B7gQ8qjBlByZo1mDFQ7QGjWdhOskLI=;
	b=iAL42bgi7VQedq1edpAM5Qu765pjbCc4VjbWLz6ZJJMnSlaXdahPhDfCXvk9f8egA59TuM
	dmUiGQxrl+9Ipg4ZoYUmhILvAzC3V6jBnfBQiW8CNZXI8hhOazX1Pgy7uVgN4XpxFfvMqF
	CxYRHy5sIzCGshbQOdDCFP5xKKI70dYD1hVyiB6uig3nwXlnJcy93goFwMrCqP0/k8OB06
	hEf3wC2j+lLb5B+/z5MFaqyJhka1AhaVaLv75tUCtXd8HFYQqb+50Y9cWWxMi2RDwXbvpz
	sIgGREW97y5/fQbrZ0V6oBz7kahwjjsdPu6/9o01kOKV8j/0spyBgv8tAJgDAw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Lizhi Hou <lizhi.hou@amd.com>, Aun-Ali Zaidi <admin@kodeit.net>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/appletbdrm: Make appletbdrm depend on X86
Message-ID: <Z_gMD-9fzszuv2GL@blossom>
References: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Apr 10, 2025 at 11:50:01PM +0530, Aditya Garg a écrit :
> From: Aditya Garg <gargaditya08@live.com>
> 
> The appletbdrm driver is exclusively for Touch Bars on x86 Intel Macs.
> The M1 Macs have a separate driver. So, lets avoid compiling it for
> other architectures.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 95c1457d7..d66681d0e 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_APPLETBDRM
>  	tristate "DRM support for Apple Touch Bars"
>  	depends on DRM && USB && MMU
> +	depends on X86 || COMPILE_TEST
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
>  	help
> -- 
> 2.49.0
> 
