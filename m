Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5F1F5F6
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738520297; cv=none; b=X2cyrFCW3aPdErJzvaCK/JGm/08v3eQ2oOJhFT4NX0QJ26+9bCIQcT6RGirqx6RnXfRGeakHJOeH4QY/kPfURVyjIc+eMpsGLmNzyP9WAi7D4lwAXuU9KraVWFPY+OF9MMJvPPEPcYfwz/QLDyCLJM6NAJyWX1wec3W5dXrlc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738520297; c=relaxed/simple;
	bh=nUFzHHQA2A+tdD0k8zZ4w+GrP258r7ZHCTzG/euRaRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YNC1zOOplzwTu/ei8Cpwh1PEHbAiiop1K9s47hB9Cv9KSQJcLP+e63fAZGvDNua0u0YdGndCYiCT2ZU7GmRyHp8o2OofujaqvKP93F4Tugcd8tESx9SRCGg0aopK8etn9GUisyfCyd5CRj51HuBa4vIMh81CzOnn/TXeCIeSy0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJrijmVh; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJrijmVh"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6e9317a2aso413682485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 10:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738520295; x=1739125095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vtyp9CrR/0EM68yID1grRZx0m/526K/dqkR7ckCylEk=;
        b=bJrijmVhxaVS99fhbCh4VUw428Qsrohhjak8RoK9EIto//GO138dTygSCMWcvobfdk
         47OanwvgJuvs3vF5TiUsTpw8zr6uv7RyQ9eqY5xQxmLxU2nIF4xTnZK7MQmJUfrhfiPI
         8OTl7IQ0k9TVofHqNv3UXOxU9uljWq0Vc+N7ReNZ/PJSzha4nfxyafE6J2TLDpj36Xkq
         0K/gJhxU+r6MgTf36/604EV4KNDz8Q8XDQ+lGMjpf6DxrnjfBDnwInGA5425EeJ2iovn
         B7SmRKUvF878qLQFFXGTFe0frCq+98xXI2yW/iRupgdG/rE6g7uhAo/7GoxLSjvzxx8F
         rdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738520295; x=1739125095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vtyp9CrR/0EM68yID1grRZx0m/526K/dqkR7ckCylEk=;
        b=kjsT3f2M7DY7vSCFo4v9UCueyZqQ0lXTCMn2XMlfXI87+6GBhfe7+M/H/3YHDPz1iB
         TLO8mEVM8ShcJkvCC/Fa0v7HvkDzRsr9M1IlpXEcpQtLYFVzXzn1dnFdoMZSBanoOEkE
         EGc2QlyuT9lU2d4MBgT4jSYd04+897xN8TpObaZxgliEj3lZMNr2IqOme3TdEkYBeFnO
         DBp+n1IKKGtCqVpo+mkdZ68dXoBJ2tWHSlgE0vsFuI8rwtZXE647ngrLgAIIGATbCNMv
         iLaxk3mJT2mMM6C9GP4VZ73S5qF6WugMb8AUOUwI8TCJN6iJ3IoGV+eQ2Hui17ipiQ3C
         Bm7w==
X-Gm-Message-State: AOJu0YykmWD4QXVPycGGF8L17sHtD1nxzXftzbP3ePhjkiBJJVQdjXKO
	0IDbPhYvCSGJznCIxGoYKCOLRqzetVptCeH298aaXDSVkWFqE8O7
X-Gm-Gg: ASbGnctmyom4YpupE2wDaBwJc+TOuIwsA3h366zrKFQv9tEU8M0uEjKXodP+TbmbXDI
	vFtCro+yaCMt5f1co8W+IKn8K/WPzx+COazQaR1bYT+LJQyZ3LleCEreyt8ZUwzg9iyln+O63qx
	F1UhJPdKZGXBsRorQsPDUsvjiWJogFUg8TK5hV7Gp8WCOVZahuJms6aS7WJeHl6zm8KhbbcnyoP
	INLovkZgjiDT/t81vQ7EA3Ne1lrlBLaA3SNIpJFCxc+5MTk6wEwktNYZvw42gfYcgdrQalUQt81
	oIm+08wLBMP8obVSQHbh+B4yM1HL4vAoq0RLTg==
X-Google-Smtp-Source: AGHT+IEIfDd6vOIGQq5bPB/SozlqOSwJiX3grgT6sQ0/XB/r6WFVedSt2GhI7AQmzrsj9k8QDD4mHg==
X-Received: by 2002:a05:620a:319d:b0:7bc:db7a:4f78 with SMTP id af79cd13be357-7c011d95f5emr1673484585a.4.1738520295005;
        Sun, 02 Feb 2025 10:18:15 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90ef7esm429942685a.110.2025.02.02.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 10:18:14 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: broonie@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	mazziesaccount@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] regmap-irq: Add missing kfree()
Date: Sun,  2 Feb 2025 18:18:12 +0000
Message-Id: <20250202181812.48594-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kfree() for "d->main_status_buf" in the error-handling path to prevent
a memory leak.

Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 0bcd81389a29..b73ab3cda781 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -906,6 +906,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
 	kfree(d->mask_buf);
+	kfree(d->main_status_buf);
 	kfree(d->status_buf);
 	kfree(d->status_reg_buf);
 	if (d->config_buf) {
-- 
2.25.1

