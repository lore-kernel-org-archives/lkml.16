Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68718AFC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743741648; cv=none; b=Wv+4GUZZhthQ1YwHOWMLHCOVrp+RUAHba0a9RVe5n8GyRp24c+q6RfPO9e5seGki+nsF6FKN+Hpe4cxljQLbhpOBUWDesObyz3MqdnxSvTYHsr5GVuuWZeKNmL5nB+8yMwg4NULa2MHbYbwY8HPpf+A/Fed9rC0pdFnx27rRTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743741648; c=relaxed/simple;
	bh=joLNCGs9RdPNcetlhhWzsqwqlccBc9pRXgu1cMQnAB0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pk7kMbJum5Vm6gpeMGB0vDREs0tfuKnKZfzRDZL5vvo+OgZg7XkEV8LOhAucggdKX2MsdAGABjdTcuf5CebtEwMNdgFRktZgknwhjYjsxJyldZf5eU88/muedZwihvNul+s1kWdye5Wh2E9GSNZavgLpcDRKnl6tlXnqifHEp84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=neRPTkah; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="neRPTkah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743741635; bh=ss48TjMuMWY2ShPP9Gvt/DjqDAuFy3JERqYNmAMPzfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=neRPTkahVFIjoyJ/A3f4cy+ngVwZI11wgcCVtmLx+1p6qsSw4pXnjDJf16Ta0MWrq
	 5ucsD0KgM+14+bjDJdUuVqjywsJ8TvwETCd+SWB2yaiH9a2/ckN/8kLp/yWznxr5aO
	 u6NsOXuyD6Q3HRLkOZSCdmz4jEV+YA5oP9Wlf9Ow=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id A2192AB4; Fri, 04 Apr 2025 12:40:33 +0800
X-QQ-mid: xmsmtpt1743741633tveurnlja
Message-ID: <tencent_10224B011B9C25D1BA48BB9033BC9EF71B08@qq.com>
X-QQ-XMAILINFO: MprdIpiwXvQIWjbmZJRtfkY8Kvi8bGDJcON+OXsv375ewEaHjTQcYMzUq7swo/
	 rLAyAzHnX1neDH6OtujhPvwsRR9dUSb6o4iMnWRLUCPFWi2l+IHI7DJTG0T7526OTEOT0FH1K7pi
	 5x8zvbf9fobAkh3c9GSgBf5Xcr+QEbIGLVEijvt/IFqiFAR6enK3QCOns2V2len33tCk4ibUYBNK
	 1Oq4omBEArB0O4AeBWCrMOMcDmZu7LhdkgGDaMKj3DQN34FbxO6eBJhzfC9t4JBPuREUxY+bhVGI
	 N89t4HQDImbdSApDoDnHmHf9/FkcTdtNmHYRlhI4wwTDV36VuY+sCZ22EYscU2PBPZoXec+3hVGX
	 XDPDfJcQ//NCENQ4exh9Gcx49lLT3CyGKNu216wJ6YkR8t8gE8TelOkqNhiSv63lFmWOiwvdEAnF
	 4+UtSC5Jg0aDgjUhZ+PT/QO7kVm8fhNx04kLLqqhVAhD+f9sksuBb6E5sKGqbYLp+7Pjxan6s+aO
	 v+JXOeznsAAVNuAPMmTXhJsv7dqnkPEBEmKxMStcy5DhFSL8ep2W19oNJoPtgOa1biNf8xgs0wDM
	 xrZY6u8RI9HLlGRAOr3AVYo4+g2zlPEWZOLygApa+xEgLpX5Aq6/Efr5td8RhTxEKt4nzsJ+Gvoj
	 PCxRY1+FJJbsqIkh95AWQCJlAgrmHJLdW/34NCrzEhgmkQbsorjSO9bPcaB0jx4s4cATAqn2stz3
	 E3K05i4DNxQl6NmQ8PcELWGLTS15JYmRe8apC6ks7DIoRli/05vbjLQB03sf4RH7ncZoCzmN/9qb
	 9y/GwTr93sDd+veg0iyqtQA2zGLnzW0Ih7mJjqr/OaA27VbRQns/witSrPU5PynWTlWH+KWe3TSP
	 9fu5j3DICs4Bqj4NEfEogjdYw5/OPZaDoQvOY3TCAKo5uJCWsL0Wk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [isofs?] KASAN: slab-out-of-bounds Read in isofs_fh_to_parent
Date: Fri,  4 Apr 2025 12:40:34 +0800
X-OQ-MSGID: <20250404044033.2754461-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67eee51c.050a0220.9040b.0240.GAE@google.com>
References: <67eee51c.050a0220.9040b.0240.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/isofs/export.c b/fs/isofs/export.c
index 35768a63fb1d..421d247fae52 100644
--- a/fs/isofs/export.c
+++ b/fs/isofs/export.c
@@ -180,7 +180,7 @@ static struct dentry *isofs_fh_to_parent(struct super_block *sb,
 		return NULL;
 
 	return isofs_export_iget(sb,
-			fh_len > 2 ? ifid->parent_block : 0,
+			fh_len > 3 ? ifid->parent_block : 0,
 			ifid->parent_offset,
 			fh_len > 4 ? ifid->parent_generation : 0);
 }

