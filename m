Received: from mail-io1-f99.google.com (mail-io1-f99.google.com [209.85.166.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79825207DEE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607679; cv=none; b=sholF882MI4Jhs+GYDHQaQu1b0tKRp03o7PQYvWjpSTXctu7OrbnExLojDHE3IIFI3iePsvwWacHTJyf7KsQHm/5hgure+Q1sySu6eiZ8Tfty6fp6gh55w8n+em4XRxnnXJCDcCHbro8Z43Rw8DwZ+fDRGEZ5NmzTLJuZrXIdEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607679; c=relaxed/simple;
	bh=ZpEbESBZW8O2O6g0jyprqru9JBixE7wWH9Tk+pSe9uc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PODeQmi2gZOgscCykDhanLKxtEZbIHTDeL8Q8+08siqnOKISCpf9RelSk7bCcDEqS/ho180QDP4ChO38o7WrsWn8fZD+qtvbScksCjcKyYFx1vPWO/jAl6ArDVLSGS4id8qQGpylHqqETAUlfOJk+MHiFQfnSspNXtMS1ornhm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Igvla8t8; arc=none smtp.client-ip=209.85.166.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Igvla8t8"
Received: by mail-io1-f99.google.com with SMTP id ca18e2360f4ac-86d029e2bdeso61769339f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 22:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1751607675; x=1752212475; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CSObR2E21Qmkv7k2/pRD0kdbXiykqAPJCSZl0967hU=;
        b=Igvla8t8seNLMzFGBeOHNpfHcgV0XnwbZWi8+xEdIzDCf3Ty2iiRygp40cNVklSEp3
         MPk4K8S2WVNuFuI874ER9XEcP8fV9lskZqHbBs9qUBJSV02itfadBMjc0D2riXhOSt2f
         JukAgid3EVhjr0ciCtZbkSyhlhK357yFNi7IOJz1dTdOPJY3RzRniEa+8a0ebCUZERSf
         9wdNusNcCdmJAmsfeG9WmSwI4+2eeCqh4nuKIdwIYI8Jc0XKvuvyzJSNvtMmuW+5Finq
         CO6JpDEvPs1LZq4h5lMMv4fHmxKAGK1sMd2bD9h0yZS9OT2SH2khzYc7S2qHb+Euh9vr
         cpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607675; x=1752212475;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CSObR2E21Qmkv7k2/pRD0kdbXiykqAPJCSZl0967hU=;
        b=rGUMzIbyDCZ9GWFQK+Ily9i2HfzKjmR+VzSQMYAADj3VwOpu4ZGVI6FjlstL0MTZzy
         NLEzpP8guu+w5/yZ4iF0HXncfhCVCN827McQQ7kFyDbuAvuw2XgcQy4gJdT/5+ANeQmy
         xMB5TLzKFXeOVQQTwB2TKg8cin8Vx+o/AtBIS1pDXMBhEDplA5hAVJwkepGsmBb38iKC
         kh3ecsJdbP9OMlbRPU++fUJ7i6BKhe9RTD1cktx7VrYAteytV68/aHWh6i3rNvmQQAKq
         EMbsPE3+NvDEJ8y7JYH4Z/PHdolflsHHPyS+wXX7tjjfcQKK7PRiovje0PK0bB4edd7z
         GtFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpEsPTTmpW6vuZUl2IpWGRgTAD0ViTM7NL3JHOZEP4PP6cbq/9A1gBgexya/2/AXeXtl5Ev1UsfcERitU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXYdikzx71DOF0Ni9UXW582Xy9L3J9tQriV35hOlRFXMTU70q
	tF/xgTG9yrSIR0+6bSDz703kUFcJPo4pAC0q+qOqY/7Xb5hocrl/PduVyue0z2BT+drwcBn0vro
	RRWmIG3UKiFYiSkELfDfqHsvCOLCOhXJLB3RduzDZoD/PUqvWMymy
X-Gm-Gg: ASbGncvNac+v6Qj+H6bpqWZgRibXkgOd2fYl4Q6Vq4LxoMsER8shgtH6GqZ/v+CLHGc
	/6e3Nk6GT3xPrVGxm4YjaXpEyrEk5dzEKNdOxjCVxy0BHlRBoqG1/26df2wyPhDf5UhINY4bgmJ
	W+Jo8lskg7NTKFB6gQ6ulAZyJKfeg/YdX7vRui0zRdsISvhExpLHWV1ldY5Hz56rUBJpFGN5cqi
	YEfgSekooGkqzPY1famy1Tq6SgWYQ2myBgd+DCDQKzJjS92qNklbuqx2DE9uUzjVUo0rwr9gmZJ
	obOCZ7bTrIjSkU43SGHD5ojCdkI6M5usA8uoVv1DBg==
X-Google-Smtp-Source: AGHT+IHBR4027FaJ3flrlnIhAyFQVaOQYfC7kVdfOzhrPSSkaEnv+I+L6AW+RwMd8jbTTl6OaOITpm5JmUTi
X-Received: by 2002:a05:6e02:460b:b0:3dd:a0fc:1990 with SMTP id e9e14a558f8ab-3e133be1ebemr18863035ab.3.1751607675543;
        Thu, 03 Jul 2025 22:41:15 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3e0f9c295b4sm841125ab.39.2025.07.03.22.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:41:15 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E5CAE340355;
	Thu,  3 Jul 2025 23:41:13 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 7B599E41627; Thu,  3 Jul 2025 23:41:13 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v2 0/2] ublk: speed up ublk server exit handling
Date: Thu, 03 Jul 2025 23:41:06 -0600
Message-Id: <20250703-ublk_too_many_quiesce-v2-0-3527b5339eeb@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJpZ2gC/4WNQQ6DIBQFr2L+ujSKFWtXvUdjCMWPklawIKbGc
 PeiF+hyXjLzNvDoNHq4ZRs4XLTX1iSgpwzkIEyPRHeJgea0yhmtSXi+X3y2lo/CrPwTkiyRNGX
 dMVkyiRcGyZ0cKv09uo828aD9bN163CzFvv4rLgUpSFWharprLphQ9yk43Cuix7O0I7Qxxh9dO
 mj5wAAAAA==
X-Change-ID: 20250627-ublk_too_many_quiesce-937d6c36ce46
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Recently, we've observed a few cases where a ublk server is able to
complete restart more quickly than the driver can process the exit of
the previous ublk server. The new ublk server comes up, attempts
recovery of the preexisting ublk devices, and observes them still in
state UBLK_S_DEV_LIVE. While this is possible due to the asynchronous
nature of io_uring cleanup and should therefore be handled properly in
the ublk server, it is still preferable to make ublk server exit
handling faster if possible, as we should strive for it to not be a
limiting factor in how fast a ublk server can restart and provide
service again.

The first patch contains the functional change that speeds up the exit
handling, and the second factors out a repeating and error-prone pattern
into a helper.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v2:
- Added back ublk_queue::canceling to minimize number of cache lines
  accessed by hot path (Ming Lei)
- Added a ublk_set_canceling helper
- Link to v1: https://lore.kernel.org/r/20250627-ublk_too_many_quiesce-v1-1-55ef9d80a6af@purestorage.com

---
Uday Shankar (2):
      ublk: speed up ublk server exit handling
      ublk: introduce and use ublk_set_canceling helper

 drivers/block/ublk_drv.c | 76 ++++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 28 deletions(-)
---
base-commit: e74a1c6a8e8af2422fce125c29b14f1d3fab5b5c
change-id: 20250627-ublk_too_many_quiesce-937d6c36ce46

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

