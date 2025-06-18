Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BAA1854
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214086; cv=none; b=MkAsPvI3sxed0WiJLqj4ZpIs5AaXdGSfhhL2QcxHvr4UCgiiLB3jleU39NwFeO1F9p7j/OkBdfOeWUm9TTOZZ50rdujXhTov8wS6kAYV6Kot6pWU2i9QBU6W7Epj9VYiBCAicSc4c8K8lSKylW9JuDLHJjt6xAv9gqeD93cPKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214086; c=relaxed/simple;
	bh=ONgsSjcf0Ph7NvUL/sFpUXeF9RhPxG1ddOiPgnS3bbU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=hCeZ1zzT1ncijU0hOVniPIxldIoK/SsaK2opixXfzJYD/nmEBnq6YR088v6+GLH/mVnzzrGtg15ClVQeGSzazDiY73uHzEOpIzflkGObVZCfbpLBSbVoHiZsu025sUIXaerc7q7+kJZYH78BNjkJb933Rd7USEdGXjB2u2RgUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=n5WH8/0G; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="n5WH8/0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750214071; bh=qVRWt0bjnSRHcquObKyeG8x10x+1fVWd4QKTrfLo0lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n5WH8/0GDGtp+0mS2QSiLlhlfRuoknFhFXP6c9BLMPJEX4IGoR06hZmPhpMfcP2r3
	 gahOsf6zpIDmtHGByO+UzyKsrMErhlR+T8/FQF9gTue3gTpqBRIRDNlLCWNA0oNZVa
	 gPozghNesAEClcIScmoo7Q2SiUDhY9nvZhqT6Jh4=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 8502345A; Wed, 18 Jun 2025 10:33:16 +0800
X-QQ-mid: xmsmtpt1750213996t4qgbhg8y
Message-ID: <tencent_FC196E4F848DEF25B88DCB12125D96DD9307@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYS34szix4HX+Eq0s93HCcaXAs3XuSPWyacaRgsl6DErZThJpqk/5
	 UeDyUoom58ZUELDFB2wIc/smUCDiAZiGdOidSlqm5CC4QppXr8IyM2D1gAIYHEmrhDyUqPybWEnB
	 BjS1ojh+0USi7PqiGxHNFcR0i5jZvQtche7I0nZ2c6wWjspcpr4Pz88eKySLR0JIeU/snczOP01D
	 Ro5pTRz/Xen0ZCqS1CTFTxU9ocVZRqWIkx14cfoKdUFsSdtIljRA4cVzyZ+aXEYpiZWZdRlNY/Vo
	 he50SjK1v6dAzstkt33muRQ/gmx8IPuGx3eTY+vftKF958TSTU0ke44ajdIKnuWaU7GbRK6Yci3A
	 tehQGw83gNUII7S0UjjCB5U4VomvaLVQoEI7V1COV7/UbL7dUrKFp+gzKwu6ktYU7ukONGnR6M7X
	 UWl5GFHvJvgCRaTw12EHtj3F8guYj/wK4FBxMMJvO3akzeCyELakbqlzqyOZ9goya/tYauJTSSm4
	 sBO8NoHKfZiYdkoafnVV/2V+dSCa3zAebyVa8WBziYFlPy1Vlt7xioAOu52Q4u6QN75k+s67HYOO
	 TN/eMah/AX38PWH8XkVGUm+eP44yr7Vw2rCY1KHAw1VCPSp49Zdk7+yAppCso35TLWsb4810t3NY
	 e+2oD3UUqVOCv7TuP3X/+mfmU72vwsZO0KsTMD5fHAAwWMdSjIe7T8svnc8sMMocjjcQVKMYiViE
	 OcCpFFgKPpq7FnPkwwLWsZIOpXD1jV44v3v0r4NExVGOtpjVdMKNUBtfYrfxOR1isjl9tNPnV82n
	 LsOLaU9OQIUbyUdrAeMg5xTZs5/Bh/eTgg1VskecmolQYByoBg6p8EL4CgQdopqstEznAoSDa6ER
	 I6BC1FYbm3sffVuFFhl1n3QmJQ04g97DISxfTpbGzXTISO43H+c/ah5ds6dqlfQwhLd4xQU03t
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] general protection fault in pick_link (2)
Date: Wed, 18 Jun 2025 10:33:16 +0800
X-OQ-MSGID: <20250618023315.1082693-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <685120d8.a70a0220.395abc.0204.GAE@google.com>
References: <685120d8.a70a0220.395abc.0204.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/namei.c b/fs/namei.c
index 4bb889fc980b..291f29a04e09 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2005,6 +2005,10 @@ static const char *step_into(struct nameidata *nd, int flags,
 		if (path.mnt == nd->path.mnt)
 			mntget(path.mnt);
 	}
+
+	if (inode && !S_ISLINK(inode->mode))
+		return NULL;
+
 	return pick_link(nd, &path, inode, flags);
 }
 

