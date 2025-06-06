Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C72B9A5;
	Fri,  6 Jun 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219902; cv=none; b=c7LfZzBreeVQvE8HsAJLaIl+W5XpukuC5f/wz3BuZKWByY7sgJfwn/0wCayGgZuJ0sfYIoxgokILr1rw9qtcxVIGyP8PzOM6Wlcu8Ia3VgAeCCoDU4+vTUquw1cOJqQlEZMj9DQ5zRLedQpghpYIgd64CAxGQ+C6wdIGKY7MBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219902; c=relaxed/simple;
	bh=iqG/efhZVTgsxHipSyjybtPfHYZOrkqBqAApKV+b51A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmWLOtkDIl8J5tXkpc0cknmnZ5gvO5pnmAzrGpWPgs4DUvG+wDDJHx5t0SsEr2k5yrHHRfq7a8pqqEqqwdj1W0itFy02xG7UwXOCX+3xKHr8RRwVhBsxFa//PoXueJ1H7aKuwBv20l0iIj08G3eOoo5PSfQq85bJP3HOaN+AU5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1hOf06h; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1hOf06h"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so15124105e9.3;
        Fri, 06 Jun 2025 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749219899; x=1749824699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RU2KfMaJ2+9yanxW+f1dhdc9HAZcZembcLZ9Md0lK/k=;
        b=M1hOf06hHLAgfJl/QcFGhhBrAYllBkimQJ4K6PxswiCFmDfqEDtTMM4L9xvI0AGm1K
         l2ptklkz9PvQQncx7+nCaGiqzpSgjHgUwrObrnsqANj73VM9DWNewhfc910PbArk/aC4
         H2JNOYvvhCo5LasFmF0SzPppbic9KOGSDsOnO99+0p64g/9SbPWZTSkdeK/mauxEfW6D
         A74fqr59v5xnnR+WeAmbTsV+UUf5AaqmUA4b19T6scQkaqHkncTOqSTr803qMyY/3szh
         TEcAvuyhMfC59LmrIo0WIqFd+6vZ0pr2SxpvOyFecaTkBVG8fD7I3J7l3ehTqXK9clXA
         kKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219899; x=1749824699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RU2KfMaJ2+9yanxW+f1dhdc9HAZcZembcLZ9Md0lK/k=;
        b=OjaDcNC/R+spUJXlwyOVwZCmAhTLcZ4albWh4yQYH3gHPqu7oUNu7pFTBiNTV0DA1p
         jx4WC1pgqhLEeHMaCNkxEIQ9OftpLZx2fx7dDFG76LPxuW8OP57Mc7Uk8cXPPvPutuya
         LHzToaB1EZm6Y93HCua+mEXUgC71kDEsEWDI1cxrhZxDQHXltoiJz7FB1LCzfAav58xy
         SQu6LMWO5oyTS6zqCryV7Q48OXmArCYutXw7QGfCTustAklPxEiPUfw+enm5Uni0yJ6q
         PMgg5f+0UoGZqHAn9Q3MqvYCE+RC/+Ul6yrOicM474jnFTDj2/1zWXhK4S3GfMX0t/Hd
         WcAA==
X-Forwarded-Encrypted: i=1; AJvYcCVvG5XECk4Qj2Bjputcu2LvrsqaKpmpI5FE8e4o+wge//KsA1EahK9WjzYJwGBUnaLNDghOwWTPksP5WE8m@vger.kernel.org, AJvYcCXq/X08mLaOadQL62ox13fX7eMwZe+CfmeDfPBHc/YmGrT/UEIT1T4w/5+FLKBST0QFB7SBIiKDm4M+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvr37TUGQh/HdMDWSPrZxpYlKtpVHDUa9NSqGPV9yKIA3dYlds
	pGleM0PkllqrDu/jDy19f9EqeIJCD/8XkH7qG5qOQiqd3ZQ1otwhtZUs
X-Gm-Gg: ASbGncvupCoQCO+iDi4Xn30AKHN6Lt6EmVxlDOJKsp7wjcrT746eOrXfW5D90zqmRBP
	xetkzTfyNFXHSmg+Kat6GlDp7dOyWkemm2onm1bBEGeuPdYoXzNWndRXG8Q0LUFEPwjul3AJoGq
	ELchZjv/th3CQiUikmsVF4nXO4pvVUAlajRCw3ugo15UmJrWUWUQHEcexi1kAXcxh8nNcSvQL7t
	jeFcXHZ27wVQeHusEm8/0XOu9d9khH+waakPl2H6anMhgL2/VK0ZptvIEV2FMLDQ07NO+D0z6iy
	RO/yxiFanFWrLo58Fuml7JvdBLjOtVVgsAGoP2197mAEHBBIrVHzguvpZ8egl0YViWFAK0GfSxk
	ol9eaDt00HzbOEwRSdQNe14gW
X-Google-Smtp-Source: AGHT+IEBJ4DoVvw/stlDOgi18RzfrOUTiRlKASLE2QkGIDx36kpF9qdd0AZsPbr8D1+OxjcNDNlTIQ==
X-Received: by 2002:a05:600c:83cf:b0:442:f4a3:9338 with SMTP id 5b1f17b1804b1-45201404993mr34463405e9.21.1749219898437;
        Fri, 06 Jun 2025 07:24:58 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f82878acsm33018475e9.0.2025.06.06.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:24:58 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC EEPROM chips
Date: Fri,  6 Jun 2025 14:24:56 +0000
Message-ID: <20250606142456.3140225-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025060650-tried-widen-4443@gregkh>
References: <2025060650-tried-widen-4443@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi greg,

Thank you for the detailed feedback.

>> +// SPDX-License-Identifier: GPL-2.0-or-later
>
> Are you sure "or-later" is what you want?  Sorry, I have to ask.
I will remove the or-later part, lol

>> +
>> +#define M24LR_PAGESIZE_DEFAULT	  1u
>> +
>> +#define M24LR_WRITE_TIMEOUT	  25u
>> +#define M24LR_READ_TIMEOUT	  (M24LR_WRITE_TIMEOUT)
>> +
>> +#define to_sys_entry(attrp)   container_of(attrp, struct m24lr_sys_entry, attr)
>
> This shouldn't be needed, something seems odd...

I will remove the M24LR_PAGESIZE_DEFAULT, i do not needed any more
and about the to_sys_entry, i am using it in show and store callbacks

>> +static ssize_t m24lr_ctl_store(struct device *dev, struct device_attribute *attr,
>> +			       const char *buf, size_t count)
>> +{
>> +	struct m24lr *m24lr = i2c_get_clientdata(to_i2c_client(dev));
>> +	struct m24lr_sys_entry *entry = to_sys_entry(attr);
>
> Why isn't this just going off of the device?  Are you using single
> show/store callbacks for multiple attribute types?
>
>> +	unsigned int reg_size = entry->reg_size;
>> +	unsigned int reg_addr = entry->reg_addr;

> Ah, you are.  Are you sure you need/want to do that?

For registers that do not require any special processing, it's sufficient
to directly pass the value to the device. In such cases, a generic store
callback is appropriate. Other registers that require specific handling
have dedicated store callbacks. For example, the unlock attribute uses
its own specialized implementation.

>> +	u8 output[8];
>> +	int err = 0;
>> +
>> +	if (unlikely(!count))
>
> likely/unlikely can ONLY be used when you can benchmark the difference
> in the speed of not having it.  For a sysfs file, that's not needed at
> all, please remove all of these.

Alright, i will do that

>> +		return -EINVAL;
>> +
>> +	if (count > (reg_size << 1))
>> +		return -EINVAL;
>> +
>> +	if (unlikely(!is_power_of_2(reg_size) || reg_size > 8)) {
>> +		dev_dbg(dev,
>> +			"Invalid register size: must be a power of 2 and <= 8 bytes (%u)\n",
>> +			reg_size);
>> +		return -EIO;
>
> Not -EINVAL?  This isn't an I/O error.

The last if statement is primarily for debugging purposes. The reg_size
value is specified internally by the driver (not user-controlled), so
this check helps catch potential mistakes in the driver's sysfs entry
definitions. That's why I used -EIO instead of -EINVAL, as it's not due
to invalid user input but rather an internal misconfiguration.

>> +	n_sss = chip->n_sss_entries;
>> +	if (n_sss) {
>> +		sss = devm_kzalloc(dev, n_sss * sizeof(struct m24lr_sys_entry),
>> +				   GFP_KERNEL);
>> +		if (!sss)
>> +			return -ENOMEM;
>> +
>> +		for (i = 0; i < n_sss; i++) {
>> +			char *name = devm_kasprintf(dev, GFP_KERNEL, "sss%d", i);
>> +
>> +			sss[i].reg_size = 1;
>> +			sss[i].reg_addr = i;
>> +			sss[i].attr.attr.name = name;
>> +			sss[i].attr.attr.mode = 0600;
>> +			sss[i].attr.show = m24lr_ctl_show;
>> +			sss[i].attr.store = m24lr_ctl_store;
>> +
>> +			err = device_create_file(dev, &sss[i].attr);
>
> You just raced with userspace and lost. This is not how to do this,
> please do not dynamically create attributes (hint, this should have
> errored out as you didn't correctly initialize them), but also:

I didn't fully understand where the race condition comes from. Is
the issue caused by calling device_create_file() from within the
probe() function, or is it due to the fact that the attributes
are being allocated dynamically rather than defined statically?

>
>> +			if (err)
>> +				dev_warn(dev,
>> +					 "Failed to create sysfs entry '%s'\n",
>> +					 name);
>
> You do not unwind properly if an error happens.
>
> Just use a default attribute group attached to the driver and the driver
> core will handle all of that logic for you automatically. Making the
> code smaller and even better yet, correct :)

Thanks for clarifying this point. I'll rework the implementation
to use a default attribute_group

Best regards,
Abd-Alrhman Masalkhi
