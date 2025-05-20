Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D92725D203
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755729; cv=none; b=EHvHSly7KXtA6X2QabG/2DcQXY/O/uqBqXDdEUyVEg8VPrcuAIp58DAqkBLvGKgvnC7bZYjpYiUYGM/o4e26Sm6R8+JSxXDHacgT4xXUSLMLBTGpq30IfZHrUYA08Rmc9LqEFyhaoK1/2yQap7pEWDl/sPQ68WHX02tiZ240XkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755729; c=relaxed/simple;
	bh=QI4jvEcA60Ps4kNF/VOq0M1EwfjwQ92S4nm9GJDHxek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GywVdPx9MDLmSZ4xGZKZRZOzMIuHujvOFH9YgfEBs4uJ/dvJ16uG972EmPrQb8PbSGCe8s/tJguqXJwPPNA4kr32r50vsjByPfpw5+O3HDqVPodkX73m9admio6GZQGX65ifH6wDeXKRQx9KGJRyXACIqVM1/ajnWH0ai29PkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 435B81516;
	Tue, 20 May 2025 08:41:53 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88F8F3F6A8;
	Tue, 20 May 2025 08:42:05 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] coresight: prevent deactivate active config while enabling the config
Date: Tue, 20 May 2025 16:41:56 +0100
Message-ID: <174775569626.300098.16572506497364238562.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514161951.3427590-1-yeoreum.yun@arm.com>
References: <20250514161951.3427590-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 May 2025 17:19:48 +0100, Yeoreum Yun wrote:
> While enable active config via cscfg_csdev_enable_active_config(),
> active config could be deactivated via configfs' sysfs interface.
> This could make UAF issue in below scenario:
> 
> CPU0                                          CPU1
> (sysfs enable)                                load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
> lock(csdev->cscfg_csdev_lock)
> // here load config activate by CPU1
> unlock(csdev->cscfg_csdev_lock)
> 
> [...]

Applied, thanks!

[1/3] coresight/etm4: fix missing disable active config
      https://git.kernel.org/coresight/c/895b12b7
[2/3] coresight: holding cscfg_csdev_lock while removing cscfg from csdev
      https://git.kernel.org/coresight/c/53b9e265
[3/3] coresight: prevent deactivate active config while enabling the config
      https://git.kernel.org/coresight/c/408c97c4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
