Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79821A424;
	Tue, 11 Feb 2025 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292422; cv=none; b=BIhaWCrnAO8eVNLCy5eK8igXw83whCnsYgRjGrC8peDNHIBy7Em8eO8IE2Mm1IKyC3ytvcr0L3HEMaiO0BnhQdnov6Qd96Lmc1uydwIfXU+nn6DKAt2rGpeHDr49YtJANVgbA1kBRBuwyVgsS+8wymh/99pEYllkLY66C832Ns4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292422; c=relaxed/simple;
	bh=Fw6SVeNXzLvfb224w7BNBYbemQCCrZ4h3Lf2HlO83tc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=beG/JD4VetN9TGb5R1kz0gycDEdk60F8vAa6kiGJl5zyl6hC+TYOS1fiRTxgXurLl6oBnBCDdaOo5eYjzkcnxM27I8L/h5QNWeAY+49qhxOUM1igrtuKSg6+VKRYdzSwI/bQmt97gUx2uk3VPnLDG3A6UcoTHf2sMBJOdW8gn7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ijHPvaWn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Of4q54We; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ijHPvaWn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Of4q54We"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9142E254018A;
	Tue, 11 Feb 2025 11:46:59 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Tue, 11 Feb 2025 11:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739292419;
	 x=1739378819; bh=jELG8TlPFjBSmkdvazl9U9lJl1lPYlPrt7kKtqTvmOE=; b=
	ijHPvaWnCKsJzTN5UV2Mq+eCkj1rCr4DQFIbASvd8rJB3StWviXgBm5aQwyb37//
	5eDSqrInWl1kYT30iw3caBh/JLBwa8zxmnmRr40Dp3g20HRsEBrGNw6gNFhNOprp
	aEbeRKjxJTBhj5JeuiHcHKsW0RebCHU6U98C4px6ZUElIxiVQ+3Fz+df/FITjX1l
	fDocYueGa6o6H5KqVK6lUYfviHFdYXzrdEGt+70EFrNMzCZL3g8lhulL702mkn2v
	B0p2AAsSLReZFKLeSK2VqqbZKXQxFyQAyV6mJrQabqWQWG1m5F2liudtcei42wXP
	/noSsEI4OsABj/xWN6Jjzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739292419; x=
	1739378819; bh=jELG8TlPFjBSmkdvazl9U9lJl1lPYlPrt7kKtqTvmOE=; b=O
	f4q54WeRTb50+n9zfwp8I8H2h8i1OlpjpnnYNuKIjT+y4D8z/on7mGVoo2RM4kp+
	2ZwUY1287RCGyJydyOwCVytiJDwa7jZoiz+bHB4R3Yfwl807BLdafgO5/BCGxAsf
	3b5naPvaDOo0/gCPP9HYCDlp0S2muvU9k1MYxWM61qC6np7vXv/0YLE1fn8pUmPE
	gy5GJEuwh/bByaAgg2xcdTw1gWXxvDLDQj9eCP7a7pPNTxBqh1bRXXoPxLuyMDiC
	H8efzppbKr0iJwKdSVPPlzYG+5NtJ9tRYOB2pdwpQk9eIpdRq2XIph0Pqw7wT2oQ
	FV5V0nryUuA24mnMpyfew==
X-ME-Sender: <xms:An-rZzkxfYRRYJowecSjdC6digDQp1iapsUopeYNnxwDi68hWot14g>
    <xme:An-rZ21HCfoEHYP9FlYXujKEfndQB63c9WOmEjncccI9M-aBppUy3N09Jq8tmzFWO
    DEBuwYMUm71KEsTegI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehjrghmvghssegvqhhuihhvrdhtvggthhdprhgtphhtthhopeif
    pggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehjohhrghgvrdhlohhpvgiivdeshh
    hprdgtohhmpdhrtghpthhtohepmhgrrhhkphgvrghrshhonheslhgvnhhovhhordgtohhm
    pdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehhuggv
    ghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkh
    dquhhsrdhnvghtpdhrtghpthhtohepjhguvghlvhgrrhgvsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:A3-rZ5qv-yFXdvh1zYEcdnzTra8CU6yMOvkMd11n3L3bxbYZ-tgGQQ>
    <xmx:A3-rZ7mMyUrqzsHsE5EG-4HD00OwWFwTCOVMlIJ2fCNxbLV5txoqrg>
    <xmx:A3-rZx3lDlHhRtWsFa-raWu4g6tlNLwT_NS5Wf9225tXuWXO7c2Clg>
    <xmx:A3-rZ6s30sKpu8jkqgCfYkZnLX7TnBJEXVuLw0VmFBkWr9cqNMqU2g>
    <xmx:A3-rZ_Nmf7h98yYct2ufVD4pokwFGw67cBmGEMNn3Ksf8s4lncdzCQF4>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E406C3C0066; Tue, 11 Feb 2025 11:46:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 11:46:38 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>, james@equiv.tech,
 "Mark Pearson" <markpearson@lenovo.com>, "Jorge Lopez" <jorge.lopez2@hp.com>
Cc: jdelvare@suse.com, "Guenter Roeck" <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org
Message-Id: <10f2da65-0873-4512-b0c3-b91ab149a199@app.fastmail.com>
In-Reply-To: <33eac2f8-b295-4716-a5f8-9f0bf7f6d349@gmx.de>
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-3-W_Armin@gmx.de>
 <33eac2f8-b295-4716-a5f8-9f0bf7f6d349@gmx.de>
Subject: Re: [PATCH 2/7] platform/x86: think-lmi: Use ACPI object when extracting
 strings
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Armin

On Sun, Feb 9, 2025, at 7:31 PM, Armin Wolf wrote:
> Am 03.02.25 um 19:23 schrieb Armin Wolf:
>
>> Move the ACPI buffer handling out of tlmi_extract_output_string()
>> and instead pass the unpacked ACPI object to prepare for future
>> changes.
>
> Hi,
>
> i was hoping that maybe the driver maintainer could take a look at this patch
> and give some feedback.
>
My apologies - because of this patch (and a couple of others) I've just realised I never updated the MAINTAINERS file.
I have been mothballing the markpearson@lenovo.com address as it's a nightmare to use and switched to using my personal email domain instead. It seems my email filters aren't flagging these messages the way they are supposed to be - I have to figure that out :(

> Thanks,
> Armin Wolf
>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/think-lmi.c | 38 +++++++++++++++++---------------
>>   1 file changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 323316ac6783..2c94a4af9a1d 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -262,16 +262,11 @@ static int tlmi_simple_call(const char *guid, const char *arg)
>>   	return 0;
>>   }
>>
>> -/* Extract output string from WMI return buffer */
>> -static int tlmi_extract_output_string(const struct acpi_buffer *output,
>> -				      char **string)
>> +/* Extract output string from WMI return value */
>> +static int tlmi_extract_output_string(union acpi_object *obj, char **string)
>>   {
>> -	const union acpi_object *obj;
>>   	char *s;
>>
>> -	obj = output->pointer;
>> -	if (!obj)
>> -		return -ENOMEM;
>>   	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer)
>>   		return -EIO;
>>
>> @@ -352,17 +347,21 @@ static int tlmi_opcode_setting(char *setting, const char *value)
>>   static int tlmi_setting(int item, char **value, const char *guid_string)
>>   {
>>   	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	union acpi_object *obj;
>>   	acpi_status status;
>>   	int ret;
>>
>>   	status = wmi_query_block(guid_string, item, &output);
>> -	if (ACPI_FAILURE(status)) {
>> -		kfree(output.pointer);
>> +	if (ACPI_FAILURE(status))
>>   		return -EIO;
>> -	}
>>
>> -	ret = tlmi_extract_output_string(&output, value);
>> -	kfree(output.pointer);
>> +	obj = output.pointer;
>> +	if (!obj)
>> +		return -ENODATA;
>> +
>> +	ret = tlmi_extract_output_string(obj, value);
>> +	kfree(obj);
>> +
>>   	return ret;
>>   }
>>
>> @@ -370,19 +369,22 @@ static int tlmi_get_bios_selections(const char *item, char **value)
>>   {
>>   	const struct acpi_buffer input = { strlen(item), (char *)item };
>>   	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	union acpi_object *obj;
>>   	acpi_status status;
>>   	int ret;
>>
>>   	status = wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
>>   				     0, 0, &input, &output);
>> -
>> -	if (ACPI_FAILURE(status)) {
>> -		kfree(output.pointer);
>> +	if (ACPI_FAILURE(status))
>>   		return -EIO;
>> -	}
>>
>> -	ret = tlmi_extract_output_string(&output, value);
>> -	kfree(output.pointer);
>> +	obj = output.pointer;
>> +	if (!obj)
>> +		return -ENODATA;
>> +
>> +	ret = tlmi_extract_output_string(obj, value);
>> +	kfree(obj);
>> +
>>   	return ret;
>>   }
>>
>> --
>> 2.39.5
>>
>>
Changes look good to me. If you can hold on a bit I'll see if I can test them on a few platforms to make sure no surprises.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
