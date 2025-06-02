Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43557182D0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902996; cv=none; b=cTBXfy/yLF7dqd9nuMNPD4oZg0NlilXazu0f8ZZgvcHK8IzbvIUfLKQg09RSDsjh+SKztYAS6p4GhCFEgzxILpYZEcWeOLrwEZqz4711olu22h/607eKQZnFqeRxNzuof5ONvvhZ26H3fNphvH+hQsjYlTf9gqhZUegILc/1i+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902996; c=relaxed/simple;
	bh=ZymE7UPp7kyUe9b3G25j69TavirZtJTZP8xjJlE08XM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=biGEwzHrIm7+3TLqaZ480qDU4nJTqVKa2wc44CKpgSTDkLX5lpcH/kwFvroJDIcn8SnPfSHQ3WhfZaufa/yeZwL2I984SK//G0jwMwsFgo1+fks2G/ttmPtBs5w0dc2hc6fTs5Q5ovX8vMn8dRCmkoF9AlK0t8YMbKszopuc+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HCq/eAMb; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HCq/eAMb"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234c5b57557so43598335ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748902994; x=1749507794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OPhKExA638elpBbuMbbNxhj45qqqMxtabBtiJDTd2k=;
        b=HCq/eAMbJEF5uIPxu4CVViAtVYetE1MGaTGvmFL10tT/bCznQMINh4IigfD6g4/ofq
         SZBzNK+jmrcDiDVSbz+OIPvg8LEKGmmMK4kYUbHiGaU9eDKenvrQm7PM4ArjijGZZVLQ
         4bgZAJC0LXgQQppulQhL5hOi1Hh4KZ2bu+FwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902994; x=1749507794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OPhKExA638elpBbuMbbNxhj45qqqMxtabBtiJDTd2k=;
        b=OWiD6tsRn3mXggu7ei8vI9jymrg9sDLa8eF9reP/IcLEWRlvSQxpoWz/cxcWFRSbPP
         2dSUO6hCWPcTgTWQOB+qacFwvbErvCRyL8ikAj3nI4qCMNGNI4vtfUHa7EWn2ZOQ3Rk5
         w+NADRPpFwBEcmGWVdbKf5Qm/M/Pdbl5rNw3OyJFAi7RllbIS7QALG0+Rc4CO6/Cf94O
         msCLuStEviUmyKTDfJ7qrATX1wtXySCbnk1zCj4/AnkJb3o/rK4Udv6lYYCMHq+V/Ds8
         boIpcCEWC4ksAB8X85UyhSI3vx+pM9sLu9C+vLsvzTyKGmi09PBFC00RKfKNHxIzrp9i
         mjQw==
X-Forwarded-Encrypted: i=1; AJvYcCUqZ+8ndIU8OHPIGzc3S4j9IyUK4xv43gJxlat7Ost1FftomQF8iUwAM+tpJ67fPJXJsJjOiD6fU3DiWN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA3gWjNHBtG/2PA1CZxI8ciovJJq3FLvqzJZMJmq31mNCLLIuG
	3Gl41PiY9Ysv0ArOxu6Fn7syASPkvaR+waxRW5lyYm535ad0mhkvhxzgWPlFViq+FQ==
X-Gm-Gg: ASbGnctZM+Fa7NQ4ik1mOCPw3qhW9pDAwMLk/tB9gsDtE1alxsCrJSjjlwoCgPFpyq9
	7rA3pkWAV8LCmMp6uhDv+uGtgrURV4cpSd3GQ/GVgM6/q4TsOKewANxcsXXQWyYfq3MjKIvakdP
	WiDSeMJ7Wx05c4LKDBfs1z8qkPg1qTJw5EGufCAtgow8ryR4gQPpsrrCp5JIAEBd212ir7f+ATD
	dkRN5SzwSgwEOwCTv//6de5Utv9Ht6cWJud6ipvLqz6RsHFLKXQ0FbzGEAhPW93PJUjV9qEdQNM
	DmtZhT+SUhXOcTjUMhvMF8eFG65r0GOB8KQ9I0oGPUBUqtxhOzfQlR6kVUlkdynT1V22aTTD2V8
	k/lSheZpA4HnTSWqAsYUXl/S5GGOK
X-Google-Smtp-Source: AGHT+IFA3Qk3qqNX6ANN0hVJ7qMPymVyFi1kMt50QVWBJ8zzGzXDts06dDSxYbp6UdWM/Z+8pBF8MA==
X-Received: by 2002:a17:902:e5c4:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-23539423ecemr211725725ad.10.1748902994348;
        Mon, 02 Jun 2025 15:23:14 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d19bfesm75565195ad.253.2025.06.02.15.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 15:23:14 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jassisinghbrar@gmail.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v5 0/2] mailbox: Add support for bcm74110
Date: Mon,  2 Jun 2025 15:23:09 -0700
Message-Id: <20250602222311.2940850-1-justin.chen@broadcom.com>
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
  dt-bindings: mailbox: Add support for bcm74110
  mailbox: Add support for bcm74110

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  |  64 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/bcm74110-mailbox.c            | 656 ++++++++++++++++++
 4 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
 create mode 100644 drivers/mailbox/bcm74110-mailbox.c

-- 
2.34.1

