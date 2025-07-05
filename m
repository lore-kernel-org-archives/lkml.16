Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2126CE21;
	Sat,  5 Jul 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701223; cv=none; b=IwUJfFf46v4K3DeoP32iUuosKtHbcecNYfhiLxdppun7LcKJhoapNcQfhgWFBgqb36+akmW0jnjdHROYSu3JybzbGMy17abZGofRQTpgQ030MnsyfS03YF9KFJkuz9E0YXGbFXa3zSN+LwdH5UOj1177ot4NhEb4IsDtxmG1dQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701223; c=relaxed/simple;
	bh=R+iSI6sdCJdeUl0gxats286kau8f7kIZFSY9tvlWBos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CYcAtnkeOgowduEmujhhJutlVI6RBQJowkizRY8GDNnYlSmI6qJS5JPL7NM5xiCHN4W5W6FlZJheYjl/FaxvwzWCwTCuyuCdH31do82wEw/uGswUyktMc8wXUGziHUToI5vSEPYaer8/IdzR+/iw0Tu0h4UKR9i/b1RF9xXrryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL9G67Bk; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL9G67Bk"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73972a54919so1382058b3a.3;
        Sat, 05 Jul 2025 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701221; x=1752306021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pNVq0NFhmMGqq43JjiIlScR9xl4RowLJ7sMjICAIOQ=;
        b=XL9G67BkaLvVICzSxHTHAFeQY6vvITTC1iojmUWpYxhj89vp8NY/izQtaMyFmM39AB
         ndC3iBqpwkKUqawG8PSu89XTtI9m6uxZUH69AQsDH1l17Mzt+jpRmMpYTgYfvC+1c1W+
         vggJvLGj43NIrA3HWg24Rj/1kwYrlU62u+E5tcVHDW2qJx8E/tHAz17H+aY+VZxZkJlN
         yKcEPH4xDP1uTtcB1rMcd7atwchRVWgs7ZxEErZbBNgCIELHPyiAMgMuU+bEUWmQmM9o
         R+Xb5BqZQYHpNG3XEqoHkF9y3D7B19zqCMVRSV5DqGCW3xorK/Lp1WraV+IZvmfELp+U
         0L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701221; x=1752306021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pNVq0NFhmMGqq43JjiIlScR9xl4RowLJ7sMjICAIOQ=;
        b=HEWDbU+6DTSQ9hYY/CM9Ev9iWL8vVFY8D9ZXQYAIag9gt7U45tTky7wfxr+vEDJ6Sq
         RLhx1B+rWUZ6Hk0SFsl5u/0aay2vbLJoEFMSsP7LnQdF1Hiff7EyEKZsdQvCTram7ytR
         RITIW674/e/POWe9JupIu2pSqMb9K3KFgMW0jnle35eRxUZLtTnWNSo0Su3iIPHP9xy4
         vzf7VM8cluKkI/R6zPs6Y+yT2Mpq9Liyn0RBLimlY0ekTfwZojtzcRMj8Xh5gILYuYu9
         rKkQVIMG8sfokUQRXwF58MI5NsEmY/Gg6U7NArTt1h6T7EVUW+cjj1gJVZnRNEmWnkDy
         TgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXURHnOeubIrQjq1qM41GP0KBhRwlonNLVbyjiPtagGIIf6U8hCGtdjkYeEk5XuG6ZmdWK14frRPpte3OM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLpKxaDqoPNA70rnFreTWRpJwFS47RiY+0lZtKAFIJUaVPErMN
	5a07ppw35RMu1d9MYS9VU5Iglzp4ywZA2yGQBK0nYdhZJLFmzXBJSfnPl5Psnyw9fr3aag==
X-Gm-Gg: ASbGncs2mOrAYlJdJMV5KtygpUlasw+EA6cswq3Wva26p0bzA+MBCIixdrOfi6N12jD
	5Tqk6nhp723+1mlHMMSzZgNJ000mBGKG+SAIL8IpY0ZwwVQnokthlbjGHqkG4yx6cYTouKyQp9V
	/bTxSfqbhhFVpgMhTNqNSUrFmL/nEmj8JNDxCeiq1zCY/00raPs9azpADAcoyJBkLgmWKS+1wgF
	vB/Wf0ftO65UxojaNlnsYHsG1iRSUEy4ZmPORBg0YwKKL23LrgU968wMzCGxKL2ZiE07ZAppHvV
	j2L5EK224/nXhLGLj8kd8kcz1HRZA6mf0T6HoS4Im76ky4h5K0UUIoALzGs2V6fLeO9HPAQ9Amg
	iMaRqxC8=
X-Google-Smtp-Source: AGHT+IEHsZMB8Rt3ySNMA98IFcpj7ykAyWeeEOZtesKG64iloxS1vXwaT1pyycU737qfyAG5dcZ0mg==
X-Received: by 2002:aa7:8893:0:b0:736:3979:369e with SMTP id d2e1a72fcca58-74ce8841fc1mr5530451b3a.9.1751701220593;
        Sat, 05 Jul 2025 00:40:20 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:20 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add Sophgo EVB V1/V2 Board support
Date: Sat,  5 Jul 2025 15:39:53 +0800
Message-ID: <cover.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Changed from v2:
merge v1/v2 binding
v2: https://lore.kernel.org/linux-riscv/cover.1747231254.git.rabenda.cn@gmail.com/

Changed from v1:
1. replace "sophgo,sg2042-x8/4-evb" with "sophgo,sg2042-evb-v1/2".
2. replace "Sophgo SG2042 X8/X4 EVB" with "Sophgo SG2042 EVB V1.X/V2.0".
v1: https://lore.kernel.org/linux-riscv/cover.1746811744.git.rabenda.cn@gmail.com/

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (3):
  dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 233 +++++++++++++++++
 4 files changed, 482 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts


base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2

