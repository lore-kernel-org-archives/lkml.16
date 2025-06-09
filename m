Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA8C226527;
	Mon,  9 Jun 2025 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510255; cv=none; b=CV3IFOQFlbpmC0eichOVhkCv5iUfcpB7XuxeeXGV5kUwdLNgphMFE7/JpmQsmrp96ehM3vRIu8sEiAwo3U55dgRohw0pHhoE9Z3jhQPkWncOhAZ9rvSfiehPqWSGl0tZLqffY5qB714MrGInJ1NOzgsa6cLPMKZenNyTK5oC3l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510255; c=relaxed/simple;
	bh=f42OxMXtk6Tq+1TWvrKJh3I7+HlxZolNGaiJ+8oR4zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZemCkDWQY4MifusoIuan3ZzlM7j/gr19RNoZgyQO+Kc/2VI8eMhd32ZwwOhiaO1cZIy0YhLDmShNM3XvfvQx5TbKv5YuETUXbhzEgwntt9p+57zqJxiwtCuvgwZzxK7S8QXQYO32L0ptaSjKHEOYCidngw9OyfnGs7QLvL6+7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt2V1B7+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt2V1B7+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so61022375e9.1;
        Mon, 09 Jun 2025 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749510252; x=1750115052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7zP8A986FVen/OszFxhXSFraYygPPRLS5G0kIA4ADA=;
        b=Nt2V1B7+jT/8RGIUaFXP2wECJToZeYZ+kou2051zhlrsEvHL7J26RpjACLcxZJMECo
         E4v9N9WmXGT+eLvqy0VEDkaBo0a7qqM6bZ610p9S7smBxGYCU3o2QrkPtkOusInxCohd
         wPlWp/hm00WzKD1/praIkDT9SvW+DU/uhrvUwjMZ2rSK1khEpq8fe+P7D3wTFyRYq7aF
         xCFc+g+f+5rEygdv8z5L+sZkJ3AZ0J6Up5aVqO9MX0ctQoCaVTUa48Dwx8FNPrw9rECw
         QZaIpm0TQKbsx4gvfwXr+gU3Fpjh8U/vOe+/QQOW9v8gMOmljwhEdCx6LxMzQrlS/9Vb
         OF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510252; x=1750115052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7zP8A986FVen/OszFxhXSFraYygPPRLS5G0kIA4ADA=;
        b=dV93okQ5jWoSgR3aPxjA6PbCNBoP8aaCKd/j70T8iihcZKHHoHASi0n73yurOk4/9v
         ONFR1fAXITLWnO7Y7dWf5l6y9G7yB1Qtwk4fm5/99UQJlEyYuq1OiYoTwEkrNgy4B/DS
         3C8Y0nUXECQR4WcWHel9WSST4v2Awfn1Z/reX2RWrLUBsnCbKhKJ54HWcSzEqaN5HmtK
         VxjjDzxya7NEeBB+JHx9qdTC7WxaCOzZt/kpBwy4kiBuxxmRUOBMDWQkPtEaocH3qP76
         vxoY5UAhDPPjGf8Elm31eHHnYXMgft6rrYHDyt6X0I3ta2bP+d4Y42A2JTICjJSGMp8u
         A+uw==
X-Forwarded-Encrypted: i=1; AJvYcCVKIuz2I6/De6VZfj5lNnJOCWImVoE99K0I/Xke1IGKJbpNWYGOqZdI/UoPwF2C14yA5BeVsEECr7dn@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLl/zIZ82XHZaRKQIMJI/uRYhx31PTpi6RXMKSvPlpb7KQbnd
	9QxORzd52ns47QsljTKeNVv8q3VpSrlHP7wPLLr4kbB4vf3WCbtmR4x5Z8lr66W0nxg=
X-Gm-Gg: ASbGncumQgQcCQFR9b1XJ0TRJZPezGYaxhPLsAM+PXknpzpgUgVGvojnGJv92XtvjHK
	2iBlWRqACx1PjvTXko15L7ujGfeXF/5+WYefXGB7lvT4VNXP7YkxCKUkXaGGd2iiFfofV6ZRVoR
	Msd3cvnVGNy1tpISBZ2+vRYZlFG6M7ENlO+bZtTW55jvFX4wzDpgD+Coe8rheNqhdAVsIPeQt50
	T4MgOuncxwFriK3fme/zyhhzebz+JSinDc1h1H8+W2azOF4YSYRt8ikT5ek5SOHXRCO2KGcE8w/
	no49PdNg32RqU2vxAJvRCFXWsQkbNBYv8T2INoPCpHqIyCdJSA/LcDp7dA3DlErDwiVsBaREdak
	=
X-Google-Smtp-Source: AGHT+IG6tMFmgMt1P4ISnAtDJl0ny4aH46f7TAhKA7B+gl4vyoNxy0j/tFlOyNulAWELP5jGsF06qQ==
X-Received: by 2002:a05:600c:3504:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4531de71005mr4138435e9.16.1749510251697;
        Mon, 09 Jun 2025 16:04:11 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b92d4sm121340585e9.19.2025.06.09.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:04:11 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 2/2] reset: simple: add support for Sophgo SG2000
Date: Tue, 10 Jun 2025 01:04:15 +0200
Message-ID: <20250609230417.620089-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo SG2000 reset module.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..a64bed01d1ec 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,sg2000-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0

