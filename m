Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C981E5B6F;
	Wed, 25 Jun 2025 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837133; cv=none; b=M7icv9S1ZULAI17SpMmLiiXLmM4I2ec5uLKXfnEA1qF3P7xG6yZpW/+ml0UavQjmvh4K82AQuDp1eERqWeEfPC90HtFbABs2/iSsu5K0oq0Wr9ABJakh14q21n8JWQHF/8fYXKcGhFdBe2I1myp7RjXKfn9vFAocYN4J6+KLAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837133; c=relaxed/simple;
	bh=G4UH1AtsdvMQkmaLooTD4c20idV/ZS4iK22NQyGiJpM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=U1BHOm8nBa/Hw1il46NWK+3JTsBD9nPKJUJSwjoMBUJe9Fxj8VHbcxuUyNTDz1c93rStHZlh0I1z+rI4mSu8hQeyJMJ+gGlUOF+A8hSfdOKYsOvykHJl47km5DLxe0ugru9+pyRSzeBZQ/a8Gbkcs9hhx5QHlPU65K/Z7tzAWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsDInOoK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsDInOoK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363616a1a6so53902155ad.3;
        Wed, 25 Jun 2025 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750837132; x=1751441932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kG1olUInn/LVZERQ5W1mrbwIx3yXWmY5X23lP+cvHI0=;
        b=XsDInOoKld4oG5fd7u/QesmWxfv0Z4jPp1zXytDvxpFfLdQUfEkl4FPz+2Qu652L+H
         WjOrwvQsSVSaVnUZfgdUUNmxWXGz0E5FaA1HFL84YITu46PYV4msQPBUKFz1jw1QfGci
         POrxzk+ojMy1qorkZRUgL4Ol+FJGmMKtP0pRiqBFDac/KzqqtzTbSh/UUMqVQxsduuYw
         e0qGlMR+vDD4tv6RcQ8Y16IgBDRJYnGPRoJNkNWe3hF+kGOWTUXWIdwPIP2XUN+pm3ye
         6ZsIf03Sp9W+u79ipIk4zvJwECZDL446QXlDl51S6DRcLsvZmS63XrZgJzvXXcTewv6v
         sj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837132; x=1751441932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kG1olUInn/LVZERQ5W1mrbwIx3yXWmY5X23lP+cvHI0=;
        b=NeCz2u6yF1b1+ei+WS7saXVtOzl6y562eBsTONRDjzTRChs5+L2clqSEIgorFOTF5x
         omYI97qtrGKjRjdb66ieHWhkYrn1Le6acO4vHi9YWrgoPXtRr0iVN0fh1KU6dLTAO9BO
         RyCGHZ6g8L4pduqFBylvEOp0YpTuahYvCBor71sXUOhTHJXj49OfUHNw8bfvRPo3xrVv
         ExH8RXlC4EDCH0XElXczYw+gdv2hkiuBzPh6DAF3ROLMIPLrTYBrb0DWkp/wK2MqZLjw
         dkfzwhgoY9MwOlEV94YdXAtXNDkuEQim+YSUfJO8aKNkTZHLg6z9fPJyRVBtIGmFH3WH
         3QxA==
X-Forwarded-Encrypted: i=1; AJvYcCW6sd/0ffINxhM3jBXCrlD5tLFujJ1GdPIkDcPCbhG7W+4DaYsnn7eunfzb9BSZj6KvCt+6CC1P2Mpt@vger.kernel.org, AJvYcCWG4WnxIdWwWfYp12LThlCX3VTllR4c5KyNQXNgxHgCks46ALp0XP+TPvfO/54/0Fsz/1raJZMihA7ouDFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LXHjYzKjGwHQ3XPNv34+36P+Jl6+oeu7I+P7Ia9ZcS28RYWk
	V1pzXzBDnDRh619O8Ak1l8ZpaoGk2oXpxVQ+KbeJ0AD2Tc+qe48eB7KAuW3rgq9IJVw=
X-Gm-Gg: ASbGnctyLYiRZ96jzIyMrT+QVUGQ3nF1bKLrmiccui7D4VaVjKjBJuuahJzOq5V7E5p
	KBgWNGueEYplB24TckQE8RXeQrfOvZlXZa3vL7Misx5/45Ydj8nOC4ZCkYcYjqzrvXzH11hybcS
	JPgzAVz+UWaGEHuMowkS0OuiErhkZ65bCX/rc5CDIXWk0LXPmHWhriC9IjtPf0Im+QphRCytoTD
	rEXYXbvUokc0TF7y0cigpLUBIgRmC2D5KgN1z7OUWqtJ03ofLaVmaay8LT2wgUK+FW+75ji4MaX
	RSd+bFNj+lZUBY8Gf7LwKUjQTbyHV4Rf2HnlFGP71WXe55rXkDueAhwQttidE38WB6WUNgGnsEQ
	vi555Rv1NfJvzoRGryMAVQgSxZRozraDBhkCr4OYRif3p9kdPUH6697YL9DmWPVDRO1vwIOViet
	gE9kkkmbFWOdcTng==
X-Google-Smtp-Source: AGHT+IEAYJ2SDUHupwKAlisVD3ai/2xripja2VDUoY9Ul4K/z1BlfG/iLbXNiETNKFpAqA+j53TumQ==
X-Received: by 2002:a17:902:dace:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-23824079303mr47397585ad.44.1750837131671;
        Wed, 25 Jun 2025 00:38:51 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-29b2-bfd3-aa15-d345.emome-ip6.hinet.net. [2001:b400:e389:b6b2:29b2:bfd3:aa15:d345])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86a3083sm125374285ad.195.2025.06.25.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:38:51 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add Meta (Facebook) Santabarbara BMC (AST2600)
Date: Wed, 25 Jun 2025 15:38:36 +0800
Message-ID: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summary:
Add linux device tree entry related to Meta (Facebook) Santabarbara
specific devices connected to BMC (AST2600) SoC.

Change log
v1 -> v2:
  - Enable mac3 node
  - Add GPIO line-name FM_MUX1_SEL_R
  - Remove 'pinctrl-names' from gpio0 node
  - Reorder top-level nodes alphabetically
  - Reorder device node properties per style
v1:
  - Create santabarbara dts file.

Fred Chen (2):
  dt-bindings: arm: aspeed: add Meta Santabarbara board
  ARM: dts: aspeed: santabarbara: Add Meta Santabarbara BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-santabarbara.dts      | 982 ++++++++++++++++++
 3 files changed, 984 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts

-- 
2.49.0

