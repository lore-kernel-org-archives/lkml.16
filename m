Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACC23ED5A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674776; cv=none; b=CibHyeOk3C9DPpRLURRjZ/GpdnuXggMHRVBxT6NGxqXBb2cC7fdu4bhNDCCAlMn2TIjM43Ppfi5cIvgOnhQPgNleNKtFMECzhU6GUAOADIa3FoK3dxwCYQ8XZV2SacdwiPL22tpILNdAZ6akjeUizY16/Emx4jMKfij6inxrX0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674776; c=relaxed/simple;
	bh=Bv+uwo4GMuyNJQ9eDkt1zrY1wkpQCo27hWs4E7JqD1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiiI/oqswpOREcLgsfDIpgR4/Jutde4ZmhPRhNv6l+a6se4orx5LUXNR9HZnlSBreJYceJWvxCxcnXgLfITkjrTWozY1LEjnbT0dh72C276pMkaBhAA4Lm9yDr8NLsdEGI4FUKvSUzQN3di2RfXQT7Y4h9XCVNUmpWWi6T7tDGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OBwvFN2R; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OBwvFN2R"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso762815666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750674771; x=1751279571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdxywV0NH0iaM/ttnhi2l4wNDiV5HooWLUp5FlxnZgo=;
        b=OBwvFN2RqHim2W1p66RHDrBrfjGujTNX0+dGXMwMio7CQONqh/DSkOeQkiiaH2oa2F
         VlKQ7m+nfJkOZzdEdKn73XzoV8Wf73eomgyVhx1Q5GCdwep7dd495YZfGBEZIuPt9mra
         XaL0AEdqOtekYv+quenG6xkdpVax953apiYVNUI+EizALan3MLhTqJrZApjgmtQ0z8K8
         CUOHqZCE2KXVrAwc12BuPwQe5L3ZP8Ioue9deGv7kaY4Y+xQzCRmJj6Qb7djaRgpFJNc
         pt5CS5+QTxuN21qgeRnLypq9pirNynPHICnVU1Ing/utystMLySyJf4N+evR4s2myOA2
         uN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674771; x=1751279571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdxywV0NH0iaM/ttnhi2l4wNDiV5HooWLUp5FlxnZgo=;
        b=WPQeqD+1BuPnOqtAwxEPaSxMfR/DvtzB8+5/Tu6AHRmMq5v+e7fpf+Q11XRFzTH6lI
         8Rp7gq+u4JKepgyLELRmtJ2Qklk2iLXROJx2UHefQl3gazRYGot7k1Ar2gPwc2g93EYa
         FTbeDG3xAf8ElVE+mYEa5yNRUVlbvKHm9pQ/u2gs1gID3yW4RfYCDGoLJ7FfyiuhMfJu
         EH2kkv9UWqfgXn/ccxtg907GB2qlLgUPjo7spHewePVMxV3l0BSWIEbsMf4g+wDUNpQ8
         593J/1DmKBOCsl7AfHbjGCW4WsXITTr7OYqIMLxFM0oyw43WwqpWx91rrHOpdSLG48m8
         zx1A==
X-Forwarded-Encrypted: i=1; AJvYcCUIj29wvVcxGgPsEhibdzgGzzxAL99XH67qbhtju/zMrnfl4GKyQ621sYU+srHKmXhHaQvc7tj3an9cLCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI7sBrvpobaZn44aWkshyLJVwJxP2VYjmUsR0FHt1nheYsMLSe
	d/h6jL2EhyxDN+m8dLGuUEMz8MrOnknGRnoizSvQX9az8XGwrlmKFQBNazFhNpIG6RA=
X-Gm-Gg: ASbGncsq6YFqj8gUuWqvWaYh2psVNNwHkmN/7UrnmOnNBo00sekSAIi8s2M8u1Y8lUh
	FIWuBxqqj1f4lau6YvKO/94+0kqk+m6r8CCc9ABaZR12RHd4lF5rmPxCFDaXcNDo6/M7E/jR8vq
	R07+cffjy6+p/V6ytBmWQLAx4PJo+pWznmnYrjeCs9NPV3wLlr3PuZWJ8dzysl5ThXZqHaClMSE
	TVUOMaERrQDIqY7axJNccnppILA4IEJe5bKmBlD47kJ5LW/kX7SP8riJPSLasM7aG7mJ88dl2Yn
	cYhHdEfYuBWqFK5Mn9gmUhMVnWBWj67y49wAJSJCKIoKrAkg1wFLp/AhINt/kciSHm0FrZ6wo4+
	KwNYmUKy8FGjiCubF1Jm0aawv35/V
X-Google-Smtp-Source: AGHT+IFvNBoIOvQ/sHYCO7i0A9KtWAQnuEPAaIEKllMoRXi3zODcl06DBC4Fob7s5Z7cqNpBt61xfA==
X-Received: by 2002:a17:907:6088:b0:ad8:8529:4f9b with SMTP id a640c23a62f3a-ae057bc4354mr1212808666b.38.1750674770850;
        Mon, 23 Jun 2025 03:32:50 -0700 (PDT)
Received: from ?IPV6:2001:a61:1376:6301:41a9:a5d4:30e1:2ed8? ([2001:a61:1376:6301:41a9:a5d4:30e1:2ed8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbd61asm5863363a12.66.2025.06.23.03.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:32:50 -0700 (PDT)
Message-ID: <3e1baa67-2624-4e5d-85a7-57b6cdf619e7@suse.com>
Date: Mon, 23 Jun 2025 12:32:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
To: hsyemail2@gmail.com, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sheng-Yuan Huang <syhuang3@nuvoton.com>
References: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
 <20250623071713.12814-1-syhuang3@nuvoton.com>
 <20250623071713.12814-2-syhuang3@nuvoton.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250623071713.12814-2-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23.06.25 09:17, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add support for the Nuvoton USB-to-serial adapter, which provides
> multiple serial ports over a single USB interface.
> 
> The device exposes one control endpoint, one bulk-in endpoint, and
> one bulk-out endpoint for data transfer. Port status is reported via
> an interrupt-in or bulk-in endpoint, depending on device configuration.

A few issues left I am afraid.
Comments on them inline.

	Regards
		Oliver

> +/* Index definition */
> +#define NCT_VCOM_INDEX_0	0
> +#define NCT_VCOM_INDEX_1	1
> +#define NCT_VCOM_INDEX_2	2
> +#define NCT_VCOM_INDEX_3	3
> +#define NCT_VCOM_INDEX_4	4
> +#define NCT_VCOM_INDEX_5	5

Why? These make no sense.

> +#define NCT_VCOM_INDEX_GLOBAL	0xF
> +
> +/* Command */
> +#define NCT_VCOM_GET_NUM_PORTS		0
> +#define NCT_VCOM_GET_PORTS_SUPPORT	1
> +#define NCT_VCOM_GET_BAUD		2
> +#define NCT_VCOM_SET_INIT		3
> +#define NCT_VCOM_SET_CONFIG		4
> +#define NCT_VCOM_SET_BAUD		5
> +#define NCT_VCOM_SET_HCR		6
> +#define NCT_VCOM_SET_OPEN_PORT		7
> +#define NCT_VCOM_SET_CLOSE_PORT		8
> +#define NCT_VCOM_SILENT			9
> +/* Use bulk-in status instead of interrupt-in status */
> +#define NCT_VCON_SET_BULK_IN_STATUS	10
> +
> +struct nct_vendor_cmd {
> +	__le16 val;	/* bits[3:0]: index, bits[11:4]: cmd, bits[15:12]: reserved */
> +};
> +
> +#define NCT_CMD_INDEX_MASK	0x000F
> +#define NCT_CMD_CMD_MASK	0x0FF0
> +#define NCT_CMD_CMD_SHIFT	4
> +
> +static inline __le16 nct_build_cmd(__u8 cmd_code, __u8 index)
> +{
> +	return cpu_to_le16((cmd_code << NCT_CMD_CMD_SHIFT) | (index & NCT_CMD_INDEX_MASK));

This may be picking nits, but it seems to me that cmd_code is u8.
Hence cmd_code << NCT_CMD_CMD_SHIFT) would also be u8 and the operation
may overflow. You better cast cmd_code to u16.

> +static u16 nct_set_baud(struct usb_interface *intf, u16 index, unsigned int cflag, bool *found)
> +{
> +	struct nct_vendor_cmd cmd;
> +	struct nct_ctrl_msg msg;
> +	u16 i;
> +	u8 spd = NCT_DEFAULT_BAUD;
> +
> +	*found = false;
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_BAUD, index);
> +	dev_dbg(&intf->dev, "tty baud: 0x%X\n", (cflag & CBAUD));
> +	for (i = 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
> +		if ((cflag & CBAUD) == NCT_BAUD_SUP[i]) {
> +			spd = i;
> +			dev_dbg(&intf->dev, "index %d set baud: NCT_BAUD_SUP[%d]=%d\n",
> +				index, spd, NCT_BAUD_SUP[i]);
> +			/*
> +			 * Create control message
> +			 * Note: The NCT_VCOM_SET_BAUD only set the baud rate
> +			 */
> +			msg.val = nct_build_ctrl_msg(0, 0, 0, 0, spd);
> +			if (nct_vendor_write(intf, cmd, le16_to_cpu(msg.val)))
> +				dev_err(&intf->dev, "%s - Set index: %d speed error\n",
> +					__func__, index);
> +			else
> +				*found = true;
> +
> +			break;
> +		}
> +	}
> +
> +	if (!*found)
> +		dev_warn(&intf->dev, "Unsupported baud rate 0x%X requested\n", (cflag & CBAUD));

This is problematic. There are two reasons for this to trigger

1. no match
2. IO error in nct_vendor_write()

If the second case happens you nevertheless claim the first cause
I'd just drop the warning. Better nothing than something misleading.
  
> +
> +	return spd;
> +}


> +static int nct_tiocmset_helper(struct tty_struct *tty, unsigned int set,
> +			       unsigned int clear)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_ctrl_msg msg;
> +	struct nct_vendor_cmd cmd;
> +	unsigned long flags;
> +	u8 hcr = 0;
> +
> +	if (set & TIOCM_RTS)
> +		hcr |= NCT_HCR_RTS;
> +	if (set & TIOCM_DTR)
> +		hcr |= NCT_HCR_DTR;
> +	if (clear & TIOCM_RTS)
> +		hcr &= ~NCT_HCR_RTS;
> +	if (clear & TIOCM_DTR)
> +		hcr &= ~NCT_HCR_DTR;
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_HCR, tport->hw_idx);
> +	msg.val = cpu_to_le16(hcr);
> +
> +	spin_lock_irqsave(&tport->port_lock, flags);

No need for irqsave. A simple irq version will do.
Using irqsave is misleading, because we know that this
function can sleep.

> +	tport->hcr = hcr;
> +	spin_unlock_irqrestore(&tport->port_lock, flags);
> +
> +	dev_dbg(&intf->dev,
> +		"index/cmd/val(hcr)=%X, %X, %X [RTS=%X, DTR=%X]\n",
> +		nct_get_cmd_index(cmd.val), nct_get_cmd_cmd(cmd.val),
> +		le16_to_cpu(msg.val), hcr & NCT_HCR_RTS, hcr & NCT_HCR_DTR);
> +
> +	return nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> +}


> +static int nct_serial_write_data(struct tty_struct *tty, struct usb_serial_port *port,
> +				 const unsigned char *buf, int count)
> +{
> +	int ret;
> +	unsigned long flags;
> +	struct nct_packet_header hdr;
> +	int wr_len;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +
> +	wr_len = min((unsigned int)count, NCT_MAX_SEND_BULK_SIZE - sizeof(hdr));
> +
> +	if (!wr_len)
> +		return 0;
> +
> +	spin_lock_irqsave(&tport->port_lock, flags);
> +

[..]

> +	/* Fill header */
> +	hdr.magic = NCT_HDR_MAGIC;
> +	hdr.magic2 = NCT_HDR_MAGIC2;
> +	nct_set_hdr_idx_len(&hdr, tport->hw_idx, wr_len); /* The 'hw_idx' is based on 1 */
> +
> +	/* Copy data */
> +	memcpy(port->write_urb->transfer_buffer + sizeof(hdr),
> +	       (const void *)buf, wr_len);
> +
> +	/* Filled urb data */
> +	memcpy(port->write_urb->transfer_buffer, (const void *)&hdr,
> +	       sizeof(hdr)); /* Copy header after filling all other fields */

You are copying the header in unconditionally ...

> +
> +	/* Set urb length(Total length) */
> +	port->write_urb->transfer_buffer_length = wr_len + sizeof(hdr);
> +
> +	port->write_urb->transfer_flags |= URB_ZERO_PACKET;
> +
> +	ret = usb_submit_urb(port->write_urb, GFP_ATOMIC);
> +	if (ret < 0) {
> +		dev_err(&port->dev,
> +			"%s: usb_submit_urb failed, ret=%d, hw_idx=%d\n",
> +			__func__, ret, tport->hw_idx);
> +	} else {
> +		tport->write_urb_in_use = true; /* Set it as busy */
> +		ret = wr_len + sizeof(hdr);
> +	}
> +
> +	spin_unlock_irqrestore(&tport->port_lock, flags);
> +
> +	if (ret > sizeof(hdr))
> +		ret = ret - sizeof(hdr);

... and here you check?

This needs an explanation. A very good explanation.

> +
> +	dev_dbg(&port->dev, "returning %d\n", ret);
> +	return ret;
> +}
> +
> +static int nct_serial_write(struct tty_struct *tty, struct usb_serial_port *port,
> +			    const unsigned char *buf, int count)
> +{
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +
> +	if (!port) {
> +		pr_err("%s: port is NULL!\n", __func__);
> +		return -EIO;
> +	}
> +	if (!port->write_urb) {
> +		dev_err(&port->dev, "%s: write_urb not initialized!\n",	__func__);
> +		return -EIO;
> +	}
> +	if (!port->write_urb->transfer_buffer) {
> +		dev_err(&port->dev, "%s: transfer_buffer not initialized!\n", __func__);
> +		return -EIO;
> +	}

Can these errors really happen?

> +
> +	/* Flow control */
> +	if (tty_port_cts_enabled(tty->port))
> +		if (tport->flow_stop_wrt)
> +			return 0;
> +
> +	return nct_serial_write_data(tty, port, buf, count);
> +}


> +static int nct_open(struct tty_struct *tty, struct usb_serial_port *port)
> +{
> +	struct nct_vendor_cmd cmd;
> +	struct nct_ctrl_msg msg;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_interface *intf = serial->interface;
> +
> +	if (!port->serial)
> +		return -ENXIO;
> +
> +	/* Allocate write_urb */
> +	if (!port->write_urb) {
> +		port->write_urb = usb_alloc_urb(0, GFP_KERNEL);
> +		if (!port->write_urb) {
> +			dev_err(&port->dev, "%s: Failed to allocate write URB\n", __func__);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	/* Allocate bulk_out_buffer */
> +	port->write_urb->transfer_buffer = kmalloc(NCT_MAX_SEND_BULK_SIZE, GFP_KERNEL);

Can use kzalloc()

> +	if (!port->write_urb->transfer_buffer) {
> +		usb_free_urb(port->write_urb);
> +		port->write_urb = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	/* Clear(init) buffer */
> +	memset(port->write_urb->transfer_buffer, 0, NCT_MAX_SEND_BULK_SIZE);
> +
> +	/* Set write_urb */
> +	usb_fill_bulk_urb(port->write_urb, serial->dev,
> +			  usb_sndbulkpipe(serial->dev, serial_priv->bulk_out_ep->bEndpointAddress),
> +			  port->write_urb->transfer_buffer, NCT_MAX_SEND_BULK_SIZE,
> +			  nct_write_bulk_callback, port);
> +
> +	/* Be sure the device is started up */
> +	if (nct_startup_device(port->serial) != 0)
> +		return -ENXIO;
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_OPEN_PORT, tport->hw_idx);
> +	msg.val = cpu_to_le16(0);
> +	nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));

This can fail.

> +	/*
> +	 * Delay 1ms for firmware to configure hardware after opening the port.
> +	 * (Especially at high speed)
> +	 */
> +	usleep_range(1000, 2000);
> +	return 0;
> +}
> +
> +static void nct_close(struct usb_serial_port *port)
> +{
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	unsigned long flags;
> +
> +	mutex_lock(&port->serial->disc_mutex);
> +	/* If disconnected, don't send the close-command to the firmware */
> +	if (port->serial->disconnected)

We are disconnected ...
> +		goto exit;
> +
> +	nct_serial_port_end(port);
> +
> +exit:
> +	/* Shutdown any outstanding bulk writes */
> +	usb_kill_urb(port->write_urb);

... so this is either useless, or a bug has already happened.

> +
> +	/* Free transfer_buffer */
> +	kfree(port->write_urb->transfer_buffer);
> +	port->write_urb->transfer_buffer = NULL;
> +
> +	if (tport) {
> +		spin_lock_irqsave(&tport->port_lock, flags);
> +		tport->write_urb_in_use = false;
> +		spin_unlock_irqrestore(&tport->port_lock, flags);
> +	}
> +
> +	mutex_unlock(&port->serial->disc_mutex);
> +}
> +

> +static void nct_usb_serial_read(struct urb *urb)
> +{
> +	struct usb_serial_port *port =  urb->context;
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct nct_tty_port *tport;
> +	struct nct_packet_header *hdr = NULL;
> +	unsigned char *data = urb->transfer_buffer;
> +	int i, j;
> +	int actual_len = urb->actual_length;
> +	int len = 0;
> +	struct nct_port_status *nps;
> +	unsigned long flags;
> +
> +	if (!urb->actual_length)
> +		return;
> +
> +again:
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	tport = serial_priv->cur_port;
> +	if (!tport) {
> +		/*
> +		 * Handle a new data package (i.e., it is not
> +		 * the remaining data without a header).
> +		 * The package does not need to be combined this time.
> +		 */
> +
> +		for (i = 0; i < urb->actual_length; i++) {
> +			hdr = (struct nct_packet_header *)data;

How do you know that there is enough data for struct nct_packet_header
left?

> +			/* Decode the header */
> +
> +			if (serial_priv->status_trans_mode) {
> +				/*
> +				 * Status data is also transmitted via bulk-in
> +				 * pipe.
> +				 */
> +				if (hdr->magic == NCT_HDR_MAGIC &&
> +				    hdr->magic2 == NCT_HDR_MAGIC_STATUS &&
> +				    nct_get_hdr_len(hdr) == 24 && actual_len >= 28) {
> +					/*
> +					 * Notice: actual_len will be decreased,
> +					 * it is equal to urb->actual_length
> +					 * only at the beginning.
> +					 */
> +
> +					/*
> +					 * Status report.
> +					 * It should be a standalone package in
> +					 * one URB
> +					 */
> +					data += sizeof(struct nct_packet_header);
> +					actual_len -= sizeof(struct nct_packet_header);
> +
> +					nps = (struct nct_port_status *)data;
> +
> +					for (j = 0; j < actual_len - 4; j++) {
> +						nct_update_status(serial, (unsigned char *)nps);
> +						nps++;
> +					}
> +
> +					spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +					return;
> +				}
> +			}
> +
> +			if (hdr->magic == NCT_HDR_MAGIC &&
> +			    hdr->magic2 == NCT_HDR_MAGIC2 &&
> +			    nct_get_hdr_idx(hdr) <= NCT_MAX_NUM_COM_DEVICES &&
> +			    nct_get_hdr_len(hdr) <= 512)
> +				break;
> +
> +			data++;
> +			actual_len--;
> +			if (!actual_len) {
> +				dev_err(&intf->dev, "%s: Decode serial packet size failed.\n",
> +					__func__);
> +				spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +				return;
> +			}
> +		}
> +		/*
> +		 * Search tty port
> +		 * Search the tty device by the idx in header, and check if
> +		 * it is registered or opened.
> +		 * If it is, record them. The record will be used later for
> +		 * 2 purposes:
> +		 *   (1) If the current data package is incomplete, the following
> +		 *       incoming data will not include a header.
> +		 *   (2) To determine which device will be used for transmission.
> +		 */
> +		tport = NULL;
> +		for (i = 0; i < serial->type->num_ports; i++) {
> +			port = serial->port[i];
> +			tport = usb_get_serial_port_data(port);
> +			if (tport->hw_idx != nct_get_hdr_idx(hdr))
> +				continue;
> +
> +			break;
> +		}
> +		if (!tport) {
> +			dev_err(&intf->dev, "%s: Decode serial packet index failed.\n",	__func__);
> +			spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +			return;
> +		}
> +		/*
> +		 * Calculate the data length.
> +		 * Then, check if the length specified in the header matches
> +		 * the data length. If not, it indicates that the data we
> +		 * received spans across two (or more) packets.
> +		 */
> +		actual_len -= sizeof(struct nct_packet_header);
> +		data += sizeof(struct nct_packet_header);
> +		/* actual_len: the data length of the data we got this time */
> +		if (nct_get_hdr_len(hdr) > actual_len) {
> +			/*
> +			 * It means the length specified in the header (the
> +			 * custom header) is greater than the length of the
> +			 * data we received.
> +			 * Therefore, the data we received this time does not
> +			 * span across another packet (i.e. no new header).
> +			 */
> +			len = actual_len;
> +			/*
> +			 * cur_len: Record how many data does not handle yet
> +			 */
> +			serial_priv->cur_len = nct_get_hdr_len(hdr) - len;
> +			/*
> +			 * Record the current port. When we got remained data of
> +			 * the package next time
> +			 */
> +			serial_priv->cur_port = tport;
> +		} else {
> +			/*
> +			 * The data we got crosses packages(not belong
> +			 * to the same header). We only handle data by
> +			 * the length in header. And we will handle
> +			 * another package when 'goto "again" '.
> +			 */
> +			len = nct_get_hdr_len(hdr);
> +		}
> +	} else { /*  Handling the remained data which crosses package */
> +		if (serial_priv->cur_len > actual_len) {
> +			/*
> +			 * The unhandled part of the data exceeds the data we
> +			 * received this time. We only handle the data we
> +			 * have, expecting more data to be received later.
> +			 */
> +			len = actual_len;
> +		} else {
> +			/*
> +			 * This means the package has been fully handled.
> +			 * Clear 'cur_port' as no additional data needs to be
> +			 * attached to the current package.
> +			 */
> +			len = serial_priv->cur_len;
> +			serial_priv->cur_port = NULL;
> +		}
> +		serial_priv->cur_len -= len;
> +	}
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +	/*
> +	 * The per-character sysrq handling is too slow for fast devices,
> +	 * so we bypass it in the vast majority of cases where the USB serial is
> +	 * not a console.
> +	 */
> +	if (tport->sysrq) {
> +		for (i = 0; i < len; i++, data++)
> +			tty_insert_flip_char(&port->port, *data, TTY_NORMAL);
> +	} else {
> +		tty_insert_flip_string(&port->port, data, len);
> +		data += len;
> +	}
> +	/*
> +	 * Send data to the tty device (according to the port identified above).
> +	 */
> +	tty_flip_buffer_push(&port->port);
> +	actual_len -= len;
> +
> +	/*
> +	 * It means that the data we received this time contains two or
> +	 * more data packages, so it needs to continue processing the next
> +	 * data packages.
> +	 */
> +	if (actual_len > 0)
> +		goto again;
> +}
