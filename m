Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FE194098;
	Fri, 27 Jun 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010793; cv=none; b=R8/MPAMEJsGxaTkVT1CGgrZ2faampqCL/iM6Em7lwCr6UtaJnStXdsYeCqAYshmgfTT5vvCSD8iOnL9U6POOEjqRjZ0EBUGxRWRgBhvcuiGO0hSEtPIdV8SNknUo59SJeP65Kh+nnfyH0FWPDN4gb6TmUZwwhAoWZg68IFCMpHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010793; c=relaxed/simple;
	bh=cnOtDTp49rcGs+oKyn1qPvt4zibTiJOGHiRVh6sqg5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEkcKNmcyJA6rXul3rg0nm9ZBlwEgCy4xt686ofu0suyOj/rR5vEJwePIsk1SKlqwunCQnIuU2hbS3tI4VbEmqDTrEz8IRdu2qcDwUE4IHs5JVk7VC6iCnapsDBICeNisNBgQRJH3YGtTYJN1liWXfkKUH0EbWbjES0nGk3HMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgzprAem; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgzprAem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC5AC4CEE3;
	Fri, 27 Jun 2025 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010793;
	bh=cnOtDTp49rcGs+oKyn1qPvt4zibTiJOGHiRVh6sqg5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgzprAemHfjAlJ8lIn/YpzWjZGUKUS3rcrrqCNZvVG7vQfU8NjU1e2/s8712GUPAO
	 Dca7Ng1MiEbwQS6wabeT8GlQS30a4OtPb0kyxxoBW8Zk9Vvqyn058aX7SHUMpaf03x
	 p5Y10Dv38l3KG5Mj5z5vrfTuqEgrrKCGlGBsc1oBLekdXxIWORMwwWg+bSnmohA9+W
	 JcbPrdbhALddbk1KYTVOl/LB3MLYGLRJPX4t1WnqDIZVfWUgWHNszxKKVFkUvM6QD3
	 rc7MqkahkJszRoFzPsOcjZpx9IRJ2MIwS85xerEtl/RWpacg+7W9m0B4oMC5f081BZ
	 8/PFAMjwzI9nA==
Date: Fri, 27 Jun 2025 07:53:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dawid Niedzwiecki <dawidn@google.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
Message-ID: <aF5N5jrRUlj3SUGS@google.com>
References: <20250624110028.409318-1-dawidn@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624110028.409318-1-dawidn@google.com>

On Tue, Jun 24, 2025 at 11:00:28AM +0000, Dawid Niedzwiecki wrote:
> This uses USB to talk to the ChromeOS EC. The protocol
> is defined by the EC and is fairly simple, with a length byte,
> checksum, command byte and version byte in the header.
> 
> The driver uses vendor defined usb interface with in/out
> endpoints to transfer requests and responses. The driver also
> uses one interrupt in endpoint which signals readiness of response
> and pending events on the EC side.

s/This//;s/The driver// and modify the rest of sentences accordingly.
Not a hard requirement but [1]("imperative mood").

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Some part of code is not easy to read to me. I'd suggest to consider to:
- Use shorter local variable names.
- Don't wrap lines whenever it's still under 100-cols.
- Put more relevant pieces of code closer.
- Insert blank lines for separating logic blocks.
- Drop redundant comments if the code is clear.
It doesn't need to be overkill as long as that makes sense.

> diff --git a/drivers/platform/chrome/cros_ec_usb.c b/drivers/platform/chrome/cros_ec_usb.c
> [...]
> +#include "cros_ec.h"
> +
> +/* Google */

Drop this comment which makes less sense.

> [...]
> +/* table of devices that work with this driver */

Drop the comment.

> +static const struct usb_device_id cros_ec_usb_table[] = {
> +	{ USB_VENDOR_AND_INTERFACE_INFO(USB_VENDOR_ID_GOOGLE,
> +					USB_CLASS_VENDOR_SPEC,
> +					USB_SUBCLASS_GOOGLE_EC_HOST_CMD,
> +					USB_PROTOCOL_GOOGLE_EC_HOST_CMD) },
> +	{} /* Terminating entry */

Drop the comment which is a very clear intent.

> +};
> +MODULE_DEVICE_TABLE(usb, cros_ec_usb_table);

I'd prefer to move the device_id definition just right before the struct
usb_driver.

> +/* Structure to hold all of our device specific stuff */

Drop the comment.

> +struct cros_ec_usb {

For readability, insert some blank lines in the struct.

> +	/* the usb device for this device */
> +	struct usb_device *udev;
> +	/* the interface for this device */
> +	struct usb_interface *interface;
> +	/* Cros EC device structure */
> +	struct cros_ec_device *ec_dev;

Maybe insert a blank line here.

> +	/* the buffer to receive data from bulk ep */
> +	u8 *bulk_in_buffer;
> +	/* the buffer to receive data from int ep */
> +	u8 *int_in_buffer;
> +	/* the urb to receive data from int ep */
> +	struct urb *int_in_urb;
> +	/* the size of the receive buffer from bulk ep */
> +	size_t bulk_in_size;
> +	/* the size of the receive buffer from int ep */
> +	size_t int_in_size;

Maybe insert a blank line here.

> +	/* the pipe of the bulk in ep */
> +	unsigned int bulk_in_pipe;
> +	/* the pipe of the bulk out ep */
> +	unsigned int bulk_out_pipe;
> +	/* the pipe of the int in ep */
> +	unsigned int int_in_pipe;
> +	/* the interval of the int in ep */
> +	uint8_t int_in_interval;

Maybe insert a blank line here.

`./scripts/checkpatch.pl --strict` complains about:
CHECK: Prefer kernel type 'u8' over 'uint8_t'

> [...]
> +struct int_msg {
> +	uint8_t int_type;
> +} __packed;

`./scripts/checkpatch.pl --strict` complains about:
CHECK: Prefer kernel type 'u8' over 'uint8_t'

> +static void cros_ec_int_callback(struct urb *urb);

Move just right before submit_int_urb() to make the intent more clear?

> +static int expected_response_size(const struct ec_host_response *host_response)
> +{
> +	/* Check host request version */
> +	if (host_response->struct_version != 3)
> +		return 0;
> +
> +	/* Reserved byte should be 0 */
> +	if (host_response->reserved)
> +		return 0;
> +
> +	return sizeof(*host_response) + host_response->data_len;
> +}

Wondering if the function really helps readability. Maybe just inline to
do_cros_ec_pkt_xfer_usb()?

> +static int cros_ec_usb_register(u16 idProduct, struct cros_ec_usb *ec_usb)
> +{
> +	struct registered_ec *ec;
> +
> +	ec = kzalloc(sizeof(*ec), GFP_KERNEL);

kmalloc() should be sufficient. The member fields are going to be overridden
anyway.

> +static int submit_int_urb(struct cros_ec_device *ec_dev)
> +{
> +	struct cros_ec_usb *ec_usb = ec_dev->priv;
> +	struct usb_device *usb_dev = interface_to_usbdev(ec_usb->interface);
> +	int ret;
> +
> +	/* Submit the INT URB. */
> +	usb_fill_int_urb(ec_usb->int_in_urb, usb_dev, ec_usb->int_in_pipe,
> +			 ec_usb->int_in_buffer, ec_usb->int_in_size,
> +			 cros_ec_int_callback, ec_usb, ec_usb->int_in_interval);
> +	ret = usb_submit_urb(ec_usb->int_in_urb, GFP_KERNEL);
> +
> +	return ret;

Eliminate the `ret`. Just return usb_submit_urb(...).

> +static void cros_ec_int_callback(struct urb *urb)
> +{
> +	struct cros_ec_usb *ec_usb = urb->context;
> +	struct cros_ec_device *ec_dev = ec_usb->ec_dev;
> +	int ret;
> +
> [...]
> +	if (urb->actual_length >= sizeof(struct int_msg)) {
> +		struct int_msg *int_msg =
> +			(struct int_msg *)ec_usb->int_in_buffer;
> +		enum cros_ec_usb_int_type int_type =
> +			(enum cros_ec_usb_int_type)int_msg->int_type;

Maybe insert a blank line here.

> +		switch (int_type) {
> +		case INT_TYPE_EVENT_OCCURED:
> +			if (ec_usb->registered) {
> +				ec_dev->last_event_time = cros_ec_get_time_ns();
> +				schedule_work(&ec_usb->work_ec_evt);
> +			}
> +			break;
> +		case INT_TYPE_RESPONSE_READY:
> +			ec_usb->resp_ready = true;
> +			wake_up(&ec_usb->resp_ready_wait);
> +			break;

I'm wondering who fills the `int_type` (i.e. 0 and 1) here? EC? If so, why
aren't they in cros_ec_command.h?

> +		default:
> +			dev_err(ec_dev->dev, "Unrecognized event: %d\n",
> +				int_type);
> +		}
> +	} else {
> +		dev_err(ec_dev->dev, "Incorrect int transfer len: %d\n",
> +			urb->actual_length);
> +	}

So in either cases, all of them need to resubmit the URB? Doesn't some of
them just need to return?

> +
> +resubmit:
> +	/* Resubmit the INT URB. */
> +	ret = submit_int_urb(ec_dev);
> +	if (ret)
> +		dev_err(ec_dev->dev, "Failed to resumbit int urb: %d", ret);
> +}
> +
> +static int do_cros_ec_pkt_xfer_usb(struct cros_ec_device *ec_dev,
> +				   struct cros_ec_command *ec_msg)
> +{
> +	struct cros_ec_usb *ec_usb = ec_dev->priv;
> +	struct ec_host_response *host_response;
> +	int req_size, ret, actual_length, expected_resp_size, resp_size;
> +	const int header_size = sizeof(*host_response);
> +	const int max_resp_size = header_size + ec_msg->insize;
> +	const int bulk_in_size = umin(ec_usb->bulk_in_size, ec_dev->din_size);
> +	uint8_t sum = 0;

`./scripts/checkpatch.pl --strict` complains about:
CHECK: Prefer kernel type 'u8' over 'uint8_t'

> [...]
> +	/* Get first part of response that contains a header. */
> +	ret = usb_bulk_msg(ec_usb->udev, ec_usb->bulk_in_pipe, ec_dev->din,
> +			   bulk_in_size, &actual_length,
> +			   BULK_TRANSFER_TIMEOUT_MS);
> +	if (ret) {
> +		dev_err(ec_dev->dev, "Failed to get response: %d\n", ret);
> +		goto exit;
> +	}
> +
> +	/* Verify number of received bytes. */
> +	if (actual_length < header_size) {
> +		dev_err(ec_dev->dev, "Received too little bytes: %d\n",
> +			actual_length);

Is it possible that the `actual_length < header_size` just because it needs
to further read? I.e. need a read loop for waiting EOF or
`actual_length >= header_size`?

> +		ret = -ENOSPC;
> +		goto exit;
> +	}
> +	expected_resp_size =
> +		expected_response_size((struct ec_host_response *)ec_dev->din);
> +	if ((expected_resp_size > max_resp_size) || (expected_resp_size == 0) ||
> +	    (actual_length > expected_resp_size)) {
> +		dev_err(ec_dev->dev, "Incorrect number of expected bytes: %d\n",
> +			expected_resp_size);
> +		ret = -ENOSPC;
> +		goto exit;
> +	}

Maybe insert a blank line here.

> +	resp_size = actual_length;

Move next to the following line of the comment.

> +	/* Get the rest of the response if needed. */
> +	if (resp_size < expected_resp_size) {
> +		ret = usb_bulk_msg(ec_usb->udev, ec_usb->bulk_in_pipe,
> +				   ec_dev->din + resp_size,
> +				   expected_resp_size - resp_size,
> +				   &actual_length, BULK_TRANSFER_TIMEOUT_MS);
> +		if (ret) {
> +			dev_err(ec_dev->dev,
> +				"Failed to get second part of response: %d\n",
> +				ret);
> +			goto exit;
> +		}
> +		resp_size += actual_length;

Same here: doesn't it need a read loop for waiting EOF or
`resp_size >= expected_resp_size`?

> +	}
> +
> +	/* Check if number of received of bytes is correct. */
> +	if (resp_size != expected_resp_size) {
> +		dev_err(ec_dev->dev,
> +			"Received incorrect number of bytes: %d, expected: %d\n",
> +			resp_size, expected_resp_size);
> +		ret = -ENOSPC;
> +		goto exit;
> +	}
> +
> +	/* Validate checksum */
> +	host_response = (struct ec_host_response *)ec_dev->din;
> +	for (int i = 0; i < sizeof(*host_response) + host_response->data_len;
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
I.e. expected_resp_size.

> +	     i++) {
> +		sum += ec_dev->din[i];
> +	}

Drop the {} pair.

> +	if (sum) {
> +		dev_err(ec_dev->dev, "Bad packet checksum calculated %x\n",
> +			sum);
> +		ret = -EBADMSG;
> +		goto exit;
> +	}
> +
> +	ec_msg->result = host_response->result;
> +	memcpy(ec_msg->data, ec_dev->din + sizeof(*host_response),

header_size == sizeof(*host_response). Either drop `header_size` or use it.

> +/**
> + * usb_evt_handler - USB to AP event handler
> + * @work: Work struct
> + */

Maybe drop the comment?

> +static int cros_ec_usb_probe(struct usb_interface *intf,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *usb_dev = interface_to_usbdev(intf);
> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out, *int_in;
> +	struct device *if_dev = &intf->dev;
> +	struct cros_ec_device *ec_dev;
> +	const u16 idProduct = usb_dev->descriptor.idProduct;
> +	struct cros_ec_usb *ec_usb = cros_ec_usb_get_registered(idProduct);
> +	const bool is_registered = ec_usb != NULL;

Or !!ec_usb.

> +	int retval;
> +
> +	/*
> +	 * Do not register the same EC device twice. The probing is performed every
> +	 * reboot, sysjump, crash etc. Recreating the /dev/cros_X file every time
> +	 * would force all application to reopen the file, which is not a case for
> +	 * other cros_ec_x divers. Instead, keep the cros_ec_device and cros_ec_usb
> +	 * structures constant and replace USB related structures for the same EC
> +	 * that is reprobed.
> +	 *
> +	 * The driver doesn't support handling two devices with the same idProduct,
> +	 * but it will never be a real usecase.
> +	 */

I don't quite understand why does it need to memorize the registered ECs.
Supposedly, the probe function is only called few times during booting, and
gets success once. Hot-plugs?

> +	if (!is_registered)
> +		ec_usb = kzalloc(sizeof(*ec_usb), GFP_KERNEL);
> +
> +	if (!ec_usb)
> +		return -ENOMEM;
> +
> +	if (!is_registered) {
> +		mutex_init(&ec_usb->io_mutex);
> +		ec_dev = kzalloc(sizeof(*ec_dev), GFP_KERNEL);
> +		if (!ec_dev) {
> +			retval = -ENOMEM;
> +			goto error;
> +		}
> +		ec_usb->ec_dev = ec_dev;
> +	} else {
> +		ec_dev = ec_usb->ec_dev;
> +	}

The `!ec_usb` check is only needed after kzalloc(). Thus, the code block
could be simplified to:

        if (!is_registered) {
                ec_usb = kzalloc(...);
                if (!ec_usb)
                        return -ENOMEM

                ec_dev = kzalloc(...);

                /* initialized ec_usb and ec_dev */
                mutex_init(...);
                ec_usb->...
        }
        ec_dev = ec_usb->ec_dev;

> +
> +	ec_usb->udev = usb_get_dev(usb_dev);
> +	ec_usb->interface = usb_get_intf(intf);

Maybe insert a blank line here.

> +	/* Use first bulk-in/out endpoints + int-in endpoint */
> +	retval = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in,
> +					   &bulk_out, &int_in, NULL);
> +	if (retval) {
> +		dev_err(if_dev,
> +			"Could not find bulk-in, bulk-out or int-in endpoint\n");
> +		goto error;
> +	}

Maybe insert a blank line here.

> +	/* Bulk endpoints have to be capable of sending headers in one transfer. */
> +	if ((usb_endpoint_maxp(bulk_out) < sizeof(struct ec_host_request)) ||
> +	    (usb_endpoint_maxp(bulk_in) < sizeof(struct ec_host_response)) ||
> +	    (usb_endpoint_maxp(int_in)) < sizeof(struct int_msg)) {
> +		retval = -ENOSPC;
> +		dev_err(if_dev, "Incorrect max packet size\n");
> +		goto error;
> +	}

Maybe insert a blank line here.

> +	ec_usb->bulk_out_pipe =
> +		usb_sndbulkpipe(ec_usb->udev, bulk_out->bEndpointAddress);
> +	ec_usb->bulk_in_size = usb_endpoint_maxp(bulk_in);
> +	ec_usb->bulk_in_pipe =
> +		usb_rcvbulkpipe(ec_usb->udev, bulk_in->bEndpointAddress);
> +	ec_usb->bulk_in_buffer = kmalloc(ec_usb->bulk_in_size, GFP_KERNEL);
> +	if (!ec_usb->bulk_in_buffer) {
> +		dev_err(if_dev, "Failed to allocate bulk in buffer\n");
> +		retval = -ENOMEM;
> +		goto error;
> +	}

Maybe insert a blank line here.

> +	ec_usb->int_in_size = usb_endpoint_maxp(int_in);
> +	ec_usb->int_in_pipe =
> +		usb_rcvintpipe(ec_usb->udev, int_in->bEndpointAddress);
> +	ec_usb->int_in_interval = int_in->bInterval;
> +	ec_usb->int_in_buffer = kmalloc(ec_usb->int_in_size, GFP_KERNEL);
> +	if (!ec_usb->int_in_buffer) {
> +		dev_err(if_dev, "Failed to allocate int in buffer\n");
> +		retval = -ENOMEM;
> +		goto error;
> +	}
> +	ec_usb->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!ec_usb->int_in_urb) {
> +		dev_err(if_dev, "Failed to allocate int in urb\n");
> +		retval = -ENOMEM;
> +		goto error;
> +	}
> +
> +	ec_dev->dev = if_dev;
> +	ec_dev->phys_name = dev_name(if_dev);
> +	if (!is_registered) {
> +		ec_dev->priv = ec_usb;
> +		/* EC uses int endpoint to signal events. */
> +		ec_dev->irq = 0;
> +		ec_dev->cmd_xfer = NULL;
> +		ec_dev->pkt_xfer = do_cros_ec_pkt_xfer_usb;
> +		ec_dev->din_size = sizeof(struct ec_host_response) +
> +				sizeof(struct ec_response_get_protocol_info);
> +		ec_dev->dout_size = sizeof(struct ec_host_request) +
> +				sizeof(struct ec_params_rwsig_action);
> +		INIT_WORK(&ec_usb->work_ec_evt, usb_evt_handler);
> +		init_waitqueue_head(&ec_usb->resp_ready_wait);
> +	} else {
> +		/*
> +		 * We need to allocate dout and din buffers, because cros_ec_register
> +		 * won't be called. These buffers were freed once previous usb device was
> +		 * disconnected. Use buffer sizes from the last query.
> +		 * The EC_HOST_EVENT_INTERFACE_READY event will be triggered at the end
> +		 * of a boot, which calls cros_ec_query_all function, that reallocates
> +		 * buffers.
> +		 */
> +		ec_dev->din = devm_kzalloc(ec_dev->dev, ec_dev->din_size, GFP_KERNEL);
> +		if (!ec_dev->din) {
> +			retval = -ENOMEM;
> +			dev_err(if_dev, "Failed to allocate din buffer\n");
> +			goto error;
> +		}
> +		ec_dev->dout = devm_kzalloc(ec_dev->dev, ec_dev->dout_size, GFP_KERNEL);
> +		if (!ec_dev->dout) {
> +			retval = -ENOMEM;
> +			dev_err(if_dev, "Failed to allocate dout buffer\n");
> +			goto error;
> +		}
> +	}

This whole block for initializing `ec_dev` can be done earlier. See another
`!is_registered` above.

> +
> +	/* Needed by ec register function */

Drop the comment.

> +	usb_set_intfdata(intf, ec_dev);

This also can be done earlier when `ec_dev` is determined.

> +
> +	mutex_lock(&ec_usb->io_mutex);
> +	ec_usb->disconnected = false;
> +	mutex_unlock(&ec_usb->io_mutex);

Wondering if it really needs to acquire the lock? Probe functions usually
don't need to as there is no possible concurrent paths yet.

> [...]
> +error:
> +	/* Free allocated memory */
> +	cros_ec_usb_delete(ec_usb);

Be careful to make sure whether cancel_work_sync() works even if
`&ec_usb->work_ec_evt` is uninitialized.

> +static void cros_ec_usb_disconnect(struct usb_interface *intf)
> +{
> +	struct cros_ec_device *ec_dev = usb_get_intfdata(intf);
> +	struct cros_ec_usb *ec_usb = ec_dev->priv;
> +
> +	/* prevent more I/O from starting */
> +	mutex_lock(&ec_usb->io_mutex);
> +	ec_usb->disconnected = true;
> +	mutex_unlock(&ec_usb->io_mutex);
> +
> +	cros_ec_usb_delete(ec_usb);
> +
> +	dev_info(&intf->dev, "Disconnected\n");

This is the only dev_info() in the various callbacks. Consider to drop
it if it might not very useful.

> +static int cros_ec_usb_resume(struct usb_interface *intf)
> +{
> +	struct cros_ec_device *ec_dev = usb_get_intfdata(intf);
> +	int err;
> +
> +	/* URB is killed during suspend. */
> +	err = submit_int_urb(ec_dev);
> +	if (err) {
> +		dev_err(ec_dev->dev,
> +			"Failed to sumbit int urb after resume: %d\n", err);
> +	}
> +
> +	return 0;

Doesn't it need to return `err`?

> +static int cros_ec_usb_post_reset(struct usb_interface *intf)
> +{
> +	struct cros_ec_device *ec_dev = usb_get_intfdata(intf);
> +	struct cros_ec_usb *ec_usb = ec_dev->priv;
> +	int err;
> +
> +	err = submit_int_urb(ec_dev);
> +	if (err) {
> +		dev_err(ec_dev->dev,
> +			"Failed to sumbit int urb after reset: %d\n", err);
> +	}
> +	mutex_unlock(&ec_usb->io_mutex);
> +
> +	return 0;

Doesn't it need to return `err`?

> +static struct usb_driver cros_ec_usb = {
> +	.name = "cros-ec-usb",
> +	.probe = cros_ec_usb_probe,
> +	.disconnect = cros_ec_usb_disconnect,
> +	.suspend = cros_ec_usb_suspend,
> +	.resume = cros_ec_usb_resume,
> +	.pre_reset = cros_ec_usb_pre_reset,
> +	.post_reset = cros_ec_usb_post_reset,
> +	.id_table = cros_ec_usb_table,
> +	/* Do not autosuspend EC */
> +	.supports_autosuspend = 0,
> +};

Most .X callbacks are named cros_ec_usb_X. Only the .id_table is different.
To be neat, I'd suggest to use `cros_ec_usb_id_table`.
