Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F76128CF7B;
	Tue, 17 Jun 2025 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143791; cv=none; b=i4MAbguxFvXxGmExNkjrF/5xGj8pM8CiNV8y4TbYjktzyvtzUT5/ncQXKQe9BTqDBefeUUyTLj29m+PP4Mb4WpyAjj+toZ6ZDQ/SECaehx5wIp9G54Ap02I6T5RzwwIIMmNf0qXezr8xaWb21pmmUzpkl99r01Z9m3h+z3C/4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143791; c=relaxed/simple;
	bh=WcoDewO9FlS2NbBymjhWkclV9EvlotZFPJSbv3ynplM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dgs9d/qEtrs/bABgYDnmbgz0aEPr043oibO5NU5ydYuVyMbQvC89IXwd5+tqvf2niSJawlN8dlSWRv3KbpJAGujj53E58KxslhJIklgZ23H0ELmTComGKgf3WComPNDOd2VFtG4YBfVtecDhbn8fzgl084MwWgpu0DyAHvY03eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJVQgwJY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJVQgwJY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234f17910d8so49017645ad.3;
        Tue, 17 Jun 2025 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143789; x=1750748589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUSaq5iVGlG0zdfVbYa1qB2wB2qIwASCB+SMQsH2sLk=;
        b=nJVQgwJYdzAeqRzzqyK0AvtKICnau1bFac9+Qzi/E0xj+EdzbLsxE6X4PCWXZn6svY
         UGi0sa1i20x8HgfPPqNkQCIff1f+Fogm8BpMKLmw72ClLheLuuDVualPiBzNlhti3aGn
         2gCQcZH5sDIIEP1wXWO+rFIi6fnaSAsbJW6n8NS9NqFJhUKHrSvakudelxAfIMkyR+GU
         dKdLyEf0N9mZ8tJUAeUoj0pS7tRyFLt6QV8OGCwaA1dgVN2IZE9RbD8mPbSfjvvUAjzM
         njpO7CsMaFK0Gktzy8r4y5HoJIj1NTb+f4HwRjSt6NCpya0hzNWIEPN9nTfq1KOQci7W
         DHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143789; x=1750748589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUSaq5iVGlG0zdfVbYa1qB2wB2qIwASCB+SMQsH2sLk=;
        b=ivnk6qb7OyHgt09uNbr9WOsfCD4muxeMDyOTt/iMqbSRbsjiat0Us+CK11mZmZfRtA
         FGNhJ2rAWnVTRDC4uvxuQxCsFG2GFPKtHfI2FGoETeap+VcVp5p87Yxk8huxrSQq9cQW
         gP4Z3CxySI3J+YSXml4ZAJNy19wCcb5v8i63u3f/DNCF7QK4Due5G+2OPrxAS1X/aPtR
         rRQw2yexERmPjaZ11zyHzmssYfzQU3JnwDwLC3/XuIDHVNFTSF046yhyQgqKQtxT4mtQ
         zLvb42VgVSdyoaf8B/SKbG/ctJvfJUKmhxeDWPS/t9lRPFNvTTkdZMTD9n1JhuiU3GLl
         aTFw==
X-Forwarded-Encrypted: i=1; AJvYcCXoLzY8QchRHyh75jxspDlHk3rG0PC4wS1+nejFbxYQ38kOkBr12uSwaucvZAUS5NyarQR2jYOJhbMbipA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKFCSB4qAeDaf1GI/X+rLiOO9Tfnp+0T1O1zzRcokRUfPXUHjD
	9bBnGraAPmX4K3gBgEg3aVi5O+6/op5Jpqm0QtYCU+cnrtgWnuCuntVz
X-Gm-Gg: ASbGncsFjIpNUZjvmUpbtluOmCICEhXWo+2LIPRdA3H7tvOP/4k8Bs8BttkmWzgSeTB
	J98ChRMNA1lyd9Z9dVxzbL9NTtvHEpyfHClLDS7ZrMNMGqWMuj7IMDsx3ttIUMDOVHd6gf/HeiB
	I/oR/gBXqx4Z8+TvyCg1pHerxXLsPXGsOaCg0mHGPNpN4uLfq73ZzuJ1Iumky5czukCxp/l3Ig8
	RuM+eKqmzdnu2FKTNoeKigl0NnzhMOmj4my1NcY3vcTQkI031ja581oZNT7W918YJY1XiEB5cy8
	h9RdjY+w6ELKdEI25TQ3ryxydzso2iugKX7wsRyY37HK6QSxwii6JXbmKA4uXAFq/WHbTvWA
X-Google-Smtp-Source: AGHT+IHcjeI1Rw+SykS8rTbHJZlwn3uGXgj/MA4H+sRjd8G3JU1s3lnpobaJkSb+cj1Dicl+oIhqlg==
X-Received: by 2002:a17:903:3d8d:b0:22f:c19c:810c with SMTP id d9443c01a7336-2366b19ec24mr124060485ad.51.1750143788808;
        Tue, 17 Jun 2025 00:03:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88bf6dsm73043555ad.4.2025.06.17.00.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
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
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/4] reset: simple: add support for Sophgo CV1800B
Date: Tue, 17 Jun 2025 15:01:40 +0800
Message-ID: <20250617070144.1149926-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0

