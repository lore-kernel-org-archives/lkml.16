Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128213FEE;
	Sun,  4 May 2025 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355581; cv=none; b=lRTW+N2/FScgKulZ6+hL+5IGjhxiAvMuBBFPDk7W4r9kUcpS8RPtJOVFNFvD9FLZ5Bgar8e6XKclD3nPGYWJfSuBhQTZDiiTnSvkc93cM8jixBsmh4BUdJ+9NQUKlS2+BokM1X0LTWZLiL77Dp+vf73Urbd6AE86UtkgkcstK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355581; c=relaxed/simple;
	bh=Qwx6fv/GqSvqJlTQbWvsEhU47PrbM1JGclCAdgShXfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ablJ5xGCcyVRPh7VEoAH8aMP09dnXF3YrKpcV+ayQPrcLN1VUAmwPEowHlUFO44jmXtr65saf3UQzIJt3sNwn9JbDtLHgCGE0gVT0gWptJdH3cX1zu1M3tsZi+iCtwao/KxakGIxuC0vdVGqWsbEqYwh8JWPwByNmA5ihmidIc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnlH+jqC; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnlH+jqC"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47698757053so52616781cf.0;
        Sun, 04 May 2025 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355578; x=1746960378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq+V10Dns5XsDfB+eto5dT40TdHnbLnPhgKmmJjTtqo=;
        b=gnlH+jqCX/gNGIzp3LtXQ60EwyHL8PFaqw+ktvvnUilJb61Z5wmY+YBYnMyaL8r/vp
         kQy47DkKb/15thGA+cbtnEs0JFMNEnXx1yfAortjN6arBDTnsIrakCaoyeHzNbVj7Rne
         Q+Tcnd4sLLPOowM4wmLzok7SYkYlTJJX1VvvRPgmwMoReDl9ju437dEuCTesooccVPMj
         k0PGViaaDXgUnAkhU+R+VayjXHuYvYQ6P/GcOTeDdjCC4UMNwlWjUlTIpRlque99A3ix
         7hJ2f0vZtykthMEFE+ZO9thPcBVP12dwpaCnZlpU2H74eTmapWmmKjIJW8J/DQjVbE1P
         gJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355578; x=1746960378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq+V10Dns5XsDfB+eto5dT40TdHnbLnPhgKmmJjTtqo=;
        b=kJSh3aiUqiVbA2T03hIILMmeGJJlY7GzqDxSMvop7Wdw4a9eLquzOxnvEzwlmbvYB1
         FP+VSh/YlheSPv75LNFlP12PFybb5PVp1grvoxVo/vG3CAYT9gQ2MNsTX+q0lr6A2YOn
         ixssCSTHT3psL2AhQhVzrHX+oMjGURq5R4xZ4eHCXdfcLJl6urRccFB4V1AriDRzP/Wp
         BcfubCc1UCTpY/2dMJ8MGD7wLqXYnw8uK469oHS+DqA5lc0IioDV7dDTFHU1m34+ZRu7
         NztpsNxJXekO9DaKqoYzAXZXwVD9oTgX3pvEzjnsaWZvp6vrku6QWEPt+CA9P9BRjTgg
         4bVg==
X-Forwarded-Encrypted: i=1; AJvYcCUIx82K37KHP+ZzRubvU1sN104KrT7amjFGcTNItQnLjvnHoJPCCkLkQLNb55ZoFZ7LHgrCRtn4oDVu@vger.kernel.org, AJvYcCUy5Yjt+QPS/KrCAyGAuPa2Jv5SPYnALFXGqEfaNk+PQVlxtdJJiP8QnP/U8Ky59Qpo+AJ+lgYydzYJ4fpp@vger.kernel.org
X-Gm-Message-State: AOJu0YxnxUSLX0uf/Qgtb/0LneC/ofFhpzsYDIS8AoQdb6NsSsYGt22J
	8HSDlN0NabvDwBS35VX1ArLiaXWQdHRUwHUOTbtGDiBnrwVei8CI
X-Gm-Gg: ASbGncvNch+2v1yyWhBgsSuCjgBd/DMUT2EvmE7zw392NjMhUMRa+JrdPqBuPPXepAp
	k2GwAoUHTP/W14EEiOEv0zCI82yTxaZdKiyEDp0tmWbprn2gGj+h+HwoPlGEGRvpK4z6n+0+hg4
	4fTRGfD17rK6vj0D1wSJyzIohS68ErkYXoxikbIHHMVUW8ulBlWuxD0NjFeOB7WrzKjJlpZXGaq
	474+/Hd+qDQbK3YMKUjel/d/RFdPlbKuFpEwZPH4fcY60GGt+ylDvate/gSRih/Ufclk8n+Je72
	oLvU5OIjNzyiHUNj
X-Google-Smtp-Source: AGHT+IElXOJ8VLrJgB2ldI5hP8eRxH52DW4UdnhojjCazX+wPJrTxe+0SKD3E9HjgZkTHUgG8JE3eg==
X-Received: by 2002:a05:622a:1a29:b0:48a:d979:9a38 with SMTP id d75a77b69052e-48dff3e17a6mr55044671cf.2.1746355577750;
        Sun, 04 May 2025 03:46:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b98d10309sm42842181cf.79.2025.05.04.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:16 -0700 (PDT)
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
Subject: [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Sun,  4 May 2025 18:45:49 +0800
Message-ID: <20250504104553.1447819-1-inochiama@gmail.com>
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

Changed from v1:
- https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
1. patch 1: reused sophgo,sg2000-clk for sg2002.
2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
            commit message.
3. patch 2: fix wrong data for sophgo,cv1812h-clk.
4. patch 2: remove compatible sophgo,sg2002-clk.
5. patch 3: adapt the change of patch 1,2.

Inochi Amaoto (3):
  dt-bindings: clock: sophgo: Use precise compatible for CV1800 series
    SoC
  clk: sophgo: Add support for newly added precise compatible
  riscv: dts: sophgo: switch precise compatible for existed clock device
    for CV18XX

 .../bindings/clock/sophgo,cv1800-clk.yaml        | 16 ++++++++++++----
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi          |  2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi          |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi           |  2 +-
 drivers/clk/sophgo/clk-cv1800.c                  |  2 ++
 5 files changed, 17 insertions(+), 7 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 94fb3d26e017cf839b4dcb4bf85624614a94b9ac
prerequisite-patch-id: 8f4a8bdead0e4e3d6904adbc0fd150b7dffefc85
prerequisite-patch-id: b30e850690903c3ddc3d8bb77a99e97934dc9dde
prerequisite-patch-id: 6e1117694a53a0059b145ad4751ec204cae0db35
--
2.49.0

