Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA91898FB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834832; cv=none; b=CBI+57c0ZI1AkpTnGyTgiC5bKwG00y1PY1BYZFr0TkiBc77UU/4fjX6KIGuDdiywJyMYI4ahCsFRfPBq2djNJ/xwPIRwz9OPK/q0WCJLYtf/Qj5R9Xep6SwpFFGAONEs+VVipF80PvCaczUu/A058rCOA7ied7+Y35FKFru0Xfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834832; c=relaxed/simple;
	bh=IpQYnj2V7BikdPiduQ7DPxABzU0N39USjUQluxoMkpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zl3Bydw/pLhszXIVAbybbg98MryV/ozb11gm4lwIXCvOZnvKSJoBWLBIisDyuWchn/dZ6+vMNPeIHEexVCkAW8uyaddMN7obXPNjKVHAkdJsYB0zX+0DWaAPi+vrk5xBsD5GdeQHsLsbuIJ2Dsyjfw9lAhdItKzzbQsgCsusRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KI0GPuEu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KI0GPuEu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso19531535e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834827; x=1746439627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzrsi3pi0iIltrZlZhporBCL00VYHTwj++Rse+VApaY=;
        b=KI0GPuEupiiAjNcSdJPzlRcb7RbDkFYhaAObq0+uLeHHeA8xUNezRnGs7HUv5HslML
         NsPWTtjKxf8rbp1QwJjZjdbbYbffi4H+7Q+unTSh3jDEoOe+NRyoMpDhKTdXGBa+bpdO
         FpZEoOjHPzCHnnpiuxuCWmrGLD2h4RGKKBdfwojmdGvUZDF7mAz49P+nWgadqSXj+cE6
         gG5E/SFjJf4nBDi8RAbRUBypdfqb133qGzFqd+qyxNiL8LT6XAxb2BbONKPaaUVVfOJE
         eCTiW24+kD4059UrrS2/4+9trnwUkVO4lF14QhdR12kqP4v9+8lEOrCLUAR4XxeeK4d+
         bf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834827; x=1746439627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzrsi3pi0iIltrZlZhporBCL00VYHTwj++Rse+VApaY=;
        b=p4ujWJHD98la+SEsBArCMImFt7ZmXFNJRwy0EQWpvsdBbUHKBrTqqUuQGm7FG870XD
         WkfP+UFgo+5yp0jYbvtNioiYe+HOooaaQn1gCPRiesSEhVbB46CnoakicIO/AcWVP3tl
         NsTnhX0h55mIYFETrNEAsZn9am506s3nfsp0WRyVwXkPMDnCBrIbFmhBTGtpeUvzxNfo
         goyxCyRH9ikFgum5oW2m6pI6yWjK6G4p1yoHw/JC6n1jdushDrLlVxKHydDbOx5pmVkI
         vgeO3WqIhXMp3SDpele4jjU5xTW63mdEQVB72EVAbG2jaeOjhd/ok9Qtb0v5hGmqx43P
         MOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXujNzc0Q8XhziRQf8YBh57wWBPWiBlpQjbltntQr7bUh7aMb9AITwqRazngeFVIVf/x8bewslaN/Y3sXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGWS9ooKq2w6izSAFAGrKLVMDOOyyuJqqzILfziLBmke3RecW7
	ilvM0TNqGYCtGwgxXsohw1zN7mgDjNrMHL7wCnLG17fGzwEiCV+O70ULx6uPEqU=
X-Gm-Gg: ASbGnctXKbCv9zbRxaIvDC5axqVlzDg+6MxRjspeW6/qwMrNg5RYY/2zci8I1BFYQls
	2oQf9yHETFaOBEbXDmMCoiK3XAMwmT/JVOJZXCXN3q5RfegKfxrYqRuM7+rkHtaEiR6Dqd83YL8
	h60tdz3AnRT6vH3PF91IuMR8RGF8qNWa5i+onnmVIH9tWZWJSfhsnOLQxH7Nn+zCidDzOYriLsa
	Ibve/HsNQNNmvps4U97xcOd6oetnq/SN+NQFHY8uk8L4+HTlmI8WPrti05tMe3DTgVcEb5AtCMU
	TGruQyNk637RkX34Bc5ja4y8ZBV7oXkWhezjNgEtpQP/4XUlOxLRaujcnzq7NFz803S/PjY2pnW
	MeWPs
X-Google-Smtp-Source: AGHT+IHNMdzosfv0+nWOCnzKJE4PE24clv0q95rtqKlyKIkJrHKFkkX3uJfx9+rN3PyvSShNsd3YPA==
X-Received: by 2002:a05:6000:2585:b0:39e:cbca:922f with SMTP id ffacd0b85a97d-3a074e10467mr7569175f8f.12.1745834826873;
        Mon, 28 Apr 2025 03:07:06 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 0/5] Fix pre-1970 date handling
Date: Mon, 28 Apr 2025 12:06:46 +0200
Message-Id: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADdTD2gC/3WNzQ6CMBAGX8X0bEl/CXjyPYyHbtlKEyymJY2E8
 O62HI0eZzfzzUYSRo+JXE4biZh98nMooM4nYkcTHkj9UJgIJjTjrKcYDExI42IpCOeU1MaJQZM
 igElIIZpgx6rktuGSRtvW3yui8+8jdLsXHn1a5rge3czr9Wcic8oodkJIcFoDdFcw6+QhYmPnJ
 6lLWf63ZbEdYxI7rpTi/Ze97/sHdmZbYAEBAAA=
X-Change-ID: 20250109-enable-rtc-b2ff435af2d5
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=IpQYnj2V7BikdPiduQ7DPxABzU0N39USjUQluxoMkpg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NJSthlRJ4uXnVa278oj4zuJgIv+iM7+9LUa0p6
 uTAhsg+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSQAKCRArRkmdfjHURTgJD/
 0WWjsqWUC4qnee9PLpT2XyUKMGdVSb0smV3awYZrDDWnSMsWWt45UUSXG2Pp7CqtNztkUsLkpGqeOq
 wvWu1nxcTHt/GTvT88AnXO2+p3UcyyRXjdJGrZYuviiV07kC2KbxV8qh5yHEHBLzSrAscr8G/NrzsI
 cXIm79Nqu1lRaKIMC8x2gfkzkWloTXc1NVYYmCUeWEmqQdO44utkF5mGuZWhE3x1bbRx8NLo+Cg5rv
 x+x881vjkXpvSUsVsgA0jEh0KD4Mh2XMmZVBnPDGmFDN+ZzP4VS/K+8ojHBY2kE+yPuDoTus9Sf+0S
 lKDz+psv6iB2b3a8inSkPdelEwq3ADYLdYejGSU1vyoYHjpv3aFHQXXNXZDy5iFqGov3KZZMLJLucY
 fvQyWC6iqRR0pZTFaiqmxXjZEWDvMfzS3n1FQCDnuSmwR7rHiAp64Trv4bt+5kvcSI3+LbnMrGWNCg
 ole74b6YFoz4Cua9mQopWr33fpi7ZhcBfeSBZXFNgUKUzDQt0SerwmbLeLTwrueTSJHrr924YwE5WG
 OKmV/RrVZZ3Xx2N1gCn5ON9TbkVwhfUo8qsjtkrye3i2g7anSQInmn52xwIsycDdO3wOFjY90TNN4C
 v2/RCc4M4S+DgbpfvGjxeIr+0uWEOR9HRdr/ThmOgukSwLOrP87ppHbQQynw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

This series fixes pre-1970 date handling in the RTC subsystem. The changes
are particularly important for MediaTek platforms using the rtc-mt6397
driver, which can only store dates from 1900-01-01 to 2027-12-31.

The handling of pre-1970 dates in time conversion functions is improved, which
is essential for hardware that must reuse earlier dates once their native format
limits are reached. Sign-related comparison issues causing incorrect offset
calculations are fixed, and the test infrastructure is enhanced to validate time
conversions across the entire date range.

These improvements ensure the RTC subsystem functions correctly when hardware
date limits are reached, particularly relevant as the rtc-mt6397 driver will
hit its upper limit in less than three years.

---
Changes in v4:
- Remove "rtc: mt6359: Add mt6357 support" to send it in another serie.
- Change title serie to "Fix pre-1970 date handling " because MT6357
  support is no more related to this.
- Remove "arm64: dts: mediatek: Set RTC start year property" because it
  is not requiered to have MTK RTC working.
- Remove "rtc: mt6397: Remove start time parameters".
- Rework time comparison fix to avoid cast.
- Remove change in rtc_valid_tm.
- Improve rtc_time64_to_tm change for readability and efficiency.
- Extend conversion test cover to reach 1900 year value.
- Link to v3: https://lore.kernel.org/r/20250109-enable-rtc-v3-0-f003e8144419@baylibre.com

Changes in v3:
- Rebase on top of rtc-6.15
- Added explicit start-year property in DTSIs for MT6357, MT6358, and
  MT6359 PMIC RTCs to ensure consistent values between hardware
  registers and the RTC framework.
- Removed hardcoded offset and start_secs parameter in mt6397 driver
  in favor of using the DTS start-year property.
- Fixed type comparison issues between signed time64_t and unsigned
  range values to correctly handle dates before 1970.
- Added proper handling of negative time values (pre-1970 dates) in
  time conversion functions.
- Modified rtc_time64_to_tm() to correctly handle negative timestamp
  values.
- Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
  pre-1970 dates to be validated correctly .
- Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/

Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (2):
      rtc: Make rtc_time64_to_tm() support dates before 1970
      rtc: Fix offset calculation for .start_secs < 0

Uwe Kleine-König (3):
      rtc: test: Emit the seconds-since-1970 value instead of days-since-1970
      rtc: test: Also test time and wday outcome of rtc_time64_to_tm()
      rtc: test: Test date conversion for dates starting in 1900

 drivers/rtc/class.c    |  2 +-
 drivers/rtc/lib.c      | 24 +++++++++++++++++++-----
 drivers/rtc/lib_test.c | 27 ++++++++++++++++-----------
 3 files changed, 36 insertions(+), 17 deletions(-)
---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

