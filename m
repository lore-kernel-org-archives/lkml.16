Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B01E5205
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433562; cv=none; b=QHSnhbnCzjB4QkXFDx5YkBLjE16yIojtyei8FV/ekOAgJUJQYauhTCUowS3iZcr88vcSeNQoCpDB50cV+UhzxiHixCMaBXxyJFa5RqtluEzZh6He8dZmk3MMk3CAKYSMV88M9EL+zQeTgAyDasDCh6Fc6t9KomQWm8ASYwP6+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433562; c=relaxed/simple;
	bh=92zGFyMpFmCzM0JZzn7mpnCDHeTUImGKBYCvrCI4/c0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ozCfGLYUaI9KisnOfMOmUrCpfx2vc+TINSVPr9HFhZAjWxoV/Rfc6+0p9ux5hLWah6WvHPJG5dnzL5qwpwB2etkgKuWdGOIGhyeywWcqip1NlGUwmYRrN+Kw8Md5/p/t+RIsmiJtwprBRPLsSRe8Do5jwDHKIOQuOLEgcBUJDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jib8BF2m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jib8BF2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743433559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V0VVaNtKIa5CiN0w1u8U5zQJhgOgmovWcu6176XK7Tw=;
	b=Jib8BF2mRNOKGULYgRbOTt11FO+bodoxMOs27eOGl+Jiu4Rt5Z6uvoKdJlmJSfjHTtJB0D
	w4lJnFwTW6e5Dqk5+9KCFm1Kw6wLlis8NZsJOr6Jl3La0a7pNPaNP8LRtNc0XmqL3tNy+u
	Rn8Pzf1CSoqIRMoe2OwgwDpk/AP2V6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-GSyGQMshNt6Ikre9nI5CzA-1; Mon, 31 Mar 2025 11:05:58 -0400
X-MC-Unique: GSyGQMshNt6Ikre9nI5CzA-1
X-Mimecast-MFC-AGG-ID: GSyGQMshNt6Ikre9nI5CzA_1743433557
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so26514905e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743433556; x=1744038356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0VVaNtKIa5CiN0w1u8U5zQJhgOgmovWcu6176XK7Tw=;
        b=n4KSvJKjCAOv6+Y39RCObYlIWYwfzDuM03rpMd6el/ToHpLNeoXR5JololB22YWv6k
         JoDsoo5mkwpKHrAXZSYhRbzC/owhu6mogRbwwlO4qFoYKQ7vfT+rjy+w9toOhnGT9NUB
         VLWlUvXXwN9yBGDdNz7K+HT3leska+Fi6y7bxOmMxHt0SYyv9ssgkNXeA+9uZ/UqF5X7
         wIFoV6JasPEkaUGj8J64NaZc7Z9waghGeI+yV6mzBBDIl+bg990wF8K/Ot7Bv4s6Rg53
         p8zj4f/7KVEF2wyEFRYox+zHbCX5hHdDIka+5z/xV6v9To6B0WJREHz1lLDG7isNCY1P
         vQ0Q==
X-Gm-Message-State: AOJu0YxaRqbskSw7E1KTZnuIiINpH9114Au7oIFu/RKkqXnB6XFUym/T
	Ct8cm3BHhxoOJaoDWCyKjPJjS6J/B0oiheAwdgbNyfvwNwo6w2ACkVK7vOimY0zFpfyLwRXBj6S
	x6/PRgnLaNQRAZN7SvoFoX8HZOqJZfNT5rzzgrQDYY3fXl4PW/dj9JJODpMCogq3LRqfM9QJpo8
	qX10njVsyeTuoBVcb5FSuN8ME+bNtWE+ZvfUIv022WYj3OMw==
X-Gm-Gg: ASbGncvi8+Anb5KWBmGTjZ2MZOvRyER8qmnKhsUObcv1jIsQ33qlkICahH4ha2a9h/W
	mlJOJK3es5MMn0eohHVdWEFJFqQ7aSD86YQwHaSwykx0jkdKdCpf8p03EIlUm5q7IcVw4bRiak7
	VdqqQPi95pUf98Bp/jJw+tRsV+Uaonhjl+BW0E9dAMXngYLOMQ6NUGYJmCdfhrovPqllFb/Hu/Z
	LhnztYW03FuFYGqawyQ7fEtdFqBmuPNR8q5AtZk14d7pQJrZZa5fB6gGi8TUvGHNFNNDMenCDAH
	XVHdvrtWPCj77PO+fA==
X-Received: by 2002:a05:600c:444d:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43db6247c9bmr76745335e9.13.1743433556074;
        Mon, 31 Mar 2025 08:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlnfgHPZeFzfKVU8ncu2wmMLWzUgiJHrI2Pbtb+1URUeMfzpZT/i5njkN772+REGtd1DtAeA==
X-Received: by 2002:a05:600c:444d:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43db6247c9bmr76744615e9.13.1743433555567;
        Mon, 31 Mar 2025 08:05:55 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.105.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc10e1sm123813005e9.12.2025.03.31.08.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:05:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] Documentation: KVM: KVM_GET_SUPPORTED_CPUID now exposes TSC_DEADLINE
Date: Mon, 31 Mar 2025 17:05:50 +0200
Message-ID: <20250331150550.510320-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TSC_DEADLINE is now advertised unconditionally by KVM_GET_SUPPORTED_CPUID,
since commit 9be4ec35d668 ("KVM: x86: Advertise TSC_DEADLINE_TIMER in
KVM_GET_SUPPORTED_CPUID", 2024-12-18).  Adjust the documentation to
reflect the new behavior.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index d90ae23c0a40..732e07b44d48 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9265,9 +9265,10 @@ the local APIC.
 
 The same is true for the ``KVM_FEATURE_PV_UNHALT`` paravirtualized feature.
 
-CPU[EAX=1]:ECX[24] (TSC_DEADLINE) is not reported by ``KVM_GET_SUPPORTED_CPUID``.
-It can be enabled if ``KVM_CAP_TSC_DEADLINE_TIMER`` is present and the kernel
-has enabled in-kernel emulation of the local APIC.
+On older versions of Linux, CPU[EAX=1]:ECX[24] (TSC_DEADLINE) is not reported by
+``KVM_GET_SUPPORTED_CPUID``, but it can be enabled if ``KVM_CAP_TSC_DEADLINE_TIMER``
+is present and the kernel has enabled in-kernel emulation of the local APIC.
+On newer versions, ``KVM_GET_SUPPORTED_CPUID`` does report the bit as available.
 
 CPU topology
 ~~~~~~~~~~~~
-- 
2.49.0

