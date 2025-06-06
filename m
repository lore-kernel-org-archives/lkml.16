Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195A27FD5A;
	Fri,  6 Jun 2025 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217131; cv=none; b=kbM6TWIMB8rVdDFQFlbhT46csO7qsc+w7YciNkSIRZYu1cogQqzdNVWEMOKWybmVTxwReZIonsIeb/Rhui1zGGVKyZFeYl9joMXCIjFvfyJ1UmerS9gp9jx/pPRTsYJmbGD4lyW0RHjfWYVDWsoLRiSPU0wApxbFOprI77UOzU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217131; c=relaxed/simple;
	bh=i/sMVuO8iNJ8ZhAbZ6eyUTqL1PCfrshV3q08uPOaI8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMF6Kg80zaidN/GSZcBnZetdZoA5UfhDYuNK71x/+LWT5Ifassfny/Wwpa+uVMyjJOf4d4AncFZ5tn+faQSW0Rk9gcq3yzp20elOJJN4Jn2UgfR2J/7yXpmq6fk6xevyVu2xK7U4om7w1Purd+HcEt4vslfGUkqZ+OHfup5xvfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQRlP5B3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQRlP5B3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so18577715e9.3;
        Fri, 06 Jun 2025 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217128; x=1749821928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBzs9Ew5KwIBcYOeb4WQWOnLhpy4yI/0V3+nv2AZEbo=;
        b=dQRlP5B3QXBsTPD9IU2CTjUL+HIy5ms0Twwbrwsgs4/iWvgFd6+enqVjKoU1Y9c4Wa
         ASWwNTcNp0MCF4ewdTjKb1CNdO4Nqgund+v2MM7wi+OaG1ID/vs2O4tgx1tVkvUWOMSm
         +KsH+XFSSbLmb0jLNlzPlrkYaUN7ATEvZuxGdma1xfAGL4A1+2c8PBA92jNHdtJZ3oeJ
         I/rSs8e+qMyaHUYeY+AqVijAuO1Alp2NUA6E1Qb45X2e3pRJ87dJyCqPyDI7oHbEuJWu
         kGPHjgpQaYan0aiQY095SesPqweNWpZAqMT1UETrm52qNyBU4+V54VuhkTYwnlrD5wCd
         V+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217128; x=1749821928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBzs9Ew5KwIBcYOeb4WQWOnLhpy4yI/0V3+nv2AZEbo=;
        b=kRy95VLqd+NPiXOPCAQ+DzuyCdiFQYTywv4fktSD8lteKQZyCexNd8jaT+2Eop2GMS
         1FbokJEkuvz1SZq2E31Z/Z0wnfn7cJ43B9Ws4POeD5B0uPENbi6jSy2gZheegtVPc3rL
         2HV327vG4V/KtYf23QgjEQnbyIZ1Tb7RhA6753Dq420CY9I4HyyqXD7HwmCXwi9DJD00
         VTtEA4o/FpmXYvx2q3j93hT4IDjLOmCAd+uO36v1Nvp40e6XvuyCqGzJq2JIkpkZSRLl
         pt04xixXbJfdT8ok1OwTFn4qBgj+P/OciDwWyeDKGptR4WcfmzO6P8g5maGZ9M0dKm+3
         tGQw==
X-Forwarded-Encrypted: i=1; AJvYcCVnrxNs7VkHgLJv7PaGMBB2BiUwLU3/vR3J3yBq052hGFOuD4qSjoiSItINpbcXikjUuIfPOnZ9GOJv1PCE@vger.kernel.org, AJvYcCXVqJ7xDkO1y5XcCbbx8pLAQI1jBq2rYyQYzNV0pdIMnPAOLLhoGOerYUyfqDkdl2LRTPrOOVb4mGT7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/nIs53pQ/o+b2WOg9k0jlsYE1ldbRFA16GlweVGJRRI2qGDI
	VKYvWSGgZHDebpmRtHObWs4mBm5FrnxEmTjc2sCQsGtGEi34SKGeKgAa
X-Gm-Gg: ASbGncuN3qrWHz3oRFj3bdXmpBC6oT7fE0ssbn7zoLJf7V0hW708sPj2LKAFR6It3er
	OPuOJI4yQD88+Y32D0+Tj2oYaHJLXs9Ih9atCQ8bYqIoi7I1VT10FyU3fSNiPTd2urnRyKCy/LL
	FEQuu+3Vr2lzaNh0wgL/Q/YE1na726QA8cTVxRZZn58Veom6JUJd3o/y6Oka5ksfWn/3RBI78Q4
	P79GXa/4C8tGz5p83jYnVtlO4iCXjQa0kBB92dYmaz/j111pIuxnVeaLdeM+/X74UuuGP0FPzEf
	VK3jYObj3GP4GSDaJJhMrSInSzoiib2PAtV2yUeHOzl1+hj4MDrjSRTGztBAiy8mCSc3nwcuMYH
	7WgzJywhhgcO4vQ==
X-Google-Smtp-Source: AGHT+IGEeYlCUaUS7RpBCRaEkytsgTz8ufVp559clScKzg118VfvwDv+t0Kd/rSexBzezC1CyldiaQ==
X-Received: by 2002:a05:600c:8b72:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-45201360d06mr36840335e9.14.1749217127892;
        Fri, 06 Jun 2025 06:38:47 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm1906758f8f.55.2025.06.06.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:38:47 -0700 (PDT)
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
Date: Fri,  6 Jun 2025 13:38:45 +0000
Message-ID: <20250606133845.3140152-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025060625-deviate-crummy-2633@gregkh>
References: <2025060625-deviate-crummy-2633@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi greg,

Thanks for the feedback.

>> adds support for STMicroelectronics M24LRxx devices, which expose
>> two separate I2C addresses: one for system control and one for EEPROM
>> access. The driver implements both a sysfs-based interface for control
>> registers (e.g. UID, password authentication) and an nvmem provider
>> for EEPROM access.
>> 
>> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>> ---
>> Changes in v3:
>>  - Fully support the M24LR chips, including EEPROM access, no need for
>>    the standard at24 driver to handle EEPROM separately.
>
> Why isn't this under drivers/misc/eeprom/ instead?

The M24LR series is a dual-interface EEPROM with both I2C and ISO/IEC 15693
RF support. While it is technically an EEPROM, it also exposes a control
interface over I2C via a seprated address, which is used to manage features
such as password protection, energy harvesting configuration, and UID access.
This control interface is not memory-mapped like traditional EEPROMs, which
is why I did not place it under the eeprom

Best regards,
Abd-Alrhman Masalkhi
