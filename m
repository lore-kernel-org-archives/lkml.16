Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F18D8F5C;
	Thu, 12 Jun 2025 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708136; cv=none; b=dR9CRlAatd8Ze1cEkNuVp6LUaHhUJ5b7PVu0b0v2logrK+anfbfcACMIDMi0Okfb8La4tEz5m/NIphVs14JKVq108SqALLTBT/Zb0rrSaJNJnU+jtVwMk+ECKKMn6cKkBF0ZTvE03VPvr0dgQP/hjtkVdxBG0Wy+WeDPlToikt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708136; c=relaxed/simple;
	bh=pAbmsyoRfZFG15mlzgMmJXM4rc3bcsvg1zoS0vGgn0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5bwklglPgpSOyeEk52HHhCfti5xJlkcRBpkYFQrYURxHsoyJ9uYgI8MiBL1UpGBYPFGk4YvoMLlH47d/XOrSXEJGDdRAATpWJyaY49a4sKlSV2duUU8qxqnyyJG2LTR6HbhdfOwBnMiSa3XQwiKT8GyeOp06HcyFli4hlVWIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUZlA7cJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUZlA7cJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad891bb0957so90000566b.3;
        Wed, 11 Jun 2025 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749708133; x=1750312933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oo/4Sxd0qDy01xmdMqfr52l+omRW/QRjrl4YazB7gj8=;
        b=XUZlA7cJDHsTtMaueMEW+PGxH+bPSn6TV7iSXsQ9AYLFHFgE9KTK9TeZX6MlRI4h9n
         UBbpaMvkUZ2znsTIsbxZG7pwUNKyeuCQTb5//zBzUmDQrjP/RSISSLZEmz+FqwdyvfBi
         srIrd8IaFatJjvFUm9FJQBTfCZbTDmuri6mYrbV9kGpIYpIWIO4xPYEaD6qnOQgrh1/z
         xe832b7Q3G6f4mMWaGby+gExCvq15vuczn0RHQqikuWWjmDn/vvADtRXmi3L0g8u2wXk
         d3wr/SnHvyvX8MNEoFzFd9i30Bd3xSEZmhNDnkyjS7QxrMbh6wEe+GpamfnzLbxEEGDH
         xG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708133; x=1750312933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo/4Sxd0qDy01xmdMqfr52l+omRW/QRjrl4YazB7gj8=;
        b=BCuBRY+NSBSf1fIhY0zE1PWHr+N9cdGUCcgz/5oGl1kyhADF1vwanJXDbRyXKSkoa0
         UKCUVtvqOlEQAvxjhMCr5bWV3woTbCZRm129vmig74cgi3MK4tg5wBWdPoIz2T1vsIU7
         9C4agVQqLKV16eRXA+oz9OWZhQLXunVDqYSmeD0TtNUq5LRlRvGQs04rHZmJ9p7mZsVD
         B6MgU1MKSjjq/kVjF0DzYGHX++U/o50hPS8qogzWaCRymaL8gx1ODw34mpu8wX4ozVZb
         uxs35GaSa8itYVNY5qcNNBomEKSLBTO/fXSrOHfAp0sn5MS4fBodhA+0NVvMA6/67n/9
         iK4w==
X-Forwarded-Encrypted: i=1; AJvYcCWlr/SJJjVG0p63g0QrEIQpGO6mFnd6o1CwsdEf2Uyx7HrzQ2AW10Bhumi+Chlgo7PjF7sA5bOqVwc=@vger.kernel.org, AJvYcCXObbcYMyTdjNY+CBHEmDGNmwfADSTwzh5chXUWuEjTvVBKFhtr1b5tveDznX/RCjEoo+lC8MTngy1BbEXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcnb6U7M8k2SvdbyaM3Brw5knoPVxROn6mcRrtDpFFM22diG8y
	BbjtRJJ5hLuZip2TV6gckYe7C7bjBsyljwCu42VKvxekkDn7f1U3hvGr
X-Gm-Gg: ASbGncsFzMEQDuQ3APnsVjZdEtUtZg04dTua6Ap8yPpZ9l4OCpqVUTvSs+Tsi2x7zkD
	4CWn7jicA75evG32T2THIjcOZaEQeG7fw9hmoaCNqy3TpDGBSWWpC1ZZ+e6TKOYxhr0ubn+cU/T
	CmhmuxmMst3DLvgThfO7zfI0kCScKMf2XqCkwv0glk2lo+vfncK8Wzi4XrE9pinI6zzfhxmiSlA
	Orf2sICegCEWCnewQnR7fLQAr6hompmHQk9KQC8KO9vtcWJ7VA3ac01aOIM9Jk0aZ/mmIYJFUBF
	P/A899kX4cPpYJndl5fLdrtplbuYDyYMm6ZD2SH8xfJ7ukwPIPBW4xd/NAHHRpN8liUFUqpV2K2
	mMbZJTQei+ysqmsVAUjQ=
X-Google-Smtp-Source: AGHT+IEKm9oYlwxEfuMYPygUsnm4oedMpJvNnX+QM9kSKhyba3obIkrltlTdn+jVO7Fct9r4pW9JLw==
X-Received: by 2002:a17:906:6a15:b0:ade:4304:6b7d with SMTP id a640c23a62f3a-ade897a28ddmr586726166b.49.1749708132915;
        Wed, 11 Jun 2025 23:02:12 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadecc411sm76148266b.144.2025.06.11.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:02:12 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8833DBE2DE0; Thu, 12 Jun 2025 08:02:11 +0200 (CEST)
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Christian Brauner <brauner@kernel.org>
Cc: Luca Boccassi <luca.boccassi@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salvatore Bonaccorso <carnil@debian.org>
Subject: [PATCH] Documentation/sysctl: coredump: add %F for pidfd number
Date: Thu, 12 Jun 2025 08:02:04 +0200
Message-ID: <20250612060204.1159734-1-carnil@debian.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit b5325b2a270f ("coredump: hand a pidfd to the usermode coredump
helper") a new core_pattern specifier, %F, was added to provide a pidfs
to the usermode helper process referring to the crashed process.

Update the documentation to include the new core_pattern specifier.

Link: https://github.com/systemd/systemd/pull/37125
Link: https://lwn.net/Articles/1024160/
Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..f1b2ab219a08 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -177,6 +177,7 @@ core_pattern
 	%E		executable path
 	%c		maximum size of core file by resource limit RLIMIT_CORE
 	%C		CPU the task ran on
+	%F		pidfd number
 	%<OTHER>	both are dropped
 	========	==========================================
 
-- 
2.49.0

