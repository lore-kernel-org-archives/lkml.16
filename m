Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDFD2C326A;
	Mon,  2 Jun 2025 03:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748836104; cv=none; b=AYNU0NDr7Reu2rsxvAYhJzPSREvw6pIBXli452a2zb+S3KVt2tPk2uBsHQGHb/vbZBBYYFWqrBBwDrjMIic+sBc72EpJfEI83r3+kWC8Cs4uF5Akxoz3ITc+tLnch1OZfNsmhDRdkX1xMpfespHlaom9UuqXqMI8pr2h6FMWcLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748836104; c=relaxed/simple;
	bh=f2Y1DdUsMeoMC+/MkCWTqEtYn9q+avCoG4+dvtIbb8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJRmTybmxJWaIMcukgJaeYRA7+Tou8T/o9Liaz91bfFgsCLt2XSrcRGs2zG/Dol0PXTKQiXAE5CUyJ3SJo3iorsieII9OxyY7L5BMBi7oCE7RGxbye1Oc/3Iu42LdfNdiKcGjqwWKndM2MC9O6QXyVKzqv7S0rTLm9nzVzko2EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2qaUmGI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2qaUmGI"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so7583604a12.2;
        Sun, 01 Jun 2025 20:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748836101; x=1749440901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF05030bQG30HtP9NRXaunb/pRaYwF2wVq6QLqr1muQ=;
        b=k2qaUmGIrwkvMjCrjaa7mEpA6aNcqzLimKYo3eJJv6p1u8qDNOqfuRgvzgTe4veTTk
         lSV2gMN0pH0FYmSPX5r0ymoz9L99B/0vSoTzmRFQPjgLErZB3W3CYJqtzF0HGNGo8qWT
         mRegVMNdbXzneYIgPFhIg9tNf4j6NhOfwVd4Shh4mBubpYlGxR6+s2BnhaTNcDDImdMk
         s2zpSbbV6JTxtXdzExuwHSI1Z9fdFSkPRg4tlyr2GTLKccYX+MbQM+4T5aEcu/k0cOVH
         e8nDXLrKUNLiuRl+2WmpvHHaRFz/ZOsXM8ythWuhJCjrPrZG6bG78hgV2JqPBOYfnxJJ
         d9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748836101; x=1749440901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF05030bQG30HtP9NRXaunb/pRaYwF2wVq6QLqr1muQ=;
        b=xLdXHnHf5TGHqQsDbPQAlC1JPPaMAcnOO/6OCFkFXHqxTWrQOIszxK6Lu/L4ou0MN3
         uBmvbtAmTTaGDqqrIkAUsFJeQKzw3da3eFFaXnMAj/PoGz6B2ujhA/87J1Orv5L7nfVy
         XhaQ9kJVGOd+xk4lRbLtwsrc7g4KCPBCxXDQlWEfugAUEYtg+3uldxICmrW7zKLmTCw9
         nrN98c+3ByWraviEsf6VJ5Bljcei9r945UrUqaiuY+PaQiZkc3AUZN6LczG1pTkGUPv5
         gEtVxjooiOK2v6GlJh+vsc+SCwrPhxiujhzKXtt3wuOkHk1np7g0WO4AOvjJg2vECMkX
         HcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+yV1avxzTlNw4MHVNwRRbrE/RkI2AuuZ4jAJhYPM3rYjjFnknkzX2maWpP0YCBHOg665b3dj0j4N4@vger.kernel.org, AJvYcCU09TPsZ481xBqsFPD52ivRe8AOJ+8lsllGebzVuVvmVwLiZQRST2NKJm1YVpgiXHINo2LAQt1HCJwI8vvG@vger.kernel.org
X-Gm-Message-State: AOJu0YzbAKZ5f7HsiWML5T0oaGkD3/2N0JF23D1pBMnHb1/nYrAlAkzj
	5lLTW8z0ZoG4HAIbvo74rtn8zsojnjvmr1fixBhu1Owaejz2/vMwHwnM
X-Gm-Gg: ASbGncsAwHF4fFQoeJRdEjoihkk2ESZxgplfeL077Y8c8/rj344cys6jVf6CID0Pxkr
	JF2mvt9aeYFSFGkZXgb/UBHtEbBaFIslcrK2yNV+Kcc/+Q8u0aWTWRRYHMK62BAX55EoQ/GGN3Z
	kV0PYkJ29ikQcoYn85MSA5CZljM/SEXtmb7o2yFAflYjS3r8Uh9UHL0xJHJ0caFf8TD6icm5hFt
	C1w43x3Sh4+krm8Q9FEiO3bimVJDGGwlDMkzPY2VJ2Wnsa3AdMx4qRGBxC00Nqm+cZZyTOKSvkV
	iPuy9oSqyIItzCucRReoSIZwTGzBkj9RwhJqdNmRh7AAlZdpoT+5J14EazXsvdYAJeDlphiLvdX
	uWLvKs1ij6r2lP5CsnGl7MCJ1dE+e
X-Google-Smtp-Source: AGHT+IFnhG9G/fgdalW7D5LPkBP/cvwYKdeFaNJ9kThFSBVKpGpm75t7S7ugdrl35/sjubl7OtqH8Q==
X-Received: by 2002:a50:934b:0:b0:604:5cae:4031 with SMTP id 4fb4d7f45d1cf-6057c62b1ffmr7634649a12.28.1748836100705;
        Sun, 01 Jun 2025 20:48:20 -0700 (PDT)
Received: from masalkhi.. (ip-095-223-185-132.um35.pools.vodafone-ip.de. [95.223.185.132])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6056716beeesm5424591a12.80.2025.06.01.20.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 20:48:19 -0700 (PDT)
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
Date: Mon,  2 Jun 2025 03:48:17 +0000
Message-ID: <20250602034817.2028695-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <be95cc2d-f548-4c71-a57b-8107009b8776@kernel.org>
References: <be95cc2d-f548-4c71-a57b-8107009b8776@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thank you for the detailed feedback.

> Do not send next version while the discussion is still happening.

You're right, I sent the updated version too early while discussion was
still ongoing. I'll hold off on sending further revisions until the current
points are fully resolved.

> Full path, so /schemas/i2c/i2c-mux.... but this is not an i2c mux, at
> least not in your description, so something feels incomplete or incorrect.

A Brief Overview of the Device:

The M24LR series is a dual-interface EEPROM with both I2C and ISO/IEC 15693
RF support. While it is technically an EEPROM, it also exposes a control
interface over I2C via a second address, which is used to manage features
such as password protection, energy harvesting configuration, and UID access.
This secondary interface is not memory-mapped like traditional EEPROMs, which
is why I initially considered separating the control aspect in the software.

How to Access the EEPROM and the System Parameter Sector?

According to the datasheet for the M24LR04E-R, the E2 bit must be set
appropriately in the I2C device select code to distinguish between EEPROM
access and control access.

What is E2?
E2 is a bit in the I2C device select code. It determines which internal
function of the chip is being accessed.

Device Select Code Format:
Bit:                b7  b6  b5  b4  b3  b2  b1  b0
Value:              1   0   1   0   E2  1   1   R/W

To access the EEPROM memory, E2 (b3) should be 0:

Device Select Code Format:
Bit:                b7  b6  b5  b4  b3  b2  b1  b0
Value:              1   0   1   0   0  1   1   R/W

To access the system control interface, E2 (b3) should be 1:

Device Select Code Format:
Bit:                b7  b6  b5  b4  b3  b2  b1  b0
Value:              1   0   1   0   0  1   1   R/W

Is This a Gate?
Correct me if I'm wrong, but to me this behavior resembles a form of gate,
instead of using a separate hardware pin to access the EEPROM, the chip
encodes this selection in the I2C device address. However, the datasheet
does not explicitly mention anything about a "gate" or "mux," which is
why I've been careful to not label it as an I2C gate in the binding.

That said, I see it as a kind of implicit I2C mux (of type gate), where
the chip use the 0x57 address as in the example and to select the internal
EEPROM we just reset the b3 in the device select code.

Why This View Matters in my driver design:

Looking at the device from this perspective has helped me keep the driver
design cleaner while keeping the synchronization issue in mind:

1- Avoiding code duplication (such as rewriting parts of the at24 driver).
2- Ensuring concurrent access to EEPROM and control areas is properly
   handled and isolated.
3- Representing the dual-role nature of the chip more explicitly.

> What does "r" stand for?

The r in st,m24lr04e-r stands for RF, these are the RF-enabled variants
of the M24LR series, as specified by STMicroelectronics.

> Do not need '>' unless you need to preserve formatting.

I'll remove the | and > where formatting preservation is not needed.

> Don't repeat constraints in free form text. I already asked for this.

I'll avoid repeating constraints in free-form text.

> Where is the second address? It is supposed to be here.

>> +          #size-cells = <0>;
>> +
>> +          eeprom@53 {
>> +            compatible = "atmel,24c04";
>> +            reg = <0x53>;

Here is the second address is 0x53, to select the EEPROM 

I appreciate your feedback.

Best regards,
Abd-Alrhman Masalkhi
