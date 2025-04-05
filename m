Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51628EB;
	Sat,  5 Apr 2025 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811985; cv=none; b=AC/Gu3Y7UA+K/37OpEGsG/P2teb28xxQPlLMYdXuLY7VTNcCGvaQ8EVOm8sd2j2P7fV7jZ1uq+nfePSwsp8PizYOJVUNXdhoEPAdY6LURhjA2rTpKF9/4BSRE/JTgd3QhbOQJJBBe1MnY/pyTYqxOEYmptCJUCx6YhhRbylfbNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811985; c=relaxed/simple;
	bh=KjmspBpiu6mD534nIbOHzgRUTwHmzEQbjmM6iuUZ4SY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=djcR54nWOyzzxLet+muTHyoprJlscpLCOGzLmm9fZe54eT0SmlfFJqRoeVL/49XVWXdWyH8W+RqIj+Jf4/XCMWOXdKeug4/ASATgKFF2RqzfziJ8t0buZfYzplBtba/HZdus9em59IoYJ1jKEaLDlkagBWY7XcriiX8CG4el2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9NhBhMj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9NhBhMj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso2402984a91.3;
        Fri, 04 Apr 2025 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811982; x=1744416782; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVB5BztCQcbNtQipgi9Dw0n6uAY2frFJeooMsuQ6oIc=;
        b=l9NhBhMjlivIW2xPkP7yWrN6hq9LmKJsHcPV83KR+kF/USCJS+HpuZUVPhjPIjOzxm
         Hh8+U/BQEZsND+J8kHDXbmo6kj7LOmuMKt6glnHt1CuX745ii9TyXyVdRqT8ZquJgHt/
         eZLuBcn66PACOyo0v8sQ7UhsQIgXdSyq+Mk/bUdOBe1svqIa2TmuamCqjPusHk5+s0z/
         u42zC+l/3t6t5lNmzJTwE8eDBVdQsWe9um6wbTKhZl37GtiXUjZZnaYBlkfbHFRbfXMh
         1qloVnxXPpsHojwP8rRK64jh8Gj+iWu6aqrqPJL0969FY03IW8hl/G7hUCNqIE+Zz7QE
         ZTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811982; x=1744416782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVB5BztCQcbNtQipgi9Dw0n6uAY2frFJeooMsuQ6oIc=;
        b=jGRW1tKfu8CwuigWdtvVgMlutVQaeUFVdKEDyUWNgMnUbelQ/r0/FfWAyevOQzA0xi
         Ncg4+q5WzjZ6AXlpPmIGFGIJGvKOqLN0Hovz7lRgTYx97CuAnVHTEDUowWN992x0bACk
         cbCx6sjf2gTBLyubjqBpMTWFQDdKgGP8a7GCvFUaTUGJVemsoeqpY3FPDpRgDIEtbgJW
         htganTpeMj6wWqSUXesaIgzibsTJ6hJvOuMcfgGsPv24xR5yhAF/UslaMtugYurBJ/wg
         Nw7LKr6Q/VaWUmEODaW/K8Wh+TVAyqOEw55doaqPD5xDUnjJ3u022LJWfKSaULOW+5ZJ
         v/kg==
X-Forwarded-Encrypted: i=1; AJvYcCUhx5+VJEM/QwbXO22czO0Nh928TWxhF1pCSxWE/6I7+XkdfkUuxLofCWsjNXvIPB1aKemZUf6ETEW49Os=@vger.kernel.org, AJvYcCUjCW5L9qpESXhpENEBLiE7G3KYxxUF8PmQt42iV7O/hjw6R4IKmsMRH4OfDiklTaPyJnqyxmrxvz9SMdBX@vger.kernel.org, AJvYcCWENM5iz7g1yoXxJAQXqb6CLqotSWbt5x798dF6SF4RQaKZK0kb9qLpIGTdpit9lP3EJcJjohCrr2s4MAM=@vger.kernel.org, AJvYcCWreYvLMYayKK2qQJsAQ7xIGejfrx+8MddK76DvOEx52wRurk/U9v2fw+z6iE+LDl9J5agdqz9UEEVw@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhx1b/4YNNoZMQrixFFiM10dASbitH1ERg1UtMTRzk61QtY58
	oaZ2pUrQ8yHHaY9NpxRmcu08QjCLYeMvpyvijKp3IUf9R+iUFAnZxTKqtgDk
X-Gm-Gg: ASbGncs6XntY+1V+CSjo+gqA9HQRYzuHwCNAgimafBVvnBdNjiBYpUstPgURLgVHRX4
	IVLpH+bZ9o/kj/6B7kNvBvE5R/59rmpRdeUHPDkDc3vBxz6yHyMkcrx6II9vZwnxKYLao5ZF34+
	7NTM2Is2XhzbGdb99VVqfAaWuTuOdhT5J8MHwxV1II4rb0e6gPbc8bhfULwxzTQiLfZ69Xa6eP5
	IFvElxkM5IFMZd0wdElctWNalekehS8CYL2CP9OVhkb9RqX3/QJb4ci+zXJCSoAmYugT3aPO9y2
	L5eu1hUJ7ozJyLCWv9BJFuHqAwKg2spEBJHW/+ai/eJvEbSXGKlDAYcSxnqDJBRzZo1GmWMLj8H
	08aMW9qzjayHPtd3sq2MmB4ymWpvBilaX3tNVq0Fcy2nz17bd1Q==
X-Google-Smtp-Source: AGHT+IGrwu27oF8ex/7piw96e+w8tE/abSdux4k8o9zBQQLxkK/kmB/PCrq8JJx1uFaSmXIk45Yzfg==
X-Received: by 2002:a17:90b:56cf:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-306a61208demr5871471a91.6.1743811982462;
        Fri, 04 Apr 2025 17:13:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/10] ASoC: tas27{64,70}: improve support for Apple
 codec variants
Date: Sat, 05 Apr 2025 10:12:37 +1000
Message-Id: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHV18GcC/23NwQqDMAyA4VeRntfRpradO+09xg61jVpQK3bIh
 vjuq46BDI9/SL7MJOLoMZJrNpMRJx996FPkp4zYxvQ1Uu9SE2AgGfCcmmFokdrg0NLvRqQKlVT
 OcoTckXQ5jFj516beH6kbH59hfG9PJr5Of5489CZOGdUgpCpK4CUvbnVnfHu2oSOrN8HeuBwbk
 IxCgFaschqZ/jfEzgB9bIhk2LLkgjHBjK32xrIsH4MQNUM+AQAA
X-Change-ID: 20250214-apple-codec-changes-6e656dc1e24d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KjmspBpiu6mD534nIbOHzgRUTwHmzEQbjmM6iuUZ4SY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSlulp10oyHoUveehUZ7i6UXywj4iKxbKHt/y9/DrT
 XV+qV3WHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAExkkSIjw7NvpVMMrk1giMuq
 muSxvknT+L3JsZcOjeXvfHbea6uVW8zIcGDJ0vfOh+a96A2o3hj4kuncWsvgl0uEErepC1yp35K
 +gBcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces a number of changes to the drivers for
the Texas Instruments TAS2764 and TAS2770 amplifiers in order to
introduce (and improve in the case of TAS2770) support for the
variants of these amps found in Apple Silicon Macs.

Apple's variant of TAS2764 is known as SN012776, and as always with
Apple is a subtly incompatible variant with a number of quirks. It
is not publicly available. The TAS2770 variant is known as TAS5770L,
and does not require incompatible handling.

Much as with the Cirrus codec patches, I do not
expect that we will get any official acknowledgement that these parts
exist from TI, however I would be delighted to be proven wrong.

This series has been living in the downstream Asahi kernel tree[1]
for over two years, and has been tested by many thousands of users
by this point[2].

v4 drops the TDM idle TX slot behaviour patches. I experimented with
the API discussed in v3, however this did not work on any of the machines
I tested it with. More tweaking is probably needed.

[1] https://github.com/AsahiLinux/linux/tree/asahi-wip
[2] https://stats.asahilinux.org/

---
Changes in v4:
- Moved remaining changes to the top of the set
- Dropped already merged commits
- hwmon now reads temp from regmap
- Bumped regmap max reg patch above Apple quirks patch
- Dropped TDM idle slot TX behaviour patches
- Link to v3: https://lore.kernel.org/r/20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com

Changes in v3:
- Add Rob's Acked-by to Devicetree compatible additions
- Dropped cherry-picked patches
- Droped abuse of regulator API
- Droped bespoke sysfs interface
- Rationalised temperature reading for hwmon interface
- Set SN012776 device ID with OF match data
- Changed probe ops reliant on device ID to case/switch statement
- Added documentation for new Devicetree properties
- Improved a number of poor quality commit messages
- Documented behaviour of die temperature ADC
- Link to v2: https://lore.kernel.org/r/20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com

Changes in v2:
- Changed author field of patch to match Martin's Signed-off-by
- Added Neal's Reviewed-by to reviewed patches
- Moved fixes to existing code to the top of the series
- Removed tas2764's explicit dependency on OF
- Removed complicated single-use tas2764 quirks macro and replaced with
  if block
- Added hwmon interface for codec die temp
- Fixed a malformed commit message
- Link to v1: https://lore.kernel.org/r/20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com

---
Hector Martin (4):
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2770: Set the SDOUT polarity correctly
      ASoC: tas2764: Enable main IRQs

James Calligeros (2):
      ASoC: tas2770: expose die temp to hwmon
      ASoC: tas2764: expose die temp to hwmon

Martin Povišer (4):
      ASoC: tas2764: Reinit cache on part reset
      ASoC: tas2764: Crop SDOUT zero-out mask based on BCLK ratio
      ASoC: tas2764: Raise regmap range maximum
      ASoC: tas2764: Apply Apple quirks

 sound/soc/codecs/tas2764-quirks.h | 180 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.c        | 176 +++++++++++++++++++++++-
 sound/soc/codecs/tas2764.h        |   3 +
 sound/soc/codecs/tas2770.c        | 160 +++++++++++++++++++++-
 sound/soc/codecs/tas2770.h        |   6 +
 5 files changed, 519 insertions(+), 6 deletions(-)
---
base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
change-id: 20250214-apple-codec-changes-6e656dc1e24d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

