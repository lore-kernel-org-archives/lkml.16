Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE721A23BC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757287; cv=none; b=iM+aYM+zQeidsrCJ9CeLcXs8OpA37Gy+gThsmOvuyaht0szfS1j5Bh8z4AEtWLJcEqhBIn+tPrjfpKB70aQPE1R5TshQeufLmjnBFnitFHRYlke9uhJIUxygYjdlaL5gSU0jezTR4Df6bukQEdhOsAi9YmWDi43jnWDo/Oe2h70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757287; c=relaxed/simple;
	bh=oMFXT7wDxJmhYbK2LVrzIZ9SDu54LMiMUroCgY/pOvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrlSVxLYna3oeIDgY2tNVOcOmrKf6P6MV1AEuVUONDl3pvoGdS1EwgM3kz+aEn4n8QqadBe9viGbFBZ+WaoHDjYqvQb7CoPcZ2ed0zDorpZxmWckqkKNDNFTl3QKuDBBzmsVLAWr05kwPahVt0bDLAgMqN38cYgIiPz2cmZqDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=s/tUjjyG; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="s/tUjjyG"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 24CB13F471
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757272;
	bh=p2qZoCK71oV2fwf4XZQYjbzwqdq/m06Zg0K4kksLDZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=s/tUjjyGMU/CdfiBlWI0lWvKZWRRKBZN/4qHmdbLeZBsR1vI6/d9KAwckuZF+E5kg
	 /oP+sAbLQs6MsJH094U9qoq6GCdk9g9wXqOYkHzzs7xXvwLe74BGVdbZqrbeti34GW
	 2o+GCW5XI/zbKOZg92Sevtb2jVCoW/Vcc9NLqCygqlgKxXWIZ3lze/1IxbOZqk/ZzI
	 75hqrvsAsQPKTcEVerec1OB/kntfQZF3jlyHGeUS1JWX6Pkx3gwlvH4jXdIh+m9Rfq
	 A5OgcA39nR58sh+JaaHEn/ZnztlQg/gz5i/Hw+TlYGvv8wG9XHCOJSePakUCh+Dfn6
	 c1c4SAnsJjbMw==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf446681cso12533305e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757270; x=1744362070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2qZoCK71oV2fwf4XZQYjbzwqdq/m06Zg0K4kksLDZg=;
        b=CTNdbXD33aoGc9/yknFEEwqUOxhxbNCsE3V5+GMbTcrbR+KselaRaZ5ddSmD3QAp//
         GExq9YAQ7YHFzdo5W8EYoeP9xVTlzWaKZ3FVMX+xBzzzminoFpBMduXBurpHWT4TD8K/
         C8PHNUdFtN+w2IljO0rcmiPHU32x+KegrCZtJw6EHmHxadS7266n6kOLdNAWi6iOu8Dl
         KuzAmu7AV68StONiTMN7Kvq7wIysHD7jY9MIPyAava02pkr39UjyhSdoCqSaK4pP//D4
         Ie5k/8N4WfIRITbo7mZ3/OxdEhWMAU7Da6AVhEYqTyXnPC8Z38lsDUPTEZYnVSbVLaK6
         qF0g==
X-Gm-Message-State: AOJu0Yy2SMdYpIX4ELWPHnq4PoadzdQGkTp9xWRo4pUGs7StBTRHN5mb
	ovpde0Y7rBW1jsLgtrluONOWN3mVOk7PhFccsnPuXx20GouwFB/1se8cJzca6ThI4NcEHWc7/C2
	bDwTGXXu+M3f7Y1kaQoruAPUZ3BA40I4ODwqy2pS6F1cInNg/yd+mNXhL4Bf17b9heYKa82lLee
	REKw==
X-Gm-Gg: ASbGncv962FZvldcMntwR9YUPu2oeA0m3VeNb6yyGMtiF4eIhCQExzmHYLiCUIwv+dN
	Vk7DWFsRzw71dgpTRofsamwMzY1gF36svwCi6gsQEFfSvfaGyOJn98PgVk46oKyB1uQOdmmKtj4
	loOtDgAc5nUORbXg2fhPGeBiAJLsB8dCqbpy4h71jDbsdNnsg1hU2DAnCeJEjiz3rbT7x40H0rI
	btkKAXXZDh/UjZuceRs+bRY/SsvC+VqIi++BwWhe+fOet1E7DL+TGsaHrjx3dK+UPVkSP/tC69p
	VwadkEQL+KqP97q0tJElH/qekbkWUsGqs8oGsCgKpj0Q2hI+8QUXRFRTy9pC
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr15971855e9.2.1743757270365;
        Fri, 04 Apr 2025 02:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzljYwBBG2flhsp4g06fLXYGNWjZnWdtzlqJrb2YqtEnZEwXUq1n7mizwccKsgCu4tf7h/sA==
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr15971565e9.2.1743757270049;
        Fri, 04 Apr 2025 02:01:10 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794efesm44078085e9.28.2025.04.04.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:09 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] HP EliteBook Ultra G1q support
Date: Fri,  4 Apr 2025 11:01:05 +0200
Message-ID: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HP EliteBook Ultra G1q 14" AI laptop.

Based on HWINFO64 and APCI tables, it seems to be the same HW as the
HP OmniBook X 14.

This is the first time I'm fiddling with device trees so this is likely not
correct :-|

[1] https://www.hp.com/us-en/shop/pdp/hp-elitebook-ultra-14-inch-g1q-notebook-ai-pc
[2] https://github.com/aarch64-laptops/build/pull/135

Juerg Haefliger (3):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create and include a dtsi
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  |   36 +
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
 .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 6 files changed, 1597 insertions(+), 1553 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtsi

-- 
2.43.0

