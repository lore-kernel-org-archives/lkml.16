Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AFE18DB1C;
	Sat,  5 Apr 2025 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743871970; cv=none; b=CHRWyZ+pMQ3WExfSmJkMQMdY5KT2Ex1jwi6vw8PMtKYprnvpX6tKVTqsizM6PLcMEMfc0Wu+fH2OUfma1yx8lU8CgBXY6Zie624OpCa9iBPrdtZwKeGfqMn4orW26LmuTyuPyj06FHPXU4LRSX6lCmy9BLssU0vEPhkOjb3tkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743871970; c=relaxed/simple;
	bh=e3rFDDsdUi6Ihj9N/e7lUFtDjCzLwQ+DugTGrI1QEsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oarNaVumbdyaI5akcKFph5k0QfhxCefQ64MrsonGZ0q09tCN5dWRXMO30nZZDwFlJufAplaD8nKZIfGDglFkFMOmOQZTL/vzUfaiYrNiXz8xY2iyghw3xwk++kxzzV5bxLSwk2pqnlGTont/bWyMSo1SGFME4am6EbLVb9HfWxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2HEbgeE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2HEbgeE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso29021425ad.1;
        Sat, 05 Apr 2025 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743871968; x=1744476768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbg1jLZ26gVamd3nqSnVcTJlTpttcX/T5ZM1o3+r+4U=;
        b=f2HEbgeEejHqe1CgEljJ8r3hwszG+04doLMQYyTANP8PbrFjhP+9qCTUVeJR7bWAax
         HQgDuo5P4LiIyMWr29cDjHLv4C3NE/Bci+Kx+9IUpzViqQ458MZJeR4FNTnuXyhl9Ie/
         CuU5vZ3id8ELDqXkgY+o5+ip+Fq4kGXdelJKCFS/nnC84FzhbbxWOE7/dYl/PNya9XxI
         W8vqT1hmI87GsBD4bmHh4lGBAr/MokH6eQBqZVOkYo+Zyuh6WlGXMNQQ4n/H5EqRXs9w
         Zw2t8NvvpUkZw9cU2ZXfLVNAUWWjVrkSQWuTdA0e+R/xkPpi2C9TpSiPxIFQ1LW+/lM3
         69rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743871968; x=1744476768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbg1jLZ26gVamd3nqSnVcTJlTpttcX/T5ZM1o3+r+4U=;
        b=EkaX5LCFmdPUMKkIZAXZSaegqUoNikzr2MhGr3t1yxiTHQUhATYwaDtva+pLzpRwFj
         6H57I5UGQ/MTy3UHBDrXZCir7pcWvg1GobGNEeciR5yZsUqsviFiGU1r0f+PAfsZgN68
         ZXOYjE8g6+tapPqmMQMC7lch1WHAQ5RKfviz1Uy1xaDEMvZatusSSsYAIj0EpRqZAfSB
         rsv859XifPbKT9nZ+J1O2TJ9b7skj0Er9R3xDoOwjFPLoGoANiUksRfHiplF+88ZvMsO
         12SaISDPTigq/9WaOCl6106MvEg0BeKA2z4Te8VtDakrP3P2rPuwCmlG2SO/SoezMvpq
         VWWA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vXlwQMpX+Jibnn9h2K8j9cJhtKSQ6V+aRoDWJV4YlG2j5ADFoYVwuKHJAJSERfKx+vQgRYY0EvxiFHUq@vger.kernel.org, AJvYcCVl90d1GWFNK6mjOD6sLaaFc5gOGGR7lyY7Eo2cI5YiOo5KhjbRfpccXjR+9PIuLMN35qXTq9/415Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZBY6HmWoquhtLL+H1aGIg6N5GP/Wya8iBYvBrqBWEpzISbJI1
	k1BE+DVzjwE3cpHMPiGMo8x3YeIlEssstrSucvLwVNBS8nQlwD5YOY9WUGEaa7Q=
X-Gm-Gg: ASbGncutnF/lQ53aIsx1Sa0g+7WKxO8tdmdfVCPEeqriyCHCySR2TfgQxYG0MiUjCYa
	E5AEV329QdCCsKLSoHluQNHgwdhh3MWgSEcZnL3UqbvLp8BvxWgW9DhNJI7NLjdIRJU8On3E8fs
	lkz2ucpBDRFHk9ZrGZZgwFzttQSVYepmEu7ndhKD70omjI2QN3M4jQtCks8QIwHeHuqn3oNm313
	PTZ3r6jEsSfsjpNhE2Xpfuz2nPxVKkBwP5SBkkdGO++VHc607U9qhOhBmUGLWpj60uNWliM8vVH
	SCd2JsLES7HpEiLkDwo+cuTBZ7dGKxdEDipbV+aWB4g1nkHRRUZOoGgLoRBFLsDGNg==
X-Google-Smtp-Source: AGHT+IGb17rM+Cs8lNf5wOHRJkud3Mq8n1uj0ktFLQXaBfB4czXmlO30/jL49+BAdwiPB7LnWvd2Ww==
X-Received: by 2002:a17:903:1251:b0:220:e1e6:4457 with SMTP id d9443c01a7336-22a8a06cdcdmr77200435ad.26.1743871968072;
        Sat, 05 Apr 2025 09:52:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:92cf:5d6c:8c12:55d6:5a8f:e497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad869sm52007115ad.26.2025.04.05.09.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 09:52:47 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: corbet@lwn.net,
	rdunlap@infradead.org,
	rbrasga@uci.edu,
	kevinpaul468@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
Subject: [PATCH] Added usb_string function to a namespace
Date: Sat,  5 Apr 2025 22:21:16 +0530
Message-Id: <20250405165116.147958-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with reference to WARNING:
Duplicate C declaration, also defined at driver-api/usb/gadget:804
There is a function usb_string in the file message.c,
there is also a struct usb_string in the kernel api headers.
The docs is unable to index the function as the index is occupied by struct
This fix adds messgae.c to the usb_core namespace (in docs) hence providing
usb_sting a unique index usb_core.usb_string()

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/driver-api/usb/usb.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 89f9c37bb979..976fb4221062 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -161,6 +161,7 @@ rely on 64bit DMA to eliminate another kind of bounce buffer.
 .. kernel-doc:: drivers/usb/core/urb.c
    :export:
 
+.. c:namespace:: usb_core
 .. kernel-doc:: drivers/usb/core/message.c
    :export:
 
-- 
2.39.5

