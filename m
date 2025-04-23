Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290226A092;
	Wed, 23 Apr 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394613; cv=none; b=e2YLN1b+nyeO4k1n61pMyz3P/vi7YdKnQucVKEg5VX+C6NmKZ3isIve0h/bYvKGZRhzba0gffdA7nwScBtvFkj+ZNVw7AuaavUMZKFkJ+Jn+UWOaJUUKt26UGyGHczyGd3b/fvs4ahbmBtl5lNnaxFVv32c2MMVC0tp0pYchzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394613; c=relaxed/simple;
	bh=aeqdj/wdcz+x26fwzx/HX+zznG9Z+guBS6p9E5Hi9mM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=djE65v9pfRjyd+Y05uy5SHx03cS+u2bLQ11dMZBnZGKBWZw42ms4sIOyoYCiJ2J5ZuTQ/2aHrYVR0r13IMMxlZf3PgLGaD+JrM3hLvAnn2ohrBDCy0MULuXuy/La3OjdAo9+oP4azY4bhoikOF6djI1qv4ULSoCvbk5M5r+08DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsotPfbB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsotPfbB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so94624955ad.0;
        Wed, 23 Apr 2025 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745394611; x=1745999411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3HKmvn7msuvgVm/2Zx8cHDv5Bn16on0KtIYGyc45jPg=;
        b=DsotPfbBBQ+s+dCiEaBQ5Qrw5ZfA4GRrGUfDmqA7HgrikG0YrlP0taXvAon7vHfbAT
         b7KUH0oURiUuWAEO9/LsXFa1/8tsWmiOreN0ryJCVVCpFzxBswTvnixxnrL6H2pqEGkg
         xHIMAIPn7XzheJ4EeGue/+7QN6GYQBElzd5vZBWZd7/cJhbK74XA3cEpVheO0EnzsRQi
         qqPLr0Hm3mGGsjMHOEaQXb4tMpvclRvlxYd3PpW1Y2avyWWn7jOinwRimv3WlzhcbInh
         wLAdC84VOqLVj6udMFTdUVUJVhDTtmD00OqfKhS0v2A0ite19Wz6RpZ3Y8bezuvKx+Qg
         23sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394611; x=1745999411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HKmvn7msuvgVm/2Zx8cHDv5Bn16on0KtIYGyc45jPg=;
        b=E5jiK6WykGFdxlEgkVTeAPnuzgtUXeHegQVqpZAm5Etl0NqulgzABR1Fz60uKVHfOB
         k+u9B/avH1866K6KAd5yfpR7NCYgwEbhw0iZPhyyGJc+5SymIiNq09j1d7vsiHqxbUi0
         pbu2ZlKONkLMiv5Z4B2qxwx4iqz48uikgF1GSUa6PGPeSq5V7f3CjN7192KG4S4uFdkU
         N4Dp8ag+5lR0hj8m09xo8DdtgNjJxMvfZ0j98h2hWNLe/dMXw7gaSgqEgzJJFMSe7a7l
         VNeuYy5hY6dmhCLsIFRU2o/LUcC15BdxpyX4QZfYZYqM7fPu4AFm5FLOQjAwR0gmIbeS
         3gOA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ujpHq065v2lbpccpmTW7xFDvysG684rD2Qc4B04DXJ32trSnwm1rR9FOaQKNzc+2JLVP8kI7wZ49VNI=@vger.kernel.org, AJvYcCUkNsmQISl3BeFvnTxjxZzkhC2LlKB7h47DQUxzU0YV5fmKZ56ggNscVvuZAUBWiVCaj2jfCJshHDmiOFl3PiRFZ8F8Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy76N5nc94vEMGOmk7OzGjYvNtHzUrj16ZWowX/l6uWqP0in9iA
	IDm0GhuzVIaQvAjIrd62e9r4Z25+xyZLNt9sXKeUGeCdeHpWwSKQ
X-Gm-Gg: ASbGncufuEcXKgWju4AlCNoklvK3OgmLzRugP/SMHSyoWwp7G47mTSa1pp/lejI4m0o
	Qk2763unJWCuB+dRhqPUlXKuJy1+HNcK1qjNjdoEurg2TsKl4WvGHGe08H+mPrkkwwyQPCyhKhp
	52qk74M0+2En1xuCWcMOkjyQ5OAN4GCWXGAt9MHFz5f1Z73hfZSLgPkKxnhmM9RQd/Y1xUJxcyi
	+Dt/ijRSO4HIsA9qVcyFbQl5mCzW7q3QcSFzPyizw8DtOCNUiwhwTmq7T+QZY63ezvU5Y31432l
	gQTWS6BZOELyYA4fNEKDC+yuVPS/rm1jV5MxJ5CI
X-Google-Smtp-Source: AGHT+IEgc1OE2+8U7RLtGI8tI78OAo9nMPoPHH9CNp4kpr09rcULrR1pCdntxyPLEd6+n+N2+x9lXg==
X-Received: by 2002:a17:902:c40f:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22c5357a132mr286942995ad.10.1745394610802;
        Wed, 23 Apr 2025 00:50:10 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdac67sm98240235ad.29.2025.04.23.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:50:10 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/2] platform/x86: alienware-wmi-wmax: Add support for GPIO
 methods
Date: Wed, 23 Apr 2025 04:49:44 -0300
Message-Id: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJibCGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Nj3cTy5GTd9ILMfF0jkyTDNNNkUxOzFCMloPqCotS0zAqwWdGxtbU
 A7+OkbVsAAAA=
X-Change-ID: 20250413-awcc-gpio-24b1f5c546d2
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Hi all,

I found a great blog post [1], which described the reverse engineering
process of the GPIO control methods present on this device.

In summary, these methods expose some debugging capabilities of the RGB
lighting controller present on Dell gaming laptops. See [Patch 2] for
more info.

Exposing these methods to DebugFS is useful for developers exploring
this RGB controllers (myself included).

Thanks for your feedback!

[1] https://gabriel.marcanobrady.family/blog/2024/12/16/dell-g5-5505-se-acpi-or-figuring-out-how-to-reset-the-rgb-controller/

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Expose GPIO debug methods
      Documentation: wmi: alienware-wmi: Add GPIO control documentation

 Documentation/wmi/devices/alienware-wmi.rst    |  85 +++++++++++++++++-
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 116 ++++++++++++++++++++++++-
 2 files changed, 196 insertions(+), 5 deletions(-)
---
base-commit: 981527828c301644bc4014faa9c523e8a5e32a32
change-id: 20250413-awcc-gpio-24b1f5c546d2

Best regards,
-- 
 ~ Kurt

