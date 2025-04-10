Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDA293444
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296061; cv=none; b=t8PPanyFki25f7fHM3Kn3+/S6mFHL3mS9Sm0wbBF7uiYAfczfxlqe0FYLWZuO6B+Ktn4xI3xhuCwyTcQObmw2w5QkZ7qi4IWvqzx+yhCPxi1yvRdTEeYctMT+THP6Xt4gRrQY80u2CtdQtOvhPn7tjN1ZpzaCcalRTnUthw3QjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296061; c=relaxed/simple;
	bh=5fL0rgnSzGs1CAG0aabGzOX1kCW1JlrnGcwxY3Sn6z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJfsU0i4WUSPxO74H/ABhNtsMGtmxTIcB6X222j1ifUFVQAS+qOVo6R32m3HOh/HpARwN0l7Y5JSZb7jVVPRJN6eqr6tha8udIJIjUAqWo0CCcxX1RiU+LjqDqii1qWgEZ6pf5Dog6bnmblbx0rUhC7UryS3VSJQznrm8/0zrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fAW0k68Y; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fAW0k68Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TD9gJDoeIYWoLN39DzPWwvY2Y5ci8qPdXqVd0lqAifM=; b=fAW0k68YRp9bnpjKIBpwOdu8Fm
	RJr3T6YT+xnmzH+wH+8d3vLrDPSAhX2EcAoIVZ0VHhmZxODYmQUpsosCHVeZGDQHtdiauroSNCchU
	urMJeBlSY7BfJBQAzDCMXCju7dvOw6JnS/gZBQtknXzjT7X07sOSbniln07z52ox7oXhgaYSionkA
	rF4yRvU3d92FTci5d2o8Gmlxm+RSPjdnzwdV+BBHXjj8Dhv4lWkumfJBazYfgxXfq9p8g9vbGI+9F
	uxAfVh3Vnn/CXoQP72FHS9yGwEDhCmzrYzpKkp/atlWqv9FW6ByKk7jb4TTnI4UtOs/uYigVhD2ZL
	1oR6d3GQ==;
Received: from [177.134.103.112] (helo=[192.168.68.130])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2t55-00EiHQ-KJ; Thu, 10 Apr 2025 16:40:39 +0200
Message-ID: <2266002e-372d-434c-a2f5-282166e28c70@igalia.com>
Date: Thu, 10 Apr 2025 11:40:32 -0300
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
 <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
 <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/04/2025 05:07, Vignesh Raman wrote:
> Hi Helen,
> 
> On 09/04/25 23:53, Helen Koike wrote:
>> Hi Vignesh,
>>
>> Thank you for your patch.
>>
>> On 09/04/2025 03:15, Vignesh Raman wrote:
>>> Add jobs to validate devicetrees and run KUnit tests.
>>>
>>> Pipeline link,
>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550
>>
>> I see the checks are in the same stage as build, does it make sense to 
>> create another stage? Similar to what was proposed on kci-gitlab?
>>
>> Also, I don't think it make sense for kunit to be in the build stage. 
>> Maybe in software-driver? Since kunit runs on a qemu.
> 
> We can add a `test` stage for kunit and a `static-checks` stage for 
> devicetree validation and check patch. What do you think?

Ack on static-checks stage.

`test` stage confuses me, because all the other stages with driver names 
are also tests, this is why I suggested to move to `software-driver`.

Or maybe we could just have a kunit stage for now.

Helen

> 
> Regards,
> Vignesh
> 
>>
>> Helen
>>
>>>
>>> Link to v1,
>>> https://lore.kernel.org/all/20250327160117.945165-1- 
>>> vignesh.raman@collabora.com/
>>>
>>> Vignesh Raman (2):
>>>    drm/ci: Add jobs to validate devicetrees
>>>    drm/ci: Add jobs to run KUnit tests
>>>
>>>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
>>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>>>   6 files changed, 123 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>>
>>
> 

