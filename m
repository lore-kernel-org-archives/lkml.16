Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DE17B418
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082497; cv=none; b=guW+yRo6igRRk6O3hTbQZef0xTFQWoE7DovHHx1Z9uiR7EMX3skcUIjnvuGCFIQOgzE25z3b2rMlAW3ajHVp6VvXg/DRS+uhzGmSdd4gMxtDIw9DKc/whKsqN9fJrhKhoUdnB3puZdgeatsRPonJH3i7/uIuxVIe6CtrikwqKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082497; c=relaxed/simple;
	bh=Gtx6sUxQErhezdQ0ZBdohRBHe8yymdzZfpR6qSMLmQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I89ZQAtXlwfyRzQvkr60L9rGRsWwaMn9+plzvfq1WrS8Z9PjnDzqapvHIv1nMwjYpEhZBkAGi0sjtOUlOiFWO14C+IELk7X6rHjigi75HcA11c4dx5kx/FfT04wyLkNCE4LvhFCiPJtq5bh/BhsRfa9OJiIej9U9hX38HQJqXoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZKUsjo0A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZKUsjo0A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso38085435e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750082493; x=1750687293; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEPSwYHUllcVF4aRV6d13dYuoz2IZroq08Q5FVCs2wY=;
        b=ZKUsjo0AbIym8bWstAKMVxv177J4F4J5TzeDu8q809gP5o8u5A+oXS0BecTdVdaFcM
         kradU+hLK5vqNqhKAxTHZ0Xb0GYUUmPWZMDlj/vns0ghfJR6HrYv8vSe7wJw3BfJAJ+e
         W6F/u2/UYOmD+U0N7ogHpBrXhfqOTCyJ9nD4eGW0xzCAAJovi/2Dpxcq0H/tS52Rse42
         HX1WVjsiJ1ZVEMh3aX2cZOTOnAaDjT7gMdnpW/sdqGRF/FHLlU2CiZoMYsHqwD2YL510
         OLQSA55Cd/aUEbNZiddTPpu8MdiyLKRYF/bJ/4c+WRdqCBd17g3dyE+Xl4cFYCx/O2iE
         RpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082493; x=1750687293;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEPSwYHUllcVF4aRV6d13dYuoz2IZroq08Q5FVCs2wY=;
        b=nnv/6TerWKEIXSCGCmZ/aZe0JWWNuASoQ2aj1Op4TUWlPVv1PnC4J4ULceaoNtsQmX
         dxoDVZv8+aRiITUdWPu5pYVpcKU4now2FPB7wXSdlg4fZlJeG9gIZxEWbp2AVixPDMo2
         gnj7YR7aj6dk3opZOVaotxnPwLZgp0FDtCqxtl8OyhzUN7/l579lM5whAKlBrMRVHZ0g
         CqbhPsaaW2jBE8tadngBbm0dNIGntQWlqm0pLu/AB1uuyMf1hBoZdClsoxH5nlsPt0NS
         W8Eldhy4gR8EsQjPF47ZrCocrM0R3S8SXspqVaG2tCb8C0EokOP+nzNuOY84FDPmYBM/
         s1zA==
X-Gm-Message-State: AOJu0YwuiQDBt6VJeW3vynOK2iTea+abEUlAehXp89xeYZ/I1k1UtUZC
	/1fZbXmkxi3o0w8l4Is1T79plmiqN+jYrEOd8RiaOHMAqdw1KRKBZ8NuEeHsQ7/Xlw==
X-Gm-Gg: ASbGnctMqgm40Tkv/UqMCHRZ+ETLeVyR4A9Wgs80/ElFOPHkXuS40RT8SWKO2JNifhh
	yNG8IBMiFQg7JTm2/o+ONGyMCLD3aGH15u6FP5myKetWbrnYcELYUn1+dmpKq6mqRiJ9dM7hJ/D
	QbewaYY9MrvSvrkT2QnIkVk9QSpFqDScUrHdutD3rRsQlQ4W0oaJ1UXwvv2js+Wbkb2Py5gVJU/
	BChxSI7A3rnGvBEGMsvhAHLWm7uxl6KOiygJ/QmEgIb2UhkjIg/dHHLgh+d57IUiTXcJFU5ZQDP
	ft60qhrIMd2zAQ0aMVF7xPw+1HRWOAqgPt5QLV7h5zcJ84i0IPAgLdkI3HflaZi4X34M9bP5sq6
	8z9P41jriYBVHShIYuCDPN5I/Cp0hSgoA593tLEstoV+iVA==
X-Google-Smtp-Source: AGHT+IGHQyOwAUqFexF8zEmL4xFPsfu+VrWSUnxlqdmY15C170Uug2RcV1kxtPgOG+gygg4D+hT0ZA==
X-Received: by 2002:a05:600c:1e1d:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4533ca6ace2mr95735965e9.13.1750082491142;
        Mon, 16 Jun 2025 07:01:31 -0700 (PDT)
Received: from [10.93.128.132] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm11057004f8f.40.2025.06.16.07.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:30 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Subject: [PATCH v2 0/3] firmware: coreboot: Support for System Management
 Interrupt (SMI) handling in coreboot payload (MM payload concept)
Date: Mon, 16 Jun 2025 16:01:11 +0200
Message-Id: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcjUGgC/x3NQQ6DIBCF4auYWReiSLV21Xs0XQCOSgKOGYhpY
 7x7ictv8f53QEL2mOBZHcC4++RpLVC3Ctxi1hmFH4tB1eped00rHDFaoiw28wtkRhGj6DqtrNV
 KPbSBstwYJ/+9qu9P8cQURV4YzdVytCPLptdD3+p60HL2WUZf/oKciYNJrwEDRlxzko4inOcf9
 JM//6gAAAA=
X-Change-ID: 20250613-coreboot-payload-mm-6642bb42284a
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Marcello Sylvester Bauer <marcello.bauer@9elements.com>, 
 Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.14.2

Hi,

This patchset adds support for MM payload when Linux is used as
coreboot's payload. The main idea is to delegate higher-level SMM
functions to the payload, limiting the coreboot's System Management
Mode (SMM) related responsibilities to the minimum of basic SMM setup [1]. This is
done by loading a blob with SMI handler to the shared buffer, from
which it is copied to SMRAM [2].

The MM payload is still in a Proof of Concept stage, and we are still
working on getting the patches needed for coreboot upstreamed, but I would
appreciate any feedback that you may have.

Thanks,
Michal

[1]: https://github.com/9elements/LinuxBootSMM/wiki/Proposed-design#current-design-approach---mm-payload
[2]: https://github.com/9elements/LinuxBootSMM/wiki/Proof-of-Concept-(PoC)

Changes in v2:
- merged mm_info into mm_loader
- removed mm_loader_exit in favour of allocating memory with devm_*()
- added forgotten "\n\t" in trigger_smi()
- added gitignore in mm_handler/
- added COREBOOT_PAYLOAD_MM dependency on x86
- error handling for mm_info struct
- error handling for shared_buffer
- removed whitespace changes in coreboot_table.h
- removed INFO level prints 

---
Michal Gorlas (3):
      firmware: coreboot: support for parsing SMM related  informations from coreboot tables
      firmware: coreboot: loader for Linux-owned SMI handler
      firmware: coreboot: Linux-owned SMI handler to be loaded by coreboot

 drivers/firmware/google/Kconfig                  |  12 +
 drivers/firmware/google/Makefile                 |  11 +
 drivers/firmware/google/coreboot_table.h         |  11 +
 drivers/firmware/google/mm_blob.S                |  20 +
 drivers/firmware/google/mm_handler/.gitignore    |   4 +
 drivers/firmware/google/mm_handler/Makefile      |  51 +++
 drivers/firmware/google/mm_handler/handler.lds.S |  46 ++
 drivers/firmware/google/mm_handler/mm_handler.S  | 510 +++++++++++++++++++++++
 drivers/firmware/google/mm_handler/mm_handler.h  |  21 +
 drivers/firmware/google/mm_handler/mm_header.S   |  19 +
 drivers/firmware/google/mm_loader.c              | 215 ++++++++++
 drivers/firmware/google/mm_payload.h             |  58 +++
 12 files changed, 978 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250613-coreboot-payload-mm-6642bb42284a

Best regards,
-- 
Michal Gorlas <michal.gorlas@9elements.com>

