Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8810E5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734577; cv=none; b=K9sUDq/NuoknnKFjEmz4vmgLmd0b1hI6aB3LoGg/uI/LN6WOUbLldPYbZeK6LCnJ9pfTElIzAhY+1O9qzVKkrNUKgOTsYTqe/laBKoG9PT6/9mpyLtPrFk2TYVsRlTECKUeR4hTCHlKn8wFb8ZLenD3wk7SjgqMyL96QlThFWC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734577; c=relaxed/simple;
	bh=uxnruMTEieBwjTHSvBt1nHOSf/Ie3aH8icaXsc0a7YU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ViJQviBD5JG9EDRW7Lj8dis8YTEkRFkfRPr/90ezh6hsHe0060cTobyvtPc+gGGOrqgkzs4DI68drG5Tadu79KcEv2sCHtcoQZvSHYnbwKoyEJ8BydJxf6CnU7k2JVqb3AvCHsaUQ+W7xRLmpQ0RKmegBuXHiZAzQfry1s46jeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OLU5VAEw; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OLU5VAEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745734561; bh=JADm9sLhPOlgyvPadH5StISQzwN1fU2VLalMOuW/29E=;
	h=From:To:Cc:Subject:Date;
	b=OLU5VAEw6jKv8U49sYZS+RPazVMVmd+yfkrvp8zY6WN+8lVpXN+w7zxfZkKRKjuve
	 c1UlNPA4mfYEP3cfUUqZknkvf1NQDR8zr4Wxk2IGqEE2S/DLIDIBG/jTuNHOnFQ9JW
	 RQlAzVYm8q9DUV2M+YyPfy27r8s0sc9zADsYJhQU=
Received: from localhost.localdomain ([36.111.64.85])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 3ABB3611; Sun, 27 Apr 2025 14:14:43 +0800
X-QQ-mid: xmsmtpt1745734483tbxwd139x
Message-ID: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
X-QQ-XMAILINFO: MC6m07AaSFhrE4NspI8KCHLkkt63Z7TSdkfNo7n1S6m43AQC6WRMV6VcttPzXd
	 o9praB98wph5PNaXpQQj6gZpJutBLSEFOjaFna83oe3gHEOnWV0ZR+dbkh6N7noWWH1cGEFxvJ7t
	 YVNxU0ccGIkaj3jXSj5GK9eRrufpzPBfa8lPxIcFSqV5//wIMPHRYUiRdpds5gkaiIqpFayJ3S7S
	 A1nUtdUkzQj2ebMJURt5Vc54mJBUdYMb+seAqSmZelmcj6gyZ78iSN3ilbOonrAP0tCMdwh5bgXK
	 P3BxxcCI6XgUEejPeh/1BBFQgiWUv4JdSPqGlJFYgQesmh6hOIbjr3nno/72sjMW/SWXacDxZCu0
	 erOnTu8m4L8d/Z5ZJ4VppOC3+K0sT5aI8KPhiQozaccMYu8mSC73l6pTs8q8/KkqhjyItTGM8EJ0
	 l9k4HSdfSMxtxIApDQZV0xd0YfNOQFHdm4I1DYxkvYHe84tq9JJLqZUZHRsk2kI/ZeYwHDEmaSy7
	 OX2tFuAV5kpJOQ/tX0fp8V3WvFXDUcpFK9BFvQ3HrvDrSFSDc3vlvhu8T4P8VxlzD5OeH+Hp9Q1T
	 OkzHrNLTJNqczMYnFacnQkhCg4n3ylInbQUBH8hOyC/qYKsnysFPBo59U2wcIccLKjV/Jbz0ZwHi
	 mvZpMJ772Gz9QpHf+w8BcAF1sMfpDfwUfpam3Fb3esS64os5LYM+nFB2cqscRZfLmKLVK3Jig9Zi
	 NkdjhEbao85LL9l1DB/iv770+Geb7OhUo/JRLfLypznhtx1qUSJwniGNqshfAfJhqVAAU+LsHhcL
	 mXZbt1P5ajiqmp2/AzoWCh9HkBH2WTejsDxuB1du/PNOA8M+av+opbbWQevc7hBmyomcYTwGtuPl
	 ppB0Pyms5s4ns5jlM6ZIDfGDAtRtj2FTnkTBRklX80TCPAGI4YZHxUjoNRmIazHWt4HSYBOB9l10
	 RGwsW2DyjcvFtOw4u93kKZ1J/d8VsFeDGvTp3PJaARw+JPGPBHbwirNMnXuVMuBdgjbctfEBBI3x
	 1GEGEQ11S7vgQYKcNmZrrFUJFUMEU82xDGV2hRN+DP4KkMiimc
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Feng Lee <379943137@qq.com>
To: akpm@linux-foundation.org
Cc: david@redhat.com,
	ryan.roberts@arm.com,
	libang.li@antgroup.com,
	peterx@redhat.com,
	maobibo@loongson.cn,
	baohua@kernel.org,
	lance.yang@linux.dev,
	anshuman.khandual@arm.com,
	trivial@kernel.org,
	linux-kernel@vger.kernel.org,
	Feng Lee <379943137@qq.com>
Subject: [PATCH] mm: remove useless code
Date: Sun, 27 Apr 2025 14:13:59 +0800
X-OQ-MSGID: <20250427061359.2647-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused conditional macros.

Signed-off-by: Feng Lee <379943137@qq.com>
---
 include/linux/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..47c5a54b7551 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 }
 #endif
 
-#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
 #define pgd_offset_gate(mm, addr)	pgd_offset(mm, addr)
-#endif
 
 #ifndef __HAVE_ARCH_MOVE_PTE
 #define move_pte(pte, old_addr, new_addr)	(pte)
-- 
2.49.0

