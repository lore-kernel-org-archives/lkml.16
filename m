Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01122595;
	Mon, 10 Feb 2025 02:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154980; cv=none; b=O32PUA/ZNqK5T/MLxODqj5Bi1NmmDfDskUiibR+HZy5TLonhb6A5avI7bxRZvUQhH3zX3ngePZlMrcavm/69A4oYDEuaX9Az2u49Ul/ZVQBAWrUqj/v75+uM/3XUUjzcG5pugm3dicNprG/y1R9ip95bE9fjjlDBzDAP44TBtbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154980; c=relaxed/simple;
	bh=3LBKOXga88fzpvHJlYvBYpkfwkAd+7Ow/lL/6ziUNZ4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WFIHdP+3UZQA/YWxjkNZGqWUfOYiD+iAMfNxTPAx8VOCPYvqgQVqdNpJSKMNPghbSgNc3v1ISYe2P++lz9ztbZB2xsGII9auzHw5Q9ouI9QoxBZsr5+lZ1bTvGna9hwsuIHJD/AAgkToYyCkuuQ97hhgULCpFF1F9rSJeKSHps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=oA193GeD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I0S/xMGD; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="oA193GeD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I0S/xMGD"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A01BF114012F;
	Sun,  9 Feb 2025 21:36:16 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sun, 09 Feb 2025 21:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739154976;
	 x=1739241376; bh=iCF6HHlSdNsm6bXhI3kKcElws8Q8zpbTMnY7VbuhO2M=; b=
	oA193GeDN2i6VFxkxg8kxfSTRj78LVv0cGryuAAz5wzpY7uHGR3l9CJmfk70PBuy
	uz0Z5py+Cj5QqlsukGJNs6J/F/XgFT8OVCoqb9l/6oZmlKB/k7jG83ba6Pk4/3lu
	Vwjfxbh8WaVwq2+EDygppUoVi0YkJMmT8cSDHvisIECHHZ7tsDKm+Q2rWJW/XWDC
	dskkiUpOJYornNhm/Vy7/wRpPfA4BQ/QNvjx3fGxtnkiPBlJsT0YksdYCfgs2WKW
	G/Wb7MabkUvelEqRN23toMq9QZqqg8Z92paK3wxo8w5x5fjehwAR9qz1xZrlDST9
	XaLfzJTtHwpRIA4fQIDfjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739154976; x=
	1739241376; bh=iCF6HHlSdNsm6bXhI3kKcElws8Q8zpbTMnY7VbuhO2M=; b=I
	0S/xMGDxiHwOUyvwEoXCYE6tSbhEuZ/t+P7ao9c83YZdEb/uFhEyxGkYbdCMJh7h
	4P5NYLVk4jF83BmArQlZ7VsM3k4SMCjY2C/gsA+7+B703mJX+qUpKEEDrGxkYkRv
	Qj319KX8VKsNtx44BkQh+vzjUz0mnj95gsSO/J/iA+kTS/7N2IQshnmdYej2l6u0
	9ocTfY0tSClQNaCuCmMKlo8QCFtHWP/ccK0+yAXbhKK1rl8Tc6yA8o3NwMeYV1UD
	S1BtzO6v4ybQ1ovV8ZlYHWn93TRnRW16h4Loifwt6bu8qCutlAIa99ERYCpJTRBf
	d6CyyR1gY7wM8X9d4BFfw==
X-ME-Sender: <xms:H2apZ6ptNEJB2ioZbTVW2GJtHKLLzHFGQLZFRcAqlUe1Cz7av90Ykg>
    <xme:H2apZ4qJhxdU-nlCTMNflX4Tm30pAY0Zzf9JKkI36gTSs6RVupiS8oiG2GidzqXUS
    83ZZhEOm0lki3UG0-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefieekhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:H2apZ_Pj3zil4u96ACiEMWuywXjrRO0C56z8tcLeObuuiLPaQLci4A>
    <xmx:H2apZ57MB4EFXqzuVSYUnEid9vE25ellGEdEg2Ju3_XClGzgU1uwbQ>
    <xmx:H2apZ57XE9SmcfenfMuMtRB4CHQabL597d6ylDi5yZRoW6S3uizRHQ>
    <xmx:H2apZ5heuWr7YRrLSJWbLLjBxpRiQIAO24jjrKXs262Edx31upnO5g>
    <xmx:IGapZ3T75VRHRVbOh0HIM28fM49zkOw_QZ-ekpNR2ppg7GGDWypzrjvg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B73E73C0066; Sun,  9 Feb 2025 21:36:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 21:35:34 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <f9047afd-d395-4733-a953-b7efa56e66c5@app.fastmail.com>
In-Reply-To: <D7OEFLKWR8VN.247WSBSGFSD2X@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
 <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
 <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
 <80307204-c401-4411-aa2a-3df7e11a45ce@app.fastmail.com>
 <D7OEFLKWR8VN.247WSBSGFSD2X@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Feb 9, 2025, at 9:10 PM, Kurt Borja wrote:
> On Sun Feb 9, 2025 at 8:26 PM -05, Mark Pearson wrote:
>> Hi,
>>
>> On Sun, Feb 9, 2025, at 8:18 PM, Kurt Borja wrote:
>>> Hi Mark,
>>>
>>> On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
>>>> Hi Kurt,
>>>>
>>>> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>>>>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>>>>> Thanks Kurt,
>>>>>>
>>>>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>>>>> Hi Mark,
>>>>>>>
>>>>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>>>>> When reviewing and testing the recent platform profile changes I had
>>>>>>>> missed that they prevent the tpacpi platform driver from registering.
>>>>>>>> This error is seen in the kernel logs, and the various tpacpi entries
>>>>>>>> are not created:
>>>>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>>>>>>
>>>>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>>>>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>>>>>> devm_platform_profile_register() is called before tpacpi_pdev probes.
>>>>>>>
>>>>>>> As you can verify in [1], in the probing sequence, the driver core
>>>>>>> verifies the devres list is empty, which in this case is not because of
>>>>>>> the devm_ call.
>>>>>>>
>>>>>>>>
>>>>>>>> I believe this is because the platform_profile driver registers the
>>>>>>>> device as part of it's initialisation in devm_platform_profile_register,
>>>>>>>> and the thinkpad_acpi driver later fails as the resource is already used.
>>>>>>>>
>>>>>>>> Modified thinkpad_acpi so that it has a separate platform driver for the
>>>>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>>>>> successfully.
>>>>>>>
>>>>>>> While this works, it does not address the problem directly. Also it is
>>>>>>> discouraged to create "fake" platform devices [2].
>>>>>>>
>>>>>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>>>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>>>>
>>>>>>
>>>>>> Yep - you're right. Moving it before the init does also fix it.
>>>>>>
>>>>>> I can't see any issues with this approach, but I'll test it out a bit more carefully and do an updated version with this approach.
>>>>>
>>>>> Thinking about it a bit more. With this approach you should maybe create
>>>>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
>>>>> pass a NULL (*probe) callback) to avoid races.
>>>>>
>>>>> platform_create_bundle() only returns after the device has been
>>>>> successfully bound to the driver.
>>>>>
>>>> Unfortunately having a null probe callback doesn't work - you end up with an oops for a null pointer dereference.
>>>
>>> Are you sure? I just tested this on the for-next branch and it works
>>> without issues. Also checked the code and (*probe) is only dereferenced
>>> safely inside platform_bus_type's probe. Maybe another pointer is being
>>> deferenced? Keep in mind that platform_create_bundle() also registers
>>> the driver so maybe there is an issue there.
>>>
>> Possibly - I have to admit I didn't go dig too hard, as when I added it I got:
>>
>> Feb 09 19:41:17 x1c12 kernel: BUG: kernel NULL pointer dereference, address: 0000000000000028
>> Feb 09 19:41:17 x1c12 kernel: #PF: supervisor read access in kernel mode
>> Feb 09 19:41:17 x1c12 kernel: #PF: error_code(0x0000) - not-present page
>>
>> With bus_probe_device in the backtrace - and went 'oh well'.
>>
>> Are there any significant advantages to the approach that make it worthwhile debugging further what is going on? Moving the platform_driver_register is working nicely :)
>
> Now that I think about it maybe there is no significant advantages, at
> least in relation to
>
> 	[ 7550.642171] platform thinkpad_acpi: Resources present before probing
>
> because list_empty(&dev->devres_head) is checked synchronously.
>
> However, now the null deref worries me, because some sysfs groups are
> created on driver binding. Do you have the full backtrace? Just to be
> sure moving driver registration doesn't mess with anything.

Oooops...
I didn't have the trace (at least that I could find) but I figured it would be easy to recreate it.
Went to make the change again...and realised what I had got wrong.
I needed to replace:
        tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
                                                        NULL, 0);
with 
        tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, NULL, NULL, 0, NULL, 0);

(previously I had replaced the platform_driver_register...sigh)

With the change done, I think, correctly - no oops and everything is working.

>
> I apologize for turning a quick fix into this :p

No worries - I'd never come across platform_create_bundle so it's a good learning experience for me. Thanks for all the help.

Mark
