Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450B2010E8;
	Mon,  3 Feb 2025 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583112; cv=none; b=PeNSetWyF3TRgSS/Bxxe1/jI0wfbbNMujtRgR06GbshYaEmzM5okDX46kZZSqE4QEdjH7KMJSN2gXunenRl2D0ZxV8LvLLrU47hPH6vMkYVJ6xfeCOMDcnbm6opRVha64YtxJOpZK3sCkUjWKhR7JN75w+v2LSruz6KsgBfbi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583112; c=relaxed/simple;
	bh=XP8IRyDmZh10co9TViUNR08fqaeIzLLfB8HFj8AcU94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4eYGZq1c24LTnxAyAYkq+yXtO/ChbfZvYRLIdNqvLesfKbYrT7wmxchi/2gRUy98JFpL3yyFniQQDWKYLbXKqic8rO1hP1AQ7QEVCxYX15VixmOvPXClVCxVFJ4LO3AlN1+tV/9eXp0SkcTbCLW3XSZSRpqtnZRFh/6X3lgN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5yVoTcz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5yVoTcz"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so7012598a91.3;
        Mon, 03 Feb 2025 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583110; x=1739187910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=;
        b=R5yVoTcz2S81y8+EDNwwGY0Mo+nfr2ehC5NNhnF2nIBcGOkWLxD5iyPnP0uuotAV03
         01a0UBnBRZfglRFAqhhivvFY9afeDJ+7HElyQ7xbYSRWqZ8ygrv9PpC32vC7dbUixjX4
         ZOOfSdECScb2b7kPKTw6CZwCcIYGVPrmQwSHFMJ5Nbsc3owO10xkQx3y0jX4NMwXII77
         3SJloyU7tP/S+1cjxjElaj/mdIYJbAGovntTkvheYz5Xo5voyRWG1op+3cX2E9sfWg7P
         Oy2T1BgwBK4Vig/9kUQWgPBlPTwVsh/GNZk/hwi0JspdGvFH/72nZJeSINl9v/TId8gU
         zVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583110; x=1739187910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RA0XtAJL96WJLxRbWatCDndiWUNj7K4Qgw/hFBCvBuI=;
        b=tdqPQ/M2rUGPKVfqID/4xm2b9LGrLRjwN4J2AbYSceAS1whALLZu6VHvIMf3xnh5TS
         YalbnCx4Xeodm7vJ4nGtRsoR6a5pnpE6OmB8kYct11RNiNtPnuYvIwbeg2qFIa4h+JW7
         zJHCKgzN3cECgZJaRZ2beYGpxnZfz45YpblA5YjGeHbZt9lXwuZdtkGYfJZOR3MU4BUV
         KHDOTnZTnarMQtnCUb4aNcDvKQaZvaYitC9dN2pGp7vOLf69SNiqft3BAaMdAhtD1MJa
         roORojxeM+u/zEuqKvSuQZgX9gd4ZyLcIpSJ+g0bWJ+dz32XY14TcZfFxqU2EFLxrkUO
         4mAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXNSp8WqzjHea3B1iEVNGe/GWhve82EHHPbHndWLIWFSr0bHaUeKMS6VYCzk/6RjIE+oJdnOLYtd7YIBt1@vger.kernel.org, AJvYcCWqOOypQg3a+BeY7xJoC6B/puTB/X0b3ZbE7Chy/vvLICXTyk4cxXCV8laeMAr3MbHBGWMeM5r9Bm3C@vger.kernel.org
X-Gm-Message-State: AOJu0YzinO9RPc4tnCNDf2QnMzuke331MKhdjmeVOSeB5+l7PfuLA3pW
	jGjaEwXyIZ/WqrpGiHOqEd4FNV28vaUg9LGMICMkTFooSRmt1Q477plP+MGT
X-Gm-Gg: ASbGncvi9uso1wfj3cJTbpdHVlkI28md/HieekSnogimg/enPtaqfpFOF4EDZ8wXtHB
	EuZDYpc1WJOyDFTz1FOffqjlvZ4tvXQl5EufO/IlidHcfGXelrp5kRH3v7Q1MewNyTjQINHo3hN
	y5qHBh/pwjB8RZe2omLUKZV6uJFA/8w2rvqpZidJMZZKziKOR7K/uuboQPXsC44eFsiq9ZG/597
	N7yvUznqitc1MdvFs1VeeZRthbm11b0nyxanL1Y3aMuQPkGx4j1RS33vr3We5PHelsPYI/VP6of
	E0CAQGB15NG8Jhli
X-Google-Smtp-Source: AGHT+IHHjGHPnhtBshFZlL0STf36xDX/jcGjHEfsZF68knOtHxu3Ihb1HeH8FtH6IcuizJVxYRGNvg==
X-Received: by 2002:a17:90b:2711:b0:2f7:d5f8:f393 with SMTP id 98e67ed59e1d1-2f83aca3021mr31267475a91.35.1738583110013;
        Mon, 03 Feb 2025 03:45:10 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:09 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Aun-Ali Zaidi <admin@kodeit.net>
Subject: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon,  3 Feb 2025 19:42:51 +0800
Message-ID: <20250203114417.16453-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

Changes since v2:
- Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.

Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinchenmi@gmail.com/T

Changes since v1:
- Use imperative mood in commit messages

Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

[1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Nick Chan

Cc: Aun-Ali Zaidi <admin@kodeit.net>

---
Nick Chan (2):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices

 .../devicetree/bindings/arm/apple.yaml        |  41 ++++
 arch/arm64/boot/dts/apple/Makefile            |  16 ++
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
 arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
 21 files changed, 527 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

