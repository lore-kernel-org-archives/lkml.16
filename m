Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8972F1FE2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751001194; cv=none; b=IQWwuILAohNv/FrFNZrobWHl+g/EuKzvv9uCUnG8fK7ei/jScE8S8LEohBrb8nM1QfyTmNhFLGFsyL3e1tp/rG/1CHaaVCQeqB+P0YCE+5WukTnsdkKf35X9jPXTqB9bXWOo4ZrnJ8m/IrDyR5M7odorGWzxFCxFejzwtS3OIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751001194; c=relaxed/simple;
	bh=2Q5W2odvEtMdI09KrvfDEQStgA0vj0l5F109MKlzPMM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZL2coow18PIPhGQ2fn4cBU30Ljelwuh42KgtJvJAAODxy3oXuk0G2BLnkun1re9/tETp5EHCcuiAtDisV2hyRoWJ9eu2dpQ0ulU9/eOjeivzhk2SA/LR1oNFAoydquRByf5iMkgM0j8j7tWdTuzmyrFsool1IcFBQulOoR7VNrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2e9e6146so10826735ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751001192; x=1751605992;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n10L9Tb9PJbo/aqLl4vRx3/ZJeXm4v87M+V6JfGxD4M=;
        b=b+pGHAj3BxamPD4BKR45kgUKF0/mJlVbiI6CD4oECOxKnnjknZQDgVV+/inaxq0M+V
         v7QpH2H5a6QwgJjDeC9vZg7srFenrCGMeUNhyGgETaE3BvUeDXKwihvyrdvRtB2yWj84
         7mOMY0cxBHrgmY4Sp8ZA0DhHaMJdYIazaOaso2L19Pd4mBeFhTZklfYJKRFMXN4LRD31
         xMB3KKC9q+06JWegJiKXSGt1OmdR+eebn4eAAgcUTWN8acRwmzjftRXWB77Kc645lO8L
         woyuSpnTPlTEPrNl37+oOaafBEXt8CziA4jSrcEWsHg1rXP21DMp8bKrw1YqvW+cU6xh
         Vj6Q==
X-Gm-Message-State: AOJu0YwHRdKjvg4fxIiLhELD/effbGt/sW7RbjHSW56YlFL2+5xlkvtL
	0pDwcUdQAPK1047EEUbgLbW/wB+QEQOxAkqDmQDDjSfSmpK0WVJvn0fBJbl3QqtN4rl+Bq80wAA
	5mpWsSp+QpEdK2ZJDXViLOSmi3dy4J4HGAKidl6GvEaw/TkvThBU1qP940w0=
X-Google-Smtp-Source: AGHT+IHenrQkMB3RyDJ1PcfIy2h0jL9kizMrIPO4jtJSkeBFY1KF88BKyZT0U3unWM9AXROr0+2rojFHGnqzXvXD4taOE4fajTmO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378b:b0:3dd:d6d5:2d03 with SMTP id
 e9e14a558f8ab-3df4abae94fmr21211345ab.11.1751001192011; Thu, 26 Jun 2025
 22:13:12 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:13:11 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e2867.a00a0220.2e5631.040a.GAE@google.com>
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
index f22b44827e92..c4fcc62761a7 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -251,6 +251,7 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 		ev.msg.hdr.src = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
 						  VMCI_CONTEXT_RESOURCE_ID);
 		ev.msg.hdr.payload_size = sizeof(ev) - sizeof(ev.msg.hdr);
+		memset((char*)&ev.msg.hdr + sizeof(ev.msg.hdr), 0, ev.msg.hdr.payload_size);
 		ev.msg.event_data.event = VMCI_EVENT_CTX_REMOVED;
 		ev.payload.context_id = context_id;
 
