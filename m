Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210226462C;
	Mon, 10 Feb 2025 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222933; cv=none; b=TtKsEd9GkLkjlIt/YCiIRG22HcZ7/JXuw7f0HDrXVI2E4FQhZc3xh2RbJ07Whf3R3Gci9yG7pLxeSnthItxzoRqMwB8Fqf3zbiFx+JFe3Pk2kS4N91u4WNEqpxKZHMgCiyPqnyCKYDq5+NV4qrkEMrYsyENC/Pm3+nU91QEI4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222933; c=relaxed/simple;
	bh=bVZ5t5fsZAusGFyr5P4UAKPWHSOZ34rhFh8yodn5C3M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QAi38rdRh7wW61aEwenJTmtDnp+DHVdqa5Ql92U27BJ8nySDbHbT07TSK7RNlH45IcQPvnirjJ4OPxFOLWAAzspoyFP6SUJ3zrkUkxgfMiX8OEqeH3DsetCGBC6iX3+DRa5zep3bGHg28zldOlF3N0qb32c0SFnoAAN9KH+tego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ekb7G0v0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mTs1hzCK; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ekb7G0v0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mTs1hzCK"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BA53D1140177;
	Mon, 10 Feb 2025 16:28:49 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Mon, 10 Feb 2025 16:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739222929;
	 x=1739309329; bh=MvVN3NAr+mgeFObkmvsgF3X/GXCbUiZvuTrTyduN0rU=; b=
	ekb7G0v0GUtKKbByOsufkfvcd1ozvhK0goEhDbSkTg9n5KBXvzXquv4Jzs0FcfG9
	TuYcnpPNWTy/kf9tPYpPdzbd9Cn+dyEc+j3/y/Eq7ceEB/EZ3dCFdAj32Y/g+gjA
	jFX1mENzsY4veRjUr+O1ltqYtqONdWVEGksGwI3dIjtJb72r6+LsE23sZz1BAQ44
	+E6eeAfq2M9zCjxDK3MBkT93SpqxClcSFmR63p0dkLCgrH1vubBuIMvf4MfCuzYE
	b3wX0AFfJNQrXmB+hh4exDMV1gAZ8PL+ahcPFQbtCj4Hq5M9QrRO84BMCKKfnTtB
	nGeAvxpS9sTiTYuxXd+y8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739222929; x=
	1739309329; bh=MvVN3NAr+mgeFObkmvsgF3X/GXCbUiZvuTrTyduN0rU=; b=m
	Ts1hzCKRXf5csmsp6EOAx+LmFd0MmG0KmGnp08rX0sJUh3kdw+/ALhmdNj9h+ZRR
	RjJkmo8W6GGHQ3OVDzLIm9BdlCZWaL5LCirCEJuUveIkXvlXxPFs+QaN5Y9pd4RL
	mzEJVyeapVU0XkMEqMzF461K7tg1ASGogcUbctC9bWpZyY7tOcJ62tmQ3xl46+DY
	H53jf8Zdodv32eyLv8wNk6p/i5LgHZa51NPGOmckunGU+FJEOwgjAXFQuzrQteAv
	PDVJhttYXajmMYTyMNlW3bhvy/nLXn7yivk6iWZ5qQTV7bDHk/d2U7UV/dAt/5iH
	69h8wfdnZFSR9efd1XTmg==
X-ME-Sender: <xms:kW-qZ-9XQfYGYFLN8D2PnosnrfvyVNqcDYufrlA8PCQbTqNy4McrXw>
    <xme:kW-qZ-tGHSlPwL5EvcSZmIi5KsOqxuCCi4QUJLKNMOn2W-TPw4GJeYW0j5y8WVo42
    qg_0WDsVoQPbzvRE48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefleduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepkhhuuhhrthgssehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhl
    phhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    hhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:kW-qZ0CsMvH7Xbok4WwyA3pmv15olqjQb3JlCvHj6hxM4qEuhXBp5w>
    <xmx:kW-qZ2dDOMlKYNu4TwLW1tBdKL72tEdI2OEEe6RLrL-hWiQ9NRoxAg>
    <xmx:kW-qZzMBu-pYMQEy-M7LEABygsRLqIV2EEaM42DbukQnMEzz0Dd0_Q>
    <xmx:kW-qZwnxncprA4fgCqY2fsk0YQRbSoW2c5Ixzk8sv2P6YSTXKQU8QQ>
    <xmx:kW-qZ4pnqdzOa6gqf_Y59i2OpoHCVYhtX6-IIa1rsyY9EToHpXPBiLds>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 737F23C0066; Mon, 10 Feb 2025 16:28:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Feb 2025 16:28:29 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <9bde54ed-f1c9-44f6-ba49-23f100fb9060@app.fastmail.com>
In-Reply-To: <D7P2M0PTVM84.2W5QT7R0Y3T50@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250210201656.4165-1-mpearson-lenovo@squebb.ca>
 <D7P2M0PTVM84.2W5QT7R0Y3T50@gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix registration of tpacpi
 platform driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Kurt,

On Mon, Feb 10, 2025, at 4:07 PM, Kurt Borja wrote:
> On Mon Feb 10, 2025 at 3:16 PM -05, Mark Pearson wrote:
>> When reviewing and testing the recent platform profile changes I had
>> missed that they prevent the tpacpi platform driver from registering.
>> This error is seen in the kernel logs, and the various tpacpi entries
>> are not created:
>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>
>> This happens because devm_platform_profile_register() is called before
>> tpacpi_pdev probes (thanks to Kurt Borja for identifying root cause)
>>
>> For now revert back to the old platform_profile_register to fix the
>> issue. Will work on re-implementing this later as more testing is needed
>> for full solution.
>
> If you don't mind I can work on this patch on the for-next branch, so we
> may use devm_ on the next release cycle to avoid merge conflicts.
>

For sure :) Holler if you need anything.

>>
>> Tested on X1 Carbon G12.
>>
>> Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_profile_register()")
>>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Reviewed-by: Kurt Borja <kuurtb@gmail.com>

Thanks for the review
Mark

>
>> ---
>> Changes in v2:
>>   Modified approach to instead revert to old platform_profile_register
>> method. Will revisit using devm_ version in the future as more testing
>> needed.
>>
>>  drivers/platform/x86/thinkpad_acpi.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 1fcb0f99695a..85d01bd5dc31 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -10646,8 +10646,8 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>  			"DYTC version %d: thermal mode available\n", dytc_version);
>>  
>>  	/* Create platform_profile structure and register */
>> -	tpacpi_pprof = devm_platform_profile_register(&tpacpi_pdev->dev, "thinkpad-acpi",
>> -						      NULL, &dytc_profile_ops);
>> +	tpacpi_pprof = platform_profile_register(&tpacpi_pdev->dev, "thinkpad-acpi-profile",
>> +						 NULL, &dytc_profile_ops);
>>  	/*
>>  	 * If for some reason platform_profiles aren't enabled
>>  	 * don't quit terminally.
>> @@ -10665,8 +10665,14 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>  	return 0;
>>  }
>>  
>> +static void dytc_profile_exit(void)
>> +{
>> +	platform_profile_remove(tpacpi_pprof);
>> +}
>> +
>>  static struct ibm_struct  dytc_profile_driver_data = {
>>  	.name = "dytc-profile",
>> +	.exit = dytc_profile_exit,
>>  };
>>  
>>  /*************************************************************************
