Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1A1FC7CB;
	Thu,  5 Jun 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133663; cv=none; b=dKYOxEiZlcCylwA3eBGMxF1VGa9STCEn31+x4Rz/bBawSTdFJFvdI3BWh5BphpT9kiEhyt3Nmij4wazC1wzq0+numylf71IT0CYHE4FVrZl8YxPBSxd+t0W7wunhPqRfK8OZz8nGN0ALx77nzdaoWUCUoAjDJXbxopiH5VPCnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133663; c=relaxed/simple;
	bh=A5jD3ejRSvW3K9NWhSoFtR50fYJ1zlYNSvIe9r5kN0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg6uecuWZZuKXRW2MuVoMQ0but0tg5azYS432hF0T9Bawoxsri52CPtFsu/jq8tq+nPXsQNMdkkAGU8fUHRem1jTHHy0vY5txbazitJLExFgbPfyeyv6GZyDgBkIrx4qCHZbzSIkBrKYnYdRS5Ij3fABUFjTW8j7z4k5tqdKy34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwWCdkMa; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwWCdkMa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so194570366b.2;
        Thu, 05 Jun 2025 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749133660; x=1749738460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57xzO+d3ZxX6n2hH4vAXrDJfqV19fBQyeOjTdJ3CZDw=;
        b=SwWCdkMarS1Jg0EgOZGTq3siZeubvLsPjs3JfRS+hcd3GuQoxDAkqlcNDxuA/aG5Oi
         xujS6VvD6PU3ScYGwxhfHX1fSjrsZoy6lmJk+As6EiPjezDV+6RfHZpY5qIuTIISeXa4
         mzK38EC2oEkj1yEFqmhbMvogOlhNEqxuTTLIdKJniZpNBtuWIJ51yphN1jHjimHRYT4Z
         D7hg/O6FN3koW3UpWndw7wd7qXWPaCYHNqC7DBkqm3Pg6nhC28oagEmzkPzwd1ViFE/y
         MJj70rMGBF2ADktP7S+5W5GpWsf/x1max7TXtIxE15qdt359oh4xnw+HweyHlajjRC3a
         rT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133660; x=1749738460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57xzO+d3ZxX6n2hH4vAXrDJfqV19fBQyeOjTdJ3CZDw=;
        b=Xm1PX6uTABlI/JJov4e1nQHlDZyfyz0CZ2io+O1iSlZ+FIU7K56fun57k0h+00FmvY
         CFiHKElSfZOI8RKgf2O8gRhtl9sDbJ9PYzqewQUV5+sQ1ntk34VmPJE8qFiIZ198sLa7
         cbmEtDa67AAabcsb1bEhIRQgvneD8aOwQyozCjxcmcrWveoKiCEKQPCvsD8QEaPsSWuj
         +cLpNVRJaHPRlWWhX8WimVVq+sB8+ks25zxrGuTPyTngyeUcs4W618Tq8USX84tfSFw7
         IWUqhjehAU+axqyDBANK1kJqZg9ktEZmyPJJpJs2fK1rtCXvfl/2XxUf2oKI0y2kzbIu
         gNOg==
X-Forwarded-Encrypted: i=1; AJvYcCX9UKhOmrWDGIAtEbZv2Ywu/EeLLAVHyG8Ab4sfM2rIC7Rmsi+KXR8t9sQlUBXFZ6o5um/yhodrC5/HurMH@vger.kernel.org, AJvYcCXQxG+vhrJcKSqS+X7JwLHjSsc8gj3lDXaf5qCoCrpMBCG9mwDQrcgJBNvyhE4SZ4dbwONdy6fX2ADl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Yz/6cRXrs0OCZUR2d+/0Gfzld9Ar+mcexu+9Z8MijcnMEmz7
	7/F3aKSqP5V9sQxm7w9kBe4dR2vUaCB1nkzUm3ihTQMESuQybo0q4uO/
X-Gm-Gg: ASbGncvQbz/7u7o4XCQyfK+Ih1HMkE343nFToLxHKJKNyp1M+Tqh1aUrWFY+AomDFQc
	zYaKyj5y9KDXzzm2pjp4MtwZeetiFDGoPVXWcTozxPZ8FHQHGfekJA3HsLWAihpzbkofQ/l9aRp
	PDvsSf7NO3W1+FQLbvHD23v9f0/MokSDe9ts6FmN9G/1wkU97mXqIVE2b1o0IgRkHBgnFZEzAuc
	3yef2/AFSZqBApHaswe03xn3K34p5K84nqXchcSAobf+dMNhKM6TkOnxze2+EDd5S7C69DqUQGE
	vFs/D/FVe9TSPhJjyfWaOxtehZRAhtd1jnvCxghOmKNUP1hMZ47AcQ0=
X-Google-Smtp-Source: AGHT+IExXKyqipY7/C64g5PuRqJqC74nzuFMZGh4GnDM3TITTgJ/3AnkOwhim+3iKsxFUIW3s+firw==
X-Received: by 2002:a17:906:f5a7:b0:ad5:5302:4023 with SMTP id a640c23a62f3a-addf8f25567mr616060966b.44.1749133660045;
        Thu, 05 Jun 2025 07:27:40 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e75fsm1259338066b.81.2025.06.05.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:27:39 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Thu,  5 Jun 2025 16:27:25 +0200
Message-ID: <20250605142728.2891465-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605142728.2891465-1-goran.radni@gmail.com>
References: <20250605142728.2891465-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..49fa640b6806 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1232,6 +1232,11 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Ultratronik SBC i.MX8MP based boards
+        items:
+          - const: ultratronik,imx8mp-ultra-mach-sbc
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.43.0

