Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C483F19D897;
	Tue, 10 Jun 2025 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749518470; cv=none; b=YmEUWjwJu2HSgqX26vghSmHOPXr8+XHkcto8SDVpRmgw6ud79GDwEJqQgjeIxGQHcMBhUB7G1Pt3pQLuoXfmMVDmJ1BKb+17c65xoSHj0ANhEzNVB4MDFeVK7WQyXvXrRLEVD9iXYlA01OcI8eQbfPkvULYQkSihj7g5sjeuXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749518470; c=relaxed/simple;
	bh=myND2InSTUgExsryzdRzB7GF2Hi9KdDgiMB+5glOQMk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DcioheASOmXM4uqkRM9g0tPbB5mNElyJqickThAr5LUj2nHcwY6Asb9RiqoTFCzNgxwO3k1sQpoNGSzXAPbQeN9kjSMYznY/nBdY8/r8UKYmjFHvufon8jAJs3+BTSSgZ9hHn65FMFwH1ETJfMOSGHnJykqGIRou3JZHXi1N5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=dxLUZhms; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G2ocjAi1; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="dxLUZhms";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G2ocjAi1"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id C5BF313805FB;
	Mon,  9 Jun 2025 21:21:05 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-06.internal (MEProxy); Mon, 09 Jun 2025 21:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749518465;
	 x=1749604865; bh=mRHeRCM7dMw5ninU+q/zq98CdtUDj/25CGhSAk5kB3M=; b=
	dxLUZhmsnVQlZqjspbeJXbdCV/G2cvBe+Wigw6Le055/1yAoz1h8m3haZKqoKZN/
	c7d9Ub6kUs4/bfdFazvJLm2XdSRv5tM/FUXNfQpCHGx0ZjiVClD6fx/e49cb4rXu
	jV+ZIuNefntBh/d5+/KOd2LwXVvsVpGHu3eZWGIEhwa0/5pH4qlgHe9jCk5c/MAq
	MWEF7ooZN7YSKM2Asj2MgTl1jCA4KrvYHuao0B9p3Q/sqBbCySgda7R2lJUN1FJr
	5pthLe3UpbMPLxp9Emhdb0sS55V8HcHVRu8ZIJ6TjnfupxbmavFtm7RaTH46IsdK
	9Lct28R52xosyKzv6kkfvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749518465; x=
	1749604865; bh=mRHeRCM7dMw5ninU+q/zq98CdtUDj/25CGhSAk5kB3M=; b=G
	2ocjAi1HXm8tgDZ7m3hTWPFXsXalLPxaq89MbH3DhcvY9uwchzZTVb0wiCWVyWam
	LYxRxWcCH0Z5vC2w8tGSOxIuQJUmOfiCp/genjvQshG4KBu8Wq7PqYqgotcmFeEm
	mjbKCndOG8suRTHKhaxcDaKEC2HiOS4w7FfixA0TxMxw+42+Ab8ZHjGv98SbMIzC
	VRF1udNKA4tmPY7mAypwyKemXW+6QiWw5ujPlLy976/olIq0nrpJnt6b6mEy59eX
	Cm0k+5W5QCuIp3w7kPg05EDE6CIK/1TTV83aFDmaS8St//CR21Lh5Hu98HEnsXOJ
	VdBPBPRHRu/woQm/u55Ig==
X-ME-Sender: <xms:gYhHaOGh_lVB-aBX9MgBxyoDop_2mnq1Y0La2sL80ZOboMgr7parIQ>
    <xme:gYhHaPUuPQRd0x077RxAo-Nu2D4zOjuNPfa25crM7gLcxjR6ID-Ain9tmbvTaFFfE
    XnwoeE8c36klG2iy3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
    gvvheqnecuggftrfgrthhtvghrnhepheetudfgleegledtveevtdelfffhtefgtdejhfek
    gfdujeefueeufedvjeduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnh
    eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgv
    ughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiek
    ieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gYhHaIJ0eX1WWvB6zNMqtVfynsfGQoTkxxvIygk9szITVtmsKP_tJw>
    <xmx:gYhHaIHTHvSD2KM0sCHJ0_ERupv9qa54CQPAmTQP_Z7ZyUy0hS7VPw>
    <xmx:gYhHaEW4Vbh72_dSMvn_RO6Qo4jyCV8vzWPfRvFRs--BIGpypWdbcQ>
    <xmx:gYhHaLMPkLbh-AKa81dSdt8Z9hcHjWSpkwgB9hxydmXtkF0BbWQHcA>
    <xmx:gYhHaGieGW4Lbt9CE3AR7OaNEReoyR5QTdC1rbL58LOlyT-Ag4lqpptQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0E81E780070; Mon,  9 Jun 2025 21:21:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tbb68e015d7f519ae
Date: Tue, 10 Jun 2025 13:20:43 +1200
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Hans de Goede" <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Message-Id: <8e4814ab-79c8-4be4-bc63-9f15d2ee315a@app.fastmail.com>
In-Reply-To: <c9b74180-8e3b-2ed8-bb68-03ca9d8ed074@linux.intel.com>
References: <20250525204214.104030-1-luke@ljones.dev>
 <c9b74180-8e3b-2ed8-bb68-03ca9d8ed074@linux.intel.com>
Subject: Re: [PATCH] asus-wmi: fixup screenpad brightness
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jun 2025, at 7:31 PM, Ilpo J=C3=A4rvinen wrote:
> On Sun, 25 May 2025, Luke Jones wrote:
>
>> Fix up some inconsistent behaviour involving the screenpad on some
>> ASUS laptops. This fixes:
>> - illogical screen off control (0/1 flipped depending on WMI state)
>> - bad brightness depending on the last screenpad power state
>> - incorrect brightness scaling
>
> Why did you put them all into a single patch? I understand there's som=
e=20
> overlap in lines they touch but if they can be separated, it would be=20
> much better and I'd likely have much higher confidence on each change.

Because it wasn't easy or practical to try and fix just one part - the s=
creenpad is quite funky in how it works (and extremely annoying) where t=
rying to fix power made brightness behave out of sync, or fixing brightn=
ess made power appear to be randomly affecting brightness. In the end it=
 was easier to steamroll the whole thing. It's now been quite thoroughly=
 tested on an actual screenpad based laptop that asus sent me.

I'm not keen on sinking more in to this beyond fixes. I simply do not ha=
ve the time this year.

>
>> Signed-off-by: Luke Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 52 +++++++++++++------------------=
--
>>  1 file changed, 21 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
>> index f52884e90759..cec509171971 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -123,7 +123,6 @@ module_param(fnlock_default, bool, 0444);
>>  #define NVIDIA_TEMP_MIN		75
>>  #define NVIDIA_TEMP_MAX		87
>> =20
>> -#define ASUS_SCREENPAD_BRIGHT_MIN 20
>>  #define ASUS_SCREENPAD_BRIGHT_MAX 255
>>  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>> =20
>> @@ -4239,43 +4238,37 @@ static int read_screenpad_brightness(struct b=
acklight_device *bd)
>>  		return err;
>>  	/* The device brightness can only be read if powered, so return sto=
red */
>>  	if (err =3D=3D BACKLIGHT_POWER_OFF)
>> -		return asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_=
MIN;
>> +		return bd->props.brightness;
>> =20
>>  	err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT,=
 &retval);
>>  	if (err < 0)
>>  		return err;
>> =20
>> -	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) - ASUS_SCREENPAD_BR=
IGHT_MIN;
>> +	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK);
>>  }
>> =20
>>  static int update_screenpad_bl_status(struct backlight_device *bd)
>>  {
>> -	struct asus_wmi *asus =3D bl_get_data(bd);
>> -	int power, err =3D 0;
>> +	int err =3D 0;
>>  	u32 ctrl_param;
>> =20
>> -	power =3D read_screenpad_backlight_power(asus);
>> -	if (power < 0)
>> -		return power;
>> -
>> -	if (bd->props.power !=3D power) {
>> -		if (power !=3D BACKLIGHT_POWER_ON) {
>> -			/* Only brightness > 0 can power it back on */
>> -			ctrl_param =3D asus->driver->screenpad_brightness - ASUS_SCREENPA=
D_BRIGHT_MIN;
>> -			err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
>> -						    ctrl_param, NULL);
>> -		} else {
>> -			err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, =
NULL);
>> -		}
>> -	} else if (power =3D=3D BACKLIGHT_POWER_ON) {
>> -		/* Only set brightness if powered on or we get invalid/unsync stat=
e */
>> -		ctrl_param =3D bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>> +	ctrl_param =3D bd->props.brightness;
>> +	if (ctrl_param >=3D 0 && bd->props.power) {
>> +		err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1,
>> +					    NULL);
>> +		if (err < 0)
>> +			return err;
>> +		ctrl_param =3D bd->props.brightness;
>>  		err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl=
_param, NULL);
>> +		if (err < 0)
>> +			return err;
>>  	}
>> =20
>> -	/* Ensure brightness is stored to turn back on with */
>> -	if (err =3D=3D 0)
>> -		asus->driver->screenpad_brightness =3D bd->props.brightness + ASUS=
_SCREENPAD_BRIGHT_MIN;
>> +	if (!bd->props.power) {
>> +		err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, N=
ULL);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> =20
>>  	return err;
>>  }
>> @@ -4293,22 +4286,19 @@ static int asus_screenpad_init(struct asus_wm=
i *asus)
>>  	int err, power;
>>  	int brightness =3D 0;
>> =20
>> -	power =3D read_screenpad_backlight_power(asus);
>> +	power =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENP=
AD_POWER);
>>  	if (power < 0)
>>  		return power;
>> =20
>> -	if (power !=3D BACKLIGHT_POWER_OFF) {
>> +	if (power) {
>>  		err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT=
, &brightness);
>>  		if (err < 0)
>>  			return err;
>>  	}
>> -	/* default to an acceptable min brightness on boot if too low */
>> -	if (brightness < ASUS_SCREENPAD_BRIGHT_MIN)
>> -		brightness =3D ASUS_SCREENPAD_BRIGHT_DEFAULT;
>> =20
>>  	memset(&props, 0, sizeof(struct backlight_properties));
>>  	props.type =3D BACKLIGHT_RAW; /* ensure this bd is last to be picke=
d */
>> -	props.max_brightness =3D ASUS_SCREENPAD_BRIGHT_MAX - ASUS_SCREENPAD=
_BRIGHT_MIN;
>> +	props.max_brightness =3D ASUS_SCREENPAD_BRIGHT_MAX;
>>  	bd =3D backlight_device_register("asus_screenpad",
>>  				       &asus->platform_device->dev, asus,
>>  				       &asus_screenpad_bl_ops, &props);
>> @@ -4319,7 +4309,7 @@ static int asus_screenpad_init(struct asus_wmi =
*asus)
>> =20
>>  	asus->screenpad_backlight_device =3D bd;
>>  	asus->driver->screenpad_brightness =3D brightness;
>> -	bd->props.brightness =3D brightness - ASUS_SCREENPAD_BRIGHT_MIN;
>> +	bd->props.brightness =3D brightness;
>>  	bd->props.power =3D power;
>>  	backlight_update_status(bd);
>> =20
>>=20
>
> --=20
>  i.
