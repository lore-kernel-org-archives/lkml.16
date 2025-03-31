Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD792211A0D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439127; cv=none; b=P58hKSZXgz3sMXoA5CQGwVsLQdI5qUJKWGAIFMi6K+JMPCElB7+CZ+JYOuC6JdqocQOEjb6bLeIlikIdIgtSxhq1PfLMV0rx+QAVnRCb3eWxFkr/01oJnY4zLo39Smeht720IN9i6C30kmxpWNFxZuqJ7LCuscEyd0f74kCLTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439127; c=relaxed/simple;
	bh=msHDyhQuwl0lyuk5ghM677h2CmEgt+ySvxiZKKREyPg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PlcUkbqvV8+idz4c4r4gQLOg7EMaGQ62itMWkYZVn56LGcvG1bedS1u2zJBzljs1FKI3hfgXV+G7sTN8St5315H0Q3oOnaG9zv+RFDsTGPxy7P/JxP+3jQrBdt16S+VS+LU25x2DHn0Jrux/GUHRxwATOswwlryqogmKulUI+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FNG4dzgH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNG4dzgH"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2840241e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439124; x=1744043924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYZVbCynk+ZVoNdV3LVYecJQ72VIONJ5XFTXiXMNDn4=;
        b=FNG4dzgHt2xxHHyHOZNu1h+B65ZO38dG3bXj9Ys6SPc4dMLyH4RnMfriOj3BtgxIBx
         PQxrCbPAnmROFAYjqkMU8bUWnkSEUGQIkOHD46xTvhqIxe0ImNDd4xVB7thE45VelbbO
         GINMRLWQK4etPKFw8e8f1es5YpwCyYCPv9hv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439124; x=1744043924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYZVbCynk+ZVoNdV3LVYecJQ72VIONJ5XFTXiXMNDn4=;
        b=Jbg/ALxaqVVUWEHYp8iemG2lBc8AJDxDlcsnwrjpY63oVNpcZVg6FivOKz1eM0XMdm
         kG2PbbAZeFKLqCB3mXarQaYbkJ7xmP3r8QP7wdj6GLB34aj5Hk83IZcdNNV0Q73YjFjK
         X8qjKau+U7fY2/mqJ+sVjBfOOdsKiQSSTt2ibZ1j+iPo7d2C1biyEVoDd78cssWTivCd
         UGjrDXSI3/qVCipQAhM+DmH8h+YuNxV2sDTb8UGhLZSR179dI+djGYueTW1BxnMBFuRk
         aZQ/ZK04QZobeiKrFFCLrw+3tmQrms33d+XirjLsUI6dHeIe5GUBGUfWxhyc6hkmab0q
         01yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC8xwGPIZdnjpdqrS3Dvy5O79P7eEzG5Uu5sLOEd2nlv+L7vwGzpGAcdDFPG/wqLrBMEPL8KK1FmkzERE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12B4fYesVREIgdJlcB/Y0vsCt4MU9rdRaYCNDNOCFn+FDbmER
	fUeTzYypc8Wkwfoi/bglkf2Q01myCJdBYrJVA+dhRm+mC/oK/YKfrTSlPb8uuw==
X-Gm-Gg: ASbGncsOZv2jUovtVxNOqZU0gMSVbOMo0YOm2x5h3sN62MH5Lhm85MF/ascZDxv/VC8
	lg3FaQy7M++9iyNzYTcHqZi6GV1NTba3EYRkdVwTdE8vUjE/AR6gSEh3QOYytr5NbAbZzderQrF
	y7ETGpMLl6bULtMe+/z70kJ6ZiaDVNVzAPLnq2gwdjiZhETJ/WoLlXf7PPO+mhLYJnCbCasKQr5
	YWMwX0gEb1wi5IyG0AbkeFHbv8AUiBanhMHNXsvNi3LpHMpbGR/ocDq5KC4xFk/KuvfKBtxTzp3
	DIfy2eFKtHef5aUoLl4IOa4BJGAhnzUvEXINK6Kuqc5uiCCv8wz6f4nD2hrQs9ytJN1adq+83ts
	rRuBP/AYwWnZv4QVcQOKlN/nQ
X-Google-Smtp-Source: AGHT+IG1r79q5xr7a/3BgTP+KtzgOsT7WxeTIDLFGXSCqIMLUKbuoKzIZY1SaNKhCamPJwufuwmDmQ==
X-Received: by 2002:a05:6512:a95:b0:549:8cbb:5441 with SMTP id 2adb3069b0e04-54b10dc7c04mr2716480e87.15.1743439123919;
        Mon, 31 Mar 2025 09:38:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: Fix gcc8 warnings
Date: Mon, 31 Mar 2025 16:38:41 +0000
Message-Id: <20250331-v614-v1-0-9bc69a873720@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHF6mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY2ND3TIzQxNdCxML0xRjYwsjS2NTJaDSgqLUtMwKsDHRsbW1AL7UnAh
 WAAAA
X-Change-ID: 20250331-v614-8485d3382935
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Kernel 6.14 has increased its minimum gcc requirements. After bumping
the "ancient" test in media-ci 2 new warnings have been found. Let's try
to fix them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
      media: atomisp: Fix Wformat-truncation warning

 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c  | 5 +++--
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250331-v614-8485d3382935

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

