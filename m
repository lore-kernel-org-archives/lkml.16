Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739D15E96;
	Sun,  1 Jun 2025 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748757039; cv=none; b=DjTngn9EGOl2tcNfoaKNTyrCqCKK9hZ8nhwH0xTI4W0kCq/ZWZUbUd9PHnzWndtBGY7uB5rHgPK2HMOQKebcUuj/5Kf0cmUurqlaohvGu71fb4pyAtvB2N6TSX9QjkA376jBLU19NBLnV+a8TqQL214EXYMgI0HAbIATJYt3b8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748757039; c=relaxed/simple;
	bh=ziibf4sLXY9QYfeQsq+F7s4Q/U5BplryJ9V+6T5yZAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WmjIda974jjhlQBGZ7mDp/lFJVO++dB3jdn6MMM66JOn/q2IzBPs6zyFsREgYU8ifDcH2bLXubPiKFZFda3ST2K0qmgny+JVxjvCKvd3MCGm8truoR4yu7z8ZaTr1p3KtTBjDzBUW0m2Fs10/de4vg9AeGz1XfQxgpZuOjoDPLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHqKRdTf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHqKRdTf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso3630085a91.3;
        Sat, 31 May 2025 22:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748757037; x=1749361837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDAGXeqXBL9QqLktRVbnmbiTE/ZSUhZC1jkXPDdNOIk=;
        b=XHqKRdTfP9xQDX9c5cO4koe5GsVeMMhCcANqDQsDiga9TwMcHsWjYp+AM34pDBtgl8
         KncOO9dQfha9Sbr2HmM5peg/qhkygC3ZwAdUH4nRLvBalG9hcHR76t6iMZxtXkRE061g
         tYNhKD3YcIvWxRFwRWQeOQPKK3z1H2iHzT3lIsMLjn80z5jRaUb6RH/IiXbrN+qUQroW
         ZoDudnZCXQQEz/l7/SsLyFl33SjuA5p89e7p9CZy/c3356DzNWk9qQWpONohFe2HrAcd
         bKlxX0/H1WT8X+HvOTnKaYmUQvL8ksiUpv2GagSBt3go5XGLL2PB+PdzydJ/RUv1gz5F
         B3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748757037; x=1749361837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDAGXeqXBL9QqLktRVbnmbiTE/ZSUhZC1jkXPDdNOIk=;
        b=JowRhIZQbOXLGPD3wu4hU0GK1ybBzYHFxnyC87I2DhDcbd9Rzs7DfQJpt5RxgnZqLg
         ygZhenOkSpUFm5RYlqdHN2wY/2wx1DqlKwy/96MUzvWOv7dDnyYrNSt8VHthHA1Gqxlf
         43HRh6CEBLQqSPz3aHoMaYitZK0hxDDVv4S+YbQKrCf2hVEqpTkPNn1/ZKdwW5Q15R5o
         GnYS8BBPs5YyZHtu3YqfTtd4I5+J7GDc9H4CdDoMLsUlfb61F50uSbdIa4K0iMl2mRd8
         m7WtD55EBE7/8BPouCJ3dMGw8xRle+RHAf5KSqyQgWWYXke571NTHTG03aIw747k+dDg
         980g==
X-Forwarded-Encrypted: i=1; AJvYcCVgR6Q+i+0Rgk4V9fe+FgCfScfkxzRw7kAR1u9SdnxduN9A8MpOjhgHEGrdRwi15jFO0aH6LKg+j2Bmb3pIMSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRnOwm3+swT+g/mCsJQJ1Oe+BaqWPna4CzNhSA4fSoVCs7Z2C
	PYSveOvNjsamdMTlUm0x+nInKwZ2JJjEIkg09QqhWxjVDJBAV1AwROGMSgrVPA==
X-Gm-Gg: ASbGnctMpEghJ39X8rN8mPHWNZ20H/C7XRd0NSbg+oGAPZcLMmwH3rbCagNRplbfj2b
	K01iXbnIqnNUnrIIfGKVwGhAII2e1e+XjtBBSvkqo896TZsz5zd6UjAmWHttDcWuxIhi3RbEMYA
	uDmHWARGTOqE2hTe8nMVHIGBA8y4Vos+EgxpVYyfMQ8aSDIYzOAsO5n5RLf0tbyyxbmMHuE2C5I
	jOGaeuCs4N7H7sgHS9HdXfEYtgJRhv9LsRn1687ar/Z9aGfft1oTp2Rp5zdcO3lNmNf3jYlsu8K
	v4IVSckFvSp5fwA5VAQNjmYv6qGJoXRix3kkYgntnqg6H0kRy4grm8l+365koy5uAReHAxFkxHs
	/42nJVWqRGQJY+FRouLb1535C/yzkx1djqyYTJA==
X-Google-Smtp-Source: AGHT+IH+aRspy/krYFsFMAI2O4WjR38wC8YIQMhOOHCMZ2rwFeCvyAiJp7iRLyPtec4QfVQqYO4GFA==
X-Received: by 2002:a17:90a:e7cb:b0:311:9c9a:58e3 with SMTP id 98e67ed59e1d1-3127c6d713cmr6234141a91.10.1748757037083;
        Sat, 31 May 2025 22:50:37 -0700 (PDT)
Received: from localhost.localdomain (69-172-146-21.cable.teksavvy.com. [69.172.146.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c0db6sm3889756a91.34.2025.05.31.22.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 22:50:36 -0700 (PDT)
From: Tony Ambardar <tony.ambardar@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org
Cc: Tony Ambardar <tony.ambardar@gmail.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v1] scripts/gdb: fix parsing of MNT_* constants
Date: Sat, 31 May 2025 22:50:27 -0700
Message-Id: <20250601055027.3661480-1-tony.ambardar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently, constants in linux/mount.h were changed from integer macros
parsable by LX_VALUE() to enums which are not, thus breaking gdb python
scripts:

  Reading symbols from vmlinux...
  Traceback (most recent call last):
    File ".../linux/vmlinux-gdb.py", line 25, in <module>
      import linux.constants
    File ".../linux/scripts/gdb/linux/constants.py", line 19, in <module>
      LX_MNT_NOSUID = MNT_NOSUID
  NameError: name 'MNT_NOSUID' is not defined

Update to parse with LX_GDBPARSED(), which correctly handles enums.

Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
Signed-off-by: Tony Ambardar <tony.ambardar@gmail.com>
---
 scripts/gdb/linux/constants.py.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index fd6bd69c5096..d5e3069f42a7 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -73,12 +73,12 @@ if IS_BUILTIN(CONFIG_MODULES):
     LX_GDBPARSED(MOD_RO_AFTER_INIT)
 
 /* linux/mount.h */
-LX_VALUE(MNT_NOSUID)
-LX_VALUE(MNT_NODEV)
-LX_VALUE(MNT_NOEXEC)
-LX_VALUE(MNT_NOATIME)
-LX_VALUE(MNT_NODIRATIME)
-LX_VALUE(MNT_RELATIME)
+LX_GDBPARSED(MNT_NOSUID)
+LX_GDBPARSED(MNT_NODEV)
+LX_GDBPARSED(MNT_NOEXEC)
+LX_GDBPARSED(MNT_NOATIME)
+LX_GDBPARSED(MNT_NODIRATIME)
+LX_GDBPARSED(MNT_RELATIME)
 
 /* linux/threads.h */
 LX_VALUE(NR_CPUS)
-- 
2.34.1

