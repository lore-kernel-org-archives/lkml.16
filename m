Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1E12DC773;
	Wed, 30 Apr 2025 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978992; cv=none; b=C2AHMYTuVeSt7IMwZ/MSCdIGQc6YRVWMqamnAuARqu1FNRPeFeD5dNT6iVnO0ndVPXVnnLV1ja8GWg9nv662H9SebnjD5rrdWhke+iFsjVdMWsGRH6DHCgM3Cq2uyvFIkrBmoLdlfinmu5oGQZAatMaloDcQByh+FPmdWpgYLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978992; c=relaxed/simple;
	bh=dJDRfGSDRxXopbOKTfj5XmSOmmNS7V2PF5CY2+miZBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6FhU4C9oH/8EuHjRTgxV/AcDFria2xn8WnlFLG1EYCYKgnsfz8qr/hxhhLimLzMl2vY5LnDI+eWwIPYS3b5zIkiGdNRQEz9bS0LcEh8zlh/Zn1FuNkFnk3Xqx83nchuFFd/Am8ziE5/RNLPZrxmw7i1IsQFQitl8rmOr+rU+Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkWbyyU0; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkWbyyU0"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4775ce8a4b0so133670951cf.1;
        Tue, 29 Apr 2025 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978990; x=1746583790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMRCqnYomW+wsK1zzIEugxafFdeEE4BP1eOXuKoDm5I=;
        b=JkWbyyU0Jonk9WWiTWe0gl0gGkp+2ale50mVksnQoAHQRiEdKJfC8rOFkdceTojNjy
         dmVQmZSraQcMSimYtSciukDfhriWLtGYJDY+2hIoee9Yt/f6PhcygV/yCQxyVNKfxUwJ
         QTozA74hVY5XS2h004l2yeK9jjgMBysGbU9zgG8DB07TpKvWB1czp/fUu+xrjjVf0mh+
         /3hd6a91LIFqG0KJYstzywJPXzKUeuSxU3rKpc0M0g9h/eBOSjBa+DTtxuCoahW2V0R7
         XPkeiH3nOK0WsYfiYGZoqzrdmqxwEnAWhC9cBdKW4RKNeLnBWS3dUnH13JVwKmaryZf+
         eLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978990; x=1746583790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMRCqnYomW+wsK1zzIEugxafFdeEE4BP1eOXuKoDm5I=;
        b=USjaeK67wxTLgeImRFS+HDWoAW1WuhLRNE870EYTDGvjrepwMRG89PNZyytzNZlU3f
         S5I8Ty3bqkp07HSNJAvWMoq9f6lyB6M3butYrueDJkGRSyJA4tCexPFpElmAVoj6IWP1
         IzseSWoxp3T7ZOFAGgFdfD+1LOl+b96wwJnRsbORMaMa2uQgPdNKbG+ZaTMMSQ3FVjZy
         EF78WrUWLuNuy1aAkW3IVM2ImC8rB0yDECN5HE63Epk6ntvxdNeuBwo92qQ50hqT3kSv
         lem7MZxQH7z6PUUSH66OvGSZqk0+EtZVHwD3QXmhMFU0GJd5Oi7NGvGu0mekhA4aN9hH
         Isqw==
X-Forwarded-Encrypted: i=1; AJvYcCUfCgaN2Dxe0rbKSeWSqcG2vnAxyRCQxV/WR+xohU7JqrWYchZzTxXIwcEAS1pUnO81LZXx3hOaYsJy@vger.kernel.org, AJvYcCX+LBdBIkAOVpNxqWhnj9wSSw+bA/CTDB8sCKVIM/MXHB3grQBuTVhefH+GiYCxBaDO41xSyewtI8GwMqpK@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvyZ+hZhRpkxYN+nOVBw/riCmPj7mCvugDYwLlc+JlnrbDj43
	FreMFbS9MLZJj+G7Y9ZjYKugGxVsrJanMNPtIXZ4hisIGxbdwKFq
X-Gm-Gg: ASbGncsImJCO5FizhD8EAV8TREY26Wn+2dBMZkxDOjGN5onVKYYLVRwxeum6rnKGYwr
	imQAx4MTNRk66kZhJxqZ/sWsPld+B2lXyNdEbLuLzAuvy72ZfPBGecfp+6vAMw1IvXAg/V/TaJB
	fMo2/NWGcQJbCFmcc9iwX3TS6FCWzooDS++M4KcYXuWdo9uBN6xvoeYw7U/uTzMeLHOsu/pvjBO
	7sJW0LtA7tchwQTxE31mIY5WGAxXK7LdwInUSXMlXHUoujqSTNXgR6FNQ22yVeI5V0A6PTmoKip
	T32M0EAblyumgAhF
X-Google-Smtp-Source: AGHT+IH3QEcqlp51tOnN2l6ZLTNjrQhnIbAtp++1IB7gybN/d7hCg0IFcRClQaapkL+poJtpoZTgVQ==
X-Received: by 2002:a05:622a:2617:b0:476:60a1:3115 with SMTP id d75a77b69052e-489e63d86fbmr13994811cf.33.1745978990109;
        Tue, 29 Apr 2025 19:09:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47ea1ba2868sm86855891cf.74.2025.04.29.19.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Wed, 30 Apr 2025 10:09:28 +0800
Message-ID: <20250430020932.307198-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The part 2 of dts rework replaces precise compatible for existed clock device
with old wildcard one.

Inochi Amaoto (3):
  dt-bindings: clock: sophgo: Use precise compatible for CV1800 series
    SoC
  clk: sophgo: Add support for newly added precise compatible
  riscv: dts: sophgo: switch precise compatible for existed clock device
    for CV18XX

 .../bindings/clock/sophgo,cv1800-clk.yaml           | 13 +++++++++----
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi             |  2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi             |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi              |  2 +-
 drivers/clk/sophgo/clk-cv1800.c                     |  3 +++
 5 files changed, 15 insertions(+), 7 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 94fb3d26e017cf839b4dcb4bf85624614a94b9ac
prerequisite-patch-id: 8f4a8bdead0e4e3d6904adbc0fd150b7dffefc85
prerequisite-patch-id: b30e850690903c3ddc3d8bb77a99e97934dc9dde
prerequisite-patch-id: 6e1117694a53a0059b145ad4751ec204cae0db35
--
2.49.0

