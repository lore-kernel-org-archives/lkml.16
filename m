Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F67235059
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951865; cv=none; b=f5lmG/CpClf0WXzoSxyMNgvfgeALBM42gg3BEX5dqa3XuPNtd+H8qCw8oT96/Zdkn+oUcjr0pAncXbsur1ChaUEFl3wVS9S1UMaIfv+DvyvQwyWURLq92nAuD4cm/FK4wRqvm8saOD6eof0NOtd5qajAq0zEtkTfTpMs2sgvsLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951865; c=relaxed/simple;
	bh=gbbddoWIkSxtgMbjiStS9u+ATaAQTgpY4F0QR3RS7bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbwHU/TEgJHBleDHUss97hJ+F7LTVc51T0gkIqFYbDvqY3qsQyVn9C69Fq0Wi77OsxDDJchqtgOjchm91CisOLAwjm3+fMAgzd8v5wGDqEFgxKcwYzE1/G2JV6UPBAr6iITRQYuG6zSrTAGmQxysBnw0M3sIG5jNPP5VXQcy3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FdyS8OdC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FdyS8OdC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad51ba0af48so1150713366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748951861; x=1749556661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZPvUCvE2vPO2qd4IMAnQgX90yJMpfw/oC9yH8/Z6qM=;
        b=FdyS8OdCqbSsAPgUFNHOOg+JSNKlznimiWW5JZFs2xn77aC3JFUHKamQSoLwBrwBFI
         wDU6c9WI4qGk/5b+sWBnC834bE0ghfpk4w9VNQUdpUtj9BYecTPufTDwX4HMkYq0cwV7
         v/06vIaUe6PC8aNFvaMtjiCo4ogkUsXa4j5259xCXeTDbOmGWxjl2Hh/GHmoc53EmOS2
         OA5LHuPaUlhuuRbHvZes35sb0w4KVsioDIF9tL5YcEcaP1borfm2k/O/HyqzPsvvzTdd
         v4hsFzOGmQlID246iznyboGot20TFmfzVGiOOeYOnwA7y3y1495yjlZGMPXapht5uesj
         pSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951861; x=1749556661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZPvUCvE2vPO2qd4IMAnQgX90yJMpfw/oC9yH8/Z6qM=;
        b=Z8SsqAL4/kYICDy6OYhh53W/xfIouXuIbPqKGnJc9fZ6NfswWybf+DnTTOBDUZZ+fL
         /FzJdd+6EeS3OTah1eFVYJ9vvpYae5JpFpUlkhfdEe5uyFZt7fhSfB1oAg+tzp2pg7FX
         9HmOzsX8YuwNkWUdRX3rap9do2jOYo2fPM3zOhQgPBxlwpCXgPOaTSL4HkbheK2epVTi
         +Vyo4J7qNt1FCGfK+cXjHOgoExUb12cp37SCnNIruykuaL3qWIYV0DPx9kZLMUoEyF6v
         l+hzqsjrCIyeXuLY3/qzdbI571YuS1wXx50Y6guaDVC0WE3/fDvM2oOTmJFvt+DzI4rR
         EDMA==
X-Gm-Message-State: AOJu0Yw66YBACJgFNqmS3alpDeW42At6jtMY/wlP36RHt1XnvbOfFec3
	MtSMfLk6fx3k7kPe3i4Rb2KLPNTan67MSkde5h6n7fz4fPik2by5dm5/kpFVz8zueWXKhRw9nkZ
	rAXSRWWI=
X-Gm-Gg: ASbGncvnODVeYxW4i8ryQ7/zasaA4INXkCGb9UiOKcnMgqqFTdtHcSYL8VSnCi6pB6R
	SppocU7GkqD70fTMtzkU3Mfp8D5CeAeR9FXQwpohhlVYYBkgbRn47Bgy/mRK/alxmDdgYISL9dL
	/zC+Mg+eVamxwZeUb911M9e+i6/HPgJYnYVPR0DCCnzeDMDIBsUqszOPxRJpcLZ8EiOrGl+UXK5
	YUB4gqopDKd5wskpACAertrAjCNap36R673xD5Itanorpgq3rSnfxTfED49kZAzsCej3/CDlj4s
	p5jY/MHiuEAqoRCPwlANM9tsw0E/JSX44OuqTvJ0GHK1BpyzFpVHaLmxALLBmJkpgfx3GsVphd1
	3OrTUXKpxbWO3+IY1OpvmSTGkBdgGJg==
X-Google-Smtp-Source: AGHT+IHLlMuP+TZs4HVRxvQpw+pqDPLlMsQ1ntB8DXhAeDV1zQadXo1krOr1aO2nMZq2ulkc+ahj4A==
X-Received: by 2002:a17:907:2d07:b0:ad5:4cde:fb97 with SMTP id a640c23a62f3a-adde606f7c3mr232767466b.29.1748951860722;
        Tue, 03 Jun 2025 04:57:40 -0700 (PDT)
Received: from ?IPV6:2001:a61:13d8:aa01:df7e:747c:99cb:b944? ([2001:a61:13d8:aa01:df7e:747c:99cb:b944])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045e2sm945247366b.90.2025.06.03.04.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 04:57:40 -0700 (PDT)
Message-ID: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
Date: Tue, 3 Jun 2025 13:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
To: hsyemail2@gmail.com, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Sheng-Yuan Huang <syhuang3@nuvoton.com>
References: <20250603032057.5174-1-syhuang3@nuvoton.com>
 <20250603032057.5174-2-syhuang3@nuvoton.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250603032057.5174-2-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03.06.25 05:20, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add support for the Nuvoton USB-to-serial adapter, which provides
> multiple serial ports over a single USB interface.
> 
> The device exposes one control endpoint, one bulk-in endpoint, and
> one bulk-out endpoint for data transfer. Port status is reported via
> an interrupt-in or bulk-in endpoint, depending on device configuration.

I am afraid there are a few issue that will not to be addressed
before this can be merged.

> This driver implements basic TTY operations.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
>   drivers/usb/serial/nct_usb_serial.c | 1523 +++++++++++++++++++++++++++
>   1 file changed, 1523 insertions(+)
>   create mode 100644 drivers/usb/serial/nct_usb_serial.c
> 
> diff --git a/drivers/usb/serial/nct_usb_serial.c b/drivers/usb/serial/nct_usb_serial.c
> new file mode 100644
> index 000000000000..424c604229b3
> --- /dev/null
> +++ b/drivers/usb/serial/nct_usb_serial.c

> +/* Index definition */
> +enum {
> +	NCT_VCOM_INDEX_0 = 0,
> +	NCT_VCOM_INDEX_1,
> +	NCT_VCOM_INDEX_2,
> +	NCT_VCOM_INDEX_3,
> +	NCT_VCOM_INDEX_4,
> +	NCT_VCOM_INDEX_5,
> +	NCT_VCOM_INDEX_GLOBAL = 0xF,
> +};

What use is this? A number is a number.

> +/* Command */
> +enum {
> +	NCT_VCOM_GET_NUM_PORTS = 0,
> +	NCT_VCOM_GET_PORTS_SUPPORT,
> +	NCT_VCOM_GET_BAUD,
> +	NCT_VCOM_SET_INIT,
> +	NCT_VCOM_SET_CONFIG,
> +	NCT_VCOM_SET_BAUD,
> +	NCT_VCOM_SET_HCR,
> +	NCT_VCOM_SET_OPEN_PORT,
> +	NCT_VCOM_SET_CLOSE_PORT,
> +	NCT_VCOM_SILENT,
> +	/* Use bulk-in status instead of interrupt-in status */
> +	NCT_VCON_SET_BULK_IN_STATUS,
> +};

No. This is an abuse of enumeration. These are just commands that
happen to use the number space consecutively. These need to be
defines.

> +union nct_vendor_cmd {
> +	struct pkg0 {
> +		u16 index:4;
> +		u16 cmd:8;
> +	} p;
> +	u16 val;
> +} __packed;

This definition is an endianness bug waiting to happen.
If this goes over the wire, it has a defined endianness,
which needs to be declared.

> +#define NCT_HDR_MAGIC		0xA5
> +#define NCT_HDR_MAGIC2		0x5A
> +#define NCT_HDR_MAGIC_STATUS	0x5B
> +
> +struct nct_packet_header {
> +	unsigned int magic:8;
> +	unsigned int magic2:8;
> +	unsigned int idx:4;
> +	unsigned int len:12;
> +} __packed;

Again endianness.

> +/* The definitions are for the feilds of nct_ctrl_msg */
> +#define NCT_VCOM_1_STOP_BIT		0
> +#define NCT_VCOM_2_STOP_BITS		1
> +#define NCT_VCOM_PARITY_NONE		0
> +#define NCT_VCOM_PARITY_ODD		1
> +#define NCT_VCOM_PARITY_EVEN		2
> +#define NCT_VCOM_DL5			0
> +#define NCT_VCOM_DL6			1
> +#define NCT_VCOM_DL7			2
> +#define NCT_VCOM_DL8			3
> +#define NCT_VCOM_DISABLE_FLOW_CTRL	0
> +#define NCT_VCOM_XOFF			1
> +#define NCT_VCOM_RTS_CTS		2
> +union nct_ctrl_msg {
> +	struct pkg1 {
> +		u16 stop_bit:1;
> +		u16 parity:2;
> +		u16 data_len:2;
> +		u16 flow:2;
> +		u16 spd:5;
> +		u16 reserved:4;
> +	} p;
> +	u16 val;
> +} __packed;

At the risk of repeating myself: endianness

> +
> +/* Read from USB control pipe */
> +static int nct_vendor_read(struct usb_interface *intf, union nct_vendor_cmd cmd,
> +			   unsigned char *buf, int size)
> +{
> +	struct device *dev = &intf->dev;
> +	struct usb_device *udev = interface_to_usbdev(intf);
> +	u8 *tmp_buf;
> +	int res;
> +
> +	tmp_buf = kmalloc(NCT_MAX_VENDOR_READ_SIZE, GFP_KERNEL);
> +	if (!tmp_buf)
> +		return -ENOMEM;
> +
> +	if (size > NCT_MAX_VENDOR_READ_SIZE)
> +		dev_err(dev, NCT_DRVNAME ": %s - failed to read [%04x]: over size %d\n",
> +			__func__, cmd.p.cmd, size);

And you just go on and overwrite kernel memory?
If you test for plausibility, do something with the result.


> +static int nct_vendor_write(struct usb_interface *intf, union nct_vendor_cmd cmd, u16 val)
> +{
> +	struct device *dev = &intf->dev;
> +	struct usb_device *udev = interface_to_usbdev(intf);
> +	int res;
> +	u8 *buf_val;

Why is this u8* ?
It should be le16*

> +	buf_val = kmalloc(2, GFP_KERNEL);
> +	if (!buf_val)
> +		return -ENOMEM;
> +
> +	/* Copy data to the buffer for sending */
> +	buf_val[0] = val & 0xff;
> +	buf_val[1] = (val >> 8) & 0xff;

We have macros for that.

> +static u16 nct_set_baud(struct usb_interface *intf, u16 index, unsigned int cflag)
> +{
> +	union nct_ctrl_msg msg;
> +	union nct_vendor_cmd cmd;
> +	u16 i;
> +
> +	msg.val = 0;
> +	cmd.p.cmd = NCT_VCOM_SET_BAUD;
> +	msg.p.spd = NCT_DEFAULT_BAUD;
> +	cmd.p.index = index;
> +	dev_dbg(&intf->dev, NCT_DRVNAME ": %s tty baud: 0x%X\n", __func__,
> +		(cflag & CBAUD));
> +	for (i = 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
> +		if ((cflag & CBAUD) == NCT_BAUD_SUP[i]) {
> +			msg.p.spd = i;
> +			dev_dbg(&intf->dev,
> +				NCT_DRVNAME ": %s index %d set baud: NCT_BAUD_SUP[%d]=%d\n",
> +				__func__, cmd.p.index, msg.p.spd, NCT_BAUD_SUP[i]);
> +			if (nct_vendor_write(intf, cmd, msg.val))
> +				dev_err(&intf->dev,
> +					NCT_DRVNAME ": %s - Set index: %d speed error\n",
> +					__func__, cmd.p.index);
> +
> +			break;
> +		}

If nothing matches, you do nothing?
> +	}
> +
> +	return msg.p.spd;

So errors are ignored?


> +static int nct_serial_tiocmset(struct tty_struct *tty, unsigned int set,
> +			       unsigned int clear)
> +{
> +	return nct_tiocmset_helper(tty, set, clear);
> +}

Why? Does this function do anything useful?

> +static void nct_rx_throttle(struct tty_struct *tty)
> +{
> +	unsigned int set;
> +	unsigned int clear = 0;

Why?

> +
> +	/* If we are implementing RTS/CTS, control that line */
> +	if (C_CRTSCTS(tty)) {
> +		set = 0;
> +		clear = TIOCM_RTS;
> +		nct_tiocmset_helper(tty, set, clear);
> +	}
> +}
> +
> +static void nct_rx_unthrottle(struct tty_struct *tty)
> +{
> +	unsigned int set;
> +	unsigned int clear = 0;

Why?

> +	/* If we are implementing RTS/CTS, control that line */
> +	if (C_CRTSCTS(tty)) {
> +		set = 0;
> +		set |= TIOCM_RTS;
> +		nct_tiocmset_helper(tty, set, clear);
> +	}
> +}
> +
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
> +	if (tport->write_urb_in_use) {
> +		spin_unlock_irqrestore(&tport->port_lock, flags);
> +		return 0;
> +	}
> +
> +	/* Fill header */
> +	hdr.magic = NCT_HDR_MAGIC;
> +	hdr.magic2 = NCT_HDR_MAGIC2;
> +	hdr.idx = tport->hw_idx; /* The 'hw_idx' is based on 1 */

Endianness.

> +
> +	/* Copy data */
> +	memcpy(port->write_urb->transfer_buffer + sizeof(hdr),
> +	       (const void *)buf, wr_len);
> +
> +	hdr.len = wr_len; /* File filed 'len' of header */

Endiannes

> +static int nct_startup_device(struct usb_serial *serial)
> +{
> +	int ret = 0;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_serial_port *port;
> +	unsigned long flags;
> +
> +	/* Be sure this happens exactly once */
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +
> +	if (serial_priv->device_init) {
> +		spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +		return 0;
> +	}
> +	serial_priv->device_init = true;
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +
> +	/* Start reading from bulk in endpoint */
> +	port = serial->port[0];
> +	if (!port->read_urb)
> +		dev_dbg(&port->dev, NCT_DRVNAME ": %s: port->read_urb is null, index=%d\n",
> +			__func__, 0);
> +
> +	ret = usb_submit_urb(port->read_urb, GFP_KERNEL);
> +	if (ret)
> +		dev_err(&port->dev,
> +			NCT_DRVNAME ": %s: usb_submit_urb failed, ret=%d, port=%d\n",
> +			__func__, ret, 0);

Error handling?
> +
> +	/* For getting status from interrupt-in */
> +	if (!serial_priv->status_trans_mode) {
> +		/* Start reading from interrupt pipe */
> +		port = serial->port[0];
> +		ret = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
> +		if (ret)
> +			dev_err(&port->dev,
> +				NCT_DRVNAME ": %s: usb_submit_urb(intr) failed, ret=%d, port=%d\n",
> +				__func__, ret, 0);
> +	}
> +	return ret;
> +}
> +
> +static void nct_serial_port_end(struct usb_serial_port *port)
> +{
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	union nct_ctrl_msg msg;
> +	union nct_vendor_cmd cmd;
> +
> +	/* Send 'Close Port' to the device */
> +	cmd.p.index = (u16)tport->hw_idx;
> +	cmd.p.cmd = NCT_VCOM_SET_CLOSE_PORT;

Endianness


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
> +			/* Decode the header */
> +
> +			if (serial_priv->status_trans_mode) {
> +				/*
> +				 * Status data is also transmitted via bulk-in
> +				 * pipe.
> +				 */
> +				if (hdr->magic == NCT_HDR_MAGIC &&
> +				    hdr->magic2 == NCT_HDR_MAGIC_STATUS &&
> +				    hdr->len == 24 && actual_len >= 28) {

Endianness

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
> +					actual_len -=
> +						sizeof(struct nct_packet_header);
> +
> +					nps = (struct nct_port_status *)data;
> +
> +					for (j = 0; j < actual_len - 4; j++) {
> +						nct_update_status(serial,
> +								  (unsigned char *)nps);
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
> +			    hdr->idx <= NCT_MAX_NUM_COM_DEVICES &&
> +			    hdr->len <= 512)
> +				break;

Endianness

	Regards
		Oliver

