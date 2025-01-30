Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A27284D34;
	Thu, 30 Jan 2025 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263129; cv=none; b=lvgxUjfneBu1ZKRvGLsx31xqmF3mmxSg2W/p19+Bpogh2eMj7rhS46uVevLQr2lPNBfldzMqaa6ZKwadXyl98U6oMO3OUGehDnsBaos9v/lAm25yy7xnSui0pkXhJlCtd5xQLh7WfKqYvVgzQlh1jhl37/I3gslaUzFrx1veCmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263129; c=relaxed/simple;
	bh=niSBM8uN492sYfrh8aruBEe2wGD7WsVhbrC96mz4Nw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NpvXYCHt4x3HbGQoH8Cl6HkDaz+mcbUt1AKwM7JZnT2IdlftnOY5n466qvmkrja/ekuyTlm32rV0SArgwBFh+JNJfz2huC+LTczPcqQbtcK4jOvCHOE9TazUfjpZLPIXi85svR6QUNRPzXeXFpYj5V6cf3f8UjA+mkN7xrvGawI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGVvHyZY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGVvHyZY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so20612085ad.1;
        Thu, 30 Jan 2025 10:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738263127; x=1738867927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bwKh460Cy5gn1CkY7H0LmuRVxYlu6SjHTcnPiPPdgw=;
        b=aGVvHyZYyaFHHAXehvCjFBIPtCpIsPOO4wYO+QKJJtbKHH+9OujkpCP2X3E4xjR4zR
         IKm6MqVQs3tS2w9tsZ4w+AdoCKldDP8mT22WaeQOinlcNJgQK7bj3u/du0cZTAwJk9yR
         cQUSwRRH2rG8UEAWleRZMtt9CBrskQZpAQJZ+9uT0YtFuXjRYz5jKIagOx3QGmfVf8Lg
         B3h0R2QW5ZsWcALXZ4JPPxddGr9+fmqn5zql+NARoJeUzr2avHkva5SFGRFCvOxX0l+A
         Z03wR+iSMqU92NOnmZ7IFtlrhS2/YFuOxY3Le7aGmNxqQf7W0zOgHLNoPd0cfiGLNPSl
         ystA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263127; x=1738867927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bwKh460Cy5gn1CkY7H0LmuRVxYlu6SjHTcnPiPPdgw=;
        b=Nb8Cq1yxtWZWNVwDqXV/XICmsm+KyOchAKhslNXKHqCBcumyTV2TI5LMXgxAnJjqIh
         7yj6UTyFeGRNLKfQM6f0sZp4XXL/4H7lsrdYuCxSP9QG+pqiHuNEm5aoB4J6BsIShiof
         mwjGkNaQJN2WrO/HjdxOnpGTLt+aTtwbFPu6o7U+FKTWalywIsgR1EnZosEHr3lTKQoX
         McqGYm9bUs90sqfdfhRmDtCsIAKQasYxXhI+0wVjAbYTmpKH5rZHqNCHvmLMdR6L7Hz7
         hp/rkZODMp/I0wIaUsSn0PggfKeSkhJA81yTNH4P4GGnAz62QRHYYUXLl38KsILkSVFE
         XJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAiwyJBl+QTMD7xLfRbV7oKYCRkafUjCR/xs5hBDbwPKpJIOY2m/6fjoXq1yI8jbYUfInD3sJJqhpneFXj6nE=@vger.kernel.org, AJvYcCVATTaoPNSc557HFG+Kdu1CC83ojQvlfGnB92l77y3zrbeShr3FGSXC8uXNhN/HA01mtV56dha+NxiUMt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcGzRlU/5NIlw52CSZsxObqezdM+8bKbiYoBK4WTBCTbbTuWZ
	9DMw1nCmDrvuhHI0FQtzfMBMCjo5uzlAF84swF+Lgqn2MZ5CuIFe
X-Gm-Gg: ASbGncs5IZSdNoQv1VQd2Bzb8mrX8AEPjq+ecw15scPww/jWo1tPD10bfrSDWS1dh8T
	ZMw4nfXhyhky90dQ7ypx0m84uiZ2pnsRbnhlME+TQv927Ofy/56Hy4y/g7Z5YaBcEdaMNmhjcVT
	mi16IQnFwOwWDgdnTfojVysTnMqH7EhGHeJxQYUwxv/Uc0+HkekYWoiEszZYcAWy+ALJxLoPYw9
	XPlvg4cB3ZPMseZ8yx+fXqTHAX6xtm788ILEPZN7bSof6A6fX1X0xQHMlWztYOW3wTJWVXiUvPH
	FJz/kHApYUOmDoPRMW6tMPbs
X-Google-Smtp-Source: AGHT+IFcXhuIYZqkqqFKvhDePkcRoAzQDn3xqtb2hBtn+2eXM8a7dejhy3qcMXvlEtNxIK4Rm0QVWg==
X-Received: by 2002:a17:903:440f:b0:215:58be:3349 with SMTP id d9443c01a7336-21de1969daemr73235925ad.14.1738263127138;
        Thu, 30 Jan 2025 10:52:07 -0800 (PST)
Received: from linuxsimoes.. ([187.120.154.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de4a9cfcdsm15396945ad.20.2025.01.30.10.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:52:06 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: sync: create the `get_mut()` function
Date: Thu, 30 Jan 2025 15:51:38 -0300
Message-Id: <20250130185138.200993-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create a `get_mut()` function that receive a mutable instance of Lock,
and return a mutable reference to data because if the instance is
mutable, the rust compiler guarantee the access control.

Suggested-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 rust/kernel/sync/lock.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index eb80048e0110..3f9d78bcb37c 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -140,6 +140,12 @@ pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinIni
             }),
         })
     }
+
+    /// Get a mutable reference to data
+    pub fn get_mut(&mut self) -> &mut T {
+        // SAFETY: the caller must guarantee that the instance is only used in one place
+        unsafe { &mut *self.data.get() }
+    }
 }
 
 impl<B: Backend> Lock<(), B> {
-- 
2.34.1

