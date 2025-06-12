Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B12629D;
	Thu, 12 Jun 2025 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688769; cv=none; b=CcUnHW0Mum8bn55swx9rLuoIS251hlbr1W9Z70Yv35HfPaSJKy01pU6cykonTiADuEwrsBnmflhWG3riG92aG+FhSBjOm5/RsNKf/xxm/pcMgvNDlXHIEYxwZy3uOrjRYtl29d2u54WsK3+YHatdYQ0q3yUY+Xa0RS6YSo+Ue7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688769; c=relaxed/simple;
	bh=gg86laQvQ7dopGnUWBvdIBXxp0diSYbmBjkezIxpKRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJZL0jLPFOsZPC/cpdCptC5+Ws+6iLPxNgiZyxSD8f50XjTzi6NztEt15fzjOwa4bqqbqc4qvnIf1nHmdCV9OCsm8SQbTxNInpi15wWi24DC+mNhL2ysVfq5F3qOrRwDbPvrb9JAdEjgwzEauwNdqa4p7mXj6twqe0VGHXW8jqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHKZ7sWc; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHKZ7sWc"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d20f79a00dso52860085a.0;
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688767; x=1750293567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=;
        b=kHKZ7sWcc3lU7qbEU3aD4iYGgtKoK+k41DIc8vTCxIZLxckJxIMqMQkHmGX2e2XEfn
         PNqnDx6IHOo86+k0ZAgJPO14+K0wBRYUU++585siHFg8zdMx/r0AZBDhFdoH6N0xV7L/
         PXOiO9Fr5wpiRODSKuAKhhTi492ITaKEDl+CGC+JIVY/chFENXUWuVtpjMO4xf1hrXr9
         7PC9ePf9jrzvzgzrpm9EnXRpMJlwKlky/lXEKqBI/sGZuuHwQNb0Lv5mmBXPzL1dauV2
         0JlKDlhFfgeNLmgyQH1t7BK9ceh/vYRq7ZIkDTkr1E0wDSI/EHnp4QLjpnN27EPjRS6f
         dZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688767; x=1750293567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=;
        b=ga6zq61qmZLfjGfYbBUv0+6cE7cSumB1I7JgcflHUDC+N8W+cDpYEaFFaEx8M6Lc0n
         3BVHyroHJ394lX5/nkaPRpl8UiwafB6P9oVTQix2gYzTkpfb3ATrfwupBdZApuUyYOKU
         dE0ilrxDpWPNfRcYUSqdFwp8dnwkccmf5AT+tYqB66a319ptcxrjgID85FyIDXGDSkxW
         mSAhxlm36jPGFsld4CCeIspU3urYDAEXc3j0z9oJM90va6mximPdimtcICejMrcvXO70
         YlDeZQW6UN2SmMJVA6kjC2iftKWUmb5CTLSBmokpMRRVik6/Ynk8PAW3u2gVy6QNf+QN
         XJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUcqRNXFTK8DBEbqesaqTCYW9z7K5ZTji0Lx4vTBpoDiSF6ktZqxfucxSTLhzVjpLjT/SqsVFyOpxEr6dvw@vger.kernel.org, AJvYcCXe/7d3BwWse2uB6uZLthSHhT7kngmijZwwbyXcUjaaCn5GoF/eLuJyjDa6/7lwkweea4GmLVU5tyDB@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlXC+JhbuTC90wSnL0cxM4PPv/tk2fUNJ1NtUsZTe7TX2rSxB
	1d6WO3WB7+/i37gP24+BRCVeS6rkiHO1PxWdEfR71hKhs3OcvxkibOq8
X-Gm-Gg: ASbGnculUQKvlw9xaqNZcwyxbEghtMZMq3GEkwWvaMQhwiBugM97gq4hCyAFhRdzLWK
	mU5gG1yCTr+xAjzUwu5EhJy/SsFGx+E/HHmynct8ygbsehd/o4+WJEsM+mTsyOW+lZV+MemTx0a
	1Q3NaMjoY8HlhucYP2fk3RqDEqSuYKt+w9MXw37JR7xlZRLrjpE0OWVgS0FviivBsM8l3UGOvbX
	VbNSgdjl7EAvB5lIFP+JJhNHoTJkWP6Gpcv7ifdYBKRKaIMVAPFSENC/nbNV7oFojh2BdHcwiJ8
	BvCNyNmnCgNnl4PPsdZaEHm17OQ5d3P1ekQMAKylwjLF++6CxCzQoJY9Ldi1OTaeP6pBI7BxGEO
	EH26INLnEltGzqkZct2IdK/DEgBJs/9Mdl0rSURKIlEMEZAg=
X-Google-Smtp-Source: AGHT+IGavGO8UOvSglJRlraCBSQ61kmbOdGvSpPmLRVt0vmZVnRVxF+/QqyPrkh4gyH41hL+GauK6A==
X-Received: by 2002:a05:620a:394d:b0:7d0:a0f2:e6b1 with SMTP id af79cd13be357-7d3b2a5946dmr238452185a.32.1749688767146;
        Wed, 11 Jun 2025 17:39:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:26 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/4] Increase i.MX8MP VPU
Date: Wed, 11 Jun 2025 19:39:18 -0500
Message-ID: <20250612003924.178251-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the VPU clocks are under rated, even for nominal ratings.
Fix the nominial VPU clocks and clock parents, then introduce
the overdrive clock rates.  The fluster scores don't change,
but they do go faster.

This series was adapted from an RFC from Marco Felsch which
was setup to introduce the VC8000E encoder and extacted the
parts that affect the existing infrastructure.

V2:  The only change is 4/4.  Patches 1-3 are all unchanged.

Adam Ford (2):
  arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
  arm64: dts: imx8mp: Configure VPU clocks for overdrive

Marco Felsch (2):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: fix VPU_BUS clock setting

 .../boot/dts/freescale/imx8mp-nominal.dtsi    | 18 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 23 +++++++------------
 2 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.48.1

