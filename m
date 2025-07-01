Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD72741A6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373392; cv=none; b=fvddfCn582U/lNEdnh7W/GSxYPLJc9xdCLvr9L+j7dsALVTuS5ZARZqsl3L+MnWzknvwGK0n4UgWc9zFd53s7d1hSEChtDIdcu2234En9Yw8ioKcxdg21xN298UI0u3tpkuenNy4Ycasl6U1sMvWSMgrdvoXzNT0zcb7Ctozogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373392; c=relaxed/simple;
	bh=MApaGLQQ4BKwzsZ+u3pQuMyU2ltOy+ZVUKaiDcvr5tg=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KEgKfkEJlUpcFwRe9k72FPjyuK9V6x+8M5g1DaH2+TFsrsqo6Nxj6DZf99e4iLsUUcoq8zNbw1FL+fa5g/i2A7p65CcYQ9kW/2toMNPA9TwWW4VmkJqzL/xMcHBMNGVHVZkt1jFEXzm07Z28pgUsSJB5ie+0BV9lr2HpgdvSYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bWjBH5mnQz1d1gx;
	Tue,  1 Jul 2025 20:33:43 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 498C3140159;
	Tue,  1 Jul 2025 20:36:12 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 20:36:12 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 20:36:11 +0800
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 0/8] General updates and two new drivers for
 HiSilicon Uncore PMU
To: <will@kernel.org>, <mark.rutland@arm.com>
References: <20250619125557.57372-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <c5a99a5a-20d9-ef07-1cc3-cb025f446619@huawei.com>
Date: Tue, 1 Jul 2025 20:36:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250619125557.57372-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)

Hi Will and Mark,

just want to make sure the mail's not lost somehow, it's been skipped for the last cycle and
no further comment since v2.

thanks.

On 2025/6/19 20:55, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Support new version of DDRC/SLLC PMU identified with updated ACPI HID and
> register definition. In order to support this, we do a preliminary refactor
> to initialize device of each version by using driver data of each HID
> rather than checking the version. This will also make the driver easier to
> maintain and extend, since only the HID specific information along
> with the new HID will be added to support the new version without touching
> the common logic.
> 
> Two new Uncore PMU drivers is also added to support the monitoring the
> events of the system bus (by NoC PMU) and the DVM operations (by MN PMU).
> 
> Change since v2:
> - Rebase on 6.15-rc1, add Jonathan's tag.
> Link: https://lore.kernel.org/linux-arm-kernel/20250321073846.23507-1-yangyicong@huawei.com/
> 
> Change since v1:
> - Fold patch which extending the struct hisi_pmu_dev_info into its user
> - Use bit shift rather than bit mask for SLLC PMU registers configuration
> - Address other comments by Jonathan, thanks
> Link: https://lore.kernel.org/linux-arm-kernel/20250218092000.41641-1-yangyicong@huawei.com/
> 
> Junhao He (6):
>   drivers/perf: hisi: Simplify the probe process for each DDRC version
>   drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
>   drivers/perf: hisi: Use ACPI driver_data to retrieve SLLC PMU
>     information
>   drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
>   drivers/perf: hisi: Relax the event number check of v2 PMUs
>   drivers/perf: hisi: Add support for HiSilicon MN PMU driver
> 
> Yicong Yang (2):
>   drivers/perf: hisi: Support PMUs with no interrupt
>   drivers/perf: hisi: Add support for HiSilicon NoC PMU
> 
>  Documentation/admin-guide/perf/hisi-pmu.rst   |  11 +
>  drivers/perf/hisilicon/Makefile               |   3 +-
>  drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 354 ++++++++--------
>  drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |   6 +-
>  drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 355 ++++++++++++++++
>  drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 392 ++++++++++++++++++
>  drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |   2 +-
>  drivers/perf/hisilicon/hisi_uncore_pmu.c      |  11 +-
>  drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
>  drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 220 +++++++---
>  10 files changed, 1098 insertions(+), 258 deletions(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> 
