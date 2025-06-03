Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DC22D795
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949141; cv=none; b=rH41MaK1NNNYRdqhDBR4gJBSPuyOYCCAnAcJ5GC63gvHQ21tXtgKWRhmUm3Cg/zOpggTVtDD+1JJ9FgKf1r4VPSQ+ayZF1VsQhnhnk5NEQVBHABP3k7vifAIZuSx5oP+yNi+m2LQZbPvv6PhKWCAj6fu0c97ApRt/Bie9p6V2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949141; c=relaxed/simple;
	bh=qdh9/dDTAHJ1D1UfBX8nbhQ6ExAns2R+yt6F9EWW8Jc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OAaI9Sy8ABy5+lKIi/KeSxKNh7AA9minoFH1KEepvG/wk4h8GqIsWMjPpAqsBLWHb0JgrJ6lAthGUhqo/zBmnK9XjyTDXglFosBYAy9zfJsox6leopuqmk0t39seuC0wzmRBBMhWEtqUftcSJfIxlnDJUdUk2GrwW3nLLybD4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=X5BQGNtz; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="X5BQGNtz"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1BDFF240029
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1748949136; bh=qdh9/dDTAHJ1D1UfBX8nbhQ6ExAns2R+yt6F9EWW8Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=X5BQGNtzvlgXjSdalWTL3W6/XIIwefWOzV/Q1BJEcd2xQIFRDItGxZjD0LNIl0Uzr
	 fIk52n2jdy45XlCvxSU4Jsg1EkX6BLCwnsAGzSH2xbYPKfK9MfY3+o+1DNSNHafete
	 7LFKKFgGB7CjXtQSx//ECrr7nCHsCKxNXaj62Fcs7ZHWNSnzjrkcTWApS5+wqtU9DH
	 jzz4NIERMbu2DgBvesG9+Enm57j9YhNSIsbu2f5qor+kUD+Sv3dhEuzSViJ29IPvRa
	 FPFBEpOZO5Die9CnOwwSkv5qWvjM8ZNMLwrdCrR4jDV11XmAn0J9vh0egviR6b6V0M
	 PBs2q9Halu/Nw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bBSjC1K4Dz9rxB;
	Tue,  3 Jun 2025 13:12:15 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Alan Stern
 <stern@rowland.harvard.edu>,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: apple-mfi-fastcharge: Make power supply
 names unique
In-Reply-To: <5a610d364c8a8148e48d5bf7a95e73fc81650e5a.camel@hadess.net>
References: <20250602-apple-mfi-fastcharge-duplicate-sysfs-v1-1-5d84de34fac6@posteo.net>
	<5a610d364c8a8148e48d5bf7a95e73fc81650e5a.camel@hadess.net>
Date: Tue, 03 Jun 2025 11:12:04 +0000
Message-ID: <87r001uliz.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bastien Nocera <hadess@hadess.net> writes:

> On Mon, 2025-06-02 at 18:26 +0000, Charalampos Mitrodimas wrote:
>> When multiple Apple devices are connected concurrently, the
>> apple-mfi-fastcharge driver fails to probe the subsequent devices
>> with
>> the following error:
>>=20
>> =C2=A0=C2=A0=C2=A0 sysfs: cannot create duplicate filename
>> '/class/power_supply/apple_mfi_fastcharge'
>> =C2=A0=C2=A0=C2=A0 apple-mfi-fastcharge 5-2.4.3.3: probe of 5-2.4.3.3 fa=
iled with
>> error -17
>>=20
>> This happens because the driver uses a fixed power supply name
>> ("apple_mfi_fastcharge") for all devices, causing a sysfs name
>> conflict when a second device is connected.
>>=20
>> Fix this by generating unique names using the USB bus and device
>> number (e.g., "apple_mfi_fastcharge_5-12"). This ensures each
>> connected device gets a unique power supply entry in sysfs.
>>=20
>> The change requires storing a copy of the power_supply_desc structure
>> in the per-device mfi_device struct, since the name pointer needs to
>> remain valid for the lifetime of the power supply registration.
>>=20
>> Fixes: 249fa8217b84 ("USB: Add driver to control USB fast charge for
>> iOS devices")
>> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
>> ---
>> =C2=A0drivers/usb/misc/apple-mfi-fastcharge.c | 24 +++++++++++++++++++++=
--
>> -
>> =C2=A01 file changed, 21 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c
>> b/drivers/usb/misc/apple-mfi-fastcharge.c
>> index
>> ac8695195c13c8752076e4391ac81a9da3780c44..8e852f4b8262e6e8fcd33883be8
>> c5696f19b9ee9 100644
>> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
>> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
>> @@ -44,6 +44,7 @@ MODULE_DEVICE_TABLE(usb, mfi_fc_id_table);
>> =C2=A0struct mfi_device {
>> =C2=A0	struct usb_device *udev;
>> =C2=A0	struct power_supply *battery;
>> +	struct power_supply_desc battery_desc;
>> =C2=A0	int charge_type;
>> =C2=A0};
>> =C2=A0
>> @@ -178,6 +179,7 @@ static int mfi_fc_probe(struct usb_device *udev)
>> =C2=A0{
>> =C2=A0	struct power_supply_config battery_cfg =3D {};
>> =C2=A0	struct mfi_device *mfi =3D NULL;
>> +	char *battery_name;
>> =C2=A0	int err;
>> =C2=A0
>> =C2=A0	if (!mfi_fc_match(udev))
>> @@ -187,23 +189,38 @@ static int mfi_fc_probe(struct usb_device
>> *udev)
>> =C2=A0	if (!mfi)
>> =C2=A0		return -ENOMEM;
>> =C2=A0
>> +	battery_name =3D kasprintf(GFP_KERNEL,
>> "apple_mfi_fastcharge_%d-%d",
>> +				 udev->bus->busnum, udev->devnum);
>
> Looks fine to me although I don't know how common this construct is.
>
> If others think this won't work, you can use the ever increasing id as
> used in drivers/hid/hid-steelseries.c

Hi Bastien,

Thanks for the review!

FWIW, this has been tested in QEMU via,

      -device usb-host,bus=3Dehci.0,vendorid=3D0x05ac,productid=3D0x12a8
      -device usb-host,bus=3Dehci.0,vendorid=3D0x05ac,productid=3D0x12ab

And works as expected,

$ ls /sys/class/power_supply
apple_mfi_fastcharge_2_2  apple_mfi_fastcharge_2_3

C. Mitrodimas

>
> Cheers
>
>> +	if (!battery_name) {
>> +		err =3D -ENOMEM;
>> +		goto err_free_mfi;
>> +	}
>> +
>> +	mfi->battery_desc =3D apple_mfi_fc_desc;
>> +	mfi->battery_desc.name =3D battery_name;
>> +
>> =C2=A0	battery_cfg.drv_data =3D mfi;
>> =C2=A0
>> =C2=A0	mfi->charge_type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
>> =C2=A0	mfi->battery =3D power_supply_register(&udev->dev,
>> -						&apple_mfi_fc_desc,
>> +						&mfi->battery_desc,
>> =C2=A0						&battery_cfg);
>> =C2=A0	if (IS_ERR(mfi->battery)) {
>> =C2=A0		dev_err(&udev->dev, "Can't register battery\n");
>> =C2=A0		err =3D PTR_ERR(mfi->battery);
>> -		kfree(mfi);
>> -		return err;
>> +		goto err_free_name;
>> =C2=A0	}
>> =C2=A0
>> =C2=A0	mfi->udev =3D usb_get_dev(udev);
>> =C2=A0	dev_set_drvdata(&udev->dev, mfi);
>> =C2=A0
>> =C2=A0	return 0;
>> +
>> +err_free_name:
>> +	kfree(battery_name);
>> +err_free_mfi:
>> +	kfree(mfi);
>> +	return err;
>> =C2=A0}
>> =C2=A0
>> =C2=A0static void mfi_fc_disconnect(struct usb_device *udev)
>> @@ -213,6 +230,7 @@ static void mfi_fc_disconnect(struct usb_device
>> *udev)
>> =C2=A0	mfi =3D dev_get_drvdata(&udev->dev);
>> =C2=A0	if (mfi->battery)
>> =C2=A0		power_supply_unregister(mfi->battery);
>> +	kfree(mfi->battery_desc.name);
>> =C2=A0	dev_set_drvdata(&udev->dev, NULL);
>> =C2=A0	usb_put_dev(mfi->udev);
>> =C2=A0	kfree(mfi);
>>=20
>> ---
>> base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
>> change-id: 20250602-apple-mfi-fastcharge-duplicate-sysfs-0ef3864b21f8
>>=20
>> Best regards,
