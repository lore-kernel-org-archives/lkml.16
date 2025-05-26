Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684D16D9BF
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247927; cv=none; b=Jo+s95Nvds8kFh5sGQYjS1LMJzoNDSsIw1ikbu9TksVaG2mMXcpCU34XV/zC24nRa3kehgRyU/Nj99kVyLQiW6ZkpkKB9nMaO8vLCq4CBShrh1kPZG8xKZHkTmjgKbQQ9u98BDf7CxCBKfwAtLdeMxuvobItACvCUO3wptP8x5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247927; c=relaxed/simple;
	bh=A86gVWyxt3fqHTgPnFRNwt6qGwUVCyI9lJ66h0Lsauc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbHWWFaicrUniMnkfj9c9SNglrV3zRNbwfn99YSzEpMJCjrgaoU9SDFkfMoXVV4KXhd/tAntnLlXOL4IiylPav3YrditlPlXotYRpbMqUVnr9xwdMvfoEW2j6VIUnDetQXUaFBqEkqNIC548cUYunc3fAIHc7UaPpHqnlrhEyDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5tTg7rg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5tTg7rg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-443a787bd14so21517885e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748247924; x=1748852724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IjTfQZqn1PiQ/alPx5E/R8fl2JQ4RFmD3TN8UG47HJE=;
        b=O5tTg7rg0ofOsZlUpLS0cWuBuq+ica9VmwxwT+5LmDQ6i6S0hpysDIGF1lx7X23Z2t
         75imo/jiMWLbzb5WSghW0zCIMAG/Af/WcNq+2tMQerjhOthKraM2X05SljLnweWddteZ
         LZRcaimZaZsa64+J5Swe+2e3XGOTgfGNA1fYoPorsicknZCzXPLFUEzELbGuTsidkv8Y
         oc4SaOOKq/vXlIHzG4BU+AKike885DFpPjXmvfb2eofMCc+xNLSY7o4UkWto4YKPODxZ
         SJNMzwDZjOFu/f4uSR1/9xOLhu5ZLXXrpStXtuxrcPHpTODiA+DVnY86U7kNnwZ/oJw0
         rNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247924; x=1748852724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjTfQZqn1PiQ/alPx5E/R8fl2JQ4RFmD3TN8UG47HJE=;
        b=K652ND1MiS5dr2tCfIf84exx1O3Mbt+O6LhY0ZdssJv6JMdwO/mVDcC25QJCeMd79E
         CKEniC7PZGpPWjXIuNqv8x7A3amar7It7jXo6mHNxsOAeilJlbch4GuaxlPjxkjo1km8
         ZMT8baS2TV8/akIT/6AHpD5yqNDTxt6SViYYRuCnsBfrVdo1l6W5rBje6oQO03CI8qax
         Y+VHnRKZzftszt5GiswOqaMyVPMJSkea3hWeF4kg/TYR3MSLcFtwokBIOWW53PIBTyB0
         bPYAoHWJJ+Dorp0tLj5ieie5jdASBadRmVZTXH8ShYfpfTThxWoogUmihse1D4lEVpSY
         Bq0w==
X-Forwarded-Encrypted: i=1; AJvYcCX1OSqUeaRAtd8PdWq9yMa2hNONz4GEXT+tBdvtYWmldJ6fS66z1QXFBCNhDJN/ZeurEuUy9zDTPdzKNtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLPKflnMHfm3gWK98CvLI6+sFIratwKsZQyKEeXxz76P/Fcf4
	+7zG2KVqEO0lX8kcGBlX+DUj+IKSv6mKuSi2l0EgJb2OZGRz6UAND2yL
X-Gm-Gg: ASbGncu9D0/LkbTd6i3g9iMfALqW5BR+TckjTkjrDyTEgWRF2PbCFMF8YJIfCSfjz/A
	KBLRmqOGToUCupTmZNAlDknD0Yqcb57/5Nt2nvXlLMuY7qXi/HjQYkHIkq5nu4yA+BSa+klv8wZ
	lMNLCSwtn5EV45f4mUBIPTTRYRrWcDBIY1bcEAPJfe6vwFdQCpAlW/36A5KFkDlKBrdlfI6lFOU
	6hh8eY6710TTSSM5al2c53fQVK1Onl5MCFPGlWJgmBgSE+zDBdQsF61sKVnNXczxwTk/6eh7CtK
	N1HlFrQM/LVJY3ym3E3/N7I601vTzkVI4xDrdi81++zx8WQmtNL4/EPQ3FOL8LTT+B/cbTWFgR2
	u
X-Google-Smtp-Source: AGHT+IFBl/+xet0BN01vYtH+quwU5fxmlIYd+ljBiL9S3v8VXGWzm9YbKPOJn383AQ8UM2AngthXSw==
X-Received: by 2002:a05:6000:4026:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a4ca123b72mr7178853f8f.4.1748247923507;
        Mon, 26 May 2025 01:25:23 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d74843b2sm3063748f8f.53.2025.05.26.01.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:25:23 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] x86/kerrnel/FPU: clear MP bit of cr0
Date: Mon, 26 May 2025 08:22:44 +0000
Message-ID: <20250526082414.689-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

Clear MP bit when initializing x87 FPU, since what it does
is making WAIT/FWAIT instructions to react to setting of TS flag.
Right now TS bit is cleared so MP should be cleared, as it is not
needed. This should set the bit in defined state.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 arch/x86/kernel/fpu/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 998a08f17e33..2a2b45610b74 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -30,7 +30,7 @@ static void fpu__init_cpu_generic(void)
 		cr4_set_bits(cr4_mask);
 
 	cr0 = read_cr0();
-	cr0 &= ~(X86_CR0_TS|X86_CR0_EM); /* clear TS and EM */
+	cr0 &= ~(X86_CR0_TS|X86_CR0_EM|X86_CR0_MP); /* clear TS, EM and MP*/
 	if (!boot_cpu_has(X86_FEATURE_FPU))
 		cr0 |= X86_CR0_EM;
 	write_cr0(cr0);
-- 
2.49.0

