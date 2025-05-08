Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F2D214A82;
	Thu,  8 May 2025 05:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683105; cv=pass; b=VtYukSClPbAD9h8qK/ZWu/oLpX9STN469xeLLwV0NwMs8wC+8VU8xF3mbFf+okfDm9dEPQN4Jxn90AREa8wSA35WYmu7+Mzt96iq660DwzHroSz7aDMGGx4pD010Ag33m+FNkA4LTrdM9/bzB2dN6ez0VhvRAua5XDgSPzv3PyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683105; c=relaxed/simple;
	bh=Uf9a1i8ReGes8erD/DMJp00dttjBJpsRgLzV+yx45iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7DmvNic+OYh4uOaotmzQ4szyIkuRNXWKU8esG3+4Ixy2FHsTEEgwblLsSemJ4xMugJLRPoYqY4VsFl6i+tonOP51Sh8MrSjFXaHcK67BgjcQwyilaI2UsAwq3zpvi8XkJNr2jnWea4HnUC2Z+dwW0fGX2hykkINfntSM6zYQkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=daXwf0Ms; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="daXwf0Ms"
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZtLgL5vMxz49PvQ;
	Thu,  8 May 2025 08:44:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746683087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4LpmtxyzH7OZvwjxTMiEA4Nd29xTsJw2FUUa5CYnOv0=;
	b=daXwf0MsEmXugKkqimHQ8oGxSZBJyhm4T/VnfQLkWLpBm1Y5ueOafPKJtlrfs7zLM26+H7
	nJpQdmTBadCjPrmmyRc4R9hYBJHtAh06i/7YxIi7mf32KBc9SQhrnzeukzkQWo7LLHf2Cz
	zJZzve81cRwjCd+4h1fn68wgYvAT9AlJOJ9afT7kXCe7cES/eUN+rqHgXJ8kix/CnNC+xY
	ldv1fco8Qc+bIKM+ni8dYRsIKLdRT5si5Iadi7r8W7oI/niSIvNrxQp2S9V6Z1FGf59vle
	f+WbFrzZUbAc4oZ1u/pGZ54bzUQOXxku7q994vJU80PIlnie9VLSA3N6q/HBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746683087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4LpmtxyzH7OZvwjxTMiEA4Nd29xTsJw2FUUa5CYnOv0=;
	b=qC1l7vU7Gqq6tqTBLh0cKF9ODW3Ct+m0XPOT8dfosQAqDW+UZcIXzA1/VNNu33GzfJXeYf
	21MzKnyN+JTd6rTwuahCynhxuaD2x6Eh/8AtBtblnhBKcj/TpVS7ToB68dcNdjadGxwPhO
	td0cEVaprgX9D/pGOadIYZASEmAG5cQBIRsma+dogjoFOKRF82JktOXoX21inD6RVQZejK
	pq03F/6uZozdZfANEeEp11Ne7i2P8zdE7tH54YKJmQ8KV+NmSzHyG9blz/Ur73psRY2Nwk
	I3L7ypR8J7t4AhCbmZzXANZbL7CFyiqLI5l1GxF9WhB2FUfBl9AO7kSNEUz4PQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746683087; a=rsa-sha256;
	cv=none;
	b=o2g+JAzJ67IuLrU6Zw/SQ4l1pF+U6+tNJgnH89dBoAMBa5+Tcni9JLQN3c45apAeINYKKh
	yW51b8SB+TOqd9Km+8OKMnypZnCae+iHGInysKPchJ29bDQgue06svJxgNCKytlahXU7sd
	1+lZCF7FR5W4hBo95pEdliKTnaL2rqfFWUifXC/VeRKjHzryYTTgdNQmR3b64CcJSWJN1L
	eFQc37zJFnth1yg9a4dCr9zOFK3M2APyNK6wJ+Zzdx/DV7A6Zb4X26XWAD09OQE8aG63h0
	/AwfoT75ccZlJDj4XJbDg8GMdrn6wFk3fcG1zrZswCoJE17KgFa+XqF2WjW1pg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4632F634C93;
	Thu,  8 May 2025 08:44:46 +0300 (EEST)
Date: Thu, 8 May 2025 05:44:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
	W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
	gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Message-ID: <aBxEzgtNs8JD3TEt@valkosipuli.retiisi.eu>
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
 <9c99a76d-8fe4-4793-8036-67d2923a1e51@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c99a76d-8fe4-4793-8036-67d2923a1e51@amd.com>

Hi Pratap,

On Wed, May 07, 2025 at 04:16:04PM -0400, Nirujogi, Pratap wrote:
> > > diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> > > new file mode 100644
> > > index 000000000000..1520ebb94507
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > > @@ -0,0 +1,280 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * AMD ISP platform driver for sensor i2-client instantiation
> > > + *
> > > + * Copyright 2025 Advanced Micro Devices, Inc.
> > > + */
> > > +
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/units.h>
> > > +
> > > +#define AMDISP_OV05C10_I2C_ADDR              0x10
> > > +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
> > > +#define AMDISP_OV05C10_HID           "OMNI5C10"
> > 
> > What's the purpose of this _HID and is it present on actual firmware
> > implementation? There's no such ACPI vendor ID as "OMNI".
> > 
> The (_HID, "OMNI5C10") is used to check if the OV05C10 ACPI device is
> actually present before creating the AMD ISP4 platform driver. Yes, ACPI
> entry is present for OV05C10 sensor in _SB/CAMF.
> 
>      Scope (_SB)
>      {
>          Device (CAMF)
>          {
>              Name (_HID, "OMNI5C10")  // _HID: Hardware ID

Please tell your BIOS folks this ACPI ID is invalid. In the future, either
allocate one yourself with your own vendor ID or get one from the sensor
vendor, which they would have allocated using their own ACPI vendor ID.

>              Name (_DDN, "OV05C-RGB")  // _DDN: DOS Device Name
>              Name (_SUB, "OV05C")  // _SUB: Subsystem ID
> 
> 
> > > +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
> > > +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
> > > +
> > > +/*
> > > + * AMD ISP platform definition to configure the device properties
> > > + * missing in the ACPI table.
> > > + */
> > > +struct amdisp_platform {
> > > +     struct i2c_board_info board_info;
> > > +     struct notifier_block i2c_nb;
> > > +     struct i2c_client *i2c_dev;
> > > +     struct mutex lock; /* protects i2c client creation */
> > > +};
> > > +
> > > +/* Top-level OV05C10 camera node property table */
> > > +static const struct property_entry ov05c10_camera_props[] = {
> > > +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
> > > +     { }
> > > +};
> > > +
> > > +/* Root AMD ISP OV05C10 camera node definition */
> > > +static const struct software_node camera_node = {
> > > +     .name = AMDISP_OV05C10_HID,
> > > +     .properties = ov05c10_camera_props,
> > > +};
> > > +
> > > +/*
> > > + * AMD ISP OV05C10 Ports node definition. No properties defined for
> > > + * ports node for OV05C10.
> > > + */
> > > +static const struct software_node ports = {
> > > +     .name = "ports",
> > > +     .parent = &camera_node,
> > > +};
> > > +
> > > +/*
> > > + * AMD ISP OV05C10 Port node definition. No properties defined for
> > > + * port node for OV05C10.
> > > + */
> > > +static const struct software_node port_node = {
> > > +     .name = "port@",
> > > +     .parent = &ports,
> > > +};
> > > +
> > > +/*
> > > + * Remote endpoint AMD ISP node definition. No properties defined for
> > > + * remote endpoint node for OV05C10.
> > 
> > How will this scale? Can you use other sensors with this ISP? Although if
> > you get little from firmware, there's not much you can do. That being said,
> > switching to DisCo for Imaging could be an easier step in this case.
> > 
> the scope of this driver is limited to ov05c10, and it can be enhanced to
> support other sensor modules in future.
> 
> Sorry, I'm not familiar with the term DisCo. Could you please elaborate.

See my reply to Hans.

-- 
Regards,

Sakari Ailus
