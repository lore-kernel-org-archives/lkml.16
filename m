Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96979CF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743163167; cv=none; b=piGKAmZZ6/zvdxXtT8AvbpWOQSB2SFo33avMhzn+FJ53PANia+RYNDY8u9soFy/3FGzCAkSrAwmaGJka0MHpHO8Kts7FGpO72OGH4PYIbcLg1X/tKkUcMt6HaQnITGVYPCKC305IUZmKCwOPbv8dWlaUKSkzoYKcIUVdMPjZHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743163167; c=relaxed/simple;
	bh=vZJn55+ZfOVZmFgcx7qwYLpNHR0tMjnfEKG/5AjOixE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGcelbryRRAju421w7uXYs3zn6JOU65r9m4+CTJVqOag9bXTmtgAAcQA0NQbUr/PDbxO+wIr9BlBa/bxiI7vMaXN22EfxZXQoZM6imTi+O20Y3sXr5xUDsMwaGGZ6lultewIL+fUkWcelCbBpQgegTaXdkjuqnVt6UOnneQE47c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z2dNgciH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z2dNgciH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743163163;
	bh=vZJn55+ZfOVZmFgcx7qwYLpNHR0tMjnfEKG/5AjOixE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z2dNgciHpMCanKupwiKz6DEYXVioWAJH9bA0Q6PyHNA2ed5dYqJJTCyGQg5aumT/E
	 E6lZI0FevCuRvrYnIsEphlYCG2eq1yXQlKpmo4j5VN6YGYHDQKRi2BMDEUsQ/x7Tp/
	 E6eABZAnk9zptc+aK6GJEyjkhRQiZWgTC0PRsUdT/ZaHtwcWk0wn3uYBLDzZs5DhVN
	 6u2dnauTuqXLWMeYTu3yBJjpQssKTiGaJfHQsXwsm9uAnoe1jUWeSb/PaH32Ef0tPs
	 kh6G3EIfJF4tD7wgkxzBR8Uqhxc1R8zCLMRew/k4cvl8RaF/m6vbwTpjCEYCO/+Kre
	 JmD6EdW6Ykyrg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCFA517E0C8C;
	Fri, 28 Mar 2025 12:59:20 +0100 (CET)
Message-ID: <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
Date: Fri, 28 Mar 2025 17:29:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-4-vignesh.raman@collabora.com>
 <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 28/03/25 17:06, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> The current s3cp implementation does not work anymore after the
>> migration, and instead of fixing it and propagating the fix down to us,
>> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
>> changes. Also replace broken s3cp command with a curl wrapper call in
>> drm-ci.
> 
> Thanks a lot for fixing this. Sorry the fallout has been so bad.
> 
> You can also upgrade ci-templates to get an s3cp which works again.

Thanks for fixing this. Will use the latest ci-templates and test it.

Regards,
Vignesh

> 
> Cheers,
> Daniel

