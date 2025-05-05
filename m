Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1A202C31;
	Mon,  5 May 2025 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446321; cv=none; b=OCAQcyvps/6xvRd2LI7wI0LKf5e7lzv1SJEGc61C+BShuUoXyCculWAs5eTvdm8lRGmeSPliMWEH0q8wMfHTC9255VIT2eflDCWebr+bSDos1zgYqioJSPrFRu532jRVP6700L4P69qpVJ7Jp8dLbPRbKbaKs9KS19PJbrzVGHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446321; c=relaxed/simple;
	bh=PNKJEEVGycdJ+tQ+sEFPJNzy8pM5+OVhBFEET0bQUc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxbvOY0YdXJI47W1G6CvM4w+DT+X46+hKkNu/KO8ZaqQm5PC0dOolG4tM5e+FIdcbgw0carNkHXDmOmvBeeKv2l5Gz2vUTPrUxrD2g1ts/63widQbRBgkf/zr+eOwDR2Z0bPggq0jUDsTYebqnN1v3etEV70lhmPHHDfvz4re/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOqjPlDB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOqjPlDB"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so799508566b.1;
        Mon, 05 May 2025 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746446317; x=1747051117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj8LqzgywDdLktNaQl2/tPROCtLvy0Eh+7/G4UMG7Lw=;
        b=MOqjPlDBPmV9McdSMo773NclVtprqMupvmaGJasn+ELXEIYR4IZNwFobZUlU/95IDi
         d7pYFBxTFI2fQzWhYZb4j56OG8TW00eymnkeEP4mqlY/q7jRPyQDPIyoa2KlF3Aerr1V
         ll5qNKu05/dNgF3i+jjD26fYRxhXzQNvWoLV/BUF9+3xP3NISe+RpoXFafdqZjHK5wtB
         /kNbeDNS9jMxIaFSSiXfNJTTagQ8yTEvtqNc2XXROL85t1MHn3CKnRQcFcFg2ruIIHbK
         Mo0X5sKIrMF7CUPnDHoZ7FX2KlTj1yactiwYY6rrmaRgskXwvwEuFrVc71EkoGumMEJx
         rzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446317; x=1747051117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oj8LqzgywDdLktNaQl2/tPROCtLvy0Eh+7/G4UMG7Lw=;
        b=QkHU+mBSmkXIz19livO+vR2aUYlsLzmm7JAaDZM3NCerg9qv1d7fwz1rHeQRfG7LXt
         vkm3qBSO893zIbVVI0VxNo2CpNdRZ/6OKDsn/yWCq6XpxNMPLnz1jG5j288L54Kxop1D
         7uGQdsM2pnEYlx/sHuzpB1pGFnTZecVg0LKxSxftR1NWPGKg48fzSfQ1qq7VuvpqmdN+
         1ZrXvQnZbncZvJ5t4qM5aVZo80oL0GtZmr9YYPc+uvUFl1kgS8REllzRJJtCAn5eY0Sc
         iEN37b63kDc5OwxBEylWdTD2mRmXVrGTi5xq71OJwO7b2jklX9pkolSlpjkEj/mhJVny
         D4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVXJcGtXy8L91iRCY7GEsTA/svDeYaUm+LMP1sntf8vdtAFXnEVRrQDPdFghtNelPF240da4XeqhGEz@vger.kernel.org, AJvYcCW4ihvC3ul3A4Z3BXCeYpTKXW3WR9yD6e5FH/jAKjt0nNEk8bSkNKQ5RS0QL7kOB6rR5c1qFru2g+QvOdLT@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCJrStIqgdEr2Ef3Jmn5RFD8rd8jNQ3gtuKQjmRmQtdsGthDO
	8G7E++FrRaXWQ9exiHKgRmr60BrLhp/MmEdDfGU3EHZUP25oCmJVI++Aeg==
X-Gm-Gg: ASbGnct7S3cemCKfd4Mn/nWTJGPFqUYeuefXkCYWPkZT6tS1zP9pWnuZBJMj0DOlLQ/
	ec6YA+SwIpoaWwISe18L+/23DJ+YrVy/e5nXCwN2gXjaipgZvNqXUpBLJXcWnwR1LQbTm3y8gWB
	q60XqdYDTHApdN+UHulAGvlkjZnvmyiW7BDan8g0UcH+uf3ONaZClYXBiB8xuMkRiikcbDaLm5n
	77NaU14OYYKcJhMo1Y0cd35tQkVVxWvr5lYzMtMb4adlPun+/vohWVHc4tftaT2mRID0u4/laeH
	ENQFkDrpG3F0lii7RC+8HgY9vaIml8fgvp2B6P5cbOer4HN70bj7MUG2xIpTFTEyiIk8aMIn8Kj
	2vA==
X-Google-Smtp-Source: AGHT+IGuLaYqWrpjCf9NhPWgUT6Ez5XxNFvR1TH2aXGRsMBZS60auCYJxL5AZAhLmfPjBLi21bCElw==
X-Received: by 2002:a17:907:7ea5:b0:aca:c507:a4e8 with SMTP id a640c23a62f3a-ad190654f47mr786056966b.21.1746446317092;
        Mon, 05 May 2025 04:58:37 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c53sm489568566b.56.2025.05.05.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:58:36 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add Ultratronik
Date: Mon,  5 May 2025 13:58:22 +0200
Message-ID: <20250505115827.29593-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505115827.29593-1-goran.radni@gmail.com>
References: <20250505115827.29593-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ultratronik GmbH is a German electronics company:
https://www.ultratronik-ems.de/

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..e9f534c21bf5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1607,6 +1607,8 @@ patternProperties:
     description: Universal Scientific Industrial Co., Ltd.
   "^usr,.*":
     description: U.S. Robotics Corporation
+  "^ultratronik,.*":
+    description: Ultratronik GmbH
   "^utoo,.*":
     description: Aigo Digital Technology Co., Ltd.
   "^v3,.*":
-- 
2.43.0

