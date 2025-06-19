Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC225C81D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315932; cv=none; b=gCCDrph8VAF4s7qrJt3yk2iJ0cNvsZ+G8zQHKxu/zlWojo6hUeGTuNdtB+RyWNP9JoFw42CJbfaPiyz0fAxP+6SyafXzQQhpJPHp3ZHZZUe+QSOhiaCsgj0d7slOEyQ85rBiM64NDGHEBvZ10mH3j0FxJ+gUMfb0wzc4Hy7xT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315932; c=relaxed/simple;
	bh=ZbeIJfJ/ESCn7DwHJEDzMv1vN702+0GjKH0UeojPnKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L4742hCmBIX6B9KVomhaRy01I/uIZWkvjr3oTt9ZYEREy7sIc4jqb1nTGvnDq/tqUEl1YQNg6iDfSSIQ5Sx9k7R3KKGRctCKcRzUZSZcZoJt36rTkjmkGzH4lnlhwOkLMmtAZzszj/stuR8gghe7b4LFHiCulghDQGfeR5pal+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Ov+ZbaUx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Ov+ZbaUx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235e1d710d8so6887865ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750315927; x=1750920727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxzFBpBUytlnnK/lLY9GLRmiTNoGLuRXi3FVA99B97w=;
        b=Ov+ZbaUx167t4tsOMh2bqSVuHhl7aLYcAbqxLaVz/lFHXgvQ2fLh+Gte1RPQ7K2uug
         /pAbwGsdJNH5VcMraCs5Q4gWQaza3f6+o0IUb3Tzi5hcfNIpgJZpAlQ4GPqhpOBxYNOt
         fjGE3FIqSVYYiatUxHl6BhkYLwowSGPuJIx8dYKQIsZZeKGuSYAmaj9fmG+/oDys+F91
         lO9GyATM5IN3KTnxJ8+rYNoTYhSfANp3+gMsfLvB9f0BtUxz631J2DpDB5jbzXUxjreo
         LEq+b46OIu5Ulw1++Nf2bVWA+NRtI/sZkZagvOBhe2qCDHTt/9uULPnEL0dM4mc7x4bW
         /VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315927; x=1750920727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxzFBpBUytlnnK/lLY9GLRmiTNoGLuRXi3FVA99B97w=;
        b=XluM68YSW3ci/iE85v9EcA5mFsIfzCKGAh86gxppFPPJSpgOL7L68tDtxhSfzhLowG
         OoQcFF6gv5NozZPhRzA1Gj2aV/Hz8Tn++ESQPU5quqeTvxBK3e5squsJsdfgvZN/5zxE
         IOqOrjFoDghjOAxA4VP21WqqOD3r5Nz3j0ROsawJizUEOdwAgW6ems5FuUBbZRiwEnlI
         xK0chIOp6hyAtf40lxX0PuH/s5Wpb44uMYCSXRfXqWDmsE3vGhSuAapDyBpsy3c2STLU
         SwEe4HKssTrY1m46i+R2N82VUqKm3ZwUAupYRkg3t2OKJ6h4X3vyBYn6gy03BVbFXoE/
         Jj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVpi9Yi+3Jm/IRx7iHOmt0k6x2+WKGmEQNn7RkirWx/d1p7wLpHmaE1VeVCDsHhNkQ8/3ghA+jwRyseMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFBWc58K2t0FjT7mXUaCvnL6BSCmLXhQPlsfFtz9DUu/edZqg
	/4adbuzwp9ypWcHjUTIDmdoIacDi67E1SRbOfM4h9NHeluTeNkyeQNR4Zj9lT+YJfLU=
X-Gm-Gg: ASbGncsMwAvTXpH3LhmmM5wMz+zPKD/fe/n4DcMTQ29nB1fLfnjJ8wgF3f9EzibEfbI
	MbhJ0MTO8yI3rOy9RWOAzbOdG8cn10FYvwCbizVshibaAkUvau9cxzziOIeL9xlXIc2XRAftNxw
	4TgwKW6W9H3De9nBucWTq71LEMH4O0ViRcdhMQQQeh5NC86OdCcb83SQYfBPTdQWeSostCFS/Jl
	jVIew/N5Xx+nQhyluaPnp8tmi4fSaF6A5VziNeoxYkvsLZlgHVUNMJHBgmJk84Rmzo9xNpFHkAx
	bNmDXVX32iZRT3qLmNk7poz3xJSmVZXmL+nkTgmgI9FGrJYYGJnvCcdp61bFP1DMyuqhK6HbuVY
	WeVUIqSheA7vfV6WNGskVJQqeumH5grdUNDzPKT1X1qg=
X-Google-Smtp-Source: AGHT+IFqdRyN3wkxE8agtKwY6Dgx5DRr4PCjUWNZp2cRnoINXBsOHLsAXlTT3U1U4d5jOJGB5dbsJQ==
X-Received: by 2002:a17:902:ce89:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2366b3dd319mr341052095ad.32.1750315927426;
        Wed, 18 Jun 2025 23:52:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfdb9a0sm113108155ad.239.2025.06.18.23.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:52:06 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v10 0/2] Add tps53685 support
Date: Thu, 19 Jun 2025 14:42:21 +0800
Message-Id: <20250619064223.3165523-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS53685 is a fully AMD SVI3 compliant step down controller with
trans-inductor voltage regulator(TLVR) topology support, dual channels,
built-in non-volatile memory (NVM), PMBus interface, and full compatible
with TI NexFET smart power stages.

Add support for TPS53685 device to dt-bindings and pmbus driver.

---
v9 -> v10:
- Fix the inconsistent indenting in switch case with tab instead of space
- Run the smatch kchecker to confirm
- Link to v9: https://lore.kernel.org/all/20250610102556.236300-1-chiang.brian@inventec.com/

v8 -> v9:
- dt-bindings: Correct the order of Acked-by tag
- hwmon: Fix the alignment to match open parenthesis
- Wrap commit message body at 75 columns
- Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/

v7 -> v8:
- dt-bindings: Include missing Acked-by tag
- dt-bindings: Patch kept in sync with series version
- hwmon: Fixed device_id parameter type and test make.cross of i386
- Link to dt-bindings v3: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/
- Link to hwmon v7: https://lore.kernel.org/all/20250515081449.1433772-3-chiang.brian@inventec.com/

v6 -> v7:
- dt-bindings: Fix the order of patches
- hwmon: Modify the type of device_id from u16 to char *
- Run make.cross with ARCH nios2, powerpc, and riscv
- Link to dt-bindings v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/
- Link to hwmon v6: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

v5 -> v6:
- dt-bindings: Correct the subject and commit message
- hwmon: information about tps53685 into tps53679.rst
- hwmon: Add additional flags when identifing the chip as tps53685
- hwmon: Adjust length once returned device id is terminated by null character
- Link to dt-bindings v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/
- Link to hwmon v5: https://lore.kernel.org/all/20250314033040.3190642-1-chiang.brian@inventec.com/

v4 -> v5: 
- add support for tps53685 in dt-bindings
- add the buffer length as argument for %*ph
- Add Changelog
- Link to v4: https://lore.kernel.org/all/CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com/

v3 -> v4: 
- Add length comparison into the comparison of "id",or it may be true when
  the substring of "id" matches device id. 
- Restore `return 0;` in `tps53679_identify_chip()`
- Link to v3: https://lore.kernel.org/all/CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com/

v2 -> v3:
- Remove the length comparsion in the comparison of "id".
- Link to v2: https://lore.kernel.org/all/CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements
- Add "tps53685" into enum chips with numeric order
- Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81" 
- Add marco "TPS53685_DEVICE_ID" with content "TIShP"
- Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
- Modify the comparison of "id". It will be true if the string "id" matches
  device ID and compare with type char*
- Add the length comparsion into the comparison of "id".
- Modify "len" as return code in `tps53679_identify_chip()`
- Output device error log with %*ph, instead of 0x%x\n" 
- Use existing tps53679_identify_multiphase() with argument 
  "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one 
  tps53685_identify_multiphase()
- Link to v1: https://lore.kernel.org/all/CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com/

Chiang Brian (2):
  dt-bindings: trivial: Add tps53685 support
  hwmon: (pmbus/tps53679) Add support for TPS53685

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/tps53679.rst              |  8 ++++
 drivers/hwmon/pmbus/tps53679.c                | 37 ++++++++++++++++---
 3 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.43.0

