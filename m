Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C1231855
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751719145; cv=none; b=G2KV7jXSX8VKUjGGV4uPxtVKNPeIsRvMJy4WbWI/9YoAgstz5Mx6EOAnO54DUGMLE8/CDY5zbFWHMRDYfF9srL1ct9w98FxfFhXud8zYB29YkLOZVkT1jUN5P1EiAhzaEw+bQ2QSE14u9X2HuEnTphaGI4UHrvPMbnCrDn+5WhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751719145; c=relaxed/simple;
	bh=+7cppAqRgA0aMhfNrUZHtVNwXJp1l67XYKLEYErCpRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQte9cgaEYG2jWtUD7WZSY7+5DVnmI3bHY45atVftOA74bJ1Wy3dpCHOuybcVbvaP9dxWhhLNlH+70lrSwq75FBV7VyT41ZlRau4q0Mg8vBmyo/5OkJviRrYrgCnty1Zw3upRmdg6kKn0UyqjxqcyHj8QClVFF+66les7qEB3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=wh7tYpUA; arc=none smtp.client-ip=202.108.3.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="wh7tYpUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751719138;
	bh=hdV8rNzeT88d1beuOKgxNvucoDyZAJFRsAz0aDLCpDQ=;
	h=From:Subject:Date:Message-ID;
	b=wh7tYpUA3Mxyw59VzCqKKPUN9PZRgzttkrKFnK0gXTmU4nV07kCHvOxLYcri3Djuj
	 ob2vNMo82Qgt47qL7kvXlsrulPfwEzgthMMMko2oflBXTYc1f/kd0GVt0HU0sRfDsI
	 fAGaAhYuq8k6MS0zIn9bswv3LmHHBmDwjZMr+VjI=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 68691CDD00002653; Sat, 5 Jul 2025 20:38:55 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3556046291940
X-SMAIL-UIID: 709D653763324847B177DB0EA7A5BF7A-20250705-203855-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+fce5d9d5bd067d6fbe9b@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] general protection fault in pcl818_ai_cancel
Date: Sat,  5 Jul 2025 20:38:41 +0800
Message-ID: <20250705123842.2616-1-hdanton@sina.com>
In-Reply-To: <68690156.a00a0220.c7b3.0036.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sat, 05 Jul 2025 03:41:26 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    26ffb3d6f02c Add linux-next specific files for 20250704
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1304cf70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8c567bd5a036e49d
> dashboard link: https://syzkaller.appspot.com/bug?extid=fce5d9d5bd067d6fbe9b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11022c8c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1704cf70580000

#syz test

--- x/drivers/comedi/drivers/pcl818.c
+++ y/drivers/comedi/drivers/pcl818.c
@@ -759,12 +759,15 @@ static int pcl818_ai_cancel(struct comed
 {
 	struct pcl818_private *devpriv = dev->private;
 	struct comedi_isadma *dma = devpriv->dma;
-	struct comedi_cmd *cmd = &s->async->cmd;
 
 	if (!devpriv->ai_cmd_running)
 		return 0;
 
 	if (dma) {
+		struct comedi_cmd *cmd;
+		if (!s || !s->async)
+			return 0;
+		cmd = &s->async->cmd;
 		if (cmd->stop_src == TRIG_NONE ||
 		    (cmd->stop_src == TRIG_COUNT &&
 		     s->async->scans_done < cmd->stop_arg)) {
--
