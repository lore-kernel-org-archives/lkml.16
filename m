Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA18D30E85B;
	Sat, 21 Jun 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498967; cv=none; b=EjLB6PQ4/RC+ZNxzOpDs8+/rGlibJepxh7oOjJhqC+/Ae7dZ9TwvopkiSjA2+GPKviysKKLq1WvV2bX3uUTm+IQblwg3NH1X1WguKYB/RbyEd7IFLN88Xwf7pPmFPwP+9xEsVwFNw7d5h0+zYzFRoEaFswdCeAASE3ayzdpdKxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498967; c=relaxed/simple;
	bh=NT0F2kuWnh95YvWs0guj2pG5hfl85ndEjZGTNruras4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=esad70CkFIRhQBtHHsthaVBCs4NDxi97sX50Pu7e/kaHmS8mASYamIYTgCih2DGxrH1Ceg5IUCRf93paBKULFLqDXO90KfnQvl19PAd9f14hJIDftG5mrJilPeHLjGxp3aIZ+3s7lqoW3WgvBVYvxjMm9UopJuDrbonWiDshK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRb2qtgV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRb2qtgV"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c7a52e97so2166875b3a.3;
        Sat, 21 Jun 2025 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750498965; x=1751103765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82F/qIrMwud8Iq3aKIO9cVAcwnGn2gOc9FkvWYWa8Q8=;
        b=iRb2qtgV2BL6VDzoHevnbvoP4QDkW4rJrwb2YKa26e5svnGwPdneJNX6Srs2Nrm/yy
         3YhL/ls8HjI8nBhrLOvYK+UAoBRRPcGnli+Bmo6ScyOJnpledSB0OUnvpucFJgquNJmf
         IKtxcmKkblH4XceUE1/yRNV+43tnk4boHWuQz2Tz7Q9MUA+cmPcyNmzewZdCxKi3X9fv
         qL4QdkoHuAsP6vFEucvMPs8V0konc5n3IPThsDeZsYFk4mH9HtSDk/spK6lsr5SrVQ21
         F1a4pJ7HmR82IRKWCl477WukA69HZ36zsuesF5MZNpo1hxBBhc1O3gC5RkeOeoeAYIM1
         ipaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750498965; x=1751103765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82F/qIrMwud8Iq3aKIO9cVAcwnGn2gOc9FkvWYWa8Q8=;
        b=EQUmhb6308om5+25nO1u9QH13hkJ4ViMV6pZqV7fvUPdrTNlQRpkdoR5rjFNnpBHvq
         X+Bdd+f0gDbrpYkfxJ7r7/bIo9a+aIqKYbDXm+o6y1OOOkEuEW//aKPH4JLf/OoCfqru
         FcA02JuFJZN3qDouMw5M2VIxDoeYUJUx1sbbkdO3xe7qdM/ecOdyzrsZQVxgKS7yuLdy
         JZCx/WGFnWd4Kb1D0oSn+SO0uokpCkK7m/48kw0SlntYPBh/OjA9Spq7q9p954otpleT
         U0x0htOnVCIO2ZhCFZfHeN1LJiFVMJCRb/nDzNgEZltzHKinzjRk1RVFPnITBQab7ew9
         2Z9A==
X-Forwarded-Encrypted: i=1; AJvYcCXFjAvf5w9e2pOp7Wrfrb8oURkycPovpn3ZlKOes+2peQuW8IcMp6Ng0Sf9QdJCVSW1pWHkceC/qMKxv4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7ypAefYKBK1DCV5/VCsOZX4+laVHcmK2NkLeEkIRJu5ETcIf
	Qw+5autPAjo+2yb9cyzMMxYBSezCtidfDsRukFKuKI3gGaC54n9LAbAh
X-Gm-Gg: ASbGncu0CsroG+FcE+K96A3sLzJQzFnAGjft4soEh9bVZG/gWZqIwilqvbYrMoiS4B3
	g8jby8DyaykAIfcLssXjV28MBfsB8suvtzrbV29SycORGYIcJXWKDNnBHQnHIb0ryCpETR8oYrf
	8nkEYEGEVzfISo2cnv9VleWiM+VIUYtaN3c+BnOKZJMisQSa+8msdws0YCQ8cxES6XcbqAASiYH
	Tp9S3SJEGFmU6y4L2vRi99FRHyVowemxWVAPeyP+0oYpw5hx7tGIM2/JSc0U2dBsTpJ4uIl+PWJ
	L5z1LwUqz6dHgmKYoCsk608vxdq5jGUqWt1DaqQ5b81+AJtMtKpiKmJ2G7L5migHFrfGEs0uJrP
	IJrszJiX28befF9TAj/OF
X-Google-Smtp-Source: AGHT+IGCdtyBmtNboqAeTb8dM4d0OF3DNlAYrpvaG4ezgQSszXwNLgXBZCtm/LihmMUbzARLeGdL6Q==
X-Received: by 2002:a05:6a00:928c:b0:748:fcfa:8bd5 with SMTP id d2e1a72fcca58-7490d74e2c9mr9889200b3a.3.1750498964922;
        Sat, 21 Jun 2025 02:42:44 -0700 (PDT)
Received: from faisal-ThinkPad-T490.. ([49.207.215.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64bde4sm3845704b3a.124.2025.06.21.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 02:42:44 -0700 (PDT)
From: Faisal Bukhari <faisalbukhari523@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix typo in Documentation/userspace-api/sysfs-platform_profile.rst
Date: Sat, 21 Jun 2025 15:12:24 +0530
Message-ID: <20250621094224.164677-1-faisalbukhari523@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation/userspace-api/sysfs-platform_profile.rst
Fixes a spelling mistake: "setttings" → "settings".

Signed-off-by: Faisal Bukhari <faisalbukhari523@gmail.com>
---
 Documentation/userspace-api/sysfs-platform_profile.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Documentation/userspace-api/sysfs-platform_profile.rst
index 7f013356118a..e6878ea82fda 100644
--- a/Documentation/userspace-api/sysfs-platform_profile.rst
+++ b/Documentation/userspace-api/sysfs-platform_profile.rst
@@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile names must:
 "Custom" profile support
 ========================
 The platform_profile class also supports profiles advertising a "custom"
-profile. This is intended to be set by drivers when the setttings in the
+profile. This is intended to be set by drivers when the settings in the
 driver have been modified in a way that a standard profile doesn't represent
 the current state.
 
-- 
2.43.0

