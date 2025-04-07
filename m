Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056079F2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012785; cv=none; b=ZCP2AzItSBdqmPi2tnRD8/1pbYq38wnzvIR6Qkvlc43Msc7RYsdI/dWmhhSIcHh1ktod3jq4B/YaeFPvXeV7Le/dJd/vwGEluMlay1mmDla4FO/+FqPniv4xbudzjNcn5vUPG1rvY/44/IRlq4puzQiQ66D54lmqMhx985xf1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012785; c=relaxed/simple;
	bh=B0DRLzOGa4TEEVqbH35RcMND1K2dRaaV6dHohRtq7bM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cn510eFHodxoMa9sPCzfLRunDe9qugVvhrI0nc/KDcM1cXvARtQglL8hJXm2q2BSyHSfPmaCX/f7QmsBGPzHXqs7O5z+dmgZ3hp8nOCn258al0HHyqgj4CkHeFQ0x17ixvCgMbTNkoR8Bs4i7vGaQvaqTvE3n9u1fCIALElGruE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXy/OSO+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXy/OSO+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227aaa82fafso32400335ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012782; x=1744617582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZvQeqbNeFtipMFJh4QLnF8AgkLewuOgWJqAelmysqc=;
        b=FXy/OSO+5WVaryQhIfUwzPozEsEtEoubyY9RPgRaJ40RtY6XIZkiYFNWEyuThz4zlE
         giOgv25gZmLeCe+llFFghqDmV8H7jg3kvEPqbwK3h+u0KP6qrNHiTl3681quv4q3HEFb
         642jjufs2s9E8Z6vv6/X6I9AwOAbWrmwKZ4Cz3ifrkYz6Uugw1uWVSTU1GfktUZszMij
         8kdwToedBYe8/y4Y6JipBNOqhENeneiy0hewA3NXo9d79GejDpJm8pEovhqqa043t4jn
         LZ3JuEp7M5RSvB+ZePEls1vDfHVX57pAD1Xf9OeaKtb1lMd2MSkr+QynZoRq7xNB6JnS
         kwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012782; x=1744617582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZvQeqbNeFtipMFJh4QLnF8AgkLewuOgWJqAelmysqc=;
        b=Bxg/pOxvn2SBNdBMxI9LnkSeChmdXknMIoiOAAqW96+XSXGD2LoGB9TGX5Vb94y9mN
         eegSVxap7m1WkBdVIJa6ZIgxClzf5CMgitGEixeRjsqjUtQXnbWoCTw7qEIw23jGkXTh
         IfYV4KJG87Kb8bdKDsstRSaD8yTAgFs1in4YvjSGD33yFoYiCtUUxrJ+rC3jhjOloTjX
         TwcyKjbgqgLXikqMNNp6bj3otKjRqlGxwtpaLzH/STRoQ2UnoYEGu80J5xiFaU7YQWD1
         2Xmfc2IxPLs7S0aWOcJ89VxYzw7u9W0xobbEMLmWWuN9QxG8lDD9b148RIbQ8Rvc6WAn
         QtJA==
X-Forwarded-Encrypted: i=1; AJvYcCWZOiDgiQAsOQkj3RSDT+GwUD52E5yxHVutOgwou4CzUR7ymBwq5UC0TEC1tmL41E5sQlOmkphpWXkKXDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQh9DcK89w13VFhJhZu9Npetgzg9I8WuriefSQq9wcpQ18D3d
	6I4CIAnpYydOJ12ud/8t8/JnHL/0z74JpBwHS0WwJXo3OiUOKMVk
X-Gm-Gg: ASbGnctGCOBMNIryZtNNR6BxaM29QekC5TEqJbiMeuMAYFW0bU5Dt4iz+6XNx9Lt0NF
	8Iu7rx8dhlrAftdGoBjR2xhhcLc+ptlkwTWjVFn1TJ8ERI3pSd9e7emIS7U2owm4FYhIM8HsMHB
	44Se/Fof/YhBB1YtB/dkynpdUUZOTfHW0C8Z6lvzuOFBcib/2AiRf/qciy47zzWZEW+jvUBKza8
	5Qjk2MQ8kwsuM22WtgU5hONnGCkp67if43FC4I1drkqajk8SNo8EWijoICqgXv5BkocNWt9G+XT
	F4yYosfY8YO/N0rMqNApxCtpUGM/30eEHSsxrAm2w9C7opPDjH+iO7NjdcjQub/p+T+h
X-Google-Smtp-Source: AGHT+IHLU+fVvi69Vc+tn/XdT8uaHoBkyQQYhXrJ1flpQj5IijSqiWEQOMNP4LSCt4YNzX0V1pOGeQ==
X-Received: by 2002:a17:902:d50e:b0:221:85:f384 with SMTP id d9443c01a7336-22a8a05b5acmr158540105ad.16.1744012782580;
        Mon, 07 Apr 2025 00:59:42 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865bd80sm75046705ad.118.2025.04.07.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:42 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7D875801D7;
	Mon,  7 Apr 2025 16:08:38 +0800 (CST)
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
Subject: [PATCH v2 0/3] mtd: spi-nor: macronix: Cleanup macronix flash info
Date: Mon,  7 Apr 2025 15:53:57 +0800
Message-Id: <20250407075400.1113177-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Organize Macronix flash information to make it more readable.

v2:
* Support 1-4-4 Read and 1-4-4 Page Program by adding fixups for MX25L3255E

Cheng Ming Lin (3):
  mtd: spi-nor: macronix: Drop the redundant flash info fields
  mtd: spi-nor: macronix: Remove duplicate flash info entries
  mtd: spi-nor: macronix: Add fixups for MX25L3255E

 drivers/mtd/spi-nor/macronix.c | 73 ++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 34 deletions(-)

-- 
2.25.1

