Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CD1EFF8E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320716; cv=none; b=plpq/E+RKKMUAqCH5czEmUVcy+dxXcG8szTzmMe8M/OCHBsHJm6Q4w63W31iniHUOKGWVrGlCLSLho7rMt4PVFWJOpc2J9739hWYmMSmAzdOgLAUjUUoQAVyWzhfXMCiYv4wBtOKSjII/hUIvWdKci8H+bwUNiaeCx97f3OEiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320716; c=relaxed/simple;
	bh=RKrVrv4Eu+iHztmw8GCYatnp1w2aoaBJW99cfagCW+0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=o/n+fy7ihDM2KEv4/DqIFx4WQaQgHTdkiz3KAOFXc8v7SEm13t/XAD1we3i5qGjMmXNzyyh24vCVscaQMFjfS/kvFhZUjWb5S9eY2gNHNojXdmeunOOWSki2c8+mxhb0ENGVaGklRsIlsriNg79v1KfJivP8ySh8B10Wm6as8rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d90a7e86f7so64900975ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745320714; x=1745925514;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/0mBeNeLfZnHsL0Tq11bZ+IRqMyT+i3mn7HuVjeeik=;
        b=cBUvq3c+abUEYaqbBVzHmqxPSlPXcQcVp+Zla/hqyvgV6kxgAvxTVnLnsCG56znXcM
         nNShJqVsdVraQHC11ul+kP3/tmckqS1ewIw16LQHBM3w/xzaL5/4FDaHKxffk1C+nZLh
         jPm4vMVWYKxw3Gab4WuVlo0KlpNPJQmRyZl2BsHGPIDI+2bSzQnzLyw1JTKHUHJOgl7o
         kD9t+DyOi2cbNnDUFoVgFYw5UCafitG1DwESJbJ27bmxwtsPmoS0yYb/O9FjCuporHLg
         95KVQ4P3tkVMG2FRXYpjNt9szyY44KzUhPxOQjo2or8tkQGX2Rz5hiI7Ue9q621OrD+N
         kUIg==
X-Gm-Message-State: AOJu0YwVYXK1QEMxCm9p1UINSwd8YSxijg/Vk+sFbYQuu5NpZ8wORp3z
	bbEp5929M5JeooruVwjiWZhG/YR4uvtUdoZjNYQad0o+KeooDoVad4ASwr8DnHnEYrzTkCv4h02
	iAZ9yLA08B2JJ+k+IIB/zXxYrtqljcKWTLrNIIS4YaXfCpTizgusrm1Y=
X-Google-Smtp-Source: AGHT+IG/LCz5hwX8EE1zvop26vCL0EztguM1Z0gT6uMRAGS4U5oROFF7iItsKiJn4eDaOEjab/7QFZ+lz6I/rWU8dMQs70RV+2m7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2785:b0:3d8:1e96:1f0 with SMTP id
 e9e14a558f8ab-3d88ee6540amr158629095ab.20.1745320714142; Tue, 22 Apr 2025
 04:18:34 -0700 (PDT)
Date: Tue, 22 Apr 2025 04:18:34 -0700
In-Reply-To: <000000000000f632ba05c3cb12c2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68077b0a.050a0220.8500a.000e.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] memory leak in cfg80211_inform_single_bss_frame_data
From: syzbot <syzbot+7a942657a255a9d9b18a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] memory leak in cfg80211_inform_single_bss_frame_data
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2772d7df3c93

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 net/wireless/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 8bf00caf5d29..d74215d3e3d2 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -2891,6 +2891,7 @@ cfg80211_inform_single_bss_frame_data(struct wiphy *wiphy,
 	return &res->pub;
 
 drop:
+	kfree(ies);
 	spin_unlock_bh(&rdev->bss_lock);
 	return NULL;
 }
-- 
2.43.0

