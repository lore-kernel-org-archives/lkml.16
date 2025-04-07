Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7EB22D786
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022175; cv=none; b=Y5ZUzfrkWwe2x9HIvkxNdflT090XvLp/N19Mw3ZDE6CdcA+nK4jv6os8CT0knemmEZui9pwrVCa3SwqYvcR1KELmlQKXxgOrhKaPbHFw5Zu/Z3ok3losY+w6uMPX7kFPAeWzQv2xPvqLzWEb90PfT0LdFRsKAfH2e7tRt3h8JZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022175; c=relaxed/simple;
	bh=2vFmJQadwu3BXl+ry7RdqnYEoEAHilzCHkL3ekDn58A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slGmoM+y6pKUtMhrifd6Qr10xlbAbRI82vjdRK5lF8OOgWynpbA3E6UBEJ4/XcDQTp4dA1xZD5ewQI8V3X8LXNX6WpajwxU7uUytoTozswh1mBEf4JOjQ1L+6UlOesRHwxnpS6n4As0jrXfDL+/Z2ci/YgsTQp7iVtxP5iNIm3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zh8s8g+f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zh8s8g+f"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so28074945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744022171; x=1744626971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FM1PFfwHJUOBeGnIxQDST77aty6e+oivdo9dqhpeBY=;
        b=zh8s8g+fPdBu4iXMhmM4aiicfvx4/5FnfcGjYwdpzvBop28MC1aYCoZqANOdXp1GV/
         /I+5VJ5VPeT8E6wr2YdA2aM5/vk/oVvc8icVal5bUKHFRvRUa5PE1F4XtuwtC1puVfdf
         teD1MUKIDz/skO2C1JoAaPMfAYXGvshOP2Pb6iGYIiBUmxaXvfkvCt8/flx4/hieocQf
         xhFfLYbIzBhM0AroLjfBCBg8LCbURR9Ue1/DAHRXomIwSPTugMuxpE3XWF+PaEjUXh16
         M0xv6J5ehIXCK4qwpTwmXgtT2MYxJWo6sKEiUd1AJMnAFwgoJomqDCoTdXpMhzVYy4E2
         eY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744022171; x=1744626971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FM1PFfwHJUOBeGnIxQDST77aty6e+oivdo9dqhpeBY=;
        b=lhoaGVPRkcKnIexdfVDxhKW3kLyNmmVe5usa8qFBFVZViwhr6gz349+UHBxX8Cs9xj
         CdpzcBR5pOT/t2VJ2hYihl92NicXGQeu/0kK+ZLz3Jo4fGoguoMVF4maNFd1Ae36u4Od
         +bxJyZ65x9C8aP8t1AChi1cgIF1kUBUbFST30R+FO4+ibSfreROQIHV33AYwXljEp/oM
         tYB+wc6yYQOTlZdfN1YFKYMIGc/mP52ymubH7H9jOYyEZdeCxbqOKplXGIaK1ELb2TPX
         4nfmLC9THLgaKkYipP6vXn+cnaTDfYneuPje5hLmw56Mxma5MUkKW4FEO426A17UqGEO
         786g==
X-Gm-Message-State: AOJu0YyxlabtFXo+PNbgGZ98a6BJ+iDIl+IQygLiCFXCARZBhilXox8b
	ZpxJuEyB4ftNnJNDDJyhcRZti+jI3IGX9SIantuSUV49APwO7ShSBhszwHfZAaI=
X-Gm-Gg: ASbGncuzh8CsQd43tMZirw2ej2RPECFVjGwO1dn9xK+oK6DGmRDWxFZUyL0NYzuxLG8
	yAv2YzQdHaTjCL08N3CyPIAyqJsurTNU0c0IetK0kMUuqtR+EAvXH+tdHpPp9JDk3xcykDHFuth
	wsMFfRm9AKnsEmrE9jj+t/W1T8zQbJRhWx/GRxfERggL+/tevQ8nggrwpmHkiUjZNvuBOGZdQfY
	vMX775bq+Vj0EJECyOxDkIF1SD1n46MGEtRwfDiL3BNKVfyg/psEQ6d7F4fwDzkGL/3cay0vNLu
	j4DYLgK0Y8C80oSd9oGjxltpcFpUNYywoM+qHdIYXbGyHRPHp+dWLuxlMC4HTOU=
X-Google-Smtp-Source: AGHT+IH5rAMB/IZIEkKrpkZh9YG2yYVYW+wp9Vh8rhjx+HJnN19tOY0cmBnXHLaxe63H9vIn+4XCmw==
X-Received: by 2002:a5d:598b:0:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39d6fce100fmr5767978f8f.45.1744022171475;
        Mon, 07 Apr 2025 03:36:11 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c301a6ae5sm11791690f8f.32.2025.04.07.03.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 03:36:10 -0700 (PDT)
Message-ID: <02f09c34-09ed-486e-a8a8-23b0df718197@linaro.org>
Date: Mon, 7 Apr 2025 11:36:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mux: core: add exclusive mux controls support
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250326154613.3735-1-srinivas.kandagatla@linaro.org>
 <95b7eaf0-2040-a25a-4c41-ab86aba82a8d@axentia.se>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <95b7eaf0-2040-a25a-4c41-ab86aba82a8d@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03/04/2025 21:58, Peter Rosin wrote:
>> @@ -479,6 +487,10 @@ int mux_control_deselect(struct mux_control *mux)
>>   {
>>   	int ret = 0;
>>   
>> +	/* exclusive mux control do not deselection */
>> +	if (mux->exclusive)
>> +		return -EINVAL;
> This is unfortunate. I think there is value in being able to deselect
> muxes in exclusive mode. Otherwise you might need to keep track of
> some idle-state in the code, when it would be more flexible to have
> it specified in e.g. the DT node. The best idle-state may very well
> be hardware dependent, and is often not some central thing for the
> consumer driver.

Does it mean exclusive mux can deselect a mux however its not mandatory 
to deslect between each mux selects?


> 
>> +
>>   	if (mux->idle_state != MUX_IDLE_AS_IS &&
>>   	    mux->idle_state != mux->cached_state)
>>   		ret = mux_control_set(mux, mux->idle_state);
>> @@ -523,13 +535,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>>    * @mux_name: The name identifying the mux-control.
>>    * @state: Pointer to where the requested state is returned, or NULL when
>>    *         the required multiplexer states are handled by other means.
>> + * @get_type: Type of mux get, shared or exclusive
>>    *
>>    * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
>>    */
>>   static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>> -				   unsigned int *state)
>> +				   unsigned int *state, enum mux_control_get_type get_type)
>>   {
>>   	struct device_node *np = dev->of_node;
>> +	struct mux_control *mux_ctrl;
>>   	struct of_phandle_args args;
>>   	struct mux_chip *mux_chip;
>>   	unsigned int controller;
>> @@ -606,7 +620,25 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>>   		return ERR_PTR(-EINVAL);
>>   	}
>>   
>> -	return &mux_chip->mux[controller];
>> +	mux_ctrl = &mux_chip->mux[controller];
>> +
>> +	if (mux_ctrl->exclusive) {
>> +		mux_ctrl = ERR_PTR(-EPERM);
>> +		put_device(&mux_chip->dev);
>> +		return mux_ctrl;
>> +	}
>> +
>> +	if (get_type == EXCLUSIVE_GET && mux_ctrl->open_count) {
>> +		mux_ctrl = ERR_PTR(-EBUSY);
>> +		put_device(&mux_chip->dev);
>> +		return mux_ctrl;
>> +	}
>> +
>> +	mux_ctrl->open_count++;
>> +	if (get_type == EXCLUSIVE_GET)
>> +		mux_ctrl->exclusive = true;
>> +
>> +	return mux_ctrl;
> This is racy with no guarantee that you are the only consumer after you

Yes, there is a chance of race here. locking around mux_chip access 
should help fix this race.


> have gotten an exclusive mux. My sketchy vision was to have an API
> function that requests an ordinary shared mux to be exclusive, and then
> another to make the mux shared again. Those would take/release the same

hm,  dynamically going between shared to exclusive is going bring more 
challenges and consumer side its going to be more complicated.


My idea to do this way was to allow more flags like optional to mux, in 
same likes  regulators or resets.. etc.

> lock as when selecting/deselecting, but also mark the mux as exclusive
> and trigger_not_  taking/releasing the lock in select/deselect.
> 
> But then we have the little thing that conditional locking is not
> exactly ideal. Which is why I haven't done this before. I simply never
> got it to a point where I felt it was good enough...
> 
> Another reason for me not having done it is that I also feel that it
> might not be ideal to reuse mux_control_select and mux_control_deselect
> at all since the rules for using those when the mux is shared are ...
> a bit difficult, and will remain that way. Thus, having those functions
> *sometimes*  behave like they are easy and sometimes requiring great
> detail will make the already bad shared case even more error prone.
> 
> I wish I could see how to do this sanely.

How about going with current approach with locking as suggested?

thanks,
Srini
> 
> Cheers,
> Peter
> 
>>   }
