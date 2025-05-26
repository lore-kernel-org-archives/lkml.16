Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511C82147FB;
	Mon, 26 May 2025 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285064; cv=none; b=jjmDfXqULJ1cpqXSLLaCNzRVRbAm+Ez6vBsLeEaEl9VxMvrCDJMU7fbMmY0p9UknfiYtvi07ceDi1jpsJwGrEfUPowTS+vr9Dk678MdHx23h9W5Cw2MOXpD/ZVoa9EK+c/hUhzCACaaEbk510g98PO40TEGfZIsUWYIkSqiuhxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285064; c=relaxed/simple;
	bh=F0nXqeztZjLXSCez38dqnwS/rbBaPXXvjEwZG3KufIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuTZnQ5Eaatrxzomerg5Q+zUYLUTZEV5o2SnmizKL98VBaxB8jbLjRSQWUgJg6/TNMyDJbRx3OR3EhgqouxzLmRfs5MHJy6nP1hIwJKLeNqz0nTA5BfF+lYwfgAk7oUzFZ5nsPTqojj+7tARCsb+Ac35Y219PFvp67O4c/B2F3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHE4jY96; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHE4jY96"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4d152cb44so2099330f8f.2;
        Mon, 26 May 2025 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285061; x=1748889861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMCJtECyYLnVFjpZvyBd+ub3nNwjuB4xZOaytzPNUxg=;
        b=EHE4jY96j1Z7xqd8cGojRsI6Arz3LFgCYrqUUVzJJv26a1DcHKGS1lhjySxoCoRipP
         q38rU7C1IrnaWc7Pm9w/lDl8uL5IOHEe8J3yN5VaemyP/Gr1F6vLS2SVnhALtC1kL07X
         mlmyFuJ8rqYznv29+zBAJ7CRfaLi6KTmcI4/QYnQo/E6neC47Ab9dPivSZ0Ol2IWh5WX
         qsyZ0UO6wR6hbJYdknjWCbWZDvdWLKmG3MeazvHCl/HvWmidEi5yYUyKyvJAUQuukUh+
         EINvEQFsiyrdVvJPmz57IuOFz9K+GEYQ5BsRUUShql+lp8bdwHe3U+kMIGG5sqtiFiyM
         +wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285061; x=1748889861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMCJtECyYLnVFjpZvyBd+ub3nNwjuB4xZOaytzPNUxg=;
        b=QqFK4b94O1OiqmLmbC7EUqWOL5tmcNsqpz3PGbYrxPGP8emzHqeLaNRY3lwe965+uA
         Sbp4Y3i5/3nKBItjn8n9ZWHALcNXh7DHnfIfmzsMFcwqYy4H/fAXU/aEY8+15G21qcJl
         uVCpl3OXIsKV75u+y+PDc0WPeAQD8pLD4r57OC2t56JzMZMWWftwTgSa8gyRxeVpCkxF
         MRGe+2iV0/VrEBtjul0cWSzssxiPvAcGZYKPz0H9n9iOmmKEef0khFrNhyvGahxa7E5v
         e2xCcvYcAQZYdawntTvvrq/AhLtPDM7QVlWKFshxpK5JBSXEpW0QKhzBfd2XPReCsGH0
         MuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkPr20LqYO1D+c8bkO57rI6jtsDq8p+Swk1j2CdLX15L7AGxjJ20+5a45UyuVkUTw5F0T9xW5IF7SBA4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86cfuW5CpVeYmGLs5zFDe3dtq3OAjzUXKzJ9qRNAQEB0lGBrb
	ZYgW1HxgKb3tmZ7BtzsEv47Weik27W2GVRIXjcv90xIcfAR7PYEOT47cDRLR1Q==
X-Gm-Gg: ASbGnct/+GdXLs78LlIiwWdog0j9QVf8AghhoSKlWhHouMiaL5BFmkNoqn6IOwWFCT2
	mZ22JuHyKWo7nPu13Qcu9raLLVgvxWQ94CMEtGK1d3kIz3Pg2aZ9wt/0NzCv/Km4YunfkxwSUpy
	FOk1MFLiWnbHm6kcIwWacY2a2Ka9gNrXNhqCblLNkY6J07ddkoM0grdZbTrFL5I434Jp4yxrBRR
	EtZuM1IeckyzW11JT8CVRBrmpYBZpjHo/XOei/3l+qkesICIL78ap+9a6r6NgubrQ4A/4e7lI/k
	WvZ21HvDjF3T7moVCHBT7lUWYzg/PDZhPW87/ELHtKl3o9WX5pR3glJKk4ZKoGQ6twHde5ek7U/
	3/Q==
X-Google-Smtp-Source: AGHT+IGTZSfVQ6dWElB0XLcV+e9gDpFNN4ZT+p1+bxpoMl8MrW/ZmACvkZFbP6thwQgK6HZ2PAqRXg==
X-Received: by 2002:a05:6000:2503:b0:3a4:d048:124d with SMTP id ffacd0b85a97d-3a4d04812ddmr7668024f8f.26.1748285060991;
        Mon, 26 May 2025 11:44:20 -0700 (PDT)
Received: from localhost.localdomain ([154.183.23.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm36455664f8f.55.2025.05.26.11.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:44:20 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	corbet@lwn.net,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: escape literal asterisk to fix reST emphasis warning
Date: Mon, 26 May 2025 21:43:59 +0300
Message-ID: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Escaped a literal '*' character in symbol-namespaces.rst to prevent
a Docutils warning about unmatched emphasis markers during documentation build.

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---

Hello, this is probably too trivial to have its own patch, but I found
it while building today's tag, so I thought I would send a patch.

---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index f7cfa7b73e97..008b34fe6629 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -87,7 +87,7 @@ modules to access this symbol. Simple tail-globs are supported.

 For example:

-  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
+  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-\*")

 will limit usage of this symbol to modules whoes name matches the given
 patterns.
--
2.47.2

