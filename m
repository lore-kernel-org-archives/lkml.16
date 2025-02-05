Received: from mail114-240.sinamail.sina.com.cn (mail114-240.sinamail.sina.com.cn [218.30.114.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5B2218E81
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.114.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751818; cv=none; b=dJLMcY4xGtB1srt99LBmscToDtzOEa3nUx+d6VIgnzXEQg35yKEU4CJpqR1VH4kXMrIrnclyTIBwx0zM2gd4YPGfj+rxhD67VSC6PpCuYCifflbLa35GHglT19+C9SrYO/gdD3eiXxZ0L/udY7jxu/uMAOkC09B21DJAst1UiQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751818; c=relaxed/simple;
	bh=voIFCd/6S20L41TkHc2hYjy+u1udMSurTh3N+iid5E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8pJl4j9mLncrMe7qgDMPscgD9cbOH0L5b+j5RyjKnkJy+0deAy6nB7+wAoGQqlsF5gbJgnH069MhQAjyKcLYIVgv9Ye8Qjx81m83c3yeAUZLw7lzhqROTAsDJGeT03Zz3nr3y9mzKDFVNJ1dbNS1FWEzBB/y/aNIYTVG4C4Ga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.114.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.12])
	by sina.com (10.185.250.23) with ESMTP
	id 67A33EAB00006100; Wed, 5 Feb 2025 18:34:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7424218913313
X-SMAIL-UIID: C2658CC0A7F845F4A090E14519F9E997-20250205-183422-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+07392c132f11b1758ac3@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] [bcachefs?] UBSAN: shift-out-of-bounds in shmem_add_to_page_cache
Date: Wed,  5 Feb 2025 18:34:20 +0800
Message-ID: <20250205103421.1895-1-hdanton@sina.com>
In-Reply-To: <67a23382.050a0220.d7c5a.00bd.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 04 Feb 2025 07:34:26 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
> git tree:       upstream
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160983df980000

#syz test upstream  master

--- x/lib/xarray.c
+++ y/lib/xarray.c
@@ -390,6 +390,7 @@ static void *xas_alloc(struct xa_state *
 	XA_NODE_BUG_ON(node, shift > BITS_PER_LONG);
 	XA_NODE_BUG_ON(node, !list_empty(&node->private_list));
 	node->shift = shift;
+	BUG_ON(shift > BITS_PER_LONG);
 	node->count = 0;
 	node->nr_values = 0;
 	RCU_INIT_POINTER(node->parent, xas->xa_node);
--
