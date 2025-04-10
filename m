Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4954690;
	Thu, 10 Apr 2025 10:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282769; cv=none; b=bU+FGqZ7SUJWe38PLzBAKxX/83iVdGZjDC1LVyDKpUMIMgwsT8CClGJmaUQ3QXLMYJPBULONCuKODxAh0uGSoQjRd8k+CrAQBXRrlkVdBYgn7oU/JQmMgvJLhbyvlZ3PIrwiMcG9u6HAUSZd4Uydpq2ceqO9Kf6Ve6IlDaWypvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282769; c=relaxed/simple;
	bh=zr+gZPWfQgf9sQUWbDC4AE/8d8aQHyfIi8D/4ZYfxmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1rz6FbwgyZs80JFhcJIO2XfAHRq/739kVcxvoYVNFvIIo9Rx/pqgz1GXHZw7zDROqk7a8aGMvZy2hOKfe6z8hnkdEH7I5tEXyWyP7XdhOcVPwQmwhuumSLFHAIyMHgqP5vY6igJeMHuL3qHQS22WbWmJH2HNtBT/V4h3rB9eV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UgOVXCHs; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UgOVXCHs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bUZ/qP5Z1nX/hu4ZiJ8AHNPNWvhZKEJ6v9fY4owmbCg=; b=UgOVXCHsjLPsKxIne8N3YP7ilU
	v6gemtUNpRKPZ/ezkQ5DmNouMpHkEzFLJuuNzboVZyJlcqyIn9YXlGX6y6KPQ2IA5cJFVemH8Cxsp
	mHSnkP/wZwHm/vR/VcZrVQRM5K7CHeDqNHherlh6Ou04ucxyVOOPYT9qxMfI1am1lJGd0eFwEl8kM
	OjoZ50ACGmg9+3urzgx7q5zjBKvHPnAYANX7juXoLf/rzvUFwS1p+VfLwCfHEV8Cv5qG5B7Pr4a4x
	95wH4GcQIkQGtGATR2qOJaFwTuNVL8zr9x/7MMbUIeoxr7HpwfIFM1dStlSE1LQ2JCabnuwpvr20y
	HrCSe4Kg==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2pcu-00Ecci-2i; Thu, 10 Apr 2025 12:59:20 +0200
Message-ID: <37df9bc3-c9d1-406a-b7bb-63f67cb60c8b@igalia.com>
Date: Thu, 10 Apr 2025 07:59:13 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations()
 error: uninitialized symbol 'ret'.
To: Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>
References: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
 <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
 <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>
 <6ddfc908-22a0-4ed6-b5a4-6df9be85ff4e@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <6ddfc908-22a0-4ed6-b5a4-6df9be85ff4e@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan,

On 10/04/25 06:57, Dan Carpenter wrote:
> On Thu, Apr 10, 2025 at 11:27:43AM +0200, Christian König wrote:
>> Hi Maira,
>>
>> Am 09.04.25 um 21:49 schrieb Maíra Canal:
>>> + König
>>>
>>> Hi Dan,
>>>
>>> On 02/04/25 05:43, Dan Carpenter wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>>> head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
>>>> commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
>>>> date:   2 months ago
>>>> config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
>>>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> | Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
>>>>
>>>> smatch warnings:
>>>> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
>>>>
>>>> vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c
>>>>
>>>> cdec4d3613230f Eric Anholt 2017-04-12  589  static int
>>>> 04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
>>>> 04630796c437a9 Maíra Canal 2024-12-20  591               struct drm_exec *exec_ctx)
>>>> cdec4d3613230f Eric Anholt 2017-04-12  592  {
>>>> 04630796c437a9 Maíra Canal 2024-12-20  593      int ret;
>>>> cdec4d3613230f Eric Anholt 2017-04-12  594
>>>> cdec4d3613230f Eric Anholt 2017-04-12  595      /* Reserve space for our shared (read-only) fence references,
>>>> cdec4d3613230f Eric Anholt 2017-04-12  596       * before we commit the CL to the hardware.
>>>> cdec4d3613230f Eric Anholt 2017-04-12  597       */
>>>> 04630796c437a9 Maíra Canal 2024-12-20  598      drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
>>>> 04630796c437a9 Maíra Canal 2024-12-20  599      drm_exec_until_all_locked(exec_ctx) {
>>>> 04630796c437a9 Maíra Canal 2024-12-20  600          ret = drm_exec_prepare_array(exec_ctx, exec->bo,
>>>> 04630796c437a9 Maíra Canal 2024-12-20  601                           exec->bo_count, 1);
>>>>
>>>> This is a false positive in Smatch.  I can silence the warning on my
>>>> end easily enough to say that we always enter the drm_exec_until_all_locked()
>>>> loop.  But the question is why do we only test the last "ret" instead of
>>>> testing all of them?
>>>
>>> AFAIU `drm_exec_until_all_locked` will loop until all GEM objects are
>>> locked and no more contention exists. As we have a single operation
>>> inside the loop, we don't need to check "ret" for every iteration.
>>>
>>> I believe Christian will possibly give you a more precise answer as he
>>> designed the API.
>>
>> Yeah that explanation is absolutely correct.
>>
>> The drm_exec_until_all_locked() helper loops until all contention is resolved and all buffer locked.
>>
>> You could avoid the snatch warning if you move the error handling into the loop, e.g. something like this here:
>>
>> drm_exec_until_all_locked(exec_ctx) {
>>      ret = drm_exec_prepare_array(exec_ctx, exec->bo, exec->bo_count, 1);
>>      drm_exec_continue_on_contention(exec_ctx);
>>      if (ret) {
>>          drm_exec_fini(exec_ctx);
>>          return ret;
>>      }
>> }
>>
> 
> Don't worry about silencing it.  I already silenced it in Smatch a couple
> days ago.

Thanks for silencing the warning!

Best Regards,
- Maíra

> 
> regards,
> dan carpenter
> 

