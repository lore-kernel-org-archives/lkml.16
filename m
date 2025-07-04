Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E32E3706
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656978; cv=none; b=ixGHggK41ODCTSRhfm/p8tujW5Z/73cdjohHgctA3sd5zOefyPhTKKA4Q2kK5zvdnM42T/zE4m6CxJ+ehWACESRStRQnqFkg3185XUwNNekV2x4akOVetUc5hTv2+QZosONFGAtDA0ZrtIc/w662KCXrcT8vAYzRKWZYSOtc2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656978; c=relaxed/simple;
	bh=4zLBttPdNwTKQ4o3Ydc29fIOrnEgrPrSkrWunJ6Iq8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF2v59crWXFJsXSBxe2P3kEPexhPpT4DTyjwTcqBideMSbWcgupIN31Y2dtp2CMeEdAKQ/baQF9PyzJlYNco1VDmhHhBcjqcMS033PPmjh7Vs2tAIIW1lseeAedwyYfJZaBU1FJFq01AoXCKXdjGraTlRULb0eLbG4FiwqCavCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=mI8u+BPH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mI8u+BPH"
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B9BFC2FC00A2;
	Fri,  4 Jul 2025 21:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1751656972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k7nENN+6Go7o9FF71hjN+u63munpkjhdSF0S/glj2Q=;
	b=mI8u+BPHg/e6FA8qkg6fqxQjE/4fgvBBOBIVJlT4gwYMpdoFOKXx2eJzHhNmfrcr3viH57
	7f5y0i/LScQgNtgZjC85AKEZESC79uvlrwK1dyt4ZnAx8exA1qzFbJHBcgal1rvGc9RTlJ
	nxe08tDhpP35mBbP0xwxwimTiMYywAQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7df81e96-14b0-4fde-955d-2960e240b4c7@tuxedocomputers.com>
Date: Fri, 4 Jul 2025 21:22:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] drm/i915/display: Avoid unsupported 300Hz output
 mode on a TUXEDO device
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 t.guttzeit@tuxedocomputers.com
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250704192007.526044-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Forgot to add Tim to the cover letter cc (I have not yet found a nice way to 
auto generate cover letter to's and cc's unlike for the actual patches)

Am 04.07.25 um 21:03 schrieb Werner Sembach:
> RFC because I'm not sure if this is the right approach.
>
> The flicker manifests ever few seconds 1-3 black frames in quick
> succession.
>
> On windows 300Hz can not be selected for the iGPU, but the panel advertises
> it.
>
> A cleaner solution would probably to go over the pixel clock, but for this
> device there is only one 300Hz mode in the panels edid and that is at the
> nativ resolution. Chroma subsampling was not tested as linux afaik offers
> no way to easily enforce it for intel gpus.
>
> Tim Guttzeit (1):
>    drm/i915/display: Avoid unsupported output mode with 300Hz on TUXEDO
>      device
>
>   drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
>   drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>   3 files changed, 36 insertions(+)
>
