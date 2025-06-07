Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639681C5D44;
	Sat,  7 Jun 2025 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749314334; cv=none; b=bMyk5Cnx2v/z/hDL30ywB3LuhzChKEiJ8fCkjE3DesneaHA7m25rALjS2V4HIvfu5S0EUycbRCghujiX6ImII7tkZQqsxcNr/K2vM82IWFdf0HVrLs6oi93soF31iJWxafi30CApiJEBQcfsr5H7hVwrmPXAEOFKJtK4aTeiGt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749314334; c=relaxed/simple;
	bh=zOElZJgAwEkru5282446H8L4o3AVyPviVaOMZUlhtnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5AaYESA60/8uAVHo8r37XHzbmblHULHL7QyOBwfr2YDIhb592kOPZn3nUBj+0h+b1G+PWB9qYz+8TRmtSB1sob+vsofjQ7WiJQ5DbbrAot9ehVRLa5Q10KiHJnqNkpZ6tR1+iLq2tOdwQdPNHc7HruL6TEZkDfnHvBn1AJ07OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dc6f653152so12417825ab.3;
        Sat, 07 Jun 2025 09:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749314331; x=1749919131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kWbVZb3fvuR2i219i5uRqo6uOD0os/G5bQbN29DjGg=;
        b=hkAKDiGk8VpnQ0lKnvy81DaELW14G1xshW2b/nzjlx2FKJ4P2ck0PXoocIJVFtwWfB
         2II3NyiQ2ZuA7sPRR1nBRZR9FaTqVTX/Db+v1WuMNUVGAHGyDAJjxOTbERpuaUOUFL0g
         xlXzLMa9ujr6hwdw4PARFnhtORwXUhBF9FvN6Q2WBRDS257GnOdm+lm1TdWTj9XcnTN0
         i4InKCiMqAyt5Iwv+FpmGadYu4KVvQdbW8BFcCp+YKZ3c2oXvLEOkVz/zhicc8idGHJs
         JIwAPm+qo1nxEUqxyKuoq7CM8nQCawzD54UahOoqvgSOOFrgDpf6+PO/7McoNIVWpVnS
         IChQ==
X-Forwarded-Encrypted: i=1; AJvYcCV40NkClnkWo10+m/YdEekNC0EzgNXuHGfTWjb+yQLPu4qXU3gLiCvj6NmRabXEaqkiYxJFK8svE8AlMtw=@vger.kernel.org, AJvYcCXhfhJaaEFyRf+EBLwXg7kMNTTtJYiWuaRhB+aNo9evNAcICdR44JWVrytlQjMHWdP8P0iriTqfVFGwccl+f82VL3enww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaUpiMyz2JYDJudqeLzM4//8LOyABrLNs12XMhbTpTdLdI9hV
	4mUICpqo4DBKvU2kOcqF8K1YOgMoTWIhkhEfRPBp515CQ3E1HVITLcpkbo43Um5Hb14=
X-Gm-Gg: ASbGncsi5vU4rpvcLzk/wQ/i7fUJfh7Io7qUuv/6DoNmBO8khUp7liAt/RL7tFxZBgO
	Vqx6mcdIyORqJok1EGeHW9bGkLXrMgjKwFEXpGDHgwu5j3TWAsPNIGf4yj07u+uybaxuXtGxStu
	ehPbcIDAZmOBFUYFIC0OGtbdnAxHQc48NyqCDxqJTGDCknA+fBpuvw5WVh15pfpayBD7eIGiAdj
	FeQYt7Ae5ykfY7Ye/IUpv9FFYLfk0mazHa4Sx6HTQqYVYvHF0kQyqSqk2sRFkkU997mV6CLHgmx
	G3p4OFnya7YSho1HZxP/T2u0bbs0x7WJXryFv9p+PmOAPkDpK3nP8PoC6ENSUdTCuRV9Vh79wAE
	DDiyRajYBHOHas65Tgqec
X-Google-Smtp-Source: AGHT+IEw3hhlKJRcMUzHuzKO1rw6TvC8R7p9gAJ3v0/KKs3e1HW3vYBl/yN61KAiYKFTtnjTC3lxAw==
X-Received: by 2002:a05:6602:4184:b0:862:fe54:df4e with SMTP id ca18e2360f4ac-87336666a93mr893399939f.7.1749314331164;
        Sat, 07 Jun 2025 09:38:51 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-873387ae340sm82058139f.19.2025.06.07.09.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 09:38:50 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso13923985ab.1;
        Sat, 07 Jun 2025 09:38:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVG9Xz56pr+hDUCeywn4Dy1vir3hpEPc5qUgEvC1CGnfYY2T1PEshnFjAj+wCbN0fXod2jQIJfba79Dj/AZEqMmSfaKHQ==@vger.kernel.org, AJvYcCWaiV+I/VeGkCSZU7sjVgy1jePES9GPgRrj4bcsIqeK8pw4K7PGyRHcnz3NXYJntGDVp/keoQlh0b4ve4o=@vger.kernel.org
X-Received: by 2002:a05:6e02:1a26:b0:3dd:b4b5:5c9f with SMTP id
 e9e14a558f8ab-3ddce453399mr78856555ab.19.1749314329834; Sat, 07 Jun 2025
 09:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
In-Reply-To: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 7 Jun 2025 18:38:38 +0200
X-Gmail-Original-Message-ID: <CAMF+KeYRpBFN=E=ZQm+Ho51QH4_-53VOe+Pup8SUiXOn6-sFRA@mail.gmail.com>
X-Gm-Features: AX0GCFvnsbSA_39d0RMRCWDI8P_LOqahd0JPO5j6fXi6tV2uyRl7IYYvltrKObQ
Message-ID: <CAMF+KeYRpBFN=E=ZQm+Ho51QH4_-53VOe+Pup8SUiXOn6-sFRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] platform/x86: firmware_attributes_class: Add a
 high level API
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Joshua Grisham <josh@joshuagrisham.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Armin Wolf <W_Armin@gmx.de>, Mario Limonciello <mario.limonciello@amd.com>, 
	Antheas Kapenekakis <lkml@antheas.dev>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den l=C3=B6r 17 maj 2025 kl 10:52 skrev Kurt Borja <kuurtb@gmail.com>:
>
> Hi all,
>
> These series adds the _long awaited_ API for the Firmware Attributes
> class.
>
> You'll find all the details in the commit messages and kernel-doc.
>
> I think it's easier to understand by example, so I used the
> samsung-galaxybook driver for this purpose (last patch). IMO code
> readibility, simplicity, maintainability, etc. is greatly improved, but
> there is still room for improvement of the API itself. For this reason I
> submitted this as an RFC.
>
> As always, your feedback is very appreciated :)
>
> Overview
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> Patch 1-2: New API with docs included.
>   Patch 3: New firwmare attributes type
>   Patch 4: Misc Maintainers patch
>   Patch 5: samsung-galaxybook example
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> Changes in v2:
>
> [Patch 1]
>  - Include kdev_t.h header
>
> [Patch 2]
>  - Use one line comments in fwat_create_attrs()
>  - Check propagate errors in fwat_create_attrs()
>  - Add `mode` to fwat_attr_config and related macros to let users
>    configure the `current_value` attribute mode
>  - Use defined structs in fwat_attr_ops instead of anonymous ones
>  - Move fwat_attr_type from config to ops
>
> [Patch 5]
>  - Just transition to new API without chaing ABI
>
> - Link to v1: https://lore.kernel.org/r/20250509-fw-attrs-api-v1-0-258afe=
d65bfa@gmail.com
>
> ---
> Kurt Borja (4):
>       platform/x86: firmware_attributes_class: Add a high level API
>       platform/x86: firmware_attributes_class: Add a boolean type
>       MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
>       platform/x86: samsung-galaxybook: Transition to new firmware_attrib=
utes API
>
> Thomas Wei=C3=9Fschuh (1):
>       platform/x86: firmware_attributes_class: Add device initialization =
methods
>
>  .../ABI/testing/sysfs-class-firmware-attributes    |   1 +
>  MAINTAINERS                                        |   7 +
>  drivers/platform/x86/firmware_attributes_class.c   | 454 +++++++++++++++=
++++++
>  drivers/platform/x86/firmware_attributes_class.h   | 276 +++++++++++++
>  drivers/platform/x86/samsung-galaxybook.c          | 308 ++++++--------
>  5 files changed, 861 insertions(+), 185 deletions(-)
> ---
> base-commit: 9f080c9f2099b5a81c85b3b7f95fd11fad428cc8
> change-id: 20250326-fw-attrs-api-0eea7c0225b6
> --
>  ~ Kurt
>

Hi Kurt! First let me begin by saying GREAT job in picking this up,
carrying on the work from Thomas, and really trying to glue all of the
various pieces together into a packaged solution that can finally see
the light of day :)

Sorry it has taken some time for me to get back to you--work and other
life stuff seemed to always get in the way and I wanted to make sure I
took enough time to really think about this before I were to give any
feedback myself.

First off, the quick and easy one:  I applied all of your patches (on
top of 6.15.1), tested everything with samsung-galaxybook from my
device, and everything is still working without any failures and all
features work as I expect them to. I diffed everything under
/sys/class/firmware-attributes before vs after and everything is
exactly the same EXCEPT it looks like what is currently
"default_value" will now be called "default" with your patch. I assume
if the intention is to keep the ABI same as before then you would
probably want to change this? Specifically here:

> +static const char * const fwat_prop_labels[] =3D {
> +        [FWAT_PROP_DISPLAY_NAME] =3D "display_name",
> +        [FWAT_PROP_LANGUAGE_CODE] =3D "display_name_language_code",
> +        [FWAT_PROP_DEFAULT] =3D "default",

Assume the last line should instead be

        [FWAT_PROP_DEFAULT] =3D "default_value",

or maybe even for consistency to rename the fwat_property to also
match and then it could be like this?

        [FWAT_PROP_DEFAULT_VALUE] =3D "default_value",

FWIW I don't personally mind changing the ABI for samsung-galaxybook;
as you mentioned it is basically a brand new driver and the solutions
which exist "in the wild" for it are quite limited so better maybe
that it looks "right" going forward instead of carrying any
unnecessary baggage, but I can understand that this may not be the
case for all of the other drivers which have been using these
facilities for a longer time period.

Past that, I certainly think this is a big step forward as compared to
messing around with the lower level kset / kobj_attribute etc
facilities and trying to set everything up from scratch without so
many helper utilities. As you may have noticed, what I ended up doing
in samsung-galaxybook was essentially to create my own local
implementation of some kind of "standard" fw attributes (but only for
booleans), but it would be even better if this were standardized
across all drivers! There are a few things left over in
samsung-galaxybook that still need to be cleaned up from your
suggested change (e.g. the struct galaxybook_fw_attr can now be
totally removed, etc) which we can also address at some point, of
course!

But just to take a step back for a moment, and what I have been really
trying to think through and reflect on myself for a few hours with
this change...

(Please feel free to completely disregard the below if this has
already been brought up and ruled out, or anyone else has any opinions
against this; all of that feedback is welcome and most definitely
trumps my own meager opinions! ;) Also please remember that it is not
my intention at all to detract from any of the great work that has
already been done here -- just the stuff that my brain kind of gets
"stuck" on as I try to think through the bigger picture with this! )

If I think in terms of anyone who wants to come in and work on device
drivers in the kernel, then they will potentially need to learn
facilities for multiple different kind of "attributes" depending on
their use case: device attributes, driver attributes, hwmon's
sensor-related attributes, bus attributes, etc etc, and for the most
part, I think they ALL have basically the same kind of interface and
facilities. It feels very unified and relatively easy to work with all
of them once you have basically figured out the scheme and conventions
that have been implemented.

Now, when I look at the proposal from these patches, these "Firmware
Attributes" do not seem to have the same kind of "look, feel, and
smell" as the other type of attributes I just mentioned, but instead
feels like a totally new animal that must be learned separately. My
take on it would be that a desired/"dream" scenario for a device
driver developer is that all of these interfaces sort of look and
"smell" the same, it is just a matter of the name of the macro you
use, which device you attach the attributes to (which registration
function you need to execute??), and maybe some small subtle
differences in the facilities as appropriate to their context.

Specifically with firmware attributes vs the other kinds, I guess the
biggest differences are that:
1) There is a display_name with a language code
2) There are built-in restrictions on the input values depending on a
"type" (e.g. "enumeration" type has a predetermined list of values,
min/max values or str lengths for numeric or string values, etc)
3) There is a default_value
4) *Maybe* there should be some kind of inheritance and/or sub-groups
(e.g. the "authentication" and similar extensions that create a group
under the parent group...)

But at the end of the day, my hope as a developer would be to be able
to create these firmware attributes in much the same way as the other
types. E.g. maybe something like this quick and dirty pseudo example:


static ssize_t power_on_lid_open_show(struct device *dev,
                                      struct device_attribute *attr,
                                      char *buf)
{
        // ...
}

static ssize_t power_on_lid_open_store(struct device *dev,
                                       struct device_attribute *attr,
                                       const char *buf, size_t count)
{
        // ...
}

static FW_BOOL_ATTR_RW(power_on_lid_open, "Power On Lid Open");

static struct attribute *galaxybook_fw_attrs[] =3D {
        // ... other fw attrs not shown above ...
       &fw_attr_power_on_lid_open.attr,
        NULL
};

static const struct attribute_group galaxybook_fw_attrs_group =3D {
        .attrs =3D galaxybook_fw_attrs,
        .is_visible =3D galaxybook_fw_attr_visible,
};

static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
{
        // ...

        /* something like "devm_fw_attr_device_register" could be sort
of similar to
           how devm_hwmon_device_register_with_groups works ? */

        ret =3D devm_fw_attr_device_register(&galaxybook->platform->dev,
                                          DRIVER_NAME, galaxybook,
                                          &galaxybook_fw_attrs_group);
        return PTR_ERR_OR_ZERO(ret);
}


Or in other words:
- I create my callback functions for "show" and "store" with a certain
named prefix and then use a macro to create the struct for this fw
attr that relies on that these functions exist (e.g. in the above
example the macro would create this "fw_attr_power_on_lid_open" fw
attr structure instance) -- note here it might need to be a macro per
type and/or to include the type-related stuff (including value
constraints/enumeration arrays/default values/etc) as parameters to
the macro, plus maybe I would want to provide some kind of context
parameter e.g. I would maybe want a pointer to my samsung_galaxybook
ideally somehow to get to come along?? (that might affect the
signature of my above examples of course! they were just a
quick-and-dirty example...),
- put all of my desired attrs together in a group where I can specify
their is_visible callback (just like you do with DEVICE_ATTRs),
- and then register my fw attr device with my attribute_group (the
register function would take care of all the rest..)

And as sort of shown in the above example I certainly think it would
be nice if the naming convention lined up nicely with how the naming
convention works for the existing attribute stuff (e.g. DEVICE_ATTR_RW
vs DRIVER_ATTR_RW vs something like "FW_ATTR_RW" or "FIRMWARE_ATTR_RW"
seems like it falls into the same convention??)

Again I am not trying to "rock the boat" here, and I have not
necessarily *really* thought through all of the implications to the
existing fw attrs extensions and how they might be able to be
implemented with the above kind of example, ... I'm just taking a step
back and sharing my observations of the patch compared to how it
actually looks in the driver with the example vs how most of the other
existing attribute facilities have been designed.

One more final thing which I always felt a little "off" about -- is it
not the case that other type of platforms might could use firmware
attributes as well? Or is this considered ONLY an x86 thing (e.g. that
"firmware" relates to "BIOS" or something) ? Because I always thought
it a bit strange that the header file was only local to
./drivers/platform/x86/ instead of being part of the Linux headers
under ./include ..

And in the same vein as that, is it not the case that other attributes
could benefit from this "typing" mechanism with constraints (e.g.
DEVICE_ATTR of type "enumeration" that only allows for one of a list
of values ? or a number with min/max value / a string with min/max
length etc etc??). I understand this poses an even bigger question and
much larger change (now we are really talking a HUGE impact! ;) ), but
my first guess is that it would probably be sort of nice to have these
types and this automatic constraints mechanism to be somewhat
universal across other type of attributes, otherwise every single
driver author/maintainer has to write their own manual code for the
same kinds of verifications in every function of every driver (e.g.
write an if statement to check the value in every store function of
every attribute they create, and then otherwise return -EINVAL or
similar... this kind of code exists over and over and over in the
kernel today!).

Anyway I hope this all was of some use, and, as mentioned, please feel
free to take all I have said here "with a pinch of salt" -- I would
definitely hope and encourage that others with longer service records
here could chime in regarding this!

Thanks again for the contribution, great work, and have a nice weekend!

Best regards,
Joshua
