Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA8E18BC1D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660010; cv=none; b=KoEiB3TOydr6bM5+Ma2+02sUrhBQWw00jYVNxiBpGBxbw15NabVJ8UXd0xy5JQ5rieIgtwSFs+0hKJM7Og5+kLXlJz0mMsuU1Sr4D5l0seGFNStXvAofCrc/NFQRg7sXu2DbMQ3DYpC+UMhQdgTWy/KfGCAoeWIEbjVU4012Ii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660010; c=relaxed/simple;
	bh=N4qJ8F58Pmv26ISrZ+OWnRoYbvHDgb6+p53DZug+Pdo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=biKvZZKzeWVoA02YQ/eoJ/5+43/wJbeq7hVLzOHNBJY+u+P/iBNLW3lr0PnMAAjozJNS4+XvXQcxeN3GEBqy7l1oQvYXpmCqUnR7Ie1C7UKRXSFXmQdZ69pgX04HefSe0hu9pcmcqXrqXBhhHKOv4Ztd8oIOk6r8J5PyFIivgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H2FrmBML; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H2FrmBML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743660005;
	bh=N4qJ8F58Pmv26ISrZ+OWnRoYbvHDgb6+p53DZug+Pdo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=H2FrmBMLrGb1XRd/bA0m1i7q5ilHh4zipP3wNfi0Cx13CRqaL8XzeoU6de81rJinB
	 N+BSZf/ajXaWcNwsPgkH1T7NHY3RayBUjlmaI6QOiKBKgdBVBtrugN4YqY4qxXsO1E
	 mJEIOYRM+sGVG4NBOQKUfb2xvFdTzH6CsGoTopjipepRqdm4EOApTFVxSwVdrkiZ5Z
	 ak8JlVRqA4Q4rOrwUHyPwwFv/l3x7aIbNwwESJtndRsZug3dWUcdmcgg6IHmEL4VHe
	 s4NAzPycXLTj7Zx63GyTULHdZAdKfIXJINP79jBgvhIKkKEbDEy0z+gqLC6icycG5l
	 7cX419TVeTsTw==
Received: from [192.168.50.250] (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAD3417E0F47;
	Thu,  3 Apr 2025 08:00:02 +0200 (CEST)
Message-ID: <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
Date: Thu, 3 Apr 2025 11:29:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
From: Vignesh Raman <vignesh.raman@collabora.com>
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
 <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
Content-Language: en-US
In-Reply-To: <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 28/03/25 17:29, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 28/03/25 17:06, Daniel Stone wrote:
>> Hi Vignesh,
>>
>> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman 
>> <vignesh.raman@collabora.com> wrote:
>>> The current s3cp implementation does not work anymore after the
>>> migration, and instead of fixing it and propagating the fix down to us,
>>> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
>>> changes. Also replace broken s3cp command with a curl wrapper call in
>>> drm-ci.
>>
>> Thanks a lot for fixing this. Sorry the fallout has been so bad.
>>
>> You can also upgrade ci-templates to get an s3cp which works again.
> 
> Thanks for fixing this. Will use the latest ci-templates and test it.

We need to update mesa to use the latest ci-templates and then uprev 
mesa in drm-ci. I will send this in a separate series after fixing it in 
mesa.

Regards,
Vignesh

> 
> Regards,
> Vignesh
> 
>>
>> Cheers,
>> Daniel
> 

