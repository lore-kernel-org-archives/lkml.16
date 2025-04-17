Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA5233120
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892660; cv=none; b=e2jvxDFaSPaH3x3JkLkPLs+b8tp0uxKqPdswxrd5rHAHYTZPc/+IyFXgyatgyNc5kN31b61X5v0BOxmPFS+jMnJhpI9LVaMQxtNd23r3ib18pQG9IFDLqGv0SzQWM71BdjgDzkQ8YZgEQxeezVGzJDOgO2S4s5AoB27OdBWGNhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892660; c=relaxed/simple;
	bh=I8q3a/r8sIPwl9ULO4heNHCAxh6RA5hJvMvMHg5vqgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/aXp/t0aYfcmyZ8VASaMIeCcBX5oV7hl36w17HQXOK+zPQBsMpV+H+faBAvWAXRk8sxEg5zWtPcqSht0P3shLoIoByGpstfjDNG3eEBIKg9OSCs2YdIk/agKUJAEhZqZk18NclEfIefnqaHuY6iIe/jwNH7XCTnewCSnZDCKHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YW0Pekvc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YW0Pekvc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227cf12df27so5488475ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892658; x=1745497458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=YW0PekvcepDEL3CNBicFspmuytgnbXMVpYVkMaHix670fEShFT+lc/mMY0iZaPCPQ/
         yuULSJXL6H9WfDpXS56vKkOXAN4jcZcLjPzuK9xue0TvhToXId5IztsN0w2bwF76Lwx3
         QeEHZPVkkKogjpcIp4MybW89Vi1RQaz+2xvecAH19RpZWagG4Eq7HSoTomUxYB05Z3Pi
         6rcLlbwTKsOadpEq4J4yLGQYSYWMa/0yWkEd/lqrQu8tyJaLiWXAjgcR+ACWhkQXIDQ8
         p5zBgLCLZJZqGUbZPKgeUjC2pIMq27dMoJ1XtTQf6297sUp5umm3RoEEbl5L0XvNXeqr
         5ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892658; x=1745497458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=b8QQ+9I2xmjFM1igb4L9UErsW/355UEf4l3jeTdJWQTZnMYVURaFiJqr5RusVyjjvl
         Qhl1AEDNhXaOPLaxbD0ihgq4ZvVs5wy810eGC0l/5DfHCCo/9krA411ILlLamBwGvZK7
         5fW0HEhZYrHZTXN2v2KdD4n78/+482v6YrUsGKpQ9dZ0lZNjIcPQZVE/2Nkc9Y/5k54x
         xKwo/Wd2w5Es1LcWMpGJCcEWws9vVwOgeuZMPpwRZsAXverKdkl0/yrhkECqYW6+E8Ci
         Zq/31mMsmoxGlFwOtnohQts+9W8ikJmUQB1PSNWOxuJrsRHl7DazoI8dkZNO42JH/wxl
         /igA==
X-Forwarded-Encrypted: i=1; AJvYcCWbBC0G1aN2Myxup2D4vTFDZVcMJ17njjKUydvZLCRAi37s3/V3/+HmVbeRyq6DML30cFTWmTSqe1CIHJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3XAGDBmf8IBAB0OrSazaAL/4uKoCARauVLjpAN0efLuZRKeWM
	UPS7/yp9gHEmbuQhsOCRbUIm1MqPVJ712sbxkUK+t3CGNEPQpML/pbb7jub3JAQ=
X-Gm-Gg: ASbGnctnVDm7gYjrRQlQqo8RO6ec/ZK/7DGBO/YGPnWY9JyouX5bdfksbAyivGQyh+e
	Dop7yUVdneFbRwbHx7Xww7ntMQHJfs/8kn+3x/L/f2E9FIgy5an/s6r7d4di3G638ru2uYmpQ+l
	O4vZNeOda5SZYzd048gmqcPPeU1j1AAKHTCn+Wy3ehLa/Jg3xtDpF2cvWe/Ut5s27FwXXzAazqE
	pgKEMLbitpV9AhT9UeemMuxJBVzD+B1E6muqEEn3kKsv09zzUbLtoL+Y4dg+lTXqfi5peuHpdbW
	fVLysCUEIwI86MnvUg8BTLtrtVoWGZSVV2DlREKYbA==
X-Google-Smtp-Source: AGHT+IE0XjCz5TtIm1U/KycHsULkn93MfV8ZJ4DCUOeKjh64BtT2X4MD7ZC1hijUVKkaUKvQHFj5ag==
X-Received: by 2002:a17:902:f642:b0:215:9eac:1857 with SMTP id d9443c01a7336-22c4196f564mr40963855ad.5.1744892657640;
        Thu, 17 Apr 2025 05:24:17 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:16 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 02/13] riscv: sbi: add new SBI error mappings
Date: Thu, 17 Apr 2025 14:19:49 +0200
Message-ID: <20250417122337.547969-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
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

