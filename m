Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51175336D;
	Mon, 10 Feb 2025 03:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739157304; cv=none; b=GYovNy6x3sH4Nof97NGRiT/bD93qvZ+SbPPfsfRxcOU4WLYax+9u4QW5hv7EW2U2Z7TtdmH+COvBUjSScEc6yrbYL6CdzxjEBVQKoSM+kXv92kPwfoCOXzprUCuU6cyIkxd2gUF9FZ5nyJ0iw7uc3FruR9Fmd51cr+BN1Bk812Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739157304; c=relaxed/simple;
	bh=wSKHsj3N6GvXLbea3ELuUZOfFU1SBapiQWK7yyjJngg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VBJllXBfPLPPkAlNvzqkXDkacVHXA5cj8UCAK0qT6fAbgR+WPanDulSWSwYzM2AUcl77lzHSNMDMTCAoc1f/BBxGI5IHvah8HRlSo4VNNbY+5CQSCXyOt8LbVbCY542UXgXkeid7XDCp7z9M66mBAkvOjQgytlbyh/p8Qqxexg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=vrfCAnoi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oVgfjZT9; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="vrfCAnoi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oVgfjZT9"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 92DAA1140157;
	Sun,  9 Feb 2025 22:15:00 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sun, 09 Feb 2025 22:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739157300;
	 x=1739243700; bh=u04EN1K3gv4LPRWEqQ9eCNsW9AT2PvFVW2JP5jFway8=; b=
	vrfCAnoi0nnMrM0ybSFb1wL+oY58D/3e6zv9xE6GoAwsZopKZgMT3PCHO3eivxhw
	BJ6AB0+OcHOwWOs9pozXSRn4FgbSqp1TuBsLqBtwcQMLHUnolQuGFDaxUoUbRBt9
	7sUg34WywG4BoIUoxyrpUAu/1F8aYDQWX0T7xnjjsk281473t9EfE7IVC9SjvF5Z
	v+cCpANfFeCBvHY0RQDQ2+fgTJH1LHmwXvaPhUdzdT9duHWrOG0oBiP2cLxoN1p2
	jaYVMTUHRGAeze6wk3Taq/1b68GDozCmTIMLrhuEimR+LM3SMKYWKNfD/UgSq7uu
	dQU141EP4AC8p5KdkKFZhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739157300; x=
	1739243700; bh=u04EN1K3gv4LPRWEqQ9eCNsW9AT2PvFVW2JP5jFway8=; b=o
	VgfjZT9CThhsB25jVY38Ifq4k0IzayyJWjN50CuxF+zYcGTuuFYxNByKUzl1c9/c
	Cb/i0OTdv/Vx1CHAXYNDoY9jkdPnj7gwD6IBMQfKRwEa/gkwMDUxlDBhxX4Zu//+
	J2fCoMgydBXZ7NeDmp7sd+WbHga0G1zI9X20s5fh+FtnhiHNaWkeFjVkfXwWnQxD
	Fhg59C7vsipc/Z3XkOE4ppSWYpcPg06/z43KSP56/0e4TVs1IIwFhmC8NBluWVU8
	NJTLkc2bZRep+9KcGpJym/JL7TY/4Wofw0FPucbSeIz5Jf3+YagmjbMzvblKUt3w
	9fVO+UeL/eZ08KnGrZMjA==
X-ME-Sender: <xms:NG-pZ75oKjdv4BhiHjAYyPiB9Ko9wBdHuFsVCA9lSN1xPnONU8pKCQ>
    <xme:NG-pZw5pRzLtJwGLQzPaGvxebEWqfF1hOJ_53E2WFKKocyoJzT13IOqbJIGvuMEeC
    kb5vCFTGaPOrLkxzc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefieelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdp
    rhgtphhtthhopehkuhhurhhtsgesghhmrghilhdrtghomhdprhgtphhtthhopehilhhpoh
    drjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhgu
    vghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NG-pZyenEoWUBnW0MRIbxXiceQ-nVcFJRD1twIUen6UScG6wleKSvg>
    <xmx:NG-pZ8Kh9Zn7W2eO7PVrEKIkDFjjSWTu_9WUOZ1Ppz_U6nipv3EjZg>
    <xmx:NG-pZ_LvBdRgWHVS0LYM7W0_ckBQaaqA_-eufMuHUnIwyP-SHv7iDg>
    <xmx:NG-pZ1wyGSws_A-EIM5M9OWLi3nwaiuxexDx9MNLTse3EzGwms25Cg>
    <xmx:NG-pZ1gHedfXCDdKyeW2iqraejfVodeiEbGj0JQzJI8Sba6QxBBMyS_T>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 368C63C006B; Sun,  9 Feb 2025 22:15:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 22:14:16 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <10339f70-f56c-4ea3-874e-765bc8d63340@app.fastmail.com>
In-Reply-To: <D7OFLD408BZP.OV2OTU16TAD8@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
 <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
 <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
 <80307204-c401-4411-aa2a-3df7e11a45ce@app.fastmail.com>
 <D7OEFLKWR8VN.247WSBSGFSD2X@gmail.com>
 <f9047afd-d395-4733-a953-b7efa56e66c5@app.fastmail.com>
 <D7OFLD408BZP.OV2OTU16TAD8@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Feb 9, 2025, at 10:04 PM, Kurt Borja wrote:
> On Sun Feb 9, 2025 at 9:35 PM -05, Mark Pearson wrote:
>> On Sun, Feb 9, 2025, at 9:10 PM, Kurt Borja wrote:
>>> On Sun Feb 9, 2025 at 8:26 PM -05, Mark Pearson wrote:
>>>> Hi,
>>>>
>>>> On Sun, Feb 9, 2025, at 8:18 PM, Kurt Borja wrote:
>>>>> Hi Mark,
>>>>>
>>>>> On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
>>>>>> Hi Kurt,
>>>>>>
>>>>>> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>>>>>>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>>>>>>> Thanks Kurt,
>>>>>>>>
>>>>>>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>>>>>>> Hi Mark,
>>>>>>>>>
>>>>>>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>>>>>>> When reviewing and testing the recent platform profile changes I had
>>>>>>>>>> missed that they prevent the tpacpi platform driver from registering.
>>>>>>>>>> This error is seen in the kernel logs, and the various tpacpi entries
>>>>>>>>>> are not created:
>>>>>>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>>>>>>>>
>>>>>>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>>>>>>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>>>>>>>> devm_platform_profile_register() is called before tpacpi_pdev probes.
>>>>>>>>>
>>>>>>>>> As you can verify in [1], in the probing sequence, the driver core
>>>>>>>>> verifies the devres list is empty, which in this case is not because of
>>>>>>>>> the devm_ call.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I believe this is because the platform_profile driver registers the
>>>>>>>>>> device as part of it's initialisation in devm_platform_profile_register,
>>>>>>>>>> and the thinkpad_acpi driver later fails as the resource is already used.
>>>>>>>>>>
>>>>>>>>>> Modified thinkpad_acpi so that it has a separate platform driver for the
>>>>>>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>>>>>>> successfully.
>>>>>>>>>
>>>>>>>>> While this works, it does not address the problem directly. Also it is
>>>>>>>>> discouraged to create "fake" platform devices [2].
>>>>>>>>>
>>>>>>>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>>>>>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Yep - you're right. Moving it before the init does also fix it.
>>>>>>>>
>>>>>>>> I can't see any issues with this approach, but I'll test it out a bit more carefully and do an updated version with this approach.
>>>>>>>
>>>>>>> Thinking about it a bit more. With this approach you should maybe create
>>>>>>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
>>>>>>> pass a NULL (*probe) callback) to avoid races.
>>>>>>>
>>>>>>> platform_create_bundle() only returns after the device has been
>>>>>>> successfully bound to the driver.
>>>>>>>
>>>>>> Unfortunately having a null probe callback doesn't work - you end up with an oops for a null pointer dereference.
>>>>>
>>>>> Are you sure? I just tested this on the for-next branch and it works
>>>>> without issues. Also checked the code and (*probe) is only dereferenced
>>>>> safely inside platform_bus_type's probe. Maybe another pointer is being
>>>>> deferenced? Keep in mind that platform_create_bundle() also registers
>>>>> the driver so maybe there is an issue there.
>>>>>
>>>> Possibly - I have to admit I didn't go dig too hard, as when I added it I got:
>>>>
>>>> Feb 09 19:41:17 x1c12 kernel: BUG: kernel NULL pointer dereference, address: 0000000000000028
>>>> Feb 09 19:41:17 x1c12 kernel: #PF: supervisor read access in kernel mode
>>>> Feb 09 19:41:17 x1c12 kernel: #PF: error_code(0x0000) - not-present page
>>>>
>>>> With bus_probe_device in the backtrace - and went 'oh well'.
>>>>
>>>> Are there any significant advantages to the approach that make it worthwhile debugging further what is going on? Moving the platform_driver_register is working nicely :)
>>>
>>> Now that I think about it maybe there is no significant advantages, at
>>> least in relation to
>>>
>>> 	[ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>>
>>> because list_empty(&dev->devres_head) is checked synchronously.
>>>
>>> However, now the null deref worries me, because some sysfs groups are
>>> created on driver binding. Do you have the full backtrace? Just to be
>>> sure moving driver registration doesn't mess with anything.
>>
>> Oooops...
>> I didn't have the trace (at least that I could find) but I figured it would be easy to recreate it.
>> Went to make the change again...and realised what I had got wrong.
>> I needed to replace:
>>         tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
>>                                                         NULL, 0);
>> with 
>>         tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, NULL, NULL, 0, NULL, 0);
>>
>> (previously I had replaced the platform_driver_register...sigh)
>>
>> With the change done, I think, correctly - no oops and everything is working.
>
> Good to know!
>
> I'm going through the sysfs groups attached to the platform device and I
> noticed some attributes may depend on subdrivers being initialized
> first. If this is the case, ibm_init() has to be called inside the
> platform driver probe for this to work. Like this:
>
> static int tpacpi_probe(struct platform_device *pdev)
> {
> 	/* Input init */
> 	...
> 	/* Subdrivers init */
> 	...
> 		ret = ibm_init(&ibms_init[i]);
> 	...
> }
>
> static int __init thinkpad_acpi_module_init(void)
> {
> 	...
> 	tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, tpacpi_probe,
> 					     NULL, 0, NULL, 0);
> 	...
> }
>
> Of course this complicates things, so another approach is to just use
>
> 	platform_profile_register()
>
> instead of the devm_ version.
>
> Of course, the first approach has the advantage that devres is now
> usable, so I'd go for that, but that's for you to decide.
>
Hmmmm.
I'd like to get a fix in so anybody updating to 6.13 don't get hit (the Fedora users will be getting it soon and Arch users are likely seeing it already).

I think I'll do a fix tomorrow using the non devm_ version as that's safest; and then take a bit more time with implementing a probe with the appropriate pieces.

Thanks again
Mark
