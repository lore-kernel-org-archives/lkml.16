Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B11C1F21
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431231; cv=none; b=pygacMY1+Mivx8fcIvlTHNppQ9Khg9YDuhgH/TR8kJdfmqhGxSpbk7DrZOHsFBl6i2+6tj5i0S9gtzIe+kMIxr4jZXLeOgOSilvdkdteNiXsJeMDb/nESDjWvXVGKkXSyDAOR3umu95uywWFoT5YgHD2k56M+wItvw/kGweawks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431231; c=relaxed/simple;
	bh=+AfY+0DnN3cknayUVzyft99P4jOmZpu3yiNDoJr8V7g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=N+bSchspvQnfDWGSnZG09xiDmtXvHeWGsc9geBP2N7y/8iLZcIMY50HaXTY7LRc784qPau2dCwzHAjgfxjuknaShewzwmiUBViZzw0HynNwi7dbe3zHJ1Ncy/pKZ5KPJnSEDb83ulG7DupIKY/SW1BnLaSbuA0/ge4Go+cS5w/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=liNqck4c; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="liNqck4c"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so210151a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745431229; x=1746036029; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/2XkzTc2PJn4A+a+JXQEXeGTLyFH8I/nd3+JwtUQBwE=;
        b=liNqck4cGDDoaggOjUmZ/sitXRq0vvwWuFBbBzYwnp1DhnEnQbMIGwJfXIbvUllCqb
         g0Ms9zfO0iy65jZ/5iP/1HoAGNsDTCWBU6nQsTaVoLoSa4tOoPax8WteRxtrh2aYP27x
         2qZoY/jnKZ3JY/Ab4ke7pfBeqPROKaHEP5atv2+eDM4B3SRUOV1j/DOvhnefY1CyIOJo
         4mo1uC+luLN+Xq2qtDrNM4cCaCq/V3pV9TQ6n7Ot5xsEo4BCBRHRAQmkvRjGPEinuJi+
         ZdZB5ytJwtwj9O8FgP8VXcczztUpChLI5Fhm8/QGnRpD+tO/jiNfTzRpbgpVTDOhq1f5
         4amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431229; x=1746036029;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2XkzTc2PJn4A+a+JXQEXeGTLyFH8I/nd3+JwtUQBwE=;
        b=Js/pf69/KuqGlFrxQwfbVnPc74iwfKdSIGZdh7Pfukclddy2ntk4DIFaubj+zKnumL
         2lQHQc/3rRRq9Fpga5dNMs/tea+GFI+AFOiU6ttX6YqzEXSlhOr2uk6k5vSbfidElA6Q
         OyPCiSWSkdJQiCQ769Edk1EMgIP4S/5DmIcKhCb7lC/H5EDEv701iWrh6c7e4WqbSzrr
         QvlxZzevUG5RYoyCFFqV4UgafRbtfKN8tgoxptCLKxRixQtjzFnxQ4ELP4mhmTRzR5Tt
         /gS9r9Gmgif1SuXHb38++G4BZI1vSujPwmtY+4RNz6Ke/AWyS/j+95XmF3ezuHdzS4ue
         rUIg==
X-Forwarded-Encrypted: i=1; AJvYcCVgPIK2LhhbsGbWLvOnMpG/g6mpRpj83T/5R2T311FuQhX9gvxtYpHjQd66/b8TdNJKEcXX9Pfszj7kMCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52XsCeYYj3ObWvq+BAM//bO5IJTSEM8byqDTxEXX5Gx3UUmYx
	u77dm1+u/mUhU1eShome1Ut5GXpI7QEKAkdhhshr1Nnej2MkCuMbj95M+PN27ErsBHm1pUeZOK4
	ysPerpIwM5B/elg==
X-Google-Smtp-Source: AGHT+IFqLpkFseBunG8fACc1+jNza00V5SiHoWz9+D+PYIihJbr2Oc/oxVvJXJdUbkhWRZP5M/gY1MykKMLBRrA=
X-Received: from pjbee11.prod.google.com ([2002:a17:90a:fc4b:b0:2fc:3022:36b8])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5828:b0:308:2945:386d with SMTP id 98e67ed59e1d1-3087bbad74bmr31666512a91.24.1745431229546;
 Wed, 23 Apr 2025 11:00:29 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:00:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423180025.2627670-1-tjmercier@google.com>
Subject: [PATCH] splice: remove duplicate noinline from pipe_clear_nowait
From: "T.J. Mercier" <tjmercier@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jens Axboe <axboe@kernel.dk>
Cc: "T.J. Mercier" <tjmercier@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pipe_clear_nowait has two noinline macros, but we only need one.

I checked the whole tree, and this is the only occurrence:

$ grep -r "noinline .* noinline"
fs/splice.c:static noinline void noinline pipe_clear_nowait(struct file *file)
$

Fixes: 0f99fc513ddd ("splice: clear FMODE_NOWAIT on file if splice/vmsplice is used")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/splice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/splice.c b/fs/splice.c
index 90d464241f15..4d6df083e0c0 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -45,7 +45,7 @@
  * here if set to avoid blocking other users of this pipe if splice is
  * being done on it.
  */
-static noinline void noinline pipe_clear_nowait(struct file *file)
+static noinline void pipe_clear_nowait(struct file *file)
 {
 	fmode_t fmode = READ_ONCE(file->f_mode);
 

base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.49.0.805.g082f7c87e0-goog

