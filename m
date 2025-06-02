Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B62C3259;
	Mon,  2 Jun 2025 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748890086; cv=none; b=eqhUQs1ajUUxWldFmdOof/lxv9qVkWc0TUXYb6iOnzmGzgVIJnE66DcvGH1f0fLYfRmTfRvPa4TksYrB8+kWXAbRSTbawr2pHM28LFkuEiQGgOrpZv/TEx1jezNCy5E8vc0fAKAOwNSDd98Hx826QDb7vIEQiVlZjLzgo1h205k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748890086; c=relaxed/simple;
	bh=cmN4E7QwYJkLiRF5DqyisjEoGNTL0dbj6ohx5Qglb9E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NRSVt2G7HLYB8BnsnXizwf2LUcAGaYChShSJS3vI7f3kDMpYWERAdA3xsTpCnmSd/vyMU6oT6xn8C1CWjpBwtH0Yoklog0rvlPYDQcsSGrscXl6iAM3ydj7wMX4TA/gzl8Ne+ZoBRJ37wG0OxkyH8SZLcUxG0vRzwT0eoPE2P2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4611843A70;
	Mon,  2 Jun 2025 18:48:01 +0000 (UTC)
Message-ID: <5a610d364c8a8148e48d5bf7a95e73fc81650e5a.camel@hadess.net>
Subject: Re: [PATCH] usb: misc: apple-mfi-fastcharge: Make power supply
 names unique
From: Bastien Nocera <hadess@hadess.net>
To: Charalampos Mitrodimas <charmitro@posteo.net>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 02 Jun 2025 20:48:00 +0200
In-Reply-To: <20250602-apple-mfi-fastcharge-duplicate-sysfs-v1-1-5d84de34fac6@posteo.net>
References: 
	<20250602-apple-mfi-fastcharge-duplicate-sysfs-v1-1-5d84de34fac6@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeegfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeifffgheettdeggfejgefgffeguedvgeevkeevjeefkeekudejheetffeufeffueenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheptghhrghrmhhithhrohesphhoshhtvghordhnvghtpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshhtvghrn
 hesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: hadess@hadess.net

On Mon, 2025-06-02 at 18:26 +0000, Charalampos Mitrodimas wrote:
> When multiple Apple devices are connected concurrently, the
> apple-mfi-fastcharge driver fails to probe the subsequent devices
> with
> the following error:
>=20
> =C2=A0=C2=A0=C2=A0 sysfs: cannot create duplicate filename
> '/class/power_supply/apple_mfi_fastcharge'
> =C2=A0=C2=A0=C2=A0 apple-mfi-fastcharge 5-2.4.3.3: probe of 5-2.4.3.3 fai=
led with
> error -17
>=20
> This happens because the driver uses a fixed power supply name
> ("apple_mfi_fastcharge") for all devices, causing a sysfs name
> conflict when a second device is connected.
>=20
> Fix this by generating unique names using the USB bus and device
> number (e.g., "apple_mfi_fastcharge_5-12"). This ensures each
> connected device gets a unique power supply entry in sysfs.
>=20
> The change requires storing a copy of the power_supply_desc structure
> in the per-device mfi_device struct, since the name pointer needs to
> remain valid for the lifetime of the power supply registration.
>=20
> Fixes: 249fa8217b84 ("USB: Add driver to control USB fast charge for
> iOS devices")
> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
> ---
> =C2=A0drivers/usb/misc/apple-mfi-fastcharge.c | 24 +++++++++++++++++++++-=
-
> -
> =C2=A01 file changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c
> b/drivers/usb/misc/apple-mfi-fastcharge.c
> index
> ac8695195c13c8752076e4391ac81a9da3780c44..8e852f4b8262e6e8fcd33883be8
> c5696f19b9ee9 100644
> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> @@ -44,6 +44,7 @@ MODULE_DEVICE_TABLE(usb, mfi_fc_id_table);
> =C2=A0struct mfi_device {
> =C2=A0	struct usb_device *udev;
> =C2=A0	struct power_supply *battery;
> +	struct power_supply_desc battery_desc;
> =C2=A0	int charge_type;
> =C2=A0};
> =C2=A0
> @@ -178,6 +179,7 @@ static int mfi_fc_probe(struct usb_device *udev)
> =C2=A0{
> =C2=A0	struct power_supply_config battery_cfg =3D {};
> =C2=A0	struct mfi_device *mfi =3D NULL;
> +	char *battery_name;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	if (!mfi_fc_match(udev))
> @@ -187,23 +189,38 @@ static int mfi_fc_probe(struct usb_device
> *udev)
> =C2=A0	if (!mfi)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	battery_name =3D kasprintf(GFP_KERNEL,
> "apple_mfi_fastcharge_%d-%d",
> +				 udev->bus->busnum, udev->devnum);

Looks fine to me although I don't know how common this construct is.

If others think this won't work, you can use the ever increasing id as
used in drivers/hid/hid-steelseries.c

Cheers

> +	if (!battery_name) {
> +		err =3D -ENOMEM;
> +		goto err_free_mfi;
> +	}
> +
> +	mfi->battery_desc =3D apple_mfi_fc_desc;
> +	mfi->battery_desc.name =3D battery_name;
> +
> =C2=A0	battery_cfg.drv_data =3D mfi;
> =C2=A0
> =C2=A0	mfi->charge_type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> =C2=A0	mfi->battery =3D power_supply_register(&udev->dev,
> -						&apple_mfi_fc_desc,
> +						&mfi->battery_desc,
> =C2=A0						&battery_cfg);
> =C2=A0	if (IS_ERR(mfi->battery)) {
> =C2=A0		dev_err(&udev->dev, "Can't register battery\n");
> =C2=A0		err =3D PTR_ERR(mfi->battery);
> -		kfree(mfi);
> -		return err;
> +		goto err_free_name;
> =C2=A0	}
> =C2=A0
> =C2=A0	mfi->udev =3D usb_get_dev(udev);
> =C2=A0	dev_set_drvdata(&udev->dev, mfi);
> =C2=A0
> =C2=A0	return 0;
> +
> +err_free_name:
> +	kfree(battery_name);
> +err_free_mfi:
> +	kfree(mfi);
> +	return err;
> =C2=A0}
> =C2=A0
> =C2=A0static void mfi_fc_disconnect(struct usb_device *udev)
> @@ -213,6 +230,7 @@ static void mfi_fc_disconnect(struct usb_device
> *udev)
> =C2=A0	mfi =3D dev_get_drvdata(&udev->dev);
> =C2=A0	if (mfi->battery)
> =C2=A0		power_supply_unregister(mfi->battery);
> +	kfree(mfi->battery_desc.name);
> =C2=A0	dev_set_drvdata(&udev->dev, NULL);
> =C2=A0	usb_put_dev(mfi->udev);
> =C2=A0	kfree(mfi);
>=20
> ---
> base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> change-id: 20250602-apple-mfi-fastcharge-duplicate-sysfs-0ef3864b21f8
>=20
> Best regards,
