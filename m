Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4048C78C91;
	Mon, 12 May 2025 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747044225; cv=none; b=mBlDspAlzrsfrXKTfecdWbIPu4pDh9AP068LPh3ebekk+smc2QW40dj0QPxsHP5Q6nXsya4xrYr5vEgju0Bebj32QiQA9rNeaKPBeROYvH9QBsAUl8TozGtDK6/Oc+wm3xcvXv1y3ihqw6dxMSZsaR+x+EISK31wNUvrx4h3428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747044225; c=relaxed/simple;
	bh=+XlAbOjqVnU6gnNWWhp5IMDfURisFp7zfqokhv8N5Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAjbFpMU2mRySSL5E/zRV6JHabO8GP/kja6SWp4l3Xrku8MzqPEhh29AkciUC68CrNoIl2ooixJeF96Q+A/lbibX4n6PqApcCOwHDVKN7bJuPdS8FwUz2s6U2/sd5SbJ1Gzv/KfBqoEDBl8/jyv3jt2zJ5YSmTzrvm3mSl5LhkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrqH4qv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrqH4qv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1B3C4CEE9;
	Mon, 12 May 2025 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747044224;
	bh=+XlAbOjqVnU6gnNWWhp5IMDfURisFp7zfqokhv8N5Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrqH4qv+5J5wD/LW3Aa51xOu9SnY/N5/4TFokl84x/3PrGMiXLiA93+1+jzzHV7Xk
	 Kl5n6nj4j9dUWwdi+XOs+h4omMncQ3G+AEX4pfMO5UcP3zwcphvMPTtCKVWtvbLtyE
	 Uh1FJIwQY/EB8KWEDblFvXoHYYln9ttQlIUJZ4g1r3P4MLRd5bynG/x7JDwz5Z98b7
	 4Y0vZf2m8zHuSX40fpdflpppqBc5QkUbu0oYZX0g/wFOQ3A3+KZou89OLZegamwKWz
	 DDsxPAcsVqhd43sHBVCaCy4ImOVeAZUtTTpaApwQbkXnm/1ffsY2NqoCvYv7zy6wkx
	 7ZDOYM0DfoqOg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uEQ0b-000000000wB-1cCK;
	Mon, 12 May 2025 12:03:41 +0200
Date: Mon, 12 May 2025 12:03:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: gregkh@linuxfoundation.org, martin.blumenstingl@googlemail.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
Message-ID: <aCHHfY2FkVW2j0ML@hovoldconsulting.com>
References: <20250204135842.3703751-1-clabbe@baylibre.com>
 <20250204135842.3703751-2-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204135842.3703751-2-clabbe@baylibre.com>

On Tue, Feb 04, 2025 at 01:58:41PM +0000, Corentin Labbe wrote:
> The CH348 is an USB octo port serial adapter.
> The device multiplexes all 8 ports in the same pair of Bulk endpoints.
> Since there is no public datasheet, unfortunately it remains some magic values

Please wrap the commit message at 72 columns or so.

> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USB serial driver for USB to Octal UARTs chip ch348.
> + *
> + * Copyright (C) 2023 Corentin Labbe <clabbe@baylibre.com>
> + * With the help of Neil Armstrong <neil.armstrong@linaro.org>
> + * Copyright (C) 2024 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> + *
> + * Based on the ch9344 driver:
> + *   https://github.com/WCHSoftGroup/ch9344ser_linux/
> + *   Copyright (C) 2024 Nanjing Qinheng Microelectronics Co., Ltd.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/kfifo.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>

I don't think you use this one currently.

> +#include <linux/serial.h>
> +#include <linux/serial_reg.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <linux/tty_driver.h>
> +#include <linux/tty_flip.h>
> +#include <linux/usb.h>
> +#include <linux/usb/serial.h>
> +#include <linux/workqueue.h>
> +
> +#define CH348_CMD_TIMEOUT   2000
> +
> +#define CH348_CTO_D	0x01
> +#define CH348_CTO_R	0x02
> +
> +#define CH348_CTI_C	0x10
> +#define CH348_CTI_DSR	0x20
> +#define CH348_CTI_R	0x40
> +#define CH348_CTI_DCD	0x80
> +
> +#define CMD_W_R		0xC0

Lower case for consistency.

> +#define CMD_W_BR	0x80
> +
> +#define CMD_WB_E	0x90
> +#define CMD_RB_E	0xC0

Lower case for consistency.

> +
> +#define M_NOR		0x00
> +#define M_HF		0x03
> +
> +#define R_MOD		0x97
> +#define R_IO_D		0x98
> +#define R_IO_O		0x99
> +#define R_IO_I		0x9b
> +#define R_TM_O		0x9c
> +#define R_INIT		0xa1
> +
> +#define CMD_VER		0x96
> +
> +/* 0x10 is normally UART_MCR_LOOP but for CH348 it's UART_MCR_RTS */
> +#define UART_MCR_RTS_CH348	0x10

It's good that you looked at the standard defines to make some sense of
the magic constants you had earlier, but don't take it too far. If there
are too many exceptions and inconsistencies, it may be better to have
driver specific defines (more below).

> +/*
> + * The CH348 multiplexes rx & tx into a pair of Bulk USB endpoints for the 8
> + * serial ports, and another pair of Bulk USB endpoints to set port settings
> + * and receive port status events.
> + *
> + * The USB serial cores ties every Bulk endpoints pairs to each ports, In our
> + * case it will set port 0 with the rx/tx endpoints and port 1 with the
> + * setup/status endpoints.
> + *
> + * For bulk writes we skip all of USB serial core's helpers and implement it on
> + * our own since for serial TX we need to not only wait for the URB to complete
> + * but also for the UART_IIR_THRI signal.
> + *
> + * For bulk reads we use USB serial core's helpers, even for the status/int
> + * handling as it simplifies our code.
> + */
> +#define CH348_MAXPORT				8
> +#define CH348_PORTNUM_SERIAL_RX_TX		0
> +#define CH348_PORTNUM_STATUS_INT_CONFIG		1
> +
> +#define CH348_RX_PORT_MAX_LENGTH	30
> +
> +struct ch348_rxbuf {
> +	u8 port;
> +	u8 length;
> +	u8 data[CH348_RX_PORT_MAX_LENGTH];
> +} __packed;
> +
> +struct ch348_txbuf {
> +	u8 port;
> +	__le16 length;
> +	u8 data[];
> +} __packed;
> +
> +#define CH348_TX_HDRSIZE offsetof(struct ch348_txbuf, data)
> +
> +struct ch348_initbuf {
> +	u8 cmd;
> +	u8 reg;
> +	u8 port;
> +	__be32 baudrate;
> +	u8 format;
> +	u8 paritytype;
> +	u8 databits;
> +	u8 rate;
> +	u8 unknown;
> +} __packed;
> +
> +#define CH348_INITBUF_FORMAT_STOPBITS		0x2
> +#define CH348_INITBUF_FORMAT_NO_STOPBITS	0x0
> +
> +/*

For kernel doc, you want /** here.

> + * struct ch348_port - per-port information
> + * @uartmode:		UART port current mode
> + * @baudrate:		A cached copy of current baudrate for the RX logic
> + */
> +struct ch348_port {
> +	u8 uartmode;
> +	speed_t baudrate;
> +};
> +
> +/*

And here.

> + * struct ch348 - main container for all this driver information
> + * @udev:		pointer to the CH348 USB device
> + * @ports:		List of per-port information
> + * @serial:		pointer to the serial structure
> + * @write_work:		worker for processing the write queues
> + * @txbuf_completion:	indicates that the TX buffer has been fully written out
> + * @tx_ep:		endpoint number for serial data transmit/write operation
> + * @config_ep:		endpoint number for configure operations
> + * @small_package:	indicates package size: small (CH348Q) or large (CH348L)
> + */
> +struct ch348 {
> +	struct usb_device *udev;
> +	struct ch348_port ports[CH348_MAXPORT];
> +	struct usb_serial *serial;
> +
> +	struct work_struct write_work;
> +	struct completion txbuf_completion;
> +
> +	int tx_ep;
> +	int config_ep;
> +
> +	bool small_package;

I noticed that you don't use this one currently, but perhaps use a type
enum and call it type instead to make it more obvious what it is (can
be) used for.

> +};
> +
> +struct ch348_serial_config {
> +	u8 action;
> +	u8 reg;
> +	u8 control;
> +} __packed;
> +
> +struct ch348_status_entry {
> +	u8 portnum;
> +	u8 reg_iir;
> +	union {
> +		u8 lsr_signal;
> +		u8 modem_signal;
> +		u8 init_data[10];
> +	};
> +} __packed;
> +
> +#define CH348_STATUS_ENTRY_PORTNUM_MASK		0xf
> +
> +static void ch348_process_status_urb(struct usb_serial *serial, struct urb *urb)
> +{
> +	struct ch348 *ch348 = usb_get_serial_data(serial);
> +	struct ch348_status_entry *status_entry;
> +	struct usb_serial_port *port;
> +	unsigned int i, status_len;
> +	u8 portnum;
> +
> +	if (urb->actual_length < 3) {
> +		dev_warn_ratelimited(&ch348->udev->dev,
> +				     "Received too short status buffer with %u bytes\n",
> +				     urb->actual_length);

You should probably just demote to dev_dbg() as you do in the data path,
not much a user can do with this warning.

> +		return;
> +	}
> +
> +	for (i = 0; i < urb->actual_length;) {
> +		status_entry = urb->transfer_buffer + i;
> +		portnum = status_entry->portnum & CH348_STATUS_ENTRY_PORTNUM_MASK;
> +
> +		if (portnum >= CH348_MAXPORT) {
> +			dev_warn_ratelimited(&ch348->udev->dev,
> +					     "Invalid port %d in status entry\n",
> +					     portnum);

Same here.

> +			break;
> +		}
> +
> +		port = serial->port[portnum];
> +		status_len = 3;
> +
> +		if (!status_entry->reg_iir) {
> +			dev_dbg(&port->dev, "Ignoring status with zero reg_iir\n");
> +		} else if (status_entry->reg_iir == R_INIT) {
> +			status_len = 12;
> +		} else if ((status_entry->reg_iir & UART_IIR_ID) == UART_IIR_RLSI) {
> +			if (status_entry->lsr_signal & UART_LSR_OE)
> +				port->icount.overrun++;
> +			if (status_entry->lsr_signal & UART_LSR_PE)
> +				port->icount.parity++;
> +			if (status_entry->lsr_signal & UART_LSR_FE)
> +				port->icount.frame++;
> +			if (status_entry->lsr_signal & UART_LSR_BI)
> +				port->icount.brk++;
> +		} else if ((status_entry->reg_iir & UART_IIR_ID) == UART_IIR_THRI) {
> +			complete_all(&ch348->txbuf_completion);
> +		} else {
> +			dev_warn_ratelimited(&port->dev,
> +					     "Unsupported status with reg_iir 0x%02x\n",
> +					     status_entry->reg_iir);

And here.

> +		}
> +
> +		i += status_len;
> +	}
> +}
> +
> +static void ch348_process_serial_rx_urb(struct usb_serial *serial,
> +					struct urb *urb)
> +{
> +	unsigned int portnum, serial_rx_len, i;
> +	struct usb_serial_port *port;
> +	struct ch348_rxbuf *rxb;
> +
> +	if (urb->actual_length < 2) {
> +		dev_dbg(&serial->dev->dev, "Empty rx buffer\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < urb->actual_length; i += sizeof(*rxb)) {
> +		rxb = urb->transfer_buffer + i;
> +		portnum = rxb->port;
> +		if (portnum >= CH348_MAXPORT) {
> +			dev_dbg(&serial->dev->dev, "Invalid port %d\n", portnum);
> +			break;
> +		}
> +
> +		port = serial->port[portnum];
> +
> +		serial_rx_len = rxb->length;
> +		if (serial_rx_len > CH348_RX_PORT_MAX_LENGTH) {
> +			dev_dbg(&port->dev, "Invalid length %d for port %d\n",
> +				serial_rx_len, portnum);
> +			break;
> +		}
> +
> +		tty_insert_flip_string(&port->port, rxb->data, serial_rx_len);
> +		tty_flip_buffer_push(&port->port);
> +
> +		port->icount.rx += serial_rx_len;
> +	}
> +}
> +
> +static void ch348_process_read_urb(struct urb *urb)
> +{
> +	struct usb_serial_port *port = urb->context;
> +
> +	if (port->port_number == CH348_PORTNUM_SERIAL_RX_TX)
> +		ch348_process_serial_rx_urb(port->serial, urb);
> +	else if (port->port_number == CH348_PORTNUM_STATUS_INT_CONFIG)
> +		ch348_process_status_urb(port->serial, urb);
> +	else
> +		dev_warn_ratelimited(&port->serial->dev->dev,
> +				     "Ignoring read URB callback for unknown port/endpoint %u\n",
> +				     port->port_number);

This can't happen since you only submit read urbs for ports 0 and 1,
just drop.

> +}
> +
> +static int ch348_port_config(struct usb_serial_port *port, u8 action, u8 reg,
> +			     u8 control)
> +{
> +	struct ch348 *ch348 = usb_get_serial_data(port->serial);
> +	struct ch348_serial_config *buffer;
> +	int ret;
> +
> +	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	if (port->port_number < 4)
> +		reg += 0x10 * port->port_number;
> +	else
> +		reg += 0x10 * (port->port_number - 4) + 0x08;
> +
> +	buffer->action = action;
> +	buffer->reg = reg;
> +	buffer->control = control;
> +
> +	ret = usb_bulk_msg(ch348->udev, ch348->config_ep, buffer,
> +			   sizeof(*buffer), NULL, CH348_CMD_TIMEOUT);
> +	if (ret) {
> +		dev_err(&ch348->udev->dev, "Failed to write port config: %d\n", ret);
> +		goto out;

No need for a goto here.

> +	}
> +
> +out:
> +	kfree(buffer);
> +
> +	return ret;
> +}
> +
> +static int ch348_write(struct tty_struct *tty, struct usb_serial_port *port,
> +		       const unsigned char *buf, int count)
> +{
> +	struct ch348 *ch348 = usb_get_serial_data(port->serial);
> +
> +	if (!count)
> +		return 0;
> +
> +	count = kfifo_in_locked(&port->write_fifo, buf, count, &port->lock);
> +
> +	schedule_work(&ch348->write_work);
> +
> +	return count;
> +}
> +
> +static int ch348_set_uartmode(struct usb_serial_port *port, u8 mode)
> +{
> +	struct ch348 *ch348 = usb_get_serial_data(port->serial);
> +	unsigned int portnum = port->port_number;
> +	int ret;
> +
> +	if (ch348->ports[portnum].uartmode == M_NOR && mode == M_HF) {

AFAICS, the M_NOR and M_HF are only used to track whether hardware flow
control is enabled or not.

I guess HF stands for hardware flow, but what does M_NOR mean? No RTS?

Unless these names reflect some hardware flags, I think you should
switch to more descriptive names. And I guess you just need a boolean
flag.

> +		ret = ch348_port_config(port, CMD_W_BR, UART_MCR,
> +					UART_MCR_DTR | UART_MCR_RTS_CH348 |
> +					UART_MCR_TCRTLR);

This does not look a normal MCR register so shouldn't be using the
standard defines for it.

Perhaps you can make some sense of this by comparing with the vendor
dtr_rts() implementation too.

> +		if (ret)
> +			return ret;
> +		ch348->ports[portnum].uartmode = M_HF;
> +	}
> +
> +	if (ch348->ports[portnum].uartmode == M_HF && mode == M_NOR) {
> +		ret = ch348_port_config(port, CMD_W_BR, UART_MCR,
> +					UART_MCR_RTS_CH348 | UART_MCR_TCRTLR);
> +		if (ret)
> +			return ret;
> +		ch348->ports[portnum].uartmode = M_NOR;
> +	}
> +	return 0;
> +}
> +
> +static void ch348_set_termios(struct tty_struct *tty, struct usb_serial_port *port,
> +			      const struct ktermios *termios_old)
> +{
> +	struct ch348 *ch348 = usb_get_serial_data(port->serial);
> +	struct ktermios *termios = &tty->termios;
> +	int ret, portnum = port->port_number;
> +	struct ch348_initbuf *buffer;
> +	speed_t	baudrate;
> +
> +	if (termios_old && !tty_termios_hw_change(&tty->termios, termios_old))
> +		return;
> +
> +	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer)
> +		goto out;
> +
> +	/*
> +	 * The datasheet states that only baud rates in range of 1200..6000000
> +	 * are supported. Tests with an oscilloscope confirm that even when
> +	 * configuring a baud rate slower than 1200 the output stays at around
> +	 * 1200 baud.
> +	 */
> +	baudrate = clamp(tty_get_baud_rate(tty), 1200, 6000000);
> +	tty_termios_encode_baud_rate(&tty->termios, baudrate, baudrate);
> +	ch348->ports[port->port_number].baudrate = baudrate;
> +
> +	if (termios->c_cflag & PARENB) {
> +		if  (termios->c_cflag & CMSPAR) {
> +			if (termios->c_cflag & PARODD)
> +				buffer->paritytype = 3;
> +			else
> +				buffer->paritytype = 4;
> +		} else if (termios->c_cflag & PARODD) {

Just use "else" here and add an inner conditional for PARODD for
symmetry and readability.

> +			buffer->paritytype = 1;
> +		} else {
> +			buffer->paritytype = 2;
> +		}
> +	} else {
> +		buffer->paritytype = 0;
> +	}

> +	buffer->cmd = CMD_WB_E | portnum;
> +	buffer->reg = R_INIT;
> +	buffer->port = portnum;
> +	buffer->baudrate = cpu_to_be32(baudrate);
> +
> +	if (termios->c_cflag & CSTOPB)
> +		buffer->format = CH348_INITBUF_FORMAT_STOPBITS;
> +	else
> +		buffer->format = CH348_INITBUF_FORMAT_NO_STOPBITS;

CSTOPB controls whether one or two stop bits is used so these defines
looks like they should be renamed.

> +
> +	buffer->rate = max_t(speed_t, 5, (10000 * 15 / baudrate) + 1);
> +
> +	ret = usb_bulk_msg(ch348->udev, ch348->config_ep, buffer,
> +			   sizeof(*buffer), NULL, CH348_CMD_TIMEOUT);
> +	if (ret < 0) {
> +		dev_err(&ch348->udev->dev, "Failed to change line settings: err=%d\n",

I've already asked you to drop the redundant "err=" from all error
messages and use a consistent

	"failed to <x>: %d\n"

format *throughout* the driver.

> +			ret);
> +		goto out_free;
> +	}
> +
> +	ret = ch348_port_config(port, CMD_W_R, UART_IER, UART_IER_RDI |
> +				UART_IER_THRI | UART_IER_RLSI | UART_IER_MSI);
> +	if (ret < 0)
> +		goto out_free;
> +
> +	if (C_CRTSCTS(tty))
> +		ret = ch348_set_uartmode(port, M_HF);
> +	else
> +		ret = ch348_set_uartmode(port, M_NOR);
> +
> +out_free:
> +	kfree(buffer);
> +out:
> +	if (ret && termios_old)
> +		tty->termios = *termios_old;

You shouldn't restore all of termios in case it was just updating the
uart mode (CRTSCTS) that failed.

> +}
> +
> +static int ch348_open(struct tty_struct *tty, struct usb_serial_port *port)
> +{
> +	int ret;
> +
> +	clear_bit(USB_SERIAL_THROTTLED, &port->flags);

You're not using the generic throttle implementation so no need to clear
this flag.

> +
> +	if (tty)
> +		ch348_set_termios(tty, port, NULL);
> +
> +	ret = ch348_port_config(port, CMD_W_R, UART_FCR,
> +				UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR |
> +				UART_FCR_CLEAR_XMIT | UART_FCR_T_TRIG_00 |
> +				UART_FCR_R_TRIG_10);
> +	if (ret) {
> +		dev_err(&port->serial->dev->dev,
> +			"Failed to configure UART_FCR, err=%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ch348_port_config(port, CMD_W_BR, UART_MCR, UART_MCR_OUT2);

Probably not MCR_OUT2 here either.

> +	if (ret) {
> +		dev_err(&port->serial->dev->dev,
> +			"Failed to configure UART_MCR, err=%d\n", ret);
> +		return ret;
> +	}

The read urbs should be submitted at first open and stopped at last
close to avoid wasting resources when no one is using the device.

I know we have a few drivers that do not do this currently, but it
shouldn't be that hard to get this right from the start.

> +
> +	return 0;
> +}
> +
> +static void ch348_close(struct usb_serial_port *port)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	kfifo_reset_out(&port->write_fifo);
> +	spin_unlock_irqrestore(&port->lock, flags);
> +}
> +
> +static void ch348_write_work(struct work_struct *work)
> +{
> +	struct ch348 *ch348 = container_of(work, struct ch348, write_work);
> +	struct usb_serial_port *port, *hw_tx_port;
> +	unsigned int i, max_bytes;
> +	struct ch348_txbuf *rxt;
> +	unsigned long flags;
> +	int ret, count;
> +
> +	reinit_completion(&ch348->txbuf_completion);
> +
> +	hw_tx_port = ch348->serial->port[CH348_PORTNUM_SERIAL_RX_TX];
> +	rxt = hw_tx_port->write_urbs[0]->transfer_buffer;
> +
> +	for (i = 0; i < CH348_MAXPORT; i++) {
> +		port = ch348->serial->port[i];
> +
> +		if (ch348->ports[i].baudrate < 9600)

Use brackets for readability due to the comments adding multiple lines
to each branch.

> +			/*
> +			 * Writing larger buffers can take longer than the
> +			 * hardware allows before discarding the write buffer.
> +			 * Limit the transfer size in such cases.
> +			 * These values have been found by empirical testing.
> +			 */
> +			max_bytes = 128;

This is a potential buffer overflow if a (malicious) device has
endpoints smaller than this (use min()).

> +		else
> +			/*
> +			 * Only ingest as many bytes as we can transfer with
> +			 * one URB at a time keeping the TX header in mind.
> +			 */
> +			max_bytes = hw_tx_port->bulk_out_size - CH348_TX_HDRSIZE;
> +
> +		count = kfifo_out_locked(&port->write_fifo, rxt->data,
> +					 max_bytes, &port->lock);
> +		if (count)
> +			break;
> +	}

With this implementation writing data continuously to one port will
starve the others. 

The vendor implementation appears to write to more than one port in
parallel and track THRE per port which would avoid the starvation issue
and should also be much more efficient.

Just track THRE per port and only submit the write urb when it the
transmitter is empty or when it becomes empty.

> +
> +	if (!count)
> +		return;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	port->tx_bytes += count;
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	rxt->port = port->port_number;
> +	rxt->length = cpu_to_le16(count);
> +
> +	usb_serial_debug_data(&port->dev, __func__, count + CH348_TX_HDRSIZE,
> +			      (const unsigned char *)rxt);
> +
> +	ret = usb_bulk_msg(ch348->udev, ch348->tx_ep, rxt,
> +			   count + CH348_TX_HDRSIZE, NULL, CH348_CMD_TIMEOUT);
> +	if (ret) {
> +		dev_err_console(port,
> +				"Failed to bulk write TX buffer, err=%d\n",
> +				ret);
> +		goto write_done;
> +	}
> +
> +	if (!wait_for_completion_timeout(&ch348->txbuf_completion,
> +					 msecs_to_jiffies(CH348_CMD_TIMEOUT)))
> +		dev_err_console(port,
> +				"Failed to wait for TX buffer to be fully written out\n");

This would also avoid blocking for extended periods of time on the
system work queue.

> +
> +write_done:
> +	spin_lock_irqsave(&port->lock, flags);
> +	port->tx_bytes -= count;
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	port->icount.tx += count;
> +
> +	schedule_work(&ch348->write_work);
> +	usb_serial_port_softint(port);
> +}

> +static const struct usb_device_id ch348_ids[] = {
> +	{ USB_DEVICE(0x1a86, 0x55d9), },

No need for comma after USB_DEVICE().

> +	{ /* sentinel */ }
> +};

> +static struct usb_serial_driver ch348_device = {
> +	.driver = {
> +		.owner = THIS_MODULE,
> +		.name = "ch348",
> +	},
> +	.id_table =		ch348_ids,
> +	.num_ports =		CH348_MAXPORT,
> +	.num_bulk_in =		2,
> +	.num_bulk_out =		2,
> +	.open =			ch348_open,
> +	.close =		ch348_close,
> +	.set_termios =		ch348_set_termios,
> +	.process_read_urb =	ch348_process_read_urb,
> +	.write =		ch348_write,
> +	.calc_num_ports =	ch348_calc_num_ports,
> +	.attach =		ch348_attach,
> +	.release =		ch348_release,
> +	.suspend =		ch348_suspend,
> +	.resume =		ch348_resume,
> +};

You should implement dtr_rts() as well.

Johan
