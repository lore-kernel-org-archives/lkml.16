Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8D8F5E;
	Fri, 25 Apr 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587986; cv=none; b=GnFQmZT67026b75v8O7Ke2K6nfO67uF+NUquXEs3WAXi7heKQ6LFCOl95sHRWbPGprG31fb/jDmp3Ip5akrCPYk9peZNHyH8UEv3Y5da7EVqkQX8dkortqvKCnFWHk1fYNugpyoj9fJDPtPxzG2icufOagD6SiUCw9EabrFBi9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587986; c=relaxed/simple;
	bh=l6zMCpp5giwHkMbUogA1VIJYL3vWli82v31S9OuDKOw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pVhO0AUW5C4Lhy0dWdf6HopXIMPKI082l6oypXvBnODouL/efpV9vvXxRIQGa/e40+2yzqesjCZFcNM5KNMbGPnWpGDe3K/Uk/1Rno3X5aAgLu/ggRddypoy7HA5T63qouI/VlLq15MbYts8nZlcjqa7TIJpBF4v4DJUvqk1+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L918uHz3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L918uHz3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c3407a87aso34931475ad.3;
        Fri, 25 Apr 2025 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587984; x=1746192784; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmkpxLdSDmguPpgr39UQg1XxREgVIbUhK4JdlMT/H/I=;
        b=L918uHz3/YsYpsWQPTOrhIW5Ac/RrRom4mffxCKvPmbuB3tjfpV7U3rssTfDzfPkFb
         HJ+pfr/osGaJv6s/qP5vHcgaWnFADKzndO9qfYwPJfnECdZVz+nVtOCy3+GLqv6pN0Q7
         0tVd4dosy/8CuPix/TloHJN3qKVIbKq2vbDn7neTedtObU4GLYbvosD7llU6i0ZPK5yH
         oDFEm+rHD12gkzm1tZFnsh+96lvmHaHhY4GZmI51tTkEbRwwk1LT68bwF3rjRJQPVCZ1
         ojx3m/D0GuRDs7W6jpAVle7D84FdUp0gB03YdLT755zisy5g5+DQvi4qAszOLs3cpHij
         rJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587984; x=1746192784;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmkpxLdSDmguPpgr39UQg1XxREgVIbUhK4JdlMT/H/I=;
        b=THRr19uIA4VWoniXdRjHHQTtQT1RtLH6R68+rBr0mcZcWp6B3Zng4FDJUUtaCEmWxS
         OAFKb85bWNAjshfQNS/xO3iZY8bDqJ5GM8J67Ky4+9XDVL72VDXbQbZ9ga/lcq8820kX
         6g7SYviBXIUzxJLEPBbDF6m1PLJMoo8OE6BYqTHFrj0P53a+MyuV+SDu4Hk9Zadeylu3
         Abao6v/EQsAFMgeM7Pkcuel59jassXsELVuA6QjzOS3BrrIO4PwF98ESsAKLBAX2I5XN
         dFQSjm+ihdhGpF0vm/qlwtI8XDmiRLzAxsYs7Xo/qSIcHUgq/ZTaS6pdvIZyFiL8MJdT
         XIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUju4hWWq75NovA3yxz1XB89Jt3DBT/UO5zYAEST8ESoMtuCZNbVUmXUxzy+m7b8RPgSYAqNAhhddms6dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCvcL70WTUWB8TegOidQcRpjxLblCqmHwUF0b+4k5cvrnGotK
	3rQrmGFZMTpZQ8X1ScLfs0wbGFE+Q9JFZUIjbh99h0nJtP/8tlcZ
X-Gm-Gg: ASbGncuPhb9O/6eBZChG6rbwwWn8rV/tvh3jFDA7ZPxyS8XtptbwJ12hWRPFzD5S836
	/ZJQD4FChAOkXdUd/uz1SjWn9/uTad8WpKgnWxLZe7yMdAR2gnTWymTU++8kCxGty+hUXFaJH2c
	jX/cRRa5x9XptdnAxFsvE8KhxLGcffuJC0hLF7oGrHWp4qpvKYa3YRxaPu3L+1KcSG5wI3ZmOuZ
	xs5N30PBJkJ9SKd4jZRw/v60e3jK1LB7gM9XnlysU1jADtfCdN5vaa2REPmwNt1DzN98c6myTQh
	YxgHcd+xeZWFzHv/quunKFkfhvcRZ8pu5NZf9QbG8dUje06dnLnf
X-Google-Smtp-Source: AGHT+IFH0+eanNgJQjmBZVObp5br1Oh/XJsL2tYmBOvekRvX/qXK61fom1pOmxFDl+NTfGiRbzGbgA==
X-Received: by 2002:a17:903:2987:b0:220:c813:dfcc with SMTP id d9443c01a7336-22dbf73671amr38327055ad.40.1745587983942;
        Fri, 25 Apr 2025 06:33:03 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e766bsm31834165ad.149.2025.04.25.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v3 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Date: Fri, 25 Apr 2025 17:32:55 +0400
Message-Id: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAePC2gC/32NQQ7CIBREr9L8tRigatGV9zBNA/SX/sQCAUM0T
 e8u9gCuJm+SebNCxkSY4daskLBQpuArtIcG7Ky9Q0ZjZZBcnvlJKKajHaKOmAZDfiTvmJpQo1S
 XTnCEuosJJ3rvzkdfeab8CumzXxT5a//ZimSCic5euWxNDXN3i6bn0YYF+m3bvnJDTfKyAAAA
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745587999; l=1417;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=l6zMCpp5giwHkMbUogA1VIJYL3vWli82v31S9OuDKOw=;
 b=Bkdw23JrX9vLXcy/AKC7soIdSaCj3F//7wBwkWnI2aQC0+HV5YUnu0Snzi2RfFPOwmmGYb9HH
 2Ml1xoezjsZBA+8HmuoqRRdtBrcHo55v/jOfamqxtvknnO2Fo4anC3v
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
is the same board for all intents and purposes, so reflect it only
in the binding description.

Split the series from v1 into several chunks by topic so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/

Changes in v3:
- submit DTS changes together with the respective binding change
- Link to v2: https://lore.kernel.org/r/20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board

 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 4 files changed, 48 insertions(+), 10 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

