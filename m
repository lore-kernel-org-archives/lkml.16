Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E036B1FBC92
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572052; cv=none; b=OmR/R0hIzDn51ZyqsK+sefqTuJM/zUPc66F9zLBpIZ4bODfx3Qootm73pb2GKb+MDEUwFgiNS1TJQj9fBbi8df/Ysf4lK8gVVcYwqBLnNx8F+Jvy4M2xzwFW9wzcUcVbq6V8TJIFdJNq7GugRqaIMa8A/Dl9WDKjnMPOKGoc/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572052; c=relaxed/simple;
	bh=M2uj189+naPDZiwt4PfWnnidmCZ4WhF2CTp+aIgm1zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbKwpIi2VpXJGl9ruQscrAzDyvlRuU6AMZ3e/26AknEG7Ac3s95lw5mzRqaQOZ91UQiMMcEQAEL6gRTslLXTLeQGgCStpoJMqQyr/K9/1KCCW1BcZ+UyDgkoDl88OPk/wwU8XHaNwwFlYh3YByWEpxH9K0hHx2N1lFObdaw5pUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.56.205])
	by sina.com (10.182.253.23) with ESMTP
	id 67A080E4000037DA; Mon, 3 Feb 2025 16:40:07 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5528897864917
X-SMAIL-UIID: 2169E7EF413642E4B59B80940CD8DF0B-20250203-164007-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b4567a8b2d2ad5f9dd06@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernfs?] possible deadlock in walk_component (4)
Date: Mon,  3 Feb 2025 16:39:53 +0800
Message-ID: <20250203083954.2020-1-hdanton@sina.com>
In-Reply-To: <679fbfda.050a0220.d7c5a.0076.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 02 Feb 2025 10:56:26 -0800
> syzbot has found a reproducer for the following issue on:
> 
> hEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
> git tree:       upstream
> c reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15bf03df980000

#syz test

--- x/net/mac80211/rate.c
+++ y/net/mac80211/rate.c
@@ -217,7 +217,6 @@ ieee80211_rate_control_ops_get(const cha
 	const struct rate_control_ops *ops;
 	const char *alg_name;
 
-	kernel_param_lock(THIS_MODULE);
 	if (!name)
 		alg_name = ieee80211_default_rc_algo;
 	else
@@ -233,8 +232,6 @@ ieee80211_rate_control_ops_get(const cha
 		/* try built-in one if specific alg requested but not found */
 		ops = ieee80211_try_rate_control_ops_get(CONFIG_MAC80211_RC_DEFAULT);
 
-	kernel_param_unlock(THIS_MODULE);
-
 	return ops;
 }
 
--
