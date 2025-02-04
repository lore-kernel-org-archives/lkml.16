Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7F4685
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738628186; cv=none; b=Vj7UK188PJCPUHe8qLO2wG9N0tTz9x6xbvYhh2Xvb3EEtvhubmCkSyEBVEPFrJd7+r2QCC/the6ADTrMRBK2/OJozI+nrdggGlcSEt4JN4hnlNoYJe3SL9Q2mMLiJby/OrvzlvgLHkac56cJDXZ+BnU7cK4fbXlRX8dSB9xWrX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738628186; c=relaxed/simple;
	bh=x3gS99frbO3M11Kq2z2dRhi515gnUAm6Lo71grmzDu0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=rwLP8G9o4iLxsjee+p6IgAUXPa2EjlvFOTEX2kH2RuHDYnEvuDTLcodIqNC60yuiWlXwLUtB1FHGmofkw//Zc6aI14BxZC8RBk27JXkVQ8vYhhcNgYN9LZHJBGcvt2uxcgelnZ9OKd46z4BrulgEGp2RpWj/gk640WzsXQH4sBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VoywEpsJ; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VoywEpsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738628178; bh=7JuVwbOv+Wxcrn4rrht8Omq2HaXmH5QmyNGlBLnvpYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VoywEpsJd+L9vMx8ErB4kbwcZaMrkMlAPsaxTI17ARweY6eWgDl7Bv8O0f0PW+rL+
	 PuVctLc3MG7gPVDAplqFirYj4wVB7YJaA+2FwGaq+kVZcyyEPWArLIwN8Mb0+zK3FU
	 llw/sozTauIgQ3K9GCrssY94rLQL7NfDa7a3VEKg=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:82e5:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 2898529C; Tue, 04 Feb 2025 08:10:09 +0800
X-QQ-mid: xmsmtpt1738627809tdrrgi3q2
Message-ID: <tencent_38DDE8DD931974CFDA0DABA5B08DF9927907@qq.com>
X-QQ-XMAILINFO: NG7xP+P+sy64HopOds8Rw/+MDlgKz1Cm5+m6jg1f5kTuCGsfFECflR0ijs97B1
	 Mt85Eu/hDS144XomfnEU8Kat6nwRIURYRzIFCpKDc/z5oYzLY8hjqLY+nr6adBBE268ePbRgiuhK
	 ahE1xkhykJFk2pLMZJ9YtFbROYao/FGGX1HHm27HhaVeQBBJFF4QuHOZi6WPDVjAwRW11wXLMlFM
	 VkrCy217xpy59jYs4/VMhHoCLPRJXtbdhWsPETtvSS7Z/xmxLLGD1AQwWyhJzcDWo9yVaxYWIPK5
	 DkES/gdoOPHDNfy0jqn5rVyfnG98N6OfrjKMjn158y+XGAiP5oDIWJfLV+9paLYbqtXcPxrCJHkT
	 M7aUqT8Sta40M9LC4hFRx4DFvPzHQyMVBAG7SKYq4Ja5rPY2bdiVrj4ewPIu9GbE4rs9Dba7aCh1
	 FW7zyfvjvgK1OlR0qo95tM2XBDQdvg5ovMB3pUO4NLiR+Wjzm708uaxPSgs4/Dvs0Vsd4lLonu5U
	 TK2U0Cvumq1qfripMlLmhcbLQGg2S0F5tg/lBzfO1opKXnDo3OsyeGrHmbBq4wCbM3eKuLuvNHEF
	 F86wt2KJYswGCvWuFDnsD+oh/z9LT4/bj2Hww1kJ5/9JCCCm17nIzBcwD52gybwM1yHGVAwM+HBN
	 /53oTAJ9xKBBGC+LRHYJGLG5EJ3MWeMHdo33iXGucRbRPDv4W/5e6X8I+tcC1VfFga/Z2ar6T0Q+
	 TegcqUjif3C5ANGtf03mXCTZ4qneFr8YVZ4YJgq3RRHu6kmODiafcXCGOCuvl0i6Z8RWuv70abUc
	 uULnC632khLo5d8A9mPP1VBANwyZ19NndmziVj4PUaJbTvJ2/kmPvAoTsvqcDTFpYQP2YW4ikJyB
	 Iw7xXjjXWmdHsQ72PrZ+RWWxprtQsEKSbTkKKDrtG6
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+ab57f676a518849a8d57@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nilfs?] general protection fault in __d_unalias
Date: Tue,  4 Feb 2025 08:10:08 +0800
X-OQ-MSGID: <20250204001007.1575746-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <67a1111a.050a0220.d7c5a.00a4.GAE@google.com>
References: <67a1111a.050a0220.d7c5a.00a4.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/dcache.c b/fs/dcache.c
index 9cc0d47da321..96b21a47312e 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2966,11 +2966,11 @@ static int __d_unalias(struct dentry *dentry, struct dentry *alias)
 		goto out_err;
 	m2 = &alias->d_parent->d_inode->i_rwsem;
 out_unalias:
-	if (alias->d_op->d_unalias_trylock &&
+	if (alias->d_op && alias->d_op->d_unalias_trylock &&
 	    !alias->d_op->d_unalias_trylock(alias))
 		goto out_err;
 	__d_move(alias, dentry, false);
-	if (alias->d_op->d_unalias_unlock)
+	if (alias->d_op && alias->d_op->d_unalias_unlock)
 		alias->d_op->d_unalias_unlock(alias);
 	ret = 0;
 out_err:

