Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560021494CF
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307651; cv=none; b=pO72V4R3iBlWArmlmB9P9aqfnKEWr0spuEZVPrsKbNM3R9f86FlxUqLxv77l1YZJ/lWDqHAoSeevF0OQCkbkdyRPb7TtPhTXe1tj/DDyfP3sifIhEM+uf8zOTj4MQdEESEYKuBBOoscIdgA/4Pjbb7xa/B9sOfT603IBSvGEAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307651; c=relaxed/simple;
	bh=RAb/I+XQAJ3h3AHNNfRFr1Uw7RCjo+3W9a4qsmOJHsY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEa8j1QkFJiOxOJ06Erycz3khQh4YZXlozzRJpzZb/PAdfqM2rNoPZWtyLx5gYaI/1gaMnJBwwt8iUTsOSBY5OuFtd7rE5iUgt1xbz5WJeBiKivAdV08m1ObaKfW4lbhc8TB/EFQwzsiaZGJKSIknhxAVUKZ3BLON94X12490bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 31 Jan
 2025 10:14:03 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 31 Jan
 2025 10:14:02 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in usbhid_parse
Date: Fri, 31 Jan 2025 10:13:04 +0300
Message-ID: <20250131071306.19555-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <000000000000d330500607d85a5f@google.com>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Test if upstream is broken.

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
