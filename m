Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C9258CDA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753624; cv=none; b=WKy3q8WPvpSX2azkOSVpWUieJeX2K9YQXPocLAXMc+Z7/3wL72qLkQvakww+Vjyr+LzZ59gSbAduM4FcVSulnGMy02KgzW58L49uGw1cgh4z/k2qjuGSZLGTP8NGdKpjWrnZ+Rx9PbuHd/4wAwmKAWprLAnqI0YPwz+ySnWh/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753624; c=relaxed/simple;
	bh=MK/0sV9iPODGMfIvaSoqDQLATEj45R3OjlM3rNrtZLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ox1Qz1ipeGJXMnJhV9GIcYuOCmTUs89pCYb729lxKp7M9PS7uwBN1adbAm0TJquToxtxS+W0D3druJxI6HGF5tIyw+n2C+lOuLHQ84m2/JRF3iLSfSVFGQXbpTojzSG5V9P3xfIjTBaocQwnGoLAsSJE4FJVwV9Qabj3WAwRXvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 685A612100006786; Tue, 24 Jun 2025 16:26:11 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3424196816267
X-SMAIL-UIID: CA572E708C92455AB66B99258C176F7C-20250624-162611-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [trace?] KASAN: slab-use-after-free Read in __free_filter
Date: Tue, 24 Jun 2025 16:25:58 +0800
Message-ID: <20250624082559.1616-1-hdanton@sina.com>
In-Reply-To: <6859ea24.a00a0220.2e5631.0044.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 23 Jun 2025 16:58:28 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    86731a2a651e Linux 6.16-rc3
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1611eb0c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4ad206eb0100c6a2
> dashboard link: https://syzkaller.appspot.com/bug?extid=daba72c4af9915e9c894
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b16dd4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c7bb0c580000

#syz test

--- x/kernel/trace/trace_events_filter.c
+++ y/kernel/trace/trace_events_filter.c
@@ -1429,6 +1429,7 @@ static void filter_free_subsystem_filter
 	struct trace_event_file *file;
 	struct filter_head *head;
 	struct filter_list *item;
+	int free_filter = 1;
 
 	head = kmalloc(sizeof(*head), GFP_KERNEL);
 	if (!head)
@@ -1442,6 +1443,7 @@ static void filter_free_subsystem_filter
 
 	item->filter = filter;
 	list_add_tail(&item->list, &head->list);
+	free_filter = 0;
 
 	list_for_each_entry(file, &tr->events, list) {
 		if (file->system != dir)
@@ -1467,7 +1469,8 @@ static void filter_free_subsystem_filter
 			continue;
 		__free_subsystem_filter(file);
 	}
-	__free_filter(filter);
+	if (free_filter)
+		__free_filter(filter);
 }
 
 int filter_assign_type(const char *type)
--
