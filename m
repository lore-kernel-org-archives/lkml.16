Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F71FBCB2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409822; cv=none; b=LuIWwHE2Ons1yYMPGbRNLM0IERUuDOtAk5ZX4wiC8z3C3SUHpa2IcTJIr+SdeHJO+zf+w3pKP9r08TUCkcG75DtgVBd4aOawXV8sQbv7iSr93kXSOJdD2/VtDdc3ITYfFcvM3MKUxARtiQpNjfT4wGRPJ93dLsxEca1PmuGI/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409822; c=relaxed/simple;
	bh=OMnGfda8KClSL9GGHmUONx3gMKPVl27s+0O8Uijwykg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOzGONAflsc/6Fz0sjBn++GcSVC5TFvs2z67UcRZvvIx8Iys86lqZudvsZTUQIWBWbjuE0ZflgOXuyNIG68qnhy6DwrFAdk9qiyHuYM715h6WXO78GxIXRg+kuGIS+xpT+U9mY4vn+IvFW362IAPCE/GdlWRVSoGlvWY/lfd7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=fTk616/k; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fTk616/k"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3da831c17faso13072915ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1748409820; x=1749014620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wenxtdrBK9XwmMmiCLqhXCe+oFW2gyHDArCJgDTJFDY=;
        b=fTk616/k0SSUryAJYv3t9JEW/72IgkgqzQLEWE4QFoPdMGeOAuI/Rpa8A+zGJ8ZlI1
         gX3l3gOFCCw46Be2GFUzz38tqRiYYm7LqAs6v2PR29DUFSbDb/z6TrSpy16REsuR/Xyw
         s9m9VNANFayKQ+d0syTWVxkT9dyd3vLegF0PEpikXOnecAJAVuRDSB8/c97uPWRX+RBb
         4bRdIVY2x5LlSGvJyFQw/7EyOTBMp0v+hrGHu2pF/2sl5nN0CZIl081DCem7Ri1ob+yU
         jPyLyuP6jJWkErDN3Nhf3LvHQRFukFirM6sxPMKKQziuKsk2SCLU+wxTFId3D6OM6F99
         1AbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748409820; x=1749014620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wenxtdrBK9XwmMmiCLqhXCe+oFW2gyHDArCJgDTJFDY=;
        b=CkRRY4gfxg1Mt68h+Avf4IWiT5Sf7q+Iz48h9oTebnMvdjSnimYxQL0GHbSr0HJV3O
         M0YT+GMnz1swuoxQWX1KbwHczIePqFpAaKGFOEqVOsPIfhAEw4wXHjz5sujlY6Kkyv5i
         bMFukKR8wz1DULakMxAD5Ibqx/I/vpHWvqGQjOohHgH6/BwxJg+kEIuZzRb48NQEPkfR
         EizDHE0U7ffGjeFQj3sZdzwU9GqbeN2by550bkr8Ip7jO2MClXc9r6kusPCwIyxHVA8i
         otIz7TzePJ9UIjE3long2BZ3sLppcMMDrF7ZWj1KfKq2KbcgO5FxN6kYjSvIquouDwrW
         TC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk4FKUixZ8R0a6fbu7OpFPXQy+dI9P/TJDXEIvQdVWQkCzWFSYqgzcxOqrTvpqpcpAEWg0lHwns9D0hP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTf49ezatRzSMdmPyqpPiVn7uUmXm2xmVjonTl5X2lTXi+Ktdf
	N9rPZWZ2HYxyVQLf1XZhRM1e/ANo5bBG8HaIfXqr8PdaChraxuMDzX7T4TqYKqXP5Wk=
X-Gm-Gg: ASbGnctPMdLtt+2aV0UKTu1PfYAMxTlwRroiZOAXItgaXz9HdtRQxEIfpxOj4KSxOnu
	cqxe3j/tNMiJsWBENglrc43xVf4AzSg3PR7mSnMa7tq8zeist57YkjMJ39sEHa2zGgQhBbABL01
	5lunUtQm778MnleIclVVpJFi3djKIHlZFt/Y8Qcgxh59UqySTdZg/m4mVbP7rPwM+S2lRyIWvVF
	gwgLwIScU9T7Sq6SHz2MeyX4rOhLLBYzeQqF5KhrNGVkWRPTnTvgJdRJ8izTghghtRHFnANLJJq
	jEJhwh03mu1cxmcANYMTegnZ06LRdl6eLaIntmAUl0zE9IDp1LUHRXymf5TjjyxnjQC84uVuvNF
	bskwjcvU=
X-Google-Smtp-Source: AGHT+IEg/+dDIFunsDgQZav8rM0OV0IRgirnDBMEGzWGxkPG5lDOpWmkE4qjIJg31NM/Oy281AN8XA==
X-Received: by 2002:a05:6e02:2482:b0:3d3:db70:b585 with SMTP id e9e14a558f8ab-3dc9b72443emr180381485ab.21.1748409819889;
        Tue, 27 May 2025 22:23:39 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd5c2e27sm73730173.135.2025.05.27.22.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:23:39 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3] kselftest: x86: Improve MOV SS test result message
Date: Tue, 27 May 2025 23:21:05 -0600
Message-ID: <20250528052105.2657582-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make test result message more descriptive and grammatically correct.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
No changes in v3. I'm resending this patch to adjust patch format
suggestions made by Shuah.

 tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index f22cb6b382f9..d80033c0d7eb 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -269,6 +269,6 @@ int main()
 			);
 	}
 
-	printf("[OK]\tI aten't dead\n");
+	printf("[OK]\tkernel handled MOV SS without crashing test\n");
 	return 0;
 }
-- 
2.49.0

