Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B320D4E7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751719658; cv=none; b=ZUQNKkfdfm3oc3cfpZRbtIbLaQnFnao9NnBdYQrxy7j/IlWN5OnQ1nNcvblnquTxSN+/lsCB4q8JeoM+pNphymv3Nx0sWfX5RNwNbo3XQcyc1z6imjwDnh90QP1lecq4KMu+dSBLBJbbbPv0chi2emNdNCUdr2B0W0T14XKO/Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751719658; c=relaxed/simple;
	bh=VBgfaiZ/2Ca1eOjMUrQeS1cilQMhK7TmPmVlfVNZRNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTkZlID0u47n73FUU/zuFA7ti+7hUUaMmvD+1VYT6drXcQt8B7n5iBwP0N2EDAKJauSQW7HlXFvbGjk+9a66mPYLAx5DE2fGcmPAKwz9zzbseh/aJ53bdMGh7QiwXXBEdau8A/LKbF0FcWrAaHc6yx1EW0PvmYB7UHtPdt/RjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=VseRgWWF; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="VseRgWWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751719649;
	bh=H+Rx6UVoxvT8A7ZO4zTc6LRw51cRhBI7UbKe3Uu+HAg=;
	h=From:Subject:Date:Message-ID;
	b=VseRgWWFKi0GyZbUpWrUjvuzEXyJcY4MbEDkUOYDK1edIEdysWGvMW1ikEWKb72fV
	 gl+SceFFPxRlq5kUvJRGY6xGVCuNHnd9wuxjvgXr4WgScPHW8RBmPqdXqHys16aJku
	 GF3vdopFq7wbnvbSJSVFFpJtYJ68/GqV6L7WPLY4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 68691EDB000055CB; Sat, 5 Jul 2025 20:47:25 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3832866292003
X-SMAIL-UIID: 9965BC37208C4901802A88B488CAF346-20250705-204725-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl726_attach
Date: Sat,  5 Jul 2025 20:47:11 +0800
Message-ID: <20250705124712.2637-1-hdanton@sina.com>
In-Reply-To: <68690648.a00a0220.c7b3.0037.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sat, 05 Jul 2025 04:02:32 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c435a4f487e8 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14ea4f70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
> dashboard link: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1116c582580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ea4f70580000

#syz test

--- x/drivers/comedi/drivers/pcl726.c
+++ y/drivers/comedi/drivers/pcl726.c
@@ -316,6 +316,8 @@ static int pcl726_attach(struct comedi_d
 	int ret;
 	int i;
 
+	if (it->options[1] < 0 || it->options[1] > 31)
+		return -EINVAL;
 	ret = comedi_request_region(dev, it->options[0], board->io_len);
 	if (ret)
 		return ret;
--
