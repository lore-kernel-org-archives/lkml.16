Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724222333B;
	Mon,  2 Jun 2025 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748885015; cv=none; b=QiF/wq+3Joi0W/+BUE8rMw1gvakSPHdnPjtY/Fj5atdUKzfetcWODoYl5GOOfqnwhKNuw8Dc0IB19Z4z25IdBwQQTWQleSUk3POhEDxajoe6LL7+0sbVdYMbDMzNS3ffb6RQG0rhC3SjY4IWgRDoE4qLaAvmGsymd5AzFT9xw2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748885015; c=relaxed/simple;
	bh=C9rf7ouhngypM7nNM2evDfxTTs1Q0Qa0/phflMmC3Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0KropVUvgMSObgnAWocIyBZc19Js3FzZS04SMLRW5sfr/kaYqLNB29P/5Rp9m5q1jH8E0qYbMeeAG57vEYKh3uT8qOzuOIwQibpAxCEDUnC7JvW7sjBQbxGExoFMwGK0CVU8PEagDtl1Ta5Z/DZocrbM5Oqh5LsRGqMjNppvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3mAIm9d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3mAIm9d"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4f89c6e61so1880488f8f.3;
        Mon, 02 Jun 2025 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748885012; x=1749489812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO+WB2prBmTu/PpHr+V/Q8jHFCgiKAZIrzjjVnZ9rC8=;
        b=B3mAIm9d8mcdIQTHkeeWqzf3c9NU0ugitIBXZ/Gee12i5SCtKGEW1RZ64O3qA+Nrmj
         fTATBjjpvr+7JH7B3jhUDEiGHDpzTLB9YUKyVd2/hd/+UDRmRMKZd7ahDR8EICd74wsT
         wKiYhi5uW89cPxJcy0xbnAf9GnS2dAwhEMFjc55cV/5b0EtjIiU1DJQbdwiaZK+4gQ+i
         aICHLnV0F/thwwHO22HJvFOIJ2OBg+LjVwUew1FSekJxH7I7mabYGzHTteCRHC9csvlN
         yC8+/6gbDNvlCxBhACrnWt7RlUOdOKnsQd7VaDoQMVPP3ot/Rq4qVkG7SyB1GgT/T1xd
         hnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748885012; x=1749489812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO+WB2prBmTu/PpHr+V/Q8jHFCgiKAZIrzjjVnZ9rC8=;
        b=lDfD+eWb+wX7kuZ2JDpvnBYsBIDZzGt9lZdD3EQkw9NnGQ/5yYXce8tULFuuwLPKG5
         hszqGphUXXdsaia5+EeIOvEoM6OQQrmPYsL+ZLSGvXQOCSz9Xu+9S2oe3ETxYzGlCt2z
         9Y9lD7fODi9kPKvfCJvN2dIgFVS9Rtpr1Cx1plkDFMbc/Jeh/JgU0eTaE6DyXv8/CxZ8
         WmrklU2v4oTbh6SwI0XjZzKhMOW2SM+9db2p40hh7AaV3QbOFc3jD6DimH5NuWn7nnoJ
         LtIpBE95Ao1r2pvo87kOE35PbAkiekanNTRyYQbbbPRJVIAs+d/LVe3WvqjtkT4+vr43
         8new==
X-Forwarded-Encrypted: i=1; AJvYcCWJhxwOEALYSpdqv5Ma0uHCrFBlCm5pH8otWMPHaIR1K5UgK5BtSiJp/UGQx76KlcKj1/AMI+UJRrU+@vger.kernel.org, AJvYcCXpQdjlmRuMl4xxWJIc0y0T233wo3lfuDFvNj/MX2a91+i6IYwUjJEfiA1EEAZ69gbDBgjZq6Coa/ZytgYA@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtNlEa6qcod1tf9X30PgMIKAcFFelTN+J73b0YrrxVuCNEN/o
	AO7A4RYJfDMED0qdruxAjXCqfQixQiPLVXN/3fS3AP2SHaT0riabNWlb
X-Gm-Gg: ASbGnctMrshQcX2WH+hyetCIRcxQRsgCs++M5wGkjQ8Har+/p6ofSF4weDiWERfkgb0
	AsgYmHd/ohYSUkab551K+e8Jvj3c5NEtXQKfUgsfx1BG/XepobpRWWtuF0P8R4+oQqJbZ7ADmt9
	1uM3lVzZM22RugLyR8IkykI+ZmX1+2rboY37MJCNJbqd6hQhOJRlqRvG4p6wnZCnHKkPmrORkpx
	BNc2R4UNV3UYoRcCfIjLDKiEUWFbsio7SpvmhDnGWOQbSzibvAfmKS6iLTKAaHhf0o4JXp7S/9z
	BiRLoF3JR2zUrBrRmjVuC5oq1ZJGCDBXOk5kDNUmWRZ7pkhjRQUrI2Eya12wzpdgsdL5VOPHfxs
	O1KgJSmSbPfYd3iGzU0C/ie2lSgxL13+a
X-Google-Smtp-Source: AGHT+IHaq3Cyp6Xk1s9cnmXFlDjsjJwe6yZUPLglNsw9pyDj6KDwHDmZ0LQhGY+Bcr5ZB/hIyw5SHg==
X-Received: by 2002:a05:6000:4282:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3a4fe394766mr7294007f8f.31.1748885011668;
        Mon, 02 Jun 2025 10:23:31 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-37.web.vodafone.de. [109.43.115.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb7dafsm128284475e9.25.2025.06.02.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 10:23:31 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: krzk@kernel.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add Device Tree binding for ST M24LR control interface
Date: Mon,  2 Jun 2025 17:23:27 +0000
Message-ID: <20250602172327.2029611-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3c49628c-00b0-488d-a660-4b904febca1e@kernel.org>
References: <3c49628c-00b0-488d-a660-4b904febca1e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thank you again for yourfeedback, it's been very helpful in
understanding how best to write the binding file represent
this device.

>> A Brief Overview of the Device:
>> 
>> The M24LR series is a dual-interface EEPROM with both I2C and ISO/IEC 15693
>> RF support. While it is technically an EEPROM, it also exposes a control
>> interface over I2C via a second address, which is used to manage features
>> such as password protection, energy harvesting configuration, and UID access.
>> This secondary interface is not memory-mapped like traditional EEPROMs, which
>> is why I initially considered separating the control aspect in the software.
>> 
>> How to Access the EEPROM and the System Parameter Sector?
>> 
>> According to the datasheet for the M24LR04E-R, the E2 bit must be set
>> appropriately in the I2C device select code to distinguish between EEPROM
>> access and control access.
>> 
>> What is E2?
>> E2 is a bit in the I2C device select code. It determines which internal
>> function of the chip is being accessed.
>> 
>> Device Select Code Format:
>> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
>> Value:              1   0   1   0   E2  1   1   R/W
>> 
>> To access the EEPROM memory, E2 (b3) should be 0:
>> 
>> Device Select Code Format:
>> Bit:                b7  b6  b5  b4  b3  b2  b1  b0
>> Value:              1   0   1   0   0  1   1   R/W
>> 
>> To access the system control interface, E2 (b3) should be 1:
>
> So these are just two different addresses. I already commented on this.
> This is not I2C mux but a device with two addresses.

I'd like to clarify one point before proceeding further, If I remove
the i2c-mux usage from the binding file, as your recommendation, does
this also imply that I should stop using the i2c-mux API in my driver
implementation itself? and treat this as a multi-function device, or
Is it acceptable to keep the current driver logic as-is, while limiting
the change to just fixing the binding and device tree representation?

and if only the binding file, should i represent it as the following:

  eeprom-ctl@57 {
  #address-cells = <1>;
  #size-cells = <0>;
  compatible = "st,m24lr04e-r";
  reg = <0x57>;

  }

Best regards,
Abd-Alrhman Masalkhi
