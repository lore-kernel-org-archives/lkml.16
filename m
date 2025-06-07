Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF41C5F2C;
	Sat,  7 Jun 2025 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288343; cv=none; b=EqHsFHVTsZ/VHVeteTuGTR9t5KmIPLcTi4FQ6PKJJ296CgT+qQUfAkv3+iSlGMcLC6JDK/ua8i0eUrYMobTcl5PK0nvw7UJiZXXUFqoGg2nKkX44gMLgotO32UDimaTwVQlfXcf3/NN9QiGKCCXdU3SN/eyixM/SDHEtSAVhtC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288343; c=relaxed/simple;
	bh=wMZdUT8ZYtgcy1PIxd8XI00/UrSPJ3L828tLjp3oGAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+3TsDzCkKMDV6b4ra1T+JpMB0S+w8yZ/pRdlpJUjbAY2/5jiDpclXGxKb3DfwTjT7ikcA/pKzGUNQgR1ui9xwY7Z5QmG7xIDtv28HxDReUd1bUEZOP+QPvmzFPzCRu6YrVy0RhZmZLUuwFkbq/4kRpauoUJHXRyGqw84IpVSpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhKME5wm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhKME5wm"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so2382604f8f.0;
        Sat, 07 Jun 2025 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749288340; x=1749893140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z+86mq9W/t3Q/qE4fezl2zhBtr7b7dF6dt3NaksCxI=;
        b=bhKME5wmIW4Ll6xRCAtGp6maiiupEyqky9OeE7XDEr5SXARTyEgb2kWB6Ir8fGpJP1
         JzHenwh+n+8GB6TaFVn54Tr7Rk9fUIus+gk0wBSm+c/7XPgNneChDo5KdKj0JaLJF3QC
         5Y8jO2hoTQDRbVTz+/Jfp+xM9irYtwWkHJCpS96+JA8oTQ4mFafXmMQJz9YWKrDAYOkF
         3iuU+zlCAfXIr9SF+xcYnHQd1fPY98zv/6CUSj9q9X62zPVDiRLvYaphaaQyILiT5SUw
         O6yCsNt6+BTNW+2F3mt4kJbYMCzyVVZWXFdXoOMjRSIrpyhAlUcCv7J0fizNykn5lLSd
         mUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288340; x=1749893140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+z+86mq9W/t3Q/qE4fezl2zhBtr7b7dF6dt3NaksCxI=;
        b=U9JRo4o8mH9M/bb4xDLYp9xgQJeNYBvhOx8q+2UAKujatF6Y29uti9TQd3BjX7Zsi4
         PWLqPIAl64Z5es4hn94xLZLoCpDE1Bwy+aDrn/fkO5v5A2K4zMl48WOFhEHN7WPBVWrG
         c9vrZ5Y3sgpn0gwE2tj/KKr97rrV8m9OEe4VMd3XNQ+nmojEMMURE7APUA5utAWJylhL
         iqowQGLvd0fXf4b5tnepXkaCf9JK9gW1O3vjNzQx0zs41d8E2ZWZ8UZeVepzmyOfhJpR
         yzlNcuWhJ/mU3CLJVPGYQSjEyMf34NeHREuMvBS5a4g0ITTVNQaNDHzFJGz50IxozLE4
         txog==
X-Forwarded-Encrypted: i=1; AJvYcCUaJgRSkmHKc4/miSM+jnoKxxVWktklHANlRmNlfQBOgzx902y2w6oexSS383gC4QdpoO7H9aOfeUEp@vger.kernel.org, AJvYcCW/uSRhS3I0bkngbYlB5Zg7jFlYOSfIN24dNikDOSSlej/jg7CYRb0cr63qu63r9acXJQbm9My3UZCqZdVy@vger.kernel.org
X-Gm-Message-State: AOJu0YwFx2AhK2cA94yiYldwlZ/x9AFAgAdSYfhHXXcwU5I+9SRA4oIM
	OzMtOS1zFBq2UmhxIkWRJV9y68gyBoEttoVXuN5HGXeZRMm9pJs30pS3
X-Gm-Gg: ASbGnctSRYmOyh8bYHrUOmgbzIQ3kkQdWran/lDKrb9q45ygQQtsynxQKE6709GFpCc
	48DVzWMNbWEwK8ezA4o0c+O3wEIbWuQC1K/hm68f4KARU+G0ZgQ97ThR/hXHCjI5RSuD/j9fBVE
	XKbXNDBRssfE++A3yHJTqiIlILa3BA/OAygNo87F/EvZW+QJdnavHHiaB+s/FqcmqlnEY0RtDYm
	YuuTiMRNyzwm2WzxnhcxLkYWOYAZzeH8tgwgfHN+WnTvC0HKWkZk60MgQ3b1Kei8Xb58NY0+kNp
	SIZwBC2hiob/Dm/UL/zsohThRUYa+4T5J5Z1/0HBNqyW9XI4QJPwfTtavrzaefEE8Mwu1fQkB8t
	b+Iowe9eguYTygA==
X-Google-Smtp-Source: AGHT+IH+BhmBoFInA8dQPTfWml7u5S+vkK/CgoVMIu8oqjObrsbfhuYhbDsFfis6vTozvFnWM6zNuQ==
X-Received: by 2002:a05:6000:4284:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3a5318a0156mr5245689f8f.17.1749288340123;
        Sat, 07 Jun 2025 02:25:40 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ab413sm4114778f8f.23.2025.06.07.02.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:25:39 -0700 (PDT)
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
Date: Sat,  7 Jun 2025 09:25:37 +0000
Message-ID: <20250607092537.3141131-1-abd.masalkhi@gmail.com>
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
