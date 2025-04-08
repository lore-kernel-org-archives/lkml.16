Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EE25A2DE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151128; cv=none; b=nXeWQg+Ec06BhKgZZ3NbmmZKpiVBZ/2vYmWpURa10mcKsY3qsjzmduA3T/o+sF8He1at6CyAwwHg3QPg+NSMIAQ6JUFy0VjhMX3oDw1mioxj/P6L0AcZhFff+T2/2W4OQ1Oq+tHC4a4UYba/DMZo+TGaBKfB4OcV3QUAFF2vqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151128; c=relaxed/simple;
	bh=aotjQhayfde11pBuCYSMkPo/542taqwscZUcYD4hF4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvAXYQuvYE41tQWSW0bBY/+3T3FVajfRqunYZ9pARjXmcgNVGEp5QEKzFalUNk/6gRnbRBKNpwiinpubZYQOXMYCRoSD++HxicvrqlDmyqMtZvLXDqwEyM53H2xM6ySqOwPqsdyDhAKuY86+JnW0EUHgSc/Zd77Uz12A5YgvBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mKGcIMCK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mKGcIMCK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so85384305ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151126; x=1744755926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y3vOzvRwsIdZi2JyqyS7+haX78zm+EDNg0eHrvZINY=;
        b=mKGcIMCK6fLU7beHVea2t6te9Fs0e81hjbnJ4QTTG4VbRM7jhlzooKsyzw93aND6hT
         ci48Txhtw2W7iHVhscBVgcmiJliuTUN5Su81yoDEca2S7NPOdOt3hEELjJVbj7AuhnCk
         AynmTVyu24iIr7gQAtTVwLvdFslmauaN4GySLLke2DkgR5iU8JArA/Xbqq8HgbKRueKs
         sdSnBQ0Dp5tOJasmTMK3KBg8K6VOWajoer3QBxHXFLtEwyD/rH/ZBekuYcAJIkS4tPtI
         ysaEdI00ahg88+vOKcNwBYrkMISVIssZqZNdl50hSpY1z3pWPUtAeO3nUmwqo41IoVQ8
         sOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151126; x=1744755926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+y3vOzvRwsIdZi2JyqyS7+haX78zm+EDNg0eHrvZINY=;
        b=CyHg+vBgXpGt0vErEOhbSIclSACGEmq5gOaD+OdGJMQOIydHU8KUmKk418PZe1fA7z
         RibeUY6OvfBlBrFFqW0iS/vp93o25rm3hmpxOPqsDnxrlWJTM+wC7PhgY+Nv5cZjMnVb
         qaxX7eGVR22AO64sS1hVg0EmIXggxocrKYHXRgjnyzcxOmu/1KfiErvSDgZoG7lRao8+
         YYYsFzpMXJ0AmQFVba1/gd4V5Wk6t+CQ0Gi5p1oECgA4lAtPCEZ6YHek7FIbDvEFnne7
         hpLSw7WCMSH0vfN56cKiTVFsqQUuVqZRzfyutUywA3pK9kxI3Dt7Cx9ibM1ofTEClrJU
         6Gfw==
X-Forwarded-Encrypted: i=1; AJvYcCXLnx6271rEJS/9UBnisbItCZCHLCywP8GA0/5JD4B5mXfJoe7fereVSzEMViZYjzPOINawGzJlnD2k1H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZLTzXel6r3sPnWXAh75OQe7O2rt2eMkHpKMLA13wj3TiTKl1k
	H+Fws4heqvx65y5Jyd+sMozPbHfXreKXYPyfqgB1VGSDOjGt0wJW8KW4nnb78BksdoZeLsyjYpc
	=
X-Gm-Gg: ASbGncsRG1xOPRxb+7lincElVSd84lxoKduHXvjtN+Q0n6zEh94mNlue09uJp8fJQMd
	irR4AhoLWiXv/i4RhfgB4gMBBGpTavvBg/X868eomAEXRiNA/iur3ygOF6p+FHkyTycyUxWjGTt
	r+fI1ddz1/yVIgzwOFJNqYIsINK9aknTXQlkJAmUHeYeXWxt1ZC00IyjsyvV8/lRaRzVzsoq1fS
	sh45k1dtClAXq+kucgrZhgyekUmbJFpl4e1EGeAwONnYbiKAp68YXHssCH7n7lXy9dcv6QGQ54x
	ojJKqCED5fGX5Ei5E0Vz8LCp3U1ccCAGesS8eHsQXH7BAbKvYNm2UdgDqtrZ7zyb0UKMA/lkj5D
	OoX4RCN227g==
X-Google-Smtp-Source: AGHT+IEFsOIdLyZPCOfJFwBag4ZcDio9PNzxGSt0K1n7La2fdzlWclz3+1UZj0jjYvhUX09Xbu6XrQ==
X-Received: by 2002:a17:902:f64b:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22ac29a59b0mr13846235ad.12.1744151125867;
        Tue, 08 Apr 2025 15:25:25 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e3ecsm106501235ad.198.2025.04.08.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:25 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/18] staging: gpib: lpvo_usb: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:00 +0000
Message-ID: <20250408222504.186992-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index faf96e9cc4a1..a4bfa95357bd 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1053,7 +1053,7 @@ static int usb_gpib_t1_delay(struct gpib_board *board, unsigned int nano_sec)
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-static gpib_interface_t usb_gpib_interface = {
+static struct gpib_interface usb_gpib_interface = {
 	.name = NAME,
 	.attach = usb_gpib_attach,
 	.detach = usb_gpib_detach,
-- 
2.43.0

