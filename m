Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F4202C53
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272472; cv=none; b=rkVChGANyN5m3/Lc5m7ICWg1mXC1oZVreZ3dW+ZbMS8zJZlEwJyXhrW3Dx0AvBaYvVl6hytmbhG41ziuj1bgqAxcfadc3ZBdesCZyt3B+cbQyL08y39+NvyJQbDXvtQq7/lGkURwmKG5Lng3GfxXELnCQJjGbzwCFxVk9HBKUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272472; c=relaxed/simple;
	bh=l8rq0lp+35FdD9JCbp/mek9kn6GH0HJjdxWV1XHPBMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkcpEEuDN5GfmBwJKOMcFYLaxfpfSyrMDFcS4/cFM+wUla4RhK6waaaDKS9gK8woZNAGyhypi4b2prl+JBOak5LGqEHkNUBIGWcKDRQ7amHiF0hiVKK6WJTj+9seP6DbwSe6Jy343FuvJTtfbjGG/M8Ec3huHAdqXGgpMSfGMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UEyBQiwq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UEyBQiwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744272467;
	bh=l8rq0lp+35FdD9JCbp/mek9kn6GH0HJjdxWV1XHPBMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEyBQiwqWSS4QcmTYcfYnUIyeYJ4ElAVGzcm8LMEdf/ZmpOzSnvCRTGPVoOhY0lHQ
	 rnlf9ek7vTF18dVRDZuexJV6xLVkGf/qDYcvP5ME83ZiK6p87yJw2dIZ0izRvuCyyE
	 9kjxRbguqf0dNabCVvroSfctBnV+eYckY7ex/qL0zDUSqtBupmek8MpUEmzNhDNFYW
	 lqho1lVLsUemfU0d26BtW8tO06vldDtevTpYz/nii0gUyPDVVdPVUDEuOAv4mlFBKw
	 uk0v1g5+24rzyEOON460qIZvh2argeoiV6uqflnWIUPTdFpmFaqYEy1fVPe5ViEBrn
	 4FrqtwRn836TA==
Received: from [192.168.50.250] (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DEA6917E078A;
	Thu, 10 Apr 2025 10:07:44 +0200 (CEST)
Message-ID: <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
Date: Thu, 10 Apr 2025 13:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Helen Koike <koike@igalia.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Helen,

On 09/04/25 23:53, Helen Koike wrote:
> Hi Vignesh,
> 
> Thank you for your patch.
> 
> On 09/04/2025 03:15, Vignesh Raman wrote:
>> Add jobs to validate devicetrees and run KUnit tests.
>>
>> Pipeline link,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550
> 
> I see the checks are in the same stage as build, does it make sense to 
> create another stage? Similar to what was proposed on kci-gitlab?
> 
> Also, I don't think it make sense for kunit to be in the build stage. 
> Maybe in software-driver? Since kunit runs on a qemu.

We can add a `test` stage for kunit and a `static-checks` stage for 
devicetree validation and check patch. What do you think?

Regards,
Vignesh

> 
> Helen
> 
>>
>> Link to v1,
>> https://lore.kernel.org/all/20250327160117.945165-1- 
>> vignesh.raman@collabora.com/
>>
>> Vignesh Raman (2):
>>    drm/ci: Add jobs to validate devicetrees
>>    drm/ci: Add jobs to run KUnit tests
>>
>>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>>   6 files changed, 123 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>
> 

