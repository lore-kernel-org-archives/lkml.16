Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4181E5701;
	Tue,  1 Jul 2025 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359262; cv=none; b=NlrjNa39MD07Ltj4e99P5g1IavCLpWJ8nDqL5kkWejUv8h6IxgMN9jZTm8MV1u8vOpxb+dUWDMyZg2rTwLsgqRjP+TGTVNCfahwX7M3gf8f9aEErr1yY4xc9AfSz50iX64tH6qs3l7INI/eb/jriDQvd/Wii547KHo1fwL01zQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359262; c=relaxed/simple;
	bh=tWZD2bWInWhTEcro23yw6kYJY/BDBCCPXHAjzFsMGj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avmzwhBg4GpVoA3lDJWI/P21kct7Ohe6n3vbUe/04muA8vEaX6PWREyd/0J0wigfO2BvWOBhvN6FWEevdsl+mkRul5UNn2WwYwO23jSAGsJmgjPLmjoNsTZH61DG1ulrDaVFAeq4mmt+QJ/g5MdNaAPUMh26Tb1KRpzW06+m9dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uRU8gKVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uRU8gKVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8E5C4CEEB;
	Tue,  1 Jul 2025 08:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751359261;
	bh=tWZD2bWInWhTEcro23yw6kYJY/BDBCCPXHAjzFsMGj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRU8gKVe3FneEnnNSR54Woa9dV/eP+iKcWA9Rop2YLxTZlx4/rQvA38PUd9CVbgKh
	 u5sRq37R1pbktVMyJS8AQZ8X7OR0sPmwWC+J0n1DRdco34WE57NDyghfF2TkxDOx25
	 K99lMDtaZfwRxKHuJqqIe9BolU6aqEefv6uMKRcc=
Date: Tue, 1 Jul 2025 10:40:58 +0200
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
Subject: Re: [PATCH v2 05/10] usb: typec: Implement automated mode selection
Message-ID: <2025070143-safeness-prewashed-6e9f@gregkh>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
 <20250630141239.3174390-6-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630141239.3174390-6-akuchynski@chromium.org>

On Mon, Jun 30, 2025 at 02:12:34PM +0000, Andrei Kuchynski wrote:
> This commit introduces mode_selection sysfs attribute to control automated
> mode negotiation. Writing "yes" to this file activates the automated
> selection process for DisplayPort, Thunderbolt alternate modes, and USB4
> mode. Conversely, writing "no" will cancel any ongoing selection process
> and exit the currently active mode.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  17 +
>  drivers/usb/typec/class.c                   |  52 ++-
>  drivers/usb/typec/class.h                   |  10 +
>  drivers/usb/typec/mode_selection.c          | 413 ++++++++++++++++++++
>  drivers/usb/typec/mode_selection.h          |  30 ++
>  include/linux/usb/pd_vdo.h                  |   2 +
>  include/linux/usb/typec_altmode.h           |   5 +
>  7 files changed, 527 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index ff3296ee8e1c..0ffc71a7c374 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -263,6 +263,23 @@ Description:	The USB Modes that the partner device supports. The active mode
>  		- usb3 (USB 3.2)
>  		- usb4 (USB4)
>  
> +What:		/sys/class/typec/<port>-partner/mode_selection
> +Date:		June 2025
> +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> +Description:	Lists the partner-supported alternate modes and mode entry
> +		results with the currently entered mode bracketed. If a cable doesn't
> +		support a mode, it's marked as 'nc'. An ellipsis indicates a mode
> +		currently in progress. Automated mode selection is activated by writing
> +		"yes" to the file. Conversely, writing "no" will cancel any ongoing
> +		selection process and exit the currently active mode, if any.
> +
> +		Example values:
> +		- "DP TBT=... USB4=nc": The cable does not support USB4 mode,
> +			The driver is currently attempting to enter Thunderbolt alt-mode.
> +		- "[DP] TBT=-EOPNOTSUPP USB4=-ETIME": USB4 mode entry failed due to
> +			a timeout, Thunderbolt failed with the result -EOPNOTSUPP,
> +			and DisplayPort is the active alt-mode.

We don't print error codes to userspace like this :(

And "yes" and "no" are not the traditional sysfs apis for on/off, please
use the in-kernel function for that instead that takes many more types
of values.

And again, multiple values in a sysfs file are not usually a good idea
at all as now userspace has to parse them properly.  What userspace tool
is going to do that?

> +
>  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
>  
>  Note: Electronically Marked Cables will have a device also for one cable plug
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 93eadbcdd4c0..8455e07a9934 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -741,6 +741,33 @@ static ssize_t number_of_alternate_modes_show(struct device *dev, struct device_
>  }
>  static DEVICE_ATTR_RO(number_of_alternate_modes);
>  
> +static ssize_t mode_selection_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct typec_partner *partner = to_typec_partner(dev);
> +
> +	return typec_mode_selection_get(partner, buf);
> +}
> +
> +static ssize_t mode_selection_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t size)
> +{
> +	struct typec_partner *partner = to_typec_partner(dev);
> +	bool start;
> +	int ret = kstrtobool(buf, &start);
> +
> +	if (!ret) {
> +		if (start)
> +			ret = typec_mode_selection_start(partner);
> +		else
> +			ret = typec_mode_selection_reset(partner);
> +	}
> +
> +	return ret ? : size;

Again, only use ? : if you have to (hint, you don't have to here.)

> +static unsigned int mode_selection_timeout = 4000;
> +module_param(mode_selection_timeout, uint, 0644);
> +MODULE_PARM_DESC(mode_selection_timeout, "The timeout mode entry, ms");
> +
> +static unsigned int mode_selection_delay = 1000;
> +module_param(mode_selection_delay, uint, 0644);
> +MODULE_PARM_DESC(mode_selection_delay,
> +	"The delay between attempts to enter or exit a mode, ms");
> +
> +static unsigned int mode_selection_entry_attempts = 4;
> +module_param(mode_selection_entry_attempts, uint, 0644);
> +MODULE_PARM_DESC(mode_selection_entry_attempts,
> +	"Max attempts to enter mode on BUSY result");

This is not the 1990's, please NEVER add new module parameters
(especially ones that you never even documented in the changelog!)

This just will not work, attributes for functionality either need to
"just work properly" or you need to make them on a per-controller type
basis as remember, systems have multiple controllers in them...

> +
>  static const char * const mode_names[] = {
>  	[TYPEC_DP_ALTMODE] = "DP",
>  	[TYPEC_TBT_ALTMODE] = "TBT",
> @@ -15,6 +31,15 @@ static const char * const mode_names[] = {
>  };
>  static const char * const default_priorities = "USB4 TBT DP";
>  
> +struct mode_selection_state {
> +	int mode;

Shouldn't this be an enum?

> +	bool enable;
> +	bool cable_capability;
> +	bool enter;
> +	int attempt_count;
> +	int result;
> +};

No documentation for what this structure is for?

> +
>  /* -------------------------------------------------------------------------- */
>  /* port 'mode_priorities' attribute */
>  static int typec_mode_parse_priority_string(const char *str, int *list)
> @@ -114,3 +139,391 @@ int typec_mode_priorities_get(struct typec_port *port, char *buf)
>  
>  	return count + sysfs_emit_at(buf, count, "\n");
>  }
> +
> +/* -------------------------------------------------------------------------- */
> +/* partner 'mod_selection' attribute */
> +
> +/**
> + * mode_selection_next() - Process mode selection results and schedule next
> + * action
> + *
> + * This function evaluates the outcome of the previous mode entry or exit
> + * attempt. Based on this result, it determines the next mode to process and
> + * schedules `mode_selection_work()` if further actions are required.
> + *
> + * If the previous mode entry was successful, the mode selection sequence is
> + * considered complete for the current cycle.
> + *
> + * If the previous mode entry failed, this function schedules
> + * `mode_selection_work()` to attempt exiting the mode that was partially
> + * activated but not fully entered.
> + *
> + * If the previous operation was an exit (after a failed entry attempt),
> + * `mode_selection_next()` then advances the internal list of candidate
> + * modes to determine the next mode to enter.
> + */
> +static void mode_selection_next(
> +	struct typec_partner *partner, struct mode_selection_state *ms)
> +{
> +	if (!ms->enter) {
> +		kfifo_skip(&partner->mode_sequence);
> +	} else if (!ms->result) {
> +		dev_info(&partner->dev, "%s mode entered\n", mode_names[ms->mode]);

Please remove debugging code.

> +
> +		partner->active_mode = ms;
> +		kfifo_reset(&partner->mode_sequence);
> +	} else {
> +		dev_err(&partner->dev, "%s mode entry failed: %pe\n",
> +			mode_names[ms->mode], ERR_PTR(ms->result));

What can a user do with this error message?

> +
> +		if (ms->result != -EBUSY ||
> +			ms->attempt_count >= mode_selection_entry_attempts)
> +			ms->enter = false;
> +	}
> +
> +	if (!kfifo_is_empty(&partner->mode_sequence))
> +		schedule_delayed_work(&partner->mode_selection_work,
> +			msecs_to_jiffies(mode_selection_delay));
> +}
> +
> +static void mode_selection_complete(struct typec_partner *partner,
> +				const int mode, const int result)
> +{
> +	struct mode_selection_state *ms;
> +
> +	mutex_lock(&partner->mode_sequence_lock);

You use a lock here, but not in the function above? Why?

> +	if (kfifo_peek(&partner->mode_sequence, &ms)) {
> +		if (ms->mode == mode) {
> +			ms->result = result;
> +			cancel_delayed_work(&partner->mode_selection_work);
> +			mode_selection_next(partner, ms);

Ah, you need to have the lock held, you didn't document that in text or
in a way the compiler can verify/check it :(


> +		}
> +	}
> +	mutex_unlock(&partner->mode_sequence_lock);
> +}
> +
> +void typec_mode_selection_altmode_complete(struct typec_altmode *alt,
> +				const int result)
> +{
> +	mode_selection_complete(to_typec_partner(alt->dev.parent),
> +		typec_svid_to_altmode(alt->svid), result);
> +}
> +EXPORT_SYMBOL_GPL(typec_mode_selection_altmode_complete);
> +
> +void typec_mode_selection_usb4_complete(struct typec_partner *partner,
> +				const int result)
> +{
> +	mode_selection_complete(partner, TYPEC_USB4_MODE, result);
> +}
> +EXPORT_SYMBOL_GPL(typec_mode_selection_usb4_complete);
> +
> +static void mode_selection_activate_usb4_mode(struct typec_partner *partner,
> +	struct mode_selection_state *ms)
> +{
> +	struct typec_port *port = to_typec_port(partner->dev.parent);
> +	int result = -EOPNOTSUPP;
> +
> +	if (port->ops && port->ops->enter_usb_mode) {
> +		if (ms->enter && port->usb_mode != USB_MODE_USB4)
> +			result = -EPERM;
> +		else
> +			result = port->ops->enter_usb_mode(port,
> +				ms->enter ? USB_MODE_USB4 : USB_MODE_USB3);
> +	}
> +
> +	if (ms->enter)
> +		ms->result = result;
> +}
> +
> +static int mode_selection_activate_altmode(struct device *dev, void *data)
> +{
> +	struct typec_altmode *alt = to_typec_altmode(dev);
> +	struct mode_selection_state *ms = (struct mode_selection_state *)data;
> +	int result = -ENODEV;
> +
> +	if (!strcmp(dev->type->name, ALTERNATE_MODE_DEVICE_TYPE_NAME)) {
> +		if (ms->mode == typec_svid_to_altmode(alt->svid)) {
> +			if (alt->ops && alt->ops->activate)
> +				result = alt->ops->activate(alt, ms->enter ? 1 : 0);
> +			else
> +				result = -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (ms->enter)
> +		ms->result = result;
> +
> +	return result == -ENODEV ? 0 : 1;
> +}
> +
> +static void mode_selection_activate_mode(struct typec_partner *partner,
> +	struct mode_selection_state *ms)
> +{
> +	dev_info(&partner->dev, "%s %s mode\n",
> +		ms->enter ? "Enter" : "Exit", mode_names[ms->mode]);

Again, please remove debugging code.

When drivers work properly, they are quiet.

And this really is the only valid use for ? : around, so that's ok here :)

> +void typec_mode_selection_add_cable(struct typec_partner *partner,
> +		struct typec_cable *cable)
> +{
> +	const u32 id_header = cable->identity->id_header;
> +	const u32 vdo1 = cable->identity->vdo[0];
> +	const u32 type = PD_IDH_PTYPE(id_header);
> +	const u32 speed = VDO_TYPEC_CABLE_SPEED(vdo1);
> +	bool capability[] = {
> +		[TYPEC_DP_ALTMODE] = true,
> +		[TYPEC_TBT_ALTMODE] = false,
> +		[TYPEC_USB4_MODE] = false,
> +	};

Why are these the default capabilities?  Where is that documented?  Why
these specific values to start with?

thanks,

greg k-h
