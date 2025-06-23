Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3922F74B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668645; cv=none; b=bBwYrazwqWvKYTDwthhp65i86E/9WrKgw86Rtkd18AxApH/RKPsllNDoFYuygNeCmAO4Rkh1vmUaTER+gSztwLrV+eN+mINvfAGjuSYVwAKMNzUt5/2rcK0suPYEiJFhwE7MHDDpriFbFfaD3wOHGQnymb7LGfC4YDRRvisGE1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668645; c=relaxed/simple;
	bh=4YaijbhSu8B0AGBXcXAD2zOe37QdUotg4qUZE4CIqyo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jdDSilTWVtq0C8Ej51MxgL6eru1dvLH9pk6hB4QwXsCMbGvlRy/bejIkp2kFk4Vtk27TIG4hULHG6ZXN9Y06ya2eAsjATt27Blim+iWPwYUkOHbsdK2RVHSMN6PDvgeytCpQ+yJWWHv8BghFvo6JfxmcnzEC3976uTnM5GQuXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd03db24dso35332835ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668643; x=1751273443;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34ldYHHob+9En/WL6nat24QJCBcVNGF+83H/uFKv9oM=;
        b=GEpdw9reakADPq1aCTmv8TmdIyCi/5z7C8OqiomtPd8x1Es8byAmGAWZXF6I5cEUA7
         /BIGeaMq8rxO+e666Dzopa3Rp2+u5qN2PAnEc7ZVTFf11lFY+N1Ak0HU+0rZfSqxjk8b
         rdTnEhttYxW3rDwV+adfV4fciNfjZQNN3iotQabX8EGbzDqD8f7nld+oh+cZqBs8Hhba
         uujdVuN/cLPD52xcAOCZdS76k47ByXMF4sOUk6HX2p4lpm+ToVYazzc8YCZSJ5BempIB
         KwO4NuquLIB9TyJgskgL2ew9JFwzXq8/+f9UltPO3jBRd5Sa0U+jsbPW3BiXntl3Cw9v
         nIKA==
X-Gm-Message-State: AOJu0YwPoLDOVf5Rnn0Uazi+WrYi6YwmmPJ9mCBTdpsmNtX3Br1yU+0b
	bDoIYPtmn8fPbMtw6tIexObD5rgoPqpJyYTJ7cby1r4HkgTrplyadtGVlnOa8EdJ5fl7V0/gBDq
	im9BnhYXVOhKL97VxiEFJBQkrUzK+S8Wyvian4uf5yNYQIT4u+Ypjg7yPsLc=
X-Google-Smtp-Source: AGHT+IHBZon5hMxFnLrwoIptmH1v3GN6tu9FG2k8qVP4HgdwUbebTjlxHcEY2mnaSfu3E4NR0m46o5qiL8cQZAwP/xu2wq0cP1B4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3499:b0:3de:119f:5261 with SMTP id
 e9e14a558f8ab-3de38c1c019mr170616185ab.3.1750668642801; Mon, 23 Jun 2025
 01:50:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 01:50:42 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68591562.050a0220.d71a0.0005.GAE@google.com>
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
index b64944367ac5..30c60a00d3ae 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -426,8 +426,12 @@ static int vmci_host_do_receive_datagram(struct vmci_host_dev *vmci_host_dev,
 		return -EINVAL;
 	}
 
-	if (copy_from_user(&recv_info, uptr, sizeof(recv_info)))
-		return -EFAULT;
+	mutex_lock(&vmci_host_dev->lock);
+
+	if (copy_from_user(&recv_info, uptr, sizeof(recv_info))) {
+		retval = -EFAULT;
+		goto out;
+	}
 
 	size = recv_info.len;
 	recv_info.result = vmci_ctx_dequeue_datagram(vmci_host_dev->context,
@@ -437,11 +441,17 @@ static int vmci_host_do_receive_datagram(struct vmci_host_dev *vmci_host_dev,
 		void __user *ubuf = (void __user *)(uintptr_t)recv_info.addr;
 		retval = copy_to_user(ubuf, dg, VMCI_DG_SIZE(dg));
 		kfree(dg);
-		if (retval != 0)
-			return -EFAULT;
+		if (retval != 0) {
+			retval = -EFAULT;
+			goto out;
+		}
 	}
 
-	return copy_to_user(uptr, &recv_info, sizeof(recv_info)) ? -EFAULT : 0;
+	retval = copy_to_user(uptr, &recv_info, sizeof(recv_info)) ? -EFAULT : 0;
+
+out:
+	mutex_unlock(&vmci_host_dev->lock);
+	return retval;
 }
 
 static int vmci_host_do_alloc_queuepair(struct vmci_host_dev *vmci_host_dev,
