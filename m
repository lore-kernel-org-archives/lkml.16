Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE225BF06;
	Wed, 11 Jun 2025 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641340; cv=none; b=nzQ3YTkvNhulpNGtiNdiXlU2lWkwXK0i2ZIgJJCK5MCHJanKpb42VLVGhoaGp3ocWPeR2+fDX2RYuQLUmb8nEPXPr+hiC3jzuCXlW73wQcsPbwdiYKnV89lOuxF2gerkkoY99bAs7sSA174Btbg1XIUIeSkrLNXDzyYmsX13aLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641340; c=relaxed/simple;
	bh=BFkoTQH80gn0XGOCGawAuDiVmIIV+UeV0+IN3DR1NnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jCBInbUbS4HX4UT5yHZIztFB6gzOFjalvgvfz8KXnoNXmwkhMmDojBctQJPH1UZngsVCiw+ww8gUWRPrTFS0MC4uhty4tN4EMzVPSnYegN+7NsQ7Be5na4BEXRFyBVPXCEj9mbvYcan4PVoiFVUJeQTIlHGUJCyR7MmSKXarg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaOa9g9y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaOa9g9y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3116db72bd7so7117142a91.2;
        Wed, 11 Jun 2025 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641338; x=1750246138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5kLuTPe1ZjtYfZALE1yPZ1I7y31mtKy+cX6Moc8i2s=;
        b=aaOa9g9ybve5arrce6zM6ZspQHcBOV2uu4/6xHzkgoIo9B6+2z3mZQKUH+VhwnwQjv
         I3ZF06xC7D0Cos+K7PDdZcmAl0U/PmdfUIpUFeqXZ2rKhrDPBELucWYq/3ryKtMoCe5N
         PwNXKiKq7/Ubbe8PSTeM6lUpWygRamkkUoLzQ8lePUPnoFLcSR+nuoi0hFAFCC5/rMXE
         ZVRNYTxgWK0CV5ri5VJx9T8NDmzOvmWj7At2bJDh/5UY4gn+uNDs3Ezod56D+CZmIyMt
         nGtI/8G5V4gfcyesCeuJdFqlWzm6sBLfsUv/b7b8gnd9ayzTRn2VoR+V9R4T6gzOchxx
         Ag7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641338; x=1750246138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5kLuTPe1ZjtYfZALE1yPZ1I7y31mtKy+cX6Moc8i2s=;
        b=oHKUTquyIO28v1wbyg2c42orc6uJzItVfjb31zyhmHLn7EdYJGR3onwLysrNgZVKJA
         wTfuOjEGNa7R5zuB4yYW3pr1IXZhoQZ8UagQ23mLjiX2GVvXXHNCY4GtnAoAR6hhvQGQ
         1aHMe1MYDaodZaR5hXXZnEvX1fGPbfS6sMQjSIPXGRniezyUokhKOmntMo4xcgN7x31t
         vbFwlCBkItOVvRj3rFsrEL+73mNp4lmctEm4c6yGNJjEf4+nLS05MG3X0d4RFWGwDR9O
         gYH6+ENP7mjJWfrHOsTIOTOlxvNCUHV8wbMuvIRoEMoPBPQP3erZOCeKlSI49R1Kyx3t
         bsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEWtE7hdqcPrB4TnYNI+veFhbGbSv1Q9R0cY1jDgFcksquGZZQKjM3eQWYpSgSJMsZJr4SLAhzLpaYWbaP@vger.kernel.org, AJvYcCVQZDkI7+wYDS/zZ2UlX+Xg4mLdIio8+QZg1F4QJvn1R3+SWoO9cfPjw9zBpQcNVLuJ6cXLJDN9J5XU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TPtfXeSBU4ivUzjh84Lz06wadYm+ppIStr2qx/1zN+KR1uz+
	zjX+Pe5P9vvGuOe1BKpBCnLrpl3SJ2ohA3dxJqZqDr2S4FMvrymnyTzC
X-Gm-Gg: ASbGncuULT1Ot03BIDqY0LR1JoHT+GVuDn497KfvD3kcMmkqzkfEDpwkPuMyBqAzsBS
	hB4jRienwWML9+hSFUDfcyf9hDj83uvE0n2afxCZapjxmRxnN8//TvQxHAtmQnbb7HLq//ZIYbF
	SDDCwDnLKlRlFt4H77Nzgc94GJkjFWRUF4uOt636xwj2hSXdV9Fhv7IzWZfI6C8p2VvDd4Js4dT
	rsmx/YSKP906cC7gpEgy+LEUcHtwibmnCPp/Nk6m6mHVRyJwU1RhbwbqRiCeXvYcQ+cxMhD5Nap
	qplbC0WQbBw99ExkPE9j9DWPnwS61teeposi+JHUwgrmbCXjtlF04ye6pV/YZyZQZZglqej+VSl
	ByqEr1BaLk5bz55vC+VYrBDeKSLge1sHkiosb2uLfXGvfvqH59udIier+agWgmObn2CnnwTkGtt
	k=
X-Google-Smtp-Source: AGHT+IGWw068vvXp3+yEPF8FPf8vG5yufFWpaOywJh8DgaLYGGbghT8z+gqFAOziW+6BeSzW7/P0rw==
X-Received: by 2002:a17:90b:584d:b0:311:c939:c859 with SMTP id 98e67ed59e1d1-313af28d147mr4395082a91.30.1749641337938;
        Wed, 11 Jun 2025 04:28:57 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b1fee63asm1082246a91.3.2025.06.11.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:28:57 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v8 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Wed, 11 Jun 2025 19:26:48 +0800
Message-Id: <20250611112650.595554-1-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
Signed-off-by: Jason Hsu <jasonhell19@gmail.com>

Jason Hsu (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1481 +++++++++++++++++
 3 files changed, 1483 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

--
2.34.1

