Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D42E3B06;
	Tue, 17 Jun 2025 13:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165527; cv=none; b=JZGfwGBPYuptWj9JQcRmYJW3pXgI4tfhBA0GQeejxyyjtkdRNNWBCUYQlOyKlDNFL8NhxK3r2wlJFYrFgMSFr3VZTZSs8b9P7Olvba+k9aTLLodNHnEdavrHcKWrhi3hqG0sXSHBT/K8Q375l40WTt5TVqbwoa+qyh1lwOft2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165527; c=relaxed/simple;
	bh=wWeLDDQYDmM1y6C3SsMhyzMbFjzIQ0q5QtSXHDJ3HDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e0yTd8qHZD5mtOssl66aqyyekwzYYdcmBKysfW3jK1LXVa2dXVtcc/3zEIkxuhgux9agml3EoPbsX5zWFVtWcreszIINlwc5SFwhHgpSZe66WJubPoL55UvbkHRFuvUAr93UDu+NqYbMvu4D0upOb+W8RjRJm8HfzLc74csPSrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9QLt9KH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9QLt9KH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45347d6cba3so6739795e9.0;
        Tue, 17 Jun 2025 06:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165524; x=1750770324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bg31F0d+1nVnijzavywEYSr62QznBWncy20lgNF+WcI=;
        b=g9QLt9KHx+IfVXXheipF1yvmqKuPs0ot3Rr0U4ugal6VSDtnkZaQ9oVDlys0DHRikG
         cKatj/LQwpfeVKUp2jSYReeCb18tztvwX03REMHPpmwuCIc79x/GIHVCWR+BFitRgeWX
         OUK06iZ0Q15nmoa3lN+RNrtSlRL4984QKyGwqRTYG996XIBNsixqlqAVJk+n8JgEQihw
         P2RKJ735Xq9Dk6T4GClkHlHrkL/9OdHOQMAArxMCl3n+4+ISARg3SCEIEV6EXtNhG4Yy
         LmGgjlD20xHVenOmonFKQMMxkFIFX0toM7kwA78iDTrDUo/qZ2Mvdci2Pt39hDe5BNnk
         NKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165524; x=1750770324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bg31F0d+1nVnijzavywEYSr62QznBWncy20lgNF+WcI=;
        b=RfzA5H67kWGqPQqAu6Df2AmqiK6a8JWffaVY8LNX71QfRhBuRh08r7Bm0NhYA/rwQu
         Tt+2Fo6ujL9+PmrPlZ1c9iMa2lmQclyugyDl9Uc6mCb1J2+GSghWcuhmc1VkHJyP8P+G
         xKuJCxvubHds59FfYcFpx25qEzuIcsRAB5v2bguOi3uqp7K2EdANp8PeI5qSG45nUu+y
         Yh2RfrpQb33Woq9qUFgWB9AoY1ummNr3WONtZLwfAc7SqnKPmREX0d2zo4iJhF/LlEDu
         ko6ul9Tfc7MiWGphskYlBIT9MZ+Iba/SpDE4ML70ijuamzQ8c5OfqRgClnKOFd+RsBFl
         Jf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUadDDDeZGCAPld0HS84SzYj/3b0GNzvpNha+jK81D2txzXVYq14fgEGx4eSnR6psC0JKN3dh1QpqZZDKkT@vger.kernel.org, AJvYcCUxpO8R2/FmbMrTvybSCGVCX0nRJ5FKcmHLxkpCus1c1O3+nEPMFrZTafuup1YwPdposg4/HU2MCh94@vger.kernel.org, AJvYcCVe9K9krJbC5ZsaTd46x6qxOgjwcNXQ8hHaYvXQqlJoXZch37Nty1YffIxif+lpcjFhBeRQs1JbBGaW@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7XrkHM/FV90xpPCZn9IG4WspAOkcJo1SWSmTQOW6bTXWC4KA
	vYfXKwz2WHISj4B/ZnjkKJ1pGbU+z67OvT2UmW6L+etykLRwjxsE+LAD
X-Gm-Gg: ASbGnctTgU9yHPz3dOMojW2TXmoJG7xn3VsfMwzpuKBddh595x7T8dVewPnW5eveO3E
	zQ8yCzjccSGrSqit5C3n83qWflmEOQYK8zMLshjHCuQ/RblSqvcUErer81/E4mlCYoOs2UqwcEm
	JJC9CpRtnVFBMSVSPY2VEnVfNCo1JOM275BZeEwGa0lq3hrwFEHCQ6qpkTfmtfkHKIS2jHebosg
	SJyurEPD9q8S8zQ3iBBWVXx2xFVDeoZwqEIAojcED3hOatYdJgpVgxGySTJdcfWLb083o4Fsf8x
	HR+KMXVDWEMR5yuSyEw5IlEsPoFgO7VFjgQt1iXo6Zj72lmObYWs0QHvsWrjG/HdjzBSg8qcwyl
	hbsMc78DTOL2ZydSNI5mO1C09EWPyelE=
X-Google-Smtp-Source: AGHT+IHjFEY7H/a/S0e35aaHyXmbBAqPLohITwsY3KfNxg/F9dk6aPw0UtFkFFQMfYBipwzZhL9GJQ==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr104475545e9.11.1750165523301;
        Tue, 17 Jun 2025 06:05:23 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 00/10] clk: add support for Airoha AN7583 clock
Date: Tue, 17 Jun 2025 15:04:43 +0200
Message-ID: <20250617130455.32682-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Also AN7583 require some additional tune for clock rate so
we introduce support of .set_rate in the driver.

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (10):
  clk: en7523: convert driver to regmap API
  clk: en7523: generalize register clocks function
  clk: en7523: convert to full clk_hw implementation
  clk: en7523: add support for .set_rate
  clk: en7523: permit to reference Chip SCU from phandle
  dt-bindings: clock: airoha: Document new property airoha,chip-scu
  clk: en7523: reword and clean clk_probe variables
  clk: en7523: add support for probing SCU child
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  17 +
 drivers/clk/clk-en7523.c                      | 739 ++++++++++++++----
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  61 ++
 4 files changed, 680 insertions(+), 140 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.48.1

