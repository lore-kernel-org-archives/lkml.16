Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64919539F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750994802; cv=none; b=NgbL6XvX/qGjZmfPTSM4WmlRGe+kHOYDjoJZVPzglYBs5xRaJaGurHTqQKLl8jN2yPPHNxNWwo0yHbX/hbNOt+PYvl5zT4tFZx9shJvqBwloyHptsNMVyzjrTT72kuiCrFJgeHVYozeYmjbhLIxwEFadVGvd6uC1cy54M34Ve4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750994802; c=relaxed/simple;
	bh=QqccmSZHnRiw1zb2MLpeIQzL1DntmL4TutYNBSZsBEk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f4VKJ1Tm4Tzwj25F+x3j0omnaTH6blDaNUbfMB1LMyCNF34W0YH1B/h0kjCZnc2eUftf6H31aXKpgTkVP8SfkwK5MddaUo1djDNyjLmdqtWDrXKCI5qdBh8jyLgceMTg5Wplz0UnycJcFlV+aIlYMC3cCqKBNOttqvIVD+2wsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87313ccba79so306295739f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750994800; x=1751599600;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hETuSi6DyEHvi5xhw5z3MzaNw9NuopVoA3MpAPLdzhg=;
        b=Mkz8ObS9aw/6uBfzqFfLRs8CeqN1B3HfnckE8vzZY5T+bqD1X2FB1WbKl/flauqOvp
         YHu2HO8C7qMYL2ey5EOgDw5gKy3R5OrxxOG47Y1Cl+YXGsQuuXb2GlqsemhG/1OZcOMU
         DrF3v5BCXMrcOMaTJQ3z5QUnESc5dIamPglHxHzO0TT4VaShkN0c9IuLQVrZvcmyc9DX
         +2vJAOgfqXdn3Jzy9s6cXsiH0J8dMfQQQUBFPQ1deIEiFDQEYY6/7ibrl21R1vflsEBp
         LszmoT1JpLim7/2WsvGO/3rWI71rZQPyUf9mW4Uh7Iap3TdoaBGM2uE/OCT30tlwjbb9
         Xndg==
X-Gm-Message-State: AOJu0Ywcke5W6sQrmJgIGzxJPxalqO3RJ9wPgZFCAkSwQTXneM0vK7gh
	Vv2qbmgr4zCzroiZXnzSP3YtheaWaYG14AmBPDugJQdENnSA9t6ZIktTOzQwUUzm2dHWZt14AOs
	MXp0mjFAc3LPRs5fCSXf5kyC2Zeselx2BnquC1+1iPU/fSkJRRdXD57WXy7I=
X-Google-Smtp-Source: AGHT+IFoNdud0124+12HDcO1Ooj+6iQuP8yt0c2OvJewE3TJYT7AdDGNtiHAeMmJmxdAzRlDtuC8g4OvjMrBi22VaOtKIehj0YmR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3804:b0:3df:29c8:49ff with SMTP id
 e9e14a558f8ab-3df4acbca39mr25443965ab.22.1750994800123; Thu, 26 Jun 2025
 20:26:40 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:26:40 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e0f70.a00a0220.2e5631.03ef.GAE@google.com>
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
+		memset(&ev.msg.hdr + sizeof(ev.msg.hdr), 0, ev.msg.hdr.payload_size);
 		ev.msg.event_data.event = VMCI_EVENT_CTX_REMOVED;
 		ev.payload.context_id = context_id;
 
