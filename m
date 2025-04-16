Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3B23C376
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803918; cv=none; b=O25LGUXBMjYz0DS4u3aNhpsu0U91F3iZypp8dGImyfjkV+sMLfMAzpgYLM5qa3txi+gloKU+2rVSnDXCaatonz8AptjkS1zjGweX6vRhIvFarzOexwcB8sS2TVtPPO7EIO4le3llCjocz7HxAAOTJoT04Tg0Wdceq6ZBra9nllM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803918; c=relaxed/simple;
	bh=b/bzpqZfVEdCNmyIVRjqZrvta44n0doOI6+0koS3w9U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hp43+5DsZfSTusxLL5/xWfIWW8jI17ISzv+5n7Btv+/qQ3AExazBkwTdoX8JxZCA+jcFMIWBu9GAtbxMwaJRrIL9USZi9ZLODma/9gU5dSTBGgEFYXFX2ChO2nBeHvmEgk+pxYg8DPRIJXSTKuHh3iaQjWTUU6KUqJlmdzAiay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Apr
 2025 14:43:56 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 16 Apr
 2025 14:43:56 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <syzbot+a2e67807a84a561c08fb@syzkaller.appspotmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (4)
Date: Wed, 16 Apr 2025 14:43:51 +0300
Message-ID: <20250416114352.120139-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67b6bf57.050a0220.14d86d.015b.GAE@google.com>
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

Test if the issue is active. Syz repro is flaky and triggers
different issues.

#syz test
