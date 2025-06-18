Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23B28A1EB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250383; cv=none; b=d1+0zGLpYXvJazGU5pSV4S0o4wp0km3D3/U0GsNvtsGA8buuNARXytUbI/RuuhBEir4T01Anwmoc+ywO780jNErmzh3iR86cReZLlc7EnhrqpCp2G1UCUg9/JPJumKJF1qiR+Sopqlj9sR2+NuMxmjmWd8atZ+5QGdVZZRx11Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250383; c=relaxed/simple;
	bh=u7aTogsM2QtHhE/8X71etJ+Hr3Bgjbdk6kDnkJG5yqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5H+a8tilZ+/g5HgwXo4BbIe6lh2EOeVd2cARcLFZaUfqQi1UwxmseOdb0wX/3yF9way4klBe5Lv5EQUmIC3lZ+2+5zlOeSfn+GR+T7VMUUvCfa8/oY80QqFX8jvOl1qJqVBjVL7b2BQVgMnJQjsjrJ09nnsyf5pImTeP9zbCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fheX8NLd; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fheX8NLd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=llImzjIbhjZJrpdOHyErF1aaIt3Spa/yRg33TxcGabE=; b=fheX8NLdVkqkIqxe97nkmLdrFM
	lbcNCNW+ClOA5yZo3mKOr60il84d7TwCZm7Tluk+9xQ0029jpCSZ92MxM92PmQIUu4QpBZOYW8UZ6
	AS5/gjcWMmUVY2qToLuyGgDwNm9N5lNexQhHIlfzx5Os+rC+LqMhu+m6e/NCxVBQcMTu42vR8ds4l
	R3cLO5pvkCmQ7xjTkidRLakqbPneVuLdpT9q/BRzj902dmn3KXGlObf143mv9OPhrR5v43fJ1KW7F
	bZcQsOBfgSaipj45CqazW1cpkQLYI4uHL/IPAbW1RJmCe66gWk8BhayTie9k1f9dYpuAMzwx38iHH
	dw0Jxf2g==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uRs4Y-00543t-61; Wed, 18 Jun 2025 14:39:22 +0200
Message-ID: <c62c2994-19e3-4599-9ac9-d49c37845011@igalia.com>
Date: Wed, 18 Jun 2025 09:39:16 -0300
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
 <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
 <a0f508fd-3277-4839-a4b6-e6bc56546f6c@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <a0f508fd-3277-4839-a4b6-e6bc56546f6c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

Em 18/06/2025 04:29, Christian König escreveu:
> On 6/17/25 15:22, André Almeida wrote:
>> Em 17/06/2025 10:07, Christian König escreveu:
>>> On 6/17/25 14:49, André Almeida wrote:
>>>> To notify userspace about which task (if any) made the device get in a
>>>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>>>> the task PID and name.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Do you have commit right for drm-misc-next?
>>>
>>
>> Thanks for the reviews!
>>
>> I do have access, but if you don't mind, can you push this one?
> 
> Sure, but give me till the end of today.
> 

It was already merged, no worries!

