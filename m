Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBD1E1E1F;
	Wed,  4 Jun 2025 02:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749005529; cv=none; b=e1wUbxmcEt1hi+gzvp3YAYrY10JRNQtK8aCvIhSqhk5R02KVZDlj6JiG0+oxhZcnrwCvtcx7lskuOnetPMf/dA+VaScihb8y2cvNZvRFiOO7QbwOgeuzJ1nJo9fZyJz7ftekhXafSlq7Esb+beKoLx2CLRinoEP2/3mawlOUYnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749005529; c=relaxed/simple;
	bh=hBQ4MgEXY2rwG0rp4bqP8e7JBI6c11cI7lmQ7++la6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYG/42Koe3Y+QNXeA1PENB8l+eSZao+AiuuC53Z1b3A0lByn2WheDBsqwjlyVLKXP1sQKjIv4Rho6tDB5yUyhcppJjeh9HGUSKRmEABbayW+MOl2G39pGUzkNQ+fV3WMGo5Mkj6fZ6JnH+Fwnqo1n/2ygzbrnySXU2ta4SJP0ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LT54+u9q; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LT54+u9q"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747e41d5469so3090875b3a.3;
        Tue, 03 Jun 2025 19:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749005527; x=1749610327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOeeEMdrMDtMEeEduAZUXPOjlx9iKJzWvtmF1KfWyp4=;
        b=LT54+u9qo7aCgILwkFdKgIsVC/vikGTrf+TOh6AFy6oGhHpls0gBncY1y8DZ0zp2RC
         wa5QctTmT1uiFuUYej9j52XJowerk12jjWIKlVaB+MYG59tMLrPjqwZUEfxswLPEdXgc
         mvdsM6eySo6V1N0IVj7iak/WUiSGIvq4bTWQqEGj7GoSkQ/kVWtr5yN+LR4JSoYoAbi0
         QLwwI0ajW6su9UsxG9PNOE5a8yHt0bzkYyd0F4/3s4FSCYWsnx+cWFKhlxzMsTLaqRYK
         w2J3bBs5COV8n0Z+xvLliQwMk2OLxWIroU8cGtM0KFyT4vxOQNqG9CE+uqsJjmHL2mE/
         N58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749005527; x=1749610327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOeeEMdrMDtMEeEduAZUXPOjlx9iKJzWvtmF1KfWyp4=;
        b=kns5hOSxmK1UJtdP/G30hoDYz7VuUim4ILnwQI80jPRIQDX4tNUXRhNsXYlgTTZ3KL
         zsff/QeNmsQ2+4tYWAe8ideZlD9VJGL45MmwoDmvS26xK8HJag6MEdUf5hpg9yAO5zTF
         ci3WXNGaI4P0XM3Yrx0yz8uyUqB//z7sAUE+M2OF+t6W6IK6WI6ej5VhJKFH7HB4IJhl
         p9ZANkg13XAvx0aOJ0JMXtn7r7+EiXS7NIQ8y2YaPjAlpGmPr5KvHnPyHurkTEGL4i8X
         UXlRE9YONtUUDc2lM0kgq0WS4IugWVxnInIxzZQLDc/Xzra4zloUz7EjV45jqW5j4O0B
         Xkyw==
X-Forwarded-Encrypted: i=1; AJvYcCXYOK9I32OSY/JrTAxg4kdw5K7OQ9qU4qVG6H+9Rw61BC1w0zsopw4g0CfAF23aO/VX10vg3qZi8R4N360=@vger.kernel.org
X-Gm-Message-State: AOJu0YzivjH5nj2aoOnHmg8EMNvTGvvu3LRaoFrHl6D3G2S9K4uu/6hF
	GviSfcm+TjcqWq1vf5lygnBZ3C5lN9s21XaqHwEh8PS0SgHkXJ3+VnJhBvhFag==
X-Gm-Gg: ASbGnctJyuq4n8TJTf1AFOS8ORKu1v1B8yElydEwflV4GL9EnHbrHUD6zxG7Mzo6ZLe
	hrQb61ZLFcUjCG/CP027fTPBhApZmc8hZCyftHmOW7KGPgAV4I/nB+cjE1oxp5gIrNXtOSm73Um
	CwLIJi1dYM+NroHOR2n7s5/tIqdS2lQMaXEesWZkIYp52Hj3m/NJU2MGlkx4PQix8bRoTyCCh0B
	MsdqhYcFpaEusMxKwiXWDSSWzpKDG345b/voyZtHgHYXg2PgH/CAvDk+YYspXTDhIpnXJTfxbWv
	dCQ4OcuSgUJhVln7yQGzrdOYASYFBMIvY5TQf7+07c2rfiSyF4pU86ZUS1WOMy8jUI0s233dUFQ
	gAUogqqCbcpSCy12TErNlGE2En3BCKFUmiH4gqBcnrti0+QwCbEo4IUI+EkQX86GE
X-Google-Smtp-Source: AGHT+IGWzXvwFfGpJfboCLq3cym03YrEYGUWJgol2ltG51yl2T74UwO761yg7B3YeNOI9r8g58aOxA==
X-Received: by 2002:a05:6a20:1604:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-21d22b02123mr1551273637.17.1749005527472;
        Tue, 03 Jun 2025 19:52:07 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e303-56f7-0ad3-ef89-8727-568b.emome-ip6.hinet.net. [2001:b400:e303:56f7:ad3:ef89:8727:568b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d1dfsm7763725a12.55.2025.06.03.19.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 19:52:06 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: [PATCH v2 0/1] USB: serial: nct_usb_serial: add support for Nuvoton USB adapter
Date: Wed,  4 Jun 2025 10:51:53 +0800
Message-ID: <20250604025154.10165-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025060325-everyone-padlock-931a@gregkh>
References: <2025060325-everyone-padlock-931a@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

This is the v2 of the patch to add support for the Nuvoton USB-to-serial adapter.

Changes since v1:
- Removed redundant driver name prefixes (NCT_DRVNAME) in dev_*() messages.
- Removed unnecessary __func__ usage in dev_dbg().
- Dropped verbose dev_info() message to keep the driver quiet when working properly.

I sincerely thank Greg Kroah-Hartman for his detailed and patient review.

Best regards,  
Sheng-Yuan Huang

Sheng-Yuan Huang (1):
  USB: serial: nct_usb_serial: add support for Nuvoton USB adapter

 drivers/usb/serial/nct_usb_serial.c | 1480 +++++++++++++++++++++++++++
 1 file changed, 1480 insertions(+)
 create mode 100644 drivers/usb/serial/nct_usb_serial.c

-- 
2.43.0

