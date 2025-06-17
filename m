Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D62367D6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129320; cv=none; b=FSB2mr/mQGu/vGi4JRmy04ExzlX3/izBcfidopGUqrhvk+WQvXFxoljc2bma2gXTn0fpzbQDnYap3QTBTt1iUv1CrOEufrGjRi/2/LIh4KAFCt5fcm8WlubFl6zrgc3JupeDEHVY246EGyIDgTa8ks9tImm9YM8obqVTyYmSFXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129320; c=relaxed/simple;
	bh=FluFUbIhgW0N4cV42EwBtmWDZUdkBAR21OMyWiyu60M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Kf9srzW/k7hTvQXIiQ7HlKp0AlgatDs4OGV9ipm55DJ84EAotZdz3XahQTwqn37AEqczb1qrritkyw1WIIW6c9xPKn9DvmnRABB/SI3PDLsTfB/fWo285QkMQdwoXg4PVORWBWegGZ3LFO3YN+Zh1gElBrnOi953LGvcmn/X2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=k+aqjzEx; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="k+aqjzEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750129311; bh=XgElssdpQZBBiI6QmrIGkJlgldIl+gNW3Y/6l23QC4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k+aqjzExq6UT0svzpwsx4YZhoIU6Ef4wO31TNffw/1r0Hpenos1cRp+W8UtFRrYEL
	 UCl8XB7Ss9VIrFTBlxuSEwNXG4Bf+R0vnDKrnkv45sqjCn8yVTGh4bpuMMyP6utQsJ
	 JSiVRf57gMkO0A9f6f0u7LkyuUHMYjQIhxmn3N/k=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 721DA46; Tue, 17 Jun 2025 11:01:50 +0800
X-QQ-mid: xmsmtpt1750129310tk36w2m0w
Message-ID: <tencent_6BBB12330F9EEB1B9A4B791B262506BA6708@qq.com>
X-QQ-XMAILINFO: NSmesZGuqQTYUrQYMmiTAPrxaeIEO9Gi8hvbtgVYBh9FBaTNRMHl9U1O9j6nwX
	 oE86RUxXtiWDL5U95tjYSnhOeNRqoF9eJXXYTxPt4lvYEQqijEwrSTwhK5WGto6at/bgkrElUd24
	 S6V3C5nhy496sOdCY+njDwzdgrlRta86PzwXytwU+hoUKrsKpo/Gpb1pLKooAmOsoPXazkB4ZMi9
	 BR9flKOKJYKyczCRFTCoV0LPWt0a6AL9mMQR08WOO0JSgkkn6Ffif7z+QvxzgM5IquC/J0acCJ46
	 ce2kv6It5EW1LWWrifYgwCxKtkxU/P57ZP/FAt1dQj5Tda89Xj/OKg/h7gXxLnkBYnbrUeXc5Z0O
	 Ie04N85Ro1qjWnVg/Qm9YmkkpiHX2xsjwyK/32iYP7piKC4eacTXm8dM3gAoiJYxvgMSrs3IPaf0
	 cKCH9PKyVyULpaMVFMcDXBjGqyM27g70h6PubTnAGRfziCMvQz4+BWADUZ3Fk9wgFNCHKQsORanb
	 kHosizUexCMdofHwLL/cncrs+IvJwrhvsTX7+W8Gct1flUNHN0iYlBYzaLZ1KVRcgljDJI8NZFUw
	 6Yj9pwu99lAs5ExpROr28OdAlz2N0RD/xvm51pGRuI3lVb89BQyu4m3pn4syKGNzeqWZchX2uqRF
	 SBCc0QcFVQ399Xlwvt/XTy46Kogk1lWO8G1oVU0PWBOPy4bh1l1Z6uIemcV2nNi1E6B+wJ488P91
	 TXzmFILzKwLscR1OEYVltb2c01OJ566qQUaqjMb1POCk/aWU6XntSJLEdDOt3AYm6ALH8grDihat
	 SHsaU5IIDmhOErySf+MYF0gQIZQegbi5HAO1YpFrO2nowd99xurfh3VAPqrkAlYF4G0sGN1mG41s
	 036jJbUfp4BwcU5ol07YP587mbPXviAlo4TT9nIsFsPRL9L9bzUBH6RQIU9dm7j92yAYiCByr7Ff
	 mIUSA340Y=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [jfs?] WARNING: fs/jfs/jfs_dmap.c:LINE at dbAdjTree, CPU: jfsCommit/NUM
Date: Tue, 17 Jun 2025 11:01:50 +0800
X-OQ-MSGID: <20250617030149.318100-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6850d37f.a70a0220.395abc.01f9.GAE@google.com>
References: <6850d37f.a70a0220.395abc.01f9.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 35e063c9f3a4..7e3c5f6826d8 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2856,9 +2856,13 @@ static int dbJoin(dmtree_t *tp, int leafno, int newval, bool is_ctl)
 static void dbAdjTree(dmtree_t *tp, int leafno, int newval, bool is_ctl)
 {
 	int lp, pp, k;
-	int max, size;
+	int max, size, max_idx;
 
 	size = is_ctl ? CTLTREESIZE : TREESIZE;
+	max_idx = is_ctl ? LPERCTL : LPERDMAP;
+
+	if (le32_to_cpu(tp->dmt_leafidx) >= max_idx)
+		return;
 
 	/* pick up the index of the leaf for this leafno.
 	 */

