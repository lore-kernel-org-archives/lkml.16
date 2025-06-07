Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F011F460B;
	Sat,  7 Jun 2025 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287886; cv=none; b=AJHgU9thsb6WsLtAAxZ5NWJeT6VX06Ceyq8SZeFYwDksyFtMC9sd9FRgQ0VT9S8jObbThALmzxt0LLgXwdR5QxdxNLmSQ9u0ys+u25ypsbL5NqQK4vI9hswpoQJwDSJU3n2HEwXt51URi02rDU5qBXJUr9XXythG94E0Wb/BDFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287886; c=relaxed/simple;
	bh=wMZdUT8ZYtgcy1PIxd8XI00/UrSPJ3L828tLjp3oGAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKSzrmmiGfSHCPswZIxwHprvRLicg8IXOfzuz5XCSR3FjhxI+YCDB9hmo74k79CpZfwrWW6VWPt3CHese4c83spHTddzfJSX9/cmd67EnXmwGHJoKWaQCJKLZjcHnypvoy9AlmgwL+tU8Xjm8VaysC+DWz42ed/W4JYu+A7cyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvbzboM1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvbzboM1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso26120755e9.2;
        Sat, 07 Jun 2025 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749287883; x=1749892683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z+86mq9W/t3Q/qE4fezl2zhBtr7b7dF6dt3NaksCxI=;
        b=RvbzboM1Oe40ZAG6lJE+fTYLyBABVk4M3UsdW5e7eZyJRpDMX/Qnj2J5L8bzplDbtG
         /0LYW3CNj175jFrqscw6DZMK/1aH2smhlMCuH2QXokNHpvYvabtfVTxrla1+En6y9yH9
         bNkD2I9uzICRsT9V/TT8KgwWbEmciMa8I9a4zE8Q5gv7o5uUepMfUqUni2YURJ82cPn0
         zSBjkbEJ70FCl7UAI+UsejcO3G7VL5M3GdBXHvkwf2YBF+KUiZrMfHLH4W3riVLiLg0Z
         43WvYV51lPgeLJuMa+g3dTOJkswIEYdtb5CsCQgrxGn8MpBG4VJr7rTS7+w5O48d8jk4
         jFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287883; x=1749892683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+z+86mq9W/t3Q/qE4fezl2zhBtr7b7dF6dt3NaksCxI=;
        b=Y1N9Q4y5Wm48NbtN4PXxjqLUqNY23GKLEvegQmvu6unm4O0Ph5GJgPOZAVsfsf9d8K
         LkhZ821DS68RYbsdac/JXprmmMN35WHW9HMW55X27MVc6NRw6OREFjjKs0cd/qxnzRa7
         7GjqBnz50+npHmnq39zlh9Crim+fD4cw/YZtjN1UNtJLSv8Ynnll3N3VRP2vj3B4wsu3
         OKdc1eXRPEhqHSVEaTRYo34dRZzliQBJBrJzBMCkJO426gPAoVyxhbIBokGJNpWO1S7S
         n2ugXEkqCK3okePXJFrQC2qIA4bNGUw8/tAojo5x9N3IdL8yWEtQrAP6kEjkPDSXewCx
         OydQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8GivLXlhLVAsCi+HaeYNuoV1+KT6lr/GJkJyQLES/byZ9J2UVPtlNN7ti1gBSfxawEEig+WbKHxaS@vger.kernel.org, AJvYcCVsDgZCSQhM1iGG10QK0195PnczgZ039vJqutACBRBPdMGi8hswvxdnqqT+uSAFM6+U59M1cUoU3yKKSMaq@vger.kernel.org
X-Gm-Message-State: AOJu0YwbP5KkNXTT6rmVJw1FJWCRrTWGfXew6xOhj3i/hsGLMFz66hre
	/Kjh86Ap6gOffdKQza3mGfqZZgXH607RNaDZiLSywqzUfheuq0k8GftR
X-Gm-Gg: ASbGncucuPKc7n2LJ++67QIK+PJlGWstmSrJpPT0hGFW1Y826eOQCHW4QaALNEdoOuO
	YMiS1B+wjkgeLvHYlmGIjEpVByw+y3OQQceYO/wV1usRhSC1rnc9JnNjesXaYJMy8gJwBoE3xSZ
	Rf26APZWii9ivGPUUYlSrwnlBSJovHCCFwOis1TMhRAKQhcxkSU3WqpR7iO8FSrzr5XGqKcOAX6
	que2+ZZsEBpYkKn/J1ldYnYXWtp+wQLZZmwlJbmxX28Hp460Cud0VsfQw5t1Fk7EUmJN4skd49j
	yc0jUgFntQaoUwpThbaq2i+yP7BfF2VXw8/FL87jSe05OLt3LWjITRoabLAt/+87SqKWgbKN0ht
	KYB5lOq5HHGSKGKfQlbFi96SF
X-Google-Smtp-Source: AGHT+IGSSDyno5+LLa6iMjr85H7YTZbix2rKE1HY2x7hET3A1yKkEVLFHEr2UQcYJDmW+pxsYJMX+w==
X-Received: by 2002:a05:600c:3f1b:b0:450:d01e:78e1 with SMTP id 5b1f17b1804b1-452013570aamr70284215e9.9.1749287883101;
        Sat, 07 Jun 2025 02:18:03 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8f12e16sm51251135e9.1.2025.06.07.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:18:02 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Sat,  7 Jun 2025 09:18:01 +0000
Message-ID: <20250607091801.3141110-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025060618-errant-audible-4c52@gregkh>
References: <2025060618-errant-audible-4c52@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

> > >> +What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/sss<N>
> > >> +Date:           2025-05-31
> > >> +KernelVersion:  6.16
> > >> +Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> > >> +Description:
> > >> +                Read/write attribute representing the Sector Security Status
> > >> +                (SSS) byte for EEPROM sector <N> in the M24LR chips. Each sector
> > >> +                has one SSS byte, which defines I2c and RF access control via a
> > >> +                combination of protection and password settings.
> > >> +                Format:
> > >> +                  - Read: returns a 8-bit hexadecimal value followed by a
> > >> +                          newline
> > >> +                  - Write: requires exactly one or two hexadecimal digits
> > >> +                      - No "0x" prefix, whitespace, or trailing newline
> > >> +                      - Case-insensitive
> > >> +
> > >> +                Notes:
> > >> +                  - Refer to the M24LR chip datasheet for full bit definitions
> > >> +                    and usage
> > >> +                  - Write access requires prior password authentication in I2C
> > >> +                    mode
> > >
> > > How "deep" does this sysfs tree get here?  This feels like the wrong api
> > > for read/write to the device, just do it with a single binary file if
> > > you really want a "passthrough" way to get to the hardware.
> > 
> > The depth of the sysfs tree depends on the M24LR variant. For example,
> > the M24LR04E-R has 4 sectors, resulting in 4 entries: sss0 through sss3.
> > 
> > I understand the concern about exposing multiple sysfs entries. The
> > reason for this design is that each sector has its own SSS byte, and
> > separating them helps reflect the per-sector nature of the access
> > control. That said, I'm open to refactoring this to expose the SSS
> > area via a single binary file if that's more in line with expected
> > kernel interfaces.
> 
> Who and what is going to be talking to this device through this
> interface?  Is this unique and special to ONLY this one chip/device or
> does it fit in with all other types of this device (i.e. eeproms)?  You
> can't create a userspace api without actually having a user at all, so
> if there is no userspace code using this, why even have this?

A userspace application specific to the M24LR series is intended to
interface with this driver. The M24LR devices support dual access
to the EEPROM: via I2C and over RFID. The purpose of exposing the
Sector Security Status (SSS) registers to userspace is to provide
dynamic control over when and how the EEPROM is accessible to an
RFID reader. This allows userspace to decide whether to permit or
deny EEPROM reads/writes via RFID, or to configure protection for
specific memory sectors.

The SSS registers define per-sector read/write permissions and
password protection, directly determining how external RFID readers
interact with the tag. By exposing this configuration through sysfs,
userspace software can modify RFID access behavior at runtime for
example, to enable secure provisioning workflows, implement time-based
access, or prevent unauthorized access after setup.

Given that this is a per-sector control mechanism unique to the M24LR
series, would exposing the entire SSS region via a single binary sysfs
file be considered more appropriate than individual attributes per sector?

Best regards,
Abd-Alrhman Masalkhi
