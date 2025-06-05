Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09B5320F;
	Thu,  5 Jun 2025 01:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086139; cv=none; b=U1zNQUrEc0an3REi+5UShPFKca/dAtmwptCsQXO/qNnW9MKOiLSj3WDqo2r2DpagYxPImPiDK2LhV0rL0vtJwEmpibcK/mfJMHhpOScByqJcG1UCBzntxPpgZACjQd+fY8FQLRYziyo0ei9622FHu4OkEASZkK9+yuucPlMHdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086139; c=relaxed/simple;
	bh=7HW7x9nbWp4Qj2yNnx1v2h+XGemgVAdodEL5eVmunzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doBTZTh2GJWkb4KUmHIFnYU7HSENV7S+wJ9n/wDzk+2fqvT1XygpNgPetbsBrcdeBJMpvGW/Q4sEWn3hIvA2+eL6zvheVhCaZ2pNunMnOWaXGbBScj2dydXtAHo/1oLsWDhlfbzk6G3woqdyMR6ya5sfEIewbXJaUu6rPIo0rGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxonrskf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxonrskf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so427763a12.0;
        Wed, 04 Jun 2025 18:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749086136; x=1749690936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxzhpDYdLonLZrJHBHeQGT9e3gBAhmynhF48vRJrIp0=;
        b=NxonrskfueqPzF/yV2auhMapn1F0DWneNwen0fMP+5RjFYunIgG6nYDzBzxO9k6XZe
         +uvr+ZlSQFZkQRjaAfmzKBaKwAtPb32Hl/lTv2E/EavwqD1y8UGaNJziz5O/ss0F5lUF
         Mhjm1vafQbHjy/lMK1gE1RNCQOBmmr0h8EgNZg3WLz6lfI4PaIbeDZufNiO3LDsYmvMB
         eOtuNIu1eb8F0BWAGjf4rdVhVAGoVxmw1FFJ0ZiRGluItX2L/+SCdjzR4rOqrk4uzCqG
         fq/Dnng07TQYhIcOu+bCUNGSibMvn6cH86vr6LT4wMO4XM+Xf26sV1PkYzA8RbJ9KoFb
         gx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086136; x=1749690936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxzhpDYdLonLZrJHBHeQGT9e3gBAhmynhF48vRJrIp0=;
        b=cupu8e35yZIQvaoY0qEE7pC5IBy/s6527T+KB6fy6k6LOpviGBYtijSzqsxCvG45AV
         On3Gq3F3vrRZF79TaiFQesLPPQmeq06CRI235ZN1rpqUjQ4QoNF0A6VgQoYNDa196Wco
         x0cSxRbMB66UpuRk8DYcKZbAIWL+MnApAmsPd4/IhylQYCChipwJ7YsEcHxrRw8pnaIt
         JVy3osXwEBaBe+pfCD3WsOQJUMdODLqAU7NPwlpCC84/RYNBA1vsrNV4dk2Vjc/Flw0Q
         3nSc0r0+PqnVgeD0nV5d6aGsfqYd6RDDNhaUbykDAle8TYffn/fXcHhENRZUDEF4bkVf
         97FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVLXGrkm+b3+/GS7SOJZj9lAGjCj/jX+eJ1O41Zs9mWHFvVfs+Z+TxUjHc7rvtR4SMC6jwo6LNHYfz@vger.kernel.org, AJvYcCX9xkouPBkZ9wTOppWwBkCVJfBO8U2l6RWeFF8H+jcy4D0vhFWcEgywa03CzutWYvV2pRF+rl4YsEfhKLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwipQkdoiQXBlDHHkBlDFhxnQimVrf2kZ1G5gLQDGq3aMLOz2T
	xS+QGqllmMfuI8pKp+bEB/pF8kxdv1DFXlt/avtrJ3+IWZnsEhUA/DIyD2iFwROUy8ZSZme70/A
	9uPQpbM3aW+LkQml6oZBn5yTT+/bt5oM=
X-Gm-Gg: ASbGnct1iYtNKme5lYky460QTAl5RWCDdfQeOK3myJgyDtUfbZGn5WFUnke6VheMQVW
	xk1+vcWld5OcU/b9LJxyPqf/NuEEbNFgt2tI6Ma/o/xgLii7gSJZ3wzS2HHJYGcIN0Q2iyuMCpQ
	WgD7Ck3aAu0/zlPpfbVe7/8+IfSEwBm6t4xgMu3ujMgVR+Gt8ioQPeDnsHf8Gj4pps3HSlkH0Rz
	Syh
X-Google-Smtp-Source: AGHT+IGK4dCQjzgObFv1N9hvDW+ltpyh1QBv5ebBJlLbvX9/MegcFFdkItiwSB83rawVGaHKkb7BjUEwlcAlWvw9pIQ=
X-Received: by 2002:a17:907:7f94:b0:adb:2a7d:1e78 with SMTP id
 a640c23a62f3a-addf8cca163mr474106066b.1.1749086135846; Wed, 04 Jun 2025
 18:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603032057.5174-1-syhuang3@nuvoton.com> <20250603032057.5174-2-syhuang3@nuvoton.com>
 <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
In-Reply-To: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
From: =?UTF-8?B?6YC45puJ5aG1?= <hsyemail2@gmail.com>
Date: Thu, 5 Jun 2025 09:15:24 +0800
X-Gm-Features: AX0GCFtpm1wTVvJO7sVs8FLKaCKz79NJb441LgwKHHm0aiaO-tbf7_xpB8LWoMk
Message-ID: <CACW=pY7P_i7gUjg5vOS9_kh2Z4jivP_nO5o8jH1+7UzU6MvuzQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
To: Oliver Neukum <oneukum@suse.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver Neukum,
Appreciate the excellent suggestions! I'm in the process of revising
the code based on your input. It'll take me a little while to
thoroughly address everything, but I'll post an update here when I
have something new to share. Thank you very much.


Oliver Neukum <oneukum@suse.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=883=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 03.06.25 05:20, hsyemail2@gmail.com wrote:
> > From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> >
> > Add support for the Nuvoton USB-to-serial adapter, which provides
> > multiple serial ports over a single USB interface.
> >
> > The device exposes one control endpoint, one bulk-in endpoint, and
> > one bulk-out endpoint for data transfer. Port status is reported via
> > an interrupt-in or bulk-in endpoint, depending on device configuration.
>
> I am afraid there are a few issue that will not to be addressed
> before this can be merged.
>
> > This driver implements basic TTY operations.
> >
> > Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> > ---
> >   drivers/usb/serial/nct_usb_serial.c | 1523 ++++++++++++++++++++++++++=
+
> >   1 file changed, 1523 insertions(+)
> >   create mode 100644 drivers/usb/serial/nct_usb_serial.c
> >
> > diff --git a/drivers/usb/serial/nct_usb_serial.c b/drivers/usb/serial/n=
ct_usb_serial.c
> > new file mode 100644
> > index 000000000000..424c604229b3
> > --- /dev/null
> > +++ b/drivers/usb/serial/nct_usb_serial.c
>
> > +/* Index definition */
> > +enum {
> > +     NCT_VCOM_INDEX_0 =3D 0,
> > +     NCT_VCOM_INDEX_1,
> > +     NCT_VCOM_INDEX_2,
> > +     NCT_VCOM_INDEX_3,
> > +     NCT_VCOM_INDEX_4,
> > +     NCT_VCOM_INDEX_5,
> > +     NCT_VCOM_INDEX_GLOBAL =3D 0xF,
> > +};
>
> What use is this? A number is a number.
>
> > +/* Command */
> > +enum {
> > +     NCT_VCOM_GET_NUM_PORTS =3D 0,
> > +     NCT_VCOM_GET_PORTS_SUPPORT,
> > +     NCT_VCOM_GET_BAUD,
> > +     NCT_VCOM_SET_INIT,
> > +     NCT_VCOM_SET_CONFIG,
> > +     NCT_VCOM_SET_BAUD,
> > +     NCT_VCOM_SET_HCR,
> > +     NCT_VCOM_SET_OPEN_PORT,
> > +     NCT_VCOM_SET_CLOSE_PORT,
> > +     NCT_VCOM_SILENT,
> > +     /* Use bulk-in status instead of interrupt-in status */
> > +     NCT_VCON_SET_BULK_IN_STATUS,
> > +};
>
> No. This is an abuse of enumeration. These are just commands that
> happen to use the number space consecutively. These need to be
> defines.
>
> > +union nct_vendor_cmd {
> > +     struct pkg0 {
> > +             u16 index:4;
> > +             u16 cmd:8;
> > +     } p;
> > +     u16 val;
> > +} __packed;
>
> This definition is an endianness bug waiting to happen.
> If this goes over the wire, it has a defined endianness,
> which needs to be declared.
>
> > +#define NCT_HDR_MAGIC                0xA5
> > +#define NCT_HDR_MAGIC2               0x5A
> > +#define NCT_HDR_MAGIC_STATUS 0x5B
> > +
> > +struct nct_packet_header {
> > +     unsigned int magic:8;
> > +     unsigned int magic2:8;
> > +     unsigned int idx:4;
> > +     unsigned int len:12;
> > +} __packed;
>
> Again endianness.
>
> > +/* The definitions are for the feilds of nct_ctrl_msg */
> > +#define NCT_VCOM_1_STOP_BIT          0
> > +#define NCT_VCOM_2_STOP_BITS         1
> > +#define NCT_VCOM_PARITY_NONE         0
> > +#define NCT_VCOM_PARITY_ODD          1
> > +#define NCT_VCOM_PARITY_EVEN         2
> > +#define NCT_VCOM_DL5                 0
> > +#define NCT_VCOM_DL6                 1
> > +#define NCT_VCOM_DL7                 2
> > +#define NCT_VCOM_DL8                 3
> > +#define NCT_VCOM_DISABLE_FLOW_CTRL   0
> > +#define NCT_VCOM_XOFF                        1
> > +#define NCT_VCOM_RTS_CTS             2
> > +union nct_ctrl_msg {
> > +     struct pkg1 {
> > +             u16 stop_bit:1;
> > +             u16 parity:2;
> > +             u16 data_len:2;
> > +             u16 flow:2;
> > +             u16 spd:5;
> > +             u16 reserved:4;
> > +     } p;
> > +     u16 val;
> > +} __packed;
>
> At the risk of repeating myself: endianness
>
> > +
> > +/* Read from USB control pipe */
> > +static int nct_vendor_read(struct usb_interface *intf, union nct_vendo=
r_cmd cmd,
> > +                        unsigned char *buf, int size)
> > +{
> > +     struct device *dev =3D &intf->dev;
> > +     struct usb_device *udev =3D interface_to_usbdev(intf);
> > +     u8 *tmp_buf;
> > +     int res;
> > +
> > +     tmp_buf =3D kmalloc(NCT_MAX_VENDOR_READ_SIZE, GFP_KERNEL);
> > +     if (!tmp_buf)
> > +             return -ENOMEM;
> > +
> > +     if (size > NCT_MAX_VENDOR_READ_SIZE)
> > +             dev_err(dev, NCT_DRVNAME ": %s - failed to read [%04x]: o=
ver size %d\n",
> > +                     __func__, cmd.p.cmd, size);
>
> And you just go on and overwrite kernel memory?
> If you test for plausibility, do something with the result.
>
>
> > +static int nct_vendor_write(struct usb_interface *intf, union nct_vend=
or_cmd cmd, u16 val)
> > +{
> > +     struct device *dev =3D &intf->dev;
> > +     struct usb_device *udev =3D interface_to_usbdev(intf);
> > +     int res;
> > +     u8 *buf_val;
>
> Why is this u8* ?
> It should be le16*
>
> > +     buf_val =3D kmalloc(2, GFP_KERNEL);
> > +     if (!buf_val)
> > +             return -ENOMEM;
> > +
> > +     /* Copy data to the buffer for sending */
> > +     buf_val[0] =3D val & 0xff;
> > +     buf_val[1] =3D (val >> 8) & 0xff;
>
> We have macros for that.
>
> > +static u16 nct_set_baud(struct usb_interface *intf, u16 index, unsigne=
d int cflag)
> > +{
> > +     union nct_ctrl_msg msg;
> > +     union nct_vendor_cmd cmd;
> > +     u16 i;
> > +
> > +     msg.val =3D 0;
> > +     cmd.p.cmd =3D NCT_VCOM_SET_BAUD;
> > +     msg.p.spd =3D NCT_DEFAULT_BAUD;
> > +     cmd.p.index =3D index;
> > +     dev_dbg(&intf->dev, NCT_DRVNAME ": %s tty baud: 0x%X\n", __func__=
,
> > +             (cflag & CBAUD));
> > +     for (i =3D 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
> > +             if ((cflag & CBAUD) =3D=3D NCT_BAUD_SUP[i]) {
> > +                     msg.p.spd =3D i;
> > +                     dev_dbg(&intf->dev,
> > +                             NCT_DRVNAME ": %s index %d set baud: NCT_=
BAUD_SUP[%d]=3D%d\n",
> > +                             __func__, cmd.p.index, msg.p.spd, NCT_BAU=
D_SUP[i]);
> > +                     if (nct_vendor_write(intf, cmd, msg.val))
> > +                             dev_err(&intf->dev,
> > +                                     NCT_DRVNAME ": %s - Set index: %d=
 speed error\n",
> > +                                     __func__, cmd.p.index);
> > +
> > +                     break;
> > +             }
>
> If nothing matches, you do nothing?
> > +     }
> > +
> > +     return msg.p.spd;
>
> So errors are ignored?
>
>
> > +static int nct_serial_tiocmset(struct tty_struct *tty, unsigned int se=
t,
> > +                            unsigned int clear)
> > +{
> > +     return nct_tiocmset_helper(tty, set, clear);
> > +}
>
> Why? Does this function do anything useful?
>
> > +static void nct_rx_throttle(struct tty_struct *tty)
> > +{
> > +     unsigned int set;
> > +     unsigned int clear =3D 0;
>
> Why?
>
> > +
> > +     /* If we are implementing RTS/CTS, control that line */
> > +     if (C_CRTSCTS(tty)) {
> > +             set =3D 0;
> > +             clear =3D TIOCM_RTS;
> > +             nct_tiocmset_helper(tty, set, clear);
> > +     }
> > +}
> > +
> > +static void nct_rx_unthrottle(struct tty_struct *tty)
> > +{
> > +     unsigned int set;
> > +     unsigned int clear =3D 0;
>
> Why?
>
> > +     /* If we are implementing RTS/CTS, control that line */
> > +     if (C_CRTSCTS(tty)) {
> > +             set =3D 0;
> > +             set |=3D TIOCM_RTS;
> > +             nct_tiocmset_helper(tty, set, clear);
> > +     }
> > +}
> > +
> > +static int nct_serial_write_data(struct tty_struct *tty, struct usb_se=
rial_port *port,
> > +                              const unsigned char *buf, int count)
> > +{
> > +     int ret;
> > +     unsigned long flags;
> > +     struct nct_packet_header hdr;
> > +     int wr_len;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +
> > +     wr_len =3D min((unsigned int)count, NCT_MAX_SEND_BULK_SIZE - size=
of(hdr));
> > +
> > +     if (!wr_len)
> > +             return 0;
> > +
> > +     spin_lock_irqsave(&tport->port_lock, flags);
> > +
> > +     if (tport->write_urb_in_use) {
> > +             spin_unlock_irqrestore(&tport->port_lock, flags);
> > +             return 0;
> > +     }
> > +
> > +     /* Fill header */
> > +     hdr.magic =3D NCT_HDR_MAGIC;
> > +     hdr.magic2 =3D NCT_HDR_MAGIC2;
> > +     hdr.idx =3D tport->hw_idx; /* The 'hw_idx' is based on 1 */
>
> Endianness.
>
> > +
> > +     /* Copy data */
> > +     memcpy(port->write_urb->transfer_buffer + sizeof(hdr),
> > +            (const void *)buf, wr_len);
> > +
> > +     hdr.len =3D wr_len; /* File filed 'len' of header */
>
> Endiannes
>
> > +static int nct_startup_device(struct usb_serial *serial)
> > +{
> > +     int ret =3D 0;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_serial_port *port;
> > +     unsigned long flags;
> > +
> > +     /* Be sure this happens exactly once */
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +
> > +     if (serial_priv->device_init) {
> > +             spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +             return 0;
> > +     }
> > +     serial_priv->device_init =3D true;
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +
> > +     /* Start reading from bulk in endpoint */
> > +     port =3D serial->port[0];
> > +     if (!port->read_urb)
> > +             dev_dbg(&port->dev, NCT_DRVNAME ": %s: port->read_urb is =
null, index=3D%d\n",
> > +                     __func__, 0);
> > +
> > +     ret =3D usb_submit_urb(port->read_urb, GFP_KERNEL);
> > +     if (ret)
> > +             dev_err(&port->dev,
> > +                     NCT_DRVNAME ": %s: usb_submit_urb failed, ret=3D%=
d, port=3D%d\n",
> > +                     __func__, ret, 0);
>
> Error handling?
> > +
> > +     /* For getting status from interrupt-in */
> > +     if (!serial_priv->status_trans_mode) {
> > +             /* Start reading from interrupt pipe */
> > +             port =3D serial->port[0];
> > +             ret =3D usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL=
);
> > +             if (ret)
> > +                     dev_err(&port->dev,
> > +                             NCT_DRVNAME ": %s: usb_submit_urb(intr) f=
ailed, ret=3D%d, port=3D%d\n",
> > +                             __func__, ret, 0);
> > +     }
> > +     return ret;
> > +}
> > +
> > +static void nct_serial_port_end(struct usb_serial_port *port)
> > +{
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     union nct_ctrl_msg msg;
> > +     union nct_vendor_cmd cmd;
> > +
> > +     /* Send 'Close Port' to the device */
> > +     cmd.p.index =3D (u16)tport->hw_idx;
> > +     cmd.p.cmd =3D NCT_VCOM_SET_CLOSE_PORT;
>
> Endianness
>
>
> > +again:
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     tport =3D serial_priv->cur_port;
> > +     if (!tport) {
> > +             /*
> > +              * Handle a new data package (i.e., it is not
> > +              * the remaining data without a header).
> > +              * The package does not need to be combined this time.
> > +              */
> > +
> > +             for (i =3D 0; i < urb->actual_length; i++) {
> > +                     hdr =3D (struct nct_packet_header *)data;
> > +                     /* Decode the header */
> > +
> > +                     if (serial_priv->status_trans_mode) {
> > +                             /*
> > +                              * Status data is also transmitted via bu=
lk-in
> > +                              * pipe.
> > +                              */
> > +                             if (hdr->magic =3D=3D NCT_HDR_MAGIC &&
> > +                                 hdr->magic2 =3D=3D NCT_HDR_MAGIC_STAT=
US &&
> > +                                 hdr->len =3D=3D 24 && actual_len >=3D=
 28) {
>
> Endianness
>
> > +                                     /*
> > +                                      * Notice: actual_len will be dec=
reased,
> > +                                      * it is equal to urb->actual_len=
gth
> > +                                      * only at the beginning.
> > +                                      */
> > +
> > +                                     /*
> > +                                      * Status report.
> > +                                      * It should be a standalone pack=
age in
> > +                                      * one URB
> > +                                      */
> > +                                     data +=3D sizeof(struct nct_packe=
t_header);
> > +                                     actual_len -=3D
> > +                                             sizeof(struct nct_packet_=
header);
> > +
> > +                                     nps =3D (struct nct_port_status *=
)data;
> > +
> > +                                     for (j =3D 0; j < actual_len - 4;=
 j++) {
> > +                                             nct_update_status(serial,
> > +                                                               (unsign=
ed char *)nps);
> > +                                             nps++;
> > +                                     }
> > +
> > +                                     spin_unlock_irqrestore(&serial_pr=
iv->serial_lock, flags);
> > +                                     return;
> > +                             }
> > +                     }
> > +
> > +                     if (hdr->magic =3D=3D NCT_HDR_MAGIC &&
> > +                         hdr->magic2 =3D=3D NCT_HDR_MAGIC2 &&
> > +                         hdr->idx <=3D NCT_MAX_NUM_COM_DEVICES &&
> > +                         hdr->len <=3D 512)
> > +                             break;
>
> Endianness
>
>         Regards
>                 Oliver
>
