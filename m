Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D7FF9D6;
	Thu, 15 May 2025 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747270774; cv=none; b=e1DF4Lraalp/o2977wc8a4fWIWETqcj963+pEi7jgbqo6pTwdHcsbXsKKLkb+3xs9a/erFym+ZzYRZJ5ts4488gHpRpxsvvFmx6XDI6H4B2XljvM8SF6pOZuxAx6U59ntTFc2D1TFbDOWfuh6/gfY0Hqe18faPXh9fkM4wRWaZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747270774; c=relaxed/simple;
	bh=AO0oxrbM4bgozBnTjAXPkoJNmwA9aXQbJ8MUrwELvvQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YhD5bBqyrwH6XlBqj8Fd6e4w4Y63mY/hBItFoNOWJ113OCYiwsd6kPDAQyfs6eFxI00fsSmUO3tMOXkO67ZvByLBObQZdDnfZ/dHDziJ+vUDw9G1un3fLAsnmhTGoORPre+uG9wqPnxF9tu5v7qZcEtNrqBTfukcTVC0yyR2Mzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwbipXFu; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwbipXFu"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-708b31650ffso3920827b3.0;
        Wed, 14 May 2025 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747270772; x=1747875572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y6cw3Gn+tXrQiLkB1C5Xzf+D8lEAhFlZJAmK7VQ6xuQ=;
        b=JwbipXFus7Sefh+RNU1oM16dds8kUrYkUDef4j+WQyMuQxgdQ4R+EbVDnNmi/3BMQz
         E6Gg88yyFhfxJjJBmpEwMBEwDGRHCTXNPTdN3KPZd3gAQLx3hCath7Li5359wMLETyrI
         Mp8HXo2XksnT5TUvSJZZBA9tqN31HKK0/alsF5HLbbJxegUWLrDqyuO+69IeJxQkUobF
         q17sBKeSxPju2KLFIGmMamcDB0/9d22D4VFv/R8IAK6MBIhI3jiQb3qY0K3UX58Xs7N2
         8VBtQzMuZKmulXGQ3bVozf53Vgj15PSM4we/b/GACAmByMnI9tvFX+yL9dMcATAiyAj2
         9KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747270772; x=1747875572;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6cw3Gn+tXrQiLkB1C5Xzf+D8lEAhFlZJAmK7VQ6xuQ=;
        b=o1g5Nh6BspmaIfQqMb/JBZH0RXZKYrfjh4n1Uu+6aG3VyzxDLiCRefC73rG+SijkN8
         qoMmrrtOPYpdSYUmjduYHS6oFry1iQ5P7oVDslx5mwKtlWxarGT5YfSoMwrHMldNEMdQ
         4AD4YUGpp5YsAsiPhJ5wE6I3mYt+Lj2QQBlIVQpTIrWMnkCuM0f/NwImL7vWbbBYanP4
         oOQSnqsSQrwQi3YtKTEe6BE7fQ0cF6iZilzmfPgf813lVFg/5b/uFDN7NwyEdW/KDYmC
         x0uRKBOwEwouVhMokrJQpTlXmOHWV8gdnGSLLVkQ5uitCwLynhLxWkCy6wihd5MnCTN4
         7gyw==
X-Forwarded-Encrypted: i=1; AJvYcCV/pnEhPnY6wS/B1cmw+6c2EBLL7Kqrzi230HVWMNUi4u8l1MDWhCmRzjkTody+toZQj4LpGPdV3lnj+0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJY03eAviSpqVz/23YW+1cCPSKMaDy0VGshHo1FH9RyPdkBuq
	CdvAoZIkD8ABKuXO2dBSZa8wEdv4yDIGxqAtrFVqNtj2g8rZ0LA/NsLOVudGdzqxkBFMHwa2dma
	Sc6UK8vxt8HqSz4QWWzFz2fAmv9I=
X-Gm-Gg: ASbGnctMMOHajIWSKrrT3IYQUOLMAgLSUG3qCW6BikiD6HT7eqOqLIZJTEb7iS+qCIq
	QkV6O7L/5ZlGM+CPRRYGvTIORBTAZMtqpajEa6nGuslFOR0ssbJkPKaGLwxtwX2v2xHGWFZiQng
	PGN7tFR2nxKKIxi3pZ5CwQP4EbTMtuK1FEOXufKHl3QHg1pxkZaJpfwXGVDfvHziGe
X-Google-Smtp-Source: AGHT+IESrIUmtrXiSIb6LoWeMOt37+kobGDcGMEPF1yJfKKkIctkK+TvU+kZFywubGf0o7thMjZG+nZ+xq+qjtyQRGg=
X-Received: by 2002:a05:690c:45c7:b0:709:176d:2b5 with SMTP id
 00721157ae682-70c7f10c045mr84889977b3.2.1747270771901; Wed, 14 May 2025
 17:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Thu, 15 May 2025 06:29:19 +0530
X-Gm-Features: AX0GCFsoQguQ0Xmr1HwEN-lvs50OmGxFhXFLmfsaBEiyghpm-bWyMa93naAlTXE
Message-ID: <CAG+54DZ4YqBfqkvCWBWSZWE0LGmcs0GdE2_HiSB8JUsau3OvOw@mail.gmail.com>
Subject: [PATCH] Documentation : kernel-hacking : hacking.rst : fixed spelling mistake
To: skhan@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

fixed spelling mistake
LOG :
----------------------------------------
Documentation/kernel-hacking/hacking.rst
----------------------------------------
WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
+.. _kernel_hacking_hack:

CHECK: 'compatability' may be misspelled - perhaps 'compatibility'?
+     * Sun people can't spell worth damn. "compatability" indeed.
                                            ^^^^^^^^^^^^^

total: 0 errors, 1 warnings, 1 checks, 830 lines checked
-----------------------------------------------------------------
as first patch for documentation.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/hacking.rst
b/Documentation/kernel-hacking/hacking.rst
index 0042776a9e17..22b880add846 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -794,7 +794,7 @@ Some favorites from browsing the source. Feel free
to add to this list.
 ``arch/sparc/kernel/head.S:``::

     /*
-     * Sun people can't spell worth damn. "compatability" indeed.
+     * Sun people can't spell worth damn. "compatibility" indeed.
      * At least we *know* we can't spell, and use a spell-checker.
      */

--
2.43.0
