Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C0A13D8A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411270; cv=none; b=K8g57Hx3rHC/N4tlp9Xm/a+/6SKZ348l4elw4oMb2wlxso2ulQyy++l0yvgiOiyANsGMKDlOjeqdOGWA7d9quKgJnoQ55TdkD70d1dfwVT9Q2BDOsYaya9kxAKky+79xOB6FHFkm7AXPyzagNhKZKtrWikA+bLATNYf2DJ2D2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411270; c=relaxed/simple;
	bh=P1L1oWqkO2vGFLrH2NV2fmlDtzER/uLfTvvEojAQFxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZQpBfN5atznPzQLmzyKwyE9dKcOAtKrx7gu4GVH9xqs5lCT4rBtioPmvYIw5g957Zmrcnrd0Mctj+h0yeHMUEe49jZ6LuKkg3hQeNnp+SzRA5kg4LY1BGXV/D2PKnj54tftG6zH8a1zOuC0lkvj2vDu5iZKRTWrmifsNGR1G/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kohPfrwP; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kohPfrwP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=arHVJn2tq0pISdDGhQ9lW+/SSkCbwPoa2E5hcd62Z0M=; b=kohPfrwPEec576hyCbBc+RdrFv
	0i6lgCR+Zao4kVxQ3twr61kw0uHdberku14BCwF6arFdfrQFl9RLyiD4tJ+PkMdHbJMEyE28moqyK
	ZoOUj1arpvCLtHdUFsz6mDmyKs94U8YZjbi0ITH0EONzXYEQJ1vGvgmvL6jufPp5BPDTRjrV2qir2
	BQigfuzYNqyxJESah/FP2Tb1xYAEdV3Gwg6qfVcckdTWIsOWHEMAKXitdUbkjoyrX4bb3UbbBtanP
	UimXLy8MCCrrGxh7A6GN1phVvaQb9gBu/khHfNQDWLZPB/BcLdsPJkNOiemnL83wucWJCgmzBI7GZ
	0fz7EXIw==;
Received: from i59f7adb6.versanet.de ([89.247.173.182] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tzAuT-0097Ke-Ku; Mon, 31 Mar 2025 10:54:21 +0200
From: Angelos Oikonomopoulos <angelos@igalia.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Angelos Oikonomopoulos <angelos@igalia.com>
Subject: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Date: Mon, 31 Mar 2025 10:54:01 +0200
Message-ID: <20250331085415.122409-1-angelos@igalia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_alignment_t32_to_handler only fixes up alignment faults for specific
instructions; it returns NULL otherwise. When that's the case, signal to
the caller that it needs to proceed with the regular alignment fault
handling (i.e. SIGBUS).

Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
---
 arch/arm64/kernel/compat_alignment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
index deff21bfa680..b68e1d328d4c 100644
--- a/arch/arm64/kernel/compat_alignment.c
+++ b/arch/arm64/kernel/compat_alignment.c
@@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
 		return 1;
 	}
 
+	if (!handler)
+		return 1;
 	type = handler(addr, instr, regs);
 
 	if (type == TYPE_ERROR || type == TYPE_FAULT)
-- 
2.49.0

