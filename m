Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966701DE4DC;
	Sun, 27 Apr 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742326; cv=none; b=bqVJH+fp/tA2DSXaIu3+lWcLCwscz0J7v1TrGFsMJGVR+brps97NKl13XcZ8HwSGmONgLGwMAQ3tLfP66RpURDxFO4j9PthUeKmNqwphPjMIlkQDIDey4IjA0lT+0OMaLwkWaV/nXuLe0KIe7SakO7BvZxX69tLq216lv1Hbq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742326; c=relaxed/simple;
	bh=PBw0PDf9JbDzfQqKH6sato0veB6RTeDZnFhWwNwJsCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Qnn0sF8e0i0ZInNhl8S9liFfkyuwTGl7XLZFD8GMSuWTyPaLJbafSlRUKcTcgbIkgpiWQDcLwU8uhaHmLnyUv8lU1CxCO4448mXTsYoyo1QnyeE1wn77Pnb0peN+HdmqT2L3BxBEL9yIh0zLl7jZvBNzaXKX+SHWRyw1HOmW/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKYBEPCM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKYBEPCM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3503173b3a.3;
        Sun, 27 Apr 2025 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742324; x=1746347124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bSy3QbJRv7DmGrlDT8/1wLtqRMpqrMZ9rZcc0aoNiSs=;
        b=WKYBEPCMk57HulaMQLVrjbGvfc9M17CcqQpJ8weWnAv6YInzyMvcEk7gFW8jrCEbN9
         MobBF+Z6bvL2RxpHCnu0CgebfXbPZFfTST37JYBOTOvllHKW4ftyu4HdL12bxLHawWI9
         rcqAiA3HZkCrS8c9EOih3dpt3QTPbrX7Q1BIGoXfidrOvNU4aXHZXus5EDa0IvEb1KsL
         nTsZddt7BNpBmr6TZwsIzBXkR+dmo7vnWMNuRhwB/Faj6Qg6zUlz7eas6rLgVEJFVL6W
         n+g1Un5DUux5Gx7iTIhXFhCZRUbsB1WMvuFKDeF9IWVt/3xdEgVrf/XSSdApdo1wV/hv
         CTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742324; x=1746347124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSy3QbJRv7DmGrlDT8/1wLtqRMpqrMZ9rZcc0aoNiSs=;
        b=IFj91cHvasGlyJYB+B/NQIw3gMjHssewvN5LycPzB4ntqrfilC6TH/EXtsLcphnuG2
         kvdgOqOLlXUt80nLkoivkz+lT3eosiUBT7gzlGjPfVnG8YIE0ujZ228R5avYDJIsILTq
         AmJKiDfM5T5gYBAIYsVmtUzarlFLJJS7jwCu1B9A3co0k7NRXDMcDfSwT2NdFKP/sWlu
         gSroSpAtIWuMkE8UERHwbIpqJQFfwf8507wllSw1QNrecRGF+RPTfi/24uOxm6Q6QXWi
         7P36UttWoY/BlM7j7dSVHkpKrW+wFGpE6h+7ORq0ytyGakU0vEapjNwlMVz4FjyZpsO6
         aJKw==
X-Forwarded-Encrypted: i=1; AJvYcCVgc3JGZuEopbJBPRxpgg1gXwtGXkDCeS5xHcOdDlkjjGMfOjRnmQnzYr1KxGlFVol4UQu4QwY/xi2W@vger.kernel.org, AJvYcCX0CezuuCd+zJI/shg28BxEj77eTGsWZrPWt22zU6LTYFZ8ibk3R3kYgkyuVjWT2gWg+NqJ8gaS2839DvUm@vger.kernel.org, AJvYcCXe8mAkqe33TGU53frpL6dbZVezcfljF10Q2f18vc9iL+3ZEE2NFXBc8JQIOSBESO4ZJN4nshZzAjUf@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdmzao94DpSmiGIoF3tXDFY6Qeh4Zmgkd5YdwCPT4NeA3msr6
	JLFKFc3wQ2Q+FCGn3u5TfT6ZRpEM4duKQhh9nhPeZEZP7SMDIGFYR3RuitOj
X-Gm-Gg: ASbGncvaiChOv3T7NqHNbtyUYM0+Z8iTZyLw+APDCQMEXLSW7th+e7xgs2heNwshdxP
	HkhwKwQzSYNjY1k56mIJv9aaawsDLAcLf6rITSm/wyD/skmhvo9jDUmUbE6HT/JIfd59ywb/IuB
	QmXjXoBxqInqkVHrZ2TSwLKQ29/OtJbSlW4OgWfzTSuI6LzIBWe92GW0oDcYhSW1xVrmBHZaZBZ
	PMKS2egftFb5nomxmAeOfAT5S4Xlw1ZBaBoFFNc4muXpphSQOHYZsxvuEhqW0u0/srYixqBYmKQ
	6NnerU8QMZC+cj79ZpANJJnYrXCxIkyei1fubEQ7igq3jyXEDuhf7A==
X-Google-Smtp-Source: AGHT+IG5qnz5GOAH6oZvY00TzTjs1/+wlVcc1GWPA84EcPujdbxxX4tiX1r/bvb+09d6pEDael2hEg==
X-Received: by 2002:aa7:8889:0:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73ff7247e46mr7010787b3a.3.1745742323637;
        Sun, 27 Apr 2025 01:25:23 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:25:23 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Sun, 27 Apr 2025 15:24:42 +0700
Message-Id: <20250427082447.138359-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the TI/National Semiconductor LP5812
4x3 matrix RGB LED driver. The driver supports features such as autonomous
animation and time-cross-multiplexing (TCM) for dynamic LED effects.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v8:
- Move driver to drivers/auxdisplay/ instead of drivers/leds/.
- Rename files from leds-lp5812.c/.h to lp5812.c/.h.
- Move ti,lp5812.yaml binding to auxdisplay/ directory,
  and update the title and $id to match new path.
- No functional changes to the binding itself (keep Reviewed-by).
- Update commit messages and patch titles to reflect the move.
- Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/

Changes in v7:
- Mark `chip_leds_map` as const.
- Use consistent `ret` initialization.
- Simplify the function `set_mix_sel_led()`.
- Refactor `dev_config_show()` and `led_auto_animation_show()` to avoid temp buffer, malloc/free.
- Simplify the code and ensure consistent use of mutex lock/unlock in show/store functions.
- Remove `total_leds` and `total_aeu`.
- Link to v6: https://lore.kernel.org/linux-leds/20250419184333.56617-1-trannamatk@gmail.com/

Changes in v6:
- Add `vcc-supply` property to describe the LP5812 power supply.
- Remove `chan-name` property and entire LED subnodes, as they are not needed.
- Update LP5812 LED driver node to Raspberry Pi 4 B Device Tree, based on updated binding.
- Link to v5: https://lore.kernel.org/linux-leds/20250414145742.35713-1-trannamatk@gmail.com/

Changes in v5:
- Rebase on v6.15-rc2
- Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
- Address Krzysztof's review comments
- Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/
---

Nam Tran (5):
  dt-bindings: auxdisplay: add TI LP5812 4×3 Matrix RGB LED Driver
  auxdisplay: add TI LP5812 4×3 Matrix RGB LED Driver
  docs: ABI: Document LP5812 sysfs interfaces
  docs: auxdisplay: document TI LP5812 RGB LED driver
  arm64: dts: Add LP5812 node for Raspberry Pi 4 Model B

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  144 +
 .../admin-guide/auxdisplay/index.rst          |    3 +-
 .../admin-guide/auxdisplay/lp5812.rst         |   79 +
 .../bindings/auxdisplay/ti,lp5812.yaml        |   46 +
 MAINTAINERS                                   |   12 +
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |   10 +
 drivers/auxdisplay/Kconfig                    |   17 +
 drivers/auxdisplay/Makefile                   |    1 +
 drivers/auxdisplay/lp5812.c                   | 2736 +++++++++++++++++
 drivers/auxdisplay/lp5812.h                   |  348 +++
 10 files changed, 3395 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/admin-guide/auxdisplay/lp5812.rst
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
 create mode 100644 drivers/auxdisplay/lp5812.c
 create mode 100644 drivers/auxdisplay/lp5812.h


base-commit: f1a3944c860b0615d0513110d8cf62bb94adbb41
-- 
2.25.1

