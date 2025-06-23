Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06510E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647799; cv=none; b=ZJRX7CCHs2uJdgasrldnn5bhCFifRguM9JETwPZCNUfLwMUOqi1+kjwoU6qvsYwSglspKCgi0KhOUGbROY8xDu9hvgV1evC3/qf53V54eZ92PkLM78yf8R5FDjDOyXBb1qqH1r1n+PpUMXESED6E9nrbkcb3YW5KMC+aRWOq0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647799; c=relaxed/simple;
	bh=8gllXfLh7lgCOf34QhCdyM4oB/zUJVGZ75Pc+EGijX0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kN2CCePctGqRsFevdlgB14+NDXpsNAXrne6sPB8e7kyCQ4hivGtXFTSBkE/2UM+nf58KymmEQATEeAGOL6701yUWGZONH+zNpEKJJE5RFSY9SkgyOY39nSS7supdGPC99BjlC5PGPYsQ92BPeLzFgiVov8nQYfTMvcvJBlVBuRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-876074516b3so676274839f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 20:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750647796; x=1751252596;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dh7b9Kyw6JTl7BCsxPiu/otbv9yfk99lceVb6gP5cA4=;
        b=v8O2XJBu5osZL3MhJJ8ghNPOrUiE3VLY+fty81qHmL1GLZFn6HXU2V+mUkaMU/yX5k
         Vgs9QsHxw1Opo2JR4ubPXWUQwXbVA0lDnIT8KVhrJG38X4gfzddkiXOZn9Td4XNd9J18
         hv4hfwm6z6HvYV2bkOrEj7v1XeFQan56evK9W1ROQ9ZKGLD73RpCQl/fDVUe8UE+NlDP
         Rp34txLNp57m6ykRjwrCNTKEPqSgerwhOlUcgkROh7bjuL3GQ3aMArPzW/GZOOut71lr
         b42EJhewhRDAyIjwVOm78dw8zGE4dNfkV0/88UfGeO3r6Jt2WtIcZmtwMHAMTT+rX53v
         gm0w==
X-Gm-Message-State: AOJu0Yx5c9swLUNZv6RyeWX+P8YVtVjMZnjyfs3MwkvCWrDOOQSUgkcT
	iVPTjxhU5bUcxD6Y1qBA9vj79WSbw0198vgDzupRlZbUV3zaqhd1amRr1l8Tsi4EfTs+bdq7she
	6zDJ83CA3GWymdzs7Zl019sJl0cGi7RjWZ62xasR7ryJa2d/v8ltzgl+8KGI=
X-Google-Smtp-Source: AGHT+IH4D0x0SbB3qFPK8Q2l4OzcUHD7hJs3foGMahLYsqcRDEeU2U+ywg8rBRrqPmE1G5gYtnVWYCxw7sJ6I9fsN3GFig/KcPU/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194b:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3de38c1ba33mr129770415ab.1.1750647796130; Sun, 22 Jun 2025
 20:03:16 -0700 (PDT)
Date: Sun, 22 Jun 2025 20:03:16 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6858c3f4.050a0220.d71a0.0000.GAE@google.com>
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

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index b64944367ac5..4804aa668e47 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -433,6 +433,9 @@ static int vmci_host_do_receive_datagram(struct vmci_host_dev *vmci_host_dev,
 	recv_info.result = vmci_ctx_dequeue_datagram(vmci_host_dev->context,
 						     &size, &dg);
 
+	if (!vmci_host_code_active())
+		return VMCI_ERROR_UNAVAILABLE;
+
 	if (recv_info.result >= VMCI_SUCCESS) {
 		void __user *ubuf = (void __user *)(uintptr_t)recv_info.addr;
 		retval = copy_to_user(ubuf, dg, VMCI_DG_SIZE(dg));
