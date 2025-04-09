Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C46211A05;
	Wed,  9 Apr 2025 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228204; cv=none; b=fpT4tXIn5LWbzKGMWsnA5to5sYQny8oAvViKr4SjIQaKtlxTbOi5c6Lsa+jIY9VOcptZcfo/dsIXty9SRop9kgP9l6NJF1L/LSDnQuiNGl63QpWtUxbrSnzlaeyCrXIcJCfnotEfc1JsPahnLs1k2zwefYseR9YxwjMYJF/DKB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228204; c=relaxed/simple;
	bh=G9Bp3DpoBCRu+rCxHWLYH+18xBOavKtmr+c7ZFrPNAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qik0jmqLpW+gQxVi1Y5VFiNc3vHjz+z9FgfHcsFmvcL6SQfM3gXSkNGjtFrJUYoyu1wAuTBcs77mf8gNhGeyQKR1ZdoQJASDDQy1SXawKxBm9qIbEO0W8mUP9sUYQmRJECmvgW/MK8APDEa8zQx0jMlY48R005abJO+L+lJ8rTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bu761F/c; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bu761F/c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E2HlTtwxLd9nT5IoqMKzFcnK1TKTGBf/+hXBsha3OC0=; b=bu761F/cnGf4xjmbFaozkvDJp5
	vTyxg5oOaCd7ENdEmVDL0pU4V4Cq8CyTcaWP1OPQ/uDWoBVYDCkSR7erU3TzyRMKF31PbksfmQL4k
	C6XALf30HUWZsHVB8WLlU0QqZItinPhKBn9DKrwxEN4yhXBPFhNOCNEktwcBNNwg0uhowEFGd56nU
	9Ol1G/jKa6RFZ3DL1CTotfPq69jYyMYz5c7OQXXh4+xfdL9tXNm5bMBWAuBJrkPgXWsiLlD3RWvKt
	ar/1SgXh/NFN6bN4mNyDU8ht9YE40T2JT93MmA4pPYZYO8JrSqs/I0VoNuFcmIoye6ctJ0x7kWjoY
	elQIcboA==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2bQn-00EHz1-5C; Wed, 09 Apr 2025 21:49:53 +0200
Message-ID: <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
Date: Wed, 9 Apr 2025 16:49:45 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations()
 error: uninitialized symbol 'ret'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>
References: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+ König

Hi Dan,

On 02/04/25 05:43, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
> commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
> date:   2 months ago
> config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
> 
> vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c
> 
> cdec4d3613230f Eric Anholt 2017-04-12  589  static int
> 04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> 04630796c437a9 Maíra Canal 2024-12-20  591  			 struct drm_exec *exec_ctx)
> cdec4d3613230f Eric Anholt 2017-04-12  592  {
> 04630796c437a9 Maíra Canal 2024-12-20  593  	int ret;
> cdec4d3613230f Eric Anholt 2017-04-12  594
> cdec4d3613230f Eric Anholt 2017-04-12  595  	/* Reserve space for our shared (read-only) fence references,
> cdec4d3613230f Eric Anholt 2017-04-12  596  	 * before we commit the CL to the hardware.
> cdec4d3613230f Eric Anholt 2017-04-12  597  	 */
> 04630796c437a9 Maíra Canal 2024-12-20  598  	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> 04630796c437a9 Maíra Canal 2024-12-20  599  	drm_exec_until_all_locked(exec_ctx) {
> 04630796c437a9 Maíra Canal 2024-12-20  600  		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> 04630796c437a9 Maíra Canal 2024-12-20  601  					     exec->bo_count, 1);
> 
> This is a false positive in Smatch.  I can silence the warning on my
> end easily enough to say that we always enter the drm_exec_until_all_locked()
> loop.  But the question is why do we only test the last "ret" instead of
> testing all of them?

AFAIU `drm_exec_until_all_locked` will loop until all GEM objects are
locked and no more contention exists. As we have a single operation
inside the loop, we don't need to check "ret" for every iteration.

I believe Christian will possibly give you a more precise answer as he
designed the API.

Best Regards,
- Maíra

> 
> 04630796c437a9 Maíra Canal 2024-12-20  602  	}
> cdec4d3613230f Eric Anholt 2017-04-12  603
> cdec4d3613230f Eric Anholt 2017-04-12 @604  	if (ret) {
> 04630796c437a9 Maíra Canal 2024-12-20  605  		drm_exec_fini(exec_ctx);
> cdec4d3613230f Eric Anholt 2017-04-12  606  		return ret;
> 7edabee06a5622 Eric Anholt 2016-09-27  607  	}
> d5b1a78a772f1e Eric Anholt 2015-11-30  608
> cdec4d3613230f Eric Anholt 2017-04-12  609  	return 0;
> cdec4d3613230f Eric Anholt 2017-04-12  610  }
> 

