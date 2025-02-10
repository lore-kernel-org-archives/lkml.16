Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D212B73;
	Mon, 10 Feb 2025 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150859; cv=none; b=cjJhhW7uADBEFTjptzEISS1LnMRqBxXYpXN/qFDPUdz80bdOHRig+dabDbGEfoItwIeeXX34ED38SyICGhlPbM+Gs/vnUbizSBl+lgQau2yxeIGb6W4OUTZCPi47ccIJvYVKAdjagveJx58Av+gx3tilG+OubQefLT12/g0IIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150859; c=relaxed/simple;
	bh=J9tIhSuadjJdQ9QGdLHIlD1CCiXI58Ttf6UCRUO83uk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=L3vMzOl5yHJZnVk/G/tBV94c/6VZs6vpozY1YSMbWBnHTRgREnOnCWZWPIo2jujMbUzZ7mgh25wTWWwTkRARMZ6QzyGh2sHRMZ1pMv8X59eZxO8YKG8MK5Z9JBmY8gwnIFznO/kLfEpUdnxZyJq3vOUqMKtJGDx91MjXDm4sKMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ZRilTXCG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZRMPDiQF; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ZRilTXCG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZRMPDiQF"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 75F0011400F4;
	Sun,  9 Feb 2025 20:27:36 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sun, 09 Feb 2025 20:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739150856;
	 x=1739237256; bh=J9tIhSuadjJdQ9QGdLHIlD1CCiXI58Ttf6UCRUO83uk=; b=
	ZRilTXCGzvzY6CEToRGN6308vu8NtupdXefdVtxmvPkjpZjO41gGngBJBrBalcfa
	2PzATBmg8tKqWya8mM5MOoHR/gtNDTnZ7vJDOpEkJaywZKx9kLJuzUwLZOZtBhPG
	yta6CAufalI+tys9f7XLTuffkR+cmDfk/A5jBYQrErSZ9lfZ+hxyB13WcMkdJtHi
	y1YaWazL+jklKIo5fE525ulrBn9CXhk/T3pXPlU7OJah2QaeZouKM8asADgOnCND
	CGacDwjj99efAB+B0fjBfbBuLggfMqZXi0nAplghnzwu65HKMF9OZdGd6xuDFNTl
	cgNXGEiqKhoS00syklsJOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739150856; x=
	1739237256; bh=J9tIhSuadjJdQ9QGdLHIlD1CCiXI58Ttf6UCRUO83uk=; b=Z
	RMPDiQFZNx9kUwJr8maDe0/lhIG/AXxYJs5SfF9f5SteWnit4Hv5zTFCVbIZQmQA
	YEa3gWlQoUPBbeFDdJqL1WSksqeimLaKsd866c/Qr4PBKn4XCSSd+5P/2EOG3+uv
	nhO+5gVwRnDXZIVQO5ehYGs+1PsoIi91lUhRjcw+pWoxP4h1GNSEMPydyq6AzMdz
	cFFueciyTNZJYcRvp313Joi8NF2vGGYUlOP2PYWd+HLXzGNjEElcwt2DKubkhNuD
	VE8GoiPcQ02fmvwLGujNxK3JrqCT0Fm0uqQlS7I5PVeqpAof3rLKpZsRio+Fzl5u
	8tGMjdHj8d9Fxm3VED58Q==
X-ME-Sender: <xms:CFapZzP2WDilad-fS8RWU4CxZc8AASMTeee1Yim5kS1-MQ_tUVkCTA>
    <xme:CFapZ9_BDGSoONNqrI-jKeTRD33cpfvdAAGwtZm0NXrnzU-SjebB6I0AZckW3athy
    dGOaEnSsFtbBd45vEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefieejvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:CFapZyQ-kSIuX8JuE0I75fjJ52AclBZkH73nK2Hyry_TswZt28O16A>
    <xmx:CFapZ3s5v_tJMWeVesjANG0Zj1QnEzvKGldVCe2OHT68T59fwtJhJg>
    <xmx:CFapZ7e_t-FdfZrC8Kg4fIGrPpUlmJos8aIdZP5lZmUpk3KZjrghIg>
    <xmx:CFapZz2nFSHjd-BpZLPTDRCj-trBqC6wU-zS134kgygWixOI-e-g0g>
    <xmx:CFapZ8FhzQLp84wZuip3g_gYT7dIGiULnPx5V7tztHpgffij21RqOdZn>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 149953C0066; Sun,  9 Feb 2025 20:27:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 20:26:52 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <80307204-c401-4411-aa2a-3df7e11a45ce@app.fastmail.com>
In-Reply-To: <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
 <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
 <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, Feb 9, 2025, at 8:18 PM, Kurt Borja wrote:
> Hi Mark,
>
> On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
>> Hi Kurt,
>>
>> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>>> Thanks Kurt,
>>>>
>>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>>> Hi Mark,
>>>>>
>>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>>> When reviewing and testing the recent platform profile changes I had
>>>>>> missed that they prevent the tpacpi platform driver from registering.
>>>>>> This error is seen in the kernel logs, and the various tpacpi entries
>>>>>> are not created:
>>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>>>>
>>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>>>> devm_platform_profile_register() is called before tpacpi_pdev probes.
>>>>>
>>>>> As you can verify in [1], in the probing sequence, the driver core
>>>>> verifies the devres list is empty, which in this case is not because of
>>>>> the devm_ call.
>>>>>
>>>>>>
>>>>>> I believe this is because the platform_profile driver registers the
>>>>>> device as part of it's initialisation in devm_platform_profile_register,
>>>>>> and the thinkpad_acpi driver later fails as the resource is already used.
>>>>>>
>>>>>> Modified thinkpad_acpi so that it has a separate platform driver for the
>>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>>> successfully.
>>>>>
>>>>> While this works, it does not address the problem directly. Also it is
>>>>> discouraged to create "fake" platform devices [2].
>>>>>
>>>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>>
>>>>
>>>> Yep - you're right. Moving it before the init does also fix it.
>>>>
>>>> I can't see any issues with this approach, but I'll test it out a bit more carefully and do an updated version with this approach.
>>>
>>> Thinking about it a bit more. With this approach you should maybe create
>>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
>>> pass a NULL (*probe) callback) to avoid races.
>>>
>>> platform_create_bundle() only returns after the device has been
>>> successfully bound to the driver.
>>>
>> Unfortunately having a null probe callback doesn't work - you end up with an oops for a null pointer dereference.
>
> Are you sure? I just tested this on the for-next branch and it works
> without issues. Also checked the code and (*probe) is only dereferenced
> safely inside platform_bus_type's probe. Maybe another pointer is being
> deferenced? Keep in mind that platform_create_bundle() also registers
> the driver so maybe there is an issue there.
>
Possibly - I have to admit I didn't go dig too hard, as when I added it I got:

Feb 09 19:41:17 x1c12 kernel: BUG: kernel NULL pointer dereference, address: 0000000000000028
Feb 09 19:41:17 x1c12 kernel: #PF: supervisor read access in kernel mode
Feb 09 19:41:17 x1c12 kernel: #PF: error_code(0x0000) - not-present page

With bus_probe_device in the backtrace - and went 'oh well'.

Are there any significant advantages to the approach that make it worthwhile debugging further what is going on? Moving the platform_driver_register is working nicely :)

Thanks
Mark
