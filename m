Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317961BBBEA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179882; cv=none; b=eLAQTMSE4mxpyRT71nqf0xRZ476P0z71gP2Wag+Uk0C3w62Zlg85MPy76NdnrQ0bKKuB2I0jwNikQzb+/3B83a0qe2Uk+OCwOYUtM5xEi8J5fybmG1dPdLLtemWE9FIPutL2JOcvrmY/I8198R+TC6Mkvecwf/+hLdFOs1Z9ROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179882; c=relaxed/simple;
	bh=PbZVAwdPt648lZ/TneEvg00BNbg8dqUm4qDKQj9ymcY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QirmYrQr0Om4ZnLHKBT6Iu7Lhi6IFMBpMdJkJC+U2nOCTCPMPBFurG8mKpPphvkodTDB6DdgrW7NdQG5MKtlmN1pXyl6ky8y3+qpwLAMF6PU0j8epvHqWXYouvGrbcoAkZ+OM0ZGgLDCI0vqGCYxDyfE+jtXrleLKD+z0tzK1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MvAWtK7G; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MvAWtK7G"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-308dfea77e4so19287591fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179879; x=1739784679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2hoVQYicuZ2m33t81d8plIbjrw9+RjXqm/sMzy0VP4=;
        b=MvAWtK7GwxfR4i6bpjzMk2v+KMyMzg3A1p975YkvtGLAvPFo5YqJSBP1C77KJYLEOv
         f30sV+wbCoBtTp7paoAmV/Zrly8kUrQIpytgpCdQJaHRTuLdJQBYMzgkcJFCtWB0MMS4
         He0w/hjsngmI28IzbRCjSr8d0vCgyGS0eGcOoBmtzkH3r1RKOv8oo8gvo68qkTS3slnS
         rt1AdbbnD3khMZfpj3Yy2UlrYChdbVqCKnwguNnp+BRv/dBE/4AksH61fmT6BXt78EfI
         Dy4Pm2UuLUdI5Tr7lSP/Ds1BT1xDO4Yj/Mu4DCpdkfRHmq6BPAgBlAi5l3nuyY2u6+uV
         YSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179879; x=1739784679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hoVQYicuZ2m33t81d8plIbjrw9+RjXqm/sMzy0VP4=;
        b=kwbVzKi/z9Iei6JllYHG1yBL40vmT1e7F2ZdjRA72P22pbegjDmEVTBtelPQwqI38D
         F6tWNnVaauA3OioFC5PoQSno1Reqb0xvVxcEc9LXm+bucdNAX4pfSzqOFIzv1mNSmj82
         ebhsNiu84H1s48lqSCQGF7mkiKss0Zg6zRFg0kqf5z578fqcFGf9tnnUgltmSK3WcyiO
         mHJnfILaAeGiQofsuclRBfnb3brOV77giyYx/oNRgJC7yGq0pvtJuxPDyx367boVwtX2
         pqMrI4MZZqljD5/gZWFQkPgLz1SgvnPo2iQsju+igwArFau/BbBnYhRN8bPsFPm9Kbhg
         SrNw==
X-Forwarded-Encrypted: i=1; AJvYcCWjpHF84si5wQY2xh5yW9/sQRo/wIyFQbH85TwOMAB6myssDlnM7W7JBYkiybBSmaI6UghEb6mX6a2nUJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFNkWhhe7USxS4Jrpecaigk/R9osJzBM7OuNZ9gecMFSYG6Zm
	gue+c9s+bRCVMge69T/W76821Y8y+A+uU/VTObWu0TgUehYrZyWurdL2K3nEf84=
X-Gm-Gg: ASbGncuQmFz9dddxsFVGc+mn6jCKBkgRSNavnvcYC7Yf/n/M1iGuX5+3HynXMfIhyY/
	aYQdig1wkwhXCujw3msTNhYD4yp8t9Su0uhMFZtiAFJIkEYFMVX4+AZ+P1z2lYJci5ZmKxA/sMQ
	6Lu3m8H+Q20kmZRmdcLJ93Ddv/DFgEUgSXMqI+NKUxMO7/UX/GPJVJN+EJWU8+WTkohVKlv79w/
	5QYVRS4MAQ80qz61Xd3pUNaiZuk0/Kbrr9Czr37MNn+GC8wm37RuT1a5tmUT+qalRxOhG6hA5HK
	aO51/jECcT64lLGLidWQhHPs1g==
X-Google-Smtp-Source: AGHT+IHX0bcCH12vfaXXnoTFQKZGthtl9t6b19AdB1KITvJcWAHBCcPDJAHJV9sCs/EYFlx8O/JUOQ==
X-Received: by 2002:a2e:3a11:0:b0:308:ebd1:ff6d with SMTP id 38308e7fff4ca-308ebd20288mr11721631fa.17.1739179879224;
        Mon, 10 Feb 2025 01:31:19 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] ARM: dts: ixp4xx: Updates
Date: Mon, 10 Feb 2025 10:31:14 +0100
Message-Id: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLHqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MD3cyKApOKCt2UkmLdFAPjZHNjy6QUk8REJaCGgqLUtMwKsGHRsbW
 1AJcAMtpcAAAA
X-Change-ID: 20250210-ixp4xx-dts-d03c739bd4aa
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Some DTS updates for IXP4xx:

- Provide the NPE handle for the ethA ethernet controller
  using the proper DT property.

- Fix up the erronoeus PCI IRQs on WG302.

- Wire up the GPIOs for LEDs and keys on WG302.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      ARM: dts: Properly assign NPE to ethA
      ARM: dts: ixp4xx: Fix up PCI on WG302
      ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs

 .../dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 40 +++++++++++++++++++---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi      |  2 +-
 2 files changed, 36 insertions(+), 6 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-ixp4xx-dts-d03c739bd4aa

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

