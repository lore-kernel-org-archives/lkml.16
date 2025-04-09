Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCED1C5F23
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223061; cv=none; b=jcaCQLub19iZAh1/znRlnrI27lSKriC8fTVn+tT+rWrm2CwcFQ/ikvBBDFvm98ADzkpcIJMcT0Np292lHW4fPjuJQCps+djZdOmIwJTbRsbtlx8gPFxcw0MUPjNUHyZDrnnq1yLd0/CO26Cz9HGTeJtCy+nBD+U4ydHSfkSEGFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223061; c=relaxed/simple;
	bh=tM31JOaguapUbcloMIXr60uZiSOkjXEX8cNj5l7uLwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UU+Yt73Ga8K0f2NEMcKVESAZORTcvEoAGcNiLoRc71Y5TMncd4ECLqAtRAFm2Kwvx7NlGsN3FIocgZivZxyeuHOOiZLdbCIW+V2MS6uhT59zwLkRlGhJyOmeTZN5wHoKqlug1j4xIn176ys8tGMdjFb/Bsi8+1k78OfjvlO86Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oWcRTEMO; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oWcRTEMO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/Be095vzPhvPLdfLrTZ/oiCbSUE2aRlT1cmy2Deak7g=; b=oWcRTEMOUXJebl93WOFm9Y/hrr
	tdIHWIEvgq4wK4Vft8IEJszgM7JZZoTO90ZsnykeUoAMh0oWEI4FM0PkPrLodByW9JWvnE1MAfCnX
	bR3pC42qwnf6syUNs9qhCcko6wmkKNEMKN7J6d6OUhbWsBouYZZppqrI5WK2E1FoAUg6tywDebcII
	7zP1Lc4yRZ9t+Km1qfEC3ASfgtO5/AC0ni7f8zNXu6rv4GjdAv2oupCxrHoT+oOx0/XZda6oyHVsh
	bcjPZK0h/dRHaDQ7Tqs0kariN/08I0asQlwrnDQ+UXFFCo9Yck7jYf9QnWqCKL7+nEFgixHYTomaz
	px4K34Ww==;
Received: from [177.134.103.112] (helo=[192.168.68.130])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2a5e-00EGFA-49; Wed, 09 Apr 2025 20:23:58 +0200
Message-ID: <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
Date: Wed, 9 Apr 2025 15:23:49 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250409061543.311184-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vignesh,

Thank you for your patch.

On 09/04/2025 03:15, Vignesh Raman wrote:
> Add jobs to validate devicetrees and run KUnit tests.
> 
> Pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550

I see the checks are in the same stage as build, does it make sense to 
create another stage? Similar to what was proposed on kci-gitlab?

Also, I don't think it make sense for kunit to be in the build stage. 
Maybe in software-driver? Since kunit runs on a qemu.

Helen

> 
> Link to v1,
> https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/
> 
> Vignesh Raman (2):
>    drm/ci: Add jobs to validate devicetrees
>    drm/ci: Add jobs to run KUnit tests
> 
>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>   6 files changed, 123 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
> 

