Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0F171C9;
	Fri, 27 Jun 2025 00:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985997; cv=none; b=n/IatvZz8D/LiCk0YpDWAlnlyXM119RIC/hmliAviVFIgZI49RXknWCrtFxD273lmaNnhq1u+QhEKj0C8J8aHBTFd9ZupqFqngRL9H4e+GLQgjAg9cSnGYw5vCcAc6Y08cCu1BmPAQgvy7SPSCFoX4kNpBt2fXrJ3/X9nAmKziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985997; c=relaxed/simple;
	bh=HhGkXBdmh+kVPwPOKWKbuvehCVawjrys99BDcxSct8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKFRBF0l1xiVIcTrgUBez1hvv8Yf3LjYgfVOYcESNxHRqGXavvVYJqH58CqjhdLSh4Qhqw2XA6V3comVEN652EubvjIfzZGYnAB6tNHdCANHEX3P+Dt74AM3uvd/Ot85Z6w/1yNzIAAVUirfrQTlHQ0sa2UbXE+sle8tGLKYytI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbzNeN61; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbzNeN61"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad883afdf0cso322285266b.0;
        Thu, 26 Jun 2025 17:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750985993; x=1751590793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHWzCtieyxChdODJDpL+mjs7PNC2QRzlUXccsHnrZJ0=;
        b=fbzNeN61ItQP5nnL5seBV+PCvxWCNk5RcQHLB9tYeoxORxZJ/eKd62c/bBPlujw5ws
         qz3SAHGKnEjkG89nE6oaGvmSdqKfsc5q2QmDq76RwG900JtcAqGd1cU+UEtLLcz47MLf
         l4UMZWq8VXiHsCSDbc2qXasjBXxvchKKRcC1ZqZbTypDoi42pRz1tvhST4ZDM+NJrz5j
         KM5c0aAprCHL/ZYpdYzPj6houpWMQRrWJ+thTF0OtzqfvdDhH57vxtSDzpc6DJ2SkBfY
         bFqbPO71SO8BXTZspLCrkxKVQFiRPgY54q3OKkJxS0FzJCVON5CDZ8PWenfD7rmBm/+o
         3w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750985993; x=1751590793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHWzCtieyxChdODJDpL+mjs7PNC2QRzlUXccsHnrZJ0=;
        b=DAobAgNgCASdNw5I3RN9EGUJmFw+0CaCNHLyISrUvI3wUzWM8plfwCHOqzTFI5lQ1O
         RsrCIxmPEMQBHTAaodoUakiDMbwq3sFBomIVlrguTvhar5SrLr3s/QXjlvP/35/EfDhp
         jBMVnWjBL40v91tbkg0aTSzU69xupZEoCoEP/r45byEBmB9ca0Mhl28OUKBfxlv3fzCL
         GxJuiNgALXXSkmMAswOwELPHMgJfTGgPVI52qHWHVCKI5l3bDEs9RVQQIB+4FyldSCHJ
         Kam2yq0NRRDbcuGz5Qx/6EIj7SGK+qS76CvRlgwIax7dpEMzcuHWjy+j++G8hyTybGQS
         BFiw==
X-Forwarded-Encrypted: i=1; AJvYcCVq4d1QHp68FG8PeBBNNqN9cRwsJcQ6SUFALAZrP91Ixd05d3qVNnPiNdA5rSFkf1nqb0HnB3cvKGzZcw8=@vger.kernel.org, AJvYcCXhYONrbT8jGO3JGSF6cP5FqiCPG56nQ8uYIGHVLuu2h0ZxpwotxYayG4CRaVJZy7ITNAYs5zISqrS0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4cgBpmEsbrxnMaSFTbTgkYBifK+G5FF3Kmy14iXxGo5y2CPx5
	OgQl3jcpPk63SDIydr/7yiA4xwftjwZAMTR96dxWZUCKIIfmZxU9gLJ7VPZzHtgzLSCGSGaWHUt
	YGnCGFTz7ccQ7pwNbiA/0qzh+6IlDals=
X-Gm-Gg: ASbGncuW2ouksm0VgIxeiSqolvg12I7NDRQQTym6RlXpYsW9U06EqM6FRkJ8FtY9UxD
	3SyZS4s/ghvtWHLjuhnHQdcsVSkw2f31ViuZYno5gcqq9AA0npQmhVfn5Q8L1zecPYBsJ0053bz
	kkAiA5aCk8fegAOR6anQs/ZRqQfaR1kxATpuAST+1hM8CAvSpS4Nl0kwFKeuZl8syzttxh24FBh
	eQjbt6uYRADCvY=
X-Google-Smtp-Source: AGHT+IG0I6is22tkqnAhFYDJKbwYJkgNPVeGkv9fvAHiGatwVvOYzEpvv79qFjLugs8n0d+ECvy18OAZ8QUMhacJmlw=
X-Received: by 2002:a17:907:f507:b0:ae0:68a8:bd6a with SMTP id
 a640c23a62f3a-ae34fd9a82bmr95370266b.15.1750985992616; Thu, 26 Jun 2025
 17:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
 <20250623071713.12814-1-syhuang3@nuvoton.com> <20250623071713.12814-2-syhuang3@nuvoton.com>
 <3e1baa67-2624-4e5d-85a7-57b6cdf619e7@suse.com>
In-Reply-To: <3e1baa67-2624-4e5d-85a7-57b6cdf619e7@suse.com>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Fri, 27 Jun 2025 08:59:41 +0800
X-Gm-Features: Ac12FXwmL7aDpAxgnEGEehAnmTNvFgMXkb_O7_t1_xCIm11CBphlcINicPmr8ro
Message-ID: <CACW=pY7KgEQRJfVOkiSjVSAHDO0b7kOVWSW1GPE_SzLPrb9r6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
To: Oliver Neukum <oneukum@suse.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

Thank you very much for taking the time to review my patch and provide
your valuable suggestions. I have carefully reviewed all the issues
you pointed out. Due to some ongoing tasks on my side, I may need a
bit more time before I can work on the fixes. I will address the
issues as soon as I am able.

Thank you again for your understanding and help.

Best regards,
Sheng-Yuan Huang

Oliver Neukum <oneukum@suse.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 23.06.25 09:17, hsyemail2@gmail.com wrote:
> > From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> >
> > Add support for the Nuvoton USB-to-serial adapter, which provides
> > multiple serial ports over a single USB interface.
> >
> > The device exposes one control endpoint, one bulk-in endpoint, and
> > one bulk-out endpoint for data transfer. Port status is reported via
> > an interrupt-in or bulk-in endpoint, depending on device configuration.
>
> A few issues left I am afraid.
> Comments on them inline.
>
>         Regards
>                 Oliver
>
> > +/* Index definition */
> > +#define NCT_VCOM_INDEX_0     0
> > +#define NCT_VCOM_INDEX_1     1
> > +#define NCT_VCOM_INDEX_2     2
> > +#define NCT_VCOM_INDEX_3     3
> > +#define NCT_VCOM_INDEX_4     4
> > +#define NCT_VCOM_INDEX_5     5
>
> Why? These make no sense.
>
> > +#define NCT_VCOM_INDEX_GLOBAL        0xF
> > +
> > +/* Command */
> > +#define NCT_VCOM_GET_NUM_PORTS               0
> > +#define NCT_VCOM_GET_PORTS_SUPPORT   1
> > +#define NCT_VCOM_GET_BAUD            2
> > +#define NCT_VCOM_SET_INIT            3
> > +#define NCT_VCOM_SET_CONFIG          4
> > +#define NCT_VCOM_SET_BAUD            5
> > +#define NCT_VCOM_SET_HCR             6
> > +#define NCT_VCOM_SET_OPEN_PORT               7
> > +#define NCT_VCOM_SET_CLOSE_PORT              8
> > +#define NCT_VCOM_SILENT                      9
> > +/* Use bulk-in status instead of interrupt-in status */
> > +#define NCT_VCON_SET_BULK_IN_STATUS  10
> > +
> > +struct nct_vendor_cmd {
> > +     __le16 val;     /* bits[3:0]: index, bits[11:4]: cmd, bits[15:12]=
: reserved */
> > +};
> > +
> > +#define NCT_CMD_INDEX_MASK   0x000F
> > +#define NCT_CMD_CMD_MASK     0x0FF0
> > +#define NCT_CMD_CMD_SHIFT    4
> > +
> > +static inline __le16 nct_build_cmd(__u8 cmd_code, __u8 index)
> > +{
> > +     return cpu_to_le16((cmd_code << NCT_CMD_CMD_SHIFT) | (index & NCT=
_CMD_INDEX_MASK));
>
> This may be picking nits, but it seems to me that cmd_code is u8.
> Hence cmd_code << NCT_CMD_CMD_SHIFT) would also be u8 and the operation
> may overflow. You better cast cmd_code to u16.
>
> > +static u16 nct_set_baud(struct usb_interface *intf, u16 index, unsigne=
d int cflag, bool *found)
> > +{
> > +     struct nct_vendor_cmd cmd;
> > +     struct nct_ctrl_msg msg;
> > +     u16 i;
> > +     u8 spd =3D NCT_DEFAULT_BAUD;
> > +
> > +     *found =3D false;
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_BAUD, index);
> > +     dev_dbg(&intf->dev, "tty baud: 0x%X\n", (cflag & CBAUD));
> > +     for (i =3D 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
> > +             if ((cflag & CBAUD) =3D=3D NCT_BAUD_SUP[i]) {
> > +                     spd =3D i;
> > +                     dev_dbg(&intf->dev, "index %d set baud: NCT_BAUD_=
SUP[%d]=3D%d\n",
> > +                             index, spd, NCT_BAUD_SUP[i]);
> > +                     /*
> > +                      * Create control message
> > +                      * Note: The NCT_VCOM_SET_BAUD only set the baud =
rate
> > +                      */
> > +                     msg.val =3D nct_build_ctrl_msg(0, 0, 0, 0, spd);
> > +                     if (nct_vendor_write(intf, cmd, le16_to_cpu(msg.v=
al)))
> > +                             dev_err(&intf->dev, "%s - Set index: %d s=
peed error\n",
> > +                                     __func__, index);
> > +                     else
> > +                             *found =3D true;
> > +
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!*found)
> > +             dev_warn(&intf->dev, "Unsupported baud rate 0x%X requeste=
d\n", (cflag & CBAUD));
>
> This is problematic. There are two reasons for this to trigger
>
> 1. no match
> 2. IO error in nct_vendor_write()
>
> If the second case happens you nevertheless claim the first cause
> I'd just drop the warning. Better nothing than something misleading.
>
> > +
> > +     return spd;
> > +}
>
>
> > +static int nct_tiocmset_helper(struct tty_struct *tty, unsigned int se=
t,
> > +                            unsigned int clear)
> > +{
> > +     struct usb_serial_port *port =3D tty->driver_data;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_ctrl_msg msg;
> > +     struct nct_vendor_cmd cmd;
> > +     unsigned long flags;
> > +     u8 hcr =3D 0;
> > +
> > +     if (set & TIOCM_RTS)
> > +             hcr |=3D NCT_HCR_RTS;
> > +     if (set & TIOCM_DTR)
> > +             hcr |=3D NCT_HCR_DTR;
> > +     if (clear & TIOCM_RTS)
> > +             hcr &=3D ~NCT_HCR_RTS;
> > +     if (clear & TIOCM_DTR)
> > +             hcr &=3D ~NCT_HCR_DTR;
> > +
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_HCR, tport->hw_idx);
> > +     msg.val =3D cpu_to_le16(hcr);
> > +
> > +     spin_lock_irqsave(&tport->port_lock, flags);
>
> No need for irqsave. A simple irq version will do.
> Using irqsave is misleading, because we know that this
> function can sleep.
>
> > +     tport->hcr =3D hcr;
> > +     spin_unlock_irqrestore(&tport->port_lock, flags);
> > +
> > +     dev_dbg(&intf->dev,
> > +             "index/cmd/val(hcr)=3D%X, %X, %X [RTS=3D%X, DTR=3D%X]\n",
> > +             nct_get_cmd_index(cmd.val), nct_get_cmd_cmd(cmd.val),
> > +             le16_to_cpu(msg.val), hcr & NCT_HCR_RTS, hcr & NCT_HCR_DT=
R);
> > +
> > +     return nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> > +}
>
>
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
>
> [..]
>
> > +     /* Fill header */
> > +     hdr.magic =3D NCT_HDR_MAGIC;
> > +     hdr.magic2 =3D NCT_HDR_MAGIC2;
> > +     nct_set_hdr_idx_len(&hdr, tport->hw_idx, wr_len); /* The 'hw_idx'=
 is based on 1 */
> > +
> > +     /* Copy data */
> > +     memcpy(port->write_urb->transfer_buffer + sizeof(hdr),
> > +            (const void *)buf, wr_len);
> > +
> > +     /* Filled urb data */
> > +     memcpy(port->write_urb->transfer_buffer, (const void *)&hdr,
> > +            sizeof(hdr)); /* Copy header after filling all other field=
s */
>
> You are copying the header in unconditionally ...
>
> > +
> > +     /* Set urb length(Total length) */
> > +     port->write_urb->transfer_buffer_length =3D wr_len + sizeof(hdr);
> > +
> > +     port->write_urb->transfer_flags |=3D URB_ZERO_PACKET;
> > +
> > +     ret =3D usb_submit_urb(port->write_urb, GFP_ATOMIC);
> > +     if (ret < 0) {
> > +             dev_err(&port->dev,
> > +                     "%s: usb_submit_urb failed, ret=3D%d, hw_idx=3D%d=
\n",
> > +                     __func__, ret, tport->hw_idx);
> > +     } else {
> > +             tport->write_urb_in_use =3D true; /* Set it as busy */
> > +             ret =3D wr_len + sizeof(hdr);
> > +     }
> > +
> > +     spin_unlock_irqrestore(&tport->port_lock, flags);
> > +
> > +     if (ret > sizeof(hdr))
> > +             ret =3D ret - sizeof(hdr);
>
> ... and here you check?
>
> This needs an explanation. A very good explanation.
>
> > +
> > +     dev_dbg(&port->dev, "returning %d\n", ret);
> > +     return ret;
> > +}
> > +
> > +static int nct_serial_write(struct tty_struct *tty, struct usb_serial_=
port *port,
> > +                         const unsigned char *buf, int count)
> > +{
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +
> > +     if (!port) {
> > +             pr_err("%s: port is NULL!\n", __func__);
> > +             return -EIO;
> > +     }
> > +     if (!port->write_urb) {
> > +             dev_err(&port->dev, "%s: write_urb not initialized!\n", _=
_func__);
> > +             return -EIO;
> > +     }
> > +     if (!port->write_urb->transfer_buffer) {
> > +             dev_err(&port->dev, "%s: transfer_buffer not initialized!=
\n", __func__);
> > +             return -EIO;
> > +     }
>
> Can these errors really happen?
>
> > +
> > +     /* Flow control */
> > +     if (tty_port_cts_enabled(tty->port))
> > +             if (tport->flow_stop_wrt)
> > +                     return 0;
> > +
> > +     return nct_serial_write_data(tty, port, buf, count);
> > +}
>
>
> > +static int nct_open(struct tty_struct *tty, struct usb_serial_port *po=
rt)
> > +{
> > +     struct nct_vendor_cmd cmd;
> > +     struct nct_ctrl_msg msg;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_interface *intf =3D serial->interface;
> > +
> > +     if (!port->serial)
> > +             return -ENXIO;
> > +
> > +     /* Allocate write_urb */
> > +     if (!port->write_urb) {
> > +             port->write_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +             if (!port->write_urb) {
> > +                     dev_err(&port->dev, "%s: Failed to allocate write=
 URB\n", __func__);
> > +                     return -ENOMEM;
> > +             }
> > +     }
> > +
> > +     /* Allocate bulk_out_buffer */
> > +     port->write_urb->transfer_buffer =3D kmalloc(NCT_MAX_SEND_BULK_SI=
ZE, GFP_KERNEL);
>
> Can use kzalloc()
>
> > +     if (!port->write_urb->transfer_buffer) {
> > +             usb_free_urb(port->write_urb);
> > +             port->write_urb =3D NULL;
> > +             return -ENOMEM;
> > +     }
> > +
> > +     /* Clear(init) buffer */
> > +     memset(port->write_urb->transfer_buffer, 0, NCT_MAX_SEND_BULK_SIZ=
E);
> > +
> > +     /* Set write_urb */
> > +     usb_fill_bulk_urb(port->write_urb, serial->dev,
> > +                       usb_sndbulkpipe(serial->dev, serial_priv->bulk_=
out_ep->bEndpointAddress),
> > +                       port->write_urb->transfer_buffer, NCT_MAX_SEND_=
BULK_SIZE,
> > +                       nct_write_bulk_callback, port);
> > +
> > +     /* Be sure the device is started up */
> > +     if (nct_startup_device(port->serial) !=3D 0)
> > +             return -ENXIO;
> > +
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_OPEN_PORT, tport->hw_idx);
> > +     msg.val =3D cpu_to_le16(0);
> > +     nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
>
> This can fail.
>
> > +     /*
> > +      * Delay 1ms for firmware to configure hardware after opening the=
 port.
> > +      * (Especially at high speed)
> > +      */
> > +     usleep_range(1000, 2000);
> > +     return 0;
> > +}
> > +
> > +static void nct_close(struct usb_serial_port *port)
> > +{
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     unsigned long flags;
> > +
> > +     mutex_lock(&port->serial->disc_mutex);
> > +     /* If disconnected, don't send the close-command to the firmware =
*/
> > +     if (port->serial->disconnected)
>
> We are disconnected ...
> > +             goto exit;
> > +
> > +     nct_serial_port_end(port);
> > +
> > +exit:
> > +     /* Shutdown any outstanding bulk writes */
> > +     usb_kill_urb(port->write_urb);
>
> ... so this is either useless, or a bug has already happened.
>
> > +
> > +     /* Free transfer_buffer */
> > +     kfree(port->write_urb->transfer_buffer);
> > +     port->write_urb->transfer_buffer =3D NULL;
> > +
> > +     if (tport) {
> > +             spin_lock_irqsave(&tport->port_lock, flags);
> > +             tport->write_urb_in_use =3D false;
> > +             spin_unlock_irqrestore(&tport->port_lock, flags);
> > +     }
> > +
> > +     mutex_unlock(&port->serial->disc_mutex);
> > +}
> > +
>
> > +static void nct_usb_serial_read(struct urb *urb)
> > +{
> > +     struct usb_serial_port *port =3D  urb->context;
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct nct_tty_port *tport;
> > +     struct nct_packet_header *hdr =3D NULL;
> > +     unsigned char *data =3D urb->transfer_buffer;
> > +     int i, j;
> > +     int actual_len =3D urb->actual_length;
> > +     int len =3D 0;
> > +     struct nct_port_status *nps;
> > +     unsigned long flags;
> > +
> > +     if (!urb->actual_length)
> > +             return;
> > +
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
>
> How do you know that there is enough data for struct nct_packet_header
> left?
>
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
> > +                                 nct_get_hdr_len(hdr) =3D=3D 24 && act=
ual_len >=3D 28) {
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
> > +                                     actual_len -=3D sizeof(struct nct=
_packet_header);
> > +
> > +                                     nps =3D (struct nct_port_status *=
)data;
> > +
> > +                                     for (j =3D 0; j < actual_len - 4;=
 j++) {
> > +                                             nct_update_status(serial,=
 (unsigned char *)nps);
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
> > +                         nct_get_hdr_idx(hdr) <=3D NCT_MAX_NUM_COM_DEV=
ICES &&
> > +                         nct_get_hdr_len(hdr) <=3D 512)
> > +                             break;
> > +
> > +                     data++;
> > +                     actual_len--;
> > +                     if (!actual_len) {
> > +                             dev_err(&intf->dev, "%s: Decode serial pa=
cket size failed.\n",
> > +                                     __func__);
> > +                             spin_unlock_irqrestore(&serial_priv->seri=
al_lock, flags);
> > +                             return;
> > +                     }
> > +             }
> > +             /*
> > +              * Search tty port
> > +              * Search the tty device by the idx in header, and check =
if
> > +              * it is registered or opened.
> > +              * If it is, record them. The record will be used later f=
or
> > +              * 2 purposes:
> > +              *   (1) If the current data package is incomplete, the f=
ollowing
> > +              *       incoming data will not include a header.
> > +              *   (2) To determine which device will be used for trans=
mission.
> > +              */
> > +             tport =3D NULL;
> > +             for (i =3D 0; i < serial->type->num_ports; i++) {
> > +                     port =3D serial->port[i];
> > +                     tport =3D usb_get_serial_port_data(port);
> > +                     if (tport->hw_idx !=3D nct_get_hdr_idx(hdr))
> > +                             continue;
> > +
> > +                     break;
> > +             }
> > +             if (!tport) {
> > +                     dev_err(&intf->dev, "%s: Decode serial packet ind=
ex failed.\n", __func__);
> > +                     spin_unlock_irqrestore(&serial_priv->serial_lock,=
 flags);
> > +                     return;
> > +             }
> > +             /*
> > +              * Calculate the data length.
> > +              * Then, check if the length specified in the header matc=
hes
> > +              * the data length. If not, it indicates that the data we
> > +              * received spans across two (or more) packets.
> > +              */
> > +             actual_len -=3D sizeof(struct nct_packet_header);
> > +             data +=3D sizeof(struct nct_packet_header);
> > +             /* actual_len: the data length of the data we got this ti=
me */
> > +             if (nct_get_hdr_len(hdr) > actual_len) {
> > +                     /*
> > +                      * It means the length specified in the header (t=
he
> > +                      * custom header) is greater than the length of t=
he
> > +                      * data we received.
> > +                      * Therefore, the data we received this time does=
 not
> > +                      * span across another packet (i.e. no new header=
).
> > +                      */
> > +                     len =3D actual_len;
> > +                     /*
> > +                      * cur_len: Record how many data does not handle =
yet
> > +                      */
> > +                     serial_priv->cur_len =3D nct_get_hdr_len(hdr) - l=
en;
> > +                     /*
> > +                      * Record the current port. When we got remained =
data of
> > +                      * the package next time
> > +                      */
> > +                     serial_priv->cur_port =3D tport;
> > +             } else {
> > +                     /*
> > +                      * The data we got crosses packages(not belong
> > +                      * to the same header). We only handle data by
> > +                      * the length in header. And we will handle
> > +                      * another package when 'goto "again" '.
> > +                      */
> > +                     len =3D nct_get_hdr_len(hdr);
> > +             }
> > +     } else { /*  Handling the remained data which crosses package */
> > +             if (serial_priv->cur_len > actual_len) {
> > +                     /*
> > +                      * The unhandled part of the data exceeds the dat=
a we
> > +                      * received this time. We only handle the data we
> > +                      * have, expecting more data to be received later=
.
> > +                      */
> > +                     len =3D actual_len;
> > +             } else {
> > +                     /*
> > +                      * This means the package has been fully handled.
> > +                      * Clear 'cur_port' as no additional data needs t=
o be
> > +                      * attached to the current package.
> > +                      */
> > +                     len =3D serial_priv->cur_len;
> > +                     serial_priv->cur_port =3D NULL;
> > +             }
> > +             serial_priv->cur_len -=3D len;
> > +     }
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +     /*
> > +      * The per-character sysrq handling is too slow for fast devices,
> > +      * so we bypass it in the vast majority of cases where the USB se=
rial is
> > +      * not a console.
> > +      */
> > +     if (tport->sysrq) {
> > +             for (i =3D 0; i < len; i++, data++)
> > +                     tty_insert_flip_char(&port->port, *data, TTY_NORM=
AL);
> > +     } else {
> > +             tty_insert_flip_string(&port->port, data, len);
> > +             data +=3D len;
> > +     }
> > +     /*
> > +      * Send data to the tty device (according to the port identified =
above).
> > +      */
> > +     tty_flip_buffer_push(&port->port);
> > +     actual_len -=3D len;
> > +
> > +     /*
> > +      * It means that the data we received this time contains two or
> > +      * more data packages, so it needs to continue processing the nex=
t
> > +      * data packages.
> > +      */
> > +     if (actual_len > 0)
> > +             goto again;
> > +}
