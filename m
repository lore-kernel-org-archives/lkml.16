Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080B1EE026;
	Thu, 30 Jan 2025 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254938; cv=none; b=QBzmiKpVHRjaqJFEUpF2lYraEB7AljQlMWv7WGl6UO9knLWu1mxc+Bj7EMh9KQk9yxbLerTUSnLvBulSkcoLC7DU0IvzJRLmsft/0aAUfjRI0dAPX+CjLlsm8FJKd4KNyfoqaT5pxVUTV4vLfArGfO8LeBXSZWYWI1D1R+KAI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254938; c=relaxed/simple;
	bh=tWdej+t6ZKarkkq3deB7eqzecP5bcOdeKj0Mm82AvKs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cgajDCTGTeIsSqNzgibXFBMJ3WOVZ/0WN88ogEGDcgLWBQMxpE9oZjKKFDZiQQDV0kkjoio3RRL/g8FkYof87PPiJ5sBzrJrZn+5Q3TIxyWON5ooeviaeF/ckIfUimDD5UkSwWIKkXPoYE2ex0mzn//fry1ehJIt13SoGkSHvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ny6QvcX/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k4DQPbj+; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ny6QvcX/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k4DQPbj+"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7F8F72540130;
	Thu, 30 Jan 2025 11:35:35 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Thu, 30 Jan 2025 11:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1738254935;
	 x=1738341335; bh=OWtQx+eXQZELW3YguQwDvp8SJzRnZKdY5XAQrMTivWM=; b=
	ny6QvcX/yLr0XxH5BxUtt1IiQzqiZNtRdlfazPFET3KAoh/y2K5FNH08mYSoqkdX
	E2Vu1lI3RZJsUf6zv2ZVmB3VBKROLT5NzyFxpL96p1Y1Ul/fKYqkNg4FpfUm7bLc
	ojGUTbVhD0TA0G6d18cKKRapi7Be0Gc4BXFgHGufuxXyY/jyHcqgg5lGoXSrTAsr
	5AsIF/Aq9GqdSslcYEfqDsPuvMay2aJ74m30Y/hS9+d7VdKsWTWDkkHnHIZkQs6Q
	HYWQSHOCB6BA6QI8GEMPdJ+JwLb9cECZssOFmuvHWfrpL7R++oPQQ9IFXJoN/Kdb
	8N1H7Gd4ucPPkcy9W7pNiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738254935; x=
	1738341335; bh=OWtQx+eXQZELW3YguQwDvp8SJzRnZKdY5XAQrMTivWM=; b=k
	4DQPbj+Uh8iLRwBUZgKHWjP8+F49Phz+ZqFG5oEQhJkg6SosNPJstjN79MHyzyrx
	fVqdm+qzZDQ8q6pikZWgPMIHoGHP6YSUigxaeJQl9ZU8mcMAJ6Ihv73+/rPMwop8
	2AoNCapDM8HlXZsJsNM/FNS6VUkp2ZfH+TrK4GnrfiNSB9BMXBA06FVIH2GICgSH
	jkYURuBnrWSwjAYPskAXPD1ojSTF2WRXWbvU/iK3h61aQJ4CCb+CPp7jr7MEKrJT
	p/f9mLgceDSAbUNoNsH3wg/y/uf0Pr//xNKvyERQt7SpTNSJ1gNzFWR39PqZDtjX
	P1Rs8DaUWw3vlGMqBfiPw==
X-ME-Sender: <xms:V6qbZwA8iQhihGrqDRQsrjZGfIA-D_TNSak5__KdWT9cZol2GTnfdQ>
    <xme:V6qbZyioTIb9omIF10Ewdr4sWxNSJL3HIz6kGAp0-stwbVZpwMPMiFB-CXzmRHLWF
    _cPnl55VrmnOGxxJJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdeh
    tdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:V6qbZznh97k0ZvpIeOijvPPOBvLY2GtFgAVef_bK1SV-ObpauLmZjg>
    <xmx:V6qbZ2yHUzZtJFO6G8npYq8S-Ida3-9kESRADlxPgVQKf5x_AmbkfQ>
    <xmx:V6qbZ1R1D-mfqlK2u4Gnioakd80h_BPEzCg7LW_lqjAV7zxyKE72Ow>
    <xmx:V6qbZxYJVaFNe3R-sVSZ8OapOWol0b_EMxdTd3gWxDa-hfQd21tWsg>
    <xmx:V6qbZ3c7cXyU_fXuCZmzO7KiSNcJIZPutx5bQHwxWA3lGz2mMB327cwF>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1562E3C0066; Thu, 30 Jan 2025 11:35:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jan 2025 11:35:14 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <4f1a853a-7903-40a7-96a1-f5a00056fa31@app.fastmail.com>
In-Reply-To: <5a12b6f5-c501-4c7f-b27b-c9e63fbcffa1@redhat.com>
References: <mpearson-lenovo@squebb.ca>
 <20250130154520.26469-1-mpearson-lenovo@squebb.ca>
 <5a12b6f5-c501-4c7f-b27b-c9e63fbcffa1@redhat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Support for V9 DYTC platform profiles
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Hans,

Thanks for the review.

On Thu, Jan 30, 2025, at 11:25 AM, Hans de Goede wrote:
> Hi Mark,
>
> On 30-Jan-25 4:45 PM, Mark Pearson wrote:
>> Newer Thinkpad AMD platforms are using V9 DYTC and this changes the
>> profiles used for PSC mode. Add support for this update.
>> Tested on P14s G5 AMD
>> 
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 33 ++++++++++++++++++----------
>>  1 file changed, 21 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 1fcb0f99695a..cae457bc0b07 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -10319,6 +10319,10 @@ static struct ibm_struct proxsensor_driver_data = {
>>  #define DYTC_MODE_PSC_BALANCE  5  /* Default mode aka balanced */
>>  #define DYTC_MODE_PSC_PERFORM  7  /* High power mode aka performance */
>>  
>> +#define DYTC_MODE_PSCV9_LOWPOWER 1  /* Low power mode */
>> +#define DYTC_MODE_PSCV9_BALANCE  3  /* Default mode aka balanced */
>> +#define DYTC_MODE_PSCV9_PERFORM  4  /* High power mode aka performance */
>> +
>>  #define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
>>  #define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
>>  
>> @@ -10339,6 +10343,10 @@ static int dytc_capabilities;
>>  static bool dytc_mmc_get_available;
>>  static int profile_force;
>>  
>> +static int platform_psc_profile_lowpower = DYTC_MODE_PSC_LOWPOWER;
>> +static int platform_psc_profile_balanced = DYTC_MODE_PSC_BALANCE;
>> +static int platform_psc_profile_performance = DYTC_MODE_PSC_PERFORM;
>> +
>>  static int convert_dytc_to_profile(int funcmode, int dytcmode,
>>  		enum platform_profile_option *profile)
>>  {
>> @@ -10360,19 +10368,14 @@ static int convert_dytc_to_profile(int funcmode, int dytcmode,
>>  		}
>>  		return 0;
>>  	case DYTC_FUNCTION_PSC:
>> -		switch (dytcmode) {
>> -		case DYTC_MODE_PSC_LOWPOWER:
>> +		if (dytcmode == platform_psc_profile_lowpower)
>>  			*profile = PLATFORM_PROFILE_LOW_POWER;
>> -			break;
>> -		case DYTC_MODE_PSC_BALANCE:
>> +		else if (dytcmode == platform_psc_profile_balanced)
>>  			*profile =  PLATFORM_PROFILE_BALANCED;
>> -			break;
>> -		case DYTC_MODE_PSC_PERFORM:
>> +		else if (dytcmode == platform_psc_profile_performance)
>>  			*profile =  PLATFORM_PROFILE_PERFORMANCE;
>> -			break;
>> -		default: /* Unknown mode */
>> +		else
>>  			return -EINVAL;
>> -		}
>>  		return 0;
>
> Maybe replace the removed '}' with an empty line instead of
> removing the entire line?
>
> Currently after your patch the new code looks like this:
>
> 			...
> 		else
> 			return -EINVAL;
> 		return 0;
>
> which look a bit weird, personally I would prefer:
>
> 			...
> 		else
> 			return -EINVAL;
>
> 		return 0;

Agreed - it does look oddly ugly doesn't it.

I'll wait and see if there is any other feedback, and then make that change for v2

>
> Otherwise this looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
Thanks
Mark
