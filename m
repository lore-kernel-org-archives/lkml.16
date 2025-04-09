Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71DBE49
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178349; cv=none; b=qj8Hi4LMsoRzRMJi6A4WJ6rbDhGkDC2C1FVleyAKeN3b7fyA0iwHTpzrQYnKo1KdIEKK1uhlAbakZ+HSCbFHIwdKtPhdqxPW5fPvnTR3l7QzDEFXVbMjxJHrPPmZ1uPtAluPnsGMgh+XgovpaRkicrhkoKT/bBsiHrSOfGSZUcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178349; c=relaxed/simple;
	bh=+cRpAGM3fBSnidM+4UWtJo8NX/FmO/Jetdwd/Ccs45w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uV4BgUEUC9kPsfPHzf14HaOuzhU8iXNCs8be5lyhFl+eNpFjnHK6/JazXEZQ96GbyoDA3FqlETc3Wlyjb20iZx2vvmrGaPq4KgjMiN0V1MBtEww6ykfvW+98uXexVlHTdN5MsnIBdhBCuzUEsS3wjoDvaHRNU3xxJjzTt50VvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HOvWCyZi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HOvWCyZi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227914acd20so2971345ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178346; x=1744783146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmpbl1qlaeHgafl2pHHR6F4mf7sKmkMLj4mHyYrbXzc=;
        b=HOvWCyZiXC+UXfrs3AceWI6JZlc4AmOh/8sGeraVdK0hdz0f5Ac2/OCSZEqmj5Uoti
         A4DOBAhACfqe5bB0P2SVX5qUWq55fMZ1zuRAHK382/m0fcOzjvXiKgMt81lOEu4g8Ux5
         VzeI6oWuEQ0GiF12FmdMilFMMu0YHpTO080yzihB3hZsaJEdAAnWwnDtfViF28vHVzT9
         Z9S0O0QZjKH2gUOuOyrQN15jELx79yX+eaFPDU563RwOfrpWvR4MpOzP0/9Tfr90cPJK
         AmfXiQk12vEUYyU/YbKB5UzecrRIAGSPb5R4Va/jwJ4cVmO0Bsq62IqXAkjJ+Uen9+nt
         7h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178346; x=1744783146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmpbl1qlaeHgafl2pHHR6F4mf7sKmkMLj4mHyYrbXzc=;
        b=vJfBsueF7dH6POq7Orvp9RJ4AJvnq7S3eVzVUP/eYecaU5EtJXIIbZ8ZRtNSaSfwY2
         AOUkx1sc01nt9XLWeGhjnJf1nPRmmSna2SIf1D9iK5YbY7yUNMx56CyQ+Yfp+ZBxRM8z
         Y6EvEX6QqQwMV4TGWgyHkTyZhYqy5Kzap++u2pFacFUWxSgZVBoITbOx5hxCv2g+u9up
         svhRojCJRZbNHKN4eUAlYZdbyGvxJ+g3V2BtsR2+s8PiJWyX1IGAMfymrHNHRtCx+4M9
         kVPNeGl+As3QQuiIcYFbkwLmMkAHO4LNZAA5/GYug+K4K1CWY3Xa92YHsxvw0wT/BS8o
         obYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBH0R0OrLNcxLAIiXyFH/DNOiGsASx4/iLdn6exTtRRbIj2+glYOERbY9rp/qKPL+/lm5PtCbFJwwE1tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLSacsqk8pPBZ6KA/wrUAUkLFA+scDNN/cti3Mfym8SNEqiiF
	p8rQWwjDS0YIbhlH9IAILVZGvx5jUUmVHd5cwsE2sjZRlq3p+b8hyV4hES8ajdIA+g0gt8aKK2E
	=
X-Gm-Gg: ASbGnctPgyAJcOzq8WSwlgV5WMJDcICxVTbTLFNlWpVwQinIUptq2RGUJrz9uw4z8Tl
	TeG3STF6jVU7bIV2y/m2MJCtTqcJD09OypGPy2grUVvz/2px/Zy9j8NS74GK0WFmjBByGOEeTqX
	2IjO9WRuUrBbHBpweaUMsePJiBAnoO8IXZBWWjPz8VuWSWEl7oBQU8hzbI5FHzunFzI6hR9a6ei
	XY4DVGWOmDquzUULLQyyiIubLG+pXj/XEqpAJCoPVgbQd6iPZKa9HrXLjzC3CyUJcoSgj1spZvz
	VIhMbFYHcZTlLee3zfapFMWWvoJiUL/YjUK4gNlOmY/J8fgGPu0C0k4FNWBT+7a3+kX3UGFQOAr
	jbjONHQ==
X-Google-Smtp-Source: AGHT+IFMwN3VRVu6sqrMT03lTtDFVvGqXCWf8R+uS7U2w+zhQwb7/rYF7s9d85IQM1pcKBVZHUeNxQ==
X-Received: by 2002:a17:903:2a8f:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22ab5df1b0dmr85399485ad.4.1744178346023;
        Tue, 08 Apr 2025 22:59:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5458sm3343055ad.200.2025.04.08.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:05 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 00/21] staging: gpib: Removing typedefs for ioctl API
Date: Wed,  9 Apr 2025 05:58:42 +0000
Message-ID: <20250409055903.321438-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving typedefs to explicit structs as dictated by the Linux code style.
Also removing typedefs for fundamental types as per Linux code style.

Reported by checkpatch.pl

* Patch 1 - Patch 16: Removes typedef for explicit structs.

	In general, a pointer, or a struct that has elements that can
	reasonably be directly accessed should never be a typedef.

* Patch 17 - Patch 21

	Removing typedefs of fundamental types

Michael Rubin (21):
  staging: gpib: Using struct gpib_board_type_ioctl
  staging: gpib: Using struct gpib_read_write_ioctl
  staging: gpib: Using struct gpib_open_dev_ioctl
  staging: gpib: Using struct gpib_close_dev_ioctl
  staging: gpib: Using struct gpib_serial_poll_ioctl
  staging: gpib: Using struct gpib_eos_ioctl
  staging: gpib: Using struct gpib_wait_ioctl
  staging: gpib: Using struct gpib_online_ioctl
  staging: gpib: Using struct gpib_spoll_bytes_ioctl
  staging: gpib: Using struct gpib_board_info_ioctl
  staging: gpib: Using struct gpib_select_pci_ioctl
  staging: gpib: Using struct gpib_ppoll_config_ioctl`
  staging: gpib: Using struct gpib_pad_ioctl
  staging: gpib: Using struct gpib_sad_ioctl
  staging: gpib: Using gpib_select_device_path_ioctl
  staging: gpib: Using struct gpib_request_service2
  staging: gpib: event_ioctl_t now short
  staging: gpib: rsc_ioctl_t now int
  staging: gpib: t1_delay_ioctl_t now unsigned int
  staging: gpib: autospoll_ioctl_t now short
  staging: gpib: local_ppoll_mode_ioctl_t now short

 drivers/staging/gpib/common/gpib_os.c  |  58 ++++++------
 drivers/staging/gpib/uapi/gpib_ioctl.h | 118 ++++++++++++-------------
 2 files changed, 86 insertions(+), 90 deletions(-)

-- 
2.43.0

