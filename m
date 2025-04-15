Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05042417C8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703146; cv=none; b=J/2Nls4thQ3+BJDo0ph1oiLhIYlIXJ1aFVKCvxlcPZdvvbu8R+NNqeYcJM4b8cuG+oMYm8v4S7iJ9vHTzLfbHrWoy/sP+TFr57eYzXRL6/MjEqX2Vv3h50BHMRg+FJYOwGhkLfwwmKYkAab43MUF80y5bkHEs/DdtoDiwCO0i58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703146; c=relaxed/simple;
	bh=LYTo/8Wrk86/MtiAPfbdDE26Hplmwpiabqw+vW+JUaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HUkzS6lAkBi0HnVpBLTpo3ZEGJhrHj+EccnYDqM/TVZ0GC4eQFtO38iz8tZS7Cxoulr2PqiP4Vk97g1uJZcrnWqkNkN01Kb4Dmf3JtLcWRl0juNThJyAvl+GaIeGhMYfj08PUOySRjKHox5NIF7gnZJw0d9jGrQ3kJuAs8h/P/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ANpTy5e6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ANpTy5e6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3217498f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744703141; x=1745307941; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZGd0w9zY9e8wiKe6AcqxmAzlgtf9nDIhq/RZijuzI0=;
        b=ANpTy5e6H88t8JoihICGKrnOBDrQKp5o9rEInBSkFqeYXIzI83BED+wdqSIGAdWY58
         Pk73XBzL5i5KW10GgOnkwSUU5LLQTrwhl2htyk8BBBnNSdQbZiv+q9CNe28g/yzL61pC
         0PLmQuRx5HBv/Fdzor/CbgdExPacB/6oqmiasoWVWNbdlpS2386mB4+9iMHQfDM3RhqC
         Irbqh3NcBIvpENxqOUVVX2M7TsWHB0bL1lMUTGex/Ga5FOt5JJ0TObhpI3csRFWDazR0
         Arnh30fztajOvlp4kQ5MblEqACN4QqoyFB1anXZybzNGWzPl8S920bKgD70GOjr+1xfn
         56Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703141; x=1745307941;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZGd0w9zY9e8wiKe6AcqxmAzlgtf9nDIhq/RZijuzI0=;
        b=NtfoAI7O1S+ZrEnTUdyrxK5vEAUnq+lQhHcPfLDbqEXD6LX4G9SAhVYVlJjY1TA+8f
         9yhdy7AWz3RuWUvjFIba/iyxIDQeB1a2bFJ4pPWh6uZHgsHVl4LBzBWvz4CkJJQv2hw5
         RpzQULE3RBEwDhZRLwO/ccKcqMiI08EPHV2UZVCdKcpnnYlIVw5DDc87USI6UOSBx5kk
         AmU6/kMXfVZZt6A7Q6hKCPuUJMbPIxx3AsijBXJCZFx2iaDxbsW+yfNAX7mdYOgelmMW
         gLOIXVdKw9y5Zkt03b8t4j/zX1zpQbLaG5E390zgrrPJ7l0bOZYe38e10/ckf1NATaxR
         xP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr43dtmLmV8GfpE5TCSHA6k4ofWJAcHEcq4k8+nGhK+mWGiSftGQdYUL0OcBoyN7KOuSa8fbTVxAw57XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUcTeZyOpJntms6AHFPFYdP4TUmob7dI5ZmYmK5yDWe3JeTMG
	SSHyFZMkYDj8JQYlr/SIiIbd3UtYhu4IqTJFuUHlGH0JUYeeqkOlkYOVx34wDqpr0e2Fh2r/ypK
	D
X-Gm-Gg: ASbGnctIMTK2eFk0LUWeU2YpDkLnj7Umb1PPjWj9ZNWa1EUv1H5Qb46iflCYnjx6SIf
	ZpUZY82IFAPJQ447exnXdx68lX6xtW6RjG2NnrLFlaMEhIdSO+fcXjYJOWfQioAOS6Dj98l4K9H
	GdvJCOT6b58vtUKk4n+ThEml6rp+gZd1KtsH3pRK96CCTOsiUWW8tJNjDXbBD3qai2fsRAEhCx7
	1y/2rYDkOT4Bjh9RW7abgpGsnC+lej9bH7G3ZtLtnVHR2qX47O4GSEH4JpSpweUIp1HF+t6CjJ1
	O78ynUKzY+cpDxppVFQtPHOPsnFhupiyUBk5ld6kpomOVx5UYTljxkH+RTlSoCq+k5x/D4eNeJ8
	5YlMOuSy+w7zOX9TEPg==
X-Google-Smtp-Source: AGHT+IHV7T+O8BH10hFsQ0yYigBYFXjp4027w7i9ivXroOobo0vEoRWLMN+TMIMe0o1dY3KNhquw+A==
X-Received: by 2002:a05:6000:40d9:b0:39c:16a0:fee4 with SMTP id ffacd0b85a97d-39ea52133cbmr13519488f8f.27.1744703141589;
        Tue, 15 Apr 2025 00:45:41 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445270sm13137060f8f.81.2025.04.15.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:45:40 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 15 Apr 2025 09:44:12 +0200
Subject: [PATCH] docs: iio: ad3552r: fix malformed table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-wip-bl-ad3552r-fix-doc-table-v1-1-717ffd320c9d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEsO/mcC/x3MTQqEMAxA4atI1gZqOxHrVcRFf6IGRKUVZ0C8+
 xSXHzzeDZmTcIa+uiHxJVn2raCpKwiL22ZGicWglSb1aQi/cqBf0UVDpBNO8sO4BzydXxmps9q
 aYH3XKiiLI3EJ3v0wPs8fCe7Ikm4AAAA=
X-Change-ID: 20250415-wip-bl-ad3552r-fix-doc-table-589293c9b860
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=uyyyxJVkC1X19c9K6rX5j2f5tLF1UJIDKdItLe/uiwA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/x+dX8FdT6cgy2T+eN9l1VjlW3s5XKq64YBookfUmZ
 8KsRkXjjlIWBjEuBlkxRZa6xAiT0NuhUsoLGGfDzGFlAhnCwMUpABOpm8nI8FPDqaq0NvpIql3C
 n1PTJ39gOtL5prT6bNlfyVU3Pte1hzP8Dz39Lz64fH+AElPa+bmJRxdd0S5b01nxptTi+2ITnad
 qLAA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix malformed table.

Fixes: 9a259b51e3ea ("docs: iio: add documentation for ad3552r driver")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Fix malformed table.
---
 Documentation/iio/ad3552r.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
index 582507abe8c4c2ecb51a1f8389d7deec44d20222..f5d59e4e86c7ec8338f3f4e82d7a07587e3d8404 100644
--- a/Documentation/iio/ad3552r.rst
+++ b/Documentation/iio/ad3552r.rst
@@ -56,7 +56,7 @@ specific debugfs path ``/sys/kernel/debug/iio/iio:deviceX``.
 | Debugfs device files  | Description                                          |
 +-----------------------+------------------------------------------------------+
 | data_source           | The used data source, as                             |
-|                       | ``normal``, ``ramp-16bit``, etc.                        |
+|                       | ``normal``, ``ramp-16bit``, etc.                     |
 +-----------------------+------------------------------------------------------+
 | data_source_available | The available data sources.                          |
 +-----------------------+------------------------------------------------------+

---
base-commit: 31c52fe3b2efeebfc72cc5336653baaa9889b41e
change-id: 20250415-wip-bl-ad3552r-fix-doc-table-589293c9b860

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

