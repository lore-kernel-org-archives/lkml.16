Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BD20EB;
	Mon,  9 Jun 2025 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495844; cv=none; b=UBstYPmx4ikrhv9ghigQ6J1vTpRGSy/41pLMf0DzKkXPLycRFVLS8sRH1yOpUejtR/9MhmH8lNj6f1kuNeDz6H0NOngjEsohTMFfSBi8bsW8xFRgQqwo7fxwPpGvZiXR5O/baqKu2uruzO+CMIz3zpZz7JWt7S4daAvmVmVwadE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495844; c=relaxed/simple;
	bh=qenSyQAl0RVih8tBufLOx6RQHD+5JMVZsWp47kSvZQI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Nyp0dWecRiaEY6xEF59mBmjm93mM6vvGuMQ1EjJiNFDa8Wa2E0hz+roudum/Hh5Ij4oLUfjnpvOdQfZcbA47FQnYjxKKulQL8TL9tmODDTk0YSnovBYp2KHx9NsrrI7oJTC2p6ClD5rgGqbzdDZsRapJfe5TGd0+2X/KvpkSBr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrRr3vJt; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrRr3vJt"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52d9a275c27so3305996e0c.0;
        Mon, 09 Jun 2025 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495841; x=1750100641; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1SEQbOcHYPFl94O8P1OpW3AP53s0Q1ZXJ8xtqtl7KY=;
        b=LrRr3vJtIXemE6UY0debqAezvTQmrbgJYBLpeyzsFwHLdNtcKoqD4jb5Ljphtwzvbd
         1uwx5p4+sySGcanG5klG9e0HCLIJwSzGxMeHfJzJ4zvOhKDDYVDMoVZGeYlbu8x86DoE
         ByJZh3ve/YYPrgjMQbXP+m44nIDhZO4YKRY5eWwvN9itHwH8ktYgGqrUK28InHpT06JK
         LPqcNAis0SjJlpMQnlCrS28X+52jfy2uJM1S7MscUG0YiuITQ0ADXNPIaJ5ZRvHKaqno
         WJYDSWRwsnGRd5+Xl3lU6w0Gc3B0HNSKQyWdgJ1T2VoFPGDhV0QUm5/x/GQYMDZ7pLMW
         IyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495841; x=1750100641;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1SEQbOcHYPFl94O8P1OpW3AP53s0Q1ZXJ8xtqtl7KY=;
        b=FH9JwJN3ErvTTPtShIR8fvp/5HiY9QAw3T/Wk2Rv88k53eijB33zAyJv4zxh+ltSyX
         Y33TD6JVR+cT0R0A00fZJDQntxey6uN1t77CkMyK402v8RXQrKLUoLVVDKSP3vCxhhPF
         dM9hAfBv5Gcl12jtVAXyVFucFvLbPzWW9D0AeAX0YVhR7mnI1w5fxkniceS3mTiLfg0O
         tJV9jXb9Dvexbg0KS5gx7dQQqPBhII65dgLV2uCWnhBxSA27SWutz2+/dN7vaNCQOTuN
         jQPH+ipxqli43jbZSV5v5gFHaieyugA/0jrKPVYZk2ySBYV/IbP99gwL30xhsxWg6fp3
         GB4g==
X-Forwarded-Encrypted: i=1; AJvYcCUe4mNHNHG5FxjiLUkSglRWiIqLUawS4YdxTIlMLZr6WCtYFyor24Kk7c+0WOwOQHlURaSF8N5wfr7dkAs=@vger.kernel.org, AJvYcCVeOMHyMxzxyJgMylxHPWEDRVDgacECAktZ3b3XyKsFqEQ8e79mkBRM7qEDBKR5bLxqgUZEOz+3l3t/P3PZVG+b+JrfzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVSn7bqm6EnvW4H0asJ5UWGCbl9O3fqp9r3tt/db/UZWniBgq
	BHfoil+OginJai97/rO8qWydLx0ONzvhWsOYP7fYGhL/dcEedhVXtMGu
X-Gm-Gg: ASbGncvf+A/XziMApgXTjzjUIaV0mAeIcsFhNGzOuuAqP+X1h5Wzs7N7YkpnmBOjPOw
	rg1ZG5wdznshOtZx1VWngMSaV8a1TWuERGEoPZdPlDL2IGnYRez5/v4aHBz0ep/edOujq8AaHDA
	Jbyy0Ek+JEqeg+4sIZ6A13EYznmBxFe9U9UjzmZVdbUDS+I4NKHlvzg9m2Ul1jhavLfsjbMeLHQ
	SIU8lumnKiaCkjN9Bopn08PjE1DZPhXbJxxbZJZ9OOwN+wz/bF/eBy4YenEgv2ojG0X7EitN+i4
	LOJMPXrBXeWrZ1XiTbvKfXFKd2kE0pq87PpuWQXxhDzBGIlmm/Kq5XE=
X-Google-Smtp-Source: AGHT+IG9P8FRoIaM0/wgXX9+E4RK9KcCXn1X8OhcpGZz7O2wLh4RgtpAtZrhWrGjQ8FHAYtf85CGMQ==
X-Received: by 2002:a05:6122:21a7:b0:530:6f72:b109 with SMTP id 71dfb90a1353d-530e48d9d24mr12882333e0c.11.1749495840986;
        Mon, 09 Jun 2025 12:04:00 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113c2c324sm141202e0c.46.2025.06.09.12.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 12:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2c76a06105d6073a070457e1f80320a24b936a710f6eb0a98c34f201ae06;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Jun 2025 16:03:55 -0300
Message-Id: <DAI8IJKTM3UR.WRQ641AOARI@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Joshua Grisham" <josh@joshuagrisham.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mario Limonciello" <mario.limonciello@amd.com>,
 "Antheas Kapenekakis" <lkml@antheas.dev>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, "Prasanth Ksr" <prasanth.ksr@dell.com>, "Jorge
 Lopez" <jorge.lopez2@hp.com>, <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v2 0/5] platform/x86: firmware_attributes_class: Add a
 high level API
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
 <CAMF+KeYRpBFN=E=ZQm+Ho51QH4_-53VOe+Pup8SUiXOn6-sFRA@mail.gmail.com>
 <DAHM3NWF82G8.A9XJ6TAVE4IY@gmail.com>
 <f6e5665c-e9ca-bf88-c135-23838b85558d@linux.intel.com>
In-Reply-To: <f6e5665c-e9ca-bf88-c135-23838b85558d@linux.intel.com>

--2c76a06105d6073a070457e1f80320a24b936a710f6eb0a98c34f201ae06
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 9, 2025 at 6:29 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Sun, 8 Jun 2025, Kurt Borja wrote:
>> On Sat Jun 7, 2025 at 1:38 PM -03, Joshua Grisham wrote:
>> > Den l=C3=B6r 17 maj 2025 kl 10:52 skrev Kurt Borja <kuurtb@gmail.com>:
>> >>
>> >> These series adds the _long awaited_ API for the Firmware Attributes
>> >> class.
>> >>
>> >> You'll find all the details in the commit messages and kernel-doc.
>> >>
>> >> I think it's easier to understand by example, so I used the
>> >> samsung-galaxybook driver for this purpose (last patch). IMO code
>> >> readibility, simplicity, maintainability, etc. is greatly improved, b=
ut
>> >> there is still room for improvement of the API itself. For this reaso=
n I
>> >> submitted this as an RFC.
>> >>
>> >> As always, your feedback is very appreciated :)
>> >>
>> >> Overview
>> >> =3D=3D=3D=3D=3D=3D=3D=3D
>> >>
>> >> Patch 1-2: New API with docs included.
>> >>   Patch 3: New firwmare attributes type
>> >>   Patch 4: Misc Maintainers patch
>> >>   Patch 5: samsung-galaxybook example
>> >>
>> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> >> ---
>> >> Changes in v2:
>> >>
>> >> [Patch 1]
>> >>  - Include kdev_t.h header
>> >>
>> >> [Patch 2]
>> >>  - Use one line comments in fwat_create_attrs()
>> >>  - Check propagate errors in fwat_create_attrs()
>> >>  - Add `mode` to fwat_attr_config and related macros to let users
>> >>    configure the `current_value` attribute mode
>> >>  - Use defined structs in fwat_attr_ops instead of anonymous ones
>> >>  - Move fwat_attr_type from config to ops
>> >>
>> >> [Patch 5]
>> >>  - Just transition to new API without chaing ABI
>> >>
>> >> - Link to v1: https://lore.kernel.org/r/20250509-fw-attrs-api-v1-0-25=
8afed65bfa@gmail.com
>> >>
>> >> ---
>> >> Kurt Borja (4):
>> >>       platform/x86: firmware_attributes_class: Add a high level API
>> >>       platform/x86: firmware_attributes_class: Add a boolean type
>> >>       MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
>> >>       platform/x86: samsung-galaxybook: Transition to new firmware_at=
tributes API
>> >>
>> >> Thomas Wei=C3=9Fschuh (1):
>> >>       platform/x86: firmware_attributes_class: Add device initializat=
ion methods
>> >>
>> >>  .../ABI/testing/sysfs-class-firmware-attributes    |   1 +
>> >>  MAINTAINERS                                        |   7 +
>> >>  drivers/platform/x86/firmware_attributes_class.c   | 454 +++++++++++=
++++++++++
>> >>  drivers/platform/x86/firmware_attributes_class.h   | 276 +++++++++++=
++
>> >>  drivers/platform/x86/samsung-galaxybook.c          | 308 ++++++-----=
---
>> >>  5 files changed, 861 insertions(+), 185 deletions(-)
>> >> ---
>> >> base-commit: 9f080c9f2099b5a81c85b3b7f95fd11fad428cc8
>> >> change-id: 20250326-fw-attrs-api-0eea7c0225b6
>> >> --
>> >>  ~ Kurt
>> >>
>> >
>> > Hi Kurt! First let me begin by saying GREAT job in picking this up,
>> > carrying on the work from Thomas, and really trying to glue all of the
>> > various pieces together into a packaged solution that can finally see
>> > the light of day :)
>> >
>> > Sorry it has taken some time for me to get back to you--work and other
>> > life stuff seemed to always get in the way and I wanted to make sure I
>> > took enough time to really think about this before I were to give any
>> > feedback myself.
>> >
>> > First off, the quick and easy one:  I applied all of your patches (on
>> > top of 6.15.1), tested everything with samsung-galaxybook from my
>> > device, and everything is still working without any failures and all
>> > features work as I expect them to. I diffed everything under
>> > /sys/class/firmware-attributes before vs after and everything is
>> > exactly the same EXCEPT it looks like what is currently
>> > "default_value" will now be called "default" with your patch. I assume
>> > if the intention is to keep the ABI same as before then you would
>> > probably want to change this? Specifically here:
>> >
>> >> +static const char * const fwat_prop_labels[] =3D {
>> >> +        [FWAT_PROP_DISPLAY_NAME] =3D "display_name",
>> >> +        [FWAT_PROP_LANGUAGE_CODE] =3D "display_name_language_code",
>> >> +        [FWAT_PROP_DEFAULT] =3D "default",
>> >
>> > Assume the last line should instead be
>> >
>> >         [FWAT_PROP_DEFAULT] =3D "default_value",
>> >
>> > or maybe even for consistency to rename the fwat_property to also
>> > match and then it could be like this?
>> >
>> >         [FWAT_PROP_DEFAULT_VALUE] =3D "default_value",
>>=20
>> Yes! You are correct. I completely missed this.
>>=20
>> >
>> > FWIW I don't personally mind changing the ABI for samsung-galaxybook;
>> > as you mentioned it is basically a brand new driver and the solutions
>> > which exist "in the wild" for it are quite limited so better maybe
>> > that it looks "right" going forward instead of carrying any
>> > unnecessary baggage, but I can understand that this may not be the
>> > case for all of the other drivers which have been using these
>> > facilities for a longer time period.
>>=20
>> This was my first thought but I found out fwupd uses this interface.
>> I'll leave the ABI as is to not incur in regressions.
>>=20
>> >
>> > Past that, I certainly think this is a big step forward as compared to
>> > messing around with the lower level kset / kobj_attribute etc
>> > facilities and trying to set everything up from scratch without so
>> > many helper utilities. As you may have noticed, what I ended up doing
>> > in samsung-galaxybook was essentially to create my own local
>> > implementation of some kind of "standard" fw attributes (but only for
>> > booleans), but it would be even better if this were standardized
>> > across all drivers! There are a few things left over in
>> > samsung-galaxybook that still need to be cleaned up from your
>> > suggested change (e.g. the struct galaxybook_fw_attr can now be
>> > totally removed, etc) which we can also address at some point, of
>> > course!
>>=20
>> Thanks! I'll clean them in the next revision.
>>=20
>> >
>> > But just to take a step back for a moment, and what I have been really
>> > trying to think through and reflect on myself for a few hours with
>> > this change...
>> >
>> > (Please feel free to completely disregard the below if this has
>> > already been brought up and ruled out, or anyone else has any opinions
>> > against this; all of that feedback is welcome and most definitely
>> > trumps my own meager opinions! ;) Also please remember that it is not
>> > my intention at all to detract from any of the great work that has
>> > already been done here -- just the stuff that my brain kind of gets
>> > "stuck" on as I try to think through the bigger picture with this! )
>>=20
>> Don't worry, feedback is always appreciated :)
>>=20
>> >
>> > If I think in terms of anyone who wants to come in and work on device
>> > drivers in the kernel, then they will potentially need to learn
>> > facilities for multiple different kind of "attributes" depending on
>> > their use case: device attributes, driver attributes, hwmon's
>> > sensor-related attributes, bus attributes, etc etc, and for the most
>> > part, I think they ALL have basically the same kind of interface and
>> > facilities. It feels very unified and relatively easy to work with all
>> > of them once you have basically figured out the scheme and conventions
>> > that have been implemented.
>> >
>> > Now, when I look at the proposal from these patches, these "Firmware
>> > Attributes" do not seem to have the same kind of "look, feel, and
>> > smell" as the other type of attributes I just mentioned, but instead
>> > feels like a totally new animal that must be learned separately. My
>> > take on it would be that a desired/"dream" scenario for a device
>> > driver developer is that all of these interfaces sort of look and
>> > "smell" the same, it is just a matter of the name of the macro you
>> > use, which device you attach the attributes to (which registration
>> > function you need to execute??), and maybe some small subtle
>> > differences in the facilities as appropriate to their context.
>> >
>> > Specifically with firmware attributes vs the other kinds, I guess the
>> > biggest differences are that:
>> > 1) There is a display_name with a language code
>> > 2) There are built-in restrictions on the input values depending on a
>> > "type" (e.g. "enumeration" type has a predetermined list of values,
>> > min/max values or str lengths for numeric or string values, etc)
>> > 3) There is a default_value
>> > 4) *Maybe* there should be some kind of inheritance and/or sub-groups
>> > (e.g. the "authentication" and similar extensions that create a group
>> > under the parent group...)
>>=20
>> I'm not sure what you mean by this. If you mean this API should also
>> offer a way to create the Authentication group, I agree!
>>=20
>> I was just hoping to get feedback from other maintainers before doing
>> that. I want to know if this approach passes the "smell" test for
>> everyone.
>>=20
>> >
>> > But at the end of the day, my hope as a developer would be to be able
>> > to create these firmware attributes in much the same way as the other
>> > types. E.g. maybe something like this quick and dirty pseudo example:
>> >
>> >
>> > static ssize_t power_on_lid_open_show(struct device *dev,
>> >                                       struct device_attribute *attr,
>> >                                       char *buf)
>> > {
>> >         // ...
>> > }
>> >
>> > static ssize_t power_on_lid_open_store(struct device *dev,
>> >                                        struct device_attribute *attr,
>> >                                        const char *buf, size_t count)
>> > {
>> >         // ...
>> > }
>> >
>> > static FW_BOOL_ATTR_RW(power_on_lid_open, "Power On Lid Open");
>> >
>> > static struct attribute *galaxybook_fw_attrs[] =3D {
>> >         // ... other fw attrs not shown above ...
>> >        &fw_attr_power_on_lid_open.attr,
>> >         NULL
>> > };
>> >
>> > static const struct attribute_group galaxybook_fw_attrs_group =3D {
>> >         .attrs =3D galaxybook_fw_attrs,
>> >         .is_visible =3D galaxybook_fw_attr_visible,
>> > };
>> >
>> > static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxyb=
ook)
>> > {
>> >         // ...
>> >
>> >         /* something like "devm_fw_attr_device_register" could be sort
>> > of similar to
>> >            how devm_hwmon_device_register_with_groups works ? */
>> >
>> >         ret =3D devm_fw_attr_device_register(&galaxybook->platform->de=
v,
>> >                                           DRIVER_NAME, galaxybook,
>> >                                           &galaxybook_fw_attrs_group);
>> >         return PTR_ERR_OR_ZERO(ret);
>> > }
>> >
>> >
>> > Or in other words:
>> > - I create my callback functions for "show" and "store" with a certain
>> > named prefix and then use a macro to create the struct for this fw
>> > attr that relies on that these functions exist (e.g. in the above
>> > example the macro would create this "fw_attr_power_on_lid_open" fw
>> > attr structure instance) -- note here it might need to be a macro per
>> > type and/or to include the type-related stuff (including value
>> > constraints/enumeration arrays/default values/etc) as parameters to
>> > the macro, plus maybe I would want to provide some kind of context
>> > parameter e.g. I would maybe want a pointer to my samsung_galaxybook
>> > ideally somehow to get to come along?? (that might affect the
>> > signature of my above examples of course! they were just a
>> > quick-and-dirty example...),
>>=20
>> I agree and I believe this API has this capability. You can do this:
>>=20
>> static int power_on_lid_open_read(struct device *dev, long aux, const ch=
ar **str)
>> {
>> 	...
>> }
>>=20
>> static int power_on_lid_open_write(struct device *dev, long aux, const c=
har *str, size_t count)
>> {
>> 	...
>> }
>>=20
>> static ssize_t power_on_lid_open_prop_read(struct device *dev, long aux,=
 enum fwat_property prop,
>> 					   char *buf)
>> {
>> 	...
>> }
>>=20
>> DEFINE_FWAT_OPS(power_on_lid_open, enumeration);
>>=20
>> ...
>>=20
>> static const struct fwat_attr_config * const galaxybook_fwat_config[] =
=3D {
>> 	FWAT_CONFIG_AUX("power_on_lid_open", 0644,
>> 			GB_ATTR_POWER_ON_LID_OPEN,
>> 			&power_on_lid_open_ops,
>> 			galaxybook_fwat_props,
>> 			ARRAY_SIZE(galaxybook_fwat_props)),
>> 	...
>> 	NULL
>> }
>>=20
>> I.e, you can define ops for each "firmware attribute" (aka
>> attribute_group).
>>=20
>> I feel the _props approach is currently a bit ugly though, and there is
>> room for improvement in the boilerplate department.
>>=20
>> In the samsung-galaxybook case I decided to define a single struct
>> fwat_attr_ops because I didn't want to make the diff too ugly. The
>> *_acpi_{get,set}() functions that already exist are used in other parts
>> of the driver, and I would have to change a few lines to make it work.
>>=20
>> BTW, you can pass a drvdata pointer to devm_fwat_device_register().
>>=20
>> > - put all of my desired attrs together in a group where I can specify
>> > their is_visible callback (just like you do with DEVICE_ATTRs),
>>=20
>> I decided to make this a single callback defined in struct
>> fwat_dev_config. I went for this because I didn't like the idea of a
>> different function for each attribute_group because it would just be a
>> bunch of functions.
>>=20
>> > - and then register my fw attr device with my attribute_group (the
>> > register function would take care of all the rest..)
>>=20
>> Do you think the struct fwat_attr_config * list achieves this? Could it
>> be improved in some way?
>>=20
>> >
>> > And as sort of shown in the above example I certainly think it would
>> > be nice if the naming convention lined up nicely with how the naming
>> > convention works for the existing attribute stuff (e.g. DEVICE_ATTR_RW
>> > vs DRIVER_ATTR_RW vs something like "FW_ATTR_RW" or "FIRMWARE_ATTR_RW"
>> > seems like it falls into the same convention??)
>>=20
>> I can certainly add these macros, but they would be for "firmware
>> attributes" defined entirely manually, using struct fwat_attribute.
>> Actually I thought of adding these, but I didn't do it because I wanted
>> to get something working at first and then add some of these extra
>> helpers.
>>=20
>> >
>> > Again I am not trying to "rock the boat" here, and I have not
>> > necessarily *really* thought through all of the implications to the
>> > existing fw attrs extensions and how they might be able to be
>> > implemented with the above kind of example, ... I'm just taking a step
>> > back and sharing my observations of the patch compared to how it
>> > actually looks in the driver with the example vs how most of the other
>> > existing attribute facilities have been designed.
>>=20
>> Thank you! As I said before, feedback is always welcome.
>>=20
>> I feel this API already accomplishes the requirements (which I agree
>> with) you listed, albeit with some (maybe a bit too much) boilerplate.
>> However your questions make me realise documentation is still lacking, I
>> will make it better for the next revision.
>>=20
>> If you have more concrete areas of improvement, please let me know! I
>> know there is room for improvement. Especially with naming.
>>=20
>> >
>> > One more final thing which I always felt a little "off" about -- is it
>> > not the case that other type of platforms might could use firmware
>> > attributes as well? Or is this considered ONLY an x86 thing (e.g. that
>> > "firmware" relates to "BIOS" or something) ? Because I always thought
>> > it a bit strange that the header file was only local to
>> > ./drivers/platform/x86/ instead of being part of the Linux headers
>> > under ./include ..
>>=20
>> I agree! I'd like to know maintainers opinion on this.
>
> We do move code and headers around whenever we find out the initial=20
> placement isn't good any more, it's business as usual.
>
> Usually when something feels off to you, it is off. But I understand=20
> in these situations there's often the nagging voice telling inside one's=
=20
> head 'Am I missing something obvious here?'; which rarely is the case ;-)=
.=20
> There's no need to assume the existing code is 'perfect' (including its=
=20
> placement). :-)

Then I'll move it to ./include/. Thanks Ilpo :)

--=20
 ~ Kurt


--2c76a06105d6073a070457e1f80320a24b936a710f6eb0a98c34f201ae06
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaEcwHwAKCRAWYEM49J/U
Zq8CAQDIsKHYZjse6NzLBdK0yRKW+hzRVSj7lwyRpJLuEZJbpQD/e9Tq/ZYRH0iz
DJ44hTQAM7JYu+/e3+OAR8MD4Ld6Kwo=
=BxjD
-----END PGP SIGNATURE-----

--2c76a06105d6073a070457e1f80320a24b936a710f6eb0a98c34f201ae06--
