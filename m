Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931228F503;
	Tue, 10 Jun 2025 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558555; cv=none; b=Wi03Qaej8r7mQloqso7MmS7KxPssyQQab5+KURsuojdRgfeWkvnRn80+j6n000MzXQd62Edz1xaO520ezuysww+woZ7kDMYKuEBal4qPl23PYKI+2R9vC+4D/tnwtV4rSLS02gVsCEpEXrvT2SEUDKR5R6puL7aLy8giHrmboJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558555; c=relaxed/simple;
	bh=s/Mms/MwIMqVWLnjCgYLsX7RxmSQ4yf/IkuaD8FSw5s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pNoCA09l++Rp8Dxj8mHYiKOh8ISrJpjpGSngS8be2pHJRKD0vnCtQYr4WCRRIdUzzESSexUUrTBS+F+eAfVniyNctYXxaHVE5D23V2QaielfTB9if+5NLRg/k5OgZW5qdkPOfZCLBFI1mQ1RgWmKDeNaB1jOeicrRVxgV9+lUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=SQHIPIgZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HzuuaZn9; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="SQHIPIgZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HzuuaZn9"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3F4692540105;
	Tue, 10 Jun 2025 08:29:11 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Tue, 10 Jun 2025 08:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749558551;
	 x=1749644951; bh=b0KTzhdLUwJk/RA13SFXN+xVrwh40xkCwJtg+vK9uD0=; b=
	SQHIPIgZzfBrshp4cxz+AB5A778efV2gH0zQ2/lJ9RPmwKPasv3t/YtcYc8G+Mqh
	ULw6AXTRxXrLL0R0eT0Y+PO3OX+Bu5msiAmyLY640iaXQW7gNqKjk9MdT26pkah6
	8FaPOwmoiUHB84BqvGAFPX8ZdGT8jXh7dLA6Nzr5gVLHb1d/tmPwk1V4rSodEJoC
	VBccAx1AYw6h8/p/LdL8DKVjjC3IhZuQlRFEohbwbk5rzhedtoXmzhZ3ViokvutE
	HMryuSGG1x6x+Fpg9cC8aFIWTyGUHg1Ve2J3lkY32/ietD12FxfriHNRMuwSC1z9
	E+/5IziFbmxUQR7JgHmqHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749558551; x=
	1749644951; bh=b0KTzhdLUwJk/RA13SFXN+xVrwh40xkCwJtg+vK9uD0=; b=H
	zuuaZn9g6Q7jc7zlV7wtU/xVlh4ExQcCROsAxd5szo+vDar+59MY5uBIkm3lE8aD
	vgYnDVKN0KDlmnbIXVVmsbuRFlbxjbTxDqsqhDaXuVQnn/v58GMKDzO7Hb4RMHs8
	PWxOLz3T46MhzHyYBW94mlF88OtaH9GU9P39GRMyZ/3jphG5mhubjngFwcwB+Pzg
	A0zAzfh1fFx+TjhF6FJgoBzUWbncJZ9EbaUtgxj6DnKR2R7u3Md0qafqqA7eUMo6
	DeVmxIVoJebyMYzMv8cS0a0GMKqt7is3ZSHJ64RMq7uMHgs8A41Ljk8CG/wkrpwG
	MDDV4TsVT8K+zImFI+Hyw==
X-ME-Sender: <xms:FiVIaD1p4SHd_Ol7AIJrdF3aCDwxTwnOzEIeR-C0lCPLLQX5qUOEqQ>
    <xme:FiVIaCG5uCPvHYYfdSIAp5AbFmhEI9uqQqxboi9Jrak6CVy9CNNpA35eHyERPTxFK
    ZyEv6jdOOIwx1K4ECY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhepgedvgeeufffhtdel
    iefgjefhgffgiedvjeegleeujeeutdduteehjeduhedtiedtnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprh
    gtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhkvghprghn
    hhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigprghrmhhinhesghhmgidruggvpd
    hrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghpthhtoheplhhkphesihhn
    thgvlhdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnhes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvh
    gvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrd
    gtohhm
X-ME-Proxy: <xmx:FiVIaD7RxmtHxMynnUN8zHb7dflxNnYKtL1YzN2d5z3nArN4N6r5RQ>
    <xmx:FiVIaI03sHHcoqn41xDZOXyD7KpDhGFmAPuFdUMlbPACTMpmGt_XIQ>
    <xmx:FiVIaGEZMHKlc1Ma8crv7vr0ybroCqlOU4sVUmImkV0R3xkL9huROg>
    <xmx:FiVIaJ-QmtmUwgm5Iosg0B3oz9qxAvmOe9bd0YyudIq4vywN8Nwr0w>
    <xmx:FyVIaNUPQ_RaKZ61HuNj6fZFZuijvSnE6BDgT_fH-FZ0-iXL4YYD63WG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09BB62CE0063; Tue, 10 Jun 2025 08:29:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T95b0e86a2866f664
Date: Tue, 10 Jun 2025 08:28:49 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
Message-Id: <f3b5c138-5576-4c01-b177-7450f1e91d24@app.fastmail.com>
In-Reply-To: <b792059e-44d2-82c0-574c-76c3f6a3129d@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
 <b792059e-44d2-82c0-574c-76c3f6a3129d@linux.intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86: thinklmi: improved DMI handling
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Tue, Jun 10, 2025, at 3:35 AM, Ilpo J=C3=A4rvinen wrote:
> On Mon, 9 Jun 2025, Mark Pearson wrote:
>
>> Fix issues reported by kernel test robot.
>>  - Require DMI for think-lmi.
>>  - Check return from getting serial string
>>=20
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-l=
kp@intel.com/
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>  - New patch added to series.
>>=20
>>  drivers/platform/x86/lenovo/Kconfig     | 1 +
>>  drivers/platform/x86/lenovo/think-lmi.c | 8 +++++---
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x=
86/lenovo/Kconfig
>> index a4b565283768..207dd7f88ed0 100644
>> --- a/drivers/platform/x86/lenovo/Kconfig
>> +++ b/drivers/platform/x86/lenovo/Kconfig
>> @@ -197,6 +197,7 @@ config THINKPAD_ACPI_HOTKEY_POLL
>>  config THINKPAD_LMI
>>  	tristate "Lenovo WMI-based systems management driver"
>>  	depends on ACPI_WMI
>> +	depends on DMI
>>  	select FW_ATTR_CLASS
>>  	help
>>  	  This driver allows changing BIOS settings on Lenovo machines whose
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platfo=
rm/x86/lenovo/think-lmi.c
>> index 143d9fdedb65..8f70c60f791f 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.c
>> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> @@ -772,6 +772,7 @@ static ssize_t certificate_store(struct kobject *=
kobj,
>>  	struct tlmi_pwd_setting *setting =3D to_tlmi_pwd_setting(kobj);
>>  	enum cert_install_mode install_mode =3D TLMI_CERT_INSTALL;
>>  	char *auth_str, *new_cert;
>> +	const char *serial;
>>  	char *signature;
>>  	char *guid;
>>  	int ret;
>> @@ -789,9 +790,10 @@ static ssize_t certificate_store(struct kobject =
*kobj,
>>  			return -EACCES;
>> =20
>>  		/* Format: 'serial#, signature' */
>> -		auth_str =3D cert_command(setting,
>> -					dmi_get_system_info(DMI_PRODUCT_SERIAL),
>> -					setting->signature);
>> +		serial =3D dmi_get_system_info(DMI_PRODUCT_SERIAL);
>> +		if (!serial)
>> +			return -EINVAL;
>
> This should not return -EINVAL as it is not a problem with the input=20
> parameters. Perhaps -ENODEV would make sense instead?
>

Good point.
Unless Andy strongly thinks I should drop this bit, I'll fix in the next=
 version

Thanks
Mark
