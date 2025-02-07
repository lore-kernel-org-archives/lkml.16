Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B181A8402
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916573; cv=none; b=JGMyoPFe5McNEHzhEnzoMFWRMewdwXJutZ5hPwtCecT5IFsCXpBLnz6/hQie4QUlddvjLN4lCkBWMX2jCe5Kb+jRhTWfGXuuzg03D8bHGypxwF6+L0kl4t+rBj7ItV6IBrgvudoSgpoZQUukr7xgc4kgUCiRbxrXkMnGvYUKqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916573; c=relaxed/simple;
	bh=yOK9+0M932Fv8w++6KuKgmQUHcTKV1+ILyYxI4VoWoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SHce00mdEztlOA0D/Fub3ixCD5+A7vXVjJB2wx8HL0j2J9agQEYZ0AKr2cZnSjrOwkHDdECyIrTH/IrSL6ezOEl2VERlQOFHpxV2/BAifwTzrvg4VLINtp63nJtJjJLSircMMBBje0N3cSGrydnI9ijpUkI9sJVxz3Kh9WiFfJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0VprC32; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0VprC32"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166f1e589cso45749485ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738916572; x=1739521372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NAiSeXeQFULPrsnR71rc90kNrIOq9STMbYBYT8Gxm0=;
        b=Q0VprC32CiK34A/6/4qBp6jCKnjBit6OeNHQGgoK+pG0uQWWNmFRXLtffaew09RuXW
         vefljtkFo2iAMlbKB1MVqnDhJmGvhsHo86niTaI8gc3pgg52EbKg9rEIv+GsSNW6JQPT
         hs0n1yjDAj3CjjZT1/CDpeePfRJDSwodk3RvKfsEgpdXifhZYo90gIuu8pmEpM666Mk8
         nX7T9KMjqawRQuZgtlp48MF8dli8xPzFI1RzTyjatRIQsr7/JDixyu8N35YAu9rTXsTV
         to21dQwCBVgoCaDIqgIzslOiHkMyqyp6/v9Ic9BogE2UxXth/Y9hKzzEOHms0VClpVSd
         /ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916572; x=1739521372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NAiSeXeQFULPrsnR71rc90kNrIOq9STMbYBYT8Gxm0=;
        b=D+CLLeqy0CGxZCi/qglEXE4uZKOJ9h0+gatfiIDeRZBSGPijah7P0rQra2WjlmUSoj
         ASH9qGYQ1IKqHUB+Gm0DQyD+c2VTtVpIIwN148w3MEVKWyD34YHtjGJ5yP+duuU40H0b
         a8P9cXtH1qxFOrsrxZmpCa0W3/SJJFeIH7SL639fj11pqaYLkvGyc2LT06UsM/T7cjXU
         OzvaDCHmisMJ4CaHSXXXeWBMrPeme4ngeHpM/0Lo6jGMTpB+ok6n8LEag3hv5ygtWNzF
         Omul59HkBhBapuadKODRtru9GBYohkDIggtT+t2GUECQnBi8A9+Tyj0T47q7YM/VDeMH
         A+RA==
X-Forwarded-Encrypted: i=1; AJvYcCUvor8H2HEYJpYuHzZpxKvWvChyDF6ElVTyWMYezlzTYnr9lCDtPKjqEHDGuQPU6ztahKoH//Slm5snrMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YytN2iiVn5ok7kR8ExV09nAgeV0l1anrfH/vTo4ufmg8PMmWfao
	LhpLkPL7zydKEdj9q7HcdFKJmpXOQy+LvKZVc/uyja8SqV4aYfW+NetPOg==
X-Gm-Gg: ASbGncvbv1nUT2YQdwEUtbn+AfQMiNOyyYK0DXdzVLw5JxAkbQfjEcU8FFKPtPeiQF+
	eCX2r91lyCRy3zMY0qmUlCxyPt+8+0UixSOobq5ezBEDaE+mhioZcwNUp9CyaaV5A1S3ZxiEhrJ
	Eqd/Zxu1kkbGplRdxnLGAlvlgVe1D/h67dlr6/IhTAcCKLUpDuzq+0R7gqdKq2zqEdZ5mWBwAMv
	+/fSB6gGcnVLxTXzPyJUpdG8XE9HR5rjz8cbx7Qf6Of6ZbgYLiPIOgw3fKMJQgEnZE2YRryv9N1
	CKXqAmZeckcUphZ41IPPT0DApvvae736blxBq7o=
X-Google-Smtp-Source: AGHT+IFP0PkPcC8YPzxgcsn383QzhVWpFbsKFyeOUFvkKYl2b4/vjbneVlGKNLVhDvHbWmtj7ciQIg==
X-Received: by 2002:a17:902:fc4e:b0:215:6816:6345 with SMTP id d9443c01a7336-21f4e6a9ae7mr40673995ad.16.1738916571721;
        Fri, 07 Feb 2025 00:22:51 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3ee3csm2748197a91.31.2025.02.07.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:22:51 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id F16F6805EC;
	Fri,  7 Feb 2025 16:33:26 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/2] Add support for Quad Input Page Program
Date: Fri,  7 Feb 2025 16:18:44 +0800
Message-Id: <20250207081846.362919-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Support for the Quad Input Page Program feature.

Some Macronix NOR flash support the Quad Input Page Program feature, but
the 4-Byte Address Instruction Table definition in the SFDP is incorrect.
To properly enable this feature, a post_sfdp fixups implementation is
introduced.

Cheng Ming Lin (2):
  mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page
    Program
  mtd: spi-nor: macronix: Add support for Macronix NOR Flash

 drivers/mtd/spi-nor/macronix.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.25.1

