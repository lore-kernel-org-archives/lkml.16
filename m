Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5B262A6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751595642; cv=none; b=R8f7J2l1eO3UgDbGujQS/XeV22f8D8yHpPtDl2AFmBgVOlzkX8JEZQM6oaFCvTdc+rMUkD70sAs2ir3xoz0/eZOP+TjB1G/1PiUKSDxh/SaP6SAh693tmU8BxOoFT50W+px0+S1aSp3PA+aZWXaIAoNp1zLALFuiXRXNNnyCI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751595642; c=relaxed/simple;
	bh=QtQjXCn66KB/7/WbIl4tuNfD4pDLMmm/kAJ9vxCZpxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/Elneh58hbXZM/uFXnRNxGZu13/MIDPi3X5WgE6xH9UkK8qt+CJa3NXPrieHgz/imBCAu8KY7BlyJnmqoasWJRFEjtlb39wwNbpsJyjqDJzb2yhNmaERQeKr0ouTbWx0sAkei9H77hohBRbqV4D5TydrYMj9897M6ADnsl+M2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=lkTQTM8Z; arc=none smtp.client-ip=202.108.3.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="lkTQTM8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751595637;
	bh=CKiHizGqfZamsWMiJc9P6C+Es1AWkQ+6Oq1Vcx61/sU=;
	h=From:Subject:Date:Message-ID;
	b=lkTQTM8ZNiVy17Tc7/3BOqbuEh+VvPry+FEls8L/vhebcAq5DyHnUhkgmLuTmpYo+
	 WY5TgY9cpHm+BA/14klp3MsOgDPmZqnwGVaLro4BRHy2i4NLlPMiRezExkA4drl5Rn
	 IJRSwDVYW8urDKtqMeD0eWkIbNDvYwO1IRiMqhgU=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 68673A6B00003224; Fri, 4 Jul 2025 10:20:28 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9208964456965
X-SMAIL-UIID: C7D23E55E0764BD49030169482AFB311-20250704-102028-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] kernel BUG in filemap_fault (2)
Date: Fri,  4 Jul 2025 10:20:15 +0800
Message-ID: <20250704022016.2331-1-hdanton@sina.com>
In-Reply-To: <6866b332.a00a0220.c7b3.0005.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Thu, 03 Jul 2025 09:43:30 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    b4911fb0b060 Merge tag 'mmc-v6.16-rc1' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16568c8c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6ddf055b5c86f8
> dashboard link: https://syzkaller.appspot.com/bug?extid=263f159eb37a1c4c67a4
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157cf48c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=146a948c580000

#syz test

--- x/mm/filemap.c
+++ y/mm/filemap.c
@@ -3439,7 +3439,6 @@ retry_find:
 		folio_put(folio);
 		goto retry_find;
 	}
-	VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
 
 	/*
 	 * We have a locked folio in the page cache, now we need to check
@@ -3490,6 +3489,7 @@ retry_find:
 		return VM_FAULT_SIGBUS;
 	}
 
+	VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
 	vmf->page = folio_file_page(folio, index);
 	return ret | VM_FAULT_LOCKED;
 
--
