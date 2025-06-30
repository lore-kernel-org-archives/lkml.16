Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CAD2E7195
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310471; cv=none; b=IjyJzcq2T3rICzgZOT7418rtLNHmT1fJ7QjjAoL8y47LmLODd42lznQPUWwL9uzrN02xQHJZpMa83rstgEfqFa114Iue3WVd29EgO+Ms95DWfqqYEKA8QJWybgsBw/WmIlqx/qkqHXsqLwidGh9hDgWUshfsz76wB2e++JrpJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310471; c=relaxed/simple;
	bh=fZfTk5Vh6fk3qEeQcDy4mPHUEYnCIWWCDffCZM4Mbko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C7ktOzo/t5kwSaCIPeXdRch0DrN0c9f7ia7XtTwI50NCDe/b7oo97QuRzY88BFVYmH6zRwMl/zm57IuEJapSxdy21DN0jYPKa76q+ZHc2NyupDparw9oZa/7hndzk9Z6siwv25rvTzAGnxSgawMHYcDSknAfmnlomCznV7c5Xf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QysighSP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QysighSP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453a1208973so11905e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751310468; x=1751915268; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXx0muI33yyrsJI+RM5hAO2k29pecRZJHRerqdYdA4w=;
        b=QysighSPx++2K4p7lfNc5QclhM1Iu5k1LU9V+v9rsdOGkq91C99RcRwGSHE3MnNpY2
         MgxlD6zRR6a4Ksd/sADGmiZjdZezbX6IgwACz4q3vCBM3E1SU8HK+h1OrNORBb/618sN
         w475etu55qOEb/CBg2m45gyj48UWDaMNvq8zARmxYx+jD7pH9rbPEGg35freQTd3g5MN
         4u5Bg5BN2k63WBnZbynJAXHgoTM0/+PrZWR423+0AF/Q9qyQyvjFp3oya71Oaj7alkGU
         Y63ON8GVTKrMdhUvG1jmHe5Y/d1slUzOOiKp1VXoLDdOVnMOlnF90VoFKsdUJi0bAHHW
         6afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751310468; x=1751915268;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXx0muI33yyrsJI+RM5hAO2k29pecRZJHRerqdYdA4w=;
        b=T1dbpt0kH/p2JIPbHn+mqMTOOu4My7RgsdX3tDurXfc1gDrbhXMLiQvwzpzVveWcTR
         R3BB57U/Gm6urHwlFHPcEqYYU3sGb3aLBpyyGODBe0tBVzDtviMGMJZaI3XM0oq+69GT
         hjUQtOjMgttRwrzXLqbpv2RKcIKBc7sckc1CEU/MTTj2GxRo0UXNlW5NuZyybaj8A83V
         sLMi6PEBOMfqP3u9xmiBxIekMTVl/e2GwvY+WbDtHs+mV3ZBLlAZtLxTeK2ryX9qgg1V
         paA6gk9wWJYCLL195sgwJahvhRaCpLsHjn4Yk3M0Kn/Bj4WYPu6URg23AExOqrOpLNbC
         n7PA==
X-Forwarded-Encrypted: i=1; AJvYcCUXXlIwHchRmJHkyi8cKKQOokfyOwbPJvmMfPHiOGqn6TcdgXnmI2i8/7CoFSkR9lovdOqdHxk/1ZTep3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBrbPjY68LGVPh0SubiL0QKsRDP05voPzrG+LW+GWpwyCpuc5
	cQNj05xhJDg0Lhdicv8ZwWKw7449xqRGQAXqi/MXLkJWdbpOKZDpiMOasqi2ooaxVg==
X-Gm-Gg: ASbGncvrGsMydxxcPaK1fSw7V08f1cMKkTQoTa/GTEEKFuFyzxpur/YGXSIBE/EwkrA
	jcDLDl9OfgXbT/wgfv/qPktTTgGBKTGUzYVx95UzVpb64ta89HQgZKX6htHNrx2lWrpdh77M/Hg
	ys+byfvuEVzPohcK9qvnEwtqrrg8SvfPp2F60r9wyuN87xAOHgW6O5sYzzXgpJyWDnHNTMqP6Rw
	KgwNgXYCH4GbCD2meQWbnZOS5YV24ziMtLrdIe5BYm7KjjTwaFzq6iHzUq7hCakEluQMXpEcosA
	57jphAqOuaBCTXgSAQm9fdn3En7CRgqWggjxBz3sIyOvZZD5EQ==
X-Google-Smtp-Source: AGHT+IEOtpexKrK9C200H5QylvI7By2axtMWEC2awkl7w6Yep+kOnYzpwv7SNg5/2NVyrrB7n8uhfA==
X-Received: by 2002:a05:600c:8b54:b0:453:7d31:2f8c with SMTP id 5b1f17b1804b1-453a82f541dmr100835e9.3.1751310467398;
        Mon, 30 Jun 2025 12:07:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:efbc:81c2:63ca:f4bd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453a85b3211sm171495e9.1.2025.06.30.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:07:46 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 30 Jun 2025 21:07:34 +0200
Subject: [PATCH] x86/mm: Disable hugetlb page table sharing on non-PAE
 32-bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-x86-2level-hugetlb-v1-1-077cd53d8255@google.com>
X-B4-Tracking: v=1; b=H4sIAHXgYmgC/x3MQQqAIBBG4avErBsww4iuEi2yfm1AKrQiiO6et
 PwW7z2UEAWJuuKhiEuSbGtGVRY0LePqwTJnk1baqKZWfLcN64ALgZfT4wiWbTW3DlYbM4FyuEc
 4uf9pP7zvB5jCzAFkAAAA
X-Change-ID: 20250630-x86-2level-hugetlb-b1d8feb255ce
To: Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Vitaly Chikunov <vt@altlinux.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, stable@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310463; l=1751;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=fZfTk5Vh6fk3qEeQcDy4mPHUEYnCIWWCDffCZM4Mbko=;
 b=kvQS4ouJ3b19TCoh5GA7p1y72qr1wSvm2vBPrDtuH/ptozufVWlQnwIJEVJgZVGCD4avNN+Ph
 sdoHh9GDeRFB/3o80OYgEquVoPd1SnKDwWdYKGd/UzJKzG59yxQgeHs
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Only select ARCH_WANT_HUGE_PMD_SHARE if hugetlb page table sharing is
actually possible; page table sharing requires at least three levels,
because it involves shared references to PMD tables.

Having ARCH_WANT_HUGE_PMD_SHARE enabled on non-PAE 32-bit X86 (which
has 2-level paging) became particularly problematic after commit
59d9094df3d7 ("mm: hugetlb: independent PMD page table shared count"),
since that changes `struct ptdesc` such that the `pt_mm` (for PGDs) and
the `pt_share_count` (for PMDs) share the same union storage - and with
2-level paging, PMDs are PGDs.

(For comparison, arm64 also gates ARCH_WANT_HUGE_PMD_SHARE on the
configuration of page tables such that it is never enabled with 2-level
paging.)

Reported-by: Vitaly Chikunov <vt@altlinux.org>
Closes: https://lore.kernel.org/r/srhpjxlqfna67blvma5frmy3aa@altlinux.org
Fixes: cfe28c5d63d8 ("x86: mm: Remove x86 version of huge_pmd_share.")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 71019b3b54ea..917f523b994b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -147,7 +147,7 @@ config X86
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANT_GENERAL_HUGETLB
-	select ARCH_WANT_HUGE_PMD_SHARE
+	select ARCH_WANT_HUGE_PMD_SHARE		if PGTABLE_LEVELS > 2
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64

---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250630-x86-2level-hugetlb-b1d8feb255ce

-- 
Jann Horn <jannh@google.com>

