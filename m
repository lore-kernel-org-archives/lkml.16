Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA572602;
	Tue,  1 Jul 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358739; cv=none; b=FkD2ZLHR1TmhT2FNhVLaHPp+XaDrdStaczgE9ewKTUeq7xvMFsoiFk2dKtycgVc58J/6yWcv8/tE4ZWK3wUmrk/yw9q1qOqV4A0RgnqVBbU0RskfRGy92HYDMw14hCijIgmgf2/TWVE7dLdl9rS7PtsKZ4HUTaROioDB9HyjHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358739; c=relaxed/simple;
	bh=HRKh4yc4dh+enOBD//jx5vaaO25FLftCjZwUXnx5iGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so5l67QfcGOe9sXeSOWs+dHsxfZY9SoKFGblI8Gv2IWad9hvPEyXzrdNRC7ii/0JRnFC0TmsxPQYMzjyps/DLhuJdzgcNxt7yj1668eJbmIDvDMTtii/BgRJ/VObSoa6rzqDq5UABx+ztyWXt9UYbaF8bAyX/XcCFzznugMAgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y3uCNoRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y3uCNoRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA99C4CEEB;
	Tue,  1 Jul 2025 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751358738;
	bh=HRKh4yc4dh+enOBD//jx5vaaO25FLftCjZwUXnx5iGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3uCNoRBdzVLyV1qZdLiDTZncyTp7yzBk1nv+BNEmMC1KkeCqmjgeraa8yp/1ZOCq
	 bZYUG+Od8ZfOpTwm6HXJWQV41dw0o6CWUXBOXbvzMNembUDDiQ1Np/KhRQz6dmq0cf
	 SmSzxN2a1se0hDrFPZai4Ra4QAeksIvCfECo8gw0=
Date: Tue, 1 Jul 2025 10:32:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] usb: typec: Expose mode priorities via sysfs
Message-ID: <2025070159-judgingly-baggage-042a@gregkh>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630141239.3174390-5-akuchynski@chromium.org>

On Mon, Jun 30, 2025 at 02:12:33PM +0000, Andrei Kuchynski wrote:
> This sysfs attribute specifies the preferred order for enabling
> DisplayPort, Thunderbolt alternate modes, and USB4 mode.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  16 +++
>  drivers/usb/typec/Makefile                  |   2 +-
>  drivers/usb/typec/class.c                   |  28 ++++-
>  drivers/usb/typec/class.h                   |   4 +
>  drivers/usb/typec/mode_selection.c          | 116 ++++++++++++++++++++
>  drivers/usb/typec/mode_selection.h          |  19 ++++
>  include/linux/usb/typec_altmode.h           |   7 ++
>  7 files changed, 190 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/usb/typec/mode_selection.c
>  create mode 100644 drivers/usb/typec/mode_selection.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index 38e101c17a00..ff3296ee8e1c 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -162,6 +162,22 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
>  		- usb3 (USB 3.2)
>  		- usb4 (USB4)
>  
> +What:		/sys/class/typec/<port>/mode_priorities
> +Date:		June 2025
> +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> +Description:	Lists the modes supported by the port, ordered by their
> +		activation priority. It defines the preferred sequence for activating
> +		modes such as Displayport alt-mode, Thunderbolt alt-mode and USB4 mode.
> +		The default order can be modified by writing a new sequence to this
> +		attribute. Any modes omitted from a user-provided list will be
> +		automatically placed at the end of the list.
> +
> +		Example values:
> +		- "USB4 TBT DP": default priority order
> +		- "USB4 DP TBT": modified priority order after writing "USB4 DP TBT" or
> +			"USB4 DP"
> +		- "DP": the port only supports Displayport alt-mode

Multiple value sysfs files are generally frowned apon.  sysfs files that
also have to be manually parsed in the kernel are also frowned apon.
Are you _SURE_ there is no other way that you could possibly do this?

> +
>  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
>  
>  What:		/sys/class/typec/<port>-partner/accessory_mode
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 7a368fea61bc..8a6a1c663eb6 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_TYPEC)		+= typec.o
> -typec-y				:= class.o mux.o bus.o pd.o retimer.o
> +typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
>  typec-$(CONFIG_ACPI)		+= port-mapper.o
>  obj-$(CONFIG_TYPEC)		+= altmodes/
>  obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index a72325ff099a..93eadbcdd4c0 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -19,6 +19,7 @@
>  #include "bus.h"
>  #include "class.h"
>  #include "pd.h"
> +#include "mode_selection.h"
>  
>  static DEFINE_IDA(typec_index_ida);
>  
> @@ -540,7 +541,7 @@ static void typec_altmode_release(struct device *dev)
>  }
>  
>  const struct device_type typec_altmode_dev_type = {
> -	.name = "typec_alternate_mode",
> +	.name = ALTERNATE_MODE_DEVICE_TYPE_NAME,
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> @@ -1942,6 +1943,25 @@ static ssize_t orientation_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(orientation);
>  
> +static ssize_t mode_priorities_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t size)
> +{
> +	struct typec_port *port = to_typec_port(dev);
> +	int ret = typec_mode_priorities_set(port, buf);

You don't pass in size here, what could go wrong...

> +
> +	return ret ? : size;

Please do not use ? : unless you have to.  Spell it out, it makes code
easier to maintain.  Remember, we write code for people first, compilers
second.

> +}
> +
> +static ssize_t mode_priorities_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct typec_port *port = to_typec_port(dev);
> +
> +	return typec_mode_priorities_get(port, buf);
> +}
> +static DEVICE_ATTR_RW(mode_priorities);
> +
>  static struct attribute *typec_attrs[] = {
>  	&dev_attr_data_role.attr,
>  	&dev_attr_power_operation_mode.attr,
> @@ -1954,6 +1974,7 @@ static struct attribute *typec_attrs[] = {
>  	&dev_attr_port_type.attr,
>  	&dev_attr_orientation.attr,
>  	&dev_attr_usb_capability.attr,
> +	&dev_attr_mode_priorities.attr,
>  	NULL,
>  };
>  
> @@ -1992,6 +2013,9 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
>  			return 0;
>  		if (!port->ops || !port->ops->default_usb_mode_set)
>  			return 0444;
> +	} else if (attr == &dev_attr_mode_priorities.attr) {
> +		if (!port->alt_mode_override)
> +			return 0;
>  	}
>  
>  	return attr->mode;
> @@ -2652,6 +2676,8 @@ struct typec_port *typec_register_port(struct device *parent,
>  	else if (cap->usb_capability & USB_CAPABILITY_USB2)
>  		port->usb_mode = USB_MODE_USB2;
>  
> +	typec_mode_priorities_set(port, "");
> +
>  	device_initialize(&port->dev);
>  	port->dev.class = &typec_class;
>  	port->dev.parent = parent;
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index f05d9201c233..28b3c19a0632 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -5,6 +5,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/usb/typec.h>
> +#include <linux/usb/typec_altmode.h>
>  
>  struct typec_mux;
>  struct typec_switch;
> @@ -82,6 +83,7 @@ struct typec_port {
>  	struct device			*usb3_dev;
>  
>  	bool				alt_mode_override;
> +	int				mode_priority_list[TYPEC_MODE_MAX];
>  };
>  
>  #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
> @@ -111,4 +113,6 @@ static inline int typec_link_ports(struct typec_port *connector) { return 0; }
>  static inline void typec_unlink_ports(struct typec_port *connector) { }
>  #endif
>  
> +#define ALTERNATE_MODE_DEVICE_TYPE_NAME "typec_alternate_mode"
> +
>  #endif /* __USB_TYPEC_CLASS__ */
> diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
> new file mode 100644
> index 000000000000..cb7ddf679037
> --- /dev/null
> +++ b/drivers/usb/typec/mode_selection.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 Google LLC.
> + */
> +
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/vmalloc.h>
> +#include "mode_selection.h"
> +#include "class.h"
> +
> +static const char * const mode_names[] = {
> +	[TYPEC_DP_ALTMODE] = "DP",
> +	[TYPEC_TBT_ALTMODE] = "TBT",
> +	[TYPEC_USB4_MODE] = "USB4",

No TYPEC_MODE_MAX entry?  Why not?  This is going to get out of sync,
see below for my comment about that.

> +};
> +static const char * const default_priorities = "USB4 TBT DP";

A comment here about what this is for?

> +
> +/* -------------------------------------------------------------------------- */
> +/* port 'mode_priorities' attribute */
> +static int typec_mode_parse_priority_string(const char *str, int *list)
> +{
> +	const bool user_settings = list[0] == TYPEC_MODE_MAX;
> +	char *buf, *ptr;
> +	char *token;
> +	int ret = 0;
> +
> +	buf = vmalloc(strlen(str) + 1);

Why vmalloc for such a small chunk of memory?

> +	if (!buf)
> +		return -ENOMEM;
> +	for (int i = 0; i <= strlen(str); i++)
> +		buf[i] = (str[i] == '\n') ? '\0' : str[i];

Please spell out if statements, especially ones that do assignements in
them.  This is going to be a pain to maintain over time, right?  Make it
obvious what is happening please.


> +	ptr = buf;
> +
> +	while ((token = strsep(&ptr, " ")) && !ret) {
> +		if (strlen(token)) {
> +			int mode = 0;
> +
> +			while ((mode < TYPEC_MODE_MAX) &&
> +				strcmp(token, mode_names[mode]))
> +				mode++;
> +			if (mode == TYPEC_MODE_MAX) {
> +				ret = -EINVAL;
> +				continue;
> +			}
> +
> +			for (int i = 0; i < TYPEC_MODE_MAX; i++) {
> +				if (list[i] == TYPEC_MODE_MAX) {
> +					list[i] = mode;
> +					break;
> +				}
> +				if (list[i] == mode) {
> +					if (user_settings)
> +						ret = -EINVAL;
> +					break;
> +				}
> +			}
> +		}
> +	}
> +	vfree(buf);

Why not just use a free() type model and that way your error paths above
are much simpler?


> +
> +	return ret;
> +}
> +
> +int typec_mode_priorities_set(struct typec_port *port,
> +		const char *user_priorities)
> +{
> +	int list[TYPEC_MODE_MAX];
> +	int ret;
> +
> +	for (int i = 0; i < TYPEC_MODE_MAX; i++)
> +		list[i] = TYPEC_MODE_MAX;
> +
> +	ret = typec_mode_parse_priority_string(user_priorities, list);
> +	if (!ret)
> +		ret = typec_mode_parse_priority_string(default_priorities, list);
> +
> +	if (!ret)
> +		for (int i = 0; i < TYPEC_MODE_MAX; i++)
> +			port->mode_priority_list[i] = list[i];
> +
> +	return ret;
> +}
> +
> +static int port_altmode_supported(struct device *dev, void *data)
> +{
> +	if (!strcmp(dev->type->name, ALTERNATE_MODE_DEVICE_TYPE_NAME)) {
> +		struct typec_altmode *alt = to_typec_altmode(dev);
> +
> +		if (*(int *)data == typec_svid_to_altmode(alt->svid))
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +static bool port_mode_supported(struct typec_port *port, int mode)
> +{
> +	if (mode >= TYPEC_MODE_MAX)
> +		return false;
> +	if (mode == TYPEC_USB4_MODE)
> +		return !!(port->cap->usb_capability & USB_CAPABILITY_USB4);
> +	return device_for_each_child(&port->dev, &mode, port_altmode_supported);
> +}
> +
> +int typec_mode_priorities_get(struct typec_port *port, char *buf)
> +{
> +	ssize_t count = 0;
> +
> +	for (int i = 0; i < TYPEC_MODE_MAX; i++) {
> +		int mode = port->mode_priority_list[i];
> +
> +		if (port_mode_supported(port, mode))
> +			count += sysfs_emit_at(buf, count, "%s ", mode_names[mode]);
> +	}
> +
> +	return count + sysfs_emit_at(buf, count, "\n");
> +}
> diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
> new file mode 100644
> index 000000000000..c595c84e26a4
> --- /dev/null
> +++ b/drivers/usb/typec/mode_selection.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_tbt.h>
> +
> +static inline int typec_svid_to_altmode(const u16 svid)
> +{
> +	switch (svid) {
> +	case USB_TYPEC_DP_SID:
> +		return TYPEC_DP_ALTMODE;
> +	case USB_TYPEC_TBT_SID:
> +		return TYPEC_TBT_ALTMODE;
> +	}
> +	return TYPEC_MODE_MAX;
> +}
> +
> +int typec_mode_priorities_set(struct typec_port *port,
> +		const char *user_priorities);
> +int typec_mode_priorities_get(struct typec_port *port, char *buf);
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index b3c0866ea70f..4f05c5f5c91d 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -145,6 +145,13 @@ enum {
>  
>  #define TYPEC_MODAL_STATE(_state_)	((_state_) + TYPEC_STATE_MODAL)
>  
> +enum {
> +	TYPEC_DP_ALTMODE = 0,
> +	TYPEC_TBT_ALTMODE,
> +	TYPEC_USB4_MODE,
> +	TYPEC_MODE_MAX,

This list is going to get out of order and sync with your string list
elsewhere in the other .c file.  What is going to ensure that this does
not happen?

Again, I'm really not happy with this api, it feels fragile and tricky
and will get out of sync very easily over time.  We need loads of
justification for why this really is the only possible way this can be
done, and some type of proof that this actually has been tested (and
maybe fuzzed?)

thanks,

greg k-h
