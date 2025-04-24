Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D06139FCE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745468388; cv=none; b=d8hmXYzLtiYc+BPQoHEQ6h+5RCILhB9gF7j5srHvwXp0LOWfSe1VIIFm2XASm0C1tK6CnTlaQt258CQBaZTzvjI0+0ZcJRxbUPj50nuZHkhedtQi9mZmw4uOLnZZQAOxCvulvA1C/F+VavvInc4dr64qJq8+Y/lDSS11gdo3mc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745468388; c=relaxed/simple;
	bh=BaOhywJcB+VaEaUHHAOdBXwmq+NRH46jxsPOdH5NcL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyAEMgsOeWPtQCEjvovD8jYu8rLLSALDcHAnZaFzI8GCbHuzsUHRQxrvGTBoIcxoQD19eb4uEcS1QzNg9yJyKSUiqRXWAarQ7Mr0WYVN2uacoeBilWzSWUM7NcGUH7UsaqvXQ7ewCef66hzBYl/H3dw3Nd+AbXJ4R93Uvek+OB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ohFeaUHe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ohFeaUHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745468384;
	bh=BaOhywJcB+VaEaUHHAOdBXwmq+NRH46jxsPOdH5NcL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ohFeaUHeI280wynRO5WRe1N7Ozp1xltaI/qkb/t0zvx1yRDuWsWSYL0jzEVLlYh1w
	 wKTxpnhND8zWQijcje35ywZ9zyx2QXhKA8s/8+rHO/JK6Z0fgN50romFVw/vXBLBoZ
	 URm04otDjCPgg0nZ+cKPKe02abU/DBdVnKoq90Z+w3yU9GcQ4HnJZarN6Oeci9wLax
	 0H6+i2ouZLb80PYtuzIzx2pR9SNPvkKPBq5wJ2YBDxykK8u83plFIC+jckrGszY/8i
	 fUyUGOHyg+iUTxKBANp79gmlzBu0DEhElrt/so03P4R5emk3vWegwPWb8gIMct9eWO
	 tt5cHZBjmIAsA==
Received: from [192.168.8.5] (unknown [137.59.78.166])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBE4A17E088C;
	Thu, 24 Apr 2025 06:19:36 +0200 (CEST)
Message-ID: <8da97827-314e-43d1-9675-ca176263146f@collabora.com>
Date: Thu, 24 Apr 2025 09:49:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Helen Koike <koike@igalia.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
 <b7795d63-ca8c-4746-84aa-49793d1b6852@igalia.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <b7795d63-ca8c-4746-84aa-49793d1b6852@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Helen,

On 24/04/25 00:21, Helen Koike wrote:
> Hi Vignesh,
> 
> Thanks for this version, please see my comments below.
> 
> On 17/04/2025 00:04, Vignesh Raman wrote:
>> Add jobs to validate devicetrees and run KUnit tests.
>>
>> Pipeline link,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1407489
> 
> I see this message:
> 
> WARNING: Running pip as the 'root' user can result in broken permissions 
> and conflicting behaviour with the system package manager. It is 
> recommended to use a virtual environment instead: https://pip.pypa.io/ 
> warnings/venv

We should use --break-system-packages in,
pip3 install dtschema

Will fix it. Thanks.

Regards,
Vignesh

> 
> 
> It would be nice to fix this at some point.
> 
> With or without this, for the entire series:
> 
> Acked-by: Helen Koike <helen.fornazier@gmail.com>
> 
> Thanks
> Helen
> 
>>
>> Link to v1,
>> https://lore.kernel.org/all/20250327160117.945165-1- 
>> vignesh.raman@collabora.com/
>>
>> Link to v2,
>> https://lore.kernel.org/all/20250409061543.311184-1- 
>> vignesh.raman@collabora.com/
>>
>> Vignesh Raman (2):
>>    drm/ci: Add jobs to validate devicetrees
>>    drm/ci: Add jobs to run KUnit tests
>>
>>   drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  4 +++
>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>   drivers/gpu/drm/ci/kunit.yml             | 33 ++++++++++++++++++
>>   6 files changed, 127 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>
> 

