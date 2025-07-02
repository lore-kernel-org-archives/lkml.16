Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01806101DE;
	Wed,  2 Jul 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473404; cv=none; b=THwd+z+TNi4dICT/q5+yjqrGHm6oQdM93bNHe7dGPIa8zlhUxTUtwb0NFwFyMt6nEOqs4S7HNPA+7CYoCf+WDcAsSlRmcBOhW/xV5BwrfeBNGY6nbOHs/3i1CtjgOzXS7ehUwLmIwTYYz1zPaIcTzM3PJKg7new5BmJdwH5vnFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473404; c=relaxed/simple;
	bh=fYVUHcGXuXgCgpqOkZIAJT1XR4RaxdGG0zliMP2efjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3pCXGpt5GdjcJQmnAN1/meEotBhGQQfE2amRK80b868j9Liy3fTbF5kMx4TLSUasAnqs+7uPO3CV4YqjPBBtX2OeFUDCyYExSjgJ2gJxXfRHaEH8D9m7EZvTND2sT5wqMQv3vEMsg+JfMN/OD11eSaKhOCEFEZIb+MJgs2pg78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsGEZ2Ce; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsGEZ2Ce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ED8C4CEE7;
	Wed,  2 Jul 2025 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473403;
	bh=fYVUHcGXuXgCgpqOkZIAJT1XR4RaxdGG0zliMP2efjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsGEZ2Ceh+RsllyA1Uv4oQdkpwdt0S2EPdURLWB1uNlzdx9d0dusMscw3dW/aknlj
	 COs92Rquf2x6maGv0YQEBRqzcFQG2Bky2wEMh0uAXrUS3Cu9w5Nmc785pYCRmNBHhN
	 GpiMnUClAKWDGj6kJ6zQCGtivXPzfUf3BPjjGOH2aRcbcCsiC6Y2xb6kp837g9EVw4
	 qGtE+dKJ4dKBqxLJJJD+OjtA6VDYkNRrOruXD5+pS6jEFYX4E4VMM8HSe49EXFvpuI
	 CZv48pZGEOSsGc2YejCZgBlzjIpbGt06TuWzsIi4z8sbsjcZcuTbdS7iBZ9qV95f4h
	 XTfGYDIstc/kw==
Date: Wed, 2 Jul 2025 17:23:18 +0100
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Corey Minyard <minyard@acm.org>, oe-kbuild-all@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function
 support
Message-ID: <20250702162318.GZ10134@google.com>
References: <78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin@loongson.cn>
 <202507021011.sDAHGinj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202507021011.sDAHGinj-lkp@intel.com>

On Wed, 02 Jul 2025, kernel test robot wrote:

> Hi Binbin,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 3d77b3cc7cc8115d89fa14eaf601e56372953484]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250626-203353
> base:   3d77b3cc7cc8115d89fa14eaf601e56372953484
> patch link:    https://lore.kernel.org/r/78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin%40loongson.cn
> patch subject: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507021011.sDAHGinj-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021011.sDAHGinj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507021011.sDAHGinj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/mfd/ls2k-bmc-core.c: In function 'ls2k_bmc_pdata_initial':
> >> drivers/mfd/ls2k-bmc-core.c:349:15: error: implicit declaration of function 'acpi_register_gsi' [-Wimplicit-function-declaration]
>      349 |         irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
>          |               ^~~~~~~~~~~~~~~~~
> >> drivers/mfd/ls2k-bmc-core.c:376:9: error: implicit declaration of function 'acpi_unregister_gsi'; did you mean 'arch_unregister_cpu'? [-Wimplicit-function-declaration]
>      376 |         acpi_unregister_gsi(gsi);
>          |         ^~~~~~~~~~~~~~~~~~~
>          |         arch_unregister_cpu

Is this error valid?

-- 
Lee Jones [李琼斯]
