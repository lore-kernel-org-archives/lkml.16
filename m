Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450523AE84
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995737; cv=none; b=XYggIRySlMy6r5kBQMLpu7/dN88qqPWHtO+yKHB6O3l7a+I2IHItqJQ6HZvBWEtcg/ew2ZqXi7HZnHFKB0eyZt06ox2fCmtWm0i29BNC5JRrmzJ1ocXHA3TLyNeeHZAaR6QKN6wtwCsZpldovBbE6F8XKjM23AXZ6Gi9QnK3804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995737; c=relaxed/simple;
	bh=+86FLcDiGFf7KEtoT6DNk8P/MBGTi2i23lSiaGTClFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXPOzUzXWR9MUUD7j0SPRxI24R9nUsdxtC3mSOl5nxqOHrc8OARsz46NGXygPPmaov1XVdil1l4fTwmWgLhS0eBuPIDobd6pALWqaJ4UK45Oq3hkhBKAW0/p2TF6UBhkOw/wjHWb6Ok/jEttz8TLRodScT/7dCFsBETBp0DLwEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WGdFx5St; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WGdFx5St"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so9578580b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995735; x=1748600535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A009lvvwohkyOAIzgl/V0VoElDX7rOXpEDLGhgR7o3M=;
        b=WGdFx5St7daAgn49sg00EhMjlRdUQGtKUegoHVjKawjB87yg1lhznr4z8mary3vF9Q
         8h3DFA5Ig7/H2V2jT5vpiklNd+DOKLUXQybUJ7hqD4ZXG5NC1NRtOWNh+2biDnxh0h/k
         ijAUbyVh4GF5gbnWc/dd0PLcQwmwB/IC+stviLc17eV8dJVhN8S6ArPR44g5+Ksg88i/
         OZPzMbl9sKO6Vf6E8uK6eAKluQZ1lSsUBkz2lae49zPmHlIpO7CRiRcu/YeAf1fKf/C8
         x+VEfwI6AtfjANB46Z5DJC0f6VQeuAl8S7Y43Qfn1uovZ4+MjZ1tgEBllP8GpVOQ7SAd
         XpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995735; x=1748600535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A009lvvwohkyOAIzgl/V0VoElDX7rOXpEDLGhgR7o3M=;
        b=laDbE/eloBLDy2nWxh2Ppk1NVZJ9gJ8lPctG70b7b7kooDLgJW2OFzemdYN/00/6Jv
         G+31aup8URfERsNgG+Rx1KRHb4jpjThy5orr6hnKHAyBeOREdMcuefIJhBJ+gIcYT3uA
         zGuMEnSZIE9wbBamIGlThldsYG1ksPCu26ZfW5zaETktaym0HQgcvTmK+J2LrxRpCY1c
         zWMjHNG7s5bWuxH7hDbQg0YtmH8MLNJ+6UQDKdQ1OQl+01YZF5dHFyYABaN81Q+IrNZw
         CDk7MHyEOeJo4uDtMMtL0mxJXR7xfYOtHShMegY20LelHf0eDEF57Zt465grt9OLnya0
         Q3bA==
X-Forwarded-Encrypted: i=1; AJvYcCW6/q2ZtFFXcjjuYI/zcGlN1plAdv1I9CFroRqIGRjolM8hkfsJOz4USftTkTXyJmg/+6IZ6lTLZe+YVe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLiseU+WxW1oZBDw9PcWMWxoeu7XBUkEp2E4cBv59a2FlCFDLH
	im/Go3jiNpnKS/V1csObMNEOv6ZCbFGzgylxUoYjDIoGfuYovBIJRHLFC1jaQR4akWA=
X-Gm-Gg: ASbGnctE2WaZcmu/OkxBSCzDTZvSwDlFUI4EL5BXCnAZ7rUmWzNSvfsm4P7FV4G7GkT
	2LAlQgkslkWvBvAf9/ZQUw/PhjeEkXzFQaLvjHxbN8fhxFoVNSDjp8DuaGxA+MsuTSqv9ICzfxp
	+6ScOe25WhdFgV64O2JYTGNX9Wvfh6u+VLfwoxus78GW7XfcMSBAL4OTwz27IWsLZtw6/j4A2Pg
	XmlGHKahPC8smFJaDJZcScfR80xbwJBYL/CjGKiWCzTQdZJqqEFjZddifXjvweVA54QTUImhzMW
	FeXHrPelULWBFKtiekE5FW1uxDpCrjY2ATtfjoJZLLN17FkBf3pW
X-Google-Smtp-Source: AGHT+IE9N3X9KDPTPZdG9Av1L22LlFJdp3yaREd+YMGOtZmaxWxoGKAttvYet6X1ORsuI88C9cibGw==
X-Received: by 2002:a05:6a00:2350:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-745ed865535mr3448091b3a.10.1747995734706;
        Fri, 23 May 2025 03:22:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:14 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 09/14] riscv: misaligned: move emulated access uniformity check in a function
Date: Fri, 23 May 2025 12:19:26 +0200
Message-ID: <20250523101932.1594077-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that check for the uniformity of misaligned accesses
performance on all cpus from check_unaligned_access_emulated_all_cpus()
to its own function which will be used for delegation check. No
functional changes intended.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index f1b2af515592..7ecaa8103fe7 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 }
 #endif
 
+static bool all_cpus_unaligned_scalar_access_emulated(void)
+{
+	int cpu;
+
+	for_each_online_cpu(cpu)
+		if (per_cpu(misaligned_access_speed, cpu) !=
+		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+			return false;
+
+	return true;
+}
+
 #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 
 static bool unaligned_ctl __read_mostly;
@@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 
 bool __init check_unaligned_access_emulated_all_cpus(void)
 {
-	int cpu;
-
 	/*
 	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
 	 * accesses emulated since tasks requesting such control can run on any
@@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 */
 	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
-	for_each_online_cpu(cpu)
-		if (per_cpu(misaligned_access_speed, cpu)
-		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
-			return false;
+	if (!all_cpus_unaligned_scalar_access_emulated())
+		return false;
 
 	unaligned_ctl = true;
 	return true;
-- 
2.49.0

