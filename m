Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1D1EFFB8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633390; cv=none; b=HOyNQbr7LQTi9jrZ8bUIioDGEm8NqimPROCHoJ/AuqPREWbJv/PShfU45zAERDeQoH+nqFWkJmPGNL8RvKG3CW4pd7Z22r6gn053ryvlUOJys3Rc/gI46JkYDX4YAt0icXtl8Qacc70PrB6UNdT/aYXhWVG3dd9WhNdDa2lpk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633390; c=relaxed/simple;
	bh=rxws9Ad9Mn5TUKJ23gj+Mob5uEeBEiGS3XOdQg4UVDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uc311AV7+NJGFwXYxZQf7WC/eaAOGstxkhfphrs/UWjNR2NiViDJ3dEV+vfZSmd4OFaUrdQI39fY2wZJyEK3WEeWwhUnVPEYFnXPIkVXP3zOy+WxYlDwdBBFKss3pCLAMbFyvjvW3A5HlS1BaER2JXi0C5ZyYSh9b42SAj8Wx2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UiMBA9ov; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UiMBA9ov"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f89aa7a101so153705eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743633388; x=1744238188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83I67gCYCWk7Y3uXHuaQU26uQxFvo2oq4r/u9/R3Arw=;
        b=UiMBA9ovzsnPqEIM++9bF8nmlI5hUBDZQXxE7u1bfVqmTSxZnieSW8uP5lBQx3+rD7
         5Wbv5gYoHiT7q1SZP3Y8FITVl/QIOnKr89E4UOWq4LIOmG9zGUjThRDX32H2loz0iaFZ
         +uL+vFBpujsbHUHr1CaM3TpmeMsBXGV+FJ6QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633388; x=1744238188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83I67gCYCWk7Y3uXHuaQU26uQxFvo2oq4r/u9/R3Arw=;
        b=lj/JoeuaeZGz0yaP8ycxqWiP6ICgD3rf2bARQBVJCAUfccpqgSv/VqCjTz0RJzTGZa
         bd8YB15scDfxDddyB8ixF7IfxqYCS37tjdy3bvbURtr0c/jo9h2swiMMUe0eu4+XbP84
         oYYUoEPOr9apLSmPZlbgALCs3NEPh52C8TNzoew6UAGdFzpErCZVHYEsiSHO3Sg9QrZl
         RSAIesMsHjDqoNccjZIkDIHvHjGpYjYPT2d9a9gIGsBBqyGNJ0tnmFxp3aJ8/kLXBOM0
         JZdvtv8A/8oU/qU1TYjHLPGXFFlzOjTlX24V+brtRCnWdAVqkQUciKeD3kOsnIegv4MP
         HsAw==
X-Forwarded-Encrypted: i=1; AJvYcCUlTVIs+rVWRcOQ3y7qyURszYh3PMomAcYBFXSYki5JdrIVSSUJ8JydrzvRiuPOLTQ+dOkuhf8N+IqSfvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbs6kWCKhkJh6cx0fJtCoYW9xASzQhT1574vOFgNQ/zVrn8P6
	R6Qs2hIgq5tQheHh+DTg1Miko9YXfM162sW5vn3XSedyxVTsD1VLC4TW9wvAvQ==
X-Gm-Gg: ASbGncuU0CPFV3tC6fUdK8CXRKjlTMMKn0OdiLVdn+0hv7fD1nXFGMMkVCRguE+JZWA
	P4dQ6PLh1ENaDoWLHXTLdLdFyM9oTQFqPdcut6ItdE/MehAoILkNn6C/Uqhj39ktnfsTV/IQNin
	QBZMKmNHo0g9sMkw4OxrYYxh7zfVaTtk9/rrBrpcGslsY2HRdkFFlmTYyfVo2ftpxkwK9eSXMnP
	Z8+srVYL+w34nh8ifqlpHdEJu2LZ9Sq6OFsu5AWZd8wLdCqaRVA1K7Ms8Pc1sGtMzFmCAZc75uY
	16lV7mVgcjCmIAKq4dXkQtWr16cqBgx2rYtrIEIZEBij0p5epe/amcfkNtop8bvxbceRG4Wyxy9
	5qwO0Cp6G2H2Hqs5Nd0yexA==
X-Google-Smtp-Source: AGHT+IFhmDD/+MrGbtMTReOIWsVsy8RfmmRVyRpafY1xvzbf3x51S3IuGF7YCF7eJzB5Z665i8kqpA==
X-Received: by 2002:a05:6871:20c4:b0:296:e698:3227 with SMTP id 586e51a60fabf-2cc7f936aebmr336955fac.36.1743633388098;
        Wed, 02 Apr 2025 15:36:28 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2cc84bcf5besm190fac.45.2025.04.02.15.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:36:27 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jassisinghbrar@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v2 0/2] mailbox: Add support for bcm74110 mailbox
Date: Wed,  2 Apr 2025 15:36:17 -0700
Message-Id: <20250402223619.358818-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bcm74110 mailbox driver is used to communicate with
a co-processor for various power management and firmware
related tasks.

Justin Chen (2):
  dt-bindings: mailbox: Add devicetree binding for bcm74110 mbox
  mailbox: Add support for bcm74110 mailbox

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  |  70 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/bcm74110-mailbox.c            | 655 ++++++++++++++++++
 4 files changed, 737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
 create mode 100644 drivers/mailbox/bcm74110-mailbox.c

-- 
2.34.1

