Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F094D8D1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514876; cv=none; b=Cwma+tkr3Vwow1VGgUpuKxB1PU8v/HywpkHkWyX0zImlD162MhPgE3GdSgcMaE5zFr+hOf6Ph7UiZ0Yu7X43dlGETHenv9CXfsNDmeWoCMdh6INZj2aNncvWShEqZWSEr9sTM63+DbAN2PCilkxTS/ABlJYXeUgAz58KN/uz7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514876; c=relaxed/simple;
	bh=un1Xix6a+HafmNoFi+XktPDoawJBRIZ1Wl14fRwALZ4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=j6rSiaOmXs2I7zeO15fpZZcjMdHVE2gEH/mOBDFxciXbYv4/dIfWuyC31n/xRBH+5LYQ7Cl/reOspb+vmiGCGvZP28962ZN5IzRDkShdmz0Mn/sENX+6e/nS1Scl+7xxqoDRdJmeaCMZVe0L35BlVA+yGZlFttC7rsQiV/ZdQwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=WzhEGxLf; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="WzhEGxLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743514863; bh=45+PyLUb0EtrTOlQLbC91djc159F0AGKCFfhMY0sLD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WzhEGxLfgTSyhl9L2Saamfzl6lCrlyxfhTNVVdOSULEpQJ0ikf0n2NtwApkbZX8rF
	 1hYWbYgAaEAuKhWxOpe6AOHMDJr2akDzKiXymCyRb18tvyyS7ZLJewnoj6ZDm/JgSr
	 FhG95RaTqDaohpAZvvbxbN/hTZjWsuYzOlXGWExQ=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 8B89C6B0; Tue, 01 Apr 2025 21:34:56 +0800
X-QQ-mid: xmsmtpt1743514496tykcnsaga
Message-ID: <tencent_CF4FA00DCAA5918DB7127CDDC95DBF190607@qq.com>
X-QQ-XMAILINFO: MY1pxEGI2wnpretFSWHEbZGv0K8XscjQu9LgdnlfY7LSX+AjBWuGlqZW4VVwSy
	 wr3Mq3LKi1x0AxWAzPxkPpKAPufkdhX2tpL/nHKyQZnxc6iH/PBQVCjx961M2PWoSwDMBCeMcqqm
	 EtwBx5QM2F97joJwHy+QfzPq5ia/RmbxzLMutayIBcmGgJSF4gCInltiy1KCnZPsWtCgT3CNt8kR
	 db0jwoOQnBpAqAphJLJwQEygIUXUEtwIFhBKH6511/5gJ161LQspC3EPO3/1XGF2f3s6Cxm475sF
	 RjNH/D0yJIGb/vsAp1TtMuX4PIyjr3elHZy4NIBgo+bURmAC5wxgRIGRLIsLvzRdG6BzW84whiWQ
	 pk2t3Xze6oQnJgV7PQ+/vDZghbHH+10VqdaMz2pa+vAikuZ3nWhRLeUecS8qlSo9yu2Mz255nSG0
	 6o6l1PYF3YThjOPxbDdXsuGmVNx/mUnW3/3bHGzrva0ZCNpNszkuRQLIH69jdmLziBSUWN0yMerI
	 NYhPZQILXe84GM9T3GgIylhXwscLI+Iu3b+1VQKiwbuI2zpzHozi3jzJUE1DrLUg1ymE5pB2GBP6
	 OMK6S/8q2SwBNzpFa9vYXvs82qXbW388Eyd4fsRoWVZRbQ4QgzjNerDYNej6K5UMdSZk+Rz38gLS
	 tM03AJe5FKUN4+x5FmLwd2x7a29RJ/1KLMULW90wyw1nL8lN0RHRQkysPQBwToDzsoUHGCBcpQAn
	 EgT9HvjE6H0+RLik4nM53SLVpT0MSekfmKY0Iz73amSpyJE5tb/QOoA+YdUT9T2KX61tFQnKmCnI
	 +olID6XlSl4l//YPaB2BZYLdFCkn5ClsSgqXkMz9mgvNAXfbliBrsjx1nMPKNq5tCOBW6XB3fUJ6
	 77HEWeGqm2GPkIVRXyXczyWAcjj1uQG9O11AHMCIOvDV6vVv9IeUEmmHq9LXQWEw31/ZyK3PiOMT
	 rjRyHMuBF1pYGvSxNIUg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5d83cecd003a369a9965@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [isdn4linux?] [nilfs?] INFO: task hung in mISDN_ioctl
Date: Tue,  1 Apr 2025 21:34:57 +0800
X-OQ-MSGID: <20250401133456.1584380-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67dad671.050a0220.2ca2c6.0197.GAE@google.com>
References: <67dad671.050a0220.2ca2c6.0197.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream a29967be967e

diff --git a/drivers/isdn/mISDN/timerdev.c b/drivers/isdn/mISDN/timerdev.c
index 7cfa8c61dba0..0c3771a5cd0b 100644
--- a/drivers/isdn/mISDN/timerdev.c
+++ b/drivers/isdn/mISDN/timerdev.c
@@ -238,8 +238,13 @@ mISDN_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			ret = id;
 			break;
 		}
-		if (put_user(id, (int __user *)arg))
+		if (!user_write_access_begin((int __user *)arg, sizeof(int))) {
 			ret = -EFAULT;
+			break;
+		}
+
+		unsafe_put_user(id, (int __user *)arg, Efault);
+		user_write_access_end();
 		break;
 	case IMDELTIMER:
 		if (get_user(id, (int __user *)arg)) {
@@ -255,8 +260,13 @@ mISDN_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	default:
 		ret = -EINVAL;
 	}
+out:
 	mutex_unlock(&mISDN_mutex);
 	return ret;
+Efault:
+	user_write_access_end();
+	ret = -EFAULT;
+	goto out;
 }
 
 static const struct file_operations mISDN_fops = {

