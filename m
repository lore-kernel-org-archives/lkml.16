Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E91990CD
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738319048; cv=none; b=pk6AcugwSuHQ0WVhl83ZaNVmSKpyQHDg6Ja9sgNNHX6wzQXRZIcLQOuhHVP6Hy2TYaFPIXdqIr/IWbn49Yt2vy8Nm6jZgeeZwvNJ7IuQwKyZ4cNzy6eiC9xm9t1s+Izd7fZwYU2Crt5n+eB4xbCJajCaodqVrW0HEB0BaVXDxuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738319048; c=relaxed/simple;
	bh=voqM6WmLX6xk8ADXCQlYDoh/yTYHiieG52DBNCR2a90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byqE0hIVnKpEZBe0gbn68pAA8nijVybcdMsdeFQt7cAHM3WLvhz+Makyg/MiabjWmnifmwrXvHvoop4ZS4yJQOghyPLU1XTVTxmcfTX6BeQZWjNNeumMwOQ0ozxWo7ycJiYPMoeTQqLjDwzgsQ4Se03LF5O/lSIECv1MdLLGNjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K9HhTJ5L; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9HhTJ5L"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso2496457276.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738319044; x=1738923844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8t9eayVooAqw0aTM2ypHgHw6H1UFf5cda0M6T4xZHg=;
        b=K9HhTJ5L4Z8NlEXHEWqy9y3Q5NvX91IhHCkpf1LAaUcxgX/yDnfnU6qVSElD3211pa
         4DG5SRa0DoiSMDYFJPP7KlzNICkE7ZYkWZuRKOrZbmtQajwomZ25tfG8lI1zg4lzxLcn
         C+U8wy04AxVIuRAzKcXmtBJ9/HCl/va1oixfAufkznpUTxIRWQP5ZJH87OcY8WgriXou
         GrWKrGJFEdnNELFStfDVdmy+pGFNBF1FYwrlxJ+mNyEfhr+PjMGnQK3byr/4QFOy0QxD
         egd2QjwAUYdxCFb0YN0jZYnw1rWbEIlIt2kzxhJ5E+xuqokWBygDPp5J+Ok4/VurOyZx
         lrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738319044; x=1738923844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8t9eayVooAqw0aTM2ypHgHw6H1UFf5cda0M6T4xZHg=;
        b=v09WsG4P5eI47aH1Bv2onu6vSG3eTg663bo3OHDBSvjI0e+TdE0fxtBJcyUOhlla4L
         /Sa1bkZJtZeBoH/WNdBlc445EXP81D/2HtClmpgub1Nx7ccu2vIeL6AViyBQBJ38cVci
         yYRQwytDyqsm2qB+345V+6gJRNMwMg3tkP2d+c9PgEIsEGt7nEuPHGnR6Xh2xjDQSQzY
         k9ng1JaWbS3jdl6bTIoJYjGdEsMsx/UG9tmMVAh2SDESmIFozJoqtp7qWHYMYBwfj46R
         nkku+oI3EVb40R8Q9SKymnqn/UQdieVu/mjrLgZhwLFy5M2WbumqDDRgnRzdvaipkFX5
         weiA==
X-Forwarded-Encrypted: i=1; AJvYcCV149tRy1I4aIcZmee4icQ22m9GnEDh1n9nG6qiR8uwcP6btwXnTFS7IWZN9y/3X0MNwj8Hf2tYzxikRGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2hHoSKygSxma/Dy+O2MSq8a3AyqHE8SINQZdmUB85BhisOzQ
	kePoj/4/SLcVTDjan2zP+3NwhR2NM2hvRAlxLjfms3EJ6zmMvoialgc+h1W6tEVMGDCiVTfkM/a
	Aje6pGoyn0a9iyq2nPmDLx69FPkkJXHeJ3uwm
X-Gm-Gg: ASbGncvd5g1HTq/cEwpL2N80d4QX8RM0J4aTyYtx3RPifj7XiCOyCR6oKA4y1DGTUvH
	GAtrXl+8QDjeecj0ylmJTnN9rhzwCNAFEcmuqvtVG6wPqKc933h6VW4EHxwuahng51lUrdEGbdQ
	==
X-Google-Smtp-Source: AGHT+IGNlM90eo6Ac+mrXIQPMdixVoITPynenNrrm+OHTZY6jkoKERSo/jQVF5mvN11m+hOYB8/I/nI4ILZ0BA4FNm4=
X-Received: by 2002:a05:6902:18d5:b0:e58:148c:ea39 with SMTP id
 3f1490d57ef6-e58a492f78fmr8470689276.0.1738319043812; Fri, 31 Jan 2025
 02:24:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122131925.v2.1.If6f14aa2512336173a53fc3552756cd8a332b0a3@changeid>
 <CABBYNZKoXT4u4=KJZUvG4g1OEi+xQ-LchiH8gvEZURNTzJoQDw@mail.gmail.com>
 <CADg1FFdt2mQsN4YjLTn=zp_+MahopN371EDiXQEbp+GTSaNtBg@mail.gmail.com>
 <CABBYNZJ__OMJZtEE0BFpaUdKPQv+Ym-OnsJj-kN=i_gZCeVN5w@mail.gmail.com> <CABBYNZ+aEpJNnz1OSAeqOxFf4s2AbvoRC+FJcRS6y5+g0Mmu+g@mail.gmail.com>
In-Reply-To: <CABBYNZ+aEpJNnz1OSAeqOxFf4s2AbvoRC+FJcRS6y5+g0Mmu+g@mail.gmail.com>
From: Hsin-chen Chuang <chharry@google.com>
Date: Fri, 31 Jan 2025 18:23:36 +0800
X-Gm-Features: AWEUYZlvBhUKG1FGwUwM5DkxBWCAXF4Ltd6iMA4miIJd4zr0fe5wCm9YaaV28XE
Message-ID: <CADg1FFfhwAFD+mthx3qw_ZUtt6=1Y6pR+jX7+etwMhQFX9Ja+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Bluetooth: Fix possible race with userspace of
 sysfs isoc_alt
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, 
	chromeos-bluetooth-upstreaming@chromium.org, 
	Hsin-chen Chuang <chharry@chromium.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Ying Hsu <yinghsu@chromium.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

Good point. Although the sysfs-bus-usb API only supports reading
rather than writing the alt setting, I'll look for the opportunity to
configure it through libusb first.

Thanks

On Sat, Jan 25, 2025 at 12:06=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Hsin-chen,
>
> On Fri, Jan 24, 2025 at 10:54=E2=80=AFAM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Hsin-chen,
> >
> > On Wed, Jan 22, 2025 at 11:57=E2=80=AFPM Hsin-chen Chuang <chharry@goog=
le.com> wrote:
> > >
> > > Hi Luiz,
> > >
> > > On Thu, Jan 23, 2025 at 3:35=E2=80=AFAM Luiz Augusto von Dentz
> > > <luiz.dentz@gmail.com> wrote:
> > > >
> > > > Hi Hsin-chen,
> > > >
> > > > On Wed, Jan 22, 2025 at 12:20=E2=80=AFAM Hsin-chen Chuang <chharry@=
google.com> wrote:
> > > > >
> > > > > From: Hsin-chen Chuang <chharry@chromium.org>
> > > > >
> > > > > Use device group to avoid the racing. To reuse the group defined =
in
> > > > > hci_sysfs.c, defined 2 callbacks switch_usb_alt_setting and
> > > > > read_usb_alt_setting which are only registered in btusb.
> > > > >
> > > > > Fixes: b16b327edb4d ("Bluetooth: btusb: add sysfs attribute to co=
ntrol USB alt setting")
> > > > > Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
> > > > > ---
> > > > >
> > > > > (no changes since v1)
> > > > >
> > > > >  drivers/bluetooth/btusb.c        | 42 ++++++++------------------=
------
> > > > >  include/net/bluetooth/hci_core.h |  2 ++
> > > > >  net/bluetooth/hci_sysfs.c        | 33 +++++++++++++++++++++++++
> > > > >  3 files changed, 45 insertions(+), 32 deletions(-)
> > > > >
> > > > > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.=
c
> > > > > index 75a0f15819c4..bf210275e5b7 100644
> > > > > --- a/drivers/bluetooth/btusb.c
> > > > > +++ b/drivers/bluetooth/btusb.c
> > > > > @@ -2221,6 +2221,13 @@ static int btusb_switch_alt_setting(struct=
 hci_dev *hdev, int new_alts)
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +static int btusb_read_alt_setting(struct hci_dev *hdev)
> > > > > +{
> > > > > +       struct btusb_data *data =3D hci_get_drvdata(hdev);
> > > > > +
> > > > > +       return data->isoc_altsetting;
> > > > > +}
> > > > > +
> > > > >  static struct usb_host_interface *btusb_find_altsetting(struct b=
tusb_data *data,
> > > > >                                                         int alt)
> > > > >  {
> > > > > @@ -3650,32 +3657,6 @@ static const struct file_operations force_=
poll_sync_fops =3D {
> > > > >         .llseek         =3D default_llseek,
> > > > >  };
> > > > >
> > > > > -static ssize_t isoc_alt_show(struct device *dev,
> > > > > -                            struct device_attribute *attr,
> > > > > -                            char *buf)
> > > > > -{
> > > > > -       struct btusb_data *data =3D dev_get_drvdata(dev);
> > > > > -
> > > > > -       return sysfs_emit(buf, "%d\n", data->isoc_altsetting);
> > > > > -}
> > > > > -
> > > > > -static ssize_t isoc_alt_store(struct device *dev,
> > > > > -                             struct device_attribute *attr,
> > > > > -                             const char *buf, size_t count)
> > > > > -{
> > > > > -       struct btusb_data *data =3D dev_get_drvdata(dev);
> > > > > -       int alt;
> > > > > -       int ret;
> > > > > -
> > > > > -       if (kstrtoint(buf, 10, &alt))
> > > > > -               return -EINVAL;
> > > > > -
> > > > > -       ret =3D btusb_switch_alt_setting(data->hdev, alt);
> > > > > -       return ret < 0 ? ret : count;
> > > > > -}
> > > > > -
> > > > > -static DEVICE_ATTR_RW(isoc_alt);
> > > > > -
> > > > >  static int btusb_probe(struct usb_interface *intf,
> > > > >                        const struct usb_device_id *id)
> > > > >  {
> > > > > @@ -4040,9 +4021,8 @@ static int btusb_probe(struct usb_interface=
 *intf,
> > > > >                 if (err < 0)
> > > > >                         goto out_free_dev;
> > > > >
> > > > > -               err =3D device_create_file(&intf->dev, &dev_attr_=
isoc_alt);
> > > > > -               if (err)
> > > > > -                       goto out_free_dev;
> > > > > +               hdev->switch_usb_alt_setting =3D btusb_switch_alt=
_setting;
> > > > > +               hdev->read_usb_alt_setting =3D btusb_read_alt_set=
ting;
> > > > >         }
> > > > >
> > > > >         if (IS_ENABLED(CONFIG_BT_HCIBTUSB_BCM) && data->diag) {
> > > > > @@ -4089,10 +4069,8 @@ static void btusb_disconnect(struct usb_in=
terface *intf)
> > > > >         hdev =3D data->hdev;
> > > > >         usb_set_intfdata(data->intf, NULL);
> > > > >
> > > > > -       if (data->isoc) {
> > > > > -               device_remove_file(&intf->dev, &dev_attr_isoc_alt=
);
> > > > > +       if (data->isoc)
> > > > >                 usb_set_intfdata(data->isoc, NULL);
> > > > > -       }
> > > > >
> > > > >         if (data->diag)
> > > > >                 usb_set_intfdata(data->diag, NULL);
> > > > > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluet=
ooth/hci_core.h
> > > > > index f756fac95488..5d3ec5ff5adb 100644
> > > > > --- a/include/net/bluetooth/hci_core.h
> > > > > +++ b/include/net/bluetooth/hci_core.h
> > > > > @@ -641,6 +641,8 @@ struct hci_dev {
> > > > >                                      struct bt_codec *codec, __u8=
 *vnd_len,
> > > > >                                      __u8 **vnd_data);
> > > > >         u8 (*classify_pkt_type)(struct hci_dev *hdev, struct sk_b=
uff *skb);
> > > > > +       int (*switch_usb_alt_setting)(struct hci_dev *hdev, int n=
ew_alts);
> > > > > +       int (*read_usb_alt_setting)(struct hci_dev *hdev);
> > > > >  };
> > > > >
> > > > >  #define HCI_PHY_HANDLE(handle) (handle & 0xff)
> > > > > diff --git a/net/bluetooth/hci_sysfs.c b/net/bluetooth/hci_sysfs.=
c
> > > > > index 041ce9adc378..887aa1935b1e 100644
> > > > > --- a/net/bluetooth/hci_sysfs.c
> > > > > +++ b/net/bluetooth/hci_sysfs.c
> > > > > @@ -102,8 +102,41 @@ static ssize_t reset_store(struct device *de=
v, struct device_attribute *attr,
> > > > >  }
> > > > >  static DEVICE_ATTR_WO(reset);
> > > > >
> > > > > +static ssize_t isoc_alt_show(struct device *dev,
> > > > > +                            struct device_attribute *attr,
> > > > > +                            char *buf)
> > > > > +{
> > > > > +       struct hci_dev *hdev =3D to_hci_dev(dev);
> > > > > +
> > > > > +       if (hdev->read_usb_alt_setting)
> > > > > +               return sysfs_emit(buf, "%d\n", hdev->read_usb_alt=
_setting(hdev));
> > > > > +
> > > > > +       return -ENODEV;
> > > > > +}
> > > > > +
> > > > > +static ssize_t isoc_alt_store(struct device *dev,
> > > > > +                             struct device_attribute *attr,
> > > > > +                             const char *buf, size_t count)
> > > > > +{
> > > > > +       struct hci_dev *hdev =3D to_hci_dev(dev);
> > > > > +       int alt;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (kstrtoint(buf, 10, &alt))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (hdev->switch_usb_alt_setting) {
> > > > > +               ret =3D hdev->switch_usb_alt_setting(hdev, alt);
> > > > > +               return ret < 0 ? ret : count;
> > > > > +       }
> > > > > +
> > > > > +       return -ENODEV;
> > > > > +}
> > > > > +static DEVICE_ATTR_RW(isoc_alt);
> > > > > +
> > > > >  static struct attribute *bt_host_attrs[] =3D {
> > > > >         &dev_attr_reset.attr,
> > > > > +       &dev_attr_isoc_alt.attr,
> > > > >         NULL,
> > > > >  };
> > > > >  ATTRIBUTE_GROUPS(bt_host);
> > > >
> > > > While this fixes the race it also forces the inclusion of an attrib=
ute
> > > > that is driver specific, so I wonder if we should introduce some
> > > > internal interface to register driver specific entries like this.
> > >
> > > Do you mean you prefer the original interface that only exports the
> > > attribute when isoc_altsetting is supported?
> > > Agree it makes more sense but I hit the obstacle: hci_init_sysfs is
> > > called earlier than data->isoc is determined. I need some time to
> > > verify whether changing the order won't break anything.
> >
> > We might have to do something like the following within hci_init_sysfs:
> >
> > if (hdev->isoc_alt)
> >     dev->type =3D bt_host_isoc_alt
> > else
> >     dev->type =3D bt_host
> >
> > Now perhaps instead of adding the callbacks to hdev we add the
> > attribute itself, btw did you check if there isn't a sysfs entry to
> > interact with USB alternate settings? Because contrary to reset this
> > actually operates directly on the driver bus so it sort of made more
> > sense to me that this would be handled by USB rather than Bluetooth.
>
> A quick git grep shows that this exists:
>
> Documentation/ABI/testing/sysfs-bus-usb:What:
> /sys/bus/usb/devices/usbX/bAlternateSetting
>
> > > >
> > > > > --
> > > > > 2.48.1.262.g85cc9f2d1e-goog
> > > > >
> > > >
> > > >
> > > > --
> > > > Luiz Augusto von Dentz
> >
> >
> >
> > --
> > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
