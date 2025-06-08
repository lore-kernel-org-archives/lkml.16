Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DF1F542A;
	Sun,  8 Jun 2025 23:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425020; cv=none; b=hxN+XVmUHBnvVhfS70WLwaoEx/z9I7sXZqHp2oU4P6pxU8Pn52tGne5vieSqwzMaJW/eIJ5vheccklmSJUmyNAKPIj2aCE+bnARFidlYBVjSTw8hqAMl//MaArKZUvf7iYnHtVRXkduKxjktiu8lB8mLTsol0UIOzfjZK2yq5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425020; c=relaxed/simple;
	bh=nArarwAlz2lpSFVw8+fLjNwR+Nq2mIZBhK4d4N2fTx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRjK07+PxigYYUksKZ/7eTA05pLnrrNh4NhbXgX/QH7wGCFOouUMRsUvlCMwkJoehuIfTOAfgaVB01H1XcF30yKh45mvWzrXgh4FG+TPovVBzuV4r6cEPRnLNiR/+eJ7WTqR0iHyrePKfB2V9TdwzJX3w0/ihjNIXuYdK1ARieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVYsQdqr; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVYsQdqr"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7caeeef95d4so376092285a.2;
        Sun, 08 Jun 2025 16:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425016; x=1750029816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzlaTY0tHdKvyrCrJLv+ChjIQt2LAnmKHtpsPVtNlOI=;
        b=QVYsQdqrQ5QCvrthAAxRVz9lhh56Uyq1p35iGEigdiQDWu+Ne2NHp0Zu1BILJegvUc
         kWKHppalOBNEjO6c7WAiHsAydmLyM0N5CWgFOAXAPNw8JfpEIN0TuH2XsmtsLE05Fqro
         9zqpAdgS2CQBs4dmWj7UJgdjmH3OZqGmteCRzRIBprpS5VaDGFDoPwf5SMLvOYhIQk/q
         uMsi/GHaDTMIbJuCORsJTBJWsuK0wFzoVOM4pFcBMglTOpZzr0J6U3z/UpmSZDO5jniy
         pLo1odtJNM4LluPqlHr+9IBbVklETW95q9Cg8KkvO5vl1fdV8h2USplnNL8cUluoe5pq
         G5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425016; x=1750029816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzlaTY0tHdKvyrCrJLv+ChjIQt2LAnmKHtpsPVtNlOI=;
        b=jE6IxCKfdGqEJBwPuDMj4pACuL2812CFsGheBHl/T5FXxuM9q2aa7uVe2wcM5yIBeJ
         g4bmbqkJzxSZlbwcXjhAulqt5AD4x3+cgM/17uLeG8Wl9uwqfShDYoDUQqoAsj9yQ+4c
         yATMsS5yeo3ajHZyXlKipQuacwBfeQSESNZJWsDQo+44m8sWxxyKuUnutqkL0wb/TDMN
         XR9eH2/m04ApRP90leOe4VOLG6bg86X0XKeUtyEnAp7iplhx9Ducosu6cehxaivHYDMa
         2Uu1TpojlJOGKGaMQnsaMSzN2f72kwXOVZ6L5PGOEXf6ucyP1eOlfeKGoKt9KbbOUfDt
         ocvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGl2Rh54sC9wvKghsKZIlq/3F/dIZYkKp+n2nGKHovq0RUGPZ/DF77/l8GX16Lg8MU336oakG18gSM@vger.kernel.org, AJvYcCXR7wS5dmKBc9C29ZCe/Pk0FPpib1FcflY8VL2ceDmqZXGAOH6cVyyQrJiHraAdaJDaF7SWy9Ew61zvZkTM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAHr8N+hZSf6a7p3norWCIQucQEjFTxrP51b8vC2dVmeyAgtU
	qPNx8WaVtqIDdMR+qqAm08l/OaFmH17sG5su3MUF6/hsOlyiRduOn+o+
X-Gm-Gg: ASbGncvoGffKOjPTdn/0+dmzgrvkBBLV/cE3N8iOup2VrPGCX1FJ4+deXu5oVeSa9x+
	S3pNjtZEVuyw3yXzxMFkWmDYq9JnbzOSAvXjP1VGsyTkloWfpsVqRtqmI3HvfSePpJgU3fEbKYo
	+OtMJ6DwUEJavZdnhOg1OPvbkCceLxxpwTmfKzMkzdp+gLWZak2IYQierplXz3AA16fKbmQKD9C
	yjdGAoMt1/rrICKfpvrtzhA+goNF1HyrdJu1Dx/19iPZGo+mIKKiIrlWOVLAtoZhAxsLr9HhN65
	WoKdz74g5ftLUhxtrqcTxb7ZsRs=
X-Google-Smtp-Source: AGHT+IGjbwg1Bauz9LJ+K9RIr3N4RPJEfKPtO0PGQCVeGinq1IMDmYmAae0bHoznkVtegbGh0XJUbQ==
X-Received: by 2002:a05:620a:198f:b0:7d2:2673:883a with SMTP id af79cd13be357-7d229874d7cmr1953579185a.7.1749425016456;
        Sun, 08 Jun 2025 16:23:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250f64b80sm466522585a.23.2025.06.08.16.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:36 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/4] reset: simple: add support for Sophgo CV1800B
Date: Mon,  9 Jun 2025 07:22:08 +0800
Message-ID: <20250608232214.771855-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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

