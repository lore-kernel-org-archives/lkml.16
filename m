Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FB1C8638
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638633; cv=none; b=SJuJRLfvEDV/TbLlgpBT+wfj4of24JXHmr1I42LjN3sFUNxceyg2O1LFKwS7fmGtq+zyFRzdfGDgEXPwP3H07OkEBjZSU/FPP/rJ0Ci/67BdyKaiE/PuyAPc/RGrLKndiBqyO7oFs7+ZpBvf3g/WdQxroSdQmTh5D/2u/U3tMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638633; c=relaxed/simple;
	bh=Dm79fcO4VQR2Z7zB9JBal5HGQswhvMqg6ge80PKZMVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lvl7zD/dND7Y+I3EcPiUv1NjDACTAS4XHcUowwt4NO/qFIul12RtaiUxuZfgaTnf0MZxveZZf9/35NmkkJ99DfyH4jR39L4P3pk36RzGYgSiYCaHyeCZz3SFguRYYRMJIRV4dwky0NHabCqkYwpFRT5IH/xe2GXiPBBaYDfOWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mM13HJR5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mM13HJR5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a375888197so1258298f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748638629; x=1749243429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMSxpw9+y8iqYt8JxlT2EtidzUkF8uYdC4WUU5TEScc=;
        b=mM13HJR5b3PzZLnDi1jcieE5D94dONKK7SteNCDL7azdTQtuOcW8UTNbhR2PvE21YX
         xozRledYKZiKSxO+zRs9mAglNfTD/tJHoidIAgV2AW6ChjkC4JgnBcZmp9Svsz+SztjO
         2P8usSjuC5XZeh5d0NLFZJ2XYF5RnWG4N8mt9WL4BM7Hvip6gvgpqKKf48ih7+5XH5nF
         l0hKHBrGp00BWv9i2yqMbuMAmyj4iaBlCaBtfw56WZtFiTvzhIlGgB4CCNPvAaBeUPSc
         5jB3b+e75EbJkutKafCqOQcecT5quw4kffbxUzE0rrKWQt/nHLbUJ86fLw/dBERsTXD2
         8B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638629; x=1749243429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMSxpw9+y8iqYt8JxlT2EtidzUkF8uYdC4WUU5TEScc=;
        b=P8nbk61ezeZFO3kxpK0p+VVr7mQWWJnK66dXEVhei/UePewzK0iwJ6oYUY07QU+ENV
         oCLplYY60ZBoct5RegiT/kCg4mwA7O2dt6IyZMkl0C8+TaUwd3XRhPZKKkJbGbA7sl/9
         h0Jf0K2NxYxg8atv0JUMdWdr3LVUiT2mtHztVKNT+v8NPRP1wbAtHEBT4VcHiPdia6AV
         Qj+xpN/r/mk20M+8QUVtNqfQ08fVtaJnwJLWxvtrwf7/1Wadg+Ne9JDYlQiwEg+dfuzi
         49IDzSwU2HNDvWAOI37PFIIOMXc2KFFgL5X75I3xKC5wwEutHs52XE5cevk+It1fSMPF
         7lwA==
X-Forwarded-Encrypted: i=1; AJvYcCUTwF2RUucHC/FLB4g3RBun9O5drfTw2cWLPbGOrDFH4XxIxRCCBNflgVg3CdNt0ibKxgCsyrIDpHSBi/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjFJmDn0i6VH4cmYu8R2ib8mB3juiWCFFygadsizneFLnI94w
	zhPLvHgOglNBWGI56tpDDcUrtPIt3YCcgYHyF0fN6xoy1T1ltDbLNUPGYswPIWKvTuI=
X-Gm-Gg: ASbGncucDD5D8UwolvhHCkw/1kD6kHkGR1x97LTzED5TX4/pXzDr82Fjx2Jjvljwi5a
	j1AMFYkdkud4G45Bbpk/E9sv9leZt8qGW7r2P5bWQf0b00Q6iCfiG4s02IHPBB8lu8enZTH6voy
	fJvvOelId6jNwg+l9/iZH88xis+X7EuNWQexclyWOos0pg5xvBaHj91nQ9szI2IgpsqBzPopnAk
	NCVlowWSplHQQyQXPuy63WQSlrTjcFFkl3VdyTXjzHsbpnhPeQSWkTe7H1FEXYd0BDIafjwBwn7
	5GUV76oezer/tjmyNfznv7HmwMShU8hxdNFLaEVxhBjFOrWpzuydvkl/Ad89/YeMzZvu+SCOO6i
	3ypttJquMKRqzXQz8TrbXp2YPlNIjzXh1
X-Google-Smtp-Source: AGHT+IFWYT8TlHTZ5dxUNJ/zGMMdJKAZCNpCVQnFay2dxKMJaROjY0ekIJNuo9sSdYKAqvoA/8qeqQ==
X-Received: by 2002:a5d:5885:0:b0:3a4:f51b:9f9a with SMTP id ffacd0b85a97d-3a4f7a4b143mr3503535f8f.18.1748638628885;
        Fri, 30 May 2025 13:57:08 -0700 (PDT)
Received: from carbon-x1.. (amontpellier-552-1-200-51.w109-210.abo.wanadoo.fr. [109.210.255.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm5666527f8f.2.2025.05.30.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:57:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 0/2] riscv: misaligned: fix misaligned accesses handling in put/get_user()
Date: Fri, 30 May 2025 22:56:56 +0200
Message-ID: <20250530205658.624195-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While debugging a few problems with the misaligned access kselftest,
Alexandre discovered some crash with the current code. Indeed, some
misaligned access was done by the kernel using put_user(). This
was resulting in trap and a kernel crash since. The path was the
following:
user -> kernel -> access to user memory -> misaligned trap -> trap ->
kernel -> misaligned handling -> memcpy -> crash due to failed page fault
while in interrupt disabled section.

Last discussion about kernel misaligned handling and interrupt reenabling
were actually not to reenable interrupt when handling misaligned access
being done by kernel. The best solution being not to do any misaligned
accesses to userspace memory, we considered a few options:

- Remove any call to put/get_user() potientally doing misaligned
  accesses
- Do not do any misaligned accesses in put/get_user() itself

The second solution was the one chosen as there are too many callsite to
put/get_user() that could potentially do misaligned accesses. We tried
two approaches for that, either split access in two aligned accesses
(and do RMW for put_user()) or call copy_from/to_user() which does not
do any misaligned accesses. The later one was the simpler to implement
(although the performances are probably lower than split aligned
accesses but still way better than doing misaligned access emulation)
and allows to support what we wanted.

These commits are based on top of Alex dev/alex/get_user_misaligned_v1
branch.

Clément Léger (2):
  riscv: process: use unsigned int instead of unsigned long for
    put_user()
  riscv: uaccess: do not do misaligned accesses in get/put_user()

 arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
 arch/riscv/kernel/process.c      |  2 +-
 2 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.49.0

