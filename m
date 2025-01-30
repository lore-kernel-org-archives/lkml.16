Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE51990DB;
	Thu, 30 Jan 2025 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257483; cv=none; b=IfzrOq7qQ0ZQLNwnbb1ekLg6cdymRU22LLZUiLEU6PtI9+Dz8mMWqpFPTgdZu7yA/QXsgW4QuNZ/mxZ6TbwXOUNASJkCOD8tGx+QlKSsjU7rMhhmMPO0V1qd2yzg2i7segEu5E5GWEoO2oh6P3npsixCV7+hU2AXd4Nqf9Dfvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257483; c=relaxed/simple;
	bh=9gTvRHRkIlZqDYfX6uhQNaJ6+6lK0AzkjMBYf2UPKiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRVqPE4pzCdnbWgWBg6BtYXuwWcfosFRl2bPKc2IIxsXlkW7uNRNhPw8XpXvk1XdHVj/dpgrVrEEjQmm7/UgpAt+UurqkzowS/MwtiJwcOLDrh990WmXAvIPUjTHA+YJSOACDYgIoAO8wVpsuLbhmY6vuR/n3T48ss+7+8cw79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-852050432a8so27910339f.1;
        Thu, 30 Jan 2025 09:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257481; x=1738862281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlNOowEybkwCblx5jfYIVRUBDwuBAkb0orVJPUE3G48=;
        b=dqZvR/77HdmqJVfnh/wLlpmJ/eekWd9QtSQXdhmbwrmiH2GYgqnz98w/LtzhWqwNal
         yo8vjanCCbF60SACkZKMnLRUTrqgR96MtEiu8mVDetkyrVqXRDr7+OvUNbWZJV7Oupnf
         BHTVMQ1mtq2big5RPm5hIFn/+vxhzIbIYN65E8w31N6RUQBFTfXBZxGIVMRJEfQcyRwV
         LjYQvNQhp6CJfB1yA03kxmaQ02DrMcctOVanDngYdSCAqe5vaRIYPTZT6n5M1T3C6W8l
         gzZTE7CEK3yTxh7sn4qX3dFx7sd/7bWkNAtJvBJYlhzS1FXdCR5dCqGpj7SD+L4lODy3
         U0mg==
X-Forwarded-Encrypted: i=1; AJvYcCUh8gcE94buH65rhjVfC8Q00x5uqQVAqs41xN/JXNUQFqQInjBbw+Qnp0DufbIozox7eEdC9nugb8HM7jFU@vger.kernel.org, AJvYcCUyTPIxrr4//uB5a4f9ycCT739eBpsIcu1/7DarASgKArXheSF85C1K6Te0hSLvpzvS0HSuzvChiQFZMzCf1S6e/C/5Og==@vger.kernel.org, AJvYcCXX1iUF5j5ZGpeiCP0FI98pPKfmVPoGL4qfjmFAd8FrJR3PZe7FAwAcGBlS/chay4JtG+qNfy4iRK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4gRcqKrpW3osT6Ui9tXHkV6SD5U0Tppgj3FlVSwtLwm8S25DR
	KiLeobyZc2qgiAnlBiBiYk2DQWhyx7c1myMgkK1TnJUHz3UVMXXxbtcFrVsX
X-Gm-Gg: ASbGncslgQGGttKEjIJvHCJEqwZvh0DH3He5i136xCWy/6W+Du5sDISpkGgi8iyjXCm
	0cK8W8+wxOECr84RMl0BQTYKUVw4BJch0WWv5kfR8QtZ6P6H8DHcoohjGTALoVvXmvmM3aaKCjy
	R7E3O/c63k9qkwWpy8CeiK60n5twX86uoEEhBdu2Vhrrt/Yh94LM/O1TsBGV40K+TGwkr8EIyLm
	zavVeo0jycyzFxHSEsbFwIKnAEbkZ7pfhLcHZ2uf3HJe6BIaEth2h4Z7UhDSB9B07ZN2hUrJO7E
	rzUGclywDcEo194q8ip7ZT3YFIQ2wEClp9C4eyEB15ULvX0wdbuKOqUE
X-Google-Smtp-Source: AGHT+IFaHQKzscxFprMP5hB9L9EiUxSvhusOdMNcOftQ+SD/fvPAkpYoVpDJZ3qbPak2WUmEHZx4Cg==
X-Received: by 2002:a5d:8401:0:b0:835:39a8:e201 with SMTP id ca18e2360f4ac-854ac0a13f0mr41344439f.0.1738257480789;
        Thu, 30 Jan 2025 09:18:00 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec745b47c7sm418544173.36.2025.01.30.09.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:18:00 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-84a012f7232so59461639f.0;
        Thu, 30 Jan 2025 09:18:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqzWuAtVSCO4gtCvD80kkxEih40FRvU8WlwA2EG8/cPPmg0JaaxKCLLBOwACWllC31BO2vfFrzprokBZGz@vger.kernel.org, AJvYcCVlno143u9rO51aQAx/8CIq9ap5V+oxhCLhqKT9XEQ2s4+nBwtT4gi2zuYLM+406tPyuIsxCmXqJC8=@vger.kernel.org, AJvYcCX24XE+h0n+sLWF2cn1j25pn2TgbLhPq4+h9GhYzsV8wveKDapRr58rBsM+ynwyFSTDDGc1cTc6qeupqIe6+pYcZGPlRg==@vger.kernel.org
X-Received: by 2002:a05:6e02:148a:b0:3ce:7a51:c08c with SMTP id
 e9e14a558f8ab-3d0129eedd3mr5086315ab.2.1738257479767; Thu, 30 Jan 2025
 09:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118202632.8352-1-josh@joshuagrisham.com> <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
 <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com> <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
 <628d5725-2d20-4298-862d-ad0e47782d15@t-8ch.de>
In-Reply-To: <628d5725-2d20-4298-862d-ad0e47782d15@t-8ch.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Thu, 30 Jan 2025 18:17:47 +0100
X-Gmail-Original-Message-ID: <CAMF+KeaM2DhOX3h+HyUBDXp9xNtFAuw+7ooZp1XEJQxdp6CVKg@mail.gmail.com>
X-Gm-Features: AWEUYZl0CCjomV_FmbOwzurpFIP1VeEd-LtnRiM4rI7l7Vsz6YOYqUK8RvM3AoQ
Message-ID: <CAMF+KeaM2DhOX3h+HyUBDXp9xNtFAuw+7ooZp1XEJQxdp6CVKg@mail.gmail.com>
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Kurt Borja <kuurtb@gmail.com>, W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den tis 28 jan. 2025 kl 22:17 skrev Thomas Wei=C3=9Fschuh <linux@weissschuh=
.net>:
>
> Hi Joshua,
>
> sorry for the late reply.
>
> On 2025-01-28 20:17:53+0100, Joshua Grisham wrote:
> > Thank you Kurt!
> >
> > Den l=C3=B6r 25 jan. 2025 kl 16:06 skrev Kurt Borja <kuurtb@gmail.com>:
> > >
> > > Now I understand the original problem better. I didn't consider this
> > > possibility when designing the callback.
> > >
> > > While this is a fine solution I believe Thomas' EOPNOTSUPP solution i=
s
> > > the way to go. I think positive err value would be the safest but you
> > > should wait for the advice of someone with more experience.
> > >
> > > Aside from that I really like how the whole platform profile sections
> > > works now. Good design choices :)
> > >
> > > ~ Kurt
> > >
> > > > <snip>
> >
> > Regarding using this positive error code internally within the module,
> > I thought about maybe adding a comment to galaxybook_probe() before
> > all of the inits which describe this a bit -- do you all think this
> > will be helpful or is it clear enough / does not matter and can be
> > skipped?
>
> To me that sounds reasonable.
>
> <snip>
>
> > If this comment (you all are welcome to suggest wording tweaks as
> > well, of course!) plus the few other small tweaks make sense then I
> > can prep this to send as a new version. But I am holding a bit in
> > hopes that the 6.14 stuff gets merged to pdx86 for-next so that I can
> > go ahead with implementing Thomas's new power supply extension
> > interface at the same time.
>
> Nice :-)
>
> <snip>

Hi Thomas! I have been looking into this now and it seems I have
gotten it working using the new power_supply_register_extension
without too much fuss. It seems like a nice API but especially helpful
when there are multiple attributes (in this case there is only 1, but
still feels "nicer" than manually creating sysfs files!).

One thing I noticed was that, as I still needed a pointer to the
battery's struct power_supply, then it seemed to still work best if I
left in the existing battery hook (devm_battery_hook_register) and
then within the add_battery callback I could take the pointer to the
struct power_supply to hang my new power_supply_ext onto.  Essentially
much of the code for the "init" + using a battery hook that I had from
before is still the same, I have just replaced manually creating the
sysfs file (and its show/store callbacks) with the extension and then
implemented the callbacks to get/set the value from power_supply_ext
instead. Does this sound basically as you would have expected?

Regarding the possibility for the module to be loaded multiple times
and/or if one of these devices suddenly had multiple battery devices,
is there anything within power supply extension framework that will
handle multiple instances (e.g. auto-appending a number to the name or
something like with LED classes) or would this case need to be somehow
covered in each individual implementation (e.g. samsung-galaxybook)?

I had not really covered this so well either when just manually
creating the sysfs attribute (working assumption is that
device_create_file() would have failed if trying to create the same
file more than once under the same battery device, which would have
lead to a probe fail and the module unloaded for this "second"
instance ? ) and not sure what exactly the best approach would be
without giving it a bit more thought.. but maybe you can think about
this a bit when I send v9 of the patch up in just a few minutes :)
This is again a super "corner case" and it would certainly be very
weird if one of these devices suddenly had multiple instances of one
of the supporting ACPI device IDs so I am not sure if it would ever
really be a reasonable possibility. More than one battery in the same
device seems more likely, but not super reasonable either given that
one of the hallmarks of these devices is "thin and light" then I would
guess it is not likely there would ever be one with multiple
batteries?

Thanks again!

Joshua
