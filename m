Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B01FC0E3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665836; cv=none; b=OJbFAPtdBcU+6pcue/zBe0AhG+Q+tkqvoiiojaQJKgDteF+xTryAurk07aGjNH62B+nQRpX7NK4M8IvCtlR858qn/zfNloBfj1f5EoNwCpO6ENLtb8m9zqLzHM6m7wjK/hAoKBTdP9yA3fxgg//nFp9GmhGWat+kkGnJkhAhNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665836; c=relaxed/simple;
	bh=Kkp1NuYRKEzbQMR2D07L6XhZKTIBXzdR4HYW4ZgNdsc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dBnVLfp6Cw/P9LoPhhg+6AnJCD1NRWA1L51xxasMvpE6FU7Dyrdg3Z3Jz0oZwdhabpZwhywwKdK+beBawV8zDif2AoryEzU9Rp3iIWaYVVoEPqXeFP81/cTBR3Gm0s9lbg6cSMwwuOgtzHSNy0mk/x3WpAoTFf7xesHpnYoFdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso88741175ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665834; x=1751270634;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIeAXSj392mLcGJdE7Z1VpxC/y1pcJ/JVfWHw96kPoE=;
        b=UbYLONRRvXxuXfI+6+dVa4WzdiGmgrn1jh7KGcmytJpGBrkJGDlJACt2yraT6kB1Ar
         PzolLKl7G7avSFZftUGEzeTUg3FGhgzWuMYg2KLDN4reC5nKKMMJWSU79dHjBNPGi9DH
         PJk5Lw7AN5qFe3aMuFwT8McIxvesTq+laeKr31HBEVTf0HruYWaIN3L8xc8DTtkyYCE+
         qJyMJmvhier7DbCRU6lTCvUwS+7G5f0KXV/ASEJRwoSc1RaiuDSgwYGTcv+RP2Hhdaco
         7G/qroClZepyA3mNrUdDjIGyTW44PAhd6gB1B08KcF8JMqXUwsop1iQvTFkWMv9FmWUD
         IBXg==
X-Gm-Message-State: AOJu0YzqLdKEcQxqdZN4Z0BIkRFC9u4NfqFx9mRYGR7mO2zcUr1Thu/o
	uvx8EGr+bGO82okGcgjWb6He6Y32y662jMU6bFMc3E/EWyMP3rEf+YjkpdOJNrrt1g/HXf99K24
	srmjyvPb0gusGBo6XjROPe2DBD4ov5YNvqy68V4iuHQ1cmEFEWW3WO8r5g/c=
X-Google-Smtp-Source: AGHT+IHCaaOs5PZRHdI0LQSEvJ9Dycpwbx6GmkKR+fqrq00g4PRW9viYqt7KTiumksSZ5aEONF48f3gOZhGPOJjwClHViKTPry0i
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194b:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3de38c1ba33mr136327265ab.1.1750665834282; Mon, 23 Jun 2025
 01:03:54 -0700 (PDT)
Date: Mon, 23 Jun 2025 01:03:54 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68590a6a.050a0220.d71a0.0003.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in
 vmci_host_unlocked_ioctl (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Author: lizhi.xu@windriver.com

#syz test

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index f22b44827e92..e8c58c3993c3 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -245,7 +245,7 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 	array_size = vmci_handle_arr_get_size(subscriber_array);
 	for (i = 0; i < array_size; i++) {
 		int result;
-		struct vmci_event_ctx ev;
+		struct vmci_event_ctx ev = {0};
 
 		ev.msg.hdr.dst = vmci_handle_arr_get_entry(subscriber_array, i);
 		ev.msg.hdr.src = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
