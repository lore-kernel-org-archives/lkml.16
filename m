Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCB5223706;
	Mon,  7 Apr 2025 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049388; cv=none; b=H5yxbKa5j+5zDGKl9klmrIfpoj7L9T9uzDD41x896I8+OfmPgDLGdncTCY/RlkkIy8EvgN2/SMe6la7JBVZ4HTscQOParXkxrbXw2JkAi7sEHUUqkC9PKmJxRYP+kcGLucP4JgGi/4riNnITH1Az4qgRb8w9Ug+6pfQG/Jv9Zi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049388; c=relaxed/simple;
	bh=RvuKAktVa96t1lOsp3K5Pu+p7/BjZYrqr/zoz3phUFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DS2RnMqEOZCAmt2leMHfSHNg9rtLT1smgNrawkZkljt8kf+JxoN1G4kFRWM/zmg/Q6YJu6z4ajOiohuvzyjyb0jzvMXXMgRoPeCfb0L8UeyJsxqm4175nPgpI8btCDYX6i0hlcSs9diJvirWaMp5toDn/kesQ8lebd3mTV0SkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb3t/RBd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb3t/RBd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso45801785ad.1;
        Mon, 07 Apr 2025 11:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049386; x=1744654186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyM5SZww3BsIxLq5imP6WPb97ECb0VvvV7XlSlZ6uaA=;
        b=Nb3t/RBdiz5r1mOI1FxJLhd/VioJyWw1m/BtOkXK8nS5djPq+1RXllFagn3tGiPIZ3
         OhLqD/xA5NPkiIoSf1Nft+/a8p1qv3qrfK66kRqwcwEcCMiB2I/HVyg1f3LJmOrNRRqS
         RLV8BJSXh9zF5IPU8tVJ4aZDwb+VY+dyEHDwZJPAo7qBzZaSuz9N6BkVVIvclTa7c/ll
         6bMQYrfGtvvnleTr7+5u8fLZ2J4Q2KUsfSQGH7zCYtq3tZ2lTnzZOXDqtNmZv3XouqYM
         X4UTDhob8vxDBXlTKDtM20WOz7yA2XHre6YYifCG2LO7IZ/n17K0A2nN0MynPTpok+7g
         GIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049386; x=1744654186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyM5SZww3BsIxLq5imP6WPb97ECb0VvvV7XlSlZ6uaA=;
        b=rx0UdbUuKY/PINsYEHlNvjA9xGY2rKp9xHWj/6CmLl7DlYcnDXckGbI+gJf5t1S1f/
         vHpL9kMZ9Iatw2w0b0z3jbbMK9U5zeNdJlwNf6dewOBTyD4dEXjKYV3ki5gYdHc/YFtY
         Re6kjJRVAvzFJW9rSCvJRUFWGD/QkdwBYZyYEohKnGwg984dcclBPEo/HeMg+AhvjlFQ
         3j+DwfzJOGZldNMbTGIfN6pmXCJ4Q9ZlJmuMGoQSRFJDYcZoTEHnIh2B9sKhT4aT5BRP
         NBXEvTLVoHmbcK58XgDGrroVeDTa7kGlOkPwR3JkYmriC8mlH1e1ffmuGU+m7OzE76Ca
         HnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA1yTnzShX1B3nw0xAudaZTMAC3MF+mNEQp2JAe0a515tfI8kI8MF8CKnv0NM2pYK7c9XfF5puRk6FBsou@vger.kernel.org, AJvYcCWiQUMO9Rqq1GmfaxriJM4W82tzAAyP2pYJdreWhD/DVMFhpvkUsYZlvmsnZHx7FbVh3pLB/4NfzT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZGZn5XQTdLHrc+Abqo3AyRs1LctXLXcC2mIxR3ix2+ckzh4I
	rFjViYvnfTDl2bcz30Kkmva2rw2pBwm1xymHY2TRjoRxyDrNFoXL
X-Gm-Gg: ASbGncuBdX1meJ8cXTcBrHCKnyQ/MHPmIvJAw5bi3pyA5CY/SpddzfX9PGdl0kS305W
	62EgPclP/wO4UT1sY6VfeDCsGT0UizkcQXAQQmu1oVi14tYZ8egnu69rgi+Vk9MfC9wOhnP8Ysi
	C4bEc35Lr51H9xctiTIpYQo9ziwGFvjpA4piw08Phd3yqLBz7TH/RP2HL/G0kGKw8HpDPnnh3Uk
	Gap2TyFAZ7HDNbp0AFOXaSsyxjyMsVnJurpt6EcxxZOGu7ugDMVEN8DT4Dw0DFARZ4t63B55oNJ
	er54NL+v4DJ/2FDaWGcj8OHyTVTcoW9p8AFfSRY5D3mU6zI9+eXe4ZpFdqji+reRgRnodAFcKWH
	8M3VzjEgZUj6zPub04qgrxaFw+zmpbLCsag==
X-Google-Smtp-Source: AGHT+IH4QUToL7D8e8p/6On2iiP6OQv/SkBOfhg4jmTT3eYoxpzbIuK2HeFgMoBbObddEAjzAiLW1w==
X-Received: by 2002:a17:902:c40c:b0:224:c47:cbd with SMTP id d9443c01a7336-22a89ebe8e4mr191891385ad.0.1744049386163;
        Mon, 07 Apr 2025 11:09:46 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:45 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 12/12] riscv: Documentation: add a description about dynamic ftrace
Date: Tue,  8 Apr 2025 02:08:36 +0800
Message-Id: <20250407180838.42877-12-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section in cmodx to describe how dynamic ftrace works on riscv,
limitations, and assumptions.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 Documentation/arch/riscv/cmodx.rst | 46 +++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index 8c48bcff3df9..e009873b2d17 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -10,13 +10,45 @@ modified by the program itself. Instruction storage and the instruction cache
 program must enforce its own synchronization with the unprivileged fence.i
 instruction.
 
-However, the default Linux ABI prohibits the use of fence.i in userspace
-applications. At any point the scheduler may migrate a task onto a new hart. If
-migration occurs after the userspace synchronized the icache and instruction
-storage with fence.i, the icache on the new hart will no longer be clean. This
-is due to the behavior of fence.i only affecting the hart that it is called on.
-Thus, the hart that the task has been migrated to may not have synchronized
-instruction storage and icache.
+CMODX in the Kernel Space
+---------------------
+
+Dynamic ftrace
+---------------------
+
+Essentially, dynamic ftrace directs the control flow by inserting a function
+call at each patchable function entry, and patches it dynamically at runtime to
+enable or disable the redirection. In the case of RISC-V, 2 instructions,
+AUIPC + JALR, are required to compose a function call. However, it is impossible
+to patch 2 instructions and expect that a concurrent read-side executes them
+without a race condition. This series makes atmoic code patching possible in
+RISC-V ftrace. Kernel preemption makes things even worse as it allows the old
+state to persist across the patching process with stop_machine().
+
+In order to get rid of stop_machine() and run dynamic ftrace with full kernel
+preemption, we partially initialize each patchable function entry at boot-time,
+setting the first instruction to AUIPC, and the second to NOP. Now, atmoic
+patching is possible because the kernel only has to update one instruction.
+According to Ziccif, as long as an instruction is naturally aligned, the ISA
+guarantee an  atomic update.
+
+By fixing down the first instruction, AUIPC, the range of the ftrace trampoline
+is limited to +-2K from the predetermined target, ftrace_caller, due to the lack
+of immediate encoding space in RISC-V. To address the issue, we introduce
+CALL_OPS, where an 8B naturally align metadata is added in front of each
+pacthable function. The metadata is resolved at the first trampoline, then the
+execution can be derect to another custom trampoline.
+
+CMODX in the User Space
+---------------------
+
+Though fence.i is an unprivileged instruction, the default Linux ABI prohibits
+the use of fence.i in userspace applications. At any point the scheduler may
+migrate a task onto a new hart. If migration occurs after the userspace
+synchronized the icache and instruction storage with fence.i, the icache on the
+new hart will no longer be clean. This is due to the behavior of fence.i only
+affecting the hart that it is called on. Thus, the hart that the task has been
+migrated to may not have synchronized instruction storage and icache.
 
 There are two ways to solve this problem: use the riscv_flush_icache() syscall,
 or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
-- 
2.39.3 (Apple Git-145)

