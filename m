Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59A199254
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916048; cv=none; b=hxuJcLuE/iG83JN4sLH5UX/Tnx5i0hNAJ1GpnJpltNYVnJxkYbck3DX5b4SnG12qB9S+DTelYBxr+CkIpcZF9mg87vSdACWEmTWx63cuMsPguf4v2s93WXvpCduz/eM5awu0rxWE7KDyTIHIPxJVFUT5USTROuyca7Z34yg+4to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916048; c=relaxed/simple;
	bh=h7ENOft2SY09K8gYYNgwcT/3gUzWbpo8/Oe79D/1UmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLUbNrWSxMlVM6N82u8wyzbQRieFs/TlKdrq6kLns2FLqbRLQX0kG3W08kbAK/XTi+HgppZazIcsD0Ctd+enPLrW7iRvo4/06uRHMKgCopOa704Mu7lTBSmKHAGQzjG/NfwCCs6fGyPLEEHqxVXTeIkd6XtYUl1fCefJwAjQILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RLObjaHV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLObjaHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738916044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vuW6U48iDvPQRM7yyRLxHLzZYL+ucqowEQ4SiSdz8=;
	b=RLObjaHVZXgmnlqXvHFSYeXW3fIJpIHP8nfKXaDYHruHG0Hjerp037paB9BIqSyyiJ9/iE
	Mj+wY58WqxkBjJhK/HKQqQKPbYH/EE/Ev7+E4XBL1ayhSAduE8ayvKKYvtC8fgqWDq49UF
	8xQFwtAq2rn8solJZG9EZ9e5NqXxPV8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-yjIuPE0UO8umdut7PvOqxw-1; Fri, 07 Feb 2025 03:14:03 -0500
X-MC-Unique: yjIuPE0UO8umdut7PvOqxw-1
X-Mimecast-MFC-AGG-ID: yjIuPE0UO8umdut7PvOqxw
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f49f0bd8fso16401835ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916042; x=1739520842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+vuW6U48iDvPQRM7yyRLxHLzZYL+ucqowEQ4SiSdz8=;
        b=xDc73f7NePIXQnaVGPxxCKq4xGn5+RCTCF/jDoALliRgwlJ5OTSOXGnGXDyfsiiDZ0
         150dPzq9yaTZLb1DKXoyVihxbriPz/ATaA+u9i8Eb9EHCDdDIbjP0fd597tED/oceS+r
         1qAbYaknJmk0jlFD8pLhSnZSExrPwmD9XsFi+soymSLzm8fnbJ64vWR+e9O+ZyjI1Mii
         38nfYhQE/TSfVO3luGkAFczWBgieMLqcj8Wc+MZEiO9iuEiirzzFfbcvoKeIOD5yy5/e
         YtF0VbDD6vYQIqYFlZtr7BvPlz+uqSxlUmlDp6DbdvaVy+wUbK7ksKJdUGGTPu/ZwzA+
         uS4w==
X-Forwarded-Encrypted: i=1; AJvYcCXilIH2t0YrEHNG1b1cCqddfeZT9ZXORlfa7+l8emep4TU0tSiWXX6+D9KxRNoJL0p+wS1B3zTduHmTLc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZLyY5QwAeVLcT+Ogxl8geCCwEJSQmV7UphzORu5OE2L88e+X
	OB1//q9ASwTyCVIMtFvjdN/JQpvK8lhbK4W5TA/T187s7qnWmIos81rYlhV4HQztIrPvyiBcKNP
	WpNGVIcNx4amflAt5nwcxSHmzZ8rx7plhShoW/ti1fHgTI7E6i57Zqs2TrEKI7g==
X-Gm-Gg: ASbGncuRw+38f08IeHwNqymr6WxZBDcWQESEjiE7ihZdwXTJlFFnRpjnCl5op2/7F/A
	CYLK7VLAAOj+oDYDcFP54khuob6YDnbFBHAwMlerRu0rlzCt2w3BS32ov5kOnkZqr7/iUlU1Nud
	sx1Zw6DA0cvYEqrOKAtwHSrS/ejUHh6dZV6kRpBbv8UHSXJoQdDJFdmicnZyq5OUXGP2W7PIzsX
	uGk5tEr41vHvHaTtmu1cHm61WMC94P/uKgJ9zG6rWcRNt9qGYdjBUSsdQDzHn1vXVtFeiUo
X-Received: by 2002:a17:903:2309:b0:215:a04a:89d5 with SMTP id d9443c01a7336-21f4e1cf038mr40201335ad.2.1738916042446;
        Fri, 07 Feb 2025 00:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgk9M0daWYVa2Ek7u8oS/CFLYtRBIoNw24mfM3TS73uCeiCwSamNzyIev1riImUKcHHz726g==
X-Received: by 2002:a17:903:2309:b0:215:a04a:89d5 with SMTP id d9443c01a7336-21f4e1cf038mr40201145ad.2.1738916042195;
        Fri, 07 Feb 2025 00:14:02 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8bdsm24540065ad.151.2025.02.07.00.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:14:01 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v8 7/7] x86/crash: make the page that stores the dm crypt keys inaccessible
Date: Fri,  7 Feb 2025 16:13:58 +0800
Message-ID: <20250207081358.129794-1-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
References: <20250207080818.129165-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an addition layer of protection for the saved copy of dm
crypt key. Trying to access the saved copy will cause page fault.

Suggested-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/x86/kernel/machine_kexec_64.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index a68f5a0a9f37..f615fcb6d35d 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -598,13 +598,35 @@ static void kexec_mark_crashkres(bool protect)
 	kexec_mark_range(control, crashk_res.end, protect);
 }
 
+/* make the memory storing dm crypt keys in/accessible */
+static void kexec_mark_dm_crypt_keys(bool protect)
+{
+	unsigned long start_paddr, end_paddr;
+	unsigned int nr_pages;
+
+	if (kexec_crash_image->dm_crypt_keys_addr) {
+		start_paddr = kexec_crash_image->dm_crypt_keys_addr;
+		end_paddr = start_paddr + kexec_crash_image->dm_crypt_keys_sz - 1;
+		nr_pages = (PAGE_ALIGN(end_paddr) - PAGE_ALIGN_DOWN(start_paddr))/PAGE_SIZE;
+		if (protect)
+			set_memory_np((unsigned long)phys_to_virt(start_paddr), nr_pages);
+		else
+			__set_memory_prot(
+				(unsigned long)phys_to_virt(start_paddr),
+				nr_pages,
+				__pgprot(_PAGE_PRESENT | _PAGE_NX | _PAGE_RW));
+	}
+}
+
 void arch_kexec_protect_crashkres(void)
 {
 	kexec_mark_crashkres(true);
+	kexec_mark_dm_crypt_keys(true);
 }
 
 void arch_kexec_unprotect_crashkres(void)
 {
+	kexec_mark_dm_crypt_keys(false);
 	kexec_mark_crashkres(false);
 }
 #endif
-- 
2.48.1

