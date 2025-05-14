Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036691F582B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206850; cv=none; b=rwhPWMX29hF0cGZHsRC4j24lvc0eYlxXer5kSWznvfynUvlY5ENmGiw4e5QkI1NfhXvb308oF+eV83ffS7o9LkmzKl8bzB9b0JuhstpQYKydvOuEwGLfmcZn3s7ZMBonwMklRUDWTFaUu6e5nKha0QZpCd6lFFUcPDkeY9wG2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206850; c=relaxed/simple;
	bh=OHBXANHyL8wcBVrw1yfldbqVN6opWC3OshMz6uT15OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Na5J961PqZC8BJMsbLMFtCo2M9fX+Sq0QLG1UQs0NOn21dB1Qn9oStX/UKA+v4L73g2XOoCkP8vdIayP/KWbVVdJS8ooW5NHNtql6sGrofPi4X5h5ge1jJC7ppXYRyXVvo5QY3hjI2SiSr7mNh52AiAiutECxuDs7WNyWAxmTI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIGSYB5R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIGSYB5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747206847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RhtvBP/MCitR1ftSZRMeSHLdRQ2xIQHL23q4ybZlF48=;
	b=OIGSYB5R+2FUkRJavxF2wWiLeUHet+LNm6U3j0NoVHi6vJfYtl6tX/0CPieJDe61qLgTfA
	OZOODWsa0tf9fyXxOnSefgOfIHQr5S5XnskE+cEPdHmqdjugHuuAkO5bF2IsoqRs3Caj+2
	tJFalRS+0Cjgfp8sdwsoOiAp8nJxTlA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-c3UYyBl7Oy-9-V7So0I_1w-1; Wed, 14 May 2025 03:14:06 -0400
X-MC-Unique: c3UYyBl7Oy-9-V7So0I_1w-1
X-Mimecast-MFC-AGG-ID: c3UYyBl7Oy-9-V7So0I_1w_1747206845
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acf00f500d2so491880166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206845; x=1747811645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhtvBP/MCitR1ftSZRMeSHLdRQ2xIQHL23q4ybZlF48=;
        b=S0e4TFyx7pV63FJXjkcnlRNzUShtaW1jMgSqNvAuTVi5LVpV3zUkaOIXf5KIOchCgC
         O1ua4/3vwEu3w5/kj+On8iCsvLwqMu1MyhyaxSGWJvlwoL3XQJJfy2kCDoydvbdqFYyt
         h3R+ubCef0Q97DYOd9Nq1O5iFVqG7qRHQf1sKXLioDXh88BfZHvBeS4RQjkP7ODo1HOv
         XPhrOycLbnPd1SNXQpjAoO9FURRoawKsalxWHQp/hmupQHWJlu1KDpH17O+/MHdPR/gg
         3CSJp0Ykt1YUk0VHho0Wocd72V7h2Ze5vLlAe5euP8Ha1CkmeubykEIEs5QfQ6OQ7D4K
         9vOw==
X-Forwarded-Encrypted: i=1; AJvYcCXniNwxF1QQb61BGwgYJyai/qP0ezptLmd3DnQgzb5HsemAEbftw6NdE8e/BZomnYSxqTubBn0A13ztm2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFYoRK96FHqjnk6K8XgoQKMd7l/D5etJOnSD9EtEJMLoMXMWZ
	qA2Uodwc7DGKCWLGRq5YCMwABtFOsqdQhwaN0gc6IWYyRp/20w1VLdDcZZT8jxWqtR7LZRp1S0i
	UIGNseUkMn9IOAMghuC3mqra3uvpQGuyUHn447zXoWYze8IQdQmw38ECVuBxM2Q==
X-Gm-Gg: ASbGncuCg/EF0X9x6Tsoa6pbLsBXNTp5oHC+6rQJleHk0TBw1LNen+MhEKGnySkp+pQ
	cTsqVSXzzymucnHr1LvkKh1v1zljWtJjOWn8FjapaJAbBreUgnRNgJuXUESVX/96yl63Gmhx+xC
	YvuHna+dOdBhQ0q1RMKiL8iAKMmgzxx6J1CejVcIKjTRvZO/iDloZnbXGQvkAK5QnGB2r0kcvkA
	BQ1ha2m199FquYqGDJ4+W8XtpavNmIupwMvriBBK61ngFuAt1FuO13id5H5NBfCgUyHPlHEYgx6
	XhOtgRCnYIiCxp+TlZuP3QpvP6h+Rk1oAXUIhTwPpSNBVYv7AdWA36QPGA==
X-Received: by 2002:a17:907:1908:b0:ace:d986:d7d2 with SMTP id a640c23a62f3a-ad4f74c9000mr222005266b.49.1747206845220;
        Wed, 14 May 2025 00:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxaAR2Q+5d92tWC9EC6K77qjGuYdoWqzESwAbtU31oqD51mMNX4L5oV+Owa01qzyfNoY/kiQ==
X-Received: by 2002:a17:907:1908:b0:ace:d986:d7d2 with SMTP id a640c23a62f3a-ad4f74c9000mr222003266b.49.1747206844830;
        Wed, 14 May 2025 00:14:04 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23f5f6fddsm653162866b.93.2025.05.14.00.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:14:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] apparmor: Remove obsolete config SECURITY_APPARMOR_DEBUG_MESSAGES
Date: Wed, 14 May 2025 09:14:00 +0200
Message-ID: <20250514071400.465055-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 71e6cff3e0dd ("apparmor: Improve debug print infrastructure") makes
the config option SECURITY_APPARMOR_DEBUG_MESSAGES have no remaining
effect.

Remove the obsolete config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 security/apparmor/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index 64cc3044a42c..3cdea783b6df 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -35,15 +35,6 @@ config SECURITY_APPARMOR_DEBUG_ASSERTS
 	  points. If the assert is triggered it will trigger a WARN
 	  message.
 
-config SECURITY_APPARMOR_DEBUG_MESSAGES
-	bool "Debug messages enabled by default"
-	depends on SECURITY_APPARMOR_DEBUG
-	default n
-	help
-	  Set the default value of the apparmor.debug kernel parameter.
-	  When enabled, various debug messages will be logged to
-	  the kernel message buffer.
-
 config SECURITY_APPARMOR_INTROSPECT_POLICY
 	bool "Allow loaded policy to be introspected"
 	depends on SECURITY_APPARMOR
-- 
2.49.0

