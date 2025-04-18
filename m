Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231526B2D6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965009; cv=none; b=aqeiBNHSCgys6XTkIxR8e4SMDY3KahdghB08iNu8BlWmr8WT3xHJj/fIqeBbrsKIcQzrsDRKGN8rolXoX/w4KVErAMdPtLTiqcInmU3Ko9fwbb5TG3fYHSfdf8uIM2/Bhh1oRfU9FFVT/6tFeJadnte6u9cMdddmpcN7pE62aWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965009; c=relaxed/simple;
	bh=dGPAZCJAO9LH9k9+kARVr8e1BoPkjZVxOA21Pk3pjJY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=iwnCBXvvP62HeJB4sH5gXQFbPTTVbuvy3/vjiVD9IVDgtceVQeCrY/ydbWyFqWM0b8KBT2U/l2BGgL95m9uXKnoHdMOoSynIgEQEzysZXRhmTbrx35MxPdKB5ibWjIPt9hzPTBI25q3omydE2fTNmi7JwI0xDG59UNb3MSoUbA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=QH7S/KAY; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="QH7S/KAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744964696;
	bh=Shfyo13CoJP0LZK8BYiEvTiymcxKJVPkg/SIqQkMIZo=;
	h=From:To:Cc:Subject:Date;
	b=QH7S/KAY7jDyYdGIYukfEL8qjtIxICc+QsdFAM6Av0aWHB0qWWQBYPcxauOFHxHJt
	 AM0lNXs/Vx+GdJnVNKT9ygaVfUIu3FK7gYrG/W/ECKjtqoE/fK0rl3ypGuRXQh4a/C
	 50dpbQZKgcpQRTcMdTwa/hclRRgy6Gf0f5TVk5LY=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 636900F3; Fri, 18 Apr 2025 16:24:54 +0800
X-QQ-mid: xmsmtpt1744964694t3ala3z5g
Message-ID: <tencent_A28A97D009EF5CA26B43840EF71F5510A406@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2sWPs5V+dNzzKrE23V7eDqXqj3ELcsMd/GU8I1Q2KdACXxwkISs
	 N1xPVnJi09o+dTDSlbayJCKwFztYsZOEaGebeHXDjSFscLwce/8W5JOsg2jVXXfG/NzJ0QrtBjWx
	 30WYer+BBiuEj986G1d4cznhLo05ENPuBfIDWq0JYs9GYerkSwjvlk3jOSifYuey4ob5AV2WPfDk
	 XsLH48H2jDERzjaYVtBGwW/sUkq4s0TiHhXNLqZrojmvlN/Z1aUsVYpYzBlsFWxkJu+pfL8jqjmE
	 qpC/978LYhWedDdFtCC9utgoLuuj3mE4VlUTM5E3unMkfMKY59JeywJkJt78Axl7GIZiH55NoiDW
	 9OClejMgWPDvqYmPfNypVlKoIBl99d0Cg6nPtwCpfxEB0XLmSM47in2lloESfua9CcfJv487IM0d
	 vww0eJTR8v/g6xzBj2lePRdthD3Sm+hwIVRZtm/LV32qRF6QUvSJmjn+1PgO2jXA+aBLcDLHZ/oX
	 cS5BUyUhKXzQoKMSlbeYlrhU3uxj6vc6VYJiBY1tYlaV65nJz1lvJwyUwuJ+CyEKCrN5PU/fdSVc
	 hMT+25ZjQrouCKvb0jpkPyru1ZnLPHG6TsAil7kzXbRIbGHafFIm6qqWu0Fpu7W2D0onqq1EBdV3
	 wMvROj9R0aDoNm6P/zA2OdbGInWkWdN+5ALaabrnYFGcBvt5US2nDmNLnWPxlQOuOe1kdDPA50V2
	 gZ5KCaiPSczTQgI9RoxKVLMSXDFUAqqvMnpAO6T34h2DoKAav++ubXnnAUqnaIKKra3eaghriR2t
	 a9IGNzKgo4RGV4gRN4qYl9BbYKYThYjbqvnWU9aVZKNW2/Yw87LsU9q8KxzwqjW4gdVwJHZSK7QF
	 tF2rVtpbPNhSkmFlHoxSzgGGAXenHihiJ4KhpUdSFAO/kZ1siwqk4a7nL4Xc56KRNoMqDCMJkaBU
	 5QfLv38tBdpDQtPDloRQu/sq+Bgz2oVr3VOdIL++RuMT2jEWFDUA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: xiaopeitux@foxmail.com
To: linux-kernel@vger.kernel.org,
	f.fangjian@huawei.com,
	robh@kernel.org,
	john.g.garry@oracle.com,
	andriy.shevchenko@linux.intel.com,
	xuwei5@hisilicon.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/2] logic_pio: clean hisi_lpc and logic_pio
Date: Fri, 18 Apr 2025 16:24:31 +0800
X-OQ-MSGID: <cover.1744964101.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

This two patches for hisi_lpc and logic pio.

1.remove unused head file.
2.add comments for logic_pio.

Pei Xiao (2):
  bus: hisi_lpc: remove unused head file in hisi_lpc.c
  logic_pio: Add detailed comments for find_io_range() and
    logic_pio_trans_cpuaddr()

 drivers/bus/hisi_lpc.c |  4 ----
 lib/logic_pio.c        | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.25.1

