Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65A13C8E8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151824; cv=none; b=CO8b90nU4dVuRnv0CmlJiHHiGIro/wsWVpUt/rv2kkLXM0pBpJqniOOzaGnY+T+6sbuzswYDE1V8IGY8WnVBBAYFCaAS5hgD1AKQey7IHKFuYz14OincVAPxHx5TjAGAyw0+7KP5j55K3rQQQ+xpS+tM+TCC+DqEf14R+8aCvk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151824; c=relaxed/simple;
	bh=W8mcQh3ZmLOOqUw0pQwZjxi7DB9VMzXrDl2urotDVQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deN84SP5LN4xYrx39nZXGwE8ypb05CaFJ5edl0tn6HtW1bN5IrSViQ6aXmzoJRPAG79tB9SEeAMKgqtdP7jJRr5zxFoV6Ao8C7vopQjVPkpfyXH6TeakiAnBXuEXbiWN9Zg8YwXbggZxccd0d4yVnzJvaPN2S67Qk9HCcJybWo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=i+6eRQ1b; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="i+6eRQ1b"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2243803b776so85483215ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151823; x=1744756623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djup849pfpUwDc+nIoOZqJLc+04WNO/1d356og/BnVI=;
        b=i+6eRQ1byKeWny2NrfYlW1z+qlSNRALw9euVv2WTgTJsjELV55hsC/c+jEyjIT4WDP
         g/mO51Wsmfy+Vs1tpc93YvJzSk1qtNO2/2cx/y6hZsROfAylORMAI3UiD7FcctnpnNFA
         5tvn98J3OzufyrcGb1FJUde03pPo3FC/8Nwv9uQnFRUdpHQAQ+AiQvNziihsnNe2QzHc
         DopKNaRY/bxC7rA0WW92PsC8f723Id4cFrdyYGSBKLQqiItfRDKC7OVcHXlc7Oxlzmo9
         DzYANW+N4o7Wvxi7vkCRw38JEfTsH1LQTWK4d6s5Bu0m79ZVxHoXMopHhPPaLUnhuP67
         62EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151823; x=1744756623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djup849pfpUwDc+nIoOZqJLc+04WNO/1d356og/BnVI=;
        b=Hdj+FLe+kueo5+rZSR7Wm/lLVNJPLzxO+NrPFBcTIblw5hgglTg//i4DBJwaUB+QFo
         9hEhO8dZ50D+B7SZ1KWhxeFug3TimfA4mIO5PXN5VutHhYzV/1tONl+x8L2yVH+wLYlM
         UxuRvbXopKP0V686kZ/utx3aW8L1mUx9lGxoTJQN3kb1KXg/++kiDmqxTRqwPwcW5eli
         y0x5pwQs3HZDdEpVZO4PvXvAmcAMObTub7rf9L8jgPUjVsIJMUggtP86pFveNtJ2mtGh
         mVrkG2l3QFz7eb+0hHwC/a5iJfwQG2t3uvQ6lIkveHiBaYbBRJtr9DAjvkyloH5/1QQM
         2ayA==
X-Forwarded-Encrypted: i=1; AJvYcCVqQrQWDBYCmM4sbVPQucKiwQynH+Wu1RzwzxtKlZPVp6576Sisei/2j+OF9WtQ4o5U7jHSY74D56ZDAto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrkh8EWouC4MEsPsKjg0rv6mZDfxW4b44at2rHMHHAvFc+lDre
	4rUM3JUmXYkI4TVtCZ13CLLxFdGolLehQNjzE0aE/X6HxZJJFX5AV9j8+joRWg==
X-Gm-Gg: ASbGnctczP/7CYnhnH0jpoI5V+gNKqWT6yh+xJlSHojLR8A4KjXL5kwH+Ho0MY2ik00
	pSrpZwA1b+zhC+K9zxHJt/+tkY/b28NVfNFIF1hm8XB7c/rpqhGXNx4zW5+x6VJM1rnhXp8Wm6q
	i8VFt7UixBocOqHjQHqp+Nv7CWmxqbfArsVp0bygH6OCSw9ny6bxqD7N83lua/SLq+Q6JSAPFgI
	kgSfykmrYXMbd1FGpGZB4b6eNAH08t5aMBV01qfEMA3jF9DxoP9FUAJPy0o1a0knKwQy2iZ+bVK
	Xm8CWofYrLNBpjL1NOGzy039+Y5TuIFUcyuHcMoyzKMgiX74LnEMdOds8IVdl15PqatvHEXjgNg
	jGr77HYsytA==
X-Google-Smtp-Source: AGHT+IFoC+ycacdqJ0GJ8O0Y+m7ZEKHT6NqjdT697VABH348dSO8i5PlEDCHOP7yiQ32COa57ZCdaw==
X-Received: by 2002:a17:902:fc87:b0:224:c76:5e57 with SMTP id d9443c01a7336-22ac2a1d993mr10783375ad.39.1744151822871;
        Tue, 08 Apr 2025 15:37:02 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd568a6asm41233a91.1.2025.04.08.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:02 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/18] staging: gpib: Removing typedef gpib_board_config_t
Date: Tue,  8 Apr 2025 22:36:40 +0000
Message-ID: <20250408223659.187109-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: Adding "struct gpib_board_config"

* Patch 2 - Patch 17: Replacing gpib_board_config_t with
            "struct gpib_board_config"

* Patch 18: Removing typedef for gpib_board_config_t.

Michael Rubin (18):
  staing: gpib: struct typing for gpib_board_config
  staging: gpib: agilent_82350b: gpib_board_config
  staging: gpib: agilent_82357a: gpib_board_config
  staging: gpib: cb7210: struct gpib_board_config
  staging: gpib: cec: struct gpib_board_config
  staging: gpib: common: struct gpib_board_config
  staging: gpib: eastwood: struct gpib_board_config
  staging: gpib: fmh: struct gpib_board_config
  staging: gpib: gpio: struct gpib_board_config
  staging: gpib: hp_82335: struct gpib_board_config
  staging: gpib: hp_82341: struct gpib_board_config
  staging: gpib: gpibP: struct gpib_board_config
  staging: gpib: ines: struct gpib_board_config
  staging: gpib: lpvo_usb: struct gpib_board_config
  staging: gpib: ni_usb: struct gpib_board_config
  staging: gpib: pc2: struct gpib_board_config
  staging: gpib: tnt4882: struct gpib_board_config
  staging: gpib: Removing typedef gpib_board_config

 .../gpib/agilent_82350b/agilent_82350b.c      |  8 +++---
 .../gpib/agilent_82357a/agilent_82357a.c      |  4 +--
 drivers/staging/gpib/cb7210/cb7210.c          | 12 ++++----
 drivers/staging/gpib/cec/cec_gpib.c           |  4 +--
 drivers/staging/gpib/common/gpib_os.c         | 28 +++++++++----------
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 12 ++++----
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 27 ++++++++++--------
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  4 +--
 drivers/staging/gpib/hp_82341/hp_82341.c      |  7 +++--
 drivers/staging/gpib/include/gpibP.h          |  4 +--
 drivers/staging/gpib/include/gpib_types.h     |  8 +++---
 drivers/staging/gpib/ines/ines_gpib.c         | 23 +++++++--------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  4 +--
 drivers/staging/gpib/pc2/pc2_gpib.c           | 12 ++++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 12 ++++----
 17 files changed, 91 insertions(+), 82 deletions(-)

-- 
2.43.0

