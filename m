Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A725B1F7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009191; cv=none; b=pIOMg+2umEKrZqpau/1mGaMC6CvuJNOVhjRFqiRxMD62kPeHciF8RI9nTIVdZvg1hTMr8uPC9M9rbsn5rtlZPF31kxqonJADzKcTn4CMnIT0DyJRJUa8AMoW+K/PjNUqJKPFHpb8F8JPRBbf9mvrhXy3uSvPh9xdvtSP3mmt63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009191; c=relaxed/simple;
	bh=qqyemasPL6QK59u6QUV4f+mqdNA0WLZoLI0hQaQeRAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIj4sytPCajNim5sZyTEiewswLHZ1lmsbs6OI4945Cj5kz7OsjiI2/I3ZJ8ufC9ntYVnnQ9+b7VpXihoK1alwI5WnQZpZI1MCUWM4kJy47gouo9Xjbz5ZW2/tX+N0zGEWK2ylnCMX1IMsI4qlf2MORh00qEPuVS2SMxwaMy4NYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ar3MVEeq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ar3MVEeq"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so8902313a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009186; x=1746613986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=Ar3MVEeq032Zsp2bufQHkoUShr0l2ARJ00SAzEmIxHbLo7ufXPfuT/OFIyzkjbHwB/
         8arCjpcysqoHLbdlRHedX1yniC1MAit4Iy61zTfmmZIb+kRzpr8Gju7toflkHnFr1ioC
         siWYCQ7rnG5t6S8fJNXn53WYfeM8Jajveq9c3o8JcD4mWeHHkhgGrC2or5IaW0li0pjb
         hQ8/Q+5xVz3yBufrns5L+OAr58s1kdAwnTkENCcBrjWv/mVla3y3YaM8xCkveG4/NgR0
         t0ZdJ2jKLabmgUxRK/h0CmhiiZUcPWCiKG0rNW70CTFT5I1NCixAVa5hpm1Ud+BC8XFI
         u4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009186; x=1746613986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=Jik0W8uKw6/pFC6MSK25GsJzHtwFERJY5Tyxl/lgypvs/wv3Elrtwoz3CLPli1yUit
         ChH9K919d3IZUuxxH+qmwpis6YU2XMjbzMx3EBPYkXfdIgW9yjUNl7pd5ZjG48/VwYXv
         elFvjVd08sAzn+wqJIKMPFsffGnt14Ek/JexZAdcIkbx+aji/sj2xoO5DfJ7hsPValVB
         aqjQSX4Y3rQaYtCx9lCdm7LeltHFW4exJdco3EPoMHuq7XES9snFRys2xRlTHhu8qRAn
         Ie41Ma6ODm6YcuXWPh837nST7P+haUXQmLyEP058V+L/a3GOPmTGyea/r/WmIgRQL1yZ
         3faw==
X-Forwarded-Encrypted: i=1; AJvYcCUs4LreQfPJdicNj4oBGHOfa6qdX/B0uBYMrUG84ZXeojLGhHczYX1Kpr185ZvP03hTNsO0TJlH2vh5wuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+N0ujoP9YvG7bjV2fWxYPaShSxtJtY/LqeYpbe0MWT2FzWmu
	7ak+yr04DHFBD9J3K7OEbRIvZbeRL1ScAdRJmgJDioAK046A8ZNl7TZ1s2XW2nQ=
X-Gm-Gg: ASbGncuD3Dd7EFnMiM6Wop9Fmu0FPhv3O/e3cGia7iIjIAM8w3VQfUT6N2dr9N3MEeo
	fs3kLh0GGQcdRztToWm4E41wzqKgKWNPU/V+2WiydKDasnwbxrCK+T6jYFYwd21xx/43taXwYVb
	/95ykpEZxkhg1I4EA2fH+PduHGGHen1gLGF5XY2sgJMnl5OVAtLeshuWW6kyyVO3e+TlhUlQDi4
	qruQdrwUgBvcCQADLzwME4P+Q/yrEH+Pvfw+DZYScFzrH4VXys7kj80SN1doyjWXYq1EvoN2MoB
	JPVYQ0J4ZxmDW3cT9K5IgW3i1i3lq8OBh81tPRslIzjsNMLEqKwkXcOVMmoeObUo042gnBSKDiT
	3vKS64A==
X-Google-Smtp-Source: AGHT+IEEfl+k3BC6Us3G4LOLDc9wt5JbZ4OiyNOr1AeXljqq4kLkSZXbAFThitp0f3NmQGw8dzbixw==
X-Received: by 2002:a17:907:1c94:b0:ac7:1600:ea81 with SMTP id a640c23a62f3a-acee2600a17mr193116866b.49.1746009186334;
        Wed, 30 Apr 2025 03:33:06 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:05 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/8] of/irq: Export of_irq_count()
Date: Wed, 30 Apr 2025 13:32:31 +0300
Message-ID: <20250430103236.3511989-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Export of_irq_count() to be able to use it in modules.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.43.0

