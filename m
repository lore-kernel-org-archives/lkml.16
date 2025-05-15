Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099401F153C;
	Thu, 15 May 2025 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337982; cv=none; b=BGzc/Ylt/Kw0XpfFiFgJR5Y7K+MJ2B3+3PiK9e5Inca2eQCF8ehLWiOG2/1AalT1WUOcK/+VkejJa1ftHe1FJ7YyEN1aRTtddRoxSn17rkPruWULpgitYjj/lQcgfETBONgK4XQU8afXGxSMVUA9H6MGRhhA55RmicDEIXRc+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337982; c=relaxed/simple;
	bh=dUTd7LB5oUuONCrkadkRxW1f2+OtwiJIXKvDoamBiE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mKNOWI/jJjQ1SuvCWW+j646gVlpvfY/AknqkZMTc5nt6KVkFTN9hk0sqA4d+Abb6IVBC22TrNi/Gc2agF/UEpFdqwr+q59XOxR4vDm0vmhMvgpP8nEySQco6jTCz7wu0qZx8X4e5ak7UA/eMf86uA90Qk70Dijq0BuQxP+BJO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npj35x0j; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npj35x0j"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso1438668e87.3;
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337979; x=1747942779; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYdK0AjjM8abFU3f5Mtgtyti4QxGUG4c/Abfg2GNbps=;
        b=npj35x0jBeN+ZFNAlcLXP68kTn4WJVVdYY2fQD+Wf0hfpl/ADaGO5MOYnxsNPGWqaz
         vmDni6o9fI/wbmDO/ggxxwD4TcKxzl4yY0Q7S6FeeqfZ+s6mz7m4RXkpfw43t/njiYMS
         F/Cqv5uxl3qUwjsFUJWBKqXoMUOq1YAqqrMIHwG//nCXWu58XI6/zUnccuouTfs4UMrS
         XEmfOz8+S1ZcClYRL/w5GXPXdUjpUKU3aNYLTtvBaxZWnI8NSy6P0ZliJlwXwkq5MiiV
         6eoA9iZa6YQnWhHLEyz9IqexYO/CX8iQDnS/spZKjUQg7WFwQ8P7aZyB76qj+kdQeJBy
         ASXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337979; x=1747942779;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYdK0AjjM8abFU3f5Mtgtyti4QxGUG4c/Abfg2GNbps=;
        b=jCmSC36rAsLZmvQjXnxbvTMVDuGF7518cVko5v0/aWCFkCW04+3dMgaRSIva2UV/cR
         ZqeMXZrBVmw5v7TDsDnBu5k7gxzEt7j9so2WM8vObGUR/IgaNw9gBwl0QXfA+3XWKfRW
         oU4zbNP0kq/TAgrkBIUUX8cu6o3iChEFKWGkAQWQBR5OszlmZnaxJP5QL1MM6Wg8zAnC
         BNTH8ulRIhbjFHtB/j9Uj872VHDi8jb4ItnEuasGXMoPkw8/GlGJtgCctm2PayqhmwCC
         JNORAgOUj9qsTPVVVv37WrSQXUnGKSfmMIXaATdtZX6+Oy7dPWrS36mD8E5zaCh7uhGh
         GVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxRSuGVM48lUCgBQVRXx3FLVFIgTvU2aP3uRXGINJ6Aj9Aml2RWJcVV1l9nIFSg37+4I/zh5cKES4pRL2D@vger.kernel.org, AJvYcCViRuWLXG6JHMPxajWQp7SjCbVtuvCkSovfbCwYvRN1UBq0GI3aXdu66Mtr5+1jVtcLemVHeWA9ZHXz@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCKeaMUXkrwzzUDURLbahRDbtXZLW0gixx6JPVPEI3+jIHwU3
	g7Cw2wzDpiuKip+lue0odsBaUja4DiOj7c17onAQYCsUij1jxABphoV8
X-Gm-Gg: ASbGncsZxcQ1ZaV5y7yJGHaaz6FDYJTYeE35PBy2wzVlF6B8oW8oFYhFl3T4I60439u
	vHbYn8isPw0E7xlpf/yQiaYbF2idLFMdc9irQnAcg1jGV3SY+4a+HreUSlp+h3xE7dJQGC4t5Gz
	fDICkKr814VrzY9soZT7J79E3aBCzN7CPp+SB+BbmP931MhfZsaGJbrO0i+5ZM4EetDVCx8llzO
	4h2OHXv4Ta37zywd5CSf2jtngRKqUoSQKOz2fbNw/L8yPSCLBfdMP4xD6ZONgz2qzCNzgSbEPBp
	WOUeYy9iQRTKboHbmeg5FGRE4+LxXtEpG3r6WyL5cv5cMXtlt9FXzGeuDWrA5Ux0
X-Google-Smtp-Source: AGHT+IH/gLZPS6thv7VSu44IX1TYpg37+y/EOQu60KdwyFFDlYjwnS6lL+6BuLrT3ET+GI8eL5IkQQ==
X-Received: by 2002:a05:6512:159f:b0:549:86c8:113a with SMTP id 2adb3069b0e04-550e71ae97dmr251422e87.15.1747337978880;
        Thu, 15 May 2025 12:39:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:38 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on
 WM8850
Date: Thu, 15 May 2025 22:38:39 +0300
Message-Id: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9CJmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNT3fLcEt2UkmLd0oKUxJLUYt1UE1NzC0Pj5NTktCQloK6CotS0zAq
 widGxtbUA0us+U2EAAAA=
X-Change-ID: 20250425-wmt-dts-updates-e457813cecfb
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=1469;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dUTd7LB5oUuONCrkadkRxW1f2+OtwiJIXKvDoamBiE4=;
 b=2KnNXyiKPzyzbnrSmHY3lL4nMlTC4ZNnCs4kvkFJ1EYRIN3Z4+/BSR67ERLqWRl2CNgGXQufz
 yv8piK/0/llDmcTQosyI9Oh2N0VLmKw55AVBSoVGx79249BePVQZOZB
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Small fixups for VT8500 related device trees to improve correctness in
light of current guidelines.

While at that, also include a DT node for the PL310 cache controller
present in WM8850/WM8950.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (5):
      ARM: dts: vt8500: Add node address and reg in CPU nodes
      ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
      ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    |  5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts |  5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   |  5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 21 +++++++++++++++------
 10 files changed, 56 insertions(+), 38 deletions(-)
---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250425-wmt-dts-updates-e457813cecfb

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

