Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38D51474DA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148404; cv=none; b=r0MGfCBhS/aprxGYf8eiMAhiR917vNba3864cdF4XZ5BR4jfit8hqZbb6SmvEQYnOZPX8ukBOEbvsYv1exJsK7EAJX7hVkByJNRlh69kQnxlwgE/3MClb6+y6KHgOyzmX+tG0paP0DGGfGkPHTPEQ9KRUPkNAr31Ey+keiz8qnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148404; c=relaxed/simple;
	bh=Jqq98g57QRABGkpXrp1TbFP8bp6n/2CUamgLHY/0u64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqS0hmRGMRwq/U8AiDXPgV5JLhEWQRENB60pJCVSOGNdM5OKRfhiYl/nOuNF0EOoxiulLfYqP+wPgdbCNS7kt/PsfJQDMlaD4L90UYYCjyByaOptXbbEqeFR4M952WyYxKddmWKgc28vHfkjlRP7HWE/ng50tmcottgF+USauFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/hHc4Pc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/hHc4Pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Pn26aT5bRv7h7/lzXPUF6z8FjJ6lnc7HN2JWKay0EY=;
	b=F/hHc4Pc02Gqw9efptQHg3/FbaIp6ryRK9ThHZulSy/mSghZJIh80nK7R6sRm29IXly7Wg
	8KRmEahvpSBdS99+2NefRvmZrkGKdLzZGN3RiNjwZGtkIa7PJI20VTDguQ6t5WY3GAqVPn
	lxXbT6xDlg2d3VHHfXCgkjiFWto834c=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-Rs-9airLMSyn31EFa5uSdA-1; Thu, 01 May 2025 21:13:20 -0400
X-MC-Unique: Rs-9airLMSyn31EFa5uSdA-1
X-Mimecast-MFC-AGG-ID: Rs-9airLMSyn31EFa5uSdA_1746148399
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0f807421c9so946551a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148399; x=1746753199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Pn26aT5bRv7h7/lzXPUF6z8FjJ6lnc7HN2JWKay0EY=;
        b=iF6OPYw6FVkthPEm7TATf5aSMMp4dx7HMbL64Goptx8zp9IzACYoDJTxn3cOvUnwDM
         eBEZAL9iTRhsstiVb8hLk9lgm04F9h0VX8uN1aQhOxffbnRcpfH42ZqGaj6KasapZvr8
         Z9AdR5Ur/qkRfDyttF5WvRCi6NDphEVoxJGJWvOgLcFHBDs1xdT0tJzRKBfi+UMTQWxr
         PjeCxx/IakV+qOWzSfH65y/KirHGGnssL2q3c+fwRDPfbxFO+EUEykknER/Adu722JyN
         be1umnZeQOLNU/1j0+Od48RQHmHuS5fz8ZrNqhGzUuGCyzJMrNcUKbIbqNmQ9t+TeL4n
         tgWA==
X-Forwarded-Encrypted: i=1; AJvYcCXS4v7CSKQdZN+EchFmQ+mXIckOPoqSe4PA8EBAF6F/BXijv1y1E+gJSx2+Ok6NQTyWsYeWCc30y3dGZxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RfGfjdFyvRxsPc+Ha5K2tm7wrQZrbkNT16eavtUSvS3S4JpR
	18ryiaDFwNXabN52gZL73qadkmdc4yr27lF61s3XQu+hguu7ZHeqD7iWoEnju3YvdEMb7wgmDUP
	cKz6lnBx2bBLMadB8sI9853rODAHPH6heIGwHUnRhswo3GPyh/gYlu+ANZLNsPw==
X-Gm-Gg: ASbGnctB1YcXrv1gX78jwIkLg6uCCxjaLTp1pr8e4Y2a6Nz5oRxUxOc7TgiyHSnjwZO
	gMZtOVyJyBRFAV49+q0qysbFk+DTY1NIb1HqQ3S9731rNk8dkqJHBH1Sv5QnuuPfqVaMvsdbMLb
	SksomoWBgynsHgojz03CDy4huxC0Etvb/oAKtsHD9gjfep7ulHOfVvsImOvkNq4fYi3UBedTQVc
	1JOinkyOLTABKR/9gMyewaqKWpALkpiJ99zBYDlFzS4X+6uHX3A1GMVJx1K9L4sHe6YCMXmQxj3
	n5U=
X-Received: by 2002:a05:6a20:9f90:b0:1f5:7c6f:6c8a with SMTP id adf61e73a8af0-20ce03eda59mr1482243637.35.1746148399417;
        Thu, 01 May 2025 18:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5/p3+2eDOQ1WtTewaJNj1PvUOiUHyS/8lpdnWABtDfZb0/NmxZiqOwhxRTW3nf4iHj2YNpQ==
X-Received: by 2002:a05:6a20:9f90:b0:1f5:7c6f:6c8a with SMTP id adf61e73a8af0-20ce03eda59mr1482208637.35.1746148399137;
        Thu, 01 May 2025 18:13:19 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa82422ebsm309280a12.10.2025.05.01.18.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:13:18 -0700 (PDT)
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
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v9 6/8] Revert "x86/mm: Remove unused __set_memory_prot()"
Date: Fri,  2 May 2025 09:12:40 +0800
Message-ID: <20250502011246.99238-7-coxu@redhat.com>
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

This reverts commit 693bbf2a50447353c6a47961e6a7240a823ace02 as kdump
LUKS support (CONFIG_CRASH_DM_CRYPT) depends on __set_memory_prot.

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/x86/include/asm/set_memory.h |  1 +
 arch/x86/mm/pat/set_memory.c      | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 8d9f1c9aaa4c..023994fe6115 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -37,6 +37,7 @@ int set_memory_rox(unsigned long addr, int numpages);
  * The caller is required to take care of these.
  */
 
+int __set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);
 int _set_memory_uc(unsigned long addr, int numpages);
 int _set_memory_wc(unsigned long addr, int numpages);
 int _set_memory_wt(unsigned long addr, int numpages);
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index def3d9284254..df7502ad165c 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2148,6 +2148,19 @@ static inline int cpa_clear_pages_array(struct page **pages, int numpages,
 		CPA_PAGES_ARRAY, pages);
 }
 
+/*
+ * __set_memory_prot is an internal helper for callers that have been passed
+ * a pgprot_t value from upper layers and a reservation has already been taken.
+ * If you want to set the pgprot to a specific page protocol, use the
+ * set_memory_xx() functions.
+ */
+int __set_memory_prot(unsigned long addr, int numpages, pgprot_t prot)
+{
+	return change_page_attr_set_clr(&addr, numpages, prot,
+					__pgprot(~pgprot_val(prot)), 0, 0,
+					NULL);
+}
+
 int _set_memory_uc(unsigned long addr, int numpages)
 {
 	/*
-- 
2.49.0

