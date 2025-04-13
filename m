Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9551494A8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 05:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744522887; cv=none; b=QpUBevrczqCvKSJiEvViPF2IIQgRglaarrhwalRjRlOyYnG5hlB5MPzJImVR6gfMiqYFF8ZnqvWooJy5hTth4ytyNWAjgvTHeqJLr+sbVq4Y7Fyzu7Mte85yZm0TWTjF1MolTeg/0Gf0SmE0Oef16dyOq+TENGX7plkBUIQOtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744522887; c=relaxed/simple;
	bh=KNFuWARQCr02Ie4DHc2A0sCAPiSD72nZSsjtpgwyhgQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=LzqwXtx5MpN8BGQiAnotFX9gq6AOObAhw6PVDMT6lk7S9kGapIOlI90YJ0K36y+Q2v+63KTaHaNOlgHQhosfUQ2zWDb0rxOCflEgojcrEioZIES+m4OE/Y0TXfcfVCsfsNdJr8abnbYaCMThVnkfVzXS2M+bGOW9zOLJJmB+R90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cSc3PP40; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cSc3PP40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744522881; bh=Ix70RlTZArVn4D3n7Wq3lhRc0QoaN1a+PzFO+JqgFs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cSc3PP40Vmh8YBSOSvDyhG5yPidc2Uv58+tDf+y8l/Cc9HuxDecICC3hCZ22+l6n8
	 r08ToBfeMKV3eyeEZC6Sbeth+9lBKOR08wOQpKdBJIG4IQlJsHAdzolT50sB4kk0Jr
	 plZypWM8KXLZVWeT/POtTSnEYiL+wMxAuirjs2vQ=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id A5381833; Sun, 13 Apr 2025 13:41:19 +0800
X-QQ-mid: xmsmtpt1744522879tijsmnsuz
Message-ID: <tencent_A80EBA44BB6A33409E3D1B2E4B181B772508@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmaMhdzEeLiWJO3VFHw+5Vey21/WLkYgVosXZXKAC7AHDNZTN1BdH
	 imobEr5nLXWpVmV5+R4J1MVkgmGwiHAyUQQpiL265y4YrFcf//gu83JFKliyapJs9D6arAfhmu2z
	 XtN6CQTYb3SKmhUTofe0DDDzjBULoHDM3kORa0sA0nIrOdFOH7Npb7JiC4SvSCVd/69cblUMJmS6
	 Gq2tviemYVcfKc4q04TTpwfUrxCo+3aJWvGtIYBhVu+HOnylt74XGeSXHqGl1Isz5oqPIXhAooPb
	 GRGr2B2mODbHn6Cj4lcX+u2f0jA8UPib/+5MZV6r7OGkbVcXhhTq3kpWBCuPZ3eXgagbYXuGmLXY
	 GyckY1L2ct9sKOPlp6/PQK0Aa57iuJcBV6VqYyFMfaRjJY6IsEVn+MSB/3MAlfzWFqc2dejvnGuY
	 g78fO+sFaiV9cazc+bAcYhNtp0dR9zxw6yL0gex45daVL+mBjFlMW7ebChxGlhT3KDqOB3YO7MzI
	 W7N+En7MB7ntMoZRl+J1KGz8a9V+8nZK5q7TX+N9T4WM2GWP7oDEly71uV/4wM/4gA5/haL84f8V
	 9i42BfTCGTDq7dAYe3v0mNAE8xC08/tfIrDQtGBh0K5vm6MmyjnSpOrDOM2tvyYJu0eJnDfY1ymc
	 fFOffx7h6CmArEPcksZ9RST6UmQMKat6ma2pGGi4ONk9+i6UaCVOiKyxxIJuTNNsj2Tpw7eHc6ob
	 gG0h+RdQ7eHxlPRvy8JHr/fb9vfRsTfbP1k6ZinaV9P9ZF/NaT9JFogSrtnyL/8Ix9og/9ROyFwj
	 UZ2P85ycrSLf4vI4zdjTwU1Iloz82NxGBiNiYAGL8LvLk4do41ywhqmw4s/n6+CaxNBsfYBd/2ye
	 gTLrk/b4FrD3nsMMmt59gXhkbUYB0oYPEtNqFJM6gcfA8CyX/+cGk=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: unable to handle kernel paging request in afs_put_vlserverlist
Date: Sun, 13 Apr 2025 13:41:20 +0800
X-OQ-MSGID: <20250413054119.154915-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67fb3265.050a0220.2c5fcf.001a.GAE@google.com>
References: <67fb3265.050a0220.2c5fcf.001a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 0168bbf53fe0..f31359922e98 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -177,6 +177,7 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 					      VL_SERVICE, AFS_VL_PORT);
 		if (IS_ERR(vllist)) {
 			ret = PTR_ERR(vllist);
+			vllist = NULL;
 			goto parse_failed;
 		}
 

