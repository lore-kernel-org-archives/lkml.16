Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD441E25ED;
	Wed, 25 Jun 2025 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838929; cv=none; b=fM3RbGsSNPvbt4ophm1e6of//RHXAO9WoKeYaOhNigv27ysunF6ivutqgPNwp/GcVxTUqeIX7SY3FsvL6DTL+OZi/1OS3vbglr/kGCtE7zA8/pikDPOKhbNNyZLtnxet5jr8wb0cv1aWVX996zMGdYXWOCb5/rCs27Ree5dmpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838929; c=relaxed/simple;
	bh=HmAaA2Cbn5fJ3+qoi+KT7WNEvwt3kqHBs14BB0Pz3bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIXpgR4gw6N9v0HOppwCBORskF/ULEVG7Mp6vw0rZHvkreGop5Z3IenNyW1fvFaXRBRTqeYE4V4nBSFdq2xhJJkFOwJphFF4iC7Dv+GjQWJ0mKk+rfRgTjyUg8bXeI286hdxlMxKHH4LScy0HeUGy1L9Iu67wlRT1tQpiHcI1Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtytpBMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtytpBMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D42C4CEEE;
	Wed, 25 Jun 2025 08:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750838929;
	bh=HmAaA2Cbn5fJ3+qoi+KT7WNEvwt3kqHBs14BB0Pz3bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gtytpBMFcb5Gvj9eFabwFEmqlqVOpn2W7bYKYBNKWpm2wh26UB8zlUZIFyTGtz4y5
	 8ThgkB+NeDDfCrqgCc1Zko0++U0tEN24v8V/Oq3aK3qEAwRjWW68tnIgE5WQb/Od5i
	 vXT2Y6+lCQBGRJQzv7D46DENCoZJ9l5hQ2PMpvufJMlCxFp59FPxfqyxG/NbkKB0ZI
	 hKjdlTOUY75osMJ3lD8g8hngvY+t4lKg9KmtXAJTbtS62OT9zQf6nIT1rBxtOuGj2+
	 lvvuTOcq3WkSfl0hswu/tiTs1jAlglaR9W3f/fABS/PDblqizW9yLSuXSn2BMbnjMP
	 tgljCBtkt9ETQ==
Message-ID: <71a6398f-1cda-4d83-992d-328d906ad8af@kernel.org>
Date: Wed, 25 Jun 2025 10:08:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase
 mp2869a/mp29612a controllers
To: =?UTF-8?B?5ZCz5qKT6LGq?= <tzuhao.wtmh@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Fabio Estevam <festevam@gmail.com>,
 Henry Wu <Henry_Wu@quantatw.com>, Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Leo Yang <leo.yang.sy0@gmail.com>, Ninad Palsule <ninad@linux.ibm.com>,
 Alex Vdovydchenko <xzeol@yahoo.com>,
 John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
 Nuno Sa <nuno.sa@analog.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Noah Wang <noahwang.wang@outlook.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
 <9bd05709-7702-4b74-85e1-3df25b57c535@kernel.org>
 <CAL3H=v3s6H4ZpnS=EhPrpEiu-9N-xFCkunHuwWW0xnkXbzY9Kg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAL3H=v3s6H4ZpnS=EhPrpEiu-9N-xFCkunHuwWW0xnkXbzY9Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 08:31, 吳梓豪 wrote:
>>
>>> +     return 0;
>>> +}
>>> +
>>> +static struct pmbus_driver_info MP2869A_info = {
>>
>> This is const.
> Since info will be modified by mp2869a_read_vout at runtime, I chose
> not to make it constant

No, this makes it a singleton. I don't see the code in current driver,
so I don't get whether you meant current code or future. If current:
where is it modified?

mp2869a_read_vout() has terrible style btw, really not looking like
Linux coding style. Be sure you carefully follow the style.

>>
>>> +     .pages = MP2869A_PAGE_NUM,
>>> +     .format[PSC_VOLTAGE_IN] = linear,
>>> +     .format[PSC_VOLTAGE_OUT] = direct,
>>> +     .format[PSC_TEMPERATURE] = linear,
>>> +     .format[PSC_CURRENT_IN] = linear,
>>> +     .format[PSC_CURRENT_OUT] = linear,
>>> +     .format[PSC_POWER] = linear,
>>> +     .m[PSC_VOLTAGE_OUT] = 1,
>>> +     .b[PSC_VOLTAGE_OUT] = 0,
>>> +     .R[PSC_VOLTAGE_OUT] = -3,
>>> +     .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>>> +             PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>>> +             PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
>>> +             PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
>>> +     .func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
>>> +             PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP,
>>> +     .read_byte_data = MP2869A_read_byte_data,
>>> +     .read_word_data = MP2869A_read_word_data,
>>> +};
>>> +
>>> +static int mp2869a_probe(struct i2c_client *client)
>>> +{
>>> +     struct pmbus_driver_info *info;
>>> +     struct MP2869A_data *data;
>>> +     int ret;
>>> +
>>> +     data = devm_kzalloc(&client->dev, sizeof(struct MP2869A_data),
>>
>> sizeof(*)
>>
>>> +             GFP_KERNEL);
>>
>> Misaligned. Run checkpatch --srtict
>>
>>> +     if (!data)
>>> +             return -ENOMEM;
>>> +
>>> +     data->chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
>>
>> These are just wrong or redundant casts. You need only one cast -
>> kernel_ulong_t
>>
>>> +
>>> +     memcpy(data->max_phases, mp2869a_max_phases[data->chip_id],
>>> +             sizeof(data->max_phases));
>>
>> Why you cannot just store the pointer?
> As chip_id and max_phase will be constant, it should be acceptable to
> handle them via pointers in this case.
>>
>>> +
>>> +     memcpy(&data->info, &MP2869A_info, sizeof(*info));
>>
>> Why you cannot just store the pointer?
> Considering that the info can change at runtime, using memcpy is a
> safer approach

Where do you modify the contents?


Best regards,
Krzysztof
