Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2414F280A2E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349920; cv=none; b=s34OW9rldidX7EKByqgGYuKrf3C2D05aEUTV9OO8fy+cLkqg6E5H0jXt3YWmTGe6cB0/rQ+tV3mPkHcC5ck8TmoYMehz1TqJS2U9qojvQpzGgeo4K7ZwWefMNHQwH4NzAiIkeZVZDtWJv+fnh8QALu306jiwsxZ6eLo7U7Bac8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349920; c=relaxed/simple;
	bh=v9lrMVZhKNFZxoLDI4hHR+N4Zr7YuKL4/oewG3Z2Ea8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tbkCF6IQjo7rbWRCgSKZDJG1Q9bLfP5ul+QiWutLzrVAChzvGqxDEsPQlbuXwAhGzHrtsra/+KSrMFmn0WixBkAxXbLPJtUs7wZd+B80QVgY4fLPBuzDC/mvpSzr1ZOMolTS5BqfA1ZNTPEopTJJ67K/wCdB8u7aaRkAbxJFjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sJFSf8eA; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sJFSf8eA"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so1582195a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349918; x=1744954718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=;
        b=sJFSf8eAsINQl+e8RfindwXy+h7LJXW7QWvdrYf/PMChlK66DV3U+7r883PpsiUyB/
         YD51zp6xXQ6oMB61Me5qN6J6puPsy1ejybbRgghofpudfYMb0Zoa4Q5YK7KoVOmtkxfl
         m2wFnBbfQRUwPO9bQt9YfWNLO79frznwdS5U5YlAwZpxcVHhhB7PvjlU7z+CYMcLonSV
         LfiSlkqjGS39JJpiyH0eHrF4gHVt9rxpl8IOpKEX8+PGzYsqM/NeRpnw8/Ob7HRPhzTr
         MrWb5i7EFB7p9ntoVIH/9BtY+qbiyYZvlUgW48Xq4SOqkA+m35muPMVqEMRi7wIUCaTg
         dAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349918; x=1744954718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=;
        b=Mvqh5yFR7f9u6zEOj3W4ZGL+kw8Vbu/4WUXKjhCb6ra7DS6A8YhQKPKeF+sbZsGEY8
         r0ETKdJq24qS5xFWlUY4T/mAs2lvufYLRODnyfbK05nhw1XxK304Hy4QKNysCUlDE7EQ
         jXAyL78KbU94P06jVcH1UIEc8nxyl3oD59g1n5VXR6N37JI+Uv3YsFYMoa7idf1OGCHV
         g3zIiS9B/fEbx7V1vglpg5zcEykaohE0zJQvkyxLda5XXQktGaOSIbsgC0eWIpzZXFm7
         0bzjrky6b+UH40fPcPG6JTZlzDcC+YjXWdW9sXObD1wXE5NUamcy7yGhj33Tce9LBi/X
         srdQ==
X-Gm-Message-State: AOJu0Yy3yR+4uzQCLqzlWmgIC4fhcFHmz6aNxH3Lg0LzvzG9xigFrZ4h
	EUBzqFz4OVqUjJ+9j9wBmJADVDptG8kkJWt1W7WAejmaE950+HnaVrEaD4b8eCmpN29mLcI0VS8
	Mz25Q4SjGE1OUvMm/LBTGgOXH6MoXVKd0o0XSfb7H3XFIcXencarqxtj42bExY+xDetT8Z0TaRm
	qQtcPh8h7luEa7DSLqep7V1X2gB70G/wzn3qGzNWOSCPn9jImVLTy5f7WAfxGzmA==
X-Google-Smtp-Source: AGHT+IFDqnNrJ1yb2xJtOtea7MkZiHxum/paNcnypq1SzNi+wbhuEeT68KNiC92Vyv1O3vh0BoBg+A6LFRWhbKjQ
X-Received: from pjc12.prod.google.com ([2002:a17:90b:2f4c:b0:2f4:465d:5c61])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:274e:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-3082367024emr2450558a91.9.1744349918309;
 Thu, 10 Apr 2025 22:38:38 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:41 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-11-changyuanl@google.com>
Subject: [PATCH v6 10/14] x86/setup: use memblock_reserve_kern for memory used
 by kernel
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

memblock_reserve() does not distinguish memory used by firmware from memory
used by kernel.

The distinction is nice to have for accounting of early memory allocations
and reservations, but it is essential for kexec handover (kho) to know how
much memory kernel consumes during boot.

Use memblock_reserve_kern() to reserve kernel memory, such as kernel image,
initrd and setup data.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/kernel/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833c..766176c4f5ee8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -286,8 +286,8 @@ static void __init cleanup_highmap(void)
 static void __init reserve_brk(void)
 {
 	if (_brk_end > _brk_start)
-		memblock_reserve(__pa_symbol(_brk_start),
-				 _brk_end - _brk_start);
+		memblock_reserve_kern(__pa_symbol(_brk_start),
+				      _brk_end - _brk_start);
 
 	/* Mark brk area as locked down and no longer taking any
 	   new allocations */
@@ -360,7 +360,7 @@ static void __init early_reserve_initrd(void)
 	    !ramdisk_image || !ramdisk_size)
 		return;		/* No initrd provided by bootloader */
 
-	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
+	memblock_reserve_kern(ramdisk_image, ramdisk_end - ramdisk_image);
 }
 
 static void __init reserve_initrd(void)
@@ -413,7 +413,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
 	}
 
 	if (data->size) {
-		memblock_reserve(data->addr, data->size);
+		memblock_reserve_kern(data->addr, data->size);
 		ima_kexec_buffer_phys = data->addr;
 		ima_kexec_buffer_size = data->size;
 	}
@@ -553,7 +553,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 		len = sizeof(*data);
 		pa_next = data->next;
 
-		memblock_reserve(pa_data, sizeof(*data) + data->len);
+		memblock_reserve_kern(pa_data, sizeof(*data) + data->len);
 
 		if (data->type == SETUP_INDIRECT) {
 			len += data->len;
@@ -567,7 +567,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 			indirect = (struct setup_indirect *)data->data;
 
 			if (indirect->type != SETUP_INDIRECT)
-				memblock_reserve(indirect->addr, indirect->len);
+				memblock_reserve_kern(indirect->addr, indirect->len);
 		}
 
 		pa_data = pa_next;
@@ -770,8 +770,8 @@ static void __init early_reserve_memory(void)
 	 * __end_of_kernel_reserve symbol must be explicitly reserved with a
 	 * separate memblock_reserve() or they will be discarded.
 	 */
-	memblock_reserve(__pa_symbol(_text),
-			 (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
+	memblock_reserve_kern(__pa_symbol(_text),
+			      (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
 
 	/*
 	 * The first 4Kb of memory is a BIOS owned area, but generally it is
-- 
2.49.0.604.gff1f9ca942-goog

