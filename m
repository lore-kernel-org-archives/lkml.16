Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A194A2D;
	Thu,  8 May 2025 00:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746665948; cv=none; b=lktxAMGxdxfg9OfkhN+S1AipYtyb4jB1WqvV5QSFuesf0HUzSQRjBZDQ0J6GO7aytlikBYEuF8WTi22iAbN6XpimpsApah2OE1iTn9fB5qoqz/SDwC88oha31heImjq5ioUHbWk/0wmRcKv2SiBv9Puwq4qs5zZ7hBJQ5evCMm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746665948; c=relaxed/simple;
	bh=uZ1Rq3Tz49OdfnMmW2XGJPejBxicbyFBWBkgjAk8IvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpKiHgkeVnzx2oQ9MU+FroWztziwo1chR9b5hErSA19Gh74KJzz/cYnfgI37TEJZxw4eOQSo5eHbCIHx7ujoDpcr/dfLt1PTzXVnmNmxz8PLnNDB7PjaFKVssGw6m8yrypaQYvcKhKOuXYhdxO+8Vx7oURnZF+P6BwEnUJq5R5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jii040IR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jii040IR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e6344326dso5435615ad.1;
        Wed, 07 May 2025 17:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746665946; x=1747270746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rat4LXV/5BNqG37wbxHnzeOktIjDujmT5cdZDtfs8yA=;
        b=Jii040IR/0gH+bxO1/fAmsbYvvCmP8JszBw+HXY6LVZfU3oW/J/3F/2jOi2jEWqeUN
         NCEqemKaxLnDROFC8g14ONvnSzbkfoNnbbNAJZ7rHxNhn7I8W4mD0ACdvZvjyEWKKQ00
         Ka0lMBr2qdR5CGLyfcED+k5o8VTLFBxS6+AE3uZWwjkej4n4gA7ppUtF7rggXXuTqhji
         cOzk61GxFOdNwGHIFH1IsWuYPFN38/Z/BhjjAbZgVD5GEbIfj4/ICzVKueLQs83Ady9Z
         +04a9bcpaICyCQ0TDYCuNzRrilzWDos6kFkqwuvZB+1FcQEFnIIyxOmglL32FkbACwvr
         z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746665946; x=1747270746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rat4LXV/5BNqG37wbxHnzeOktIjDujmT5cdZDtfs8yA=;
        b=KZXI39j6XLjObmCc2erjO1WcyXNaw93Dn9o5xL82TXdy8FOzjy1PYh95KGsEWZz13O
         /p3+PGQs71aUEYCqFXOQfJXccv3+V2EgVxZ9B10DdJ6BcSvWuctyIV/xArgxo6ELyvMX
         x+BRgq+BFfWwE8cqt8J0SL43nXGXI9AZdH11GKxNJB86OGS3Y6rsZEo0vjCflOkgdlUl
         lRn14bysh5Rx0FWjCb0TTH4yq2DNZ+6OhaLpDDlqD4IebvuRG+GFMJhjSyQnjwL6EEyF
         ROE+C/Q2vdHPhxhLAYrKEWdBpzkdqhVy9k9dm5K0kBnRlIdR5EsnZQft4UocF08O0Fb6
         Nc6A==
X-Forwarded-Encrypted: i=1; AJvYcCW9haHEdtj/C6m4QoLJF4U4z+N5vWIKfUypLRVQ3flEOcTs3m/xnydaeZNEuZujPJNpna1scfuQRHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QoEpgJxKVb6BRZxZBzadCOe8S8uQXwe8JY6O4T/lFwk1GFtc
	2ujKXQsLW/0wzB8paL0/Mgzk8lH1Rr87jtvgYgC+vw21wSF10qhg
X-Gm-Gg: ASbGncsGUDxrFNc3qPwaP5SFjIaIDVr1WW2lsP7G89dSCAiS4dTAA6pFytECxEQiNnt
	iwXzq/WtK/XI2FxxU7mRa9k0OjRi3m5qWV7+hW8XfiZDokU316213BcrIcDZ8LzkgOf9EAqm4uv
	ubMMhkSqfdGMnsJzoP2LBWC4iL3tS3A1gbycWGap07gc1f5hCWlyog9OUPTQJ5y42doEgTmCwNt
	NIyZ5QmJoXOyP6rEBSoYqqqbuS6Z6iCZ4SDG2jDYc8zbsr9etBNqVZE+zcAL7ivFqxPaq2DoXxN
	NgCCWYw4l/quWogdG8qB03UYYHex5YeDzCYzR1Ss
X-Google-Smtp-Source: AGHT+IGPIJtk7+rifUWWKtc2+jzoFuZfZ7qkWDbJ7uoNF7pq2e0cK8YhDBQl0SA693AOH7zJ7bBpEA==
X-Received: by 2002:a17:902:ecc6:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-22e8a7f9156mr17678755ad.37.1746665945687;
        Wed, 07 May 2025 17:59:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f58495sm881968a91.37.2025.05.07.17.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 17:59:05 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CF60141E8D47; Thu, 08 May 2025 07:59:01 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Ming Lei <ming.lei@redhat.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Alyssa Ross <hi@alyssa.is>,
	Beau Belgrave <beaub@linux.microsoft.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Eric Biggers <ebiggers@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jan Kara <jack@suse.cz>
Subject: [PATCH v2] Documentation: ioctl-number: Update table intro
Date: Thu,  8 May 2025 07:58:39 +0700
Message-ID: <20250508005838.8381-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=bagasdotme@gmail.com; h=from:subject; bh=uZ1Rq3Tz49OdfnMmW2XGJPejBxicbyFBWBkgjAk8IvE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkyDIv2uKbnq94q6fwb2bDk+m3XqUvm21QIp5o7RQRpr 5wSLzO1o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABP59Irhf+UOOcmQKdGThF4f VFlkyfE29FBWktejC5LJLd/tw5tfvmJkWHJjzzHTBVe0JIR3xHikV/CoVQYpBf72s93NtjVhlZc xHwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Introduction paragraph to the ioctl numbers table states that only
ioctls in up to ancient Linux kernel version (v2.6.31) for x86 arch are
listed. This is inaccurate as the table also lists ioctls from non-x86
archs and the kernel is continously developed (currently in v6.x).

Update the paragraph accordingly.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:
  - Do not mention kernel version (Lukas)

[1]: https://lore.kernel.org/linux-doc/20250507055145.23345-2-bagasdotme@gmail.com/

 Documentation/userspace-api/ioctl/ioctl-number.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 83e5d2abdad694..4915e1a7d304eb 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -62,9 +62,8 @@ Following this convention is good because:
 (5) When following the convention, the driver code can use generic
     code to copy the parameters between user and kernel space.
 
-This table lists ioctls visible from user land for Linux/x86.  It contains
-most drivers up to 2.6.31, but I know I am missing some.  There has been
-no attempt to list non-X86 architectures or ioctls from drivers/staging/.
+This table lists ioctls visible from userland, excluding ones from
+drivers/staging/.
 
 ====  =====  ======================================================= ================================================================
 Code  Seq#    Include File                                           Comments

base-commit: b91a0cbb6f27ee499e376091e8c8c0ddfd69103c
-- 
An old man doll... just what I always wanted! - Clara

