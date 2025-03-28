Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04821CA0D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168675; cv=none; b=mXhMzS+TdUCgSxCS7G4uBwsWTRJ75nUV/8xqvSDH4No7iMpu4wMof0V1J7HNoXtO0cas/8Hx/9QoU32NuKSi1h9PVlatEqdGRY6Qamg1sl7T2bjuah3R/oT334VHHzWCzK0B72HuH+0C3EPR3jvRcdhHs7TmFIkuG09WS874oXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168675; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCNpEtWUw/I7CNhL4+3JB9PVIOVVos/gnbkUfGo2LBcs1srWNqXqg0TCfH0bUBRPkgT9Qn2BM9ITVWFP4bD1YuS1FJcWAlpM57R9JeCYe6Ud9+omUTQrJiI/wEu2hav4vGV7J5pjYGBF7fdoJnN3gml3paX5+dG5wryFZtn84+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nV1j4V4/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nV1j4V4/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4054011a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168662; x=1743773462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=nV1j4V4/dIkxhlaR22kwv7O538NCkJMzYdChmNNNyYBx9gYBjA0u6F+qHKjj3HKTSI
         iAdNouE+c8Eu1nT7xfAv41KAsk+auq2GuC+/akczxKWFQmfmX/jc6PIFBlbdmPmZcP3k
         Bzk4Syk3oZBCDIkrUNHm23GHnyFsEEwW46dc6BrGiR6d1pGnPIF1/GTg/rsHaKE5hFQt
         LC7lrJ5cdCBcemqS+R0jAz+ExDU7hYQ7yQpOdthep0D7IiOhi59ZkxH8/qFxyQ0/kehn
         QgC6IEEHVHeNwl1bmRvk0Im0RwRTGWnTeaEAm9K3Y33ExqlUOJfY4jiUPiKYdAhWPgQK
         TqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=vrjwdXkVqOMytNF9QjLnA4VSpfcvmUVjktjhFi3UPBx47bt3y8DtyxjiQG8pfKBLKk
         l3Z+o0eX3D/djZWKVIit6Vy0w2QnUexZLlkcfLmblB4mJBqpLBsHzg+C9XsBSXwNWeUv
         klPKyU8ffl+uzIo/WdzVwW9yvb2//Yl3eFRs7V8diuD/w0c+ZE1m8nhuQqBKlguT4EmB
         DpIr218dP81rUzI11tvboQ/tKaT4gMhja20aDkNWxzpipsReZwJyNuyxd0gvUXLEDugb
         PZ58BPjxaprWxG33n08CEvgm3A0ZiLWbQQcujDr64WYKEUXsygw/c0iQpHxmfP74Gk1z
         MY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT/8yLZgPsXq70S7GUEMJYvBcH7tzW1cl/7Ax1mISpVM2cU4T8wZi09g/E6Md58igi5l+OUhXDDfYgmOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/BhD+gGwgQ9dF3tJ+sjmZp4oVtKzad0aXRkgWxBv5hB0vTjQg
	5fDvZKs3lMLoEGh0LhDigP9pxvEUd3YtUhITChkDpy48qyGjB+P5lArHUmHyAb0=
X-Gm-Gg: ASbGnctEDwngbOQpO7z0EUqhWny1JLJXulusAK7qZQpuNlxbuPvVSp4EPHH3iRGG9es
	qAOzQyq2Y4egpf4QHdaX6bGaBLStE7yOzdZ9Or4oDQFYFXkgtu4rRuqt2aL04P27xbGisRDzRmT
	CDr4Ev8MrJbeXSTZ3j0LSGUz1xX7tOmMg2oslOe92zJ9uTIVhH2jGVvextue9NIAfIB5/7Ac7cL
	0NB97Z8MRI/P1lFcLDzqZuChLkuhE0KAJhUBLI0VmfA3ZGvTtnomgfPcx6oOU6lL0M+9TS3pYEN
	fmSKKATESdVhm3OLrOdwGDZy1NgIPH5WyFm/L1i1kC7zfwlLEE6baXvGlY2POXpSfnZ4g/bU1co
	DMphmhXw0up61dAvdibfY9Cc+l3v/
X-Google-Smtp-Source: AGHT+IENTriv0ZKQDvxOFGqnTo7xSy+uELps+TAzZydZP4h3NfKqEFYmhwGmgFpAh/R37lkn+8E27g==
X-Received: by 2002:a05:6402:1ecd:b0:5e5:ba77:6f42 with SMTP id 4fb4d7f45d1cf-5edc44c9935mr2924122a12.4.1743168662019;
        Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:02 +0000
Subject: [PATCH v2 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-16-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog

