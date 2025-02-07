Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70401AAA32
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919449; cv=none; b=hWT/KRzKyxUaRFjndK7IQkK0g/WqbJ/doSkm1hWbKgmJ8n5C80IvLPhxhPNfoxNosajOa36/NOsqkOzaJiQp9d+tC7+ac+RKj0h8NOSNhx7uUIZtUmcdrkpTyRfHagSSETrPikveMU2VE0zBrFkn8z9Myrv57pzUc6i0Rq/bIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919449; c=relaxed/simple;
	bh=mbtf9veYrCrRfgqvsdsnXp9xr2jROJgHfnuNE3rNgVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rROg5TUzSFyGqq/+NgXvKnBNRsyyu73j6eleYOFvP2ZegtOmWwEqDpI+4zfMkGgpZvh/rHdXbcynaO4+KLJi/e8yuLcxJEnsREbgQj4TlzTNBM6jLzc46KVmSmFa2KB3UVCmWVPuNRU5R77PHYoIDRdBS7SZxPyLfKCsFUmvDrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 65707b36e53311efa216b1d71e6e1362-20250207
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2b2a8b4e-fd63-4ec3-9d9c-e40751c4ef64,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:32070fd612449c795101787b03f42054,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|50,EDM:-3,
	IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 65707b36e53311efa216b1d71e6e1362-20250207
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <luyun@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1433802465; Fri, 07 Feb 2025 17:10:37 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id D66A1B807587;
	Fri,  7 Feb 2025 17:10:36 +0800 (CST)
X-ns-mid: postfix-67A5CE0C-738044576
Received: from localhost.localdomain (unknown [10.42.43.204])
	by node2.com.cn (NSMail) with ESMTPA id 9CA08B807587;
	Fri,  7 Feb 2025 09:10:35 +0000 (UTC)
From: Yun Lu <luyun@kylinos.cn>
To: syzbot+882589c97d51a9de68eb@syzkaller.appspotmail.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in mas_preallocate (2)
Date: Fri,  7 Feb 2025 17:10:34 +0800
Message-Id: <20250207091034.3303042-1-luyun@kylinos.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <6756b479.050a0220.a30f1.0196.GAE@google.com>
References: <6756b479.050a0220.a30f1.0196.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master

Signed-off-by: Yun Lu <luyun@kylinos.cn>
---

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index a68e17891b0b..7d3769e0ac0b 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -104,6 +104,7 @@ struct taprio_sched {
 	u32 max_sdu[TC_MAX_QUEUE]; /* save info from the user */
 	u32 fp[TC_QOPT_MAX_QUEUE]; /* only for dump and offloading */
 	u32 txtime_delay;
+	ktime_t offset;
 };
=20
 struct __tc_taprio_qopt_offload {
@@ -170,6 +171,19 @@ static ktime_t sched_base_time(const struct sched_ga=
te_list *sched)
 	return ns_to_ktime(sched->base_time);
 }
=20
+static ktime_t taprio_get_offset(const struct taprio_sched *q)
+{
+	enum tk_offsets tk_offset =3D READ_ONCE(q->tk_offset);
+	ktime_t time =3D ktime_get();
+
+	switch (tk_offset) {
+	case TK_OFFS_MAX:
+		return 0;
+	default:
+		return ktime_sub_ns(ktime_mono_to_any(time, tk_offset), time);
+	}
+}
+
 static ktime_t taprio_mono_to_any(const struct taprio_sched *q, ktime_t =
mono)
 {
 	/* This pairs with WRITE_ONCE() in taprio_parse_clockid() */
@@ -918,6 +932,7 @@ static enum hrtimer_restart advance_sched(struct hrti=
mer *timer)
 	int num_tc =3D netdev_get_num_tc(dev);
 	struct sched_entry *entry, *next;
 	struct Qdisc *sch =3D q->root;
+	ktime_t now_offset =3D taprio_get_offset(q);
 	ktime_t end_time;
 	int tc;
=20
@@ -957,6 +972,14 @@ static enum hrtimer_restart advance_sched(struct hrt=
imer *timer)
 	end_time =3D ktime_add_ns(entry->end_time, next->interval);
 	end_time =3D min_t(ktime_t, end_time, oper->cycle_end_time);
=20
+	if (q->offset !=3D now_offset) {
+		ktime_t diff =3D ktime_sub_ns(now_offset, q->offset);
+
+		end_time =3D ktime_add_ns(end_time, diff);
+		oper->cycle_end_time =3D ktime_add_ns(oper->cycle_end_time, diff);
+		q->offset =3D now_offset;
+	}
+
 	for (tc =3D 0; tc < num_tc; tc++) {
 		if (next->gate_duration[tc] =3D=3D oper->cycle_time)
 			next->gate_close_time[tc] =3D KTIME_MAX;
@@ -1207,6 +1230,7 @@ static int taprio_get_start_time(struct Qdisc *sch,
=20
 	base =3D sched_base_time(sched);
 	now =3D taprio_get_time(q);
+	q->offset =3D taprio_get_offset(q);
=20
 	if (ktime_after(base, now)) {
 		*start =3D base;
