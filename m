Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555D297A61;
	Fri, 23 May 2025 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025897; cv=none; b=mDZ0E8sjgd3pOxqciO5odzN6sf4YKZ90s909geSZ2Gxrm4oUc69vC69K+Eis0EZbbVtDHMgConxHOC0OqxkhrbmET7vNof0Ysddxkq6Ai9IFg9MZLxV7kOWOmsrxSaFt+3qAxJYm+uMqIJkN0Pj5yqChDbN6RyUzZjmLslId9mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025897; c=relaxed/simple;
	bh=w3+ckWwblr2hnAQxmT7XGXfupK50WixMJtGQwz7BTgo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B1vJWN1RnBBEZS6zwg8s6KV6pGuzMiADi+jD1zujanopUeb9WC0W7ENfquwoCItWCU3WU5N+NqlDoXOxU8tsYcy7mbZq8B9FcGC7CW0iqNnpu4xCWoR+0KTVVKydnJTPwjK2YVbPxLetVxJ4Vh9GvtM0oZp+HQMxW5tdf6UEjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=WwDR7aZJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JL8g+rUY; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="WwDR7aZJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JL8g+rUY"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 4DD0411400FB;
	Fri, 23 May 2025 14:44:52 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-06.internal (MEProxy); Fri, 23 May 2025 14:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1748025892;
	 x=1748112292; bh=GPJ1h5jqsNk4y57wGuJrXw0EWMRQE+GNnl3P04KBWbE=; b=
	WwDR7aZJVDyXBXXo8mMWw4BiExVly1QyXDceI4kFgo+Kr3Bq09JIwkukDu3iNiwV
	ozu7jUTEokAzmxGy0fCZJaic0BizqsPKh9pEAba3pHytzH0rO7N8uQc6lbO716ut
	L1v23m6K4ib2uZ5Aoy+Q71UqIImd+V8ZEAZ2CN2x3okBGeGDEgrdhVae+jnPne5V
	R39Sf2CzBzFs9FUm/vDD2rMR9BoIuC9uLvg5FkUI94gDhMtDeT/zHiLGhd7BmP9q
	lnOjfdq5GRd/LVnrZH2BI7NkCqGuuk7hlfJITYFlhfIrJaqx5aWupEx+83+7IP2L
	TB7hrUKZdItig0FJUJD7cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1748025892; x=
	1748112292; bh=GPJ1h5jqsNk4y57wGuJrXw0EWMRQE+GNnl3P04KBWbE=; b=J
	L8g+rUYx0rt4HisGOoOpOThCr5JfFeF4A14hcjrIiIRdA9nGE4G9JSdzS6UND349
	mkOZxq7EXo35GEjerjuf4SQb62ZXgPsdN8J4g2TctsVQDZ7IpAGcr4YtsZOeM9ix
	mLtsTFxsggHr+gVdb4jYGc9xG9etUXlCvyXvBfb9bBA85JeL0qU437yMKRjx/dwK
	U4GhXJz+yilVnca33sy5w3PcdTAUOWIleYPQIDaoQF896OWbPQF3e+vjxdEpURXU
	YN0U43VnC3ze5pMP52FsBtSG4sOGd5UEjupswhErcGNeLoDZ5ycFIFRimbTfQbkB
	agOeU65TLo5KCVCMEvSOA==
X-ME-Sender: <xms:I8IwaJsYBQ9pxW8sAytrhhf2zhTcQKHbj-xiSfgGH5Mg2ANzT01uxA>
    <xme:I8IwaCfYIFrvYfun8-R7BX_Rvn-FgRufHDiqUw3xT0aCtjioPfKD_xQSoOplSrcbs
    t8xlphaemQO5w94MxI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeliedtucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtqhertdertdejnecuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluh
    hkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeekvedvjeehiefhkeff
    uefhtdeuleekffelgfeiuddvtdehkeethfehleehgeevudenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepjedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohes
    rghmugdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoh
    eprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:I8IwaMxqg-8oMTxbxtiHQP2u5RZnu_PxngIKxvbKZrfaUO9gmGxxOQ>
    <xmx:I8IwaAMt263H3ARhN-ZyonD2o_vaWhw4CClTc1lbu_jXnmx2f0IDVQ>
    <xmx:I8IwaJ-gykUKzYNCK2QO44hVBSwvzHTyaMFjAY5kR-6w7McFKAGjXA>
    <xmx:I8IwaAXaDznfWHtbHB8uYULr3nJjyHzwJKVICBmHh3O3b1AYz0uFYQ>
    <xmx:JMIwaFLDcO_gTHJNbZu-v1cTqrG8bAQYqI0gPWygqnd2MoHEGy_o21yt>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A52DE78006C; Fri, 23 May 2025 14:44:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T439e01dd90134ed9
Date: Fri, 23 May 2025 20:44:31 +0200
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Hans de Goede" <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "kernel test robot" <lkp@intel.com>
Message-Id: <5128b201-ab6e-4536-8c24-8263789a3d78@app.fastmail.com>
In-Reply-To: <0dc0316d-a9ae-c152-3737-be1c73a415b1@linux.intel.com>
References: <20250523131451.1942578-1-luke@ljones.dev>
 <20250523131451.1942578-2-luke@ljones.dev>
 <0dc0316d-a9ae-c152-3737-be1c73a415b1@linux.intel.com>
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: fix build without CONFIG_SUSPEND
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 23 May 2025, at 3:25 PM, Ilpo J=C3=A4rvinen wrote:
> On Fri, 23 May 2025, Luke Jones wrote:
>
>> The patch "Refactor Ally suspend/resume" introduced an
>
> The commit feea7bd6b02d ("...")
>
>> acpi_s2idle_dev_ops for use with ROG Ally which caused a build error
>> if CONFIG_SUSPEND was not defined.
>>=20
>> Signed-off-by: Luke Jones <luke@ljones.dev>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-l=
kp@intel.com/
>> Fixes: feea7bd6b02d ("platform/x86: asus-wmi: Refactor Ally suspend/r=
esume")
>> ---
>>  drivers/platform/x86/asus-wmi.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
>> index 27f11643a00d..087318e0d595 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -5005,6 +5005,7 @@ static int asus_hotk_restore(struct device *dev=
ice)
>>  	return 0;
>>  }
>> =20
>> +#if defined(CONFIG_SUSPEND)
>>  static void asus_ally_s2idle_restore(void)
>>  {
>>  	if (use_ally_mcu_hack =3D=3D ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
>> @@ -5013,6 +5014,7 @@ static void asus_ally_s2idle_restore(void)
>>  		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
>>  	}
>>  }
>> +#endif /* CONFIG_SUSPEND */
>
> Move this function below asus_hotk_prepare() next to ops, so that only=
 one=20
> #if block is needed for them.
>

Done

>> =20
>>  static int asus_hotk_prepare(struct device *device)
>>  {
>> @@ -5025,9 +5027,11 @@ static int asus_hotk_prepare(struct device *de=
vice)
>>  }
>> =20
>>  /* Use only for Ally devices due to the wake_on_ac */
>> +#if defined(CONFIG_SUSPEND)
>>  static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =3D {
>>  	.restore =3D asus_ally_s2idle_restore,
>>  };
>> +#endif /* CONFIG_SUSPEND */
>> =20
>>  static const struct dev_pm_ops asus_pm_ops =3D {
>>  	.thaw =3D asus_hotk_thaw,
>> @@ -5060,9 +5064,11 @@ static int asus_wmi_probe(struct platform_devi=
ce *pdev)
>>  			return ret;
>>  	}
>> =20
>> +	#if defined(CONFIG_SUSPEND)
>>  	ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
>>  	if (ret)
>>  		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
>> +	#endif /* CONFIG_SUSPEND */
>> =20
>>  	return asus_wmi_add(pdev);
>>  }
>> @@ -5096,7 +5102,10 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>> =20
>>  void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>>  {
>> +	#if defined(CONFIG_SUSPEND)
>>  	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>> +	#endif /* CONFIG_SUSPEND */
>
> I'd have preferred these reg/unreg be solved with wrappers (see=20
> pmc_atom.c).

Can do, but I don't really understand the difference it makes in this co=
ntext. Should I log that  CONFIG_SUSPEND was not enabled? Otherwise it's=
 just as good as not there, right?

>
>
> --=20
>  i.
