Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C827FD5A;
	Fri,  6 Jun 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212753; cv=none; b=YJJmIJtZlABGB2b+HcQDzrPk3RmaaGv6IwruTUNYeohFov37OYStXgecV0VryojZMvaC4d8BALiD/7b0BcEoziwmhLYsQg3Hin8qhhx2iawXR5mMeRIhPjsHwu9LCNpHaMVQ91YpR22r0BijUw5kw16xK52MHa6BNp2INs7i7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212753; c=relaxed/simple;
	bh=+97TlAFovavLSEOye2F0bZZb1ctQiJ0szw3vipntuxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alI7RpqwGaLM74tj2Dupt3QTTq40guh7kZJZxaj6gjzxtasHXzsSP0cLZ5G57hklrXRXiDIKffOLxMOLCTDqc43RChsx8xsf5GAsbfY8c1Tw9MUHBltxcHoBMj1kHFWPxwuEwk4MZ/+yKxX9PNga640tsjnmLIL3KwQQliqv7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M7dPO64o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M7dPO64o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2675CC4CEEB;
	Fri,  6 Jun 2025 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749212752;
	bh=+97TlAFovavLSEOye2F0bZZb1ctQiJ0szw3vipntuxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7dPO64ovbpmqj/VsmsITZfJKoGgSN/4sqiUJnOTJHQ7qWCD/9GCRPS0X90KyYggk
	 IeQo3rlaDgy9WhetWz+CtQ/b/yFyBn737NoxRVThbfeZhldT1noHYK4g2qBHG25iKr
	 efrTb3veEsOYReUP3MMBbgRZvYWuwq5VHLt1u7X4=
Date: Fri, 6 Jun 2025 14:25:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC
 EEPROM chips
Message-ID: <2025060650-tried-widen-4443@gregkh>
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
 <20250606120631.3140054-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120631.3140054-3-abd.masalkhi@gmail.com>

On Fri, Jun 06, 2025 at 12:06:30PM +0000, Abd-Alrhman Masalkhi wrote:
> +// SPDX-License-Identifier: GPL-2.0-or-later

Are you sure "or-later" is what you want?  Sorry, I have to ask.

> +/*
> + * m24lr.c - Sysfs control interface for ST M24LR series RFID/NFC chips
> + *
> + * Copyright (c) 2025 Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> + *
> + * This driver implements both the sysfs-based control interface and EEPROM
> + * access for STMicroelectronics M24LR series chips (e.g., M24LR04E-R).
> + * It provides access to control registers for features such as password
> + * authentication, memory protection, and device configuration. In addition,
> + * it manages read and write operations to the EEPROM region of the chip.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/nvmem-provider.h>
> +
> +#define M24LR_PAGESIZE_DEFAULT	  1u
> +
> +#define M24LR_WRITE_TIMEOUT	  25u
> +#define M24LR_READ_TIMEOUT	  (M24LR_WRITE_TIMEOUT)
> +
> +#define to_sys_entry(attrp)   container_of(attrp, struct m24lr_sys_entry, attr)

This shouldn't be needed, something seems odd...

> +static ssize_t m24lr_ctl_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
> +	struct m24lr_sys_entry *entry = to_sys_entry(attr);

Why isn't this just going off of the device?  Are you using single
show/store callbacks for multiple attribute types?

> +	unsigned int reg_size = entry->reg_size;
> +	unsigned int reg_addr = entry->reg_addr;

Ah, you are.  Are you sure you need/want to do that?

> +	u8 output[8];
> +	int err = 0;
> +
> +	if (unlikely(!count))

likely/unlikely can ONLY be used when you can benchmark the difference
in the speed of not having it.  For a sysfs file, that's not needed at
all, please remove all of these.

> +		return -EINVAL;
> +
> +	if (count > (reg_size << 1))
> +		return -EINVAL;
> +
> +	if (unlikely(!is_power_of_2(reg_size) || reg_size > 8)) {
> +		dev_dbg(dev,
> +			"Invalid register size: must be a power of 2 and <= 8 bytes (%u)\n",
> +			reg_size);
> +		return -EIO;

Not -EINVAL?  This isn't an I/O error.

> +	}
> +
> +	err = m24lr_parse_le_value(buf, reg_size, output);
> +	if (err)
> +		return err;
> +
> +	return m24lr_write(m24lr, (u8 *)&output, reg_size, reg_addr, false);
> +}
> +
> +static ssize_t m24lr_ctl_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	long ret;
> +	u64 val;
> +	__le64 input = 0;
> +	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
> +	struct m24lr_sys_entry *entry = to_sys_entry(attr);
> +	unsigned int reg_addr = entry->reg_addr;
> +	unsigned int reg_size = entry->reg_size;
> +
> +	if (unlikely(!is_power_of_2(reg_size) || reg_size > 8)) {
> +		dev_dbg(dev,
> +			"Invalid register size: must be a power of 2 and <= 8 bytes (%u)\n",
> +			reg_size);
> +		return -EIO;
> +	}
> +
> +	ret = m24lr_read(m24lr, (u8 *)&input, reg_size, reg_addr, false);
> +	if (IS_ERR_VALUE(ret))
> +		return ret;
> +
> +	if (ret != reg_size)
> +		return -EIO;
> +
> +	switch (reg_size) {
> +	case 1:
> +		val = *(u8 *)&input;
> +		break;
> +	case 2:
> +		val = le16_to_cpu((__le16)input);
> +		break;
> +	case 4:
> +		val = le32_to_cpu((__le32)input);
> +		break;
> +	case 8:
> +		val = le64_to_cpu((__le64)input);
> +		break;
> +	};
> +
> +	return sysfs_emit(buf, "%llx\n", val);

Why are "raw" read/writes happening from sysfs to the chip?  That feels
wrong, and an abuse of the sysfs api.

If you really want "raw" access, make it a binary file that userspace
can mmap or read/write from directly, with the kernel getting out of the
way entirely.

> +	n_sss = chip->n_sss_entries;
> +	if (n_sss) {
> +		sss = devm_kzalloc(dev, n_sss * sizeof(struct m24lr_sys_entry),
> +				   GFP_KERNEL);
> +		if (!sss)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < n_sss; i++) {
> +			char *name = devm_kasprintf(dev, GFP_KERNEL, "sss%d", i);
> +
> +			sss[i].reg_size = 1;
> +			sss[i].reg_addr = i;
> +			sss[i].attr.attr.name = name;
> +			sss[i].attr.attr.mode = 0600;
> +			sss[i].attr.show = m24lr_ctl_show;
> +			sss[i].attr.store = m24lr_ctl_store;
> +
> +			err = device_create_file(dev, &sss[i].attr);

You just raced with userspace and lost.  This is not how to do this,
please do not dynamically create attributes (hint, this should have
errored out as you didn't correctly initialize them), but also:

> +			if (err)
> +				dev_warn(dev,
> +					 "Failed to create sysfs entry '%s'\n",
> +					 name);

You do not unwind properly if an error happens.

Just use a default attribute group attached to the driver and the driver
core will handle all of that logic for you automatically.  Making the
code smaller and even better yet, correct :)

thanks,

greg k-h
