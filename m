Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F34A24
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 02:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743734113; cv=none; b=DgeNtlD9Bawmft3e1mnw0MomWOibFUyEyCsKfBDABidBhPTTlWUP1vJSoMBkt2VqaaZIp9JGywMKQxPcoJE9iVdh4rsO3G/Fw7hXFto6hCxGTKolFwDkzCiJLYfecYWN9MsTjLD4cRozqMhpif+x7a1kkGzzdrVCjgUkMLUI3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743734113; c=relaxed/simple;
	bh=cUb9lJFcVRBHoi99PcvkJ/HAUKbOOKbCQmYTxbDBKH8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=hKomIKSXJ4NrA6nPSGyM8GPv3fkDotmESGl9b55x1gwQbPgIuGRSug5jzc+kUX/QGTbqYnioq5Hipu60LY4mPLNVcwGwN2GSmdAA/ZSl+GIskVbwwu+nDJBVUjdz+c+pDMinWJSZGU1IjwlGx2HerT+lWbeuDoUDmJUfC5SQHDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dQ2BQW87; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dQ2BQW87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743734101; bh=hvd3XHUWKFzqNznWsNlLs79g79N4JWAw6rLpdToGI10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dQ2BQW870t55b9tQAK8IEf+jW+N2zB0eXmPQq18rpIhekuk3aVfUd1O9lVrQ/EesT
	 o/0EAmKpI9sw0RrEcFFAZaubHuaG5KS/LnFiABEEnt4qUnLasaDjJn8WIicEBiREKz
	 sOAQSfJWMjakI31WlFqqQbpnweq3Yx67X/x7N9t0=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 7308005F; Fri, 04 Apr 2025 10:28:48 +0800
X-QQ-mid: xmsmtpt1743733728t1asgeuls
Message-ID: <tencent_0AEAEC8ECFCC7A2E6CC02DC16FBC9410E80A@qq.com>
X-QQ-XMAILINFO: MHb/xMQb24GSP9fjNKMhr9leg6KoFRerK0odAJ6pZJFJplHLG+DwLO0wfl4O6d
	 mUf6qc24wtSH/vqNe6OZtDbXqdl/YeQvgk1dKXS8vW0X3E1qi+aeVLby8QOCONjm4MzT9SqYCiF/
	 3CbJuroUOnvIAq0bxltJb6dup5JsYorYT/OGUcwS1wkFbD94i5W32nO5WcZnNi2K50GnA6US5VDX
	 2lI1V8jzGWgEJMYYra1hJYaOAwVwYNW4AlwePvDOqSAiFHya3jk1g8XwJKuLgq0+/RnQASJs8M3T
	 wYqbXdpd4ELbihFdZNqtTRZoSaKWD7mD0uLCG7Xy5Ly5xuZLrmVy0wzb491pVobbc4l5LZOK3fDs
	 AyVqIzn65JMGync4w5V0kXceetjT1D97KviYOHO/lQrqI7FESf8xLPwzRfoTfFEkpFQzytkVk8Np
	 6Ur+FuUdQQdGLouHM7pRiHVaCG25IimJuncvDNc+BdiCwn3SHjkmRDHmTjPdUxWZBEd15d2iNxIG
	 6zV2+CN0s2eGNoaqNHnnOeaHkHLy59vAOHRusHmt7ICH7Q7ENSN3KRSxMGW8g8ZCNIvsexnmJuxq
	 tmfS04TbWy2hyXLscOyebFMteVWBf6daYWcJZ/+H/2JAHbaAo8C85PPzRmq9djCCStfEvDC+oz/h
	 +yQdvQA3jo8n7mO+bV9TW/yO9jubfPdi27i7BEYS6dJtWMuHq3/HmRaP7wDEo+O4Emjh0nBKfrJd
	 Be30zke8VYwSI1FujPTS8k0zEE/MOCANpCCfiAWO3IJ6H0RxNB16XlabCCrVr00KWw9BaS9E5LdU
	 8Af9U8WhcUpUPxJ4eaI6ndcC9k2RQEuZIIonAq1TcOg/REbaGD9HMicYWyUWOVoytCbIXVdra3kc
	 p1BRdYgvpUeYB27cVPMkgfGBJ8HjoLug==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4d7cd7dd0ce1aa8d5c65@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [isofs?] KASAN: slab-out-of-bounds Read in isofs_fh_to_parent
Date: Fri,  4 Apr 2025 10:28:49 +0800
X-OQ-MSGID: <20250404022848.2669935-2-eadavis@qq.com>
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

diff --git a/fs/fhandle.c b/fs/fhandle.c
index 3e092ae6d142..a31c0291a473 100644
--- a/fs/fhandle.c
+++ b/fs/fhandle.c
@@ -344,7 +344,7 @@ static int handle_to_path(int mountdirfd, struct file_handle __user *ufh,
 		goto out_path;
 	}
 	if ((f_handle.handle_bytes > MAX_HANDLE_SZ) ||
-	    (f_handle.handle_bytes == 0)) {
+	    (f_handle.handle_bytes < 16)) {
 		retval = -EINVAL;
 		goto out_path;
 	}

