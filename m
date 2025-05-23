Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2DBA42
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959217; cv=none; b=h1pImFy5OnGxKTDox01//idR2sq8odbD5cRs9r6hGUs8F4AuxbijJQ4hVcD7mNa0PoxfuBiiXuMyRc4lkRbU0whlmW6cmI+wdgLX1Kq2tb2oWkhOE2CgRKW8JB0jFno2uJEQTTggaOc02m9bvcmkd6VdXheMduzSUaYSZIlMXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959217; c=relaxed/simple;
	bh=muJaRWHLNAqEyREyDsVWtWk1D+Gg65Bd35PEgmxwyjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMf08VEefB1HYJPTkujTIrfZnfChJMGFY0xjVlijpIZg6uyZ0QEvdSzDgxcytFDjhC7KKzPieksTeNbGT5LdHN+qGkpPxjei/ziRGhMJDdSCQbg62sX9iak1oGm5yRliHLyTcqQtQMMx7L9JEMeu1nGI0QBn6EQv/PKhRbNkluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=RWPK24j4 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="RWPK24j4"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dc6f653152so16274165ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747959215; x=1748564015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=RWPK24j4OBLf0Uh068ZuoYhpDfCmXc6JfmfLeklh7BOIRAgqGvXs/7FNpP3Y+GnnHo
         fh0/FR7jS/CvOADrbMbavDq5nIH/zKBk0Pl+xx+MTuDgfY+D4sxCQUtc0uUMJVWr50px
         zqETgtuz08gIurRsSgXX5w1JwHUnwZjdMs4ITkQMQA5PkewQkAOnwMoj7E8xzQY9RG7J
         BMg4l5Vb7zD1R+u2fqZDjfL7nipJ/mgD7d6QAEn+xawB63+TrvyIcTUCjnZCqs8cmqoW
         9j33RQvw+mpbYVfdJx4+WuivfgTp1rtOx2wmJ2ODIywE9fH61s29qQMp0HelLfCLgcNI
         RxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959215; x=1748564015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtaCyH1WfJUArzSfLQLt408RcB4GdI59nwfsGjUrhJE=;
        b=leEjzlU3jfSetgkxz448RVZhcKP/wMa2jxs1mVlPr1avY3YpsiC6DiB7IZoxNFhxul
         GO4hylv7ZIjyubNqnAbyF9FZpoI1F5VA+C4o1ymjC4fOS26jwPLeJYiJaCAyHJ5yXt2p
         MxJNVbYKBJfQ9TFHwVCuj+Sc/kkqwWOQvKSuDAKsscQLbQxDry1QRDJz6YrwfEApzwWq
         rf3M9RKZnQ4HMhXM/MOQL7btWq7ckbkdszFA9MU6xyedPh8hchtBd6LSLdAo0e41HYpU
         L2z0ZqUwVx4cuzZpHqp1DFsDAvTEmZejojniknbg7ytEUKUYUA4dGwvNXDUnCboxMAmM
         QYRg==
X-Forwarded-Encrypted: i=1; AJvYcCU0vy3q6uw67+BhJSaElKY8rf+a8/nklm+hjGb+oMMd8HW6Tfj/MuPo0wLLw9NhHm1J7Sfb70o4qNuTc+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrbds/Jbs0x9/0TQJT/c2/DG+gSTCyF2zs7OdjG7KVXgmPMKHH
	ibZt6tdQ5JP3m3qJlZDv8cXbbaLhSn37vkSc/jtkoQvNEu0a623kweF1i0qT91zNfHJ9T5vgP3t
	s0YIafv9SBw==
X-Gm-Gg: ASbGncvRMRtXrW1ANh6yW6tLQafmZbtIvY5NuFoJ9l4UW6SKcHB6FPr5foWBi2FE//B
	UzsKiSeyFK+mth+8GUsHHpdO2IEBJFnxfgKUTYL5fCfSyUk9u1n0JY8ZnP0F6akRmEacBrdAm17
	wHphXpgFwuJT3bNtlG6f1BXTnu1FhHJUTGDgvxtv4oyXVtPyX94cXXJZQrVm3BpsadGkVVinZ3v
	ooRGKWreiDIVxyrvmmoPu6q3eoA96OjQMXUnJuz94utC9jmVy2yP5v+G5vti92XB7mKRuZ6yxTK
	MokHTbjXuznn0tGJ2XxUJMjLVuy7K4cFIfNWSXOs2fWUYGXyYmlgnHdt6wgE9husygdmfmh3Zc8
	IU94M/Ik=
X-Google-Smtp-Source: AGHT+IFKmxDugOdIs6vFYcotQEFU7a9JdAs53jaauyO4yjTbDeTgs1+LUU9JZAtgqiOFD9DNicpN9Q==
X-Received: by 2002:a05:6e02:3c04:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3dc93276652mr13178285ab.12.1747959214980;
        Thu, 22 May 2025 17:13:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbd17aa848sm3183450173.67.2025.05.22.17.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:13:32 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] docs: powerpc: Add htm.rst to table of contents
Date: Thu, 22 May 2025 18:11:14 -0600
Message-ID: <20250523001112.102087-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

There are no changes in v2. I'm resending this patch because I addressed
it to the wrong email for Shuah.

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
Link: https://lore.kernel.org/all/20250517210757.1076554-3-me@brighamcampbell.com
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
--
2.49.0

