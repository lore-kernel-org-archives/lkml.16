Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415838B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 03:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748833585; cv=none; b=WcG8GAEUejnO4ZtRsgR1jzgiIGXT3DSJw9TNz2ggRLFOps5t9elJ3t7bgzb1yH/KWJSXpP4NgXva8SZeNMUV3TMuE4nfshexZ/1UatpZUjj9byIrtNMg835yGHtGWToiSWpM6bWMk09kg0/zfMYvOl4OezYy8Qb+2p9TAnr1Lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748833585; c=relaxed/simple;
	bh=J74Q4ShSXW/NRiMu2buVHU87C5PjLihLXRw7LswNG5A=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=TOpN4O9G2D+etwVMte765jA7J8GKddDhXWF6QBKvZNKLea/qtsLq2rdE4PmRv4FNRCq0VNhBvq9GOzGaVO0LQhb4qfGEZyZN3qqUvf163SXEeLYiwuNCj1UkDT2OAB79GQTu5konEvlV2ejDvfp75+09vws3fjAI0Gz9As6bSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ohDvNw3A; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ohDvNw3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1748833569; bh=P+Owm+L4umtWDMET498W8GJ87ysFiM+UgmGGJlKTabI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ohDvNw3Ax4YUMne3jLlIYZ0TmSWOo2FAOeyDylv5tvUBtlbohZ94wj3KZc/fe2bE9
	 R2Bbx9IuVW5/+o3ypGhqPgsl7IlSQjH37g/hl2mG5vwN4F/+qdrx+tbFJ+sSvYbftM
	 YJ54z5CgEZe0vBPqbXExU2bBCyPOOWlA1bwMhG8s=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 41567F; Mon, 02 Jun 2025 11:00:04 +0800
X-QQ-mid: xmsmtpt1748833204tcjw4oadx
Message-ID: <tencent_BEF362E363C960C3BD0448D77DF76066D105@qq.com>
X-QQ-XMAILINFO: MPRquJFDOUjC9FhkfyN2HVAb7vz6hwISEyu1Q1N7in2gQr93LrJVCsFOlBh7Qw
	 HZPSl+zebfjnTbVVu7VQsftDnfIzbiZ6/cTNJQvAg1Ay3OdsG13ICjjXxgTMZdBsrSE5nPNtIoG0
	 E9F4MrooBaKWoUHbSWQUewlNA3bBRMvbGuFr+PNi19H6qEHw09HCwfxVizfyjg36JEF43kr+73gZ
	 BrNKIgHQmSkFvILDjR7Ngv1WEvevH9Or6Ny8839tYupzyFcBEZFuD+RFpffdUUYv18Yok+HXibQL
	 /XFVfacZYBidWJBu/rVbDVyROQyjfxnIALex+ZZd5RQV/Qlu46ygzoN0ZGXe/KDnlceNTjzT+U2A
	 uZkTEnXELEmuVV3S60y7tQf83K0zhiR7YcXzrULQsXBmhr5aPtO2mdThQ7iNG4FGHWPFhce18vhQ
	 ZudLZHrBmM8XAbNzo+5dyzOkKNAUa+x91WENA0o/6G6r7Lj+v9lPF8QpGJ7hTXnByCr+Be9NLcJM
	 x1urgdG57aerbYvI0ccefWh3mbyLxY43Y1RWi6zp99dDEM5ligEFdRcZx4SjXWqHog7dbAiEA6t4
	 s+PHZJAIknHxiVn9RQD10oZG8nNAXuJucFNq5RZszjMtgZYEtWWb7tBm+T8QJk2EbKIdGN0QmOCy
	 XEA+7lzt5uniXC5+ZzLFzXEZu1zrcOpRGTRtk0ixC89kACAn2Lu3bjvUVBu9ULbRNsfOxFlE01H+
	 7RTgqSTUaEuxJ+4o/HMA5lpaccxMWrlKCfrZJKO3a+m1oRCJxlKTCokGRz7Ct3jh1Vwt4KVFP/hS
	 icPLqFb/KH5O9bA4g5Cc9FVKNz4D8PNtfngFpdrkIEIpQjaoTNpX+Ui8gDO4SZpbNFEvlO4pPV1A
	 UGVg7d4jhac8kLadg9LTE1SZ4ABNTLObcAb31VAEWm0MUAZt3I1SVac8PGPUF58Yy+TVpvSAZUlf
	 l0JL6Lc7E=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
Date: Mon,  2 Jun 2025 10:59:45 +0800
X-OQ-MSGID: <20250602025944.1414507-2-eadavis@qq.com>
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
+		DEFINE_MUTEX(fha_syn);
+		mutex_lock(&fha_syn);
 		ret = futex_hash_allocate(arg3, flags);
+		mutex_unlock(&fha_syn);
 		break;
 
 	case PR_FUTEX_HASH_GET_SLOTS:

