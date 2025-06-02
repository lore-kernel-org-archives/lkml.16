Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94715A8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748834724; cv=none; b=pvHQYZPAFELq/PvE1CDCOciQaYHlcBFyZ6m1O6VNNQqACd+tGY+n6fmekDn4fCArUUozRu2oGsItuLMU/4FWu3ebMd3O4uMLqVh0p+17FCBtn77/5AOMa0n7io3vUcNVg454uL3v3IuzHsGypi7TaS6vt5O2qtGaFygkYXQq0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748834724; c=relaxed/simple;
	bh=stxGjSmFVizBmSu66HXat4zZLjvaLm1XnfvsuTHmjaY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Vgwk8yiVIMNzLd9Ictj0XQ/fIVv1MQAIzNN30bcXby/NuQdF1HnBboUEbT9U5Gu1mhSEHTnIYEsvYp1RzMAL/KA2vWdFf0j7mK/EQWbSDfZuLDcmwXL4D4+/b3vwOrydtd6bKscs6/PiWv7SL4YSUoV/zUBV95TYv7RmGfD9Ch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=SsYKL/Ei; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="SsYKL/Ei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1748834414; bh=b1j+mSdLPvSDTlRONOL+w5wsNRXNf2UHVaHn7BlZ3vA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SsYKL/EiC6fd3/NHGDgBgZudC9QFyVeidWo6WFkdxaYI6LunIRnkJRWSB6vtmsMaw
	 +uryKmk/jwxmGJMkzh7JdFrB8o0KGmafeLoRDJDJWcQE2NQMo4UYK2azeHvMLE7C8a
	 KT2P1rQ5ofMSJnnbi9gr22/pC7R57RYsZB5+yBy4=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 50CA9E0C; Mon, 02 Jun 2025 11:20:12 +0800
X-QQ-mid: xmsmtpt1748834412t02bzwaj0
Message-ID: <tencent_A10D9FA5B88DE792075D835DCD99474FC107@qq.com>
X-QQ-XMAILINFO: Nn2PdnhJz/aLAtW1q+c+y6tKZEq/NJFG6xxP127bCvKfWAS348PyGmM7XG/DOv
	 +t9W+tvqttE8WWM1mOvfjEUKAcD75poDrUVkKzD2LhNCG2AWU5fl+ZLHIaRYLPe7Lw4BhHWGSRst
	 fKfQDkQDwIWUyenl/tNbBbhY79ksayL+UR/uzAHHWftnD4iBccZe/92KN/w8ayljpIv9jp7MNPoR
	 4RRT3GdRcHVpnFo1bqklwi8O/gXO1l0esdSeisE2Mcc/jHuCZyYdiOErb7nTT7xa5Z+Ebcaa4sG+
	 FYw/HKwCAiSmm/e3oC2mLWZV0bNG9rWHlTaRwNFL+ewmDKlZbiXpAE9K8Z9DFOo9J3Ak7Ygx38nv
	 pCnPjCKzHoOgwLzwFtt8nsms21Ros6+oF4o0LPwIwYZXTzkDwpDbM+2IcHjSBTdYR4IMfTjNSsp7
	 56IfGz3ADSYAHqfw+oKiD8vYjT/6VSEEt+IDy9/3i7QU9a+WWsLyyGKcKza0Kiv8R/jc7QHkHwTb
	 Nj+6R5UTJgNrE4ZCfJkIUkT8JNqgPICwjX22j9xvPLGfKxljgt6phmzcsQg7HFqarg+3p/vyd0nz
	 s+ZUFlZkYDt7y11g458LMhjxzTQ5i8ZicrtyRkYfYKyqlKRt+UiSuHPJhqoHRShmA7cfG9xiLVjE
	 bd/LVOJ0InemS+f/ilz70rBXthBD3lDK4KstCgp5wEDRR+VQXcJQz80XAwSZ4zkeyMk4iLTshgr/
	 hc7OXB1ZGuOUMrMTXQ7luv28tkdZK+OJVOmewG1j82USAfhqFk5EGYHZc/EAWfNNFUF3MQvsi6iq
	 sjRvOe2UHPvdpRNmMsP9SMhSXJFzsmoPJyjJXlBSvX2NO+Tiq+vHtdvstgaByDV8hzonBWlFb1i4
	 ENNyexXTxYn2eAbXiszKiPU5fMNppc9VAazBaQzrC54Bsp0giXE0BX9s9jYpu6yCrKHZLCzdIqgu
	 7Vx6WgPA13TH+VcOM51Zx+xXYTlODNDcswny+V3S20zI2bD3BIo7MewzL2GlLG
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
Date: Mon,  2 Jun 2025 11:19:54 +0800
X-OQ-MSGID: <20250602031953.1429280-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <683ca389.a00a0220.d8eae.0035.GAE@google.com>
References: <683ca389.a00a0220.d8eae.0035.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 19a2c65f3d37..ea6b8266efb9 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1754,7 +1754,10 @@ int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
 			return -EINVAL;
 		if (arg4 & FH_FLAG_IMMUTABLE)
 			flags |= FH_IMMUTABLE;
+		static DEFINE_MUTEX(fha_syn);
+		mutex_lock(&fha_syn);
 		ret = futex_hash_allocate(arg3, flags);
+		mutex_unlock(&fha_syn);
 		break;
 
 	case PR_FUTEX_HASH_GET_SLOTS:

