Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCA71474B8
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529543; cv=none; b=WENkPPry9v0LPkwIPj6UrInglq8+NoxYsHhpIchiEIFw6a1xYQddbvqdZj+/JYQ1ySy6lea7XiPaYFT6c1Gw2YqWJcvlowpmABIhS1siokyObaGBb0bC22E+M8cfF+p06wTAxWeGIiOD+CDCcc05X1gbryvQpo77xkpPxffMUAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529543; c=relaxed/simple;
	bh=C6D2Qs77TfFaEEkGAb3RmEHmCZ2E02PUE4L+fd6eAak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNnrIcRVZel842XYztDbYLQlOSL6roMuOZJUk90UVMffiGehGi7YyBdrg34hcBA0JjHdHTg/lVOUgM+d5fz371r66AbzxKXg2Ak4AvyJYinyeOQBQAzRyBCxfDGo71RIJ+1mMw/WuaFenF231VdSVcXxuJE7GGyAh3TVH5DV9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B7A113E;
	Tue,  6 May 2025 04:05:31 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 363B33F58B;
	Tue,  6 May 2025 04:05:40 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH] coresight: replicator: Fix panic for clearing claim tag
Date: Tue,  6 May 2025 12:05:26 +0100
Message-ID: <174652950905.248615.15182322345223514612.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502111108.2726217-1-leo.yan@arm.com>
References: <20250502111108.2726217-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 May 2025 12:11:08 +0100, Leo Yan wrote:
> On platforms with a static replicator, a kernel panic occurs during boot:
> 
>   [    4.999406]  replicator_probe+0x1f8/0x360
>   [    5.003455]  replicator_platform_probe+0x64/0xd8
>   [    5.008115]  platform_probe+0x70/0xf0
>   [    5.011812]  really_probe+0xc4/0x2a8
>   [    5.015417]  __driver_probe_device+0x80/0x140
>   [    5.019813]  driver_probe_device+0xe4/0x170
>   [    5.024032]  __driver_attach+0x9c/0x1b0
>   [    5.027900]  bus_for_each_dev+0x7c/0xe8
>   [    5.031769]  driver_attach+0x2c/0x40
>   [    5.035373]  bus_add_driver+0xec/0x218
>   [    5.039154]  driver_register+0x68/0x138
>   [    5.043023]  __platform_driver_register+0x2c/0x40
>   [    5.047771]  coresight_init_driver+0x4c/0xe0
>   [    5.052079]  replicator_init+0x30/0x48
>   [    5.055865]  do_one_initcall+0x4c/0x280
>   [    5.059736]  kernel_init_freeable+0x1ec/0x3c8
>   [    5.064134]  kernel_init+0x28/0x1f0
>   [    5.067655]  ret_from_fork+0x10/0x20
> 
> [...]

Applied, thanks!

[1/1] coresight: replicator: Fix panic for clearing claim tag
      https://git.kernel.org/coresight/c/f42df204

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
