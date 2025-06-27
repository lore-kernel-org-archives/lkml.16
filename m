Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2622BEFEF;
	Fri, 27 Jun 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024595; cv=none; b=HFhZYgvywIdCzFRv8oTcy38v6XxYQK3UxCdu5vSSti47LVj0yNPwj0pwxnlpALXQrqwqjQYWZfw29L3sia1Tfk9Sv/IiD82LY3+gAUAmqaunXXW0GoxdLCrmIk/g7SHBpIB1fk4wYlyRorLS6vLwJl2VELAU9IeJcI0md5yW5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024595; c=relaxed/simple;
	bh=GfMzwJNsG2ty/WysaOh3191OVnUiARdIsH5JdLh6dhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hirZJZ1VFWk0L+Ea+r1/3bLlf1/7BPrZA7850U4dOxbwixPhVHbTlMmbhT/2o3Ninv2v4ko54/O5KTI3WIOahjvTrCUKrNwkVWapDBU4COFHX9u6KWuht6TxWGlxh82BJX2TfOn/eDEnG9egok4Gga5Zptaeu5zlmc0j2q8Hp8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6332D1A00;
	Fri, 27 Jun 2025 04:42:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 602573F66E;
	Fri, 27 Jun 2025 04:43:10 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:43:07 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI
 Protocol support
Message-ID: <aF6Dy_nmH64FWhW3@pluto>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>

On Mon, Jun 23, 2025 at 02:01:36PM +0200, AngeloGioacchino Del Regno wrote:
> Add a driver for the SCMI protocol extensions for MediaTek TinySYS.
> This is used to communicate with various remote processors in some
> MediaTek SoCs, which mainly handle power management related tasks.
> 

Hi,

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/firmware/arm_scmi/Kconfig             |   1 +
>  drivers/firmware/arm_scmi/Makefile            |   1 +
>  .../arm_scmi/vendors/mediatek/Kconfig         |  16 +
>  .../arm_scmi/vendors/mediatek/Makefile        |   2 +
>  .../arm_scmi/vendors/mediatek/mtk-tinysys.c   | 344 ++++++++++++++++++
>  include/linux/scmi_mtk_protocol.h             |  62 ++++
>  6 files changed, 426 insertions(+)
>  create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
>  create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Makefile
>  create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
>  create mode 100644 include/linux/scmi_mtk_protocol.h
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index e3fb36825978..baadf4f7fef6 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -84,6 +84,7 @@ config ARM_SCMI_QUIRKS
>  
>  source "drivers/firmware/arm_scmi/transports/Kconfig"
>  source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
> +source "drivers/firmware/arm_scmi/vendors/mediatek/Kconfig"
>  
>  endif #ARM_SCMI_PROTOCOL
>  
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
> index 780cd62b2f78..d1b4ec16b8bc 100644
> --- a/drivers/firmware/arm_scmi/Makefile
> +++ b/drivers/firmware/arm_scmi/Makefile
> @@ -13,6 +13,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
>  
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
> +obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/mediatek/
>  
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
> diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig b/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
> new file mode 100644
> index 000000000000..8facdcd3819f
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "ARM SCMI MediaTek Vendor Protocols"
> +
> +config MTK_SCMI_TINYSYS
> +	tristate "MediaTek SCMI TinySYS Extension"
> +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> +	default y if ARCH_MEDIATEK
> +	help
> +	  This enables communication with the MediaTek TinySYS MCU
> +	  to control the power status of various SoC sub-devices
> +	  other than passing other messages for initialization.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mtk-tinysys.
> +
> +endmenu
> diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/Makefile b/drivers/firmware/arm_scmi/vendors/mediatek/Makefile
> new file mode 100644
> index 000000000000..dc1ff63c3b69
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/mediatek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_SCMI_TINYSYS) += mtk-tinysys.o
> diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c b/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
> new file mode 100644
> index 000000000000..baeb36493952
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Management Interface (SCMI) MediaTek TinySYS Protocol
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2025 Collabora Ltd
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#define pr_fmt(fmt) "SCMI Notifications TinySYS - " fmt
> +
> +#include <linux/bits.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_mtk_protocol.h>
> +
> +#include "../../protocols.h"
> +#include "../../notify.h"
> +
> +#define SCMI_MTK_CMD_SSPM_QUERY_ALIVE		0xdead
> +
> +enum scmi_mtk_tinysys_protocol_cmd {
> +	MTK_TINYSYS_COMMON_SET = 0x3,
> +	MTK_TINYSYS_COMMON_GET = 0x4,
> +	MTK_TINYSYS_POWER_STATE_NOTIFY = 0x5,
> +	MTK_TINYSYS_SLBC_CTRL = 0x6,
> +};
> +
> +struct scmi_mtk_tinysys_common_get_payld {
> +	__le32 rsvd;
> +	__le32 param[SCMI_MTK_MSG_COMMON_REPLY_BYTES];
> +};
> +
> +struct scmi_mtk_tinysys_common_set_payld {
> +	__le32 rsvd;
> +	__le32 ctrl_id;
> +	__le32 param[SCMI_MTK_MSG_COMMON_PARAM_BYTES];
> +};
> +
> +struct scmi_mtk_tinysys_slbc_payld {
> +	__le32 rsvd;
> +	__le32 cmd;
> +	__le32 arg[SCMI_MTK_MSG_SLBC_PARAM_BYTES];
> +};
> +
> +struct scmi_mtk_tinysys_pwrst_notify {
> +	__le32 rsvd;
> +	__le32 fid;
> +	__le32 enable;
> +};
> +
> +struct scmi_mtk_tinysys_notify_payld {
> +	__le32 fid;
> +	__le32 param[SCMI_MTK_MSG_NOTIF_ST_BYTES];
> +};
> +
> +struct scmi_mtk_tinysys_protocol_attributes {
> +	__le32 attributes;

...this is a clear example where would be benificial to have a
doc describing the protocol fields (as mentioned already previously) so
that you can at least know here what is the nature of attributes: is it
completely made up of bitfield? has any subfield wider than one-bute
that has to be interpreted as a quantity (so le32_to_cpu and friends...)

..I see all of this is apparent by the code below but a bit of protocol
description would be better...you get my point...

...anyway...you can avoid single field structures in message descriptors...

> +};
> +
> +struct scmi_mtk_tinysys_info {
> +	int num_domains;
> +};
> +
> +static int scmi_mtk_tinysys_attributes_get(const struct scmi_protocol_handle *ph,
> +					   struct scmi_mtk_tinysys_info *tinfo)
> +{
> +	struct scmi_mtk_tinysys_protocol_attributes *attr;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
> +	if (ret)
> +		return ret;
> +
> +	attr = t->rx.buf;

...especially if you are gonna use down below the get_unaligned_le32()
directly on the buffer at the end....

> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		attr->attributes = get_unaligned_le32(t->rx.buf);

..also I think this will make smatch/sparse static analyzers screams
since yiu defined attr_attributes as __le32 BUT here you then assign to
it the u32 which you get out of get_unaligned_le32()

> +		tinfo->num_domains = attr->attributes;

...so what about dropping attr struct definitions and declararion and just:

		tinfo->num_domains = get_unaligned_le32(t->rx.buf);

> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_mtk_tinysys_get_num_sources(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_mtk_tinysys_info *tinfo = ph->get_priv(ph);
> +
> +	if (!tinfo)
> +		return -EINVAL;
> +
> +	return tinfo->num_domains;
> +}
> +
> +static int scmi_mtk_tinysys_set_notify_enabled(const struct scmi_protocol_handle *ph,
> +					       u8 evt_id, u32 src_id, bool enable)
> +{
> +	struct scmi_mtk_tinysys_pwrst_notify *pwrst_notify;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	/* There's only one possible event for now */
> +	if (evt_id != 0)

As also Peng pointed out...

	if (evt != SCMI_EVENT_MTK_TINYSYS_NOTIFIER)

> +		return -EINVAL;
> +
> +	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_POWER_STATE_NOTIFY,
> +				      sizeof(*pwrst_notify), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	pwrst_notify = t->tx.buf;
> +	pwrst_notify->fid = src_id;

 	... = cpu_to_le32(src_id)

> +	pwrst_notify->enable = cpu_to_le32(enable);

...I suppose (since no doc) that this is mant to simply set BIT_0 if
enable....so maybe simply

	pwrst_notify->enable = enable ? BIT(0) : 0;

... endianityshould not matter and you risk to set the wrong bit by
using  cpu_to_le32()

> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +	return ret;
> +}
> +
> +static void *scmi_mtk_tinysys_fill_custom_report(const struct scmi_protocol_handle *ph,
> +						 u8 evt_id, ktime_t timestamp,
> +						 const void *payld, size_t payld_sz,
> +						 void *report, u32 *src_id)
> +{
> +	const struct scmi_mtk_tinysys_notify_payld *p = payld;
> +	struct scmi_mtk_tinysys_notif_report *r = report;
> +	int i;
> +
> +	if (sizeof(*p) != payld_sz)
> +		return NULL;
> +
> +	if (evt_id == SCMI_EVENT_MTK_TINYSYS_NOTIFIER) {
> +		r->timestamp = timestamp;
> +		r->fid = le32_to_cpu(p->fid);
> +		for (i = 0; i < SCMI_MTK_MSG_NOTIF_ST_BYTES; i++)
> +			r->status[i] = le32_to_cpu(p->param[i]);
> +		if (src_id)
> +			*src_id = p->fid;

			*src_id = le32_to_cpu(p->fid);

			or better

			*src_id = r->fid;

> +	} else {
> +		WARN_ON_ONCE(1);
> +		return NULL;
> +	}
> +
> +	return r;
> +}
> +
> +static const struct scmi_event scmi_mtk_tinysys_events[] = {
> +	{
> +		.id = SCMI_EVENT_MTK_TINYSYS_NOTIFIER,
> +		.max_payld_sz =	sizeof(struct scmi_mtk_tinysys_notify_payld),
> +		.max_report_sz = sizeof(struct scmi_mtk_tinysys_notif_report),
> +	},
> +};
> +
> +static int scmi_mtk_tinysys_common_get(const struct scmi_protocol_handle *ph,
> +				       u32 ctrl_id, u32 cmd,
> +				       struct scmi_mtk_tinysys_status *retval)
> +{
> +	struct scmi_mtk_tinysys_common_get_payld *p;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_COMMON_GET,
> +				      sizeof(*p), sizeof(*retval), &t);
> +	if (ret)
> +		return ret;
> +
> +	p = t->tx.buf;
> +	p->param[0] = ctrl_id;

	cpu_to_le32(ctrl_id);


> +	p->param[1] = cmd;

	cpu_to_le32(ctrl_id);

...you should run smatch() or any other Kenel static analyzer ... it
would have screamed a lot around endianity...trivial errors really but
posshbly painful bugs if this ever get run on a BigEndian thing...

> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		if (t->rx.len == sizeof(*retval))
> +			memcpy(retval, t->rx.buf, sizeof(*retval));

mmmm...so you suddenly have stuff in a reply that is NON-littleEndian
defined in the protocol message fields so that you can brutally memcpy
to a u32 ?

..this would go against basic SCMI (all message fields are LE) and could be
painful since it is really NOT properly defined anywhere what is the expectation
here from the payload received from the server...and again...no docs...

....it would be clearer and safer to define a reply msg as _le32 fields and
just loop and le32_to_cpu() the single __le32 words

> +		else
> +			ret = -EINVAL;
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +	return ret;
> +}
> +
> +static int scmi_mtk_tinysys_common_set(const struct scmi_protocol_handle *ph,
> +				       u32 ctrl_id, const u32 *params,
> +				       const u8 num_params)
> +{
> +	struct scmi_mtk_tinysys_common_set_payld *p;
> +	struct scmi_xfer *t;
> +	int i, ret;
> +
> +	if (!params || num_params > SCMI_MTK_MSG_COMMON_PARAM_BYTES)
> +		return -EINVAL;
> +
> +	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_COMMON_SET, sizeof(*p), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	p = t->tx.buf;
> +	p->ctrl_id = cpu_to_le32(ctrl_id);
> +	for (i = 0; i < num_params; i++)
> +		p->param[i] = cpu_to_le32(params[i]);
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +
> +	ph->xops->xfer_put(ph, t);
> +	return ret;
> +}
> +
> +static int scmi_mtk_tinysys_cm_mgr_set(const struct scmi_protocol_handle *ph,
> +				       u32 ctrl_id, u32 cmd, u32 arg)
> +{
> +	const u32 params[2] = { cmd, arg };
> +
> +	return scmi_mtk_tinysys_common_set(ph, ctrl_id, params, 2);
> +}
> +
> +static int scmi_mtk_tinysys_gpu_pwr_set(const struct scmi_protocol_handle *ph,
> +				       u32 ctrl_id, u8 pwr_indication, bool enable)
> +{
> +	const u32 params[2] = { pwr_indication, enable };
> +
> +	return scmi_mtk_tinysys_common_set(ph, ctrl_id, params, 2);
> +}
> +
> +static int scmi_mtk_tinysys_slbc_req(const struct scmi_protocol_handle *ph,
> +				     const struct scmi_mtk_tinysys_slbc *req,
> +				     struct scmi_mtk_tinysys_slbc *retval)
> +{
> +	struct scmi_mtk_tinysys_slbc_payld *p;
> +	struct scmi_xfer *t;
> +	int i, ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_SLBC_CTRL,
> +				      sizeof(*p), sizeof(*p), &t);
> +	if (ret)
> +		return ret;
> +
> +	p = t->tx.buf;
> +	p->cmd = cpu_to_le32(req->cmd);
> +	for (i = 0; i < SCMI_MTK_MSG_SLBC_PARAM_BYTES; i++)

	for (int i = 0;

> +		p->arg[i] = cpu_to_le32(req->arg[i]);
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret && retval) {
> +		if (t->rx.len == sizeof(*retval))
> +			memcpy(retval, t->rx.buf, sizeof(*retval));

...same as above on endianess of reply payload...did I miss somethinng ?

> +		else
> +			ret = -EINVAL;
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +	return ret;
> +}
> +
> +static int scmi_mtk_tinysys_sspm_mem_set(const struct scmi_protocol_handle *ph,
> +					 u32 ctrl_id, u32 pa, u32 mem_sz)
> +{
> +	const u32 params[2] = { pa, mem_sz };
> +
> +	if (mem_sz < SZ_1M)
> +		return -EINVAL;
> +
> +	return scmi_mtk_tinysys_common_set(ph, ctrl_id, params, 2);
> +}
> +
> +static bool scmi_mtk_tinysys_sspm_is_alive(const struct scmi_protocol_handle *ph,
> +					   u32 ctrl_id)
> +{
> +	const u32 param = SCMI_MTK_CMD_SSPM_QUERY_ALIVE;
> +	int ret;
> +
> +	ret = scmi_mtk_tinysys_common_set(ph, ctrl_id, &param, 1);
> +
> +	return ret ? false : true;
> +}
> +
> +static const struct scmi_mtk_tinysys_proto_ops mtk_tinysys_proto_ops = {
> +	.common_get = scmi_mtk_tinysys_common_get,
> +	.cm_mgr_set = scmi_mtk_tinysys_cm_mgr_set,
> +	.gpu_pwr_set = scmi_mtk_tinysys_gpu_pwr_set,
> +	.slbc_req = scmi_mtk_tinysys_slbc_req,
> +	.sspm_is_alive = scmi_mtk_tinysys_sspm_is_alive,
> +	.sspm_mem_set = scmi_mtk_tinysys_sspm_mem_set,
> +};
> +
> +static const struct scmi_event_ops scmi_mtk_tinysys_event_ops = {
> +	.get_num_sources = scmi_mtk_tinysys_get_num_sources,
> +	.set_notify_enabled = scmi_mtk_tinysys_set_notify_enabled,
> +	.fill_custom_report = scmi_mtk_tinysys_fill_custom_report,
> +};

I would keep this....

> +
> +static const struct scmi_protocol_events scmi_mtk_tinysys_protocol_events = {
> +	.queue_sz = 4 * SCMI_PROTO_QUEUE_SZ,
> +	.ops = &scmi_mtk_tinysys_event_ops,
> +	.evts = scmi_mtk_tinysys_eventsSCMI_EVENT_MTK_TINYSYS_NOTIFIER,
> +	.num_events = ARRAY_SIZE(scmi_mtk_tinysys_events),
> +};
> +

..and all all of these events related stuff above... near where the
protocol events and defs are defined...

> +static int scmi_mtk_tinysys_protocol_init(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_mtk_tinysys_info *tinfo;
> +	u32 version;
> +	int ret;
> +
> +	ret = ph->xops->version_get(ph, &version);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(ph->dev, "MediaTek TinySYS Protocol Version %d.%d\n",
> +		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
> +
> +	tinfo = devm_kzalloc(ph->dev, sizeof(*tinfo), GFP_KERNEL);
> +	if (!tinfo)
> +		return -ENOMEM;
> +
> +	ret = scmi_mtk_tinysys_attributes_get(ph, tinfo);
> +	if (ret)
> +		return ret;
> +
> +	return ph->set_priv(ph, tinfo, version);
> +}
> +
> +static const struct scmi_protocol scmi_mtk_tinysys = {
> +	.id = SCMI_PROTOCOL_MTK_TINYSYS,
> +	.owner = THIS_MODULE,
> +	.instance_init = &scmi_mtk_tinysys_protocol_init,
> +	.ops = &mtk_tinysys_proto_ops,
> +	.events = &scmi_mtk_tinysys_protocol_events,
> +	.vendor_id = SCMI_MTK_VENDOR,
> +};
> +module_scmi_protocol(scmi_mtk_tinysys);
> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
> +MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_MTK_TINYSYS) "-" SCMI_MTK_VENDOR);
> +MODULE_DESCRIPTION("MediaTek SCMI TinySYS driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/scmi_mtk_protocol.h b/include/linux/scmi_mtk_protocol.h
> new file mode 100644
> index 000000000000..51ad0cb4b72d
> --- /dev/null
> +++ b/include/linux/scmi_mtk_protocol.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SCMI Message Protocol driver MediaTek extension header
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2025 Collabora Ltd
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#ifndef _LINUX_SCMI_MTK_PROTOCOL_H
> +#define _LINUX_SCMI_MTK_PROTOCOL_H
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +
> +#define SCMI_PROTOCOL_MTK_TINYSYS	0x80
> +#define SCMI_MTK_VENDOR			"MediaTek"
> +
> +#define SCMI_MTK_MSG_COMMON_PARAM_BYTES	5

This definition can go into the protocol compilation unit, since it is
NOT used by the SCMI drivers using the ops below, right ? ... I mean
it's an internal define so no need to expose it here..

> +#define SCMI_MTK_MSG_COMMON_REPLY_BYTES	2
> +#define SCMI_MTK_MSG_NOTIF_ST_BYTES	4
> +#define SCMI_MTK_MSG_SLBC_PARAM_BYTES	4
> +
> +struct scmi_mtk_tinysys_status {
> +	u32 rsvd;
> +	u32 reply[SCMI_MTK_MSG_COMMON_REPLY_BYTES];
> +};
> +
> +struct scmi_mtk_tinysys_slbc {
> +	u32 cmd;
> +	u32 arg[SCMI_MTK_MSG_SLBC_PARAM_BYTES];
> +};
> +
> +struct scmi_mtk_tinysys_proto_ops {
> +	int (*common_get)(const struct scmi_protocol_handle *ph,
> +			  u32 ctrl_id, u32 cmd,
> +			  struct scmi_mtk_tinysys_status *retval);
> +	int (*cm_mgr_set)(const struct scmi_protocol_handle *ph,
> +			  u32 ctrl_id, u32 cmd, u32 arg);
> +	int (*gpu_pwr_set)(const struct scmi_protocol_handle *ph,
> +			   u32 ctrl_id, u8 pwr_indication, bool enable);
> +	int (*slbc_req)(const struct scmi_protocol_handle *ph,
> +			const struct scmi_mtk_tinysys_slbc *req,
> +			struct scmi_mtk_tinysys_slbc *retval);
> +	bool (*sspm_is_alive)(const struct scmi_protocol_handle *ph,
> +			      u32 ctrl_id);
> +	int (*sspm_mem_set)(const struct scmi_protocol_handle *ph,
> +			    u32 ctrl_id, u32 pa, u32 mem_sz);
> +};

You could add some Doxy-style comments for these ops...NO strong
opinion here, though, since other vendor protos do NOT have it...
...much more important is to add the the protocol .rst docs detailing
the message format (...you may have guessed at this point that I would
have reiterated this :P)

Thanks,
Cristian
