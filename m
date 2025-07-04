Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA8360
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637980; cv=none; b=aDNbrac9zOp17FX1MVq9LCMks5ym+9My7dCyIB9u5C7c7zPFrO3oMmg5mq80cGIeMABMnE8xuXniPaY2gk4DgDOj3b89ktFPbsY/lBhHdHKatbKqSaaiX7WgR3jUqtdcnj4+fO/Pe8zwJYDeFQsLZW9ir4chFycy8l03MDV6lBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637980; c=relaxed/simple;
	bh=L3iiYNpzKdlyuo02+vX6SHbyCVpQpCKSiEHFvwp9pI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X9v11LCEi01HNEPzGpo/PwhJDNzeP8xqeLgXFhmyixRZwpZLBfeZNzV2a9/CdGTVMtyLz/sqTnkCyjP2XDBAWQTdHLkkgavsmNCyA8F07ntDco2qztTthO8BOm+30vx6LzV2iUEP2XG3QjCaaY3TGHBK7w3dRMgPMSMAQIo+C98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 564E69Tw082985;
	Fri, 4 Jul 2025 23:06:09 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 564E68TC082978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Jul 2025 23:06:08 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ac18278a-588b-4f83-8233-a2bada117013@I-love.SAKURA.ne.jp>
Date: Fri, 4 Jul 2025 23:06:05 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING: locking bug in __set_page_owner
To: syzbot <syzbot+56dc65adbd1d2ae1f844@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6727a996.050a0220.35b515.019e.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <6727a996.050a0220.35b515.019e.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav105.rs.sakura.ne.jp
X-Virus-Status: clean

#syz fix: kasan: make kasan_record_aux_stack_noalloc() the default behaviour

