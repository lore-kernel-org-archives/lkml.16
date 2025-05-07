Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F91DF756;
	Wed,  7 May 2025 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597138; cv=none; b=ul6nZygDG3HZT1Jd3LK/q0o2lmX2AmSLk8wal7xH11Lgq3snQdpg2Q7xBfKU1cFmsPoHpjPi6F3ia0RGwjKkroHxG0VHJDIRJvnRK/0FlOwr2sA+W3jJ9oWTWBWkyHO5NUr/miuw4ypxD694WvyAaleTgQdqjIzKiz8Y3404Pl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597138; c=relaxed/simple;
	bh=YRR7ppD//cez0xtxj2iwS8SZwAI28Pj9uGenogTa3es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMAwdYavfh+ZYuHNB+3cGzjMMJ8iKUKGxPR8NkkcnQCHfLekwwltPF/uv0auiDWY9/Ziapivoy/U3ylIM1Uch1CU5uxRi4+F53rpCWyX4u5vUobfpDf4EqVZ10Y7zcS/LrxrBjRiBrXjSCVuMIgIxelGsiE8ucgXKLekCUzBQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/1qNw6O; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/1qNw6O"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2241053582dso101335735ad.1;
        Tue, 06 May 2025 22:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746597136; x=1747201936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smhU12W8dRI9QGxOei4hf/4siEfSpDXyjFzqR1L2Huc=;
        b=I/1qNw6OiZGN1GTGNBHw69dhll/KdjqyHIk6y5FQnIWRh4DR3tZpzqE1iqqz6CrN2R
         WaYBmzN4p3E37uhPHl9nz+DVgEVInKokGcrknEuPzvMLiOBfNTvpHKvsFWKVHnbkEplp
         wCXnjSCsjb85ZL6XsShh5cWXj9yWGx0jG503akg0OC7Gx67R3rzlVIpmXhHiJH828pNp
         GmS2OTZkhuJ3LoFH0nEfgdGQo2JfRP+iLHFnryWKkmEHO5vGGQ/v4MwNC9EoAjPQ6dNA
         bKTRek+hAkg7CJMjF/uM1Be7A+zVqp6ym+XjH9Uv37PFFop791HNeOqMgXvOJB3KJYIh
         u6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746597136; x=1747201936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smhU12W8dRI9QGxOei4hf/4siEfSpDXyjFzqR1L2Huc=;
        b=MTfbBzxK/3HMtR69+1R+4Kbgnl8Xznsnz9pAMHuXU7kOlp6xqs+kab7VJ5uDViyii3
         rAIm7dkeGAxcVLVxQBNcBIHVgRAHdHzPF4w+cz78sRRxSvVI6WVVHXnqZ0Ea2LKLCad1
         2iW1HykiuRK+70gjEha6m1Mklr9M3AJT0RTZyIczoJj/zmx0hNVtkGjW27Vq1YmeYgKp
         nLwvlRUYIvKanfcRBsDCEv8mXB7dPAgPmkoKN5G7va4U10IWyHZPWdlSlBT0i+ZCtxH5
         Go79WL/hNQ3YckdXpuiZlUgs5bB4LfVrqHbQ+f8cXU9jyH/xa4tvsW0HvHN4OkXJi8Kt
         lD5w==
X-Forwarded-Encrypted: i=1; AJvYcCWDeXq65Y6+ioeMzPG78JcXsA/++OuGYK50XsJpjNzqEBM3YUZn9JsgMo2Lgrws70oxo2gVSWW51TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+nX4AgAl9XJYRP4gzjKD5OthqBZNOFzUC/8v2+KvLb0z2OmN
	HuoWsdokCTupsf/32DrxJ/kryTXmcfLlXNMUUpfHfYStKLdQ75WM
X-Gm-Gg: ASbGncvXdaQacxKqBlHrpWCq/dXcy8CgJdlE6TG4PFo97i2j9LMPnDc9sDlJN8gndYo
	METnJnHgukdKfIE9jfqeiJ9kA/tfeJxPgG8jOVtrB5PqCfxPq0VB7xpEuVrvdeHQUaZOHCK4Ax2
	SiFfSbYEa6DjkY1NbOKr3yB4PlysQeoS9qgH7Mhn7hrRObZUQ8k/uwa24qera6xXI4/CdHr9Yjj
	Zf/opNeoCY5NDoo4whOAlvhq8+RUJxlMqBKat8yQV2eSTIZdsUQ2Dq0vlqbqLLhftI/n+l5rwzs
	2Cb5cnRX7txt2lI1/YhezXGm7wXcsQdYCvafn2uU
X-Google-Smtp-Source: AGHT+IG4eMjifuvSw//N7jcuB1Hkt+eZM8ysGT50OX9zUojTJYnEzLHT3LvwRU4CU2r/W3gkrA7n3g==
X-Received: by 2002:a17:902:e784:b0:224:283f:a9ef with SMTP id d9443c01a7336-22e5ea70835mr25879645ad.6.1746597135665;
        Tue, 06 May 2025 22:52:15 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eb007sm85307785ad.25.2025.05.06.22.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:52:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 23766423E4D9; Wed, 07 May 2025 12:52:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Eric Biggers <ebiggers@google.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Beau Belgrave <beaub@linux.microsoft.com>,
	Jan Kara <jack@suse.cz>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] Documentation: ioctl-number: Update table intro
Date: Wed,  7 May 2025 12:51:46 +0700
Message-ID: <20250507055145.23345-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=bagasdotme@gmail.com; h=from:subject; bh=YRR7ppD//cez0xtxj2iwS8SZwAI28Pj9uGenogTa3es=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlSXyJud70S/rTOKDy+eqbyxWO1Mp/6ZA8vvqNTelWVZ dZCkW96HaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIv6mMDGsfJr8+Lxe2TWem zgNPO6Wvx3jzbqsaev+b0LflqEJpzWWGvwKnnhgJqX/Mm75ywd71W/sX6BnynztjLGVXX5jV8Un uDgMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Introduction paragraph to the ioctl numbers table states that only
ioctls in ancient Linux kernel version (v2.6.31) for x86 arch are
listed. This is inaccurate as the table also lists ioctls from non-x86
archs and the kernel is continously developed (currently in v6.x).

Update the paragraph accordingly.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 83e5d2abdad694..51269ff250882f 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -62,9 +62,8 @@ Following this convention is good because:
 (5) When following the convention, the driver code can use generic
     code to copy the parameters between user and kernel space.
 
-This table lists ioctls visible from user land for Linux/x86.  It contains
-most drivers up to 2.6.31, but I know I am missing some.  There has been
-no attempt to list non-X86 architectures or ioctls from drivers/staging/.
+This table lists ioctls visible from userland for Linux version 6.x+,
+excluding ones from drivers/staging/.
 
 ====  =====  ======================================================= ================================================================
 Code  Seq#    Include File                                           Comments

base-commit: b91a0cbb6f27ee499e376091e8c8c0ddfd69103c
-- 
An old man doll... just what I always wanted! - Clara

