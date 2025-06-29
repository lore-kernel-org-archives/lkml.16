Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4D1CA84;
	Sun, 29 Jun 2025 23:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751240283; cv=none; b=UZzlMjv9e7i15CfCUpsMg2v3SfjdGqoE2lDiW3e44PXG+ochYXq0qHCDuo5C1Qv1cGqy4e+pEJwVnQGFld2pQJEahXaACimAAI9a0KOeKpTrklY99finmbhHoLTU9UbHctWY2XzWOJ+Bd65L7PwbQArngUUJd6nD02e3WXdzgNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751240283; c=relaxed/simple;
	bh=8RS+dxkZbuGdmC+7DeTpw3+PJ0tyipXZW3amGzEHgHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jW2vHilOS4XqNDD3u774Oh4JYTHiIoqc8/Cr1L6Hji/q1WhyBQSgEPKbOXdHjK1o7LFfGioguPWEzc0oa0HekwqGH5w8pCF7mKS5aVCycknpYMd2mBa6wWvSCQSAmBo2wd+b6GDUad44NZqMinENBDXyHlur9cE5ykCw5Kq8qgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=np3sJKKi; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="np3sJKKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751240266; x=1751845066; i=w_armin@gmx.de;
	bh=UfseTpRy2Xh/PCATDYWRgj3JQpfki2UklzAhSsCWRoY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=np3sJKKiiXWbnDbVijZxPTqMiMK+A37LI7gnDSOIw10dy2C4A8dtbdGSejdgH+Cx
	 BGBgbjtU5pNcKklUFwS4F7n02u09tatzWzgNWxnGwn6bKyyjvzsFlCQhGG9l3YaCW
	 EScuBNgeZyjOPYp+cE9Qs1+MeKdJJQX0Z79mKbi8EW2Rq7j9Cro4HK7L9ORBkcfuI
	 PZJodaAwUHDWkce3WjK6jU3Oby+RWVipUBUNBOlY+vN0YQO/ny5e6QOhCFe+Ol8Fw
	 QqoR2wcRYIh9kVA3kBRvDwogr4a+PlmMOIyq93Qh4nWu2ftmNBqr6iR1uxGdg0pmj
	 GfY5cCKxt+dgSP99wA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3W0-1uIBvw1C8s-00IkoK; Mon, 30
 Jun 2025 01:37:46 +0200
Message-ID: <6a9b6660-acd2-44b4-a57e-2245043471ab@gmx.de>
Date: Mon, 30 Jun 2025 01:37:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Fix WMI data block
 retrieval in sysfs callbacks
To: Kurt Borja <kuurtb@gmail.com>, Prasanth Ksr <prasanth.ksr@dell.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Divya Bharathi <divya.bharathi@dell.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jan Graczyk <jangraczyk@yahoo.ca>
References: <20250629-sysman-fix-v1-1-fce0000a781d@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250629-sysman-fix-v1-1-fce0000a781d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pTzSc8d0QINnOn/L5iAuo4OEE6uYbo7TGPt8mceQDhlqhWgbT94
 uHnESaxHPN3Q9uQiAb8HfCUttcj7YKZsszYxtLj5V6rsnjUtizzT3YUqu5MQo0a0PHrnXOk
 FL4kuOgFaGQhTXANgkqlsylsFfIFnrt86MLL94bC85Ma4x2k5xk7J6vlOi6a5fQjAvpY3GA
 5MebFsXYSeI8ByW+mT1PA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mcU180uSLjA=;jJ5sc7CUy05btWsuKEJX/BVDa9T
 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

Am 29.06.25 um 20:33 schrieb Kurt Borja:

> After retrieving WMI data blocks in sysfs callbacks, check for the
> validity of them before dereferencing their content.
>
> Reported-by: Jan Graczyk <jangraczyk@yahoo.ca>
> Closes: https://lore.kernel.org/r/CAHk-=3DwgMiSKXf7SvQrfEnxVtmT=3DQVQPjJ=
dNjfm3aXS7wc=3DrzTw@mail.gmail.com/
> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Manage=
ment Driver over WMI for Dell Systems")
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h    | 7 +++=
++++
>   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c    | 5 +++=
=2D-
>   drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c     | 5 +++=
=2D-
>   drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 5 +++=
=2D-
>   drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c  | 5 +++=
=2D-
>   drivers/platform/x86/dell/dell-wmi-sysman/sysman.c             | 8 +++=
+----
>   6 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h=
 b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> index 3ad33a094588c6a258786a02f952eaa6bf953234..792e7d865bfb1cfc13b59c90=
ddf7de47feff408f 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> @@ -89,6 +89,13 @@ extern struct wmi_sysman_priv wmi_priv;
>  =20
>   enum { ENUM, INT, STR, PO };
>  =20
> +enum {
> +	ENUM_MIN_ELEMENTS	=3D 8,
> +	INT_MIN_ELEMENTS	=3D 9,
> +	STR_MIN_ELEMENTS	=3D 8,
> +	PO_MIN_ELEMENTS		=3D 4,
> +};

Hi,

are you sure that this works? I suggest we use defines instead as ENUM_MIN=
_ELEMENTS has the same value as STR_MIN_ELEMENTS.

For the rest:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
>   enum {
>   	ATTR_NAME,
>   	DISPL_NAME_LANG_CODE,
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c=
 b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> index 8cc212c852668312096f756bc1fb1e3054a1f5c0..fc2f58b4cbc6eff863f2c329=
3cb4322d28048bb8 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> @@ -23,9 +23,10 @@ static ssize_t current_value_show(struct kobject *kob=
j, struct kobj_attribute *a
>   	obj =3D get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_ENUMERATION_ATT=
RIBUTE_GUID);
>   	if (!obj)
>   		return -EIO;
> -	if (obj->package.elements[CURRENT_VAL].type !=3D ACPI_TYPE_STRING) {
> +	if (obj->type !=3D ACPI_TYPE_PACKAGE || obj->package.count < ENUM_MIN_=
ELEMENTS ||
> +	    obj->package.elements[CURRENT_VAL].type !=3D ACPI_TYPE_STRING) {
>   		kfree(obj);
> -		return -EINVAL;
> +		return -EIO;
>   	}
>   	ret =3D snprintf(buf, PAGE_SIZE, "%s\n", obj->package.elements[CURREN=
T_VAL].string.pointer);
>   	kfree(obj);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c =
b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> index 951e75b538fad42509614c2ebf2ef77aa05b614f..73524806423914bf210b9b5f=
78c0b5b4f6a7984c 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> @@ -25,9 +25,10 @@ static ssize_t current_value_show(struct kobject *kob=
j, struct kobj_attribute *a
>   	obj =3D get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_INTEGER_ATTRIBU=
TE_GUID);
>   	if (!obj)
>   		return -EIO;
> -	if (obj->package.elements[CURRENT_VAL].type !=3D ACPI_TYPE_INTEGER) {
> +	if (obj->type !=3D ACPI_TYPE_PACKAGE || obj->package.count < INT_MIN_E=
LEMENTS ||
> +	    obj->package.elements[CURRENT_VAL].type !=3D ACPI_TYPE_INTEGER) {
>   		kfree(obj);
> -		return -EINVAL;
> +		return -EIO;
>   	}
>   	ret =3D snprintf(buf, PAGE_SIZE, "%lld\n", obj->package.elements[CURR=
ENT_VAL].integer.value);
>   	kfree(obj);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attribute=
s.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> index d8f1bf5e58a0f441cfd6c21f299c5426b2e28ce9..3167e06d416ede61cda5ad4c=
860dcb41b05cd5fa 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> @@ -26,9 +26,10 @@ static ssize_t is_enabled_show(struct kobject *kobj, =
struct kobj_attribute *attr
>   	obj =3D get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_PASSOBJ_ATTRIBU=
TE_GUID);
>   	if (!obj)
>   		return -EIO;
> -	if (obj->package.elements[IS_PASS_SET].type !=3D ACPI_TYPE_INTEGER) {
> +	if (obj->type !=3D ACPI_TYPE_PACKAGE || obj->package.count < PO_MIN_EL=
EMENTS ||
> +	    obj->package.elements[IS_PASS_SET].type !=3D ACPI_TYPE_INTEGER) {
>   		kfree(obj);
> -		return -EINVAL;
> +		return -EIO;
>   	}
>   	ret =3D snprintf(buf, PAGE_SIZE, "%lld\n", obj->package.elements[IS_P=
ASS_SET].integer.value);
>   	kfree(obj);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes=
.c b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> index c392f0ecf8b55ba722246d67ba0073772a4f0094..0d2c74f8d1aad7843effcd7b=
600dd42e6947dc15 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> @@ -25,9 +25,10 @@ static ssize_t current_value_show(struct kobject *kob=
j, struct kobj_attribute *a
>   	obj =3D get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_STRING_ATTRIBUT=
E_GUID);
>   	if (!obj)
>   		return -EIO;
> -	if (obj->package.elements[CURRENT_VAL].type !=3D ACPI_TYPE_STRING) {
> +	if (obj->type !=3D ACPI_TYPE_PACKAGE || obj->package.count < STR_MIN_E=
LEMENTS ||
> +	    obj->package.elements[CURRENT_VAL].type !=3D ACPI_TYPE_STRING) {
>   		kfree(obj);
> -		return -EINVAL;
> +		return -EIO;
>   	}
>   	ret =3D snprintf(buf, PAGE_SIZE, "%s\n", obj->package.elements[CURREN=
T_VAL].string.pointer);
>   	kfree(obj);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/driver=
s/platform/x86/dell/dell-wmi-sysman/sysman.c
> index d00389b860e4ea0655c740c78bc3751f323b6370..3c74d5e8350a413a55739ca5=
e9647be30bac50d4 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -407,10 +407,10 @@ static int init_bios_attributes(int attr_type, con=
st char *guid)
>   		return retval;
>  =20
>   	switch (attr_type) {
> -	case ENUM:	min_elements =3D 8;	break;
> -	case INT:	min_elements =3D 9;	break;
> -	case STR:	min_elements =3D 8;	break;
> -	case PO:	min_elements =3D 4;	break;
> +	case ENUM:	min_elements =3D ENUM_MIN_ELEMENTS;	break;
> +	case INT:	min_elements =3D INT_MIN_ELEMENTS;	break;
> +	case STR:	min_elements =3D STR_MIN_ELEMENTS;	break;
> +	case PO:	min_elements =3D PO_MIN_ELEMENTS;		break;
>   	default:
>   		pr_err("Error: Unknown attr_type: %d\n", attr_type);
>   		return -EINVAL;
>
> ---
> base-commit: 173bbec6693f3f3f00dac144f3aa0cd62fb60d33
> change-id: 20250629-sysman-fix-9c527a28f1dd
