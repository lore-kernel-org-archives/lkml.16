Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209D21A458
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008374; cv=none; b=Sy+nEjqhCb4WsnIQc7Bbqz49d0fF5idq9dDXx0erpL0bBr7zPspcCASc7M0/seQd8ey6LhtraldV6JnKzxPDdOxWUh1rLjynY3FMIJMb7Z11UE3VyHPhdrmxqj8sqW2wQzcXLBKTxpDBIETCMLTZCf+2jwljalHt8Nqg8zxISx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008374; c=relaxed/simple;
	bh=anS6IR/rORgqvGhmAJhuM1m54YWHaH4FKndWzKt2pnI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=r8PFlcMCpFFfeOswFLb8jgS/ZC3bbTAhzyPGtVF/9Ben8NeTrR3f8BjaTOGSlpBKVhWv2WaKEpXbvMZkztbcObYWJBtIlyDT9RDUVhE2Xxglwig9rE8pB500vrhIsSYa/1+6UvfXkHeuWfpReb0e6yR4nYzh9rQ9BTiWrG6cGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cdbrnRFQ; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cdbrnRFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746008366; bh=MhJYYMhQTwnWneZl80azA+7oLTlnJBM1TLl9zR660cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cdbrnRFQ+Y6lNjqJi9dy2ZFWWq/RuxSna7hj4wUbk2S5MoLaqHs8Y2uSl1EdZFgXk
	 QG/aoEtYtn+nqa4IM5BHfoN5eiJBp+j9D2e5nPpB2CgJ6bft5gPnxJycWqcxbXD/c4
	 uyehxmOah8PxoxH+fqUtLNNS/dmqzJtunZMc+iyE=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 34F31C8A; Wed, 30 Apr 2025 18:13:15 +0800
X-QQ-mid: xmsmtpt1746007995tvgiruu1n
Message-ID: <tencent_001BC04BE01B3C2563BAA0BB1633DF9E7908@qq.com>
X-QQ-XMAILINFO: OLZvRd9spCyfVCvrXajqvTUupYn4TtGYwn05xgtLkpV8hUCUPjEQjtBPDsiO5P
	 LaPG6/TC62MATeqrzLw/q8cpHVfJXtSrrOOKabeF6WdnTjAr1llxVrHfB4OqXxgqXRw1JI9vrDK3
	 7Fxxz8KZrUbIUz4WN8Xw2MChsD/mtKyk/YqN/kkl/IHosYI75YR07SMaiW3mLAwmG/LLWRSpviMb
	 k9FtZ8d+u+uUS1fgMhcZq+9ADbLwuTkUna+Bpz6XAI8jfc0MxEe7jCty+EYhQm6Q5CIYaMHzj9nv
	 FF7IByrzF2HxcH8YnyC8hvjVR2sdS1BqSCQUwgTIfEn7ZvMCBE/GqUWuFpidaDaEOte0VdOEpig8
	 Va40jqyRLdLRUZonX9/34+s4f4l/tS3EgCB0zCYiSjniDBGBaORDmjAESYVt4Q7YVUHSLRN/rJcF
	 c29GivLNbs35hk1jT0/K8X56wvZ79CD1CFGXgSA35H+G4vG/C9x+i2OtAkaPlFhygjb90SJsFNlp
	 DLnRY1P1nFMF3FRLcY+buJKuEIxI5FJYgR0/njBOVS2EkXndNlqhQIat7ViNl0x1LVX3dBSnkP3M
	 avTQbxcxUPpdMdveATVIGUDdE5nIgWrgPslYVFR5jqMVtPMpuQSSQWHoU5+fZs3YMDmFws/SRVmw
	 M/bFuwpQmn5ozXQaJCBhhpz5tdOJWtI6RFAbqQ89wNju58CSOy26m1FCugZuo/d7WJW+GkxA7Yjg
	 +Xpiiz4uQfjEkXdp8Mldi9kv4q5cRvOTwKpz4svheDt50jmT4eGuvJ+eV7Jrytn6Z8k4NUENq5uD
	 QOCO3J+4vgRwxj8YOjSi4glFlUS8iuuu5mmYYC9ScVbhLiPzE60hfW5z7HrQzVuqak8S6PPyhY5R
	 qjQBuzICKbziQxmKq6+owXUrsCz/t8AWyJvdDHhhiTxSM8OC2wWy6BqzNMBdBhkIHGQVKqaFVH
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Wed, 30 Apr 2025 18:13:16 +0800
X-OQ-MSGID: <20250430101315.1527298-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
References: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 4246d168374f..1048a05fec5e 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1732,6 +1732,9 @@ int ieee80211_ibss_join(struct ieee80211_sub_if_data *sdata,
 		return -EOPNOTSUPP;
 	}
 
+	if (local->int_scan_req && !local->int_scan_req->n_channels)
+		return -EINVAL;
+
 	ret = cfg80211_chandef_dfs_required(local->hw.wiphy,
 					    &params->chandef,
 					    sdata->wdev.iftype);

