Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42119E967;
	Fri,  4 Jul 2025 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751664575; cv=none; b=FkMZ8trdfTKsUJWV/CjWqoNCXxBg+VB1cMsY0D4mMpmUZfgb0Kb9KIqrXsAZwHLTGDEmk8XQHT1IPRJwotR6tUI6GK6qeO6ZS9aTrFQGdnGeBsD4+8O37PpFBCtutmo/HGLIK34OxBKPQw/aaATMYt8lKJItVkvKXvfcrjiUa5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751664575; c=relaxed/simple;
	bh=JuN+hWQitkS0rpnjunocdynZ+N/dQEzwHnXPyWt9lfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XC3WMxqyPnp30OXCTyRToun1MkLHm2AwzNGX07zqnb3Ejw/iPBDEZrhV4mDbwAuXP7KnHMT2YMW2hgc6TUIGqboSuhC0X3ra5aWGtdheA3uNkzD2POrzG9/YoyJL0TGlEyPLiPpmDq8WZyp/vOGbzFrspv8+qb7yKSQIR+Q1BuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVLIiFZH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVLIiFZH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4539cd7990cso7672955e9.0;
        Fri, 04 Jul 2025 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751664572; x=1752269372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KBm/lhozvu+gIcRz+r2JVI4d0BG/2qbbUD1AKABrtI=;
        b=GVLIiFZHpzpy79h8ca3ObPMkz2+6AnxmbDQzG6b6w54QOXwePijg3qUi4M11QUs29u
         iisUfnb4HGH/mj3ivxySFCLP41gRCyNLZQjiZAW4cWpIirgM1vTX4o5thLIK+qz1igqB
         jgoXCBj2XNTUwUd8Ps4J1QvLUMqg5JFmOMqwRk/QbStBuobjj09vEjPbD2pBKNzzWmUe
         B+WR0zYjKEGAxnqy3XrmWtG/7Vsu88Cr7+i+wpVdGShrRWgVKyn2znYPwXTtZ6srmW6v
         n01l5aiIk8dIjWIIb9x3ui1SeyUoFWeddyWHmQgBxHWR43XJdyYnmgKbeXTw3+rytF/H
         NZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751664572; x=1752269372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KBm/lhozvu+gIcRz+r2JVI4d0BG/2qbbUD1AKABrtI=;
        b=kEBNeUVIA3cquCuXLedRUPIxTjU3Hlphwf9qB9Fy4bRJKvfwtd7rSw8G5ZGFFpuc/b
         fqWbIN+N6Q9fuNKpGG3jt55zEbu74Reu+AdVE2Oyi9tXSFj/DV3PJlrZF0J2wcF0lk5U
         RuyUJzoZkEV6/1o1emf+KM5ROmMO7x3zsq4OK2pgcAnF+B/UVCnCIWpfsuatBuSK2TgV
         KC4V3znQqPGFXdxXK1ixEhRMD0KtJuhgHWKE2gBoz0BA6XGvK3imAnSeSC3nhCViCWb/
         EGY1rl6lkTQANwA8Ght2G7MDu98WHG7tqCABV7RbSBFnBIvaiv8xd7z19J8VwJLYo/03
         PxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0dEjMqkskJ3XFC1uuhczNdPrNFscAYPYagcFAf/E16R1kXklx4WJFUSJ9v7H8W5M9bFMfRWRkmuWmvGfa@vger.kernel.org, AJvYcCX98kNA1yUJnv5YdurNBT9AdJws9Ok6LJPZMwE8pLgo+a0JdEmqXWQ9fQZCuAqkDpvEx+h5uDWR6Uvv@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXz/Q24R87owPXZqodGeI1Zth4zB8QEZKATkVRD4kPFLDKNGY
	34O55FUo2P9xTdV7UYo7cUSzwxKfHNjgR/+t5OyVXFQPH9GD5cAP12DZfFDlzA==
X-Gm-Gg: ASbGncsCaEy6bu+bSyfbvLtAxisLINvXZx0Iv5WmMLUOSaQ3ybhPXXYUsmfTPPf4siS
	Sf2jPGotn7/o0cAuFc4nxxgrzAydZK2MWyNmy6MwS9jR1SL1t4lWlNPk0/wLKpLEnWfRu5WQiY1
	ip9tTterxV5PxYQUAnj/8gYs2tzAYFvdRxyrsAL97XZmhl7cAJT6eHQM2mUAF+DA5xJar6KGrT1
	xNd+EF8dEgeZnpfuyK01w3pcxozfLRtuEd2Ly9UYiZpoe616xdWcecrqrvymL9Wiucs1W5kpMpX
	JW3RKyNolICnbSHA2emJhko1sxOoDI8leWdNYr3itsOgWExXS4TXJU02lXneiA==
X-Google-Smtp-Source: AGHT+IGM7m4wR0MoPJnPgJuz9Vwu2sPz9UJKPF2IMAbVnyqXa7RTqVoK2CmRz5Wpzh0P3nMc3WPj0A==
X-Received: by 2002:a05:600c:a11a:b0:453:7713:476c with SMTP id 5b1f17b1804b1-454b26885a3mr35046085e9.2.1751664571678;
        Fri, 04 Jul 2025 14:29:31 -0700 (PDT)
Received: from masalkhi.. ([61.8.128.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm3330929f8f.83.2025.07.04.14.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 14:29:31 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org
Subject: Re: [PATCH v5 2/3] eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips
Date: Fri,  4 Jul 2025 21:29:28 +0000
Message-ID: <20250704212929.12348-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <95dad033-4338-46de-b62a-be1db459b0ec@wanadoo.fr>
References: <95dad033-4338-46de-b62a-be1db459b0ec@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christophe

On Fri, 4 Jul 2025 20:40:51 +0200, Christophe JAILLET wrote:
>>>> +/**
>>>> + * m24lr_regmap_read - read data using regmap with retry on failure
>>>> + * @regmap:  regmap instance for the device
>>>> + * @buf:     buffer to store the read data
>>>> + * @size:    number of bytes to read
>>>> + * @offset:  starting register address
>>>> + *
>>>> + * Attempts to read a block of data from the device with retries and timeout.
>>>> + * Some M24LR chips may transiently NACK reads (e.g., during internal write
>>>> + * cycles), so this function retries with a short sleep until the timeout
>>>> + * expires.
>>>> + *
>>>> + * Returns:
>>>> + *	 Number of bytes read on success,
>>>> + *	 -ETIMEDOUT if the read fails within the timeout window.
>>>> + */
>>>> +static ssize_t m24lr_regmap_read(struct regmap *regmap, u8 *buf,
>>>> +				 size_t size, unsigned int offset)
>>>
>>> Why returning a ssize_t?
>>> regmap_bulk_read() returns an int.
>> 
>> Since I return @size (of type size_t) on success, should I keep the
>> return type as ssize_t, or would it be better to change it to int
>> to match regmap_bulk_read()?
>
> Hmm, this ends being used with BIN_ATTR() in 
> m24lr_ctl_sss_[read|write]() so it needs to keep with ssize_t.

Done.

Best regards,
Abd-Alrhman Masalkhi
