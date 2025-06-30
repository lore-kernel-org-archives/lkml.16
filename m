Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECDD248F65
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284795; cv=none; b=aW3QjJdcqmgDfbXu8C8VbVIaLYn9BOEc8dTCNd7P/WLXj4PYbFxa+waKGczeHMv19J84HpbnRCOrMnWm0hpX4mpGPe+NnJj1l9X1nC/lGBzmv/f4LmYvnB/z0exl8ey6f9qOVI7ID2aM9fn7iyOKjOCA37m2TzC9KNb6+pUI8m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284795; c=relaxed/simple;
	bh=L/bvXjd+PogfFSOOCIblhRctj4Y9AmE5aVDJhzELWSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LC0l6G4J4hFu0Gr+886AEu9+UBCp5UtgGpZYhJjGjCjQmPIZpDY+T3anmAwiG12qZ88/ycsL8UCQwNDeeOfDAN5F4QT2OPHesAmocD7GgKv6s3BnDmXGEFXg2TKm6nCwTVAoSOt6m8nAstcaw6pE2aA7Umth5IfzIxWv4UQ/L0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kovG7ina; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kovG7ina"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e731a56e111so1532613276.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751284792; x=1751889592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SySw9I1Cwh0zXJN2fuAlhnYjDfoYHhnLV6ZOfnAZqoo=;
        b=kovG7inaHREvqU9HwC6X0povWIAIZACDbgXqlbaviAUmDdJ67GUaRTMVp8DBOfEPje
         8lD1Gv/HdKs3N8qGon30az/B7NjysS10drh+sRUNjEThkkS14RUxrOaOMgGkkZhum1NM
         kg18uRRsLd1hs6QHs6sakUei2VaRD9etf5HUx73fMnyuZcrGlbzmVdbTmPVoFtrFzeek
         6k+mijuSiSKfEVmVvko62K2rNInJ1KU7XTuRByPKraV6AGc5x3bTrX8jTO/hceb1TKrW
         KM/q1UgeArb7XFMLLvdUSx6gqgx1v51zTs9jArDbQYBXQZqBm9DtbSYva2YUhxJqxVEN
         UyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751284792; x=1751889592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SySw9I1Cwh0zXJN2fuAlhnYjDfoYHhnLV6ZOfnAZqoo=;
        b=Vr8fTascA4nqBrkpafKCpvICPJMqR2iqzjKOjxKEz8OFJmp1onb8FuMsnyRGuGEUMP
         r2Bvji+WtCGF2uIGqFz9vu8bC9AlMmIgoFjvu6jzJFnfT0asbVs43+nG+Rrm1uhAiBxe
         Ta5kNCoLEe9bSMsEXY2t5Ixq1RgbE6GxMctFaam+wfoUjxxfATXwvXmz5+Pw/NyeEsg3
         JO69BRcAkvYrlEBpf2gerqRCmgFHcRY18DeJL46j+12dRk9R1/a0oW/2qLFV4VUPbhh3
         mo8pQZTxR8wEWUbenndHw1uZN5D8YU6tV/GjEz1Vn530DqUbq0wYUyXtl2CaC3ij2PXN
         5hxg==
X-Forwarded-Encrypted: i=1; AJvYcCXQThEzvcDKcz1v6lrYowHipK0ap4UlJPYhgOeF7XM++0XfzyTaFKzd2Bbc9vWcJVsXstK3ka6dHmNPSFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPS8eQ09FlqYO2KQp87wjIK7qvRCmfZqw0V1T2GtV46QlKstc
	dOCBrJ3/p4drpqz5LKlS94m1ns+Ai9pDZAdhBnuK0blhbZlL/FymiqL8Dch6aWcLkCxWeSEv8ZI
	suBVAlWdDKspJ0AeDTvYNhs2DlE2DCCw6sr4kvYiO
X-Gm-Gg: ASbGncsoAL/MxixSeX/qF5v4oDy78fgZToZWP5fI4NTUG7dCdbNt1AgrT1a2vPqJMoX
	s+giU630JInbWp99jsXSYPFNn5ls2j8f0OsLdmu+GHdoQsvedCQ9s7BRUwbX//KsJmMVdjngo2s
	kk4BxRqOYwu2ePpDmm39pmp84MY8YNW9HVOqhrnw+Kk0h0njG0AkanN3Y=
X-Google-Smtp-Source: AGHT+IHupkCStW54TGZ8wTgpYDFJufQBZjdJExfg4i7fBrNNjvu+yl7ap7XB+b/mRWTAtAlOonRMmTfXd//odBaZ2lc=
X-Received: by 2002:a05:690c:6881:b0:708:f6d:b79f with SMTP id
 00721157ae682-7151719b26fmr173745717b3.29.1751284792081; Mon, 30 Jun 2025
 04:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
In-Reply-To: <aF5N5jrRUlj3SUGS@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Mon, 30 Jun 2025 13:59:39 +0200
X-Gm-Features: Ac12FXyvdcpwXxziXUsF17NccO267-yaAn-YzttYWbj4I7Ob8EDh87gPqqyULWo
Message-ID: <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please see inline comments.

On Fri, Jun 27, 2025 at 9:53=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Jun 24, 2025 at 11:00:28AM +0000, Dawid Niedzwiecki wrote:
> > This uses USB to talk to the ChromeOS EC. The protocol
> > is defined by the EC and is fairly simple, with a length byte,
> > checksum, command byte and version byte in the header.
> >
> > The driver uses vendor defined usb interface with in/out
> > endpoints to transfer requests and responses. The driver also
> > uses one interrupt in endpoint which signals readiness of response
> > and pending events on the EC side.
>
> s/This//;s/The driver// and modify the rest of sentences accordingly.
> Not a hard requirement but [1]("imperative mood").
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml
>

Will do.

> Some part of code is not easy to read to me. I'd suggest to consider to:
> - Use shorter local variable names.
> - Don't wrap lines whenever it's still under 100-cols.
> - Put more relevant pieces of code closer.
> - Insert blank lines for separating logic blocks.
> - Drop redundant comments if the code is clear.
> It doesn't need to be overkill as long as that makes sense.
>
> > diff --git a/drivers/platform/chrome/cros_ec_usb.c b/drivers/platform/c=
hrome/cros_ec_usb.c
> > [...]
> > +#include "cros_ec.h"
> > +
> > +/* Google */
>
> Drop this comment which makes less sense.
>

Will do.

> > [...]
> > +/* table of devices that work with this driver */
>
> Drop the comment.
>

Will do.

> > +static const struct usb_device_id cros_ec_usb_table[] =3D {
> > +     { USB_VENDOR_AND_INTERFACE_INFO(USB_VENDOR_ID_GOOGLE,
> > +                                     USB_CLASS_VENDOR_SPEC,
> > +                                     USB_SUBCLASS_GOOGLE_EC_HOST_CMD,
> > +                                     USB_PROTOCOL_GOOGLE_EC_HOST_CMD) =
},
> > +     {} /* Terminating entry */
>
> Drop the comment which is a very clear intent.
>

Will do.

> > +};
> > +MODULE_DEVICE_TABLE(usb, cros_ec_usb_table);
>
> I'd prefer to move the device_id definition just right before the struct
> usb_driver.
>
> > +/* Structure to hold all of our device specific stuff */
>
> Drop the comment.
>

Will do.

> > +struct cros_ec_usb {
>
> For readability, insert some blank lines in the struct.
>
> > +     /* the usb device for this device */
> > +     struct usb_device *udev;
> > +     /* the interface for this device */
> > +     struct usb_interface *interface;
> > +     /* Cros EC device structure */
> > +     struct cros_ec_device *ec_dev;
>
> Maybe insert a blank line here.
>

Will do.

> > +     /* the buffer to receive data from bulk ep */
> > +     u8 *bulk_in_buffer;
> > +     /* the buffer to receive data from int ep */
> > +     u8 *int_in_buffer;
> > +     /* the urb to receive data from int ep */
> > +     struct urb *int_in_urb;
> > +     /* the size of the receive buffer from bulk ep */
> > +     size_t bulk_in_size;
> > +     /* the size of the receive buffer from int ep */
> > +     size_t int_in_size;
>
> Maybe insert a blank line here.
>

Will do.

> > +     /* the pipe of the bulk in ep */
> > +     unsigned int bulk_in_pipe;
> > +     /* the pipe of the bulk out ep */
> > +     unsigned int bulk_out_pipe;
> > +     /* the pipe of the int in ep */
> > +     unsigned int int_in_pipe;
> > +     /* the interval of the int in ep */
> > +     uint8_t int_in_interval;
>
> Maybe insert a blank line here.
>

Will do.

> `./scripts/checkpatch.pl --strict` complains about:
> CHECK: Prefer kernel type 'u8' over 'uint8_t'
>

I'll change that.

> > [...]
> > +struct int_msg {
> > +     uint8_t int_type;
> > +} __packed;
>
> `./scripts/checkpatch.pl --strict` complains about:
> CHECK: Prefer kernel type 'u8' over 'uint8_t'
>

I'll change that.

> > +static void cros_ec_int_callback(struct urb *urb);
>
> Move just right before submit_int_urb() to make the intent more clear?
>

Make sense.

> > +static int expected_response_size(const struct ec_host_response *host_=
response)
> > +{
> > +     /* Check host request version */
> > +     if (host_response->struct_version !=3D 3)
> > +             return 0;
> > +
> > +     /* Reserved byte should be 0 */
> > +     if (host_response->reserved)
> > +             return 0;
> > +
> > +     return sizeof(*host_response) + host_response->data_len;
> > +}
>
> Wondering if the function really helps readability. Maybe just inline to
> do_cros_ec_pkt_xfer_usb()?
>

Make sense.

> > +static int cros_ec_usb_register(u16 idProduct, struct cros_ec_usb *ec_=
usb)
> > +{
> > +     struct registered_ec *ec;
> > +
> > +     ec =3D kzalloc(sizeof(*ec), GFP_KERNEL);
>
> kmalloc() should be sufficient. The member fields are going to be overrid=
den
> anyway.
>

Make sense.

> > +static int submit_int_urb(struct cros_ec_device *ec_dev)
> > +{
> > +     struct cros_ec_usb *ec_usb =3D ec_dev->priv;
> > +     struct usb_device *usb_dev =3D interface_to_usbdev(ec_usb->interf=
ace);
> > +     int ret;
> > +
> > +     /* Submit the INT URB. */
> > +     usb_fill_int_urb(ec_usb->int_in_urb, usb_dev, ec_usb->int_in_pipe=
,
> > +                      ec_usb->int_in_buffer, ec_usb->int_in_size,
> > +                      cros_ec_int_callback, ec_usb, ec_usb->int_in_int=
erval);
> > +     ret =3D usb_submit_urb(ec_usb->int_in_urb, GFP_KERNEL);
> > +
> > +     return ret;
>
> Eliminate the `ret`. Just return usb_submit_urb(...).
>

Will do.

> > +static void cros_ec_int_callback(struct urb *urb)
> > +{
> > +     struct cros_ec_usb *ec_usb =3D urb->context;
> > +     struct cros_ec_device *ec_dev =3D ec_usb->ec_dev;
> > +     int ret;
> > +
> > [...]
> > +     if (urb->actual_length >=3D sizeof(struct int_msg)) {
> > +             struct int_msg *int_msg =3D
> > +                     (struct int_msg *)ec_usb->int_in_buffer;
> > +             enum cros_ec_usb_int_type int_type =3D
> > +                     (enum cros_ec_usb_int_type)int_msg->int_type;
>
> Maybe insert a blank line here.
>

Will do.

> > +             switch (int_type) {
> > +             case INT_TYPE_EVENT_OCCURED:
> > +                     if (ec_usb->registered) {
> > +                             ec_dev->last_event_time =3D cros_ec_get_t=
ime_ns();
> > +                             schedule_work(&ec_usb->work_ec_evt);
> > +                     }
> > +                     break;
> > +             case INT_TYPE_RESPONSE_READY:
> > +                     ec_usb->resp_ready =3D true;
> > +                     wake_up(&ec_usb->resp_ready_wait);
> > +                     break;
>
> I'm wondering who fills the `int_type` (i.e. 0 and 1) here? EC? If so, wh=
y
> aren't they in cros_ec_command.h?
>

Yes, EC fills the int_type since it is the IN (from device to host)
interrupt transfer.
It is not in the cros_ec_command.h file, because it is a part of the
USB Host Command specification. Not related to EC itself or any
command.

> > +             default:
> > +                     dev_err(ec_dev->dev, "Unrecognized event: %d\n",
> > +                             int_type);
> > +             }
> > +     } else {
> > +             dev_err(ec_dev->dev, "Incorrect int transfer len: %d\n",
> > +                     urb->actual_length);
> > +     }
>
> So in either cases, all of them need to resubmit the URB? Doesn't some of
> them just need to return?
>

Yes, we do always need to resubmit URB, otherwise the interface will
be dysfunctional once any error happen

> > +
> > +resubmit:
> > +     /* Resubmit the INT URB. */
> > +     ret =3D submit_int_urb(ec_dev);
> > +     if (ret)
> > +             dev_err(ec_dev->dev, "Failed to resumbit int urb: %d", re=
t);
> > +}
> > +
> > +static int do_cros_ec_pkt_xfer_usb(struct cros_ec_device *ec_dev,
> > +                                struct cros_ec_command *ec_msg)
> > +{
> > +     struct cros_ec_usb *ec_usb =3D ec_dev->priv;
> > +     struct ec_host_response *host_response;
> > +     int req_size, ret, actual_length, expected_resp_size, resp_size;
> > +     const int header_size =3D sizeof(*host_response);
> > +     const int max_resp_size =3D header_size + ec_msg->insize;
> > +     const int bulk_in_size =3D umin(ec_usb->bulk_in_size, ec_dev->din=
_size);
> > +     uint8_t sum =3D 0;
>
> `./scripts/checkpatch.pl --strict` complains about:
> CHECK: Prefer kernel type 'u8' over 'uint8_t'
>

I'll change that

> > [...]
> > +     /* Get first part of response that contains a header. */
> > +     ret =3D usb_bulk_msg(ec_usb->udev, ec_usb->bulk_in_pipe, ec_dev->=
din,
> > +                        bulk_in_size, &actual_length,
> > +                        BULK_TRANSFER_TIMEOUT_MS);
> > +     if (ret) {
> > +             dev_err(ec_dev->dev, "Failed to get response: %d\n", ret)=
;
> > +             goto exit;
> > +     }
> > +
> > +     /* Verify number of received bytes. */
> > +     if (actual_length < header_size) {
> > +             dev_err(ec_dev->dev, "Received too little bytes: %d\n",
> > +                     actual_length);
>
> Is it possible that the `actual_length < header_size` just because it nee=
ds
> to further read? I.e. need a read loop for waiting EOF or
> `actual_length >=3D header_size`?
>

No, we assume that the EP size is at least header size, so the entire
header has to be sent at once.

> > +             ret =3D -ENOSPC;
> > +             goto exit;
> > +     }
> > +     expected_resp_size =3D
> > +             expected_response_size((struct ec_host_response *)ec_dev-=
>din);
> > +     if ((expected_resp_size > max_resp_size) || (expected_resp_size =
=3D=3D 0) ||
> > +         (actual_length > expected_resp_size)) {
> > +             dev_err(ec_dev->dev, "Incorrect number of expected bytes:=
 %d\n",
> > +                     expected_resp_size);
> > +             ret =3D -ENOSPC;
> > +             goto exit;
> > +     }
>
> Maybe insert a blank line here.
>

Will do.

> > +     resp_size =3D actual_length;
>
> Move next to the following line of the comment.
>

Will do.

> > +     /* Get the rest of the response if needed. */
> > +     if (resp_size < expected_resp_size) {
> > +             ret =3D usb_bulk_msg(ec_usb->udev, ec_usb->bulk_in_pipe,
> > +                                ec_dev->din + resp_size,
> > +                                expected_resp_size - resp_size,
> > +                                &actual_length, BULK_TRANSFER_TIMEOUT_=
MS);
> > +             if (ret) {
> > +                     dev_err(ec_dev->dev,
> > +                             "Failed to get second part of response: %=
d\n",
> > +                             ret);
> > +                     goto exit;
> > +             }
> > +             resp_size +=3D actual_length;
>
> Same here: doesn't it need a read loop for waiting EOF or
> `resp_size >=3D expected_resp_size`?
>

No, we know exactly how many bytes are expected.
The usb_bulk_msg returns before receiving expected bytes only if there
was a not max size transfer detected.

> > +     }
> > +
> > +     /* Check if number of received of bytes is correct. */
> > +     if (resp_size !=3D expected_resp_size) {
> > +             dev_err(ec_dev->dev,
> > +                     "Received incorrect number of bytes: %d, expected=
: %d\n",
> > +                     resp_size, expected_resp_size);
> > +             ret =3D -ENOSPC;
> > +             goto exit;
> > +     }
> > +
> > +     /* Validate checksum */
> > +     host_response =3D (struct ec_host_response *)ec_dev->din;
> > +     for (int i =3D 0; i < sizeof(*host_response) + host_response->dat=
a_len;
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
> I.e. expected_resp_size.
>

I'll change that.

> > +          i++) {
> > +             sum +=3D ec_dev->din[i];
> > +     }
>
> Drop the {} pair.
>

Will do.

> > +     if (sum) {
> > +             dev_err(ec_dev->dev, "Bad packet checksum calculated %x\n=
",
> > +                     sum);
> > +             ret =3D -EBADMSG;
> > +             goto exit;
> > +     }
> > +
> > +     ec_msg->result =3D host_response->result;
> > +     memcpy(ec_msg->data, ec_dev->din + sizeof(*host_response),
>
> header_size =3D=3D sizeof(*host_response). Either drop `header_size` or u=
se it.
>

Make sense.

> > +/**
> > + * usb_evt_handler - USB to AP event handler
> > + * @work: Work struct
> > + */
>
> Maybe drop the comment?
>

Will do.

> > +static int cros_ec_usb_probe(struct usb_interface *intf,
> > +                          const struct usb_device_id *id)
> > +{
> > +     struct usb_device *usb_dev =3D interface_to_usbdev(intf);
> > +     struct usb_endpoint_descriptor *bulk_in, *bulk_out, *int_in;
> > +     struct device *if_dev =3D &intf->dev;
> > +     struct cros_ec_device *ec_dev;
> > +     const u16 idProduct =3D usb_dev->descriptor.idProduct;
> > +     struct cros_ec_usb *ec_usb =3D cros_ec_usb_get_registered(idProdu=
ct);
> > +     const bool is_registered =3D ec_usb !=3D NULL;
>
> Or !!ec_usb.
>

I'll change that.

> > +     int retval;
> > +
> > +     /*
> > +      * Do not register the same EC device twice. The probing is perfo=
rmed every
> > +      * reboot, sysjump, crash etc. Recreating the /dev/cros_X file ev=
ery time
> > +      * would force all application to reopen the file, which is not a=
 case for
> > +      * other cros_ec_x divers. Instead, keep the cros_ec_device and c=
ros_ec_usb
> > +      * structures constant and replace USB related structures for the=
 same EC
> > +      * that is reprobed.
> > +      *
> > +      * The driver doesn't support handling two devices with the same =
idProduct,
> > +      * but it will never be a real usecase.
> > +      */
>
> I don't quite understand why does it need to memorize the registered ECs.
> Supposedly, the probe function is only called few times during booting, a=
nd
> gets success once. Hot-plugs?
>

The probe is called every time the EC device boots from the beginning
- sysjumps, crashes, reboots etc. It succeeds the first time.
Once the /dev/cros_X file is created, we need the possibility to
access the same EC device, with the same, previously created file.
The only way to do that is to reused the already created
cros_ec_device structure.

> > +     if (!is_registered)
> > +             ec_usb =3D kzalloc(sizeof(*ec_usb), GFP_KERNEL);
> > +
> > +     if (!ec_usb)
> > +             return -ENOMEM;
> > +
> > +     if (!is_registered) {
> > +             mutex_init(&ec_usb->io_mutex);
> > +             ec_dev =3D kzalloc(sizeof(*ec_dev), GFP_KERNEL);
> > +             if (!ec_dev) {
> > +                     retval =3D -ENOMEM;
> > +                     goto error;
> > +             }
> > +             ec_usb->ec_dev =3D ec_dev;
> > +     } else {
> > +             ec_dev =3D ec_usb->ec_dev;
> > +     }
>
> The `!ec_usb` check is only needed after kzalloc(). Thus, the code block
> could be simplified to:
>
>         if (!is_registered) {
>                 ec_usb =3D kzalloc(...);
>                 if (!ec_usb)
>                         return -ENOMEM
>
>                 ec_dev =3D kzalloc(...);
>
>                 /* initialized ec_usb and ec_dev */
>                 mutex_init(...);
>                 ec_usb->...
>         }
>         ec_dev =3D ec_usb->ec_dev;
>

Make sense.

> > +
> > +     ec_usb->udev =3D usb_get_dev(usb_dev);
> > +     ec_usb->interface =3D usb_get_intf(intf);
>
> Maybe insert a blank line here.
>

Will do.

> > +     /* Use first bulk-in/out endpoints + int-in endpoint */
> > +     retval =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_=
in,
> > +                                        &bulk_out, &int_in, NULL);
> > +     if (retval) {
> > +             dev_err(if_dev,
> > +                     "Could not find bulk-in, bulk-out or int-in endpo=
int\n");
> > +             goto error;
> > +     }
>
> Maybe insert a blank line here.
>

Will do.

> > +     /* Bulk endpoints have to be capable of sending headers in one tr=
ansfer. */
> > +     if ((usb_endpoint_maxp(bulk_out) < sizeof(struct ec_host_request)=
) ||
> > +         (usb_endpoint_maxp(bulk_in) < sizeof(struct ec_host_response)=
) ||
> > +         (usb_endpoint_maxp(int_in)) < sizeof(struct int_msg)) {
> > +             retval =3D -ENOSPC;
> > +             dev_err(if_dev, "Incorrect max packet size\n");
> > +             goto error;
> > +     }
>
> Maybe insert a blank line here.
>

Will do.

> > +     ec_usb->bulk_out_pipe =3D
> > +             usb_sndbulkpipe(ec_usb->udev, bulk_out->bEndpointAddress)=
;
> > +     ec_usb->bulk_in_size =3D usb_endpoint_maxp(bulk_in);
> > +     ec_usb->bulk_in_pipe =3D
> > +             usb_rcvbulkpipe(ec_usb->udev, bulk_in->bEndpointAddress);
> > +     ec_usb->bulk_in_buffer =3D kmalloc(ec_usb->bulk_in_size, GFP_KERN=
EL);
> > +     if (!ec_usb->bulk_in_buffer) {
> > +             dev_err(if_dev, "Failed to allocate bulk in buffer\n");
> > +             retval =3D -ENOMEM;
> > +             goto error;
> > +     }
>
> Maybe insert a blank line here.
>

Wll do.

> > +     ec_usb->int_in_size =3D usb_endpoint_maxp(int_in);
> > +     ec_usb->int_in_pipe =3D
> > +             usb_rcvintpipe(ec_usb->udev, int_in->bEndpointAddress);
> > +     ec_usb->int_in_interval =3D int_in->bInterval;
> > +     ec_usb->int_in_buffer =3D kmalloc(ec_usb->int_in_size, GFP_KERNEL=
);
> > +     if (!ec_usb->int_in_buffer) {
> > +             dev_err(if_dev, "Failed to allocate int in buffer\n");
> > +             retval =3D -ENOMEM;
> > +             goto error;
> > +     }
> > +     ec_usb->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!ec_usb->int_in_urb) {
> > +             dev_err(if_dev, "Failed to allocate int in urb\n");
> > +             retval =3D -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     ec_dev->dev =3D if_dev;
> > +     ec_dev->phys_name =3D dev_name(if_dev);
> > +     if (!is_registered) {
> > +             ec_dev->priv =3D ec_usb;
> > +             /* EC uses int endpoint to signal events. */
> > +             ec_dev->irq =3D 0;
> > +             ec_dev->cmd_xfer =3D NULL;
> > +             ec_dev->pkt_xfer =3D do_cros_ec_pkt_xfer_usb;
> > +             ec_dev->din_size =3D sizeof(struct ec_host_response) +
> > +                             sizeof(struct ec_response_get_protocol_in=
fo);
> > +             ec_dev->dout_size =3D sizeof(struct ec_host_request) +
> > +                             sizeof(struct ec_params_rwsig_action);
> > +             INIT_WORK(&ec_usb->work_ec_evt, usb_evt_handler);
> > +             init_waitqueue_head(&ec_usb->resp_ready_wait);
> > +     } else {
> > +             /*
> > +              * We need to allocate dout and din buffers, because cros=
_ec_register
> > +              * won't be called. These buffers were freed once previou=
s usb device was
> > +              * disconnected. Use buffer sizes from the last query.
> > +              * The EC_HOST_EVENT_INTERFACE_READY event will be trigge=
red at the end
> > +              * of a boot, which calls cros_ec_query_all function, tha=
t reallocates
> > +              * buffers.
> > +              */
> > +             ec_dev->din =3D devm_kzalloc(ec_dev->dev, ec_dev->din_siz=
e, GFP_KERNEL);
> > +             if (!ec_dev->din) {
> > +                     retval =3D -ENOMEM;
> > +                     dev_err(if_dev, "Failed to allocate din buffer\n"=
);
> > +                     goto error;
> > +             }
> > +             ec_dev->dout =3D devm_kzalloc(ec_dev->dev, ec_dev->dout_s=
ize, GFP_KERNEL);
> > +             if (!ec_dev->dout) {
> > +                     retval =3D -ENOMEM;
> > +                     dev_err(if_dev, "Failed to allocate dout buffer\n=
");
> > +                     goto error;
> > +             }
> > +     }
>
> This whole block for initializing `ec_dev` can be done earlier. See anoth=
er
> `!is_registered` above.
>

Make sense to keep the code needed in !is_registered case together if
it is possible. I'll change that.

> > +
> > +     /* Needed by ec register function */
>
> Drop the comment.
>

Will do.

> > +     usb_set_intfdata(intf, ec_dev);
>
> This also can be done earlier when `ec_dev` is determined.
>

Will do.

> > +
> > +     mutex_lock(&ec_usb->io_mutex);
> > +     ec_usb->disconnected =3D false;
> > +     mutex_unlock(&ec_usb->io_mutex);
>
> Wondering if it really needs to acquire the lock? Probe functions usually
> don't need to as there is no possible concurrent paths yet.
>

That would be true for the first probing. Following probings can
happen when an ec device is already registered and
xfer function can be called during probing so I think it is more safe
to synchronize access to the disconnect variable.

> > [...]
> > +error:
> > +     /* Free allocated memory */
> > +     cros_ec_usb_delete(ec_usb);
>
> Be careful to make sure whether cancel_work_sync() works even if
> `&ec_usb->work_ec_evt` is uninitialized.
>

Good catch! cancel_work_sync() can not be used before the work_ec_evt init

> > +static void cros_ec_usb_disconnect(struct usb_interface *intf)
> > +{
> > +     struct cros_ec_device *ec_dev =3D usb_get_intfdata(intf);
> > +     struct cros_ec_usb *ec_usb =3D ec_dev->priv;
> > +
> > +     /* prevent more I/O from starting */
> > +     mutex_lock(&ec_usb->io_mutex);
> > +     ec_usb->disconnected =3D true;
> > +     mutex_unlock(&ec_usb->io_mutex);
> > +
> > +     cros_ec_usb_delete(ec_usb);
> > +
> > +     dev_info(&intf->dev, "Disconnected\n");
>
> This is the only dev_info() in the various callbacks. Consider to drop
> it if it might not very useful.
>

I'll remove that, kernel default logs are sufficient.

> > +static int cros_ec_usb_resume(struct usb_interface *intf)
> > +{
> > +     struct cros_ec_device *ec_dev =3D usb_get_intfdata(intf);
> > +     int err;
> > +
> > +     /* URB is killed during suspend. */
> > +     err =3D submit_int_urb(ec_dev);
> > +     if (err) {
> > +             dev_err(ec_dev->dev,
> > +                     "Failed to sumbit int urb after resume: %d\n", er=
r);
> > +     }
> > +
> > +     return 0;
>
> Doesn't it need to return `err`?
>

It needs, I'll change that.

> > +static int cros_ec_usb_post_reset(struct usb_interface *intf)
> > +{
> > +     struct cros_ec_device *ec_dev =3D usb_get_intfdata(intf);
> > +     struct cros_ec_usb *ec_usb =3D ec_dev->priv;
> > +     int err;
> > +
> > +     err =3D submit_int_urb(ec_dev);
> > +     if (err) {
> > +             dev_err(ec_dev->dev,
> > +                     "Failed to sumbit int urb after reset: %d\n", err=
);
> > +     }
> > +     mutex_unlock(&ec_usb->io_mutex);
> > +
> > +     return 0;
>
> Doesn't it need to return `err`?
>

It needs, I'll change that.

> > +static struct usb_driver cros_ec_usb =3D {
> > +     .name =3D "cros-ec-usb",
> > +     .probe =3D cros_ec_usb_probe,
> > +     .disconnect =3D cros_ec_usb_disconnect,
> > +     .suspend =3D cros_ec_usb_suspend,
> > +     .resume =3D cros_ec_usb_resume,
> > +     .pre_reset =3D cros_ec_usb_pre_reset,
> > +     .post_reset =3D cros_ec_usb_post_reset,
> > +     .id_table =3D cros_ec_usb_table,
> > +     /* Do not autosuspend EC */
> > +     .supports_autosuspend =3D 0,
> > +};
>
> Most .X callbacks are named cros_ec_usb_X. Only the .id_table is differen=
t.
> To be neat, I'd suggest to use `cros_ec_usb_id_table`.

Make sense.
