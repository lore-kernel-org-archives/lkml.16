Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5E28D85C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516045; cv=none; b=LAFHrZGZ0ELgOZ0AvQX37l+V7Nqmc+Wf82Lt5ClP5lEJV63bLmSQQj74e4g1GLzqCYg4ftOAN3M4WPysEvs37JWgOahzK8F69Q18A40A8HL5l55iPpstl8Amyah0bonQtp5uN3RuY7hDYJQxmYkU82JyzFqgP7N0YClGhcQWqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516045; c=relaxed/simple;
	bh=I8q3a/r8sIPwl9ULO4heNHCAxh6RA5hJvMvMHg5vqgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipBxxo2BJ451S//MC5xP4NoU3okIZcAwtpz9c7d7wv8CKQoKnEXG2UpvzaZdQOUFpkv6q+QoIGGhv9DCIjSJe8/NvYnh7I5FsS3muRugy2wvbZ1MtTfYioi81IK4H4o8qjlriQD8H/2i/mFA7xkVKkFcQ7za2YcruDedqN/VGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nOO22wwC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nOO22wwC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c33677183so14839875ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516043; x=1746120843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=nOO22wwCEeeCLRdveDX1XJoulJIftSH2Nt3zOLaUXbwhKvcj7lcqH87YEsPTBbZZVa
         DAZ92Bd8Qn0w/IXvr6KM2BLUODk+EeRU+BzFKu3J8g29wrEmXLW4zt8L/U+KtaqYVI1E
         1uVZ4y1fDi5d5ZdC40Rbt7iLF5i1i5LlbLDyP/24BqAHGGZ5l9ZyGFNaST9DcpVhflpv
         AfqL3xSYZe6wrmKxpIZImjsLgR6rYg5TWruM+xJmm7bN64PuspNEKe1mWR2TlFafaKnd
         xN1Xqs7d8jv6TDen0V0LTc3ynMr0xWKDV2TFI0PWiQKG/mraDPeHnKEyRGyF9fkw/HTA
         jPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516043; x=1746120843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=C0xo6JXThToBDMiM0b8aup76iE2fqSSqd+Vehhyiv0C1iHlYgB3G7DeX31NxFy2bN5
         0XS8yv91WLOoAfH98leltoF/+aip9yBTez3jYVuem3XdrI/JAHgLFpkdTcW0Idprlsdi
         kYbxqwtzyF7VbJyltR8h+u88f9MAKfkWxKKgWn/YzXkvrFavNJFpWDZCt+st0+o8aolX
         5v7qKiZ81k/Mp2wD9H2oRFvgyLhWvDZHTKDil/P74uDWYxS6NVpEnSXIIClQbgTnIMlG
         LZL+u/wbqMMhE3zgmhM3/5GBI5WMSf5lImiP4QJOLutVtfWJAhSZSKJ1O0nBp201Ywct
         yYug==
X-Forwarded-Encrypted: i=1; AJvYcCUREiJ+TrAV40sn+WGFTA/ukYIEfsT6a6XjtGRj5sAUjyg6cUSq5S8qNsTtQuxJQOQaWNJkyBDrs80k45M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXo2WQrZbBFkXqsUtb8hd1xCIzrl9k6yqjxmkeMlgCWyh1iHtv
	7IJ/jyuplc54G0H1k1WAfvejDQuDDGsjQw1TqKigjWOYeqnFswucA3ynydWudH8=
X-Gm-Gg: ASbGncuZKRa/MnmTXnW9zHOZgAX7B7SwaNigWIPCnMhgEcGsRNgWicBf2uro7cz4rSK
	cvh7Ir365Bpug+VjEb5pR8eIzGVSv2Ugpb1QTwTGkW5C92HqgSKy41A2OllIS4FOUi5SxFp0iOc
	w+ovM4GzFP8Wn0XuePJI9LYLZpkF660suFCuTahgs2a+YPtrbQmcIFv0ZThf96DiVlPe8yzvXWu
	WDPa3Mwl78Z28TXdZYddOiB7VZ2YM4qocfg7uZ7LKAmzO/hxzx7aJNNabL6AnhjwofnnJQb/MHn
	yYG9xxtbiPGqt+iGNl8Zo+XGhpDoyHgzb4e7gadYMw==
X-Google-Smtp-Source: AGHT+IHzS5PXDP+Qy5Xmwwn0uCCNIK9/92EEG8lEAWpb5PTGOgGH/HAmRDTuUMHUdz3Q/hblJk8Z1w==
X-Received: by 2002:a17:903:234e:b0:223:67ac:8929 with SMTP id d9443c01a7336-22dbd35407bmr5533655ad.0.1745516043323;
        Thu, 24 Apr 2025 10:34:03 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:02 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 03/14] riscv: sbi: add new SBI error mappings
Date: Thu, 24 Apr 2025 19:31:50 +0200
Message-ID: <20250424173204.1948385-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few new errors have been added with SBI V3.0, maps them as close as
possible to errno values.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bb077d0c912f..7ec249fea880 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -536,11 +536,21 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_SUCCESS:
 		return 0;
 	case SBI_ERR_DENIED:
+	case SBI_ERR_DENIED_LOCKED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
 		return -EINVAL;
+	case SBI_ERR_BAD_RANGE:
+		return -ERANGE;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
+	case SBI_ERR_NO_SHMEM:
+		return -ENOMEM;
+	case SBI_ERR_TIMEOUT:
+		return -ETIME;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.49.0

