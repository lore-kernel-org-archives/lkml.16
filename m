Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E7245012
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142074; cv=none; b=JnDQ6Y/PMBsbTAGEMe2dPt7MNw6BUnq0VpnSvwjzCI603JzCCWQfYG4wqdfGcdEIJXmRbWKJnj2iBfiQh+Gninbb2kFlcaSbuAxsiYm528koCS2cixotm+q19xt1KWAke3YftMbyrtnAGtOxq5BMfhJknLZw834AtFbPlYbdBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142074; c=relaxed/simple;
	bh=+4iqyUTi0E7UltQIdQPFstwrYJASj34CNxi5y1rMv0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjNPPtQwvzqb2QSM9nA7fkeopRwC/ym7xPUm/++Fj1A4SHE63S4sCimiM/X8xOSLeTsD5E++WGUl/f25YrW7RwgXfhYI0XUarBzdkeC5MSHNcn892O9rumTkjrEy9sAyUYGv9NQ/vYY2k1oXLEHDtXpfhfreBME+oojHj9hyawY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vmZ9s3+S; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vmZ9s3+S"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5869894b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142071; x=1744746871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBGk/fKPNmRqrd1bCAlViX+nWV4o6WwNupDuItfdSOI=;
        b=vmZ9s3+S7EREsPsSVrlOEBDS6ovxDIM8zv2M7+p5KvY852nXt6gFq+mHBnZ/tmwE03
         NgtHB2y+8XQva5+aPDhsPp4ZbQbrkbShNBPDyvuPiCr0O7Pcq+QHWw9yYsfc95S1O+C0
         r9uSZgpFJjYk/TEoQq2+yNLercrBz+EBTT6jl36PjcVWHhDkdpQyiLg30UZHR0OjO2d8
         pQAruMWN+nRDtFoOSVMSRd2cMyn7fk/4T1GLp4h+KvKJdlkVAcEfI8/X+pn6GBow/pQX
         OMlP2dwz0GhXkXeiNGzebKC6KcP2tlW/QkZVEcgQQeN2iOhejDVAVou+Z4WxoHdUuFBT
         F1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142071; x=1744746871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBGk/fKPNmRqrd1bCAlViX+nWV4o6WwNupDuItfdSOI=;
        b=DGBdXYSqV9Fp16m6r9sljpiFI3oQk06mS61fnpURvpEiAJE77b72KLxUF5rsSBtIxp
         ogeIVTfWTV9Q3Lezaju/7LK+Aa/Hy336u90GxkhEFsQckN8OXAiynQhau8lzg/h+6Oy4
         mCofGxIaL8wAX9V9lgZt7vWjr6G2RuNn+qffnqINKghqmqg/upgHJnJk2u9DzzeoZWuh
         RB9s5a9qwCdhOfnSgJzV7THmWiccuGfb65TFcByU0k6FNkJQSArGTbjOX0yGvjKWhNTR
         ltPqDRVfE3/5fEm5rzZgwR88UH3sn9s/gYxY+cEWE/zFgGxbXuEsMIPvvNdng8QuiSPc
         Ju7A==
X-Forwarded-Encrypted: i=1; AJvYcCWDwiL2zV03WPhi2j1/JP+ST6X6S762jZwZN1pyUr7W2msKGY1XM1N/Lkkaw9il723sQ6tNnFkzafb+0uE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5uoorqxpWOQWJ6GGaSBOCiksRy8R82IDzs0yGSDYsjAYOFmI6
	8LqlcOuoRWU2BK2haBEMaK/Vu5IGzd6u2ID4KcCPewDDI9xbqkPqnwrBcDywRA==
X-Gm-Gg: ASbGncuV9w2FI0IseHRVTPBv/qCaincOaNV77J7YkcMW/BvwUiuOp2aAC0232LSL9HP
	kpC+8DdZsLBjQ/IX/aSFrYzdHFUQYblUoC/5EH04phrboTIhjByHm46VGZf7CTxgU3OUAqGpmDG
	Vf+hAPKcUrQCC0Fh0zaB8nfZTX+GBBCJ7Kmxw5vDSoxGpihckqbqiLCBi7JOaybDheOMRcBVqbw
	a86isTZblW4vuSozdbcD/cce9YQ4qmnbqc1gOlX5vI4dShkZXiZKNbYhL9GdUR9bGBPHekCnQEY
	YZ5HDCxfE95KfGFbdh/x3GS6oYpc8fax/vkis5bJbtHgK9VaKkT41RqNVhWKv5/5lFtbQOT6Qr+
	XVpV+p4uevZpyeYvC3tvO5dYLZB9HPu02dvG6/9s/kxE=
X-Google-Smtp-Source: AGHT+IFpX171nkKO4/pkD9or/PTfHZTRPoVBCZggU+DSor2BZJYvT8pJQsh9q1mKL13bLo8q2/aXiQ==
X-Received: by 2002:a05:6a00:4608:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-73bae4957c5mr347163b3a.1.1744142071138;
        Tue, 08 Apr 2025 12:54:31 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:4da8:81cb:274b:fff0? ([2a00:79e0:2e14:7:4da8:81cb:274b:fff0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f3719sm11009549b3a.71.2025.04.08.12.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:54:30 -0700 (PDT)
Message-ID: <4e96d3ba-043c-4707-9bb9-8987d8c53025@google.com>
Date: Tue, 8 Apr 2025 12:54:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] power: supply: core: add function to get supplies
 from fwnode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Sebastian Reichel <sre@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20250312-batt_ops-v1-0-88e0bb3129fd@google.com>
 <20250312-batt_ops-v1-2-88e0bb3129fd@google.com>
 <Z9rMiONSFDJInPYM@kuha.fi.intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <Z9rMiONSFDJInPYM@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/19/25 6:54 AM, Heikki Krogerus wrote:
> On Wed, Mar 12, 2025 at 04:42:02PM -0700, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add a new helper function power_supply_get_by_fwnode_reference_array()
>> to retrieve a list of power_supplies associated with the fwnode's
>> property. The property can contain multiple nodes where each node is
>> associated with a power_supply. The list of power_supply objects will be
>> stored in an array supplied by the caller and the return value will
>> indicate the size of the resulting array.
> I don't think this API is necessary. If I've understood what you are
> after here, the batteries should simply have the Type-C psy(s) listed
> in the supplied_to and/or supplied_from.
>
> So you just need to make sure your battery nodes have the USB Type-C
> node(s) listed in the "power-supplies" property in your DT, no?
Thanks Heikki! I will evaluate between this approach vs OF graph 
approach (as suggested in previous review) and implement it in v2.
>
> thanks,
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/power/supply/power_supply_core.c | 60 ++++++++++++++++++++++++++++++++
>>   include/linux/power_supply.h             |  5 +++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
>> index 76c340b38015af0a67a0d91305e6242a8646bf53..df1a52f85125748c4fdcb10687aa7ed2f626ded1 100644
>> --- a/drivers/power/supply/power_supply_core.c
>> +++ b/drivers/power/supply/power_supply_core.c
>> @@ -593,6 +593,66 @@ struct power_supply *devm_power_supply_get_by_phandle(struct device *dev,
>>   EXPORT_SYMBOL_GPL(devm_power_supply_get_by_phandle);
>>   #endif /* CONFIG_OF */
>>   
>> +static int power_supply_match_fwnode(struct device *dev, const void *data)
>> +{
>> +	return dev && dev->parent && dev->parent->fwnode == data;
>> +}
>> +
>> +/**
>> + * power_supply_get_by_fwnode_reference_array() - Returns an array of power
>> + * supply objects associated with each fwnode reference present in the property
>> + * @fwnode: Pointer to fwnode to lookup property
>> + * @property: Name of property holding references
>> + * @psy: Resulting array of power_supply pointers. To be provided by the caller.
>> + * @size: size of power_supply pointer array.
>> + *
>> + * If power supply was found, it increases reference count for the
>> + * internal power supply's device. The user should power_supply_put()
>> + * after usage.
>> + *
>> + * Return: On success returns the number of power supply objects filled
>> + * in the @psy array.
>> + * -EOVERFLOW when size of @psy array is not suffice.
>> + * -EINVAL when @psy is NULL or @size is 0.
>> + * -ENODATA when fwnode does not contain the given property
>> + */
>> +int power_supply_get_by_fwnode_reference_array(struct fwnode_handle *fwnode,
>> +					       const char *property,
>> +					       struct power_supply **psy,
>> +					       ssize_t size)
>> +{
>> +	int ret, index, count = 0;
>> +	struct fwnode_reference_args args;
>> +	struct device *dev;
>> +
>> +	if (!psy || !size)
>> +		return -EINVAL;
>> +
>> +	for (index = 0; index < size &&
>> +	     !(ret = fwnode_property_get_reference_args(fwnode, property, NULL,
>> +							0, index, &args));
>> +	     ++index) {
>> +		dev = class_find_device(&power_supply_class, NULL, args.fwnode,
>> +					power_supply_match_fwnode);
>> +		fwnode_handle_put(args.fwnode);
>> +		if (!dev)
>> +			continue;
>> +
>> +		if (count > size)
>> +			return -EOVERFLOW;
>> +
>> +		psy[count] = dev_get_drvdata(dev);
>> +		atomic_inc(&psy[count]->use_cnt);
>> +		++count;
>> +	}
>> +
>> +	if (ret != -ENOENT)
>> +		return ret;
>> +
>> +	return index ? count : -ENODATA;
>> +}
>> +EXPORT_SYMBOL_GPL(power_supply_get_by_fwnode_reference_array);
>> +
>>   int power_supply_get_battery_info(struct power_supply *psy,
>>   				  struct power_supply_battery_info **info_out)
>>   {
>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index 6ed53b292162469d7b357734d5589bff18a201d0..3f062607e5cd7c7f04384e34128ae0953e25d981 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -820,6 +820,11 @@ devm_power_supply_get_by_phandle(struct device *dev, const char *property)
>>   { return NULL; }
>>   #endif /* CONFIG_OF */
>>   
>> +extern int
>> +power_supply_get_by_fwnode_reference_array(struct fwnode_handle *fwnode,
>> +					   const char *property,
>> +					   struct power_supply **psy,
>> +					   ssize_t size);
>>   extern const enum power_supply_property power_supply_battery_info_properties[];
>>   extern const size_t power_supply_battery_info_properties_size;
>>   extern int power_supply_get_battery_info(struct power_supply *psy,
>>
>> -- 
>> 2.49.0.rc0.332.g42c0ae87b1-goog
>>
