Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D924C1F873E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751705107; cv=none; b=YLaaIYXheuNJxHDWbD+SZfazfVWVFjiL+84NpQQQr9EPwynA8dqpfO92PgdnLBsVRM1yesmP3f+iKpsALVaf2Wc2hmhTQwPVT6X2zdIdPH6eVSDIIF3u0zJGuPZBfkB9KHafTwYOBbnnZI1EqYia7j0v9pcOB/5eh5ieT7xaaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751705107; c=relaxed/simple;
	bh=UUXV81sgumXaDXGfaYFsE47+6DkH9yfMkv6JpIRT1jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iE322khN+krsuYVr50dmUhibLlYqZkxmKo1GlurIFSgLztR8iRkDiOjW/uVzq3xgN7DdqwjSWjeSkjo34p49/nsCJZYwwiyrn4G1IqANc5bjcJOU+VE6mmz4dpfdWlzwt4PY6qq+S2NMf5BeZMgLUbvIta2cdJsgjkS4Pl0i5Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=D71w7EZE; arc=none smtp.client-ip=202.108.3.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="D71w7EZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751705100;
	bh=e8R3JQWZibH1VdLIctS7Zf47cjKrdDSV6D1m4pB2QTs=;
	h=From:Subject:Date:Message-ID;
	b=D71w7EZEVOoOa6gpdm7sx57f4ffWHQv6vit+O+/dWvEwuOrHOZ5WxzKuPiBKyzaZP
	 u5cvWdY6/qcLiM2DJrdn7Bp9kjA86n3YAx3u9aBQF+KIJ69sKa/Dz5VcZKy0wx2iqS
	 NQ8ZP055LVPmLq3wIk3ep07BD6vXmKNkCQD5fNEU=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 6868E57100004563; Sat, 5 Jul 2025 16:42:26 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9898616291923
X-SMAIL-UIID: 19AD584468314064A34B977212CA94C6-20250705-164226-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>,
	Lizhi Xu <lizhi.xu@windriver.com>,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in qdisc_tree_reduce_backlog
Date: Sat,  5 Jul 2025 16:42:12 +0800
Message-ID: <20250705084214.2579-1-hdanton@sina.com>
In-Reply-To: <686764a5.a00a0220.c7b3.0013.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > Date: Thu, 03 Jul 2025 22:20:37 -0700
> > syzbot found the following issue on:
> > 
> > HEAD commit:    bd475eeaaf3c Merge branch '200GbE' of git://git.kernel.org..
> > git tree:       net
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=12f0b3d4580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
> > dashboard link: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164d8c8c580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14839ebc580000
> 
> Date: Fri, 4 Jul 2025 22:07:34 -0700 Cong Wang wrote:
> Maybe I didn't make it clear, I think Victor's patch also fixes this
> bug.
> 
> https://lore.kernel.org/netdev/20250704163422.160424-1-victor@mojatatu.com/
> 
> Can you check if you still see the crash with his fix?

#syz test

--- x/net/sched/sch_api.c
+++ y/net/sched/sch_api.c
@@ -336,17 +336,22 @@ out:
 	return q;
 }
 
-static struct Qdisc *qdisc_leaf(struct Qdisc *p, u32 classid)
+static struct Qdisc *qdisc_leaf(struct Qdisc *p, u32 classid,
+				struct netlink_ext_ack *extack)
 {
 	unsigned long cl;
 	const struct Qdisc_class_ops *cops = p->ops->cl_ops;
 
-	if (cops == NULL)
-		return NULL;
+	if (cops == NULL) {
+		NL_SET_ERR_MSG(extack, "Parent qdisc is not classful");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
 	cl = cops->find(p, classid);
 
-	if (cl == 0)
-		return NULL;
+	if (cl == 0) {
+		NL_SET_ERR_MSG(extack, "Specified class not found");
+		return ERR_PTR(-ENOENT);
+	}
 	return cops->leaf(p, cl);
 }
 
@@ -1490,16 +1495,20 @@ static int __tc_get_qdisc(struct sk_buff
 					NL_SET_ERR_MSG(extack, "Failed to find qdisc with specified classid");
 					return -ENOENT;
 				}
-				q = qdisc_leaf(p, clid);
+				q = qdisc_leaf(p, clid, extack);
 			} else if (dev_ingress_queue(dev)) {
 				q = rtnl_dereference(dev_ingress_queue(dev)->qdisc_sleeping);
 			}
 		} else {
 			q = rtnl_dereference(dev->qdisc);
 		}
-		if (!q) {
-			NL_SET_ERR_MSG(extack, "Cannot find specified qdisc on specified device");
-			return -ENOENT;
+		if (IS_ERR_OR_NULL(q)) {
+			if (!q) {
+				NL_SET_ERR_MSG(extack,
+					       "Cannot find specified qdisc on specified device");
+				return -ENOENT;
+			}
+			return PTR_ERR(q);
 		}
 
 		if (tcm->tcm_handle && q->handle != tcm->tcm_handle) {
@@ -1602,7 +1611,9 @@ static int __tc_modify_qdisc(struct sk_b
 					NL_SET_ERR_MSG(extack, "Failed to find specified qdisc");
 					return -ENOENT;
 				}
-				q = qdisc_leaf(p, clid);
+				q = qdisc_leaf(p, clid, extack);
+				if (IS_ERR(q))
+					return PTR_ERR(q);
 			} else if (dev_ingress_queue_create(dev)) {
 				q = rtnl_dereference(dev_ingress_queue(dev)->qdisc_sleeping);
 			}
--
