Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF01BEF84;
	Thu, 30 Jan 2025 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263077; cv=none; b=SvfvXeWV7dLOrmL/bMkSXawR0OJDtyt+ZUqxAhAgzi2FNwXgTG5H7CZTpmUN/+FhQLdhkyuiCOLoZC16svrExljKo7iFmW8ng4CrUsGBIJBQeUJkkPAmU+oKz2ePjuF9XCPg2Elj9ilwc2tz0Y678qB9aK8sL7gIBvvqRYjMUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263077; c=relaxed/simple;
	bh=AY6y/Upb7xXfL5BBLdq3Flb4SGxbpApJndQuezqqpz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR5W4KTaWkQxbbi7gFobichln5hvHvl2/MmthKYp5WnKQR3wzc7jPBE4UIPb0gFaDpuq/dCTI7Aem9eG8/8JLIj9/j2COeO/Q5o27LHaHAE6ifFDtH4SzP6QHAyEL9TbXWmgW8nv9hG7EfvMSn9d6bPwWIqOHkK743sE0WC9KY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YrsFpKD7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YrsFpKD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738263070;
	bh=AY6y/Upb7xXfL5BBLdq3Flb4SGxbpApJndQuezqqpz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrsFpKD7eZDdv+tfF90Ff6tZPSeDK2ReNTXoy/RmwQvNENlgptTdQH6bCuI0lNXEu
	 Ja+svrVPArVXSgDxHIbcMIvBF+MiBVI3Maz8EpyiY4HLH/q3YCg97kiV2d5FeMu/pO
	 OLzvACfPQLNk+DCK4jzixWrga5tcgaZ7pm3Pn8GM=
Date: Thu, 30 Jan 2025 19:51:09 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Kurt Borja <kuurtb@gmail.com>, W_Armin@gmx.de, 
	ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <c952132b-c0ef-4f8d-a93c-46cdb8f5cad3@t-8ch.de>
References: <20250118202632.8352-1-josh@joshuagrisham.com>
 <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
 <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com>
 <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
 <628d5725-2d20-4298-862d-ad0e47782d15@t-8ch.de>
 <CAMF+KeaM2DhOX3h+HyUBDXp9xNtFAuw+7ooZp1XEJQxdp6CVKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+KeaM2DhOX3h+HyUBDXp9xNtFAuw+7ooZp1XEJQxdp6CVKg@mail.gmail.com>

On 2025-01-30 18:17:47+0100, Joshua Grisham wrote:
> Den tis 28 jan. 2025 kl 22:17 skrev Thomas Weißschuh <linux@weissschuh.net>:
> >
> > Hi Joshua,
> >
> > sorry for the late reply.
> >
> > On 2025-01-28 20:17:53+0100, Joshua Grisham wrote:
> > > Thank you Kurt!
> > >
> > > Den lör 25 jan. 2025 kl 16:06 skrev Kurt Borja <kuurtb@gmail.com>:
> > > >
> > > > Now I understand the original problem better. I didn't consider this
> > > > possibility when designing the callback.
> > > >
> > > > While this is a fine solution I believe Thomas' EOPNOTSUPP solution is
> > > > the way to go. I think positive err value would be the safest but you
> > > > should wait for the advice of someone with more experience.
> > > >
> > > > Aside from that I really like how the whole platform profile sections
> > > > works now. Good design choices :)
> > > >
> > > > ~ Kurt
> > > >
> > > > > <snip>
> > >
> > > Regarding using this positive error code internally within the module,
> > > I thought about maybe adding a comment to galaxybook_probe() before
> > > all of the inits which describe this a bit -- do you all think this
> > > will be helpful or is it clear enough / does not matter and can be
> > > skipped?
> >
> > To me that sounds reasonable.
> >
> > <snip>
> >
> > > If this comment (you all are welcome to suggest wording tweaks as
> > > well, of course!) plus the few other small tweaks make sense then I
> > > can prep this to send as a new version. But I am holding a bit in
> > > hopes that the 6.14 stuff gets merged to pdx86 for-next so that I can
> > > go ahead with implementing Thomas's new power supply extension
> > > interface at the same time.
> >
> > Nice :-)
> >
> > <snip>
> 
> Hi Thomas! I have been looking into this now and it seems I have
> gotten it working using the new power_supply_register_extension
> without too much fuss. It seems like a nice API but especially helpful
> when there are multiple attributes (in this case there is only 1, but
> still feels "nicer" than manually creating sysfs files!).

There are also some functional improvements :-)

> One thing I noticed was that, as I still needed a pointer to the
> battery's struct power_supply, then it seemed to still work best if I
> left in the existing battery hook (devm_battery_hook_register) and
> then within the add_battery callback I could take the pointer to the
> struct power_supply to hang my new power_supply_ext onto.  Essentially
> much of the code for the "init" + using a battery hook that I had from
> before is still the same, I have just replaced manually creating the
> sysfs file (and its show/store callbacks) with the extension and then
> implemented the callbacks to get/set the value from power_supply_ext
> instead. Does this sound basically as you would have expected?

Yes.

> Regarding the possibility for the module to be loaded multiple times
> and/or if one of these devices suddenly had multiple battery devices,
> is there anything within power supply extension framework that will
> handle multiple instances (e.g. auto-appending a number to the name or
> something like with LED classes) or would this case need to be somehow
> covered in each individual implementation (e.g. samsung-galaxybook)?

First some nitpicking about the wording:
A module can only ever be loaded once at the same time.
However the driver from the module can be probed and bound multiple
times.

The extensions are hanging off the original struct power_supply.
The battery hook will be called for each battery and then it can add a
dedicated extension instance for each one.

> I had not really covered this so well either when just manually
> creating the sysfs attribute (working assumption is that
> device_create_file() would have failed if trying to create the same
> file more than once under the same battery device, which would have
> lead to a probe fail and the module unloaded for this "second"
> instance ? ) and not sure what exactly the best approach would be
> without giving it a bit more thought.. but maybe you can think about
> this a bit when I send v9 of the patch up in just a few minutes :)
>
> This is again a super "corner case" and it would certainly be very
> weird if one of these devices suddenly had multiple instances of one
> of the supporting ACPI device IDs so I am not sure if it would ever
> really be a reasonable possibility. More than one battery in the same
> device seems more likely, but not super reasonable either given that
> one of the hallmarks of these devices is "thin and light" then I would
> guess it is not likely there would ever be one with multiple
> batteries?

More than one battery should work fine. Your hook gets called for each.
If you think that doesn't make sense just restrict the hook to a single
instance. For an example see drivers/power/supply/cros_charge-control.c
The same can be done for ACPI device, but I think many drivers share
this issue and don't have any handling for that.
