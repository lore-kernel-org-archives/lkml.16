Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70022D79B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383384; cv=none; b=dsIsfVro7cIP5sgtzPmgT6EK08QM/4b7cB/FLsxDg/9TfvEsbZ5DzTh3f8Tv3hOxpONq4JLi6HSXuKTt5Q32uuQ+S695c7QaE7rFXb9ErXpwSNqUo+uw9T5B5BKnNhGFYQN4E+lfbgGScrOpG7kALSyeHmYa6cD1kyoUWMeiLbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383384; c=relaxed/simple;
	bh=3oAqLdpofioLRO+ZMd7laToxcoplseFefLVEcL35UuU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l9XNKYwVAf8M0k43ea6XJdkOhLm9krwnrtr+VUaDeseVXxICG5pLBaIlUvqckYM4K5S3P2di6xB7kPB46PDe+c94BywryysHPvCPRl6fuXMT0f+p7aADbjiqxYsP0Fyp02lhQdmySlWdhMQ44XsQea+S2213Orksm1pmejfJ5/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ACFtu+XM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ACFtu+XM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2317d94c9cdso17368145ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747383380; x=1747988180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3A/y9lV44RNMvt/SwD6LadHVjF3D4qz0TtE5xp4LxU=;
        b=ACFtu+XMTgLH75rcSsUjn/stiki7wSCGzxcXYDijZTG1ICwFfggKJrF/jKaiosbUXc
         9Psw35dYAFdi7J/S3s+5QhEeF14bSDE4R7wWYERIGkn658v+50FifSXFiKpiCBRmRbdg
         eZHVv9C+LMw/G7NtpPCj02ts+SVS85fd6hSMJCTyaLiEr6ZPT+G0Xtyv9CTDAElr+GUi
         3KBWZJbSoCJzossvPvU2kntrR5HHEnbrZoNDaMqhD5Iuo3o7hSajDv+Y0eXBIPoc3rvz
         7IBi9F2ZQrNmCBF+WgFV//lVBRkxr3qpL42AG1U/kzakITmoLxIF+pCPAUJj88jPGJNI
         eksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383380; x=1747988180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3A/y9lV44RNMvt/SwD6LadHVjF3D4qz0TtE5xp4LxU=;
        b=gE1V8DiyPGFZXnqlWp8qUFBgJ15OKFbRRF7++RHTNqTvVBtoP9l4OYeo0tODgaMnGE
         XifiOrCcTHfNaAusCqfEteGNSfDcmIzTfTD9w8usx4xt8nrvc7FFa0dgpjEXsobi9EYY
         gZk8zEQlsNrUDZLIUBztcNrXuoQ3nL9iRDXGyPKNFSdzpGEp0+c3cZuI0hyyA4zFSvnX
         izB7RByVGEbIYMJ/OEl/TDwVJxBOEPDQvxu9oDIy+R7j2GR+9vb2kKrHLK0XK1LnU9v8
         pOTzieI1ljLNIV792A29G5AzC4SPWgTaknIz160180W20aWJcz1e7zRM0lU/2+riZ0hR
         sb4g==
X-Forwarded-Encrypted: i=1; AJvYcCUMhk6UGzlBMBtPfK3mIjgb+B2tLZOVFM1igyjOn5G3wgr6Bn7jPuJ2Er10nzwg4hUQo36S7bnf04K3KFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkiMurKep0vq02tYU11P4JYhVEGp111PImdPM2n4yw51sE0is
	mGq1l8uZ87d1VAcMmTwNjJxGHm2zVpKzEIjB6FjE7mEsqPoOkCH6mKANMh+TF/Dfsrw=
X-Gm-Gg: ASbGncuMsLwt2j9q9GVQ4amY+UoiFVb/BltUBXbqTyjRuztJPaHlEPdnthFHvgl9qHs
	HV4zb1GYIlwhS3SYxB/ah7wt4BXk9CUAduvCF+4r58AVaPls/F8G3e4OuzF9b6wvMqMr9ODa0AZ
	RYRl4IuGZelejozH/2oDW6A5zpTA1k5s2FskHgnCB/4MDxj0n9wP6Xd6KGV5QDgK6sEhn9eMnlD
	daoEGOgrmqrj/tgyCK5J/Uw2YkwF3BOdpfhnnisF5E5sF6AnCfXhwuqGVdmIpO2v3kKyu09CJ93
	FnNycQftbUF8WJ8OVic6X3iTKQ5OTeRxr/y7K7K0q2ewQm6UYz3TiCINXRXyQvdKjMHLYQvILJ4
	8d4QfOH7+JDAKPg==
X-Google-Smtp-Source: AGHT+IHQ2bTz8PCbIjboyHNgGlHzWE2OMhXaYM5Uf+vtwwDeH0Y+c6c2ytTxnCqAGRGryuYKc8knUw==
X-Received: by 2002:a17:903:234f:b0:223:47d9:1964 with SMTP id d9443c01a7336-231d459a55dmr31119835ad.34.1747383380431;
        Fri, 16 May 2025 01:16:20 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97801sm9397695ad.133.2025.05.16.01.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:16:19 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] dt-bindings: clock: ti: convert to yaml
Date: Fri, 16 May 2025 01:16:09 -0700
Message-Id: <20250516081612.767559-1-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert TI autoidle and fixed-factor-clock bindings to yaml. We are fixing
binding warnings only. No change in the existing dts.

Changes in v2:
	Patch 1:
	- Dropped reg and example.
	- Updated description
	- Fixed the subject
	- Fixed line re-wrap.

	Dropped clockdomain.yaml(patch 2 in v1). This will be taken
	  with prcm.txt binding conversion.

	Patch 2:
	- Fixed ti,autoidle.yaml reference.
	- Added constraints.
	- Dropped description from clocks and clock-output-names.

	Patch 3:
	- Restored the license.

Link to v1:
	https://lore.kernel.org/lkml/20250404014500.2789830-1-sbellary@baylibre.com/

Sukrut Bellary (3):
  dt-bindings: clock: ti: Convert autoidle binding to yaml
  dt-bindings: clock: ti: Convert fixed-factor-clock to yaml
  dt-bindings: clock: ti: add ti,autoidle.yaml reference

 .../devicetree/bindings/clock/ti/autoidle.txt | 37 ---------
 .../bindings/clock/ti/fixed-factor-clock.txt  | 42 ----------
 .../bindings/clock/ti/ti,autoidle.yaml        | 34 +++++++++
 .../bindings/clock/ti/ti,divider-clock.yaml   | 22 +-----
 .../clock/ti/ti,fixed-factor-clock.yaml       | 76 +++++++++++++++++++
 5 files changed, 114 insertions(+), 97 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml

-- 
2.34.1

