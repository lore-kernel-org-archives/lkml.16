Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E435963
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337771; cv=none; b=L58C7DfmzKEA58R19KU8Yst/6bC52m8mQPWT0jHFqz1EOE+WRhOc4/YH1XUjkIyUT+mEKrB4PTv/NK/Mj9cJpefgIy+iIUpSNHPuwR8gehVN8Fs6KxkxF2HXdyGVWjfWrpSiY2f99fpTYZvvrBxjQ2s0C9BIkpkbKdOle9MlcrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337771; c=relaxed/simple;
	bh=yMv4SY0fnld2VBgAtUr1s5+LhOrGDoyQMSowsDCxdSc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P3yRm7bST9QKyRMm6XRbSMzc0DOdumPNMkRevBkROZDaSTcSuOcUId9lc8E8Iurkw8M0Va56VJmjJH1uLQE7SUI45dt7S8q+oyNSV4kzbLh3Zuf4snaw/YTsxcBUnpO2OOW6H6cCwUzF98I8MbDEYMJwnZBfw9W2TdPQFwQmdpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bNLCt48KWz2TSql;
	Thu, 19 Jun 2025 20:54:34 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C02A18001B;
	Thu, 19 Jun 2025 20:56:04 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:04 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:03 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RESEND PATCH v3 0/8] General updates and two new drivers for HiSilicon Uncore PMU
Date: Thu, 19 Jun 2025 20:55:49 +0800
Message-ID: <20250619125557.57372-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemq200018.china.huawei.com (7.202.195.108)

From: Yicong Yang <yangyicong@hisilicon.com>

Support new version of DDRC/SLLC PMU identified with updated ACPI HID and
register definition. In order to support this, we do a preliminary refactor
to initialize device of each version by using driver data of each HID
rather than checking the version. This will also make the driver easier to
maintain and extend, since only the HID specific information along
with the new HID will be added to support the new version without touching
the common logic.

Two new Uncore PMU drivers is also added to support the monitoring the
events of the system bus (by NoC PMU) and the DVM operations (by MN PMU).

Change since v2:
- Rebase on 6.15-rc1, add Jonathan's tag.
Link: https://lore.kernel.org/linux-arm-kernel/20250321073846.23507-1-yangyicong@huawei.com/

Change since v1:
- Fold patch which extending the struct hisi_pmu_dev_info into its user
- Use bit shift rather than bit mask for SLLC PMU registers configuration
- Address other comments by Jonathan, thanks
Link: https://lore.kernel.org/linux-arm-kernel/20250218092000.41641-1-yangyicong@huawei.com/

Junhao He (6):
  drivers/perf: hisi: Simplify the probe process for each DDRC version
  drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
  drivers/perf: hisi: Use ACPI driver_data to retrieve SLLC PMU
    information
  drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
  drivers/perf: hisi: Relax the event number check of v2 PMUs
  drivers/perf: hisi: Add support for HiSilicon MN PMU driver

Yicong Yang (2):
  drivers/perf: hisi: Support PMUs with no interrupt
  drivers/perf: hisi: Add support for HiSilicon NoC PMU

 Documentation/admin-guide/perf/hisi-pmu.rst   |  11 +
 drivers/perf/hisilicon/Makefile               |   3 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 354 ++++++++--------
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |   6 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 355 ++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 392 ++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |   2 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  11 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 220 +++++++---
 10 files changed, 1098 insertions(+), 258 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

-- 
2.24.0

