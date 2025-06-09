Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776E2F2E;
	Mon,  9 Jun 2025 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749432613; cv=none; b=UmCvZXbjdQnpqW8KJCz7Zlu4reK1i7cqDvka9WM1v+AT5EkY4fHO6ENx+KNIt+WBiIjpnZVZpLkulPEmKoqfY7Xl9QtnIvjf9fyyPE+Gkf2BcDbTlKpOfuQsOjF8ZGTkRrKHwKGD6FKiw9tFkoT+6AeWSIFyta0WEK/JV2P4jj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749432613; c=relaxed/simple;
	bh=IbHfAVHYpqe3GVCkZS8pgVT2oRLVzBANFATfC80Age4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CEU3KMkZZWQ0Rzjl5P5yiPCbhewu0HdFb7ARkzvTaJbWWgCk7mKOaJ96DSE+Nmcuzh9ghCPTt09EKtkQ520Y/ERqrhn17RH6MlOoEAyP4kGzIWSm4CDYkITRUj/IWZw4hH5qHHBW7nDJJ3khL3XQnAaSGNKp0qAQSmhcnYHX4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qp/rFjX/; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qp/rFjX/"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-525b44ec88aso1232842e0c.3;
        Sun, 08 Jun 2025 18:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749432610; x=1750037410; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0cjka/CvzGoiKe79YwZk3Y8yTof8niAzWI4ohFGsGs=;
        b=Qp/rFjX/xCVn3riugFF6hwKDIK8bza9Yu47I+9M2cgGCNdpQslEcypPypFNhFY3KlF
         ENDfISDnSxNfwCarDcodC1Wc9MhQfc3DCVGuALCIwPmfaT6L6p6APjcq4rs8sznFMkR9
         TC0jeOpOUgz1v2H76EV7YF+6B+13Kp3X6fNFLWf9xG4WVj5jn2XnrZOfEN3aWMrwy3dy
         sxXnyOo3fIN9PRpCbQ6SI+9ttoPZiH3zIac5bbDCylCiZTT2A2OOKG6iqKXOF9I94/X8
         ugbP/o7eRnNg6vZcC5NPn//dteiVq0JSovgH9GsPmQD6NlFN3ME4bdw69tcPMuK5UMey
         YeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749432610; x=1750037410;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0cjka/CvzGoiKe79YwZk3Y8yTof8niAzWI4ohFGsGs=;
        b=YdiGbqaj6NNpyR9YlBP9Qq34FWKq9uRG4MoTzUil1DENT9ejFswjJSy0wj/L6u1ZPf
         A6p0syF6hPSlP6G0GCxbcDCqfgEVBgYTqCHVgJk79KiO4saN9RBkbeJUNEyfavEOeEkF
         +Z3IaTQCCR+wohwoVKxaqUYVIs8IUZ+JfhRkddICxFsHKm+FrT7CLPvrXBBejG3/NFrQ
         DIY4+cLoLIk2SXkcFZxXguo7VLz+po/ZUEu3qXDh6UjV4NJPfPRrz/bEFd90NsJYmr1m
         M89434qgQaG6UHiVfGAWmkITT2I0PZLj2KOShz4GedpSDbMRK+lb4xzi4HQtLVDO4MmF
         wDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEze+E1G06Q2+PgJQOTOtX/ubfMI93HO92/ywSQxwefhAb7QBhIRvxJk4sNJjrvI7eQ/Ks31csesVjZmA=@vger.kernel.org, AJvYcCWQEFZZj4zb4PlYVmdKUA9CA3KJLvP8/D5PKiHluCvYf0BwVdlHRDcXKjlmNoj+EoRlWCFp6+/HDX9IHuLenx91Z5ioKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCw4yhcjDlQuu49un/O4ikE97+/7PqnlXZUepxgZg5LGr7XfD
	oP7tos7RZLlEIWMwJWXX+vUbwk8zzhwoIJ5mPgMXBcuXAqT+kT0m7lt4
X-Gm-Gg: ASbGncvfsczNZubtXbaJNDM66wMXhvVi4Yk566/W6Q9Oz+WM5w3VtDauIhhyKJYGPyA
	qj7D1v7XgVPiEgCIvNWtgEoy27XV6XguElTAQFA9jxMLTkyMFvyDqxePQRZdYUIHTbOxWV3phZQ
	uTwbdBllSrhzMDN07BLD2Q5DjkRMkMhzDtkPN1n0bVXI0ugPoLYjewZarFa0/7Gfq2P30fmP+ca
	/jrtR5L9l1TdqLM3RYS4gQ21TLhkOo6/2u6JIvEZtuoKRCclwYpDujQ0HLGVeAQ9JIcde/Dlgal
	Trip6y34HyYh1NW+wd1QxwYeGh1vRBB+CO4lxpma8hM=
X-Google-Smtp-Source: AGHT+IGpN3wUiTyleV1Yz9g7VaHi0MarwkUO/tUkRqJPioUCgG0h+oBPbWMcMmXqFD2RaVGW8a8ExQ==
X-Received: by 2002:a05:6102:3f89:b0:4e6:f86c:43a8 with SMTP id ada2fe7eead31-4e7729cb566mr9003540137.18.1749432609958;
        Sun, 08 Jun 2025 18:30:09 -0700 (PDT)
Received: from localhost ([181.85.222.32])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e773974b31sm4287116137.25.2025.06.08.18.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 18:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Jun 2025 22:30:05 -0300
Message-Id: <DAHM3NWF82G8.A9XJ6TAVE4IY@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mario Limonciello" <mario.limonciello@amd.com>,
 "Antheas Kapenekakis" <lkml@antheas.dev>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, "Prasanth Ksr" <prasanth.ksr@dell.com>, "Jorge
 Lopez" <jorge.lopez2@hp.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v2 0/5] platform/x86: firmware_attributes_class: Add a
 high level API
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Joshua Grisham" <josh@joshuagrisham.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
 <CAMF+KeYRpBFN=E=ZQm+Ho51QH4_-53VOe+Pup8SUiXOn6-sFRA@mail.gmail.com>
In-Reply-To: <CAMF+KeYRpBFN=E=ZQm+Ho51QH4_-53VOe+Pup8SUiXOn6-sFRA@mail.gmail.com>

Hi Joshua,

On Sat Jun 7, 2025 at 1:38 PM -03, Joshua Grisham wrote:
> Den l=C3=B6r 17 maj 2025 kl 10:52 skrev Kurt Borja <kuurtb@gmail.com>:
>>
>> Hi all,
>>
>> These series adds the _long awaited_ API for the Firmware Attributes
>> class.
>>
>> You'll find all the details in the commit messages and kernel-doc.
>>
>> I think it's easier to understand by example, so I used the
>> samsung-galaxybook driver for this purpose (last patch). IMO code
>> readibility, simplicity, maintainability, etc. is greatly improved, but
>> there is still room for improvement of the API itself. For this reason I
>> submitted this as an RFC.
>>
>> As always, your feedback is very appreciated :)
>>
>> Overview
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Patch 1-2: New API with docs included.
>>   Patch 3: New firwmare attributes type
>>   Patch 4: Misc Maintainers patch
>>   Patch 5: samsung-galaxybook example
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> Changes in v2:
>>
>> [Patch 1]
>>  - Include kdev_t.h header
>>
>> [Patch 2]
>>  - Use one line comments in fwat_create_attrs()
>>  - Check propagate errors in fwat_create_attrs()
>>  - Add `mode` to fwat_attr_config and related macros to let users
>>    configure the `current_value` attribute mode
>>  - Use defined structs in fwat_attr_ops instead of anonymous ones
>>  - Move fwat_attr_type from config to ops
>>
>> [Patch 5]
>>  - Just transition to new API without chaing ABI
>>
>> - Link to v1: https://lore.kernel.org/r/20250509-fw-attrs-api-v1-0-258af=
ed65bfa@gmail.com
>>
>> ---
>> Kurt Borja (4):
>>       platform/x86: firmware_attributes_class: Add a high level API
>>       platform/x86: firmware_attributes_class: Add a boolean type
>>       MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
>>       platform/x86: samsung-galaxybook: Transition to new firmware_attri=
butes API
>>
>> Thomas Wei=C3=9Fschuh (1):
>>       platform/x86: firmware_attributes_class: Add device initialization=
 methods
>>
>>  .../ABI/testing/sysfs-class-firmware-attributes    |   1 +
>>  MAINTAINERS                                        |   7 +
>>  drivers/platform/x86/firmware_attributes_class.c   | 454 ++++++++++++++=
+++++++
>>  drivers/platform/x86/firmware_attributes_class.h   | 276 +++++++++++++
>>  drivers/platform/x86/samsung-galaxybook.c          | 308 ++++++--------
>>  5 files changed, 861 insertions(+), 185 deletions(-)
>> ---
>> base-commit: 9f080c9f2099b5a81c85b3b7f95fd11fad428cc8
>> change-id: 20250326-fw-attrs-api-0eea7c0225b6
>> --
>>  ~ Kurt
>>
>
> Hi Kurt! First let me begin by saying GREAT job in picking this up,
> carrying on the work from Thomas, and really trying to glue all of the
> various pieces together into a packaged solution that can finally see
> the light of day :)
>
> Sorry it has taken some time for me to get back to you--work and other
> life stuff seemed to always get in the way and I wanted to make sure I
> took enough time to really think about this before I were to give any
> feedback myself.
>
> First off, the quick and easy one:  I applied all of your patches (on
> top of 6.15.1), tested everything with samsung-galaxybook from my
> device, and everything is still working without any failures and all
> features work as I expect them to. I diffed everything under
> /sys/class/firmware-attributes before vs after and everything is
> exactly the same EXCEPT it looks like what is currently
> "default_value" will now be called "default" with your patch. I assume
> if the intention is to keep the ABI same as before then you would
> probably want to change this? Specifically here:
>
>> +static const char * const fwat_prop_labels[] =3D {
>> +        [FWAT_PROP_DISPLAY_NAME] =3D "display_name",
>> +        [FWAT_PROP_LANGUAGE_CODE] =3D "display_name_language_code",
>> +        [FWAT_PROP_DEFAULT] =3D "default",
>
> Assume the last line should instead be
>
>         [FWAT_PROP_DEFAULT] =3D "default_value",
>
> or maybe even for consistency to rename the fwat_property to also
> match and then it could be like this?
>
>         [FWAT_PROP_DEFAULT_VALUE] =3D "default_value",

Yes! You are correct. I completely missed this.

>
> FWIW I don't personally mind changing the ABI for samsung-galaxybook;
> as you mentioned it is basically a brand new driver and the solutions
> which exist "in the wild" for it are quite limited so better maybe
> that it looks "right" going forward instead of carrying any
> unnecessary baggage, but I can understand that this may not be the
> case for all of the other drivers which have been using these
> facilities for a longer time period.

This was my first thought but I found out fwupd uses this interface.
I'll leave the ABI as is to not incur in regressions.

>
> Past that, I certainly think this is a big step forward as compared to
> messing around with the lower level kset / kobj_attribute etc
> facilities and trying to set everything up from scratch without so
> many helper utilities. As you may have noticed, what I ended up doing
> in samsung-galaxybook was essentially to create my own local
> implementation of some kind of "standard" fw attributes (but only for
> booleans), but it would be even better if this were standardized
> across all drivers! There are a few things left over in
> samsung-galaxybook that still need to be cleaned up from your
> suggested change (e.g. the struct galaxybook_fw_attr can now be
> totally removed, etc) which we can also address at some point, of
> course!

Thanks! I'll clean them in the next revision.

>
> But just to take a step back for a moment, and what I have been really
> trying to think through and reflect on myself for a few hours with
> this change...
>
> (Please feel free to completely disregard the below if this has
> already been brought up and ruled out, or anyone else has any opinions
> against this; all of that feedback is welcome and most definitely
> trumps my own meager opinions! ;) Also please remember that it is not
> my intention at all to detract from any of the great work that has
> already been done here -- just the stuff that my brain kind of gets
> "stuck" on as I try to think through the bigger picture with this! )

Don't worry, feedback is always appreciated :)

>
> If I think in terms of anyone who wants to come in and work on device
> drivers in the kernel, then they will potentially need to learn
> facilities for multiple different kind of "attributes" depending on
> their use case: device attributes, driver attributes, hwmon's
> sensor-related attributes, bus attributes, etc etc, and for the most
> part, I think they ALL have basically the same kind of interface and
> facilities. It feels very unified and relatively easy to work with all
> of them once you have basically figured out the scheme and conventions
> that have been implemented.
>
> Now, when I look at the proposal from these patches, these "Firmware
> Attributes" do not seem to have the same kind of "look, feel, and
> smell" as the other type of attributes I just mentioned, but instead
> feels like a totally new animal that must be learned separately. My
> take on it would be that a desired/"dream" scenario for a device
> driver developer is that all of these interfaces sort of look and
> "smell" the same, it is just a matter of the name of the macro you
> use, which device you attach the attributes to (which registration
> function you need to execute??), and maybe some small subtle
> differences in the facilities as appropriate to their context.
>
> Specifically with firmware attributes vs the other kinds, I guess the
> biggest differences are that:
> 1) There is a display_name with a language code
> 2) There are built-in restrictions on the input values depending on a
> "type" (e.g. "enumeration" type has a predetermined list of values,
> min/max values or str lengths for numeric or string values, etc)
> 3) There is a default_value
> 4) *Maybe* there should be some kind of inheritance and/or sub-groups
> (e.g. the "authentication" and similar extensions that create a group
> under the parent group...)

I'm not sure what you mean by this. If you mean this API should also
offer a way to create the Authentication group, I agree!

I was just hoping to get feedback from other maintainers before doing
that. I want to know if this approach passes the "smell" test for
everyone.

>
> But at the end of the day, my hope as a developer would be to be able
> to create these firmware attributes in much the same way as the other
> types. E.g. maybe something like this quick and dirty pseudo example:
>
>
> static ssize_t power_on_lid_open_show(struct device *dev,
>                                       struct device_attribute *attr,
>                                       char *buf)
> {
>         // ...
> }
>
> static ssize_t power_on_lid_open_store(struct device *dev,
>                                        struct device_attribute *attr,
>                                        const char *buf, size_t count)
> {
>         // ...
> }
>
> static FW_BOOL_ATTR_RW(power_on_lid_open, "Power On Lid Open");
>
> static struct attribute *galaxybook_fw_attrs[] =3D {
>         // ... other fw attrs not shown above ...
>        &fw_attr_power_on_lid_open.attr,
>         NULL
> };
>
> static const struct attribute_group galaxybook_fw_attrs_group =3D {
>         .attrs =3D galaxybook_fw_attrs,
>         .is_visible =3D galaxybook_fw_attr_visible,
> };
>
> static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook=
)
> {
>         // ...
>
>         /* something like "devm_fw_attr_device_register" could be sort
> of similar to
>            how devm_hwmon_device_register_with_groups works ? */
>
>         ret =3D devm_fw_attr_device_register(&galaxybook->platform->dev,
>                                           DRIVER_NAME, galaxybook,
>                                           &galaxybook_fw_attrs_group);
>         return PTR_ERR_OR_ZERO(ret);
> }
>
>
> Or in other words:
> - I create my callback functions for "show" and "store" with a certain
> named prefix and then use a macro to create the struct for this fw
> attr that relies on that these functions exist (e.g. in the above
> example the macro would create this "fw_attr_power_on_lid_open" fw
> attr structure instance) -- note here it might need to be a macro per
> type and/or to include the type-related stuff (including value
> constraints/enumeration arrays/default values/etc) as parameters to
> the macro, plus maybe I would want to provide some kind of context
> parameter e.g. I would maybe want a pointer to my samsung_galaxybook
> ideally somehow to get to come along?? (that might affect the
> signature of my above examples of course! they were just a
> quick-and-dirty example...),

I agree and I believe this API has this capability. You can do this:

static int power_on_lid_open_read(struct device *dev, long aux, const char =
**str)
{
	...
}

static int power_on_lid_open_write(struct device *dev, long aux, const char=
 *str, size_t count)
{
	...
}

static ssize_t power_on_lid_open_prop_read(struct device *dev, long aux, en=
um fwat_property prop,
					   char *buf)
{
	...
}

DEFINE_FWAT_OPS(power_on_lid_open, enumeration);

...

static const struct fwat_attr_config * const galaxybook_fwat_config[] =3D {
	FWAT_CONFIG_AUX("power_on_lid_open", 0644,
			GB_ATTR_POWER_ON_LID_OPEN,
			&power_on_lid_open_ops,
			galaxybook_fwat_props,
			ARRAY_SIZE(galaxybook_fwat_props)),
	...
	NULL
}

I.e, you can define ops for each "firmware attribute" (aka
attribute_group).

I feel the _props approach is currently a bit ugly though, and there is
room for improvement in the boilerplate department.

In the samsung-galaxybook case I decided to define a single struct
fwat_attr_ops because I didn't want to make the diff too ugly. The
*_acpi_{get,set}() functions that already exist are used in other parts
of the driver, and I would have to change a few lines to make it work.

BTW, you can pass a drvdata pointer to devm_fwat_device_register().

> - put all of my desired attrs together in a group where I can specify
> their is_visible callback (just like you do with DEVICE_ATTRs),

I decided to make this a single callback defined in struct
fwat_dev_config. I went for this because I didn't like the idea of a
different function for each attribute_group because it would just be a
bunch of functions.

> - and then register my fw attr device with my attribute_group (the
> register function would take care of all the rest..)

Do you think the struct fwat_attr_config * list achieves this? Could it
be improved in some way?

>
> And as sort of shown in the above example I certainly think it would
> be nice if the naming convention lined up nicely with how the naming
> convention works for the existing attribute stuff (e.g. DEVICE_ATTR_RW
> vs DRIVER_ATTR_RW vs something like "FW_ATTR_RW" or "FIRMWARE_ATTR_RW"
> seems like it falls into the same convention??)

I can certainly add these macros, but they would be for "firmware
attributes" defined entirely manually, using struct fwat_attribute.
Actually I thought of adding these, but I didn't do it because I wanted
to get something working at first and then add some of these extra
helpers.

>
> Again I am not trying to "rock the boat" here, and I have not
> necessarily *really* thought through all of the implications to the
> existing fw attrs extensions and how they might be able to be
> implemented with the above kind of example, ... I'm just taking a step
> back and sharing my observations of the patch compared to how it
> actually looks in the driver with the example vs how most of the other
> existing attribute facilities have been designed.

Thank you! As I said before, feedback is always welcome.

I feel this API already accomplishes the requirements (which I agree
with) you listed, albeit with some (maybe a bit too much) boilerplate.
However your questions make me realise documentation is still lacking, I
will make it better for the next revision.

If you have more concrete areas of improvement, please let me know! I
know there is room for improvement. Especially with naming.

>
> One more final thing which I always felt a little "off" about -- is it
> not the case that other type of platforms might could use firmware
> attributes as well? Or is this considered ONLY an x86 thing (e.g. that
> "firmware" relates to "BIOS" or something) ? Because I always thought
> it a bit strange that the header file was only local to
> ./drivers/platform/x86/ instead of being part of the Linux headers
> under ./include ..

I agree! I'd like to know maintainers opinion on this.

>
> And in the same vein as that, is it not the case that other attributes
> could benefit from this "typing" mechanism with constraints (e.g.
> DEVICE_ATTR of type "enumeration" that only allows for one of a list
> of values ? or a number with min/max value / a string with min/max
> length etc etc??). I understand this poses an even bigger question and
> much larger change (now we are really talking a HUGE impact! ;) ), but
> my first guess is that it would probably be sort of nice to have these
> types and this automatic constraints mechanism to be somewhat
> universal across other type of attributes, otherwise every single
> driver author/maintainer has to write their own manual code for the
> same kinds of verifications in every function of every driver (e.g.
> write an if statement to check the value in every store function of
> every attribute they create, and then otherwise return -EINVAL or
> similar... this kind of code exists over and over and over in the
> kernel today!).

Device attributes already have a lot of helpers for creating some
common attributes, see [1].

I feel like every driver, subsystem, interface, etc. Has VERY different
requirements for how sysfs attributes/groups should work. IMO there
wouldn't be a lot of benefit in providing this infrastructure for other
subsystems, either because they already have something in place or
because it wouldn't exactly fit their needs. Kernel ABI is very diverse.

These syfs interfaces are very old and there are good reasons why they
are the way they are now. I don't think is a bad think to have to
develop infrastructures for each subsystem!

>
> Anyway I hope this all was of some use, and, as mentioned, please feel
> free to take all I have said here "with a pinch of salt" -- I would
> definitely hope and encourage that others with longer service records
> here could chime in regarding this!

I hope so!

>
> Thanks again for the contribution, great work, and have a nice weekend!

You too :)

>
> Best regards,
> Joshua


--=20
 ~ Kurt

