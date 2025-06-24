Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43E29E0FC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778850; cv=none; b=qFToYGUgZy6At7WIXZSmwvFZu27hnJfcKmURFEpH8Su21A9KAEmABL51vitjPOpT0bZdmSbY+xN2t+FjIPorHEy02mxY+gVWBZ1SwhzK3dH1dIILU6O+mpGOw8x0IYJoQPzW6UwcV8IIo/LQPqN7hcieJag/1xOBCTdKyD5hcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778850; c=relaxed/simple;
	bh=ca1Y/Gh+pqZBFc+hDMmzgSATta91r/dPr9MPXKk6vso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4f9pRXqLQrgbKqVMSfabne3AstO6UarYoxHknX4/ZwEFKOwB6LOPonpxEsINbOOBhib2tr9CZ/LmLR1h8f0OM/kmF/a5mDyeE9OL6GN3Ke+etC7svf/Zt4xtCIuddiWm0QSebaKwSb5kPJ1go0eIbLGoiFT+OvKNwf4voqsprc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WGFcpeIH; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WGFcpeIH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tS2MD2P8KTyLJPahJ0RE/sxNRohzo8cGrJIZa01FQjs=; b=WGFcpeIHWpF4LV4Qy/Md26mCSZ
	NvwXC2XrAFFndygInot91Ucu1FA3rbsQqnANOuLYsLDhOvHGSLvlCnTOx5SNzyNKoBun0yNXSaJQ6
	ubcRKm9JEK/9lM0QGFY8/7mzr58l/JsAiEXKGLKHt9ehFIFczgJpQl4CAc+Rtr+9gL4KrcGkRxfFj
	ywRWI+5gC6KX3KDOMeCbaFcmdAN4wm9RR18xd0F1IipvjStCCQjkqcrHEjD6qag5Kcgj2uNelp4jC
	q9gMNY0RA/wlToO59QhXGHAJI7v4lQAQQhehAJTXgyqUItlQsQmdyAS4X/h6l/TjW0M6TH2CTzHJ7
	MLD0YllA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uU5YQ-0083u2-PJ; Tue, 24 Jun 2025 17:27:22 +0200
Message-ID: <f1d61291-f8b8-4646-9195-3724fdee184b@igalia.com>
Date: Tue, 24 Jun 2025 12:27:19 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: amdgpu: Fix includes of <linux/export.h>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
 <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

Em 16/06/2025 03:59, Christian König escreveu:
> Acked-by: Christian König <christian.koenig@amd.com> for the series.
> 

Can you add this series to amd-staging-drm-next? Thanks!

> On 6/13/25 20:26, André Almeida wrote:
>> Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
>> <linux/export.h> when W=1") and commit a934a57a42f6 ("scripts/misc-check:
>> check missing #include <linux/export.h> when W=1") added new checks for when the
>> include <linux/export.h> is missued by drivers. This patchset make drm/amd code
>> compliant to this new commits.
>>
>> See also: https://lore.kernel.org/dri-devel/20250612121633.229222-1-tzimmermann@suse.de/
>>
>> André Almeida (2):
>>    drm/amd: Do not include <linux/export.h> when unused
>>    drm/amd: Include <linux/export.h> when needed
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 1 +
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
>>   drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
>>   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c  | 1 +
>>   5 files changed, 2 insertions(+), 3 deletions(-)
>>
> 

