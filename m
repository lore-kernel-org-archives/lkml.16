Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E58A81724;
	Sat, 29 Mar 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233578; cv=none; b=oEjHXiM1JTLTHC188AYmt2i8fNoeLSyS9sqK5qBWuSD+h5hPucEa2MSZwn/U5yNBxBtJ6Sm0mMg/t+ipDmGls9b1jcEyMxfdmihIG/r9x4aZXrXjafT4HTxtUicrmi3NU/dfiWjY1ueh72Wa7WsEXZccsaXxDjweFJr05qaJCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233578; c=relaxed/simple;
	bh=z1bOkfXAShDyko0UIr3HeDgqWPJ8RvzphrSe6vO7ON8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P7AJxFaqG7D6LVztJmuYzNd6hsBAm1NYYOX3AvBLo6V74c5ePVyZEPgZqLIKmDOYi9MT/7LskG/VQsBl8oxUxbcHnihRIvDjTCMoxlFAZJBlQr/sGbEdz1H2sydttDBLYVec+xqvENm7SpWo0G2OwgcPRQ2RORYuGT1lgOX4A4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEkH2gim; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEkH2gim"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22928d629faso23333445ad.3;
        Sat, 29 Mar 2025 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233577; x=1743838377; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/rK5ct4+5F9tZF2xsKCOk+hUi3QrDwNnhqFvRjvb+7U=;
        b=DEkH2gimy3jMIOC98KDC0USgvqQREgyygK5SOdaT539wAEskrGzjt7aLY/80eEk25E
         /E3pUqqhB3evikHXptZuG+uQoO0rUdjO12BPV8zNqhU7CDYrFQBU5OIDf9gF1vRPv6nk
         /94WxGwHQhDhXPFZiSK0Q0VBPDHbG10kyZ0nPkqiZNJ8WQgi7T0j1T1ew4MUDKUwVYCg
         My7jO1cmHPKaYLW6dKXJLodCWIfzPEXttxUWtkD8VCR8EqA7YLno8VAQWCU4p+UrOlRv
         LflnblmVNRAi6njGrN4udPPQaTvsPT1OwaUWebAjnTiLqDsdKRTsiNFBgT31ySWyV0kj
         dG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233577; x=1743838377;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rK5ct4+5F9tZF2xsKCOk+hUi3QrDwNnhqFvRjvb+7U=;
        b=TX76ZG83DbnTXr6uoHaTX65+hcg23rJTAax2CazwJTyI/E1jNCEPCrbzIEPkx1nQR2
         hu6C3jetgSZL4nlG93gSSatpcBkocoIfF5dq5UmUXpaHNwHaAF4TsyTbZLLx9L/RE97j
         P1aMQfQZPo3+0+KZkIQsV/BnCDpUMpWRAGafT0p4ztampWc53J4nPdNoPh/soeSF6sbG
         Rx1bVCjHALMKHO3WiS8pTwBZtvg0xdI1ANP6kTX2VnfnYCreire7/7ituIzC/gBspVF3
         s3BG+ygLyypbtjm0xFkkIZCFLxPEN+NUxbLm7aabj3e3P6Alp+x9/lrrIivYyvciJrwe
         ubZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYnt2j7DB74VUkYv/KKvk+zdg6xGqsKEfcFOdD8U0juh6EsYL8bZruAwIMLagZ1sDs993+sKRorU0GMoqg@vger.kernel.org, AJvYcCUf9bMKo0QG5JRHjsBbmNNW8BmBZxmCDP4pDdqrr3luzQXnQ7eXpsMmz/CI1FyMMS1L7cS9CkDyqsV6gg==@vger.kernel.org, AJvYcCXHVSpcVpkqzyDqFfY7L2Qz2zC2hqBmBgOFfaf5HvhNMGkulhfuW8m5N4fZl5L8HXK0ZhYzfOGGGb39BkOtHeOb6IslVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37DoJ1tL4LX0cvVe+v5W81qnJMKvhzCrPUkYUJhumqjo4w7pV
	JKA53yD07tgtJ1wF9zQvrlWkgM7gTutxkFWrU52Ek5phE1TAdERC
X-Gm-Gg: ASbGncsA5yoG6HwFamq41e07J66CO4G9OOypPZARwmM1gIlRBMRmL7F2BdJCftCoBEl
	s47fCpZw2pmzqFeaMqccALJfi2tfXre8uqzClNOKZ3VxmGHHE3LaepZyFheWdUs0zMk/cVM3RCv
	t0aLNrdUXLSk8qal+MXF3ckz7gU/s/tU+3c9Ejl0LM7usKN9Da2/dD9sY/SiV0Ioxs1i1bjlT53
	r5tQW0N+q4Gka9qj4pVoI2B1ln/BuigkylH6ihvFv6DjliIiSxy7WdK9hNqZlT9Cnv8M1+yzn7g
	fzPhFUZFcCGU3dLFoMI7ZYT9YmOhMU3PBwSqmm2QZs60
X-Google-Smtp-Source: AGHT+IGZxXgs2TQMyJRsVCC8t7DymYTggjads6xo/8e4v7rGKxtS0CyoZKwvsP5yqj3DeWOmEMXSpw==
X-Received: by 2002:a17:903:32c9:b0:224:2715:bf44 with SMTP id d9443c01a7336-2292f962077mr32413815ad.19.1743233576427;
        Sat, 29 Mar 2025 00:32:56 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:32:56 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v7 00/12] platform/x86: alienware-wmi-wmax: HWMON support +
 DebugFS + Improvements
Date: Sat, 29 Mar 2025 04:32:17 -0300
Message-Id: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGi52cC/13QwW6DMAwG4Fepcm6qxME47LT3mHoI4JRopUyB0
 k0V795QDs16yOGX8v22fBcjx8Cj+NjdReQ5jGG4pED7nWg6dzmxDG3KAhSgMgpld+ulp7qtdKW
 gRhLp509kH36fLV/HlH0cejl1kd3LAiCkp9QBDBqUWn5fr3GqP0+9C+dDM/RrUxfGaYh/z3Vms
 /b9nzwbqaSpkMnpQhFDxtfJc5Ebu5kiGeedNgVYsB7fDWZGw2YwmZZrjd5bb5ry3ZS5MZspk9G
 UbuLJUkuUm2VZHixQ4j1sAQAA
X-Change-ID: 20250305-hwm-f7bd91902b57
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailer: b4 0.14.2

Hi all,

This set mainly adds hwmon and manual fan control support (patches 7-8)
to the alienware-wmi driver, after some improvements.

Thank you for your feedback :)

---
Changes in v7:

[01/12]
  - Mention WMAX_OPERATION_* -> AWCC_OP_* in commit message

[02/12]
  - Reorder the thermal defines as Ilpo suggested
  - Use FIELD_GET in awcc_platform_profile_get in this patch instead of
    [03/12]
  - Reword commit message, including title, to be more coherent with the
    changes

[03/12]
  - Drop inline attributes
  - drop __ prefix from awcc_wmi_command()
  - Add @ to kernel-doc variable reference

[05/12]
  - Reword commit message to better describe changes

[08/12]
  - Fix typo: aproximate -> approximate

[09/12]
  - Replace ARRAY_SIZE() with sizeof() when naming the debugfs directory

[11/12]
  - Fix typo: repurpused -> repurposed
  - Drop uses of "We"

Link to v6: https://lore.kernel.org/r/20250313-hwm-v6-0-17b57f787d77@gmail.com

---
Kurt Borja (12):
      platform/x86: alienware-wmi-wmax: Rename thermal related symbols
      platform/x86: alienware-wmi-wmax: Improve ID processing
      platform/x86: alienware-wmi-wmax: Improve internal AWCC API
      platform/x86: alienware-wmi-wmax: Modify supported_thermal_profiles[]
      platform/x86: alienware-wmi-wmax: Improve platform profile probe
      platform/x86: alienware-wmi-wmax: Add support for the "custom" thermal profile
      platform/x86: alienware-wmi-wmax: Add HWMON support
      platform/x86: alienware-wmi-wmax: Add support for manual fan control
      platform/x86: alienware-wmi-wmax: Add a DebugFS interface
      Documentation: wmi: Improve and update alienware-wmi documentation
      Documentation: admin-guide: laptops: Add documentation for alienware-wmi
      Documentation: ABI: Add sysfs platform and debugfs ABI documentation for alienware-wmi

 Documentation/ABI/testing/debugfs-alienware-wmi    |   44 +
 .../ABI/testing/sysfs-platform-alienware-wmi       |   14 +
 .../admin-guide/laptops/alienware-wmi.rst          |  127 +++
 Documentation/admin-guide/laptops/index.rst        |    1 +
 Documentation/wmi/devices/alienware-wmi.rst        |  383 +++-----
 MAINTAINERS                                        |    3 +
 drivers/platform/x86/dell/Kconfig                  |    1 +
 drivers/platform/x86/dell/alienware-wmi-wmax.c     | 1034 +++++++++++++++++---
 8 files changed, 1195 insertions(+), 412 deletions(-)
---
base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
change-id: 20250305-hwm-f7bd91902b57

Best regards,
-- 
 ~ Kurt

