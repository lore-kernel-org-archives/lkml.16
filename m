Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110E28EA52
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745434293; cv=none; b=Ofruwq3M/cpTlmxSHvYpzb2BmAxM/BqVzVs4PX5I2QjkRYeSUiEOh3gnPShvrqTFHxhfk2fkqoLZz6FTLbQ3vQ9IT41nNjOxagSpRLsyrq6swxRVH9IZM0AOCpuGQ+OUg+NDmcQA/i5iIjlZOy0+u0npEFV84AccVOHxx1R5sPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745434293; c=relaxed/simple;
	bh=l0v4hiT1NtXehQ/nyJXOvrDjzP/TouoxBo+iAUpcCxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=de5YaDQJ6MPqL6oxGeFNCIMcen8e6bakdHsXWSYv9TxbiKR+VvH9QObSsA6+qSBaMzu7IgKEdCiAAzzZlQb5ISgzpk1HjWkcxiUycUkekoASKtlNji/oYLit2AdMf5ufKjgfnzt4eltNnh7RhQtkiGSGmXMHxikBf2TdCWH5PGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=SeuaYYDi; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="SeuaYYDi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=me2zQfOMtr0IzB1wW01DnjY95ZOpk1z1IE3Ehm7bRR0=; b=SeuaYYDiGwXZpLo0gpuCrg3Al1
	QDusqd/lb/ZJj2TKNhc02gQOOEKXzIfrL8qG6u58UgfZfvLvNKRuHmxAQbSs31prEP4QKPiAjBr6K
	fLZMubS8jkoF4mikZnfi0uWGPvEhqvvTxWmgnOBHohskQqZJwHInUZfGVvDAErJ9UxUDJP2/C9Xoc
	RfricAD7Lb+KIAmYnrW8Co3WxRqPeJGogrgsouLicAjk2f0cqS+k85GDY5/LE/DkTG+IEchdyqlCw
	NR7hsNLHIkZaux8ac+GTGMF+oBvtJknSsRJuLqVummAXmdk0jEH1K4L34bgCrYBLR7zp71M8H5dqz
	B57UOBwQ==;
Received: from [177.98.23.232] (helo=[192.168.68.130])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u7fBe-007320-4F; Wed, 23 Apr 2025 20:51:10 +0200
Message-ID: <b7795d63-ca8c-4746-84aa-49793d1b6852@igalia.com>
Date: Wed, 23 Apr 2025 15:51:01 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250417030439.737924-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vignesh,

Thanks for this version, please see my comments below.

On 17/04/2025 00:04, Vignesh Raman wrote:
> Add jobs to validate devicetrees and run KUnit tests.
> 
> Pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1407489

I see this message:

WARNING: Running pip as the 'root' user can result in broken permissions 
and conflicting behaviour with the system package manager. It is 
recommended to use a virtual environment instead: 
https://pip.pypa.io/warnings/venv


It would be nice to fix this at some point.

With or without this, for the entire series:

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks
Helen

> 
> Link to v1,
> https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/
> 
> Link to v2,
> https://lore.kernel.org/all/20250409061543.311184-1-vignesh.raman@collabora.com/
> 
> Vignesh Raman (2):
>    drm/ci: Add jobs to validate devicetrees
>    drm/ci: Add jobs to run KUnit tests
> 
>   drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
>   drivers/gpu/drm/ci/gitlab-ci.yml         |  4 +++
>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>   drivers/gpu/drm/ci/kunit.yml             | 33 ++++++++++++++++++
>   6 files changed, 127 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
> 

