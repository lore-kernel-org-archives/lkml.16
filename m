Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE7186A;
	Mon,  9 Jun 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474248; cv=none; b=s8ZsowywVJTfj9FX5rQ4RzHae/7ws48wDROinDM6CJcWI46gLC8bGQRTEe3JyzuaRQfL0xaPl7zP3JsAtp3tAzCluc0ZxBOzYQmdEMGs71WrXYtT5KegaI7Kh+7BJGYQmuvZq29d2maU1Vl49ctk/DgwGxtHQI8wk8cyTpjyj9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474248; c=relaxed/simple;
	bh=kuSXvtS5AxJ9hFyDMgmwrDxkh23QuFbuuS8cBSpBIu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbeAggJU76d1vGSvfyVxbRIC3oSpix7PywtUC5qkqSuoWKZHc7j2xvrRsx9r99QY/IfbezyLMuOg8GsjkLilMB93xCZdB8SGZWG3P298XVI7ILubtWsfQa0I0maGnwImpmBtQ5FtkSld4KRUu+opnqg9vTTcKcDt1ZLMDUzmPt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86efcef9194so129485239f.0;
        Mon, 09 Jun 2025 06:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474245; x=1750079045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgfVX2d0upQl/yTBNcy/B26HAy8OwYOZE/AhONWL3U4=;
        b=lOIO0EinHNxWLPJVQ4R8UAa+pCHlwbiJfGEGfepMYUhtk2lLQQa8gcVimGumlSrLmO
         7irHPF9OQsoC8Tjsz/ZpQO3SKJN8QO0Yt4myhisqhlWMS7ZsPWMd17JDENJpyrw9SrLg
         faAyYBuujWAVQ3e0FY5+tPVRqfXt2Z5pcbblPyvKgR/ogp8ClV28UcvmLXlECHVEJAE3
         mE6g3Ry/ZLPJPmqAWPgK6c2dNXbUPXOZYpM909FbDhxeF70SgsB2lC2PwZLj7HJsafIs
         k+/C0QwxSlSwIwyaSxe/fC+JKahX6KUECxO49EK6e9H9LmPNRJ4CZC+18K7Ov58kchfQ
         phvA==
X-Forwarded-Encrypted: i=1; AJvYcCUnUG6T5qm1z0IJ39RhtxbiMfRpYrGg/sxu9k/QIE/ksIqTHO1FK/c4ipp8TWCjNLwFLtwcW7mcqQt7lx6CRcEQoeF4Aw==@vger.kernel.org, AJvYcCV2cvp9Zss063zk3ohrVIbEZ0pZ1mPhY2ncsF2rchA7wj2jzxSEiIhOUwgLVCvoQY75wAXJ1XICwIsK2sE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxn+iHVp1jgf7Yi/jD4IQbqZdR+fb1B1mVYz4G4yF0erGTo9lA
	4YpVT9CBfmYC3UgYVXh/vReWO5S2pbUzBKCyfiLyPaj97/O/QTr4bXQLDkX819l1g1A=
X-Gm-Gg: ASbGncuK7ppKh9knoMXc1tppGVIE0Vio9RCy8JC5v1qSjfCtBLBDfWs+hwdbbswqaiX
	ExysVorQ4KIthXFgPZcJkUCTx2nszI981j65GV7JVPM95u5O3j8XZgAWV78cUgKA+h45Ku63lWJ
	jpIcUc5XyLWRp/2VN2C5AedNqTa/hNXx52stnvS0f0j2pGzQaLiplIKSscjpa7a3ercNnPoxFDh
	g7YG4ooDhUTWwFlHDUaRrYnds7m299rjA6h0Q9fuoEzB8YMDiL7KFrGfmSKUIvNRy7shOcJxp5p
	Q9Qh81eGex6PYNwv6YSOE6rF37Pp7AQSxXZd7xJHaOqGs7rcFHAdn782eHxiNPzDC+93TTbHiQo
	XoPbfgEQumD/vJEcHrXktVuObwZ8DISg4Z/mfeQ==
X-Google-Smtp-Source: AGHT+IEHL8noIH+kI5Bi+rE64GKnkHux7922MlGlMKHeIq/LYjhHBRf/tIQiNsuYU7WqfWL9buQx/g==
X-Received: by 2002:a05:6602:6cc9:b0:873:f23:a39 with SMTP id ca18e2360f4ac-87336511e84mr1189389639f.0.1749474244571;
        Mon, 09 Jun 2025 06:04:04 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df6120d6sm1733958173.145.2025.06.09.06.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 06:04:04 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-861d7a09c88so122518639f.2;
        Mon, 09 Jun 2025 06:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4Zi3xRddnaZaeLx/SMV0VyGHZZ9p1Te05aMCYsY29ITHk/2eHyXdZJ1tZKB2YpsTBRIx6c9K3tqJl1cyL/ChuYGD8pw==@vger.kernel.org, AJvYcCXcfiPM+fUsTvlEWwYfmKTowr6XlBy0rnjCZBHrzXz9uvMlAf3Yuxp7opVg5ym5a1agRHNGqrS0aoV2sNg=@vger.kernel.org
X-Received: by 2002:a05:6e02:1a2d:b0:3dd:c4ed:39c0 with SMTP id
 e9e14a558f8ab-3ddce3df9bbmr141882495ab.1.1749474243755; Mon, 09 Jun 2025
 06:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
 <CAMF+KeYRpBFN=E=ZQm+Ho51QH4_-53VOe+Pup8SUiXOn6-sFRA@mail.gmail.com> <DAHM3NWF82G8.A9XJ6TAVE4IY@gmail.com>
In-Reply-To: <DAHM3NWF82G8.A9XJ6TAVE4IY@gmail.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Mon, 9 Jun 2025 15:03:52 +0200
X-Gmail-Original-Message-ID: <CAMF+KebZ_BSCD8m6TWE-BfDD==j5s3WpC0NS68as-k29k9DxxA@mail.gmail.com>
X-Gm-Features: AX0GCFsHES5fLLu5g-pWiBkfOnhE1GBsS5h6xbynLsbGkhO0qBBK-SNFOyOwK5A
Message-ID: <CAMF+KebZ_BSCD8m6TWE-BfDD==j5s3WpC0NS68as-k29k9DxxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] platform/x86: firmware_attributes_class: Add a
 high level API
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Mario Limonciello <mario.limonciello@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den m=C3=A5n 9 juni 2025 kl 03:30 skrev Kurt Borja <kuurtb@gmail.com>:
>
> Hi Joshua,
>
> On Sat Jun 7, 2025 at 1:38 PM -03, Joshua Grisham wrote:
> > Den l=C3=B6r 17 maj 2025 kl 10:52 skrev Kurt Borja <kuurtb@gmail.com>:
> >>
> >> Hi all,
> >>
> >> These series adds the _long awaited_ API for the Firmware Attributes
> >> class.
> >>
> >> You'll find all the details in the commit messages and kernel-doc.
> >>
> >> I think it's easier to understand by example, so I used the
> >> samsung-galaxybook driver for this purpose (last patch). IMO code
> >> readibility, simplicity, maintainability, etc. is greatly improved, bu=
t
> >> there is still room for improvement of the API itself. For this reason=
 I
> >> submitted this as an RFC.
> >>
> >> As always, your feedback is very appreciated :)
> >>
> >> Overview
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> Patch 1-2: New API with docs included.
> >>   Patch 3: New firwmare attributes type
> >>   Patch 4: Misc Maintainers patch
> >>   Patch 5: samsung-galaxybook example
> >>
> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> >> ---
> >> Changes in v2:
> >>
> >> [Patch 1]
> >>  - Include kdev_t.h header
> >>
> >> [Patch 2]
> >>  - Use one line comments in fwat_create_attrs()
> >>  - Check propagate errors in fwat_create_attrs()
> >>  - Add `mode` to fwat_attr_config and related macros to let users
> >>    configure the `current_value` attribute mode
> >>  - Use defined structs in fwat_attr_ops instead of anonymous ones
> >>  - Move fwat_attr_type from config to ops
> >>
> >> [Patch 5]
> >>  - Just transition to new API without chaing ABI
> >>
> >> - Link to v1: https://lore.kernel.org/r/20250509-fw-attrs-api-v1-0-258=
afed65bfa@gmail.com
> >>
> >> ---
> >> Kurt Borja (4):
> >>       platform/x86: firmware_attributes_class: Add a high level API
> >>       platform/x86: firmware_attributes_class: Add a boolean type
> >>       MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
> >>       platform/x86: samsung-galaxybook: Transition to new firmware_att=
ributes API
> >>
> >> Thomas Wei=C3=9Fschuh (1):
> >>       platform/x86: firmware_attributes_class: Add device initializati=
on methods
> >>
> >>  .../ABI/testing/sysfs-class-firmware-attributes    |   1 +
> >>  MAINTAINERS                                        |   7 +
> >>  drivers/platform/x86/firmware_attributes_class.c   | 454 ++++++++++++=
+++++++++
> >>  drivers/platform/x86/firmware_attributes_class.h   | 276 ++++++++++++=
+
> >>  drivers/platform/x86/samsung-galaxybook.c          | 308 ++++++------=
--
> >>  5 files changed, 861 insertions(+), 185 deletions(-)
> >> ---
> >> base-commit: 9f080c9f2099b5a81c85b3b7f95fd11fad428cc8
> >> change-id: 20250326-fw-attrs-api-0eea7c0225b6
> >> --
> >>  ~ Kurt
> >>
> >
> > Hi Kurt! First let me begin by saying GREAT job in picking this up,
> > carrying on the work from Thomas, and really trying to glue all of the
> > various pieces together into a packaged solution that can finally see
> > the light of day :)
> >
> > Sorry it has taken some time for me to get back to you--work and other
> > life stuff seemed to always get in the way and I wanted to make sure I
> > took enough time to really think about this before I were to give any
> > feedback myself.
> >
> > First off, the quick and easy one:  I applied all of your patches (on
> > top of 6.15.1), tested everything with samsung-galaxybook from my
> > device, and everything is still working without any failures and all
> > features work as I expect them to. I diffed everything under
> > /sys/class/firmware-attributes before vs after and everything is
> > exactly the same EXCEPT it looks like what is currently
> > "default_value" will now be called "default" with your patch. I assume
> > if the intention is to keep the ABI same as before then you would
> > probably want to change this? Specifically here:
> >
> >> +static const char * const fwat_prop_labels[] =3D {
> >> +        [FWAT_PROP_DISPLAY_NAME] =3D "display_name",
> >> +        [FWAT_PROP_LANGUAGE_CODE] =3D "display_name_language_code",
> >> +        [FWAT_PROP_DEFAULT] =3D "default",
> >
> > Assume the last line should instead be
> >
> >         [FWAT_PROP_DEFAULT] =3D "default_value",
> >
> > or maybe even for consistency to rename the fwat_property to also
> > match and then it could be like this?
> >
> >         [FWAT_PROP_DEFAULT_VALUE] =3D "default_value",
>
> Yes! You are correct. I completely missed this.
>
> >
> > FWIW I don't personally mind changing the ABI for samsung-galaxybook;
> > as you mentioned it is basically a brand new driver and the solutions
> > which exist "in the wild" for it are quite limited so better maybe
> > that it looks "right" going forward instead of carrying any
> > unnecessary baggage, but I can understand that this may not be the
> > case for all of the other drivers which have been using these
> > facilities for a longer time period.
>
> This was my first thought but I found out fwupd uses this interface.
> I'll leave the ABI as is to not incur in regressions.
>
> >
> > Past that, I certainly think this is a big step forward as compared to
> > messing around with the lower level kset / kobj_attribute etc
> > facilities and trying to set everything up from scratch without so
> > many helper utilities. As you may have noticed, what I ended up doing
> > in samsung-galaxybook was essentially to create my own local
> > implementation of some kind of "standard" fw attributes (but only for
> > booleans), but it would be even better if this were standardized
> > across all drivers! There are a few things left over in
> > samsung-galaxybook that still need to be cleaned up from your
> > suggested change (e.g. the struct galaxybook_fw_attr can now be
> > totally removed, etc) which we can also address at some point, of
> > course!
>
> Thanks! I'll clean them in the next revision.
>
> >
> > But just to take a step back for a moment, and what I have been really
> > trying to think through and reflect on myself for a few hours with
> > this change...
> >
> > (Please feel free to completely disregard the below if this has
> > already been brought up and ruled out, or anyone else has any opinions
> > against this; all of that feedback is welcome and most definitely
> > trumps my own meager opinions! ;) Also please remember that it is not
> > my intention at all to detract from any of the great work that has
> > already been done here -- just the stuff that my brain kind of gets
> > "stuck" on as I try to think through the bigger picture with this! )
>
> Don't worry, feedback is always appreciated :)
>
> >
> > If I think in terms of anyone who wants to come in and work on device
> > drivers in the kernel, then they will potentially need to learn
> > facilities for multiple different kind of "attributes" depending on
> > their use case: device attributes, driver attributes, hwmon's
> > sensor-related attributes, bus attributes, etc etc, and for the most
> > part, I think they ALL have basically the same kind of interface and
> > facilities. It feels very unified and relatively easy to work with all
> > of them once you have basically figured out the scheme and conventions
> > that have been implemented.
> >
> > Now, when I look at the proposal from these patches, these "Firmware
> > Attributes" do not seem to have the same kind of "look, feel, and
> > smell" as the other type of attributes I just mentioned, but instead
> > feels like a totally new animal that must be learned separately. My
> > take on it would be that a desired/"dream" scenario for a device
> > driver developer is that all of these interfaces sort of look and
> > "smell" the same, it is just a matter of the name of the macro you
> > use, which device you attach the attributes to (which registration
> > function you need to execute??), and maybe some small subtle
> > differences in the facilities as appropriate to their context.
> >
> > Specifically with firmware attributes vs the other kinds, I guess the
> > biggest differences are that:
> > 1) There is a display_name with a language code
> > 2) There are built-in restrictions on the input values depending on a
> > "type" (e.g. "enumeration" type has a predetermined list of values,
> > min/max values or str lengths for numeric or string values, etc)
> > 3) There is a default_value
> > 4) *Maybe* there should be some kind of inheritance and/or sub-groups
> > (e.g. the "authentication" and similar extensions that create a group
> > under the parent group...)
>
> I'm not sure what you mean by this. If you mean this API should also
> offer a way to create the Authentication group, I agree!
>
> I was just hoping to get feedback from other maintainers before doing
> that. I want to know if this approach passes the "smell" test for
> everyone.
>
> >
> > But at the end of the day, my hope as a developer would be to be able
> > to create these firmware attributes in much the same way as the other
> > types. E.g. maybe something like this quick and dirty pseudo example:
> >
> >
> > static ssize_t power_on_lid_open_show(struct device *dev,
> >                                       struct device_attribute *attr,
> >                                       char *buf)
> > {
> >         // ...
> > }
> >
> > static ssize_t power_on_lid_open_store(struct device *dev,
> >                                        struct device_attribute *attr,
> >                                        const char *buf, size_t count)
> > {
> >         // ...
> > }
> >
> > static FW_BOOL_ATTR_RW(power_on_lid_open, "Power On Lid Open");
> >
> > static struct attribute *galaxybook_fw_attrs[] =3D {
> >         // ... other fw attrs not shown above ...
> >        &fw_attr_power_on_lid_open.attr,
> >         NULL
> > };
> >
> > static const struct attribute_group galaxybook_fw_attrs_group =3D {
> >         .attrs =3D galaxybook_fw_attrs,
> >         .is_visible =3D galaxybook_fw_attr_visible,
> > };
> >
> > static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybo=
ok)
> > {
> >         // ...
> >
> >         /* something like "devm_fw_attr_device_register" could be sort
> > of similar to
> >            how devm_hwmon_device_register_with_groups works ? */
> >
> >         ret =3D devm_fw_attr_device_register(&galaxybook->platform->dev=
,
> >                                           DRIVER_NAME, galaxybook,
> >                                           &galaxybook_fw_attrs_group);
> >         return PTR_ERR_OR_ZERO(ret);
> > }
> >
> >
> > Or in other words:
> > - I create my callback functions for "show" and "store" with a certain
> > named prefix and then use a macro to create the struct for this fw
> > attr that relies on that these functions exist (e.g. in the above
> > example the macro would create this "fw_attr_power_on_lid_open" fw
> > attr structure instance) -- note here it might need to be a macro per
> > type and/or to include the type-related stuff (including value
> > constraints/enumeration arrays/default values/etc) as parameters to
> > the macro, plus maybe I would want to provide some kind of context
> > parameter e.g. I would maybe want a pointer to my samsung_galaxybook
> > ideally somehow to get to come along?? (that might affect the
> > signature of my above examples of course! they were just a
> > quick-and-dirty example...),
>
> I agree and I believe this API has this capability. You can do this:
>
> static int power_on_lid_open_read(struct device *dev, long aux, const cha=
r **str)
> {
>         ...
> }
>
> static int power_on_lid_open_write(struct device *dev, long aux, const ch=
ar *str, size_t count)
> {
>         ...
> }
>
> static ssize_t power_on_lid_open_prop_read(struct device *dev, long aux, =
enum fwat_property prop,
>                                            char *buf)
> {
>         ...
> }
>
> DEFINE_FWAT_OPS(power_on_lid_open, enumeration);
>
> ...
>
> static const struct fwat_attr_config * const galaxybook_fwat_config[] =3D=
 {
>         FWAT_CONFIG_AUX("power_on_lid_open", 0644,
>                         GB_ATTR_POWER_ON_LID_OPEN,
>                         &power_on_lid_open_ops,
>                         galaxybook_fwat_props,
>                         ARRAY_SIZE(galaxybook_fwat_props)),
>         ...
>         NULL
> }
>
> I.e, you can define ops for each "firmware attribute" (aka
> attribute_group).
>
> I feel the _props approach is currently a bit ugly though, and there is
> room for improvement in the boilerplate department.
>
> In the samsung-galaxybook case I decided to define a single struct
> fwat_attr_ops because I didn't want to make the diff too ugly. The
> *_acpi_{get,set}() functions that already exist are used in other parts
> of the driver, and I would have to change a few lines to make it work.
>
> BTW, you can pass a drvdata pointer to devm_fwat_device_register().
>
> > - put all of my desired attrs together in a group where I can specify
> > their is_visible callback (just like you do with DEVICE_ATTRs),
>
> I decided to make this a single callback defined in struct
> fwat_dev_config. I went for this because I didn't like the idea of a
> different function for each attribute_group because it would just be a
> bunch of functions.
>
> > - and then register my fw attr device with my attribute_group (the
> > register function would take care of all the rest..)
>
> Do you think the struct fwat_attr_config * list achieves this? Could it
> be improved in some way?
>

Hi again Kurt!

In case it helps for me to restate that, from my perspective, I can
say that I was maybe not thinking too terribly deeply, more at a
shallow level about the higher level workflow/process for a developer.
For example, with device attributes, it is loosely like this:

1. create functions to handle the actual getting and setting logic
which can become my show/store callback(s)

2. use DEVICE_ATTR_RW or similar macro to create my
device_attribute(s) -- the macro will expect callback functions that
follow specific naming convention from step 1

3. put one of more of my device_attribute(s) in a group (with optional
is_visible callback that also should be created)

4. my "device" is registered (through various mechanisms) while
passing in this attribute group as a parameter and everything is
created for me via the registration process

And this process is roughly the same with device attributes, driver
attributes, bus attributes, hwmon sensor attributes etc etc. so it is
very "familiar" to me (not saying that is "good" or "bad", but it is
nice that once you learn this process, you can sort of more quickly
understand what is happening as you encounter these various types used
in different places).

And from what I can tell as you mentioned in this patch, the process
for FW attributes would instead be something like .. ?

1. create functions or some way to handle the actual getting and
setting logic (but these are maybe not directly used as callbacks, but
instead used as one case within the logic of a more general
"show/store any property under the fw attr" callback)

2. create (or use an existing "standard"?)  enum with all properties
that should exist under my fw attr (display_name, current_value,
default_value, etc)

3. create said general show/store callback function for all properties
within the fw attr (display_name, current_value, default_value, etc)

4. use DEFINE_FWAT_OPS macro to create some fw attr ops for a specific
fw attr (passing the name and type)

5. build an array of fwat_attr_config whose entry is another struct,
but that struct can/will be built by another macro FWAT_CONFIG_AUX (or
similar) with all of its own properties for things like mode, the ops
from step 4, the properties enum from step 2, etc

6. put the attrs config in a new fwat_dev_config (with optional
is_visible callback that also should be created)

7. register the fw attr device with devm_fwat_device_register, passing
the fwat_dev_config and optional drvdata

(of course I could have easily missed something obvious or gotten
something totally wrong here, but hopefully I have captured the gist
of it!)

So I guess what I was trying to say was, the first process seems
easier and more intuitive for my simple mind to understand, whereas
the second process is a fair bit different from the others. Not that
one is necessarily better or worse than the other, but I guess I would
say that the first does feel more "simple" to me (though admittedly
these other attributes are more "simple" by design, of course!).

What I tried to convey before was more that my own personal "dream
scenario" with this is that I as a developer could essentially still
follow the first process I mentioned from above (the one for other
device attrs) and then in a "happy path" scenario I would only need to
focus on callback functions for my getting and setting logic (show
and/or store callbacks) and not have to write ANY other code.
Basically like this:

1. create functions to handle the actual getting and setting logic
which can become my show/store callback(s)

2. use FW_BOOL_ATTR_RW(name, display_name, default_value) or similar
macro to create my fw_attribute(s) --> NOTE that because I chose
"bool" here (in that I used the "BOOL" variant of the macro) then I
will automatically get all of the standard attributes like
display_name, current_value, language_code (maybe even that it
defaults to English unless I want to change it??), fixed choice of
possible_values (as the possible values are always the same for
booleans, I don't need to do anything with this part..) etc etc i.e.
there are standard callback functions for these standard things like
display_name etc and the developer does not have to implement them
(and similar variants could exist for enum, string, and numeric fw
attrs that take care of min/max properties etc)

3. put one of more of my fw_attribute(s) in a group (with optional
is_visible callback that also should be created)

4. my fw attr "device" is registered and the group is passed and
everything is created for me via the registration process

So *essentially* the process of this kind of fw attr implementation
would still be roughly the same as other attribute types, the code
would "look/feel/smell" the same as other attribute types, but I would
just need to pass a few extra parameters to the attribute macro in
order to set the display_name, default_value, etc properties that
would then get picked up by the "standard" show callback functions for
those attributes. The only thing I as an implementer really bother
with is the show/store functions and their actual getting/setting
logic on the actual device.

And bonus if the "standard" logic also enforces the various
constraints (e.g. it should always block to store something that is
not one of my given possible_values, or enforce the various min/max
rules, etc) so that I do not even have to write any of the code for
that part, either!

Maybe I am thinking of this too simply? I have not as mentioned
thought through all of the implementation details of this, but my
first guess is at least for these standard types (enumeration, string,
boolean, etc) is that it does seem like it is *probably* possible??
(not the extensions e.g. "authentication" etc -- needs more thinking
on that!)

Does this make sense, or are we saying the same thing, or maybe
"talking past each other" as they say in Swedish? :)

Thanks again and keep up the good fight!

Joshua

> >
> > And as sort of shown in the above example I certainly think it would
> > be nice if the naming convention lined up nicely with how the naming
> > convention works for the existing attribute stuff (e.g. DEVICE_ATTR_RW
> > vs DRIVER_ATTR_RW vs something like "FW_ATTR_RW" or "FIRMWARE_ATTR_RW"
> > seems like it falls into the same convention??)
>
> I can certainly add these macros, but they would be for "firmware
> attributes" defined entirely manually, using struct fwat_attribute.
> Actually I thought of adding these, but I didn't do it because I wanted
> to get something working at first and then add some of these extra
> helpers.
>
> >
> > Again I am not trying to "rock the boat" here, and I have not
> > necessarily *really* thought through all of the implications to the
> > existing fw attrs extensions and how they might be able to be
> > implemented with the above kind of example, ... I'm just taking a step
> > back and sharing my observations of the patch compared to how it
> > actually looks in the driver with the example vs how most of the other
> > existing attribute facilities have been designed.
>
> Thank you! As I said before, feedback is always welcome.
>
> I feel this API already accomplishes the requirements (which I agree
> with) you listed, albeit with some (maybe a bit too much) boilerplate.
> However your questions make me realise documentation is still lacking, I
> will make it better for the next revision.
>
> If you have more concrete areas of improvement, please let me know! I
> know there is room for improvement. Especially with naming.
>
> >
> > One more final thing which I always felt a little "off" about -- is it
> > not the case that other type of platforms might could use firmware
> > attributes as well? Or is this considered ONLY an x86 thing (e.g. that
> > "firmware" relates to "BIOS" or something) ? Because I always thought
> > it a bit strange that the header file was only local to
> > ./drivers/platform/x86/ instead of being part of the Linux headers
> > under ./include ..
>
> I agree! I'd like to know maintainers opinion on this.
>
> >
> > And in the same vein as that, is it not the case that other attributes
> > could benefit from this "typing" mechanism with constraints (e.g.
> > DEVICE_ATTR of type "enumeration" that only allows for one of a list
> > of values ? or a number with min/max value / a string with min/max
> > length etc etc??). I understand this poses an even bigger question and
> > much larger change (now we are really talking a HUGE impact! ;) ), but
> > my first guess is that it would probably be sort of nice to have these
> > types and this automatic constraints mechanism to be somewhat
> > universal across other type of attributes, otherwise every single
> > driver author/maintainer has to write their own manual code for the
> > same kinds of verifications in every function of every driver (e.g.
> > write an if statement to check the value in every store function of
> > every attribute they create, and then otherwise return -EINVAL or
> > similar... this kind of code exists over and over and over in the
> > kernel today!).
>
> Device attributes already have a lot of helpers for creating some
> common attributes, see [1].
>
> I feel like every driver, subsystem, interface, etc. Has VERY different
> requirements for how sysfs attributes/groups should work. IMO there
> wouldn't be a lot of benefit in providing this infrastructure for other
> subsystems, either because they already have something in place or
> because it wouldn't exactly fit their needs. Kernel ABI is very diverse.
>
> These syfs interfaces are very old and there are good reasons why they
> are the way they are now. I don't think is a bad think to have to
> develop infrastructures for each subsystem!
>
> >
> > Anyway I hope this all was of some use, and, as mentioned, please feel
> > free to take all I have said here "with a pinch of salt" -- I would
> > definitely hope and encourage that others with longer service records
> > here could chime in regarding this!
>
> I hope so!
>
> >
> > Thanks again for the contribution, great work, and have a nice weekend!
>
> You too :)
>
> >
> > Best regards,
> > Joshua
>
>
> --
>  ~ Kurt
>
