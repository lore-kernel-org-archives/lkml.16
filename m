Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482523BD00;
	Wed, 11 Jun 2025 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629133; cv=none; b=l40bDZq9bUqctgyq60leCAwHmbJkKFqi9dT3vrR3vb5UBBFjUNvWpk2MgKMnBKTcU+WOw31lHEr6AYsEjmFs7PKp2obD2RnQx4chLUE5G447mmRVhSRpCWhJRfYwQwLNiZnV4OeJdjnLy/UdeYjOUvdYy8U82zy2skWrQKbzj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629133; c=relaxed/simple;
	bh=fZcOd1qc6MTZU+G2HIefBe7Z+62xXPNOnc9ubIYV2rQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vF8g+BilTypIaI3N35exHZFwPcwkCJ3kmbl/XrgSWcH7mE40Zu4lD2QYbgqzh1M+/XEHqCRAJYRW2H7IeGlAldPyAG+WkEUuwkJ2djhJ0KWi6m3c9xJM87Uf1Ez2nsIqt4rylV6a9hifq4wnzvjr+crm++TCnViT5eA3jzVwQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkx/H+NI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkx/H+NI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d366e5f2so72363085ad.1;
        Wed, 11 Jun 2025 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629131; x=1750233931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj1zenE5stas2VJD+6DRjlrRKD4iBr3hZsqLVnUv8iY=;
        b=lkx/H+NI7iXtSfOcm3GMML2AsUuzO61AdTAYPS5rWeulhKTS9w1eEPJI1aNRfr4MwF
         Zv+2BPpYc4yzqU8YfAtHTAlzug30quyokpAfZESh2R6XWXNBP9MIBOXKbrBqXsmRwglt
         ZcrZhUeii7Ux8ysuRulBc9TaEWJHXp0f/idcRsxB7nP9kC94E5R5lV27FtOVjeZVWmSa
         zlhwEHHhP3PEMfr8/GYuY3zLZq0KMxQPSuoH4iGGzU6Q6Ajta+zQTWqS8mtLzkisO3sA
         A0rn3Rt/4OuaWFbP/9ZGrwwQPdMfv8d4ZqAoiEdqHACfCJIj4bn6ZoPDhOlgozTR0ok1
         fsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629131; x=1750233931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj1zenE5stas2VJD+6DRjlrRKD4iBr3hZsqLVnUv8iY=;
        b=Zbz2+U55wOD2k+ITUvAu7hUokv0InC7uS3geMBNhvPaGFzcMUVZNxyo9EaJo6ccAJD
         0aNsYJAex+zyf49w8ZIB5EnhZwFW0FgMnzYXZxy89N7lpND3PqfOTAfbffut/EXzzaEp
         3PKKKYh8lsbjNUa6C7XBMuBUy5/oY2vKGa/jjGd8fnl8zTnnQW1dZRpZ3RVfGC1TRpG2
         s9w15u6ZWlR4pzUha7LuFhIZCmnV2wHsQXWsI5Jl6nBTrkskst+SwapXPVeuerlS79uq
         zyX3PvNzIg9VVGaw6S6Dr/Wsbh+PK/6Xl2zDT/qk5iVSxvDWcMqBzJgexwvLDUeFdpjP
         mX8A==
X-Forwarded-Encrypted: i=1; AJvYcCVFuhu0duN5Kh4Dlm1QB7cS4Hb5aG9/+eAn7B7WCvgoGMBRVtEdFsXCm6s3hgIwdSkQpSh4hUnxv/+4JsL0@vger.kernel.org, AJvYcCXs5eJmp3HV/PplCrIzmcSAnrYM4U7yNKP9IeXy9cbrQU4v0KgvLbHz7aBx8HMZ0GRrhCeNS2kwNofw@vger.kernel.org
X-Gm-Message-State: AOJu0YyHNYZCP3s8aRTslt0l0G7mLc4vo1q1Aq1Pei+v0TyrU+uHRFPd
	yYqaJ1loyK2uNFwmJAT8F5RLNtDa8qmMRrJz/LKCjlDSyJoVahnsQxue
X-Gm-Gg: ASbGncsIxkkPq3OtzY0Pegm7nCuxMWCRNRe/FYVcX1UoXRzNYSPLcb3MCsvE98cLFw9
	gMfNr28h8KxzHDVP3S3JUg5qvfr5ucyNb3v7U7upfBCGAT7SI7SUDG1TGlntli0N5SmR2GJqYNF
	VByH1hRumSPAzSQh2+PsHkR8QBYIPqbV86UwZkeKOmVQS6QmzJwlrdpisZo+46vx254SSqVG0QX
	xLdbdqLSdzqaeajIw1u1WBA4zidIHIQ0uLfoYUr0oBI+vV73K8zWrg4Q37trNGz4OvMBB7aIn4/
	Tz2Wwn29pVXM1lgxfnJpA0vaIVcUhjLVOOVuhs4aUgqa7fIIZF83knmk7Jqra8IRbjFR9ssxPaq
	qiLcNUcLfI93r68NxsmehN8izfl6BgJQwCPt03Oyq1+xGsOHDAL42fKZmm5CcL+mmtU7e3dhGOQ
	B4aL/g6H/1AsG//kHS
X-Google-Smtp-Source: AGHT+IGEE0NB+KOJm2lcRtePsnbhbM8oKjwg0jXC41etm70J3PNq57ezKYYToT/robpvQ8dfHs0VAQ==
X-Received: by 2002:a17:902:f645:b0:235:15f5:cc30 with SMTP id d9443c01a7336-23641a9aa11mr37444245ad.16.1749629131598;
        Wed, 11 Jun 2025 01:05:31 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:31 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 4/5] ARM: dts: aspeed: Harma: revise gpio bride pin for battery
Date: Wed, 11 Jun 2025 16:05:13 +0800
Message-Id: <20250611080514.3123335-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the GPIO bridge pin configuration for the battery circuit
on the Harma platform to reflect the correct hardware design.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 25b873ace2ea..fb026c8fb0ee 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -643,7 +643,7 @@ &gpio0 {
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","led-identify-gate","",
 	/*V0-V7*/	"","","","",
-			"rtc-battery-voltage-read-enable","",
+			"","",
 			"","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
@@ -728,7 +728,7 @@ &sgpiom0 {
 	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
-	"FM_CPU_CORETYPE1","",
+	"FM_CPU_CORETYPE1","rtc-battery-voltage-read-enable",
 	"FM_CPU_CORETYPE0","",
 	"FM_BOARD_REV_ID5","",
 	/*G4-G7 line 104-111*/
-- 
2.25.1

