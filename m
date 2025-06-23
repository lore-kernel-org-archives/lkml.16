Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD7188CC9;
	Mon, 23 Jun 2025 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663107; cv=none; b=EhRRMPU+u6OXrEYD209LDzuG+9mOv5YjNeUcphYcsYOjyFN8keZ428zFatswKM67gY1xWx34wOsWBP3Oa1sJWQX6s1E9pqjGIAjXJ4/eXHLcXSeN1jUVB8uQObeY1xl2MdQ92v3XCvNPQRhf4RjhBvev/eWSH6TEUyejXJELODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663107; c=relaxed/simple;
	bh=bfUMCr6XTkaXfPV88r2OXrvZVyVPwnJMX/p5wxpGtYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBVXRqT04LR29+frY+SuRevT6PkL7bkMrj/AbcrAky3ciSTEcyK1FPB7FjJr6zC+/btvwkAdTTTKw81WOj3Lj8H7gxMWffR0CmyUWdFtWfEEAt9HE2qQvY8Ydi3I02FXTL29jWepsAGtgGO1S1YdOH4rY+9GV8jH/8rnrtgRcMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDkjBxt2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDkjBxt2"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747fc7506d4so2866810b3a.0;
        Mon, 23 Jun 2025 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750663105; x=1751267905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6rUZtQwP9+H10UZcQReROjXeGg/7uqmxlCLekV3/XI=;
        b=RDkjBxt2p/S+MzjFvA98BeBdKY44YLoXIX+Fp2L8kWrS5UXtdKbUHJgFoSEW/jQyD+
         q8Ld1zIeBF2Ckv7iWgdOgc1X0vUqtJ5rHFSgvqEaJBoKgXV4yI2mte+7klHnjz+vAMAN
         ZhMUPLtWyijXzAbTje9UCS4Dwlr4Mq5JwxRF06m0T7eKhDSI3voqdwwc/jbJm7gKc7bZ
         DtmnMmTH1Q/GOnbptU34vVoIiJ/9uPjTOkSmrybL8So68XnYh6/Ax1CE7P6MJ2eafY1T
         dDaz518do8Md/1mHRt2ITKiDSDuA1G67fqZn7BM5gIpoNCmNBmgOrdmz0YIZgJJvRAnY
         xA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663105; x=1751267905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6rUZtQwP9+H10UZcQReROjXeGg/7uqmxlCLekV3/XI=;
        b=pIyftfKbkY7ZkbvCkD/hhz6tWQIKtdy+ywh6/v9eJvc43+Z4AEJ7CBVUr/HfWhnIt1
         5gUOg94DDlF7OM3Pxp/hCYWFe1Ufh+0+hMUZrGBvX5KIOFc3mYXgxc31ByUzQbP3+olm
         x5r1U1X9VYs9gKMOblNWoHEdtwA5if+cOlZ0OzA04TrZJzc1C6byHFrMyRAGIP43EKA9
         f3aJR952Kzjuu/OehyPlhfMXxk7i8uX+2LboXGCCWpAwWOg4KJXrXVIM41qDh8U7zEUJ
         Gi9fcDAHu26DyeNG6lYfM7JV3u3jaK5mxnYywYUuSRAzKgTexWFhjHh79nL6rb1QaMjg
         g/5w==
X-Forwarded-Encrypted: i=1; AJvYcCVBGKU5oeaATNlDfrVhBOJIKvVOAGZs4ac9RoqfCORRBUUHCDvuHHbUzLW10BipRD8HPkywL/lpyUlFxBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPRoPmb3tX9MP8VKQ/Db4u5z67hFcJFNGwqzSck/GWSERoZFt1
	lWIpOqxNQ79kPFh3O6M94TkKFJWhjTC3rwJXQU1PmLzMgM4xdYGHuPRT+HoUiw==
X-Gm-Gg: ASbGncu+RrsNUFQhTbaLA9FZopGh33EYulIr6aCCIDUFAYY+9h3Dx3q2bM0TKbb0W6K
	Ya5G36kW0X0iNusPELlybsvX3C8HwCFF+XHcw4IbvwWj/tCarxMAc0SSuTaj2s0ZMzGiZzHemtZ
	eLwate7a39H8hpxa+wu0Y9IK+eE/N+NO7h+yqWjl0W2OeTTOB1s3Zuhrt5G8HGw3PUG57mDZm13
	DmKPRjG7VIzp7Zo+idTL7izpS4pihGCNfBQfl7EMBC1Jx2fs+q6YDiVBObkiDwZ879pf+mBE5BP
	u+MPidsT3gSAAKrCbIs5trtTgreIXRWfHxOoMHL5jDXPD4oBeBYfxHBOTE5cCw/YhkxM76duPnI
	lY7xxK7y7PRI7FrizLfWUDEtr0C9KMSdILEf9cLAofNYEJ20EEAC7iNQA/xMKnSPz+A==
X-Google-Smtp-Source: AGHT+IELCG0XKxyqJSPKZRUMNeN57yP3nv+AqM7T3oI1JFwo/g42qVKHmZkkw8RyiH51vjUitYdWMQ==
X-Received: by 2002:a05:6a20:ce4f:b0:1f5:a3e8:64c1 with SMTP id adf61e73a8af0-22025ea3dedmr18169695637.0.1750663105023;
        Mon, 23 Jun 2025 00:18:25 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e358-921b-7902-4a20-67b4-38da.emome-ip6.hinet.net. [2001:b400:e358:921b:7902:4a20:67b4:38da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119e4e8sm7234892a12.26.2025.06.23.00.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:18:24 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: [PATCH v3 0/1] USB: serial: nct_usb_serial: add support for Nuvoton USB adapter
Date: Mon, 23 Jun 2025 15:17:12 +0800
Message-ID: <20250623071713.12814-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
References: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Hi everyone,

This patchset is a revised version of the previous submission and
includes changes based on Oliver's comments. Thank you for the
detailed review and valuable suggestions.

The main updates are listed below:

- All endianness concerns have been addressed by removing bitfields and
  using explicit byte order conversions.
- Command definitions have been changed from enums to "#define"
  constants as requested.
- Error handling has been improved, including proper checks in
  nct_vendor_read() and nct_set_baud().
- Cleaned up unnecessary code and improved function structure in
  several places, such as nct_vendor_write(), nct_rx_throttle(), and
  nct_rx_unthrottle().

Sheng-Yuan Huang (1):
  USB: serial: nct_usb_serial: add support for Nuvoton USB adapter

 drivers/usb/serial/Kconfig          |   10 +
 drivers/usb/serial/Makefile         |    1 +
 drivers/usb/serial/nct_usb_serial.c | 1553 +++++++++++++++++++++++++++
 3 files changed, 1564 insertions(+)
 create mode 100644 drivers/usb/serial/nct_usb_serial.c

-- 
2.43.0

