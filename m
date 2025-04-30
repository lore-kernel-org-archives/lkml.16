Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7EA276049
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038515; cv=none; b=mWGEm7mAZk5HKePPo0OvCfojAmlr7nRFoJLocq/L56YKMxUPKBZttNHsjDWEBSVRrTm9tp/htgluFpKSzu0xGIM8IsZyBemVRLJeNajLxnUfYIxIwLIX/2rXSNBBrqgfdrAQmVlkh7kqYLVOn8KKFMppIgC8KFhhL631gIyYFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038515; c=relaxed/simple;
	bh=Jc+rFucwagITVejvWsdUcXv0ICsgBsOW0bOeBjyNcZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPW3p6/D4vqyl5Lb1PGz0ME2m0869OhYk6Wf/9cf130JNPdSWv9yIjTfQEi1ZDZTbWHOqq+rFzBN1afg50hgru64rcLUCpwLo8D1n/mT2gxjIQd5gE5Jilg6UjCzOUKH+x8DL4eyX8m5bo6kWcvM88Njv3GNTmdudDrKDG86fuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uwq/ThB5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uwq/ThB5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39d73b97500so3183f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038512; x=1746643312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoOrc5kvqzdvNTiarbnictWUOEWhAWEFCVfxauerpPw=;
        b=Uwq/ThB5xGv9yvkID2rpMHKSaqKY6aBo276gd9cliYg0hJNO+HAafdOc6qtweX8bTM
         b1PYb5HhunWrr882h59c3Z74FwP3jupf+GF+szXJsMFDeB0CBxhqcNFm/lGYPsSM2a2l
         0VjJ897D/39f0+4APmltcoR7ddBg5JkhUatdeCMjv/QvrI3LWPeDxRA65Y+0QGz/TQGN
         cVRqQ0jSUBXMctUXLlRF0yfCxBiUwjEgHv1nfZ7N5ZljtJWjifG4DfnZC17OdHO91eoC
         WIp33vipfutmyUQ7ynabWpqoV/5bgUly+8mjotS/xccnw1Dq7IaK2UvCpTRqpY+3Yrt8
         QMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038512; x=1746643312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoOrc5kvqzdvNTiarbnictWUOEWhAWEFCVfxauerpPw=;
        b=EEmB5/Z5+/K43BNLvICs8W4xVsZceBTuF0rACADcfABN4RP6aUh7vXBWaK7NNlKztm
         h+o3/+esZt5f0+Mrvd2Q67JpyMukrATvCuXAfNZuFjwrQv8uZ+XAJenqiImyODIvSRrk
         uqR4yDYeai0PvqW3+1GpHu5oKiJVHdLJaMRcoX+7QdgGHeYpKkPWLHl2Y7bvY3uvbP5q
         kClpq0Z0LKwH3hjQ0yIPBH/lrwQBIV2pRJByOT8LQybldFXfFqqgv1CV44NsyUZsDZ9L
         63P/vDmcN9jnyKnbzylI6HO/f/G5yDH1cswQvKkMGmx/SRI6uM4h9SwG3NbWEBGaDIkM
         zmuQ==
X-Gm-Message-State: AOJu0YzjdjstuiO+9+cFciN9XmvtuHabcckl2BReQejK5Hq0nCpRxovl
	AV/m/09ZTT19ovXC7045vxt/8ISDTjx38Up0C48AwJAizNhf38lZNQ+qO0dPpuQ=
X-Gm-Gg: ASbGncv1AsSJhHGM11Sm28ZHc+oDiIRDj2gzDJbvZoxm/Bx8JqxWVsPYpNj3VUmf4Hi
	B1TvXsWOxxsBb8bsgdxI9CP31oPXdNQHbOMxRvHTxDq/oJMk0hQWSu1nlcUVWo8E7XTtJxOPvnw
	z/iJxfBTRR6zg11RfqYx2p/eJUQeZIG4uXR8t2GdDQpXXIGZWrVnkj17IUdswiL33L5QmV/Rtl8
	ENF0+HaG+mKZ5Gw2YL0LQUfmoGlA5/qFHSZXsbUPiuWzB0x16QqrISsPLvx3kQbGjUMAGb+1k5O
	jogWN7mFJSlDD9Ffj6SvMtFpamqfrg2WzY09t/qPjPOvkgln+2gIt+l0K/U=
X-Google-Smtp-Source: AGHT+IGq81Gr+U4BorSC3WRcRzmGHBC0m1dMZ6WC9pFeawNiUb+t4q2t2qM9A1gIrYSlBzxLAqFBqg==
X-Received: by 2002:a05:6000:2207:b0:39e:e588:6727 with SMTP id ffacd0b85a97d-3a091a48901mr511146f8f.2.1746038511734;
        Wed, 30 Apr 2025 11:41:51 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 20:41:34 +0200
Subject: [PATCH v2 6/6] cdx: MAINTAINERS: Explicitly mention Greg who
 handles patches
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
In-Reply-To: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jc+rFucwagITVejvWsdUcXv0ICsgBsOW0bOeBjyNcZs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7mEDcN5yDRbc7Niw33zOpepp8oOEj32J2+H
 M6pJl8Z0ViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu5gAKCRDBN2bmhouD
 16+KD/9ncRRYSryYepcDjMNtvqnLFrmbXgrU5cFjqRqulkZ9E1Nf1MdFaZmaF1C4YDGL6LgRHpe
 +ZSCv/ztJ+PBq8e9yxlg/wHqXrnJQwqHqG5+jLl6m34C+ErNLHdeabbSBwlr/kBLWrN1wluD4Cz
 YbKwQ8AU8Pz2KwzDr8tn59KP4DEHyUTMOqXz/G0MYI66qcqORnhI2ZeCUNx+wF6kmOjwPCh9fqr
 5IB729DTi0Jf5j9iLWdwKvKvWpDNxv4luYlGQmszxxQH7NTQti9ZhYhEQNqMkU0ySBAoNEw9MJi
 CbHHcVuIO/H18qKL81qpuTNfbG/Nfh9xdPWAZC4OQR5wt3K2/RwEu0WnCsL8bNEQcCR/RVZoRU6
 h/8GFIOFggjMAsrhwawIN2WndK1JpfG1VHmyqdj0HRiYgv4eFwKQeyzeRZivuCxzLseBOA42k1F
 k8APlYWH2Lk5vLz3UZ9m6C5DYnbFBlXlbW+p2aAcPq6PDtggV6G7abdxXhEfkCZaA8ILEgDEd+Y
 p+L8uGSgGa2JDBvIAuyOpAPV5QmkkHTRG1Uf+w0JuAbOXAhrDYcCGoep5PvVcUPMjSIjQ6T59xI
 aU6g2tIpagTxcYSIDUp6TLu6qNLE0jnhPHaJD7eyuNRMzijtORojoa/4YO7XcebT1TnXTNWjEQA
 3cnJhi3S8JgcirA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
him in the maintainers entry because otherwise contributors would be
surprised their patches got lost.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
 F:	drivers/w1/masters/amd_axi_w1.c
 
 AMD CDX BUS DRIVER
+M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Nipun Gupta <nipun.gupta@amd.com>
 M:	Nikhil Agarwal <nikhil.agarwal@amd.com>
 S:	Maintained

-- 
2.45.2

