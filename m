Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6E26BDAB;
	Tue, 11 Feb 2025 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290932; cv=none; b=oHzvL3pEAjEPsO5lmB1W7vLp649QZDUw+i2vYPy67fpb7n1QHSR3FIejy5Hczpwt1ozl3fGC0shwGu0sgM5/p8wk+LgMlmqQcx37R4mGlxAAhXlCQz0EwktLSPDneopHsmhAzDonyzuUNblGCuDZhXFuJF6zlNlYpDiO5gwaLHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290932; c=relaxed/simple;
	bh=JSxBHagSzB9B0z9YXPH5Ke79A63Pz+yK2fGp70M/YX0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=H4tGVhB3ThUKLds8311PZMicyiCaRM8HUwAhLq1rKx+gHQ6t9Qnmhfqj/anqbhoniBG77fs+vRTajzSFuZeL0UrLtr+pT7ya2o1x+KHNvDiIf+gW82ugnoLxFpyHzS8RXUMyMFjl63y1xt01/6Gv15XEiw1DB35ZpS9w+ujPeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=BteTbhp9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Em3RpVec; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="BteTbhp9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Em3RpVec"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CC9C325401AD;
	Tue, 11 Feb 2025 11:22:08 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Tue, 11 Feb 2025 11:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739290928;
	 x=1739377328; bh=Rt556EkNhVf+ojQDmMoE1+XCec7AG5GACYdUBY5RicY=; b=
	BteTbhp94WyWiRJtSm8BS+71xk3Xn7LCgMkQ3F/pAVRLiZvhC5UBl4/aekQYghe4
	r1iG/v0S7DMscbxXRbEUE8tA6XPXOXdMwF/rcM75Ouxy2gciT0xpoCJkTpgQ/8Cn
	e3woTSmWTdIYb3JBYA/3sQilifc48SfIS+bCzE0wT8pKk77fSOE4PoXWp4ahpRCY
	Z4Iomku6aVnSdKgsRrt9MZTiOhx4WjGTEgrXDFend1vcBHCtFSmE7a/Fwu3DNyrK
	d3ADpUYp5U+2owmbIOOQcujr/TAN6kMNzWNVaBzN+1/wXsZUkG/UWDq5krF4pHuW
	61AHBUylllJHvI3N0E3ebQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739290928; x=
	1739377328; bh=Rt556EkNhVf+ojQDmMoE1+XCec7AG5GACYdUBY5RicY=; b=E
	m3RpVect8P1ekmCJbI+uq9q7r8XrDf4wp8Rpq9PoAG0npnhWIRzStZXuDQgkLpW6
	Wj+jRNjh/aOecFJppKwYQMmo8bQ5VsN6VkK7dp+OTh0ZyvK1Ole73h/Y8+kroRQb
	kWZJUdLd2A9MyyxT7TxcUTI8mJ1wSB4zqcJhYBiVg5ZXkAk5QR/PXp47z24+Jl5T
	BNsd5j98Cm/n/pxXiU9Mv8U50cHoVniuM/Bu88jjmpPVD+zCw6hT9nRs9cOne28e
	ACTB54hUq9slsvKLO1PYVcgCbCwzYo5AzrG5vNSdR2NBwY4Dvcp4AF977VYQUWbp
	QyVkFBWaWCB7WsmHXsuEA==
X-ME-Sender: <xms:MHmrZ6xCDUwVzJ-XN8gumtuMRSan6qmlu0s_Hzz5Sv1sZ4YzzSgX_g>
    <xme:MHmrZ2QHEjL_77cZOehb2N7BYhPOKjcyODRSo8prqqVsukRDc5DHsrib9vxDqPI1E
    3dn1K2EqLn_gCD0ofA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudegiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:MHmrZ8VV4QMBs4AKQEgRSiNjKqWevtO_n329_HlXvDjpgkqgdXAXvQ>
    <xmx:MHmrZwjvf0Zgwj4diIFpjJF2eVxFfwAMdXaEuYxf2tZNS2J0pFIv_A>
    <xmx:MHmrZ8C63Xx9kM4xD-ASP2ra7NWmoRrJXae-SUHOGnIdNw5B62OzkQ>
    <xmx:MHmrZxKgF4qHtf62feNY4Noui5GN_aQ5-cF0Q8XI8WFynfmgUWbyyA>
    <xmx:MHmrZ__p64bpHfIN8ONmtKyWJIH_FTOg7UP57CjPa4EsYZubZUFl8uD9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A34A3C0066; Tue, 11 Feb 2025 11:22:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 11:21:46 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <12c1ce59-d58f-4a05-831b-cd75efee84ba@app.fastmail.com>
In-Reply-To: <D7PD2KZCQJ4Z.BXO2PAN86IKH@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250210201656.4165-1-mpearson-lenovo@squebb.ca>
 <D7PD2KZCQJ4Z.BXO2PAN86IKH@gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix registration of tpacpi
 platform driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Kurt

On Tue, Feb 11, 2025, at 12:18 AM, Kurt Borja wrote:
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
>>
>> Tested on X1 Carbon G12.
>>
>> Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_profile_register()")
>>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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
>
> I just noticed this will be called even if platform_profile_register()
> fails, as the comment suggests.
>
> We need to check for IS_ERR_OR_NULL() before unregistering.

Agreed - will add.
Thanks
Mark
