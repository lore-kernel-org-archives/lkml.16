Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755E1C5D59;
	Mon, 19 May 2025 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663719; cv=none; b=tBiZvHGE7G7142BXrVqcm6vmcjm6SNAVoVyp5uJZYR2dbEBReZbkDRbelgHaoMX0P07GwW/qqxI7Jk7/2BbTDzD+ZdE/Y2ZRawdqWsJHhuMWswrImyuosnHAwM4U+NayoHz4sCv+B/7dOnnJvUVyVoO4tJSKaT6AHm6hRwIWNf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663719; c=relaxed/simple;
	bh=8T7NGv7d7tWIpOOBXk/4TJ26PxGzXqmY5IU5UrGnOk4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f2jnTE3qg5zglMvETit9EnOA9roLYM00J3BTqnAAQDuH5viF/BmDrM4h25I18Yp26YLSTv2Eg50WEr2+NvAc+z76Br8rCvWaoRk7POnTnYXfiUVIfxmWs/V8mUvxn7ES2m8Gl43I2xElvYScRpNseeYjlLs2T7WDiecOF9nFHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=hVEssWjM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YhnXHYUi; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="hVEssWjM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YhnXHYUi"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1414A2540139;
	Mon, 19 May 2025 10:08:35 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 19 May 2025 10:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747663714;
	 x=1747750114; bh=I2HuZ/kkeBIcsNQ3RVP9cq7dK577RDkD0dDThpCmdes=; b=
	hVEssWjMheQl6fJY4LhXF+laAAAs/I0+cgGw+tmuLU54b7+lCufDkuxMWBHMjUUS
	KyATYKaaGPlq4VXAc42p+CqJsE9WvUzW5yD3UcpMhqsqg3op9ti+GJ1+CkP0ssEz
	J3d6sazv1g2fuzyB4aViskWRagfMO+VCcxjF2OVJkbZoyiThE3KhF+US+pAmRPhs
	snp7INuttE2DA6X6A2x3qLUTPCvj8NIDyNF8kpv9Kkx9wl0xoqTYpxoAmxTgVOYw
	IBWdajt60caiIWdm+mpAU0Pi4v26a26eYyKrjEWWtBG1uLEs6Yl4Jfw3UxIwJbMO
	V+cBeC8ey4il3YmYrCBrSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747663714; x=
	1747750114; bh=I2HuZ/kkeBIcsNQ3RVP9cq7dK577RDkD0dDThpCmdes=; b=Y
	hnXHYUiVtrcNU99ibA8kigB9BMJ2o2sE4Nx0cHNMnycU837KrUrdF8pUfEGZLSgN
	kGbZU2Ri1oLJU5Q5FE1G7gAE0A+vVrBFibWYRAQH8ov3EDw9vNjXN9fcaSU0bwME
	I0qFfAybYJaEJgsUPcS1fnVIkda6Da0gWa7QyjE16L1P76/U9BSFe2SmOGkWB29v
	VLyj+L32uDQWmTMkD91JttwoFjRPseWHeauU1iyDKtgKmgPN3UENNnMJbjTRSYvF
	jj/CSXeGsZSfEK3+1K7Lpk0QoHTLIKQz7D7zh2q3XA+swrmD8lF/2U3TUKUdcOCH
	MMY8edy1r5MhPu1yXcLEQ==
X-ME-Sender: <xms:YjsraJ8HIJhZdE8QJn-NkD6EGfuEO4sSs33yxW_uNRzRh7wG6HrWUw>
    <xme:YjsraNs0Br345TCNhhOh3hujnKTWVd2x0bvoB8KkZKj2ky8UpUY5pqo0xjk___Ca4
    n8oQJmGXHRcC2e0r1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:YjsraHCbZary7E5E3JoiGCzOQyHDTU8grpgX6CEB2vx7UHxXSujFtg>
    <xmx:YjsraNc6DYdC3JXVr_kFxOe9OrJjlMWuy5yOyEDayehYFGwHqXdvkQ>
    <xmx:YjsraOP79k9Vmano_wa5YW2z0wA0oLo0dHH4QHdw_SRYPA_K_jVM_Q>
    <xmx:YjsraPnNoYIWCVIytuhrHXQpleKhPZz8XEYlo9e3tSi-jj55fdTjAA>
    <xmx:YjsraK2Wup2nbQaEh2wN8RVsvkj6578j67-WxOP5D3p4OnxLFy_fcI8M>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 543E52CE005C; Mon, 19 May 2025 10:08:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc70349d634d0235e
Date: Mon, 19 May 2025 10:08:13 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <2072677c-069a-4e5a-9648-4c874d390712@app.fastmail.com>
In-Reply-To: <0fbeced8-a225-4151-dda5-086490f8345a@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250517023825.2968200-1-mpearson-lenovo@squebb.ca>
 <0fbeced8-a225-4151-dda5-086490f8345a@linux.intel.com>
Subject: Re: [PATCH] platform/x86: think-lmi: Fix attribute name usage for
 non-compliant items
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thanks for the review

On Mon, May 19, 2025, at 8:56 AM, Ilpo J=C3=A4rvinen wrote:
> On Fri, 16 May 2025, Mark Pearson wrote:
>
>> A few, quite rare, WMI attributes have names that are not compatible =
with
>> filenames. e.g. "Intel VT for Directed I/O (VT-d)".
>
> filenames. -> filenames,

OK.

>
>> For these cases the '/' gets replaced with '\' for display, but doesn=
't
>> get switched again when doing the WMI access.
>>=20
>> Fix this by keeping the original attribute name and using that for se=
nding
>> commands to the BIOS
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Fixes tag?

This has been wrong since the very first implementation. I considered ad=
ding a fixes for the first commit, but wasn't sure that was reasonable. =
Let me know if it should be added - I was a bit worried about triggering=
 other work for the stable maintainers.

>
>> ---
>>  drivers/platform/x86/think-lmi.c | 27 +++++++++++++++------------
>>  drivers/platform/x86/think-lmi.h |  1 +
>>  2 files changed, 16 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/=
think-lmi.c
>> index 0fc275e461be..be01085055a1 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -137,6 +137,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug com=
mand support");
>>   * You must reboot the computer before the changes will take effect.
>>   */
>>  #define LENOVO_CLEAR_BIOS_CERT_GUID  "B2BC39A7-78DD-4D71-B059-A510DE=
C44890"
>> +
>>  /*
>>   * Name: CertToPassword
>>   * Description: Switch from certificate to password authentication.
>
> An unrelated change.

Ah - my bad. I've been working on another patch (unrelated to this) and =
this change crept in when I removed those changes.

>
>> @@ -1061,8 +1062,8 @@ static ssize_t current_value_store(struct kobje=
ct *kobj,
>>  			ret =3D -EINVAL;
>>  			goto out;
>>  		}
>> -		set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_nam=
e,
>> -					new_setting, tlmi_priv.pwd_admin->signature);
>> +		set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
>> +				    new_setting, tlmi_priv.pwd_admin->signature);
>>  		if (!set_str) {
>>  			ret =3D -ENOMEM;
>>  			goto out;
>> @@ -1092,7 +1093,7 @@ static ssize_t current_value_store(struct kobje=
ct *kobj,
>>  				goto out;
>>  		}
>> =20
>> -		set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
>> +		set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
>>  				    new_setting);
>>  		if (!set_str) {
>>  			ret =3D -ENOMEM;
>> @@ -1120,11 +1121,11 @@ static ssize_t current_value_store(struct kob=
ject *kobj,
>>  		}
>> =20
>>  		if (auth_str)
>> -			set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_na=
me,
>> -					new_setting, auth_str);
>> +			set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
>> +					    new_setting, auth_str);
>>  		else
>> -			set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
>> -					new_setting);
>> +			set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
>> +					    new_setting);
>>  		if (!set_str) {
>>  			ret =3D -ENOMEM;
>>  			goto out;
>> @@ -1629,9 +1630,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
>>  			continue;
>>  		}
>> =20
>> -		/* It is not allowed to have '/' for file name. Convert it into '\=
'. */
>> -		strreplace(item, '/', '\\');
>> -
>>  		/* Remove the value part */
>>  		strreplace(item, ',', '\0');
>> =20
>> @@ -1644,11 +1642,16 @@ static int tlmi_analyze(struct wmi_device *wd=
ev)
>>  		}
>>  		setting->wdev =3D wdev;
>>  		setting->index =3D i;
>> +
>> +		strscpy(setting->name, item);
>> +		/* It is not allowed to have '/' for file name. Convert it into '\=
'. */
>> +		strreplace(item, '/', '\\');
>>  		strscpy(setting->display_name, item);
>> +
>>  		/* If BIOS selections supported, load those */
>>  		if (tlmi_priv.can_get_bios_selections) {
>> -			ret =3D tlmi_get_bios_selections(setting->display_name,
>> -					&setting->possible_values);
>> +			ret =3D tlmi_get_bios_selections(setting->name,
>> +						       &setting->possible_values);
>>  			if (ret || !setting->possible_values)
>>  				pr_info("Error retrieving possible values for %d : %s\n",
>>  						i, setting->display_name);
>> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/=
think-lmi.h
>> index a80452482227..9b014644d316 100644
>> --- a/drivers/platform/x86/think-lmi.h
>> +++ b/drivers/platform/x86/think-lmi.h
>> @@ -90,6 +90,7 @@ struct tlmi_attr_setting {
>>  	struct kobject kobj;
>>  	struct wmi_device *wdev;
>>  	int index;
>> +	char name[TLMI_SETTINGS_MAXLEN];
>>  	char display_name[TLMI_SETTINGS_MAXLEN];
>>  	char *possible_values;
>>  };
>>=20
>
> --=20
>  i.

Please confirm on if the fixes tag is needed or not, and I'll do v2 with=
 those minor changes

Thanks
Mark
