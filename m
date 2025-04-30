Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7C1754B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976820; cv=none; b=nsQV38IvJRLmAi+tooygjfnNnEScne2jZzLTP+yZepgrTzXkBGVZiA5v15wHfS5usYsazxo+LdtxxuQqaho0eC+tZVg4FdViNuiL71aJX4CqXACOAqYEb81Q+PWmqtOPyDLAiRS7C7xV68OJULiNViixePIUr2bXAl1/1U+rrRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976820; c=relaxed/simple;
	bh=RALBKsGG2upzcguTIS+A+PDnBRNe6/TeULsuaKzmBck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adYeRAKs1TZb+3xKaIyPGHfc9xDZDEqzDTIFJbx7I7ySoIYb70AodowKybFIOk/gQi+80TLXb0xPyNX2VYQuEe0cOd1SajjkoydpY4y9x/FjUXA2vhpNv3OuLuc5k6FNHCIW6sk6gCoocgDrGjs8c0CgZK1XNd5+rfWHDQvoFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dq0d75DR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dq0d75DR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745976815;
	bh=RALBKsGG2upzcguTIS+A+PDnBRNe6/TeULsuaKzmBck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dq0d75DROVnQzBqyTJRPBxU66weJ/K5BbTOij8qCsb4kit0RZTQjUVRYnZLS4dxC5
	 n/Cb/gODpGUXUbyP9OSS3hirK+DmZeWrYxmQT2/Os8JVO00OMNFJ6gJ4VndPJjp9RB
	 jIMho8YeE0mp0pjyE55HqvTTqJFEenpIkIrLD+wRFviavenQwSE6M6wAkvVy5jpImT
	 IAZQVVV9ieiGg44k2nNFvY0ZR/VrcfVK/imJaL53o+29m8THBIc+bVQ7M8w0348y5M
	 siM8k1LNUUpdTItctXe5Tqz/PKgXdkQtWmShe0jb3H2xHUFIVsstHt89C+zZSiJ1zm
	 dwvB+wIrPSFaw==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48C2D17E049F;
	Wed, 30 Apr 2025 03:33:32 +0200 (CEST)
Message-ID: <a94b065d-408b-47d6-8e60-1c61dccdb790@collabora.com>
Date: Wed, 30 Apr 2025 07:03:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, dri-devel@lists.freedesktop.org,
 daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-4-vignesh.raman@collabora.com>
 <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
 <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
 <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
 <rrrquzr4k64e6b74g4foio7z4pltfx3oxrqbrrw5w3frlmyzkd@x45yj42sgplt>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <rrrquzr4k64e6b74g4foio7z4pltfx3oxrqbrrw5w3frlmyzkd@x45yj42sgplt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 29/04/25 23:51, Dmitry Baryshkov wrote:
> On Thu, Apr 03, 2025 at 11:29:55AM +0530, Vignesh Raman wrote:
>> Hi Daniel,
>>
>> On 28/03/25 17:29, Vignesh Raman wrote:
>>> Hi Daniel,
>>>
>>> On 28/03/25 17:06, Daniel Stone wrote:
>>>> Hi Vignesh,
>>>>
>>>> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman
>>>> <vignesh.raman@collabora.com> wrote:
>>>>> The current s3cp implementation does not work anymore after the
>>>>> migration, and instead of fixing it and propagating the fix down to us,
>>>>> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
>>>>> changes. Also replace broken s3cp command with a curl wrapper call in
>>>>> drm-ci.
>>>>
>>>> Thanks a lot for fixing this. Sorry the fallout has been so bad.
>>>>
>>>> You can also upgrade ci-templates to get an s3cp which works again.
>>>
>>> Thanks for fixing this. Will use the latest ci-templates and test it.
>>
>> We need to update mesa to use the latest ci-templates and then uprev mesa in
>> drm-ci. I will send this in a separate series after fixing it in mesa.
> 
> Vignesh, Daniel, any updates on this? Currently drm/ci is broken both in
> master and in drm-misc.
> 

mesa-ci is updated to use s3cp and drop the s3_upload, which is a curl 
wrapper. These patches were merged this week and I will uprev mesa in 
drm-ci to get s3cp working. I will send update to this series.

Regards,
Vignesh


