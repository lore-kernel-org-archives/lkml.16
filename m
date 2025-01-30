Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C62770C;
	Thu, 30 Jan 2025 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738256671; cv=none; b=gQ9rhHHOdvgjNiIQ/0HPXYeIiXWYzZudWz8OPNqe4DtLKdufHdBGWM27LTFM7Sx+6INeY6jhs+j8k+NsOvBod5tyzqpzC3atjM+3J+3fi6BcxQSvlheIAtREkaWekRhGFQZVZ1rgyr1p53uQ1fueY/LR6+VKU/Lp1xMelXw5ivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738256671; c=relaxed/simple;
	bh=Lu7Ly00M64WhlWAHI8xibHOBtF91GEe1SiFuc3Gedtg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYaXFC7VK6zg7vaTxiszFI0PA15rceiBIn4PLLVaLuiu+4Q/jvN+NufG3vuSBCfNYWzbnkxVns9ybOx2U3ULGHrc1uWaEDV8uEqkNSCCwzE8EHhswFd10AbJBYBsbNxbIe2I68fBfE1layZyhIt0qT5WIRMfUWFtZSKa1toGxyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YkQL54sWyz6L4tt;
	Fri, 31 Jan 2025 01:02:05 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 20E02140A71;
	Fri, 31 Jan 2025 01:04:25 +0800 (CST)
Received: from localhost (10.195.245.124) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 30 Jan
 2025 18:04:24 +0100
Date: Thu, 30 Jan 2025 17:04:22 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, "Bjorn Andersson"
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "
 =?ISO-8859-1?Q?N=EDcolas?= \"F. R. A. Prado\"" <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <20250130170422.00004c6f@huawei.com>
In-Reply-To: <20250116045911.3382537-2-fj5100bi@fujitsu.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 16 Jan 2025 04:59:10 +0000
Yoshihiro Furudera <fj5100bi@fujitsu.com> wrote:

> This adds a new dynamic PMU to the Perf Events framework to program and
> control the Uncore MAC PMUs in Fujitsu chips.
> 
> This driver was created with reference to drivers/perf/qcom_l3_pmu.c.
> 
> This driver exports formatting and event information to sysfs so it can
> be used by the perf user space tools with the syntaxes:
> 
> perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
> perf stat -e mac_iod0_mac0_ch0/event=0x80/ ls
> 
> FUJITSU-MONAKA Specification URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
Hi,
Other than the docs issue, just minor comments inline.

With the docs adjusted,
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

It's been a while since I closely reviewed a PMU driver
so I may have missed some stuff!

Jonathan

> ---
>  .../admin-guide/perf/fujitsu_mac_pmu.rst      |  75 +++
>  Documentation/admin-guide/perf/index.rst      |   1 +
>  drivers/perf/Kconfig                          |   9 +
>  drivers/perf/Makefile                         |   1 +
>  drivers/perf/fujitsu_mac_pmu.c                | 573 ++++++++++++++++++
>  5 files changed, 659 insertions(+)
>  create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
>  create mode 100644 drivers/perf/fujitsu_mac_pmu.c
> 
> diff --git a/Documentation/admin-guide/perf/fujitsu_mac_pmu.rst b/Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
> new file mode 100644
> index 000000000000..b6676526bde2
> --- /dev/null
> +++ b/Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
> @@ -0,0 +1,75 @@
> +====================================================
> +Fujitsu Uncore MAC Performance Monitoring Unit (PMU)
> +====================================================
> +
> +This driver supports the Uncore MAC PMUs found in Fujitsu chips.
> +Each MAC PMU on these chips is exposed as a uncore perf PMU with device name
> +mac_iod<iod>_mac<mac>_ch<ch>.
> +
> +The driver provides a description of its available events and configuration
> +options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/.
> +This driver exports:
> +- formats, used by perf user space and other tools to configure events
> +- events, used by perf user space and other tools to create events
> +  symbolically, e.g.:
> +    perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
> +- cpumask, used by perf user space and other tools to know on which CPUs
> +  to open the events
> +
> +This driver supports the following events:
> +- cycles
> +  This event counts MAC cycles at MAC frequency.
> +- read-count
> +  This event counts the number of read requests to MAC.
> +- read-count-request
> +  This event counts the number of read requests including retry to MAC.
> +- read-count-return
> +  This event counts the number of read requests to MAC.
> +- read-count-request-pftgt
> +  This event counts the number of read requests including retry with PFTGT
> +  flag.
> +- read-count-request-normal
> +  This event counts the number of read requests including retry without PFTGT
> +  flag.
> +- read-count-return-pftgt-hit
> +  This event counts the number of read requests which hit the PFTGT buffer.
> +- read-count-return-pftgt-miss
> +  This event counts the number of read requests which miss the PFTGT buffer.
> +- read-wait
> +  This event counts outstanding read requests issued by DDR memory controller
> +  per cycle.
> +- write-count
> +  This event counts the number of write requests to MAC (including zero write,
> +  full write, partial write, write cancel).
> +- write-count-write
> +  This event counts the number of full write requests to MAC (not including
> +  zero write).
> +- write-count-pwrite
> +  This event counts the number of partial write requests to MAC.
> +- memory-read-count
> +  This event counts the number of read requests from MAC to memory.
> +- memory-write-count
> +  This event counts the number of full write requests from MAC to memory.
> +- memory-pwrite-count
> +  This event counts the number of partial write requests from MAC to memory.
> +- ea-mac
> +  This event counts energy consumption of the MAC.
> +- ea-memory
> +  This event counts energy consumption of the memory.
> +- ea-memory-mac-read
> +  This event counts the number of read requests from MAC to memory.
> +- ea-memory-mac-write
> +  This event counts the number of write requests from MAC to memory.
> +- ea-memory-mac-pwrite
> +  This event counts the number of partial write requests from MAC to memory

Text identical to memory-pwrite-count
which suggest two things.
a) naming inconsistent.  Why is mac mentioned here and not in the name earlier.
b) This comment is perhaps wrong as I assume has something more tod owtih with
   energy estimation?

> +- ea-ha
> +  This event counts energy consumption of the HA.
> +
> +  'ea' is the abbreviation for 'Energy Analyzer'.

> diff --git a/drivers/perf/fujitsu_mac_pmu.c b/drivers/perf/fujitsu_mac_pmu.c
> new file mode 100644
> index 000000000000..788bf05b05e7
> --- /dev/null
> +++ b/drivers/perf/fujitsu_mac_pmu.c
> @@ -0,0 +1,573 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for the Uncore MAC PMUs in Fujitsu chips.
> + *
> + * See Documentation/admin-guide/perf/fujitsu_mac_pmu.rst for more details.
> + *
> + * This driver is based on drivers/perf/qcom_l3_pmu.c
> + * Copyright (c) 2015-2017, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Fujitsu. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/list.h>
> +#include <linux/module.h>

mod_devicetable.h
for the acpi device table.

> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +
> +/* Number of counters on each PMU */
> +#define MAC_NUM_COUNTERS  8
> +/* Mask for the event type field within perf_event_attr.config and EVTYPE reg */
> +#define MAC_EVTYPE_MASK   0xFF
> +
> +/* Perfmon registers */
> +#define MAC_PM_EVCNTR(__cntr) (0x000 + __cntr * 8)
> +#define MAC_PM_CNTCTL(__cntr) (0x100 + __cntr * 8)
> +#define MAC_PM_EVTYPE(__cntr) (0x200 + __cntr * 8)
(0x200 + (__cntr) * 8)
preferred as avoids any possibility of precedence issues
if __cntr isn't simply a number.



> +/*
> + * We must NOT create groups containing events from multiple hardware PMUs,
> + * although mixing different software and hardware PMUs is allowed.
> + */
> +static bool fujitsu_mac__validate_event_group(struct perf_event *event)
> +{
> +	struct perf_event *leader = event->group_leader;
> +	struct perf_event *sibling;
> +	int counters = 0;
> +
> +	if (leader->pmu != event->pmu && !is_software_event(leader))
> +		return false;
> +
> +	/* The sum of the counters used by the event and its leader event */
> +	counters = 2;
> +
> +	for_each_sibling_event(sibling, leader) {
> +		if (is_software_event(sibling))
> +			continue;
> +		if (sibling->pmu != event->pmu)
> +			return false;
> +		counters += 1;

		counters++; ?

> +	}
> +
> +	/*
> +	 * If the group requires more counters than the HW has, it
> +	 * cannot ever be scheduled.
> +	 */
> +	return counters <= MAC_NUM_COUNTERS;
> +}


> +
> +#define MAC_PMU_FORMAT_ATTR(_name, _config)				      \
> +	(&((struct dev_ext_attribute[]) {				      \
> +		{ .attr = __ATTR(_name, 0444, device_show_string, NULL),      \
> +		  .var = (void *) _config, }				      \
> +	})[0].attr.attr)
> +
> +static struct attribute *fujitsu_mac_pmu_formats[] = {
> +	MAC_PMU_FORMAT_ATTR(event, "config:0-7"),
> +	NULL
> +};
> +
> +static const struct attribute_group fujitsu_mac_pmu_format_group = {
> +	.name = "format",
> +	.attrs = fujitsu_mac_pmu_formats
Add trailing comma.
> +};

> +
> +static const struct attribute_group fujitsu_mac_pmu_events_group = {
> +	.name = "events",
> +	.attrs = fujitsu_mac_pmu_events
Add trailing comma. There might be other fields in future.

> +};
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct mac_pmu *macpmu = to_mac_pmu(dev_get_drvdata(dev));
> +
> +	return cpumap_print_to_pagebuf(true, buf, &macpmu->cpumask);
> +}
> +
I would drop this blank line to tightly associate the following
declaration with the function above.

> +static DEVICE_ATTR_RO(cpumask);
> +

> +static int fujitsu_mac_pmu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct acpi_device *acpi_dev;
> +	struct mac_pmu *macpmu;
> +	struct resource *memrc;
> +	char *name;
> +	int ret;
> +	u64 uid;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev)
> +		return -ENODEV;
> +
> +	ret = acpi_dev_uid_to_integer(acpi_dev, &uid);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to read ACPI uid\n");
> +
> +	macpmu = devm_kzalloc(dev, sizeof(*macpmu), GFP_KERNEL);
> +	if (!macpmu)
> +		return -ENOMEM;
> +
> +	name = devm_kasprintf(dev, GFP_KERNEL, "mac_iod%llu_mac%llu_ch%llu",
> +			  (uid >> 8) & 0xF, (uid >> 4) & 0xF, uid & 0xF);

Slightly novel to encode that much in a UID, but nothing stops you doing
that so I don't really mind.  We always went with additional properties
for our platforms but this is fine I think.

> +	if (!name)
> +		return -ENOMEM;
> +
> +	macpmu->pmu = (struct pmu) {
> +		.parent		= dev,
> +		.task_ctx_nr	= perf_invalid_context,
> +
> +		.pmu_enable	= fujitsu_mac__pmu_enable,
> +		.pmu_disable	= fujitsu_mac__pmu_disable,
> +		.event_init	= fujitsu_mac__event_init,
> +		.add		= fujitsu_mac__event_add,
> +		.del		= fujitsu_mac__event_del,
> +		.start		= fujitsu_mac__event_start,
> +		.stop		= fujitsu_mac__event_stop,
> +		.read		= fujitsu_mac__event_read,
> +
> +		.attr_groups	= fujitsu_mac_pmu_attr_grps,
> +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE
> +	};
> +
> +	macpmu->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &memrc);
> +	if (IS_ERR(macpmu->regs))
> +		return PTR_ERR(macpmu->regs);
> +
> +	fujitsu_mac__init(macpmu);
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret <= 0)
> +		return ret;

If it were 0 you'd not want to return that as would look like your driver
probed successfully and none of the devm cleanup would happen.

	if (ret < 0)
is fine - see docs for platform_get_irq() that make it clear 0 is never
returned.


> +
> +	ret = devm_request_irq(dev, ret, fujitsu_mac__handle_irq, 0,
> +			       name, macpmu);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Request for IRQ failed for slice @%pa\n",

I would wrap this under d of dev.

> +						&memrc->start);

Indent of this line is also unusual.

> +
> +	/* Add this instance to the list used by the offline callback */
> +	ret = cpuhp_state_add_instance(mac_pmu_cpuhp_state, &macpmu->node);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Error registering hotplug");
> +
> +	ret = perf_pmu_register(&macpmu->pmu, name, -1);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register MAC PMU\n");
> +
> +	dev_dbg(dev, "Registered %s, type: %d\n", name, macpmu->pmu.type);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id fujitsu_mac_pmu_acpi_match[] = {
> +	{ "FUJI200C", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, fujitsu_mac_pmu_acpi_match);
> +
> +static struct platform_driver fujitsu_mac_pmu_driver = {
> +	.driver = {
> +		.name = "fujitsu-mac-pmu",
> +		.acpi_match_table = fujitsu_mac_pmu_acpi_match,
> +		.suppress_bind_attrs = true

Add trailing comma.  Not impossible we will want to set another field in
here one day. So we should not make that harder.

> +	},
> +	.probe = fujitsu_mac_pmu_probe
> +};

