Received: from mail115-69.sinamail.sina.com.cn (mail115-69.sinamail.sina.com.cn [218.30.115.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9B1519BB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755317; cv=none; b=mNqJlnX6KctzutyzS3Iqi49j1WM3F5cRUKciM1AdMRrOm+jt+MGOJ9VHAPvlf74m+gDoWqvi2QSehXiKWoOHv8e4A0tCcq51JuCcQVjnV9xdmtOeCIqSV+aAhUIsomZaynAG5vMutCSR10XDiPSMZrgIyWzXS7XcVmqVHUnUEl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755317; c=relaxed/simple;
	bh=grBBhhjfErB5/ZWu0r7s9FOUgEA2s7VZONcKdW1Sx/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVQQ2GhQGU7ymu4qxXaqZDlKp37MW9HBy+3i8WDZL05QXURtDIeBm09NH+/SctMbV8MbmYty4XWP1FokyEsvkTAwVwPAceQIjJNt6+t82RFoA3ZJ+8d6fQMY6J3UDX8krMVLqBNpa6L96PmGRnLRX1slJNNodGBgtUxjBmPOQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.12])
	by sina.com (10.185.250.22) with ESMTP
	id 67A34CC000007DD9; Wed, 5 Feb 2025 19:34:30 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 100797602527
X-SMAIL-UIID: C68FFD9472764E47BBDD54FDC978C43F-20250205-193430-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+3201be560ebfa39bc6bd@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in ip6_pol_route (3)
Date: Wed,  5 Feb 2025 19:34:25 +0800
Message-ID: <20250205113426.1976-1-hdanton@sina.com>
In-Reply-To: <67a21f26.050a0220.163cdc.0068.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 04 Feb 2025 06:07:34 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    f1b785f4c787 Merge tag 'for_linus' of git://git.kernel.org..
> git tree:       upstream
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1209e4c0580000

#syz test  upstream  master

--- x/net/ipv6/route.c
+++ y/net/ipv6/route.c
@@ -2258,7 +2258,7 @@ struct rt6_info *ip6_pol_route(struct ne
 
 			return rt;
 		}
-	} else {
+	} else if (res.nh) {
 		/* Get a percpu copy */
 		local_bh_disable();
 		rt = rt6_get_pcpu_route(&res);
--
