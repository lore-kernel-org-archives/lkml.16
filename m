Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E171C5485
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954448; cv=none; b=cp3Gg51dK0pTsreGY63gQBTPgBgSOtikZ7cVWVtAMI/8dRZqd+UO6TxZeTypF/xwIIDqPAvyj1OrUXrbpm13UHZ8GlxhlJGm5npl7BNAHBzAcBJ5k+kbEdxNxz1TdfJs+cv3raL09aCKuyujitTbI6zX8kWAgm1Dzb/6I3RFS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954448; c=relaxed/simple;
	bh=LtRg6niHEi2DQ9iFDzwd5PA1DwtNs1UPqBb+ekeVp3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rc9bDhNKTHBgmjiRw/sSvpy8BMQY5hSw2T4G4WDXC/v8+9STS3QXlLafWzq3FzSHNJU4uv+o5upl8+Y2T6vHZZ2AdQpXSdjg8oUhz6NNqOBiD35E0GI5c0Fi4TPzXyo77mJKzVCKadkGkZbCfUfRyqkfFOAZX26so1DaTF6XoD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UgU5ug4y; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UgU5ug4y"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af590aea813so2680162a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954446; x=1745559246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifg+0ndXJ2hyqLqsXxIeKIJUyt2/+ZV8bbkAn0MMen4=;
        b=UgU5ug4ycWDYc0y9b0U+r0rw/XBmkgCaka+N8KC66/P9MnKem1f9rKAnzRYgmXgsDD
         b/Lt30fiv8RrVfuKXqb+GkBcUwz3EnKepWUvB0MGysVubU5HAWOb/pLqOmKKZhmEZv/m
         GHsEORpMEFu1CKtrrj3FDMPlV/96zwdIUpkCCZRawaWOKo2yGSEpqPGqCMIR4Q/1et/E
         P+6Ia2OCLqBvfSxNflo65joFzjC8YE0JcXfwxqgMYGue1Fbh0z4e6n9TG7Y/Z2LdeNYr
         FLNqwcsxPC5JF9HFAqcG3NmUfmiZLshm+0dagf8KAarF64hP0+nLhe2OGanTodkmaamH
         qO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954446; x=1745559246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifg+0ndXJ2hyqLqsXxIeKIJUyt2/+ZV8bbkAn0MMen4=;
        b=YyA6PvPcXaasGUY93YqUDPkVP8D3fAvnaYT4kmJY+Ry5vXuXTt3oIeXLMkrFXRjOwd
         enTN2ZzzOHNIjAtIz24uSiL4TepVWTAaabWt1xW3bN8qSYwq5gASoV7llbbZDINB8EHg
         LhXe0jJjjZr7CQJRmkqCdeR5wucqZ86lfyPup00xlkiTDhq5XfWTcVufkjypOIZCWXrd
         MsQi3k/gPdt2Ukqrc1fetmJWdLe5S/I24XZZZvtAX14GQFuHM74lbb3hjrdhm5210Obp
         BUFZIVE27qPNlh4DYVuZU5zYpKTzSm7MhrNZ5qH94/Tht3F8l26fGnRszoTH26zns0z1
         MSYw==
X-Forwarded-Encrypted: i=1; AJvYcCVzoU975R4g3zuSiN0hmSaGPdZZmieySht7aysyVXcHmG9VJ8WtbI9QYewswqrFs5AGUU1cLfNlBwjD8sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YweYoi8fhHD5H0O8mO/J0wKHP41YgWSk/ah3HSFwO1gNdpuumsj
	zrH3s4mL0ILIX8iQvdse2bYDCUac+imZUKUKeB3SLdcUebVlWduQfDuZo9GeEsY=
X-Gm-Gg: ASbGncsp+le7W3FYBpaqacUoeimkAaZqXUhePJtmyABrbMQ9mVzGR6liP9mfCGEllML
	qxIWDREJwYaJrFc8CW8sUAT13VM40bey7aO+fHt9gSZPSJTBDpzIcBdb1AddPoHIbRtEgvTLqKj
	cp36gVFIlh8XBJSU7rV8M3xV8IitiV53vsl5hDX8lfR7Trji5ukNRq73V7XNlc3vrmw7QbQ72Jo
	c5EUXCy0butLk3wGS7il4XED6a57CaHAQ37LCHTPfAHyjX1p3pUMuW1NIMnAl92g4fKJHFw5aiD
	cVYcSkiNe7GrvX63S+wBrfnbwJWPJMvJIewd18NMYDD7xP2mXU8uXaom4ikaejTjRZ/24rAnf4M
	j
X-Google-Smtp-Source: AGHT+IF30Ic6GVhtBZhXWiFfbhsB3x60TB4XZmnInk7Uzg1ufwZLD/plPYkbKF7vJ/qDJWcBp1kQIw==
X-Received: by 2002:a17:903:3bcc:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c50d44a6bmr35959255ad.18.1744954446358;
        Thu, 17 Apr 2025 22:34:06 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:05 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 00/12] riscv: Add vendor extensions support for SiFive
Date: Fri, 18 Apr 2025 13:32:27 +0800
Message-Id: <20250418053239.4351-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds four vendor-specific ISA extensions from SiFive:
"xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".

Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
has been added to query which SiFive vendor extensions are supported on
the current platform.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Cyan Yang (12):
  dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension
    description
  riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
  riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor
    extensions
  riscv: hwprobe: Add SiFive vendor extension support and probe for
    xsfqmaccdod and xsfqmaccqoq
  dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
  riscv: Add SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
  dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
  riscv: Add SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

 Documentation/arch/riscv/hwprobe.rst          | 22 ++++++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 25 +++++++++++++++++++
 arch/riscv/Kconfig.vendor                     | 13 ++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/sifive.h    | 16 ++++++++++++
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 arch/riscv/kernel/vendor_extensions/sifive.c  | 21 ++++++++++++++++
 .../kernel/vendor_extensions/sifive_hwprobe.c | 22 ++++++++++++++++
 13 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

-- 
2.39.5 (Apple Git-154)

