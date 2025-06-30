Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870CA21B191
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272266; cv=none; b=LdRZuq42UrLoStuJAqL/I0TkWV5G5c7j8lBmIoEbrXefDJcwX1GP7zyTdLuyMPV42CUZSfQ2XRcWboiANORJfGvYXNFYPFbAevHPl6DaXRy7MAZrKBPxDSk1hy/V+6445RSCwP62IZQITz4OHuI3p8b+ubJljpyGq9vacinQbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272266; c=relaxed/simple;
	bh=5k4q97aqdrBVMH/JPdwcedXO/G7Da2JnUoHNlsI6Cnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VTWlb94JAm9SO99O5HjEKwNsPiDVf7wWtbU6oVNxi+wMZZd3//4ctOb6Sk7ek0IEWHYa9WLxp5NymObahP9BRzQT2NpNcVhuGDKydiSFE3Sq4QCnIe86hCrrzwjgh7A+5TEthP3R58LPjmxPYD/vhomgUGHdHzoB9f2gfI51NBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asZ5Wx8k; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asZ5Wx8k"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1778227a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272263; x=1751877063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbZMPv0y3qJS3SDYqu+8oZexHymQrdcMlRD66G+arTA=;
        b=asZ5Wx8kqsEQLM15Q8J3bu2E6h5sXFVHjMeHqskihWEsOF5OTsi2rx0e+gLXkPM8RB
         cvVv2XrsjERLk77c3QbObG6JC9cPNjfZpu9WHvGH63tnqqDKHQ7O6p8cNyj1FHOsrfuz
         HCWFMdZ+wcJQMvzeOl5dx9UXOJYvdglUeT323dG6aBdewg+1TLM3xEVVRn9l2Bpz8O1j
         zdnZuE0UeLYVIXBtPJtaQK9u2VO8bSMcysFgPqEHJppO7Gf0Drw3VMPOz2EGJj2BbP4X
         kX5G6o0q9nU5mZgZDn1YkQKBp5pkFDh4bravEkq++Vunp23Howfb2LKnVUbe3qPLc5vO
         nWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272263; x=1751877063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbZMPv0y3qJS3SDYqu+8oZexHymQrdcMlRD66G+arTA=;
        b=ohyMAGf5qMyFz4ImRwjLAQwONrFzD+F4zv2RifIYMLUoDtiCD5tZIHc1emK7rphluR
         c74zh/VXej3LOtCiqXJYNqC63r92yPW5dS7G8Tjpo2r3e8yqJHgJlysXqRQPbtFIp/Hx
         hbLuDLrBJgiEFPJerNEpiM3GQQmFc4+fn0tCDVwRSJS/s9LaoguvWB8Ry9JlnvGlj3jo
         IUBOjUb9tKCri++Rv3DQhvZw+4cDMTWuiKyIzBFnL5I8QKRINbg50L8E4OCuSHIAQQHI
         Pw4m9YeRZp1HFcT7FxLOHhzCRrtcwAV2KIqPDCkHTd92o6Js3282y2ODM2rNLFLBxyR4
         aBew==
X-Forwarded-Encrypted: i=1; AJvYcCXNebhrTIKyr5uhvjY9+8c7P71SH1iHm0oB3wMEZ8FSltHcGU6nNTO4slnqOR87H7ZngUq462WxtFjhxAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKoVwCulFJwsT7oo7rbtGsLhWzNn18x9pZYaKVQWbXU84bUXof
	g9LSANb23iPfqx6WZrHOBaHna8sireiMb8U6542oWMnFL2sUYNtNw4lM
X-Gm-Gg: ASbGncuvanRa4LH62KodVXC//XyTyaoO/wIFvdlJR/+fhTK4Z0YvayxevrX40X9wvxj
	eH1czBnhVxVT0xGq328HWuUjNGPcwIvb4pCeVWv3lMdL3XNlIzx8t1/BDhDBkIaToWpHk2SM7W9
	dFs3dI9O+crWbfpcRk5ZZ9UP+U3Y832YLC5k0wuALV/N9HgeOi3V9ufY5FELnqTiTAE8LYt5YFX
	EnFnWJ3ELkINTE2/Ukk6mDaA02Z3NE2J+4EjdXSbg1ovTyFN+CMgQqwATEAiYYADOCUsn+rTGRu
	BGXkcFK4QP+jBwrt2fRdE/Y7HI7iYirPvZbHkowx11rNK4mmytNo1oy7YQrFRJpXj/MdJ9Dzlk/
	mxTc=
X-Google-Smtp-Source: AGHT+IGe2RZcwGAvMuh4nvpZI3ONv8WljTrSXxJF7JbxbmKyyyBwZHQq3owGx3JexR93hUNRNpw4wQ==
X-Received: by 2002:a17:906:d54b:b0:ade:9249:25dd with SMTP id a640c23a62f3a-ae0d257550emr1814240266b.8.1751272262484;
        Mon, 30 Jun 2025 01:31:02 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] clean up some code duplication
Date: Mon, 30 Jun 2025 10:30:46 +0200
Message-ID: <20250630083049.103734-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up some code duplication in the files wifi_regd.c
and ioctl_cfg80211.c.

The patches have been compile tested only due to lack of hardware.

Michael Straube (3):
  staging: rtl8723bs: remove unused function parameter
  staging: rtl8723bs: remove unnesessary function parameter
  staging: rtl8723bs: remove redundant static function

 .../rtl8723bs/include/ioctl_cfg80211.h        |  1 +
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 24 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  | 16 +------------
 3 files changed, 14 insertions(+), 27 deletions(-)

-- 
2.49.0

