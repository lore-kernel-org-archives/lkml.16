Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C8028030C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613938; cv=none; b=cl5E5VB9caeIo351PwDbvqaZdFLhFHHLXK7u3lJ9C6DSNZl+jDBgj5qXiiBVCO4+8QsQA21TQ3j25N9FhCnf4L5jVmSpsn56EGgwvoQioDFzpecIHgRa2/S0Fq9gaU18qJ5ucrW/VYinRh9nb9Ojok6LRE8qAJVaNDAooVZ00bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613938; c=relaxed/simple;
	bh=qWufeFQjERNFsmgAkFQAQxvFBOrMGwlKC/vg/f73p6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ca6prmn+8szsMhDyY+Z9e7a7rSONSuZK4bzFkafSdEatf0NiF9YBI2Qd6E0L3c7p17z4axqiI/iglc2NZBj7QhzljMHckBXZ33yjfVcet0ylEq+ZAC7QI542FZSmHhzQJtL5NQRnAB63shqmk7eO8EXqif8OiLR6B5zKSIYivQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=G6TnsM8v; arc=none smtp.client-ip=202.108.3.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="G6TnsM8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751613933;
	bh=j4Fd75lcZIztbpZw+jihT+cuHmDY6vf5Tyq+uJCH0BI=;
	h=From:Subject:Date:Message-ID;
	b=G6TnsM8vCz5SqrOVU7V9HrEkXd6jxeyf+lJu0lSsgjvzoDGXO8ZSb+YJ/Uhpb7U5C
	 MQdeYbk2f0+XUfELiZTG3u3nexfUO883WjNewp22Ilm6Qk+VH4YWW88Rw94WGSF3MZ
	 cpc0P5TuGrUu+4hNp8q00qFHaDqobfI0xTqoh7vY=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 686781E200002F40; Fri, 4 Jul 2025 15:25:23 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5739264457202
X-SMAIL-UIID: 26F110192F3B46EF816A225FFDC2B5DB-20250704-152523-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
Date: Fri,  4 Jul 2025 15:25:03 +0800
Message-ID: <20250704072511.2387-1-hdanton@sina.com>
In-Reply-To: <686764a5.a00a0220.c7b3.0013.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Thu, 03 Jul 2025 22:20:37 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    bd475eeaaf3c Merge branch '200GbE' of git://git.kernel.org..
> git tree:       net
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=12f0b3d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
> dashboard link: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164d8c8c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14839ebc580000

#syz test

--- x/net/sched/sch_api.c
+++ y/net/sched/sch_api.c
@@ -803,7 +803,7 @@ void qdisc_tree_reduce_backlog(struct Qd
 			break;
 		}
 		cops = sch->ops->cl_ops;
-		if (notify && cops->qlen_notify) {
+		if (notify && cops && cops->qlen_notify) {
 			/* Note that qlen_notify must be idempotent as it may get called
 			 * multiple times.
 			 */
--
