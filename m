Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D311E570B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987285; cv=none; b=e1S3DiE9fa94QkwEmb3Nq9Et9b+/oXtfxP0vMD4I6BhHAOtb9FXYWKtaXIMiXdj31kSeanMrMqAw1RfIELDGEUdBuEOJUGlTNK0lCybmeY0yeikwyq4RkXyUty8emLgP2FEa+53Et8joQg0Av7hff0mRzgyWADvz24ymrqxxhQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987285; c=relaxed/simple;
	bh=wSkPm5yBeW+wrBDAjRTe5/DIUE2FvkpgHBkUEbYzM04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t09/YNAEI99OIJh2IRflYIG2NCCb9fJgqhVjIB10f6jpp7ZCX1OzWCr4OnaAhO21E0HfC4ltx8dfuMTUpbHPtLqYsCD5ftstOX9l3UNt+AkHiyQKwavw0dfKsrqylNcNR66zQi5jRkFpq5Iq87M/BCdxzw+sx9jTxFdypMTdYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQMp708r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQMp708r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227d6b530d8so75754785ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987283; x=1746592083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ZhA8POgOa1pDP88Eiedzl7Qg41tN4Rus19EAaNMog=;
        b=SQMp708rvwPa3n4JpHgRPPe3RYFVYYE3ysUUuHewqVDyo4Y3HgNf2ws/mTQk3Tcf84
         woRLVnJ7HCfjn3ltKCb+Xyk/a2LJR/tVaExSFLsiYD+oMmJFQIXJnjAcWYZ4GIjrcVTR
         5QSY17zBiDjI5obWhOyEOwt7jRLrqVvVZvZhN7kKEnvmmqwPIGjKr0lQviQXnTwtpJ6i
         c+kEfcfg7PZcAyQAXkvFp9c+a6oX21ID2kjFm/TgwGJNKdurTj8ABp3RKRajIrN/7XfD
         aQMv5+WeatsLZkn5CkGaKpC/xGIcN8slcDyRZ+pBZzuhiqT3X+w9Y94c5NPfBYueggG5
         XWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987283; x=1746592083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ZhA8POgOa1pDP88Eiedzl7Qg41tN4Rus19EAaNMog=;
        b=lJH8RF2jUPJM7sMG+ktB8bxiDUepXL30ndnS3r3MXnlSFPHNq81yQWOmNtTZBKUTNe
         rXvVAVvc2f9/j5U6GrNktAyDyUEU9fIUuqnPVecZSgV0fmMQdTI7BzNiOTM8Zl9jsGNj
         jIBEoSABDiTvDwsTBQ8b3TBNhd0fwi1TUma6/zKeKvtuD1uX/BqiLooUS9R1fLM0m5TL
         1j7igzQjZB95hwMuM9a4Ia1iAcDMQAGKPv2hW8s1og4KWebcGAseevQ45KURSBAJS5mW
         qga0f1xECLlsxwcvQ+/q48I/bnd0qwOQY6gHax3r6zAfwZN+B+GVGj/wO1PZU0wvEM6y
         OXVA==
X-Forwarded-Encrypted: i=1; AJvYcCVQKHbMWSUnjMA1B4KCATqwj5+aFq6HdpzZo4Di31Kz3iMjgdjSLllZfUIlysURN/jNsiA/hTctxCm4vUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZBlKT3N54nbvcDoXpBS3i/hjCXPam6MYD2OdDmGdpF42dt4I
	gkp+WBVsXMvcAhV0LsvXP3ARL1ye9dnUYTX2jKLL52yXGD+UXorC
X-Gm-Gg: ASbGncvNZLb8sQOcUbJi7tehJk65m3dLveakOlnvRN68EHFogLp4Yi+nUXY0JKNIaiI
	FtCIU0n2AbAYP/JtmDOb9R8t/zxOwTdc8KSg68LAYxCjkp/pmCyr/iobT8VPilqW5pjYkkTUr15
	c+31oWU+j0lYz4wsOGHnJaR7+BWua0DsovuE1V2EWxuzCDCPAIjVt6JsGwrRhTK1ABjZxsKIcy2
	hupMwXxzlI8x/n+qGq1AWNEW0LW5tL0mKWnRNIUcHwmU2pGfjCJ4vWWXImIQm3sfSLe/8SghtwV
	yHCZNZToJSQPB4Uqf0YiSYgYZdl5aQMZjvLtM8RaqY/r6WZKaY28QaUS+MljdIF5zdx7wsr5N6S
	RmQrKIDaqHocT263wYAFLMw==
X-Google-Smtp-Source: AGHT+IHLnJV1jRxDa8YUV/nZ0brQ2Gx6YopooEOeWXq2tdOwSnZ7t3052ntTYHbm7mId/W8e0+yiSA==
X-Received: by 2002:a17:902:d58b:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22df35caa68mr29021325ad.48.1745987282966;
        Tue, 29 Apr 2025 21:28:02 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51062casm111526675ad.208.2025.04.29.21.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:28:02 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 33EA2E94826; Wed, 30 Apr 2025 13:28:00 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 10/12] um: change machine name for uname output
Date: Wed, 30 Apr 2025 13:27:16 +0900
Message-ID: <64d60cf0ac06f49a4ff7f79df4c60e364d11464f.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit tries to display MMU/!MMU mode from the output of uname(2)
so that users can distinguish which mode of UML is running right now.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 arch/um/Makefile        | 6 ++++++
 arch/um/os-Linux/util.c | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index fcf4bb915a31..722a3bd03f24 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -155,6 +155,12 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE) $(CC_FLAGS_
 CLEAN_FILES += linux x.i gmon.out
 MRPROPER_FILES += $(HOST_DIR)/include/generated
 
+ifeq ($(CONFIG_MMU),y)
+UTS_MACHINE := "um"
+else
+UTS_MACHINE := "um\(nommu\)"
+endif
+
 archclean:
 	@find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
 		-o -name '*.gcov' \) -type f -print | xargs rm -f
diff --git a/arch/um/os-Linux/util.c b/arch/um/os-Linux/util.c
index 4193e04d7e4a..20421e9f0f77 100644
--- a/arch/um/os-Linux/util.c
+++ b/arch/um/os-Linux/util.c
@@ -65,7 +65,8 @@ void setup_machinename(char *machine_out)
 	}
 # endif
 #endif
-	strcpy(machine_out, host.machine);
+	strcat(machine_out, "/");
+	strcat(machine_out, host.machine);
 }
 
 void setup_hostinfo(char *buf, int len)
-- 
2.43.0

