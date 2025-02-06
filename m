Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59A1A3165
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847982; cv=none; b=eDE6JhAYxTYL3BYcXyTQ4dMqaXGErYwdQZt/eDeWTmd8OfLjb9+7jhsKRPJl7P2qYw2z8ffmadjrzerEqeLjEYmneJh1jqct1co1h2ui60weyogDQsaxzxSpSgF2/yfYs0jAMvCKIr+E/NLF6LEzr6sAXlmZlEwYxFl0xHO9p/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847982; c=relaxed/simple;
	bh=yEHGgbXYg86TqrNi2d9ZrXvNhZAg86gc9uC0y9rcKeY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GiQYPhyCb2QWfUjT8LLv7DwXMzdjp8I6JRI+BmKQgMOIho9CObHgzduX7WCU6UlEYFm97msw8kP5WejpnmwqbMjMJBSPcE3Bj0VxVyMBK5ekMgAcKjnk1FmbELpgSHQeMAVLBK/O/xjfEszsHM7ZUcwEbMCXGUk4O+PzjRwr15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ap+1hWvG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ap+1hWvG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f48ebaadfso1712905ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738847978; x=1739452778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPBkQVcozPH35+SMd7YDKRV52t6xM/qA7YaAmlBFzAE=;
        b=Ap+1hWvGSrjhTMYG0drnBDaZZu+JtgEeX30EXz3wz2TkyGkDQEmb0DgIwQYWSkmfFn
         KjkpuCaothXgnIVIgbZ1ej1Sf45qrmgrOc+x5T+nloh0avuvr3ZvBbwGFfiyJNclwq71
         1tDFCRh0lRPkHT81LZUVFlFTDBsXd637TP/p9ZimA7K/qUQGYk4vJg3wi3HKjhnBE5Nz
         sMarVB5sJYg6FGp9pwUx2U+ko62TpzqoulQGeWtxrJfnNUmltyGcvdq8oiNE3Eah9uVu
         W+R1/GIuDi9+9nzMIr1QvY1idTjrSzk93c7u0MO0sOxRJkd2K3tdED+zha3Jvtgp47Rh
         7FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847978; x=1739452778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPBkQVcozPH35+SMd7YDKRV52t6xM/qA7YaAmlBFzAE=;
        b=eylV+qllx7ITKEbDnU0PaMSGIafoVwjqNTai5Texessa22x/+YaGvdGgxZmxDlb2gR
         ma4Id2DA/fZla9fWigJMVjwqR4mscTDpF9sosnQic3kqkIFZyHgRBdEJmXR/O5OYN6Kc
         tuDVg+BcH/dhpPdF/7PnPsr8J+zwpTtcpNmVsX8AXY9OGL7P9s/L618O5gCUhI8/aaI/
         GIQVFZk8fPsw89mFkVi4hQCDW2oBwFyagKNzeVeklzGPXORJfKnFqwNbAsOUv7PWl0c8
         qjvM7i/8aQjZeZXSYYhRIs7dSpCWlemfH1Fi1U2KFqRx2bt0L8c3x2ZvJ/JUAPX/l/ZX
         pEKA==
X-Forwarded-Encrypted: i=1; AJvYcCU2TyYoNfuREZrmIbLbGOyVzHNNSpmQm6DoDs0nWwUmczbs+aZSG3Xf9bcqrdxj2l+8DXCdbYpM+Ep6XeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHMx4KGL9+GoHYv8Qm05N/EKgyeZ2rDf8f8ikCmjgzPOmizlS
	TD3Hw4Yr7ogVjfvlqnd5xJ8+6WXWoMwDaGSzjnlEjKP+0WHpTZxJyaPBO1BKvAMR19zL0r+i894
	q
X-Gm-Gg: ASbGncvcII1YdMvS7/ab0VuPb9VW/GVRP2HX5hcs+Nel9hMWjxrsLOYH/mCFqQbh5w0
	8iB4vZWu8peAL724hDBq/+gFpNKY8dDW7ciqJZaVxTAsDc6UkO53R4EtKOQL1iFAgWj6cft1qnk
	wMq7w15qwyYyq7UAY0bdIkhlj2vmyPJZDiAepyUq9S5URUcty4bFiNmqyoxqbj7bbg9lF8ZgPd+
	mV9HzWaCadI0dg5H1B537Qwh1zm26ZW2tqQvZ9+qaywpfO1R+3kbDFsIrl3+D+08VlWZWN2hJ9W
	l4JDM83O9q3jru5vSA==
X-Google-Smtp-Source: AGHT+IHeug9cYWBwdxegaLKcOfC/AYX//xp3oimUmbvosm7CRYX6S5ANS8ab4mETPqqD02YJJ1FQbQ==
X-Received: by 2002:a17:903:1cd:b0:21f:1521:42f with SMTP id d9443c01a7336-21f17f2a696mr113150885ad.53.1738847978566;
        Thu, 06 Feb 2025 05:19:38 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.19.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:19:38 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 0/5] riscv: initial support for Generic Hardware Error Source (GHES)
Date: Thu,  6 Feb 2025 21:19:21 +0800
Message-Id: <20250206131926.91289-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rui Qi <qirui.001@bytedance.com>

NOTE: Before compiling the kernel, enable ACPI, APEI and GHES in menuconfig
The following options must be enabled in .config file.
   CONFIG_HAVE_ACPI_APEI=y
   CONFIG_ACPI_APEI=y
   CONFIG_ACPI_APEI_GHES=y

Through fault injection, we can see the following example output

[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 0
[Hardware Error]: event severity info
[Hardware Error]: Error 0, type: corrected
[Hardware Error]:  section_type: memory error
[Hardware Error]:   error_status: Storage error in DRAM memory (0x018d8480019304f0)
[Hardware Error]:  node:0 card:0 module:0 rank:0 bank:0 device:0 row:0 column:0
[Hardware Error]:  error_type: 2, single-bit ECC
[Hardware Error]: Error 1, type: corrected
[Hardware Error]:  section_type: Flle error
[Hardware Error]:  port_type: 4, root port
[Hardware Error]:  version: 3.0
[Hardware Error]:  command: 0x0146, status: 0x0011
[Hardware Error]:  device_id: 0000:00:00,0
[Hardware Error]:  slot: 0
[Hardware Error]:  secondary_bus: 0x01
[Hardware Error]:  vendor_id: 0x1e93, device_id: 0x1010
[Hardware Error]:  class_code: 060400
[Hardware Error]:  bridge: secondary_status: 0x0000, control: 0x0003
[Hardware Error]:  aer_cor_status: 0x00001000, aer_cor_mask: 0x0000000
[Hardware Error]:  aer_uncor_status: 0x00000000, aer_uncor_mask: 0x04000000
[Hardware Error]:  aer_uncor_severity: 0x004e3030
[Hardware Error]:  TLP Header: 000000000 000000000 0000000000000000


Rui Qi (5):
  riscv: select HAVE_ACPI_APEI
  efi: add riscv APEI generic processor error printing support
  riscv: add fix map index for GHES IRQ
  RISC-V: ACPI: define arch_apei_get_mem_attribute
  RISC-V: define ioremap_cache

 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/acpi.h   | 18 ++++++++++++++++++
 arch/riscv/include/asm/fixmap.h |  3 +++
 arch/riscv/include/asm/io.h     |  5 +++++
 drivers/firmware/efi/cper.c     |  4 ++++
 5 files changed, 31 insertions(+)

-- 
2.20.1

