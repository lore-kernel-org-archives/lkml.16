Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39D264FA5;
	Wed,  9 Apr 2025 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207666; cv=none; b=NlFlhBXrUb1bDbXvE5+d+v5E2d6qAjWG479mXC+GfYsxncElB3BS823Q/5vKoPOJpqOc5smh5RckRcIRsAyIGIL3ylfZnAnIApXLi+233kUHJl99gUkstBOaslEdjO8Jtqrg1phFELYK4am13hMHAaYKJad9rCTvKY59JiutCko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207666; c=relaxed/simple;
	bh=XZBwGz84oz5gY/BVxkIjEz6jrXTDq3RAuIKk6QEQegs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afW/wBRNG6SPIhlkaVmj0G6BTGaU3g18XT5nrsNvFJsnON2Qe5vu+HZ12wRhffwjGUgFngqJZU6eECUr+TXIYr2U8v3ufjZi5zNzpueBXOvWDqfX9nf6evMHgQmKgg/bFQpwWyGvswrPjaWf0XQCPpgNqOOFm/11AE2TS4y1n7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZw/mxHW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZw/mxHW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D36FC4CEE2;
	Wed,  9 Apr 2025 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744207666;
	bh=XZBwGz84oz5gY/BVxkIjEz6jrXTDq3RAuIKk6QEQegs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZw/mxHWwnx25jKL/1vo+xxH9LpShsURClxuY2VX0P4bP6XDreB/WfU7gqjlItL4n
	 LbILmIGt9d91a0cFpGQ4SPaQKtyim0vU1+nyaZpUXHNq7LY70kxHYvKOEACRjC9+/r
	 tZLh7YGbrzUHT0E5Fhz7j3TS51QBpubK6nVmL8z/4fenDqdO69l1Fv/cQ7URn8uXir
	 wOc+X4vzkBi407wFjEl+M9ykCwi14egO0OlflFJVOobS8qLAAxtGfFCQNHtVQhgaTX
	 WDe7AsmWyW5tt4ALFnGVULQH9MZsyHqK69Rf9nMTmJA4O0fGMMuUUhP351QWoIwGrT
	 9vkt/BIDUb96g==
Message-ID: <125f9c26-4e01-4478-8f68-6fddea69e136@kernel.org>
Date: Wed, 9 Apr 2025 16:07:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] arm64: Kconfig: Enable GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 kernel test robot <lkp@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250408-gicv5-host-v1-24-1f26db465f8d@kernel.org>
 <202504092127.YaPW3UWk-lkp@intel.com> <Z/Z+VtK96h1yezE7@lpieralisi>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z/Z+VtK96h1yezE7@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 16:04, Lorenzo Pieralisi wrote:
> On Wed, Apr 09, 2025 at 09:44:42PM +0800, kernel test robot wrote:
>> Hi Lorenzo,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on 0af2f6be1b4281385b618cb86ad946eded089ac8]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Pieralisi/Documentation-devicetree-bindings-Add-GICv5-DT-bindings/20250408-190630
>> base:   0af2f6be1b4281385b618cb86ad946eded089ac8
>> patch link:    https://lore.kernel.org/r/20250408-gicv5-host-v1-24-1f26db465f8d%40kernel.org
>> patch subject: [PATCH 24/24] arm64: Kconfig: Enable GICv5
>> config: arm64-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092127.YaPW3UWk-lkp@intel.com/config)
>> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092127.YaPW3UWk-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504092127.YaPW3UWk-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/irqchip/irq-gic-v5-iwb.c:298:3: error: cannot jump from this goto statement to its label
>>      298 |                 goto out_free;
>>          |                 ^
>>    drivers/irqchip/irq-gic-v5-iwb.c:300:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
>>      300 |         guard(mutex)(&its->dev_alloc_lock);
> 
> This is clearly wrong, will update code in the IWB (if we are keeping
> the current IWB driver) and ITS by removing the guard where misused and
> keeping the mutex_lock/unlock().

Just remember to build your code with clang and W=1. Especially if you
use anything from cleanup.

Best regards,
Krzysztof
