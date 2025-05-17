Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A41CAA65;
	Sat, 17 May 2025 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747492854; cv=none; b=nCv6FUcgKfOGB7Zl0Yb26Za+QNxDU7jwIML14XOjsfViK/ngvioVW3hDDJLexhQZmJ9fawJ2FmhDmq5/HGgJ2M+WWqz1KnrOshJoRqKuZfn59aBX4j5qmposBn9blPCwg7B0YDu2GtQl4AkjQP1pzeAC/C3J/dKjEn4o7nRHSNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747492854; c=relaxed/simple;
	bh=mDG2jkft7nfElJfJfJkL9KftMp6xqxfSRzxkOF28vbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JIvTzm3hhOPw+TU/fIDCZgKMnzfYFWex+ujRbNxGWZcvi88O+6hURdyXoPxldimNHddzX3+igia84eXEqjKPGNpTSE1QEtlnJZ7eeoFZkLdUxSmv9qA5q00nWkC7i6GFZmzXpaoxQKu5Hnw/xB2Kuw0CA2CNVgfjN0amSe/ArWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moJ1AW0Z; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moJ1AW0Z"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36463b9cbso675317f8f.2;
        Sat, 17 May 2025 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747492850; x=1748097650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dU2jCfddxJKrwesjyJtttGNJV62kuuDvXgjaV72qj4=;
        b=moJ1AW0ZQXfhRP3JP/r9CX97lbb4CFBW+OqEoLeH7TG76OUF4KRml+9Pf1ba3Y8Heu
         x7aj3dPLB/Ei+ERfd81fOEXBPoEq3LSWTSmI16RP9awBQv+E13SmyQlPzVFJbB6bCGb1
         aYrMOaD38ovsjh4qWLdQdLZz+iXz1XqEXWMa1yx5ygyKaSTq1gFNLWsitKkDagpVfOjs
         lgkNM6935d2IQY0HRzQ4650jUZ8Zu3UjhBexUpt0BS2SRiBCLElzIXC8p/uYVs0SrpyH
         oTLcDF6SNoJW83CUYiob7+BgqnkBxe3I6WBYgVIhHctrqd/TcKeQejV+t80LTe4O0eJC
         HIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747492850; x=1748097650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dU2jCfddxJKrwesjyJtttGNJV62kuuDvXgjaV72qj4=;
        b=b0NuPyLn4RyZZNx8xjbnueRBTTbum9f+zeo5Gl95NdFTsGw+SYRRE008fxijfRY3Jn
         /N98ckYxBCjW1mC+6wuVeosMXC144FQPyVfAkQC07leckGyZHnuA2pvyka3VpLNqfxr6
         yQlWALJjvinkp9UsrnrAqzRYssS8hhbZvAZeN9Zk0U04GL/8OwQAnSxqMZqACrbcUH9g
         47oYNk96WDtXeZ4TjDvQRe4btAgKk2Hhe5Ysqpe5Uugm5M/AoM0VHomJ4wvfEPSwFTcc
         WntIjQb1S668q2K+rhdGIzGEDiGUbLN1HckrCsgztp+WC7yOdduGpyyy2FUSvhrpVwM0
         W3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUIJtrGqdbqEGhVj7ju3jGHP/IPK1gu4ydYtQ0uBl1xXw+VMLXjeg52P3PhwCXby4xNK7zaBe+fN9du@vger.kernel.org, AJvYcCX1IILCZYjwP4e7RBvsrWXk6/w6IljyK8+QIDO8KxZCmX0yDxD8nP/k0RahpTyd6GuOqS/RhS0l0QCnJLfE@vger.kernel.org
X-Gm-Message-State: AOJu0YxQCU8M8nGoWBOB0LClo3OTmwTC5PtqWOxUj5joqerLqC5NgVyG
	Dp/CN90v8/FnXI5YpBS0wH6IuhQkHS7Jg5BLsxy+/ai00nTS+LUsaLJb
X-Gm-Gg: ASbGncuvfhckBEnEYTon0pTit3AcnLk8GvqUdlZ7pVSWvF98x09grkeZZzUJZjwv4Do
	qv4Lm8NFr11o4mQFO249+1a4CMEc0MsRgaCvQW5zGifM/ihQhYNmGL1AiMtxHnjhd5ugb8WiK2u
	kHexwbynNHdTOQ9k52an2kEzHx3N+1N5OWJfl281GxJ1O9RReCdc3dHRLlUcqLsobLQZMLAWZad
	rjcRAER/8wWoEAqyO8PL3m09TcI7FZaY6wrgzYi0pGoPI73SN+TbGNCgetcgG07Y9STq+VGLDSE
	k1mLhRjPcU4TX5xCKIXE2TxBk6jtHW/KvuvdD6xDNcdpVuv7WTsCPBQ=
X-Google-Smtp-Source: AGHT+IEh0inAze1CXOgkzjApvqu93aSNTJaIdfgjwgI+fKB4Bn+HGQWoLGhmcCo++ZVEJkCd/9aDDw==
X-Received: by 2002:a5d:64ee:0:b0:3a0:b23c:15b9 with SMTP id ffacd0b85a97d-3a35c808c9fmr6616313f8f.4.1747492850304;
        Sat, 17 May 2025 07:40:50 -0700 (PDT)
Received: from hsukr3.. ([141.70.82.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889d9sm6412083f8f.77.2025.05.17.07.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 07:40:49 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: [PATCH] Documentation/devicetree: Fixing a typo in usuage-model.rst
Date: Sat, 17 May 2025 16:40:20 +0200
Message-ID: <20250517144020.870706-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a minor spelling issue by correcting "busses" to the correct plural form "buses".

Signed-off-by: Sukurt Heroorkar <hsukrut3@gmail.com>
---
 Documentation/devicetree/usage-model.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/devicetree/usage-model.rst
index 0717426856b2..6f9a2c0a380a 100644
--- a/Documentation/devicetree/usage-model.rst
+++ b/Documentation/devicetree/usage-model.rst
@@ -27,7 +27,7 @@ links from one node to another outside of the natural tree structure.
 
 Conceptually, a common set of usage conventions, called 'bindings',
 is defined for how data should appear in the tree to describe typical
-hardware characteristics including data busses, interrupt lines, GPIO
+hardware characteristics including data buses, interrupt lines, GPIO
 connections, and peripheral devices.
 
 As much as possible, hardware is described using existing bindings to
@@ -36,7 +36,7 @@ names are simply text strings, it is easy to extend existing bindings
 or create new ones by defining new nodes and properties.  Be wary,
 however, of creating a new binding without first doing some homework
 about what already exists.  There are currently two different,
-incompatible, bindings for i2c busses that came about because the new
+incompatible, bindings for i2c buses that came about because the new
 binding was created without first investigating how i2c devices were
 already being enumerated in existing systems.
 
-- 
2.43.0

