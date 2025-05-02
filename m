Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1C15575C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148415; cv=none; b=vGdWVdQUDZmqp9EY8DMPaX8RAZm7sS75meZsCA7w7k3GA38Hems0UCXAvQjsh9TET/o7tnVC4JaDAEdLh8MkWTKZTmipPrqutEEDdRqlzRxxyuN9PPThh1Oe+bnD/LJx5wls3dchoDzeER6IY2ITioWw0uSQfjp9MVyRZQlQIGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148415; c=relaxed/simple;
	bh=CrhcQhwg624hK8uwQNcRZuxl/btjRZnhBZDQK3Zqb2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5LjqZ1bBz6fcpsqnKIHrQ2ZjGYWINJN137GzFzNKGYcqEFgq3G48P4Q2ooQGKvyJUiDqvMC040RAYXE8Y17aSuXnOHT+pDSdPWO+DP4Cu/sPeHIkusm7qf4QE34FRKvgdY+wIjyuhvoZA40sd9aRfinLKASTlmEDF3+wt2olfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U9Y+dJIL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U9Y+dJIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fPDWAlkRpZFD9IGtL8ncnibi+0RTZDXokax1ZHMC4M=;
	b=U9Y+dJILhyResWUPLqGipx6zVMmzA98QBf+iTcrrZlkeNVFOKC1QXndS/lV3ctJzIWtJn5
	iR3kQwJlvtgbp5PjRNh2465d2prnpzIOKEb8dBRzszqvqDaDS1eU/dfUCltGJWqlCBufPg
	QYaZsLxtEpVSZEbqcltiYLRKodhikgM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-5NKHAGurNiaANyb-f93lrw-1; Thu, 01 May 2025 21:13:29 -0400
X-MC-Unique: 5NKHAGurNiaANyb-f93lrw-1
X-Mimecast-MFC-AGG-ID: 5NKHAGurNiaANyb-f93lrw_1746148407
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225505d1ca5so14262125ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148407; x=1746753207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fPDWAlkRpZFD9IGtL8ncnibi+0RTZDXokax1ZHMC4M=;
        b=EN3Gg7KYmV7J+m5MK1UQuwcEKLLn4RxDT755+KzZBJNjFoXXkVZhWpLH9dU38m/q+L
         g3Rcxl/nDZW1N7L1qXE58Lkc8sP7bFjpbXTxmUl3GvDVK0VKQESHcMyJd6v85aGmnjJ8
         9RZGcxX9jiub7SqI0mHtuIwVRJNH4FFb79r/wahW7nFP8tLq80ib4LYOE5F8zOS4uE2n
         /S18cNvD4xonczZPQh9upvRQNDRPCmZPdYqlmsCEnT04nXaZjpy5yV/c78W0gUY5PL44
         3UXemekWorU7fEL0g0qoPJikhJKycdKDL/E/LYsM++VOsWNqbo99aA1a1k3sm4wi2L2s
         RWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdFedCkI/nrupsOzNfIXFtX5cU9sE7jspfcRfdfkA6r3Q4rEmVU9XXdx/f4h4CdB5byqnBoNMh6yZcWLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGuOU9rbuCKPhld9/0XXBTmHUS56M+XdRLUsbWfXEYhYC/P5eX
	9ldppAIfkAAdyTdsY7DVXkMy4/RsKWj5BS9UuBM1q/mMXPHrQ9YRN1qWniK0esoM1e2S5jdlDvr
	qIzC2ktlwuglUvQHafn496vE8rGdfxUUOFY1+lo+Vi3bt8rbCO/Tq7ejbcrzG6A==
X-Gm-Gg: ASbGncs5hbh6bnSYlQk3WgGucOe50LMvZidSDSSHIWKKXp2xefDiCLjs1lGZgJ3ieX3
	iBBmna0X9oIQJ41gBb5vlnEsOUd2/wOC1/cDSsMhi2HHVp8rmKLnHoCKe1Ms0ugIZoF7vDTnnwG
	H//vwg+OjYIPQjjUJBbC6dZbIbwqlYjsxV1g8duHEd0AMDoIk9LzAzhH0xCEBEA+xRmW/QpjEsU
	GHgCoDAMdiHoxhxuKyqr3Ctf3Q5GZooNC6o4VKS2+aH9IhXsDk6XrGMv1sluXnbld/0dh4te4vo
	AN8=
X-Received: by 2002:a17:903:1aa3:b0:224:76f:9e4a with SMTP id d9443c01a7336-22e102d01ebmr17984495ad.14.1746148407413;
        Thu, 01 May 2025 18:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvqxKF7gk97Lr8Vh32QR8SR5Scmsb6rcwbgFjb7HlkZaRVa8Vb6z2gCQMwaiziz7TBRlXfgw==
X-Received: by 2002:a17:903:1aa3:b0:224:76f:9e4a with SMTP id d9443c01a7336-22e102d01ebmr17984105ad.14.1746148407121;
        Thu, 01 May 2025 18:13:27 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a476267e0sm1603716a91.39.2025.05.01.18.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:13:26 -0700 (PDT)
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
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v9 8/8] x86/crash: make the page that stores the dm crypt keys inaccessible
Date: Fri,  2 May 2025 09:12:42 +0800
Message-ID: <20250502011246.99238-9-coxu@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502011246.99238-1-coxu@redhat.com>
References: <20250502011246.99238-1-coxu@redhat.com>
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
Acked-by: Baoquan He <bhe@redhat.com>
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
2.49.0

