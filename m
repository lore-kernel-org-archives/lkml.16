Received: from mail115-100.sinamail.sina.com.cn (mail115-100.sinamail.sina.com.cn [218.30.115.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A248322CBDE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752904; cv=none; b=TXCl9SEjfezxTtoUhkrFm0Wj3XDoRMFETRmuYWOjgbvkiEgpMbcJj6QiFrk9RYwl54JCuWeXKmKai7PA7Nsrat8H630KPxhp/gVxCj5qdC50ccIFH6Qs1tYEYt/KadX9xMWexwwD+wwvR115C5uudQMEpgEKtOwMRDPJdiS0Xv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752904; c=relaxed/simple;
	bh=VGVVAg8gE+KD8d3160S1fTLbykbslK7W6P0d/xZNODU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgBr24ncMRebglxc0hDuOxO5wMbMAX+dWsmR4fSZqGfXdfXMH38IZIx2PAQ40x6Wa/NKERUDYkSBv9snkBTWWUKxn7zjrvdguICKx2WjeFPR2Bw8yqkOehFqO/U/G/bDOfkqwjdeMyB9ysDXNMy48bdbAj2wfwj7txVV1NhbUVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.12])
	by sina.com (10.185.250.23) with ESMTP
	id 67A3435400000DEC; Wed, 5 Feb 2025 18:54:18 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1019148913065
X-SMAIL-UIID: 0393E608C98148BB80A1A64EE9273C51-20250205-185418-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+86a8ab09a0f655f1ff19@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in generic_hwtstamp_ioctl_lower (2)
Date: Wed,  5 Feb 2025 18:54:13 +0800
Message-ID: <20250205105414.1916-1-hdanton@sina.com>
In-Reply-To: <67a230a8.050a0220.d7c5a.00ba.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 04 Feb 2025 07:22:16 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
> git tree:       upstream
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161595f8580000

#syz test upstream  master

--- x/net/core/dev_ioctl.c
+++ y/net/core/dev_ioctl.c
@@ -452,6 +452,8 @@ static int generic_hwtstamp_ioctl_lower(
 	struct ifreq ifrr;
 	int err;
 
+	if (!kernel_cfg->ifr)
+		return -ENODEV;
 	strscpy_pad(ifrr.ifr_name, dev->name, IFNAMSIZ);
 	ifrr.ifr_ifru = kernel_cfg->ifr->ifr_ifru;
 
--
