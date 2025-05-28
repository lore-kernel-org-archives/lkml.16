Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B203223DC5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461507; cv=none; b=B0oCC8beHNXaeeBBNN8mncV3c5oBxtQjXKGWUQMzB6YcpYwoEsjCPTrwY8dyk+yYRzzRbzGWfjVQAn++UxelA3UU727tlYeG23r/Amd1PF270tvd0niR3GnkhyBcm+aDZ9+j/d6b27ngnGCLykaONAHrLlAOHeIe0JpWbrwonaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461507; c=relaxed/simple;
	bh=KlWZh9mGbhh246BLaQj3a0JEHtlWiPcz6tFTLPrpjyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=auw4CjRuwlJZVckyhUkbmScuyxoMaqHGeJTyDoXJGi23uoyDh6s3JmBLquzWQD7j4grj8sfnPMbWc66AnRMxMk3NtncutxKL+r+FMNwiJYuy2B8IgZcSBtV2y7IaPXoYyUdHenSWpE7ti+9pqug1r3c2C6g3C63ZXkyJFa6FctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLX+uzw0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLX+uzw0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so28898f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461504; x=1749066304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XS2deMVzboP2ASP6uwuuwH3ZN1J3py9R+W7bnWjgpA=;
        b=vLX+uzw0beHtHa3vJ+3ELXZSzKFIh7CT74/jk1mhRPpg1JFe9v+CjF+P+Rj+iRSI8I
         nqOTNf3ER3oOI67L/3a0ZMlb1l3TnBb2w8GMejjKdK+YNwEgGeRYh7vjfiHuQZCRqA70
         c9zJIaCCXtAMmUdbVX+0PpGpOqK0Jwflz8wFs2URuFbhGGJrnGMWByJwGnra0QtpeZN8
         ublE9G//PWqoST+TV5AymMPhGdTZbI6SzN1zTpMIOo1R9X5XnLEUkhaql3keKPXvQBdV
         7ljA0qTAtVI8+ydKHfdtCbWWcO9NDVCCx4y1VPrcXn+hCTNck5lbg7zfIQADCh/9qhfF
         a3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461504; x=1749066304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XS2deMVzboP2ASP6uwuuwH3ZN1J3py9R+W7bnWjgpA=;
        b=Xwu6IDnmv3Ru+ssIp9DgvVeOcfO3E6g3LoAGeKMaYLih2c62VZKhfjs+GHI+BZUYUb
         7Xp5lTokBnmirRGKKnV11GMBiktkcsAhupKRxauib2ZUnwHXJEQkC6b5D28gbdqPjkzu
         zD+LYkDzfgwqD8vgbBeer555q9+Mvp25b8e4h4n9QP3ip+BwjaYpCz2lmYUvjDTIlA5Z
         +hhuZFxrlQwerPlJaxW304+RnLRxUUYSsNTXrI4dLnpv3BfL3NpiN7Y4VYL7ujEPfVmV
         gjZ/zYIPam6srYmav1h78nKfySFNg/KxumPTZtKsMcnRaxXwxujRX/StJPyTwjiyPkQT
         kuKA==
X-Forwarded-Encrypted: i=1; AJvYcCVQfv67IzdiasYBAltg7pEB/JD5FE1PGonERwxzvNuPMKPLd0TGvlXrg3LKWuZS2qwBGo2z4A52LM+BftE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78s+FMVUE/2IFzYURIJCnB2b3ftw54TivCqIvN/Mx0kJkv1u1
	9pqyq8Nx6/ADhI07y8lK7QnOSVLIp93lLoLyA8Tbmo+XTdaN64CAsmLqbmQfj0q20Zn+wnXuX22
	S9wyH
X-Gm-Gg: ASbGncudyuP0/DQDbI8SQz38xhSrwDQgNyhy7mEnqRy9N+8oipTJ+tcnVzll0Z7a00z
	AvAA0MJtbjtthcJhOp4wmTEAYSlcSOCRjGTYzG8rPTHPaJOWuFJlT07YBx59RbQ87WvtTIgfaxs
	IbNny4bOVCUinyfc+iaU6Qj7ONrJTjNbbVm9B2HGgOpufXrezgdv5J/bVJwJIGqmzyIhVfwXVsT
	PS5SPitcBYp+s6L9SUNjKZ9voXzKXk37bZc9nkCnAr4dFT+AOC+YlTxD0ZiXZ8xdtmgQwotN9EH
	M3Rv61oJCX/vDTPDxY7vZrOghStSHRlEs/EwSgfXxhWCkuXQ58t9FOOFoU+BVQ==
X-Google-Smtp-Source: AGHT+IE+6eowk0bQqmDKzrEJsfMBGmbrEBcEQGWsiap3HMgyykC6Bl6Me1m9xy0Xn6tbPw7JfXAGgw==
X-Received: by 2002:a05:600c:3504:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-44e90da2cb6mr48842315e9.6.1748461504456;
        Wed, 28 May 2025 12:45:04 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc03147sm416555e9.14.2025.05.28.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:45:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] regmap: kunit: Constify regmap_range_cfg array
Date: Wed, 28 May 2025 21:45:02 +0200
Message-ID: <20250528194501.567366-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=KlWZh9mGbhh246BLaQj3a0JEHtlWiPcz6tFTLPrpjyw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2e9H6gpzQchhz5tE2IdHRreCxVO/aVmcn4ee
 swTaQu63M6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdnvQAKCRDBN2bmhouD
 1zlHD/9on3biqpsKYu0bS6pbEBz/r9Gy3w/3qo259zZNvpn4SjqxBbr9IoQML8N0Ye6BNfYd4UL
 n7BpdGfP2ToHUXqZcMcMcsYiZLiOBh42RW1plSsa2WdMaPqibG2Ubempl6c6EQV9p8BtZ4q3Oh7
 li+qdN4ZZq/oo8VZi3gGQIXUDvARTeVUiw/vZJozVfvHVggJao5K2KMd5aXEW8VPlK8WS7JX9SQ
 f366s8882U2BLPYFiHmKg0qntawzUuN67JGyxhgzGClukjWuJvDZX9gCZ8eTfIDJwwNEzSyiXex
 BxNuCjP21XqIiDXmeljU5BoktncGzwmJ8K2mQhpp2dyeVgtKE8cieF16SuxLm7irFj43X9Pk1nZ
 EM+yfJJ0l9Vw0zYC+7XyLwAGQ+T/pG5VC5nJL1kp3at2+9yCaWd2RX2XAQdUgSJbrAW4mGftWCK
 j+FuNMYBN7EuRr5Vf3iZYkkALCF1kIXUzIwD4U3hMZRy5wNkQpuRVW31xSEFSLF6p4f4PbO14Op
 1okbdmQgNPaJDe5eMqqizg/5lYCSbGNY2l1IYWoQaO5oEKol6L3+wE21umRASUd3Zp1kb04m9jz
 2k9QZ6s/YMquaND12oWANoWrV8Px1lA95tiGmNlAEPyHxcPd/4xCyS5JG0gTNnlJ4/VUAlgPPo0 qszQNPZj+IFw3IQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static 'struct regmap_range_cfg' array is not modified so can be changed
to const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/base/regmap/regmap-kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index 64ea340950b6..95c5bf2a78ee 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -736,7 +736,7 @@ static void stride(struct kunit *test)
 	}
 }
 
-static struct regmap_range_cfg test_range = {
+static const struct regmap_range_cfg test_range = {
 	.selector_reg = 1,
 	.selector_mask = 0xff,
 
-- 
2.45.2

