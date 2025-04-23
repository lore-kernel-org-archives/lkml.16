Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC91FC10E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745440009; cv=none; b=DAnPlW8oPyUqSbOtCCnzpddHYpmArQWZqUZKYTgK2BfGo/yqzltPc35cKqvLUT3DlAi7I/VnIvHIJ8lK7b+NKrBYrVMJW5EQOv8dzQwbAqLAn3fbU10hUw6WmtOd87Y02/pg9KcqeZxYtZZOi3n8sB0lmEhumETAf62ZvsOrDFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745440009; c=relaxed/simple;
	bh=UtiG6C3ePVTMaP6Gy85DuOb898RAmJXEx39uAd37NPw=;
	h=From:To:Cc:Subject:Date:Message-ID; b=RBYWNcJXEgMlk85x6gsKJ+9W2YUpgeL0V6prCv+3LWioaHH0+5RYT9LnsvOaKCZ8DHivu6eYVtKhkkVJJLufIXV4oYFhIS5L0QQd7Fc1Hz85BfJpjbJ9NHTW7HOABPlP1ZVuO7VjncnUnjay54/eZ1ki50BqHvUOKjcNGBrZW9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=NJ4Jaoyr; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="NJ4Jaoyr"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2279915e06eso2880955ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745440007; x=1746044807;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9VzpnqKaBUOLcjy0iBYoA9/MIid2WGRZFWdfEXFXtU=;
        b=U9qHBB0DPjXID+32dMrRQNydm3HJb4UbTwIV7PTfnJJrEbX3RDqYxLTc3skViGnrES
         rv64pMdULPMWufMPBD7Mqkc33jSlRVh1B612ZTDiROsAdewqKBbpRKRL9IkQCYzfo8Dc
         ZICYZ9NOj9qf34qxwgYS/vhfCcwySTJC2jnKvk35FlXPcs5Ne6MK5Rz94tmze6ScXqDc
         6FD9z8cxBbX5nD396TjdtHSOV3OiIViSDUhQTTCgSQpIu13TaBGrjEdALuAIvzU9Ka3e
         zaLLasqAbV+h0ALjl84q72AIzSlSEs0txIcaZvOd43Zz/N+QeYwKlT35Hndw3b4JBBlA
         xU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWi9FIeFhYJmkgEDyf0O3uhyP8cJJBFQrjI5TBzrOMUCPA4+3E1OZZB5te4nsyMhYmC4LJnTTULd4MTyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoczVprZyXZS8TFowvrarIln9mR4Z3Ms4G/Og+rcUQF5bmIjWw
	hxlIGqXlHM0u/RGptgMigBOnufl/nqygLXMEjie2Tcsa6AsrYjO5jopILYTlb0rMH17AJJ8KKpW
	janAjLPONH9VLmtMyzXtgl1YcaDm0Nw==
X-Gm-Gg: ASbGnctxiQP5T5lyqLM0+AnWrG75SLZ0QAG2P0dfkLvmZmcHje/1bCrv9CbkTSTKM2p
	A64W8cDfOyqw8Ej01++XOMyBjKlibU5BaRke1ONPbv1zeKoHvJqOe7o8+pxmbk4Anc3Aah4lFxZ
	5TQ+4F8QugNlVhiyyWJhugaP32MGtbWMRxd/kFuq14s8T0qdligvrItiAaTAy43R//9yFAFFWgB
	2wHVaYdZS+sCpunxn5x2CXhhtcy/BeHNoaMQLwKpyCxeffmq6TKdj0t4SlxIXt3DP67Dzkrargq
	qi2mGZgWlZH/UjrnfEW7yp66mefRZ+jrAVmHQfraP55RtRQVrOTtFJ7mP0w83AZPP2a1snY=
X-Google-Smtp-Source: AGHT+IEPyfWnPE2zgbDmhgAvZ+4h1eHB1ZVOkuhjQtBmvmmCgMA1uIjtTMe0J23uUPqY6b1O+vXJSwpOWCzH
X-Received: by 2002:a17:90b:2c8e:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-309ed270499mr251259a91.11.1745440006583;
        Wed, 23 Apr 2025 13:26:46 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-54-84-120-176.compute-1.amazonaws.com. [54.84.120.176])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-309dfa3ec16sm140664a91.11.2025.04.23.13.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:26:46 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1745440005;
	bh=n9VzpnqKaBUOLcjy0iBYoA9/MIid2WGRZFWdfEXFXtU=;
	h=From:To:Cc:Subject:Date:From;
	b=NJ4Jaoyr6SE4P7qKacXCe5CXXrXPwurmb4Ltg03Hf/o3LiQpflguLf1fFltI5Goxr
	 YkP4L3ZqFdhzehCbzKDjjyX0sbAYNrIn0ms7WxemRblon/6RQfDTGR22XeRVPONVPn
	 76RVXHFp7u+FJJYbFlvXYZLLUIO8PblWF2sTtQQiTX4eQQdBTbjmW+YppH3S6zetRg
	 B3Q1EnBt97FhIvsXfzu7XCVPsRw4jWBdH+RGMD4jcqA8ATfzbpzh302PhXdtwQFqsx
	 85NWWoP2QExq6mtk5FPwI430XBIyE/Q3ffHGP4tZHRDcKuh0poJg1vfBLDRR4yB/E6
	 R93PbjGfuSRqg==
Received: from kevmitch-g-eos-trunk-kernel63.sjc.aristanetworks.com (unknown [10.243.109.61])
	by smtp.aristanetworks.com (Postfix) with ESMTP id B9612C023F;
	Wed, 23 Apr 2025 20:26:44 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Kevin Mitchell <kevmitch@arista.com>
To: "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Kevin Mitchell <kevmitch@arista.com>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ryo Takakura <takakura@valinux.co.jp>,
	Joel Granados <joel.granados@kernel.org>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] printk/panic: deduplicate backtrace on PANIC_PRINT_ALL_CPU_BT
Date: Wed, 23 Apr 2025 13:26:17 -0700
Message-ID: <20250423202620.1686446-1-kevmitch@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On panic, the backtrace of the panicking CPU will be printed either from
within panic() itself or by the oops handling. Previously, when
PANIC_PRINT_ALL_CPU_BT was enabled, the backtrace of the panicking CPU
would be printed again.

To avoid cluttering up the crash log or console with this redundant
information, this commit omits the panicking CPU from the all-cpu
backtrace printed by panic_printk=PANIC_PRINT_ALL_CPU_BT.

Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
---
 kernel/panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index a3889f38153d..e53b23449fcf 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -258,7 +258,7 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 	if (panic_print & PANIC_PRINT_ALL_CPU_BT) {
 		/* Temporary allow non-panic CPUs to write their backtraces. */
 		panic_triggering_all_cpu_backtrace = true;
-		trigger_all_cpu_backtrace();
+		trigger_allbutcpu_cpu_backtrace(raw_smp_processor_id());
 		panic_triggering_all_cpu_backtrace = false;
 	}
 
-- 
2.34.1

