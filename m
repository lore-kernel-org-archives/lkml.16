Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F38268FDD
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421280; cv=none; b=kahm2591dYbnCDg4Ero5Vccs1376LxqKvw/KePbId2Sf8tQG9ME2d7gLVbfn5N9Rk9wZkYJQ5qT8Yn9VbDe+pHiwMlsBFKLOtKePuXrsJaQ15/PayX9DeTlHMpvDQbNF5/zKqnygqWli+lS223jziQ6Ea/63Amm25Cr2p5dRZwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421280; c=relaxed/simple;
	bh=WuwyUAHqnp7HPv0q9YY9o8U6CvTjARcWIkJ++XQwOv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNcHrRn1hqnWarPkaNI7CR+BktjJV6aCVfFJUfwktvS7Kotn5/dansJbzj72di69KxKSvK2Yayw4htr8Szwc1xbywVUxsLwfJSkgK4C2Gu+CH+mwgr/chF4O4j+k6NB6eXDiEqee4Go7+f3iCEgZ/AlLc1E+QGX7Qlv1Fl/j7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fo+EJ2TB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fo+EJ2TB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748421277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U4i+JqyZ/XZ2/PTdI6CeFGM3MJ6lxIFb7tc48utqptU=;
	b=fo+EJ2TBzw72F8UTyIa18pQsA2MbPXODZHXL2xMuLFF1BDa/qStO10NDSElNqOqLYabfJj
	J+sc1koyYarO6cK17mlKvCkqaRRfpF/hCR1rL8LKj9E9RD6cT4vVqcQaX19IwRqnNr7G40
	2S4/fi+ZR3wQhx6b1uQRC8h8NwHMA2A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-C0hxtqIeM5GTv-0o0Knggg-1; Wed, 28 May 2025 04:34:35 -0400
X-MC-Unique: C0hxtqIeM5GTv-0o0Knggg-1
X-Mimecast-MFC-AGG-ID: C0hxtqIeM5GTv-0o0Knggg_1748421274
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-601a4d2913fso4704230a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748421273; x=1749026073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4i+JqyZ/XZ2/PTdI6CeFGM3MJ6lxIFb7tc48utqptU=;
        b=qm0tYQnTcagGQE4eedMNk8jhQKXNOMK0kgUXTU0NySjOpEqSZZ0x42uyWqT7bKPJAF
         duCoe84AzLMdRUjxtVDT5UrAH4rbphvx/0lyD7txiluQYtp+qryy8bB2j5j+OgesOzAf
         eM7ReTjrIHY8PG2I4a4cc8AZuaeSdSI5qY5ZKval4bfZc5HPMM9HSLG9+9VFtM/7saii
         zaQ+J6bYsoarXQT8q39259WHeQJggTBAFnGp/KiUJeorDDksU/diCccisuIgAbM6JgUP
         qnL/MuXeqzC7X1omk3ZSkzTOfrFYfp9AMueebC+hzLd4THhh8usYVLs1M/WJeADVaXUc
         VE6w==
X-Gm-Message-State: AOJu0YwLXwU/2rhPFcAeYgbPrhO99CXT4YVYeFKOL9LqEbIspTucht8D
	r1qICNudWcuAS9mpS9qQrjuPWhSuLf0UfNpnmlhxf8hcptXiOQCXqrJnGfAYBYimE0RPTKAxWRP
	WTXED2HkAtNVxx0HRry2hJ/shULyhOjiXV1CrqFYD4CDxfv7CWvaz4p9VlCk7lqEA+xFk87fcmf
	FW/vWPuXrP9eEx9g3Au1It84WsXbXeBPJ6H+uxTvbkwmwM8cctJA==
X-Gm-Gg: ASbGnctn86wJmkNCcnOgEW0y601bta0r+2b3je/u2fmQmMrWKcmwe8JrAm0osgoYpIy
	CBHnQsb87L8cLxWVeDgFjebDZnNv0VcapvU4Vi7rjZKRGkRr6kbiBJ/OX4eouIQWd29VyK1wLIR
	F9c1HO9oOvmxB470YL9HTp4QYSmwaSE+ktol50wCNqngwmhlqribPjDvZcgFyuHFI0LkPjp03OD
	KqHHo5oi4QjEdiImgoN+B9d7a08Ua7V/+cauSRlVVxxJtOT0dl+QI+O3ZSylaPND5MHLgxD8fly
	RH4f+p0/4f9rmA==
X-Received: by 2002:a17:907:944c:b0:ad8:9988:44d2 with SMTP id a640c23a62f3a-ad899884717mr339412866b.20.1748421273252;
        Wed, 28 May 2025 01:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4e2bHjQQ64E6JdYrHpC7X4lCExyEp/3G8BfrYRE/V4IpI0prysNOJc41oeaxS+qaPAGw0SA==
X-Received: by 2002:a17:907:944c:b0:ad8:9988:44d2 with SMTP id a640c23a62f3a-ad899884717mr339410266b.20.1748421272788;
        Wed, 28 May 2025 01:34:32 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19acd7esm70875766b.11.2025.05.28.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:34:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org,
	ojeda@kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] rust: add helper for mutex_trylock
Date: Wed, 28 May 2025 10:34:30 +0200
Message-ID: <20250528083431.1875345-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit c5b6ababd21a ("locking/mutex: implement mutex_trylock_nested",
currently in the KVM tree) mutex_trylock() will be a macro when lockdep is
enabled.  Rust therefore needs the corresponding helper.  Just add it and
the rust/bindings/bindings_helpers_generated.rs Makefile rules will do
their thing.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        Ok to apply to the KVM tree?

 rust/helpers/mutex.c                               |   5 +++++
 1 files changed, 5 insertions(+)

diff a/rust/helpers/mutex.c b/rust/helpers/mutex.c
index 06575553eda5,06575553eda5..9ab29104bee1
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -7,6 +7,11 @@ void rust_helper_mutex_lock(struct mute
 	mutex_lock(lock);
 }
 
+int rust_helper_mutex_trylock(struct mutex *lock)
+{
+	return mutex_trylock(lock);
+}
+
 void rust_helper___mutex_init(struct mutex *mutex, const char *name,
 			      struct lock_class_key *key)
 {

