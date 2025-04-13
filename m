Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4861A704B;
	Sun, 13 Apr 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744551819; cv=none; b=RDNmq1Z+R5LcdBRRdcQ1vFB4QpFzi9qR1apRNa5ycF+7ZpjoOlXkIGuzlHGZQoosAV8a9QXZJl/E/iO0SWjeuapfjJqb7aswcRRo7/xlL5Lu+B6+T+1KXpP78O0QpIkWAjXluY8UJTCPl5Ciy95csubW1t6qJuoZSfRAG85O3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744551819; c=relaxed/simple;
	bh=CaqNdZl65hgemUPAe9eut5/ZXmtuHDnKufCOoFTEFM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfohLFKHouQ8oC1fbIGMsWVIcdpYX6wi9QsoT3jtvY4vE4ZNX+kPaKWgObFSST8DnIGxmpr5MjNNpg4bDRh5SVp4/68eK3Idn7vjzRP2BxAsut/Pp/3qkic57qBhxMyT2w/6ajseikQy1ae/rCls9YDbt3K/FZYeGEpDi0lkbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPK9E8Ru; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPK9E8Ru"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so5197863a12.3;
        Sun, 13 Apr 2025 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551816; x=1745156616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=;
        b=RPK9E8Rurb54WHtdWQFIUpCGyoQS4DfJlRA4ltC/fAC+UfN+gBplBhJQ2BdS8XvVAV
         Gs+xOketic+TFq+Zjk84dAoPkXu0uSE7oezQrZR9ytTmMhMaaWFij+sKYV34p0FQAMca
         Jlpk8SdXuGf/3tGp4K8tOS0KMkQrSSEf3JFwZxkUtgxw+SeViyRalgtp8EPVBbwjyfEL
         OfzdBCnOt50jbHKh6s/p7pUdb/iI+LqKWnRBQIA7aF8tWosrW3TOywuQQU8VfGX2uky1
         7IwZneNtHrrFANt3n/CK7NDbsHi31PfXO+02XGuIYkgPmPitycm5uQX51BlC69SfE3j3
         BRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551816; x=1745156616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=;
        b=tGk+5RmfEzUPUVqedGPvgtsgm4QqBcZYRYmLODWFN/tNEuXZIrl0F49ctH2+VqekWv
         JdWvvVdHktfz7CCiRHLhy8M7F9yYW05XpxBbtFq00Mk2sIzBYkS44905sE5mfW1gk50i
         FNGIjyBMH8+v/cGc0FLMROanTXgeF1IkibkIREhM6WSVnPYC9Tf47PygxElaDqB4VELH
         X4Z1djfNhPJq3QioCliGd7qFWYRLWGJu0qdrUOSDgvTOAlYkrm/fe7ZctELGppF3GcSj
         lVk9SXAGnwOIKhN30LTJ1MYORIjvbgi0BW09ap1rAzNwBW8X87XR4pDQhzCmZcDNLOGV
         ibAw==
X-Forwarded-Encrypted: i=1; AJvYcCVtDG3Rp73EluRrmu/P7dtTkgoZyzhcyzC7F1HAbOnk6JU5n8Xfg+nYhM07VKoi80rAg9fvlay6HrjO@vger.kernel.org, AJvYcCXatnYXsQZneynJOwSJ1CLexvvx5bHhrnhZa27UO8zKvYdqyDopHsc6Bue9PYlJpDsERZIyQtkE9O97L3UV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yl74VP0XD4HH0k9hl4rxlMPna/4AgEwGbTASKfOaWEtgGuva
	3ramU+Syjmr+abhgxTZnpQ+7CmcBuAHbe3NsQAApDZqtHxKxiXkr
X-Gm-Gg: ASbGncv/RGEcpHiymwcoOJu3lg3zGYwxaw3sGMtnflgcAULVh98QLWd1lknoLFJy8FM
	+ygDYbLC3sPRMpml42E0YNzNrpULfLhaLvdJBYnzqvcrmzdFSEft3e1IongrtjuBNOAWh457wyl
	Pz83RwxndqYFsZrteQOe77YjVkka4HsI28CIm0HFPNPMXkOnqo1Hm8NKb/DAP69LmxCrV/cPufI
	vJCg27nnUqi0aVepyOcNkU7+o+3euDVA4ERJNCDiqZ/bzFra2oWHU43lF9CSuXCqXwot9STN+px
	IKMgYPP4MVG17XHWq7iIMHMW8JJKHPz0JmNqmbrVg4RzFDmXKt2IWN3ZRXk=
X-Google-Smtp-Source: AGHT+IEOIJ1i4Kh+VcM9sFRP+cgJp2vQQUT+Pqo4qfUY0eHTw4Probs6u1rivZcSvRWydAIs1ARTVQ==
X-Received: by 2002:a17:907:3c95:b0:ac6:ffb0:a2be with SMTP id a640c23a62f3a-acad36a0809mr750895066b.47.1744551815575;
        Sun, 13 Apr 2025 06:43:35 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm749422666b.55.2025.04.13.06.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:43:35 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS board
Date: Sun, 13 Apr 2025 15:42:55 +0200
Message-ID: <20250413134318.66681-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi 3 LTS has similar functionality to Orange Pi 3 with slightly
different hardware. 

OrangePi 3 LTS has following features:
- Allwinner H6 quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 2 GB LPDDR3 RAM
- AXP805 PMIC
- AW859A Wifi/BT 5.0
- 2x USB 2.0 host port (A)
- USB 3.0 Host
- Gigabit Ethernet (Motorcomm YT8531C phy)
- HDMI 2.0 port
- soldered 8 GB eMMC
- 2x LED
- microphone
- audio jack

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
  arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h6-orangepi-3-lts.dts    | 351 ++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts

-- 
2.49.0

