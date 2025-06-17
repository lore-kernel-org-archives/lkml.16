Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BADC1FF603
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172076; cv=none; b=F6Fut4JF+2WbzyZzCiibeSDCDWKBSMmGKSEd0EGTVhcgi4d8Huv9W4SsMk3qR+KPJSyHzwEcsTHVWNq9xHIIclI+0VdRTKZBPgrxezUqh9t/ur/K6R54LhlvkIqZJ8zENOWlJGmwUWiHaJZC2mVcp48HIZN84PJysXrlwWTyHAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172076; c=relaxed/simple;
	bh=Whp7VuhghmxEWkETQjLzMeRpXZg2TjmXnqChtD+EvVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMgFeWk+UtAt0jSxdHyyKtQqrtkTtXHzkCV10z1lJlxd7LQUQI4iLKNav/qGnxb/GIsJRPYbA9VqB+N9ts7Enee28VDDTFKlwFfOZFOM/aV83Pb/Sn7Y9Min3ClBty5c0vKyYUC7sWonHVaGq09OFmfNzrpoMKak4Ih+Ud5MGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nBhkDjWB; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nBhkDjWB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p5CNKE/MKysCW70lR/MO7TyeEBtlJwj3jdT2nsO0WMA=; b=nBhkDjWBLfpBJuZWGo5Gr/KSQW
	pA90MzdJjR84y0V0SnSWwGrLBxA2TQuGJwzf2towO4u4tt3F47DPmiVp56pE8jJWVSnOq7l7Rk0g9
	SjZYzEb7YO86zNLeOutSeytjnsAywlsuqG9bfO+wUf9u33UFTEGFZO+TW5O6tgMJZ9DBBg1ooFo+s
	223r5HY0cwpQPa3BiralF/8VzpHGjSRQxNSAKCDFADVZOE7RiOLcQYOl69w3vWSJdHEepfpz7G5rd
	kMxBYODYH+1cKo6AyHn3LJ574PrA8vSifImtxdFVNVoTOVX/RmcSQJoLkd45QEOuCAXkxEtSQqV54
	b7OpgK2Q==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uRXhf-004dZx-3T; Tue, 17 Jun 2025 16:54:23 +0200
Message-ID: <55ee0276-23c3-4853-b954-09aeccc59b7f@igalia.com>
Date: Tue, 17 Jun 2025 11:54:18 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-7-andrealmeid@igalia.com>
 <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 17/06/2025 10:07, Christian König escreveu:
> On 6/17/25 14:49, André Almeida wrote:
>> To notify userspace about which task (if any) made the device get in a
>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>> the task PID and name.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Do you have commit right for drm-misc-next?
> 

I've merged the series into drm-misc-next.

Thanks!
	André

