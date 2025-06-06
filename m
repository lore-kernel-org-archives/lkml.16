Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387FB45945;
	Fri,  6 Jun 2025 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749221222; cv=none; b=DxMOhanXqlor67beLQ1XPqkSfaGNCksZvFFUVkXUu2V5T90udqF9LYxM3aOQrAdc5i7pnWL0k07MjXWyzXToiFiJJfC9JQ/8VhMz29jwqYw5VSxbI152yDOdgsAyKls5uf2FaOd0Gh5R/nc8fvyNoQBsFuyniMPXlcreSTd0O8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749221222; c=relaxed/simple;
	bh=SpqQZtxYSGSrQiPzmi2CGEM5uyDqqyc0FKFBMT4zdfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldX5Vi1w4+LDCd/LsaRfiTxSimftltO+GOFxBkTSyYO/Fo6CWU0BHQvyVO6RkeiuyJBpEmWiJjWQE2DJVAjaqYxdOfTXVcy2ydm9RwJyQTKylIpbiGw+zmrYu8SItBJagubC7ogwHvRTkrZym0Mmqb2KbhrhzFjy154haibFLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drIWyQ+q; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drIWyQ+q"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso2019907f8f.1;
        Fri, 06 Jun 2025 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221219; x=1749826019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWfDD2dEf8PJavEnPu/pXfDOZiD1JAykowbebqUXmnI=;
        b=drIWyQ+qfMrcbT2jpbjZO8bGumzFqhglxawBfTIDHgRuJ7+ak2cgCNFTDBtGwrQghm
         deTGAYjWJNjsDI09jXiUudh6PIGPgRFu3+CQCn0K80ByIWSnZOA8D/39hzA/F3Hk3Ryz
         3PL8Zz6BknarIXxkWR8mvqTEfA7m5nO35lSKH+qESTzXDCNzqfpkL0LoeYB60Qr6ZNtn
         9GKtzdRlgepRhi5IJp20QPuS5JFhgye5GDyADc2h3jsMvfwVQw+wRTB8EjXr8tQsMVVk
         I1qy2mXGmkDU5lTlgXij/8OfEIMKYmTaxBj/2P0lSZNPgJdBfZus8q0U/IbUTQ8T4XaQ
         oyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221219; x=1749826019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWfDD2dEf8PJavEnPu/pXfDOZiD1JAykowbebqUXmnI=;
        b=oBNMTKSX0njyCMigQNSynZyfqiIEIwKTyW3BcuzUMamu6ZhU72zNBOUzRKDJX7yjtb
         i2ny2hYwEgm5UgGn4G7Xvra9fHhOgQgcrYfXK0tFShNzk33s9PVeUyGNrSqWZLg8qepO
         A6ksuS4p5MqBNKxDYODIJXvcojc9moXsIsQZE4gNsoBP+WRhRsIG0twseSIYhAmS9N/Q
         Wcx6QRti7F0OhNoMEGW6jGjLUA4XQj0TrKGa0MFP4JbYsO3Te/qwLhsWAXBuvQqabqvE
         HMSXGfSBASsOEBjvC/Qx64942D7KszZNBVOounK5sYtR1iR0Rl9D0QfA7l6dK8pVfSlr
         iRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWepWLoMLqx0D0siRzww467PIQ6zTn1EDpnVx+aqBHuCTpAj+yIJWok7kEI8UY1DE03t+qfcHzbaD+7@vger.kernel.org, AJvYcCWkgmGkaIsCqFvVpYpbqJMFsz9oCAO3RcJCy2D8Tu3CZaLbyuXJDJVohNexwSvpsSYCGT/rtUWJgJd3lM45@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcCvskdTmLZde0LifriPXnsfLXn00e7siunJlQp5hil6f97s1
	ebK4TNhnbDw3zG8B/tXpjl5tBSRU4YUh0jCqJ/j6XBUOwqfoDB3rq5ZM
X-Gm-Gg: ASbGncuX0OHv5KKhS+PdqUhopy3OQaAn6ANN4kbJiaABmrCKJJEo6Zc6YjCmKPxB8QH
	Fv/GauRM+cZdLLs+LzhasgMOAyIijrpMwJFcyvzWWfy42s25n7oN05tjLm0Jq6HAaZ0nGIcI4zp
	cv56NIItSkK94oSGbR5T/n7hzniIrt6MbEKrM3DHPPUrdlEIEOTWBEPNZrT/FBp0PnLJ14BaDIG
	uoaYaBYchqeaYMI+iqMjI2TWAI8tkWERPsUnoab+2iCqZ5kvGoQ0oHN0XPYrGfGvAjlAgkZWH+K
	FzhdsBg6NUQJyESUEEkGnMZMH4OprU4unQ3EF8Du0L/dUsllZbn7ZAl5ZppVk8jyKjt0FPpiXhm
	1ygr/ESrkoklw37WF4wJsOYGerBf+h8872ac=
X-Google-Smtp-Source: AGHT+IHFZfm7/jlQzgkdQ83hBRHRmGcLyOvphH61w+zpaQfg9JXlMcucPHHvwrU97yp0xV68gJM/VA==
X-Received: by 2002:a5d:588f:0:b0:3a4:eeb5:21cb with SMTP id ffacd0b85a97d-3a53189ec50mr3200568f8f.26.1749221219172;
        Fri, 06 Jun 2025 07:46:59 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b653dsm2098932f8f.39.2025.06.06.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:46:58 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM and control interface
Date: Fri,  6 Jun 2025 14:46:57 +0000
Message-ID: <20250606144657.3140262-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025060632-luridness-carpool-bf90@gregkh>
References: <2025060632-luridness-carpool-bf90@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi greg,

Thanks for the feedback.

>> +                Behavior:
>> +                  - If the password matches the internal stored value,
>> +                    access to protected memory/configuration is granted
>> +                  - If the password does not match the internally stored value,
>> +                    it will fail silently
>
> Why is the kernel in the business of adding passwords to devices?  That
> feels wrong, and a way to just flood the device with a "try all the
> values" attempt if needed.

You're absolutely right, implementing password-based access in kernel
space isn't ideal. However, this behavior is defined by the hardware
itself. The M24LR chips require the user to "unlock" the device by writing
a password before certain registers become writable (such as the Sector
Security Status registors) and unfortunately, the chip does not provide
any status or feedback to indicate whether the unlock was successful,
which limits what the driver can safely report or validate.

>> +What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/sss<N>
>> +Date:           2025-05-31
>> +KernelVersion:  6.16
>> +Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
>> +Description:
>> +                Read/write attribute representing the Sector Security Status
>> +                (SSS) byte for EEPROM sector <N> in the M24LR chips. Each sector
>> +                has one SSS byte, which defines I2c and RF access control via a
>> +                combination of protection and password settings.
>> +                Format:
>> +                  - Read: returns a 8-bit hexadecimal value followed by a
>> +                          newline
>> +                  - Write: requires exactly one or two hexadecimal digits
>> +                      - No "0x" prefix, whitespace, or trailing newline
>> +                      - Case-insensitive
>> +
>> +                Notes:
>> +                  - Refer to the M24LR chip datasheet for full bit definitions
>> +                    and usage
>> +                  - Write access requires prior password authentication in I2C
>> +                    mode
>
> How "deep" does this sysfs tree get here?  This feels like the wrong api
> for read/write to the device, just do it with a single binary file if
> you really want a "passthrough" way to get to the hardware.

The depth of the sysfs tree depends on the M24LR variant. For example,
the M24LR04E-R has 4 sectors, resulting in 4 entries: sss0 through sss3.

I understand the concern about exposing multiple sysfs entries. The
reason for this design is that each sector has its own SSS byte, and
separating them helps reflect the per-sector nature of the access
control. That said, I'm open to refactoring this to expose the SSS
area via a single binary file if that's more in line with expected
kernel interfaces.

Best regards,
Abd-Alrhman Masalkhi
