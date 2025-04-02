Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF56A1AAA29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583411; cv=none; b=L8Y5fxs4Es6RRV9kqPCcurWunZmC8IeBG1SbEgL+QA7LiG4OwtmyjlonTzeMEQ99tMMXoww3Z6xaKwcjwqBcjCiVn2JPufFWbcRct8JmsziRlEMjqVSZN/apuvbMZIvC5nUj7IyACNGY7A7mhQMXnTp3lEahti3Tf5amXXfHi6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583411; c=relaxed/simple;
	bh=Kveb9atVJLnju8DdyOzVv8KDNpYBCjT9yUm3lhdIbSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwDyK58T0imvIxxgHl4up8Un1zfutsQJqe3QBUZ3sbRCAwL5eCJziO+yUiJdDX+emqeqlEah1eO1key5xFvvhwmiRwIaMjq9PENip124RichBNgGTy59ewx61srajyvS8fO8Hb9fdkR7rlQugwXG+d5JpDukP3/z4m/w4KjtAFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHvGdN6V; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHvGdN6V"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso300199f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583408; x=1744188208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MywdYD3IK46xGltB4W9LLSjkk8V2I4wOGeWZw0m6r78=;
        b=hHvGdN6VO/bbyVjkTB2e2mQhpXWON8kpEBUjN+qneMO9u0G87PbmmVndcsAW2QQQ1y
         KR8wu7j3/uvjHMtN+20GEC5FO63ydNzHsApF3abczTz0T7d1PPjm32yTfV3N0ZSarEtY
         Z+BBmvSEa1+sVmNkez97Y3wHYZREUXyrssXbXpBs0pEEsfNpQCyUHZFls607FfByfAVk
         BkjXaWLw0DYnLzqInwisBNOYEKLcgpu77XsELVvOv/J3N/PlTUQ8nnk5Qb76JBR73He6
         9xQXOfGByz8HuVEq+1Fd5wzlVnI3jhd96feu8jT3BZF5I692jMlwy+u2qlGBcs5/kO+G
         Cipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583408; x=1744188208;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MywdYD3IK46xGltB4W9LLSjkk8V2I4wOGeWZw0m6r78=;
        b=VzmYQzMrjdTIcR/oYfHxAHfw1Pwrl4348SuIBFeZ4Ae0L2t2P2KfdYM97nR1ITLpQb
         NIadwWY0HkwFWaiXDR3WzLOyH/gZKXIAfKVJLQLq+99X44pNFxUq9CcJmZtPDy+t5ha6
         gvv7KSHoHT83NGRUrkZMjQryDsTx/iotgf9Lq5ReuDGbYoLlPrdike57XSLs9QbGPZnm
         ilCJeoUP5iZl7y6w5FWC8+8mmpaL7rILf3eS7aYVc9aaAVSctC5L+kvaPGEM4APio5Rp
         CRkAouIAlNS3F1YOxZfofoypFpeWZUeWBPlPVxc/iwR2wODzoBGyjdu7DaesqTlIp89s
         IMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPlUDOrdJqX+8J0puJodAb3cHdu0borTg3A3K93M8BfOskb/gb2aYXPX/Ob1dMOebjWFqzHtKY2nvRGBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTH2MxAUL9AGeDx/tVQ6PymLUNlHJtZaGyan0l+ZWqFmXJLZrL
	8ON+0l0x0ZM8UihLVFO1Q1ceN4h5eLx8br8C12hS68s/TYKiOPC6hz3pCmawUM8=
X-Gm-Gg: ASbGncsXhVz9xdz6n7WAUYvpwCGb42/N5bC5k1FptJHVjxYjqDfA8lUhSqRUUizvfYx
	dQ3EBqbw8kGEFzozrHJQMZlN+dha8NFRs8b7yJPZQqRc84v1f1qjIk9OTNBcBh/0N3uow1qAWZW
	pLgeA+YQQU7DQ3mU6pnKWK1qIwI69yyu8QLn7i4gNCB/5PUfEZuJ/qaY1hs/K9Hb+cnF1nLV4rb
	yiGn2bBeiKs8iELWPcLkaPrvjDvHaX3pELW0V7RwcF3Xy32WTYMjHO1EU8pmFEQojvtPcRPDWOC
	Ks6G6PTZLRcXA/MQfDkyS3jpK0hOvCYmLx+1FMj+dNxSZx68uQ==
X-Google-Smtp-Source: AGHT+IE5eJjzFzKgLbEhHe/LWXL3GWvq9N0z7X0b0Tq6//QeucYYtfOz5/gw451nA9yosCEuAa7qpQ==
X-Received: by 2002:a5d:584f:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-39c2a668cb9mr1095356f8f.8.1743583408087;
        Wed, 02 Apr 2025 01:43:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a3d66sm16162069f8f.81.2025.04.02.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:43:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:43:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>
Subject: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error:
 uninitialized symbol 'ret'.
Message-ID: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
date:   2 months ago
config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.

vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c

cdec4d3613230f Eric Anholt 2017-04-12  589  static int
04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
04630796c437a9 Maíra Canal 2024-12-20  591  			 struct drm_exec *exec_ctx)
cdec4d3613230f Eric Anholt 2017-04-12  592  {
04630796c437a9 Maíra Canal 2024-12-20  593  	int ret;
cdec4d3613230f Eric Anholt 2017-04-12  594  
cdec4d3613230f Eric Anholt 2017-04-12  595  	/* Reserve space for our shared (read-only) fence references,
cdec4d3613230f Eric Anholt 2017-04-12  596  	 * before we commit the CL to the hardware.
cdec4d3613230f Eric Anholt 2017-04-12  597  	 */
04630796c437a9 Maíra Canal 2024-12-20  598  	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
04630796c437a9 Maíra Canal 2024-12-20  599  	drm_exec_until_all_locked(exec_ctx) {
04630796c437a9 Maíra Canal 2024-12-20  600  		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
04630796c437a9 Maíra Canal 2024-12-20  601  					     exec->bo_count, 1);

This is a false positive in Smatch.  I can silence the warning on my
end easily enough to say that we always enter the drm_exec_until_all_locked()
loop.  But the question is why do we only test the last "ret" instead of
testing all of them?

04630796c437a9 Maíra Canal 2024-12-20  602  	}
cdec4d3613230f Eric Anholt 2017-04-12  603  
cdec4d3613230f Eric Anholt 2017-04-12 @604  	if (ret) {
04630796c437a9 Maíra Canal 2024-12-20  605  		drm_exec_fini(exec_ctx);
cdec4d3613230f Eric Anholt 2017-04-12  606  		return ret;
7edabee06a5622 Eric Anholt 2016-09-27  607  	}
d5b1a78a772f1e Eric Anholt 2015-11-30  608  
cdec4d3613230f Eric Anholt 2017-04-12  609  	return 0;
cdec4d3613230f Eric Anholt 2017-04-12  610  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

