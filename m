Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0D48CFC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947547; cv=none; b=Z32FwV31kDyIvBeLPWn2teipKaot4009Culq1SMpAFmtHLQ3HdJ3bbRic871rm0HWMWonDx3r/yiEoYb+wjgaUOXIGkisx3l93xkHPhOJm02v+PzIhPssv7q36xnUCVZfNg/B9/a0Su2rktxMlrawZhPILoWcxHj6pPlcy9hofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947547; c=relaxed/simple;
	bh=HZEzg3Q2bjSrdQvPDm1yk3ZDCLzFX3UJlJoxfh9exJ8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=qWq/szZox7Vn+bSQfdE76CLrN+2lDqoKOCPADZu4Ktz5owuEfDFFAR0CSjryZwaXYAbGg18xA9zMakXpxhLa2nU9+1sS74lUwqcteGjdDPz81v9AN7ZtDWCaOI5s5aOKTXlsJl50o186ds+esBZ0cjV9/GTXcqOjjgZCgFrXoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=fdyAu5v3; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="fdyAu5v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750947234; bh=ewOYaFn/YbNsNyAVYZ0rM7QtjbVbZw6+tIkpAJTQ4YY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fdyAu5v3cbDRidA/ekmxk977wNq6wnJz4chxw8VnsBBgrps+zius5C7zaCZQc4iMr
	 bxtZkfLNTo7bTsOmss1+wiCgouZps8Gica9CuSw+sVC7ayKMkukh0Qva4xyzCa/qs/
	 rOU/snv245A7/82i2xxbLBrphSYoVgnJ01kvpWzg=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 3742FE1E; Thu, 26 Jun 2025 22:13:52 +0800
X-QQ-mid: xmsmtpt1750947232tfjokjh5w
Message-ID: <tencent_26A1A453D76CD76066C3D37FE3604966C305@qq.com>
X-QQ-XMAILINFO: NMCsm0XXqhsSLFjjIbf8u8tnweg87YwJ/AfR34YK+YBGYYigKaN9OEOVwxtEje
	 jdL7rGpcUfz9wBXtC5zFSlso+xBNEqKM+cw9b+i3Eb8+zApZZkWL0RsFDkjLiLbWIoW+l/ELWBgp
	 RNEcmV4l5Jty1yMqJeNuj+zWlP9yw+dxAGH7UCsZ25SfdC9k1ShwwHO8+T7qpWTqztkWxydkLeWP
	 A9V8xzZBozWFRMC/XymVA1FiZ7MjgSzcE5OXGsptjDMxUZA15JOm0EmnGyZP9IIFRopK0qH2yxiZ
	 1GX+ZULyJ+zk9oY8a79IFU5vN+UQlCw/vDdWoEqeiZdHysp/XWtp6bqxsJ+mUkN9L8NE1rafXzLE
	 wR7SdG3iFRwum/tGltJWo5Vvcyhdbf9F68t/Tudz/vdk6I++xrdaOIfeUNVkuF+Fi6p46cTTwBdS
	 Kwe85fc60nK7WU1pjW9CQamwW+9Nov1tuuNTfSaR2r/g0rndF6NTOtnyh6H1p/c+ilHu754iffSH
	 MxRBJ16DuoiSEj4E9AkbuoDUSSZ9f914rhJC+J5g9VNHr3c9avecCVEtEM6U+zufcilEILbqPUgr
	 RN4+RN+swq6MSpNXmzSGF3vdCPnnawRW63DN7TIJJfMWK9rzin/HpWIVaEXpMzObTKmxcLDBhLnf
	 0ypZZZ+0IEDmVS1RUOMId5MGQiVQtdPwPglGT4ppI5pA4qyTsJeKE7eShCzSnYZYIKmHYoqD+26K
	 jci1K+C+bgxmXg0pDf++HAFibRcWj1dM6cglWehPUIQ1Ig+LHrfRYqIBtXLkahfCV3v0RSQwHHpL
	 IMt6P4+sdd8blIRSminKCvokgMMGh7yaSjv7JR2q9VKhFA7TwG4XNM9PffcsHb6SILNjGpOWqkD4
	 +exSyDOq7LUoYk+0J5poBuCvSqUpqnEc2tSQ6LDi22tqNWCTBVO47Gn7FKtHZZMJKqTs9EH8Tpcz
	 bJmrRFqd4=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
Date: Thu, 26 Jun 2025 22:13:50 +0800
X-OQ-MSGID: <20250626141349.1360680-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
References: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..cf49d5c78805 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -331,7 +331,6 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 		return -EINVAL;
 	}
 
-	spin_lock_bh(&nr_node_list_lock);
 	nr_node_lock(nr_node);
 	for (i = 0; i < nr_node->count; i++) {
 		if (nr_node->routes[i].neighbour == nr_neigh) {
@@ -360,14 +359,12 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 				nr_node_put(nr_node);
 			}
 			nr_node_unlock(nr_node);
-			spin_unlock_bh(&nr_node_list_lock);
 
 			return 0;
 		}
 	}
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
-	spin_unlock_bh(&nr_node_list_lock);
 	nr_node_put(nr_node);
 
 	return -EINVAL;

