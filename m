Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996DC2451D0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848018; cv=none; b=El6Ehcq4je7hXDgDmE7d+JtTsXjCcTv+OawRe9SQ623sQQAgLFKIOkrwQpR24tqvAhb9juElqPiiqcKBOqU7BLoVMWDy1NDDArz9PO52EeQ5KlNyPwnWQiqb+wshmwg0/t3uO7HUpwWwg2//kH1+E+aMOYD4k8uCRq6HADjwv0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848018; c=relaxed/simple;
	bh=CcAUF/3QIi/x84tx81/0uAfBF9yCMM/rt/arbcDZQTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dkn4/JggKxlPNMw/0SwNkC4MfBG5+dJhPxyh+ATMU8bRELcLP4hiD2kK5txfnLFrTcVFcUn1HhsL+BqXhP/mJNr/q7WyqIW/TcG4HjCdyBknp4pwFzDmZL3IdROiISoDtUIWj36QvRb/q9X25XvOtLrUIFpkZW8ibyPQCar3tpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fjhjveDt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fjhjveDt"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21634338cfdso20248655ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848015; x=1739452815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqkbJ8TV5TbCZyR0Ouzf3HmJ2PyLDsRK/LA88RD7yqE=;
        b=fjhjveDtcVhqwYpja5XZJY4MKrdtyjVzq0Peg6UDw1yE9+8dC7dNariQRJ7AnvFrlm
         mMVGNLdIWNXaRCpCV7UmtCoeSP2hCymJ71Pkh0uRLIeRolyvxfCYMPVzOQs3WP+IAn+r
         RXI39SIA8gjZMUBRRSI9FJDSMU61O4MraAq9kq3rPz31a2l9XEREN9M/mZRrmQgv8Qf0
         dYbkcrZenLOi5jikuSXDNovq8+fqixOh+7E8WNfFCQuh8npoaO/8Dn812jDyLuxKnzRk
         uHDZNqnOlrP8Yz0p3j/Ht5qlV42FppJkw2H0O3JS7bqtboGwMtqyHjZxwwgAY9TzN/vw
         91Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848015; x=1739452815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqkbJ8TV5TbCZyR0Ouzf3HmJ2PyLDsRK/LA88RD7yqE=;
        b=JxPjfg6FC+IZIEWt/JNICCeOPkv7QeEpyld/rcnjNm8sxQvjSYFUr3rgqTxWUAPkhO
         iWFlhqWIvoWTpK1SOOVpjwE+lrzfq4gYXrFcKeJxqed3K+JrVdnj0k9hfFOEKhKbjD/+
         KKdvZVpz38vBwfVOXy+lmO1Yvoi6VsQfqSIrIlwlOh/WQ2/COe8/k2NcSz8BjAb9ervt
         KaL0cUCvUpYF4s8IMEWePz40wDKMd99XN/3IFjSNcVkVCF/Q8yaMPs6hjxSsQjIOWtTp
         iYFi6gW8NfAXyqqc74Lbq+a5lXXrMJUn5bjVmEJ//4+Htc/7hBgllY/PtfoJD6NiIhI4
         UpSA==
X-Forwarded-Encrypted: i=1; AJvYcCUe8MWBFxtVMsYFSKsqOr8/uOL96d6voAow5w0ijHjZ+cVIdt2w6ckUYeB2ENJ0BHsx00QE333K+QVHJrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEjAb8+fIp6F64atjFkOR8+wVj970bKjRd6wbTqOMU3ftt2OhO
	tDzVARiTJVY/nMhdvnYTztdkdB5hIJTyaJ8lLQGh5+25LcQ70qdTdNQAbZRUu2g=
X-Gm-Gg: ASbGncsdbJmAM2dclIOo3c3W3zbrnbWffKNTAIWXiLdJ8KL9EZRYKnwKCdcLlmk05OZ
	KvDXuVPBebXUd6EeLGBhEfJYXGO1QmqUe+7hL4CfcSiiyh7+jQdwtUdkHxuEzz6KbNybqrpVS4k
	tQ3xvjoNMNBu7bmMIDx9ASE/20jYPb8nyVIboVxH4tStjZh3wl+bh8R5E+MhrQqRINHDj6V0dD+
	Sz6NBqkX781AO2QkD0sHFXvSv8sh/XfC4vCP9XVyk2yTSLygYd7nWa3BryCymzmeOce11Z4y+2m
	6vIykrP7B+Ztozxx9Q==
X-Google-Smtp-Source: AGHT+IG5GFPXn73eqa/ah28qsPEtdkabbkJ77MRXgD8idntcYPl7k6bk4bqy9R9tarIhqzZRJyuChA==
X-Received: by 2002:a17:902:db08:b0:21a:87d1:168a with SMTP id d9443c01a7336-21f17efedc1mr127014865ad.41.1738848014663;
        Thu, 06 Feb 2025 05:20:14 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:14 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 3/5] riscv: add fix map index for GHES IRQ
Date: Thu,  6 Feb 2025 21:19:24 +0800
Message-Id: <20250206131926.91289-4-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rui Qi <qirui.001@bytedance.com>

GHES error handling requires fixmap entries for IRQ notifications.
Add fixmap index for it.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/fixmap.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..bca75c0e66a1 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -36,6 +36,9 @@ enum fixed_addresses {
 	FIX_P4D,
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
+#ifdef CONFIG_ACPI_APEI_GHES
+	FIX_APEI_GHES_IRQ,
+#endif
 	FIX_EARLYCON_MEM_BASE,
 
 	__end_of_permanent_fixed_addresses,
-- 
2.20.1

