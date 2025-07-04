Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE3302061
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636619; cv=none; b=ChtAZf0hFXsqTBNDvAeTgxDy/rkbxNKveGvebkWBZ/xS7JnEq5dEDatK1bbHJZhYgYPvzj+d8cn0GVQW5QFhV+SG0hF3ncjSWRVUrOPckFNalHLO4973IzGrqSRzCssVmEdLO+VE+Flq7s8kt/cHFTSiVVmOygZloOXVDHsCZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636619; c=relaxed/simple;
	bh=qTydbvwsipxNicmaEZ+CKER7CcHb2CWmAMgsd8CYofI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCCqO9mYem/gID9a8PraG/DO7jz6fk9bWnOCAwJ3wXoEYOP3SzzoXKnPkD+2bs1+EJzUR8Q0ChVI8abu9QTfixtJMST/1H3dmZpjE4+CGe3/dKKQ5dnveVk4ogN/R2rJogLCdI9MAUzz2mvpGpji//KBgmdiIM4r8xLBZ+zzR+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JE4+YTJr; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JE4+YTJr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so1348498a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636615; x=1752241415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVHE9lJ0YDRv5jonU7HwVUdVK1j8h+dQL57nzRKWT18=;
        b=JE4+YTJr540uoJUiObsEN2jXNaeXLSKPq8Yv+zDsWB3o5/WxGUGSkitipqYjioAaaF
         Kg4x+VCPa9vhQtvshxs8JXJkPu/iL6hjgp+4a8hhYRfuxKRsssmYpxv6hfqoaItAtYlK
         7q1tp/0+xkYZ5pnsSfP7hpg1JXUP6v9qa6w32Rm54m9ylFr66LAn0ak6q1SHF6/5VjOc
         neUbCKmLeViI+mAX00/oSSt4B5ZjPeUwJ3q4zLoeDeJl0JlVCTJ4ZNYwUvp2KCwgYGA3
         SoTfTL4BlWzX0j5Gut4TDdTVi4FGyi01BLrI8OuGHcv+CHVcsvS+fME83urDYUTHpmp6
         vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636615; x=1752241415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVHE9lJ0YDRv5jonU7HwVUdVK1j8h+dQL57nzRKWT18=;
        b=WXe3JDtUH2RUllCpALG+U3snMqjIZXXKNDhtTDyV2Y9PxuWtu+YCYrxrQnKQ+/Afzm
         ZRugPO9Yq0jRuPLRwTUAVDfWelG/i7G+fvpzS+Jv4yi2I17pQesO6ZXXf8R+Zh2maAGJ
         5Wk9SRDCHcz5oFGGU0gIGj7N+tGO8B6qk8ykDr7G+MqpCC+leCPZCkm8Djo4kNZJthiM
         DofbS1YW2N4W59X8ya3UuoDgjyaTPNvxGiHEgM03GNjrhHGmxg5VnMhzwCRviiVznIbA
         38VbRBbVjsK01PTk5qIQ+OTdt83VACsIdrPpxKB5AFeDlcABmZ9+CvHS3GTh/N7iRU9D
         PoHA==
X-Forwarded-Encrypted: i=1; AJvYcCXW4OsaagktvMNd4XaK+pQ8UA1nlRU6vkORec3hv+csn42iL/fJVk0stOyMLcG7WDvftGqJrd+v8QOzEyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQcT76jfzquJHuzR49WFMUfLgkopqYBY1GglhK8SEtw/M4ojvT
	ABf1zySp9CG9/U3gbO4yhicmD1sTyvYsJwhyK4kQ5JBnaJOukn9V0pfcNYOL7DMad0o=
X-Gm-Gg: ASbGnctTwK6gGTf4VyarXXeOGIL79tCJVxc9P5frixG4BCQvv8cJxFgzMsiqgZezrCW
	rVFsSAzws26B3MaRrWj6jIgUSWFJRHWqjU6nFN3u2/1jPtlPIdxpvDlznTjvJl+8gUBKdVhsQyA
	hp4MVofiHZvZFXcDyhnhgxLacVOdd5ZMQuWeAoGHCVISyvG/WXDTW0FpFBzH1kNmi5GcQmgFH3J
	MeL0xSufDNj6u9IBMbI9Zn1rK/Qol/feLRSoCtXCkwuCUGTGzZXUWYueuRxMfMjSMFsnTUL2KS1
	XWsYMVCtxGZE0ic2vd7RYrzRIKekF37sGyoIFUlHGzP4ujEYInxx0cxSBcMKNlFGf0QM7PL1KGj
	9hOCG7kXacklJZ42qon4O8RxThg==
X-Google-Smtp-Source: AGHT+IFGPw3v50tj/GPM1uEZkj/0eYHeSowBVbc3cQ6zDPa98ZgFCGKQvA42xxJtIW7UpUVkFtB5/w==
X-Received: by 2002:a05:6402:5191:b0:60b:9f77:e514 with SMTP id 4fb4d7f45d1cf-60fd6510ce0mr1836018a12.10.1751636615396;
        Fri, 04 Jul 2025 06:43:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/3] clk: renesas: Add MSTOP support for RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
Date: Fri,  4 Jul 2025 16:43:25 +0300
Message-ID: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds MSTOP support for the RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
SoCs.

Along with it, a fix for RZ/G3S MSTOP was included.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  clk: renesas: r9a08g045-cpg: Add MSTOP for coupled clocks as well
  clk: renesas: r9a07g044-cpg: Add MSTOP for RZ/G2L
  clk: renesas: r9a07g043-cpg: Add MSTOP for RZ/G2UL

 drivers/clk/renesas/r9a07g043-cpg.c | 130 ++++++++++++------------
 drivers/clk/renesas/r9a07g044-cpg.c | 152 ++++++++++++++--------------
 drivers/clk/renesas/r9a08g045-cpg.c |   6 +-
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 4 files changed, 146 insertions(+), 143 deletions(-)

-- 
2.43.0

