Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E54344C77;
	Tue,  3 Jun 2025 05:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748928021; cv=none; b=c2VoznpONufRYWEmcxnmKp3LoNNmJ1gV0wlFRvyQdX0R4EhUQoBO3C+j+b5OEWWk2rmRuyBgzcad0rsSx/P0Sw57QzElIaLxbY6k0w1/pLWfcbyJrtI+deckxMzmqFt87TXA6LE42VKhRRn0P/IZ6scf2ibUNxqhlOwMrRrF8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748928021; c=relaxed/simple;
	bh=uSrBUA7qXhmPgCeFnxoDsqzn0cDtA79gkNIX9CnLPbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A51WR0rMycEmcaL9dolRrJ8Evniv13m24RaFpUN4wJwav259a5wsE+rS4BByEKPmI8I/S3VzdvZfP+EgQ/6mAVjghWhxhzWtY7PpVkxq450AojUYeF3NLhy1r/50dX3a+1bCSNSF4a/echnIYeVM6JnOvwZAXLdUCDHITEXwxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijw4OHOY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijw4OHOY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so56134015e9.1;
        Mon, 02 Jun 2025 22:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748928017; x=1749532817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSrBUA7qXhmPgCeFnxoDsqzn0cDtA79gkNIX9CnLPbY=;
        b=ijw4OHOYwEw6jnktbEz00qrnGlpS/ItaPXiQ10S6FJnMXPB3VIhW6Cu3dBuHPbjPay
         m2AzkH/BQWOlp5uughmY0BRC6IdDWi97n7qNhchz/A1cTBrFV35jEQ0eaAFH8rzFfKi3
         uWweOcY7/YMYO2cvOo+XJwmMi+Jsnr9L3fx90w/tgHZz1GKAVR5B6+PNPvlNCirXVxhE
         yar5qIFC2tDnC5hEawDNUVBrlo+7pRL/DccC0BS2KTCf+ND0At4fRPcIATVrmZY6Edu3
         gJvgEFduP81pPEFTdh3gc6ur94eiyk6PZ/w7BiBIuLAUbEEL6fppGKX/v4GxV0hfqkse
         1Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748928017; x=1749532817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSrBUA7qXhmPgCeFnxoDsqzn0cDtA79gkNIX9CnLPbY=;
        b=uUcFAMlbienQMsRnS/obiAX0fAiKovrZIfFG64yi31shAwcGQhWBLFBl9FLQwPHoLo
         zxDuB8z8qKTWSZgvXeerHdMYts64qPGN0sBuXkQ8Nsd0nkLVT9XuiVP9lgPsgEf+LK1G
         GCKuKiDb3NipcHXzPC6luVJDlcKI+iJnb2OPGUh0ME/t6ULpk0wsmmxjegvnDzQGQ8FB
         780je0Io2vh38xpiQ+Hw88XGnenVrLrVfn7nrSPwSh4NZNKS8a5stfKSoEvcfdT4FD0G
         Oh4xL67bvCuL4KXJ8pk9QswYMJlrjbKYUfwJU8y8es/XnscoZxajhjtWj/5aTy0lNSmi
         LRiA==
X-Forwarded-Encrypted: i=1; AJvYcCUdb8KSeCyqN9sE5NDnn5R2UAKsPN2fnzTOWFFRPQ+bpR+DJxsbqDi0csA1tR9WpUbWm9k/I7JCQaBOh3Rh@vger.kernel.org, AJvYcCXCdqxO6EkRW5/0Br9S+eWilAYE2TDSVwqEYNTv01/wrFfUcrrCA8tqBfQOY+H14DuPyHJ84OoNvjWF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3uLqHPBh5dco+Izg6+l/jaulSWfnaZ+IbdmX1mJ+tcOpjtfZS
	jXv97u4S0BmTaBrP25RA882i8sOKv3uSrHQSjiARAmBFjuPGoGPNDzA1
X-Gm-Gg: ASbGncvaQbtaIQ3Gr3j2rOVia29GrpH1D686bAQZQCy66c8AWa0hN59z87rlo/8Ai1x
	0EvbMtObrcPuJI5de9Nkj6AEeJp00YcLFCGEeXm4Bwk9Q1VyTVdeACkwj+MyCb30/oAB4pySlkL
	yge1Fea4qQ+WQg86fXGYbVKFnPX3hcjPjE3nBtbKRCkQP92qTwuHU4FVM9xe3Im/W64ZE9QaFVy
	L6CNO2gf1iV2gtMWghfwJfJSVNYWkJqxe4U3iDsbGtc7y63/UksfMt1LTrRSWbb3QOYoEMP5ime
	kaDWJzMjlt5Z/J5EeDZXn0/IxVg0fESUY0WuT7vpKcWQGHydg9NWZsnb8YZts1d99DOQH2jFzYK
	YG8Q14ebYcCo=
X-Google-Smtp-Source: AGHT+IF4XDMIUZS1NygKfEDgB/9iNHXsSuXUUSOgnrWMBsOxy/H6LoHW1BTp2q7VdfRALOnOPI6MNQ==
X-Received: by 2002:a05:600c:5287:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4511ee15434mr82345975e9.19.1748928017238;
        Mon, 02 Jun 2025 22:20:17 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-37.web.vodafone.de. [109.43.115.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb7dafsm144578025e9.25.2025.06.02.22.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 22:20:16 -0700 (PDT)
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
Date: Mon,  2 Jun 2025 17:47:53 +0000
Message-ID: <20250602174753.2029658-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <29b221e2-254c-4964-adfd-b99cda8b5011@kernel.org>
References: <29b221e2-254c-4964-adfd-b99cda8b5011@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

>> Is it acceptable to keep the current driver logic as-is, while limiting
>> the change to just fixing the binding and device tree representation?
>
> Dunno, did not look at your driver. Again, I am here talking about
> bindings. How you implement it in the driver is up to you. You have
> however one device with two addresses, so you should most likely have
> only one device node in DTS with two addresses. In certain cases, like
> separate resources and re-usability, children are common, but that was
> not really the case here.
>
> Look at ti,pcm6240.yaml, ti,tas2781.yaml and few others (you can git
> grep for them for reg with coma).

Okay, I'll rework the pathcs to use a single device node with two
addresses instead of modeling it as an I2C mux. Thanks also for the
hint about ti,pcm6240.yaml and ti,tas2781.yaml, I'll review those
to make sure the structure aligns properly.

I appreciate your guidance.

Best regards,
Abd-Alrhman Masalkhi
