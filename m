Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408015624B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413976; cv=none; b=IiBaDs9qgw2+QGCMpGAWJitDJlBscLsvh7WsU8CskqpE2Fs1l5VFqj6UTTfKTg8nrMPOpGqkatoXUL9qjX7Q0FlSGreOvJHu5cEW0aejLNrJljBWY9ZaXD/5WJ7RPZ/zao8fdNbmY1/Ph6qQ+3TMVoitenAg9+3BbkQIqX9Ovf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413976; c=relaxed/simple;
	bh=kF0uLU0xAMnbNP6BH/vmmtqvga0Rr0nSO+aOUne5JHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UiqRx78FsyZiadWxYbNGT9vJHVGjEMiJb3C1GDxQjFe1q4WPo4jYMIAV1/XEt+pyQFu4FTBgKKtvsqd8DsFZBJ3wwf/Nw37QI7QkPl4Ggxjn4uee/OY7ssboB29Skqo9EIcroHIpNm/FyHJLU4kmwNpmJ6MatmukKsT+PaObjCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUIYmyk/; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUIYmyk/"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-223f4c06e9fso77314265ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743413974; x=1744018774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKMxlaeTxaJWI4z9WHO98X3QgiKdQ3qKVb7b/rUt++I=;
        b=ZUIYmyk/g1dYvXEk/aIYViXnBR9n1PcsHJt8i6NfL5rQbuWgDpJGupHAKpeLJg+i3T
         fWRFm80dNUnEpurFCZIL/DgzM4YK5BgdajDZXWJfYW5JKOOn0pCkZ7txPeKHdm5HHUqV
         OABTwfVcVz+M0iLUkwo1+wVHqA1pne5oPWeYtpAPkjBlRXfv867EzbaLD5YYsNIMH66/
         YE80XXqVpcWxHZHH07J7djlRq6oxdBOkIcBmftdAS4cI2px4gIuCLBRt9qCnGbpb9YSK
         8L1lezapMtXh4mLhKuOLbTarUCk6qfWgwAmGp5hbQAi5e+LVcjgZBJVNiZUEo6l/GFXc
         Vd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743413974; x=1744018774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKMxlaeTxaJWI4z9WHO98X3QgiKdQ3qKVb7b/rUt++I=;
        b=tTLIyBBDhpKhZV02/b43VAftkqS+PJLcsQauKbCiHartkLFsIKPvvcBoZ4HlcbQ9kk
         ui525Jzlz9sEGv9JJSMoPHGpKU2NsNSJTCsv1Rk9nu+wrOTqG76jbutaNla8UxQEbrgs
         8l8AGxBHDzKjJF/GH1ORbzndj8+BBMCOjhLkcP5ZMm73/5rqniBrZdCEjKw4oHIl4YnW
         Q7Yy4SrzGjQR9hLnnF7hWcng8SbtpHBbijxAqS1ECecYCBC+QfrlkJ/fuLUXEE8JGAA4
         I3ZOnmN/yVM/aHt/u7iJ6Pkd5dav8imGbn1ErQkZPHwy/Q83yjz6HnObJp2GfheudC6G
         oOow==
X-Forwarded-Encrypted: i=1; AJvYcCWB26fVJ4N7kTCLJGuuJl58vBCyYQ1rosALJYl13slohm2njUF59w5Kbae0KYP4slDO3iTLhbSb4n2OLtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdRp0grDEsmoBhl9eVhY6oKRo91KRBAABqceljSh7NAGbY7aa
	iogCHc1tJu/yDGEsF6bWq9LLpmmYFG0ZEpRER0H23RXX9NliL0RG
X-Gm-Gg: ASbGncvaEl12BVlRjLUDDwlQLXZLzzsxuiQJDDQbVOsenDTQvle7aM/KVJlIBlcfC1O
	sZmHmPyZq5n50hNcFE3VzQSqCeF265/RwJamYfwhlVps2Hwhrr7Ew8vhI9FYiQzhvPEwHI+eWr0
	WzKfK4j/kg/psAPbQjMTUIejI11rZAFJBZKO+okQ95ZKDAKnSQqp+YT+mHhdRr2ee+er4P1+GJX
	IQFJHRq9dIubhnoMimOpja8EokfI0DxfuyP948gOti9hNELSGcQO4EYGdZq5x5/GSCE9Y5g8RZL
	oz9Gk95lkyeJTRi1oUgPS4pYPZDvrarfkSr4ybnfF5tHwasNlBffCst49RZOb/2PxvqkNMQ=
X-Google-Smtp-Source: AGHT+IHaTuotKrQ7H6Jwshz7QKSz02e2BY1SJ5EVZ81Mmzdz+0YDdgOAsdLuQKnlKlj+InQ4FWeA1g==
X-Received: by 2002:a17:903:46cc:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2292ef33b00mr156170785ad.25.1743413973635;
        Mon, 31 Mar 2025 02:39:33 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf93esm65083725ad.154.2025.03.31.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:39:33 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: herve.codina@bootlin.com,
	gsomlo@gmail.com,
	heiko@sntech.de,
	andersson@kernel.org,
	u.kleine-koenig@baylibre.com,
	bsdhenrymartin@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Mon, 31 Mar 2025 17:39:22 +0800
Message-Id: <20250331093922.7735-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function aspeed_lpc_enable_snoop.

A NULL check should be added after the devm_kasprintf() to prevent potential NULL pointer dereference error.

Fixes: 3772e5da44542 ("Aspeed LPC snoop output using misc chardev")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..376b3a910797 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name)
+		return -ENOMEM;
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
-- 
2.34.1

