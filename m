Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607E259CAD
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039366; cv=none; b=OBRbJQYcKwQ42V4EmFBvnr+nT3K0Nep4/2rd6DmH5o7D/kRyNwaMYlP7QXxqxLYoEGit8Uk/KKhV2GAb5CLfAAOiVtYjgG7NNZOhmTBFJLLyb+qxQTuQNi2EmVO9SlUBgV33GjQMZ6nE5LCHVKOL/mVW4Pno8DB+fxeqO3qzDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039366; c=relaxed/simple;
	bh=7vtLePo47hC4kVAXbOxHqk6uHG7a3WRJ0lP0LMNYQvs=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=V69BNOIStmP+0/s8teG9zRm1BZuI/UERpFko7baPkA0TRcBu7DDOVeQOFSpuTzyNrHhe81Glkk1jjWVar/X+/2KV6ozbrRsMkb5hHEhMc8UbOALlgYmdxtkheVfyUw1zXnoaZNPgHMTGQvaWx9x72OXNsEO2A0A3S6nvVUxBrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZwtPs3n39zsSfk;
	Mon, 12 May 2025 16:41:53 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 03EC4180044;
	Mon, 12 May 2025 16:42:35 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 12 May 2025 16:42:34 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 12 May 2025 16:42:34 +0800
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [RESEND PATCH v3 0/8] General updates and two new drivers for
 HiSilicon Uncore PMU
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250425090029.50786-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e45f5183-d1ff-970b-3b15-7f7239b6b405@huawei.com>
Date: Mon, 12 May 2025 16:42:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250425090029.50786-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)

a gentle ping on this...

thanks.

On 2025/4/25 17:00, Yicong Yang wrote:
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
