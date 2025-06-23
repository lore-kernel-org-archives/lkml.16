Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76C35971
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671944; cv=none; b=asoS5z2qq9evh54Ks8QcfuiVEPPy2OX0RwY31RjxZVLAgq5gEVHrEr+FP4iaM1yjPNKbTQP/Mg+DDgaz17OZlk8o7gkxWD34VH4XEtnRlu1xWHYZjY4zkGQZqeq0imaDlqtC70cEXXytl3dC3K9qIaiy4n/hm88K+qQJ29LCqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671944; c=relaxed/simple;
	bh=KFZ+4C5YHyhRh/XgnamYvmNjTMo3NYNz2vqcQ8XCDEw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LVXYGlvu6Fa0pLiiYphb2QcdDdu3nNUd1iFXcZDG0YF3TSG2uQyBUUSf76XKPxpMArdC9tRxEey0wULoEMhbc+h5XBgdhSG1akhkSuYsN+ZmSCbA+J0xFozXtsDgU26DEgNrNqIyjf+9e3rzbzlQqMGr8bbijljTlLFxzunkuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so130272955ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671942; x=1751276742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34KEVoEVfs7fWKIIiOP4cY3zx5yLJ7DVEX9AlDqPzmU=;
        b=Mc+TWeJUvejcHNG3CMuPaMob+z06o2u6/bZoWH8qNYBNtyWCWFObexJSc1JV1NstfX
         x9qBkaoz9ZXRBIKoOvshFnLYt1oXAbADdvST9u5qf6Cg96e/avkpuMIa3UZ37VrQ+99p
         A67mzKPtx3HK8CNsZn4lXBYJrB65BIIN259M034fz60Ne+wL5sJ4GlB0aZOnuft5NPqr
         XLgRJdhrqOMttwZvjvyv7NOXxJf7fyYLXkpHzFwP2UE8WvDCd+vGTiKBLyqxMIP91Kue
         jVyPKc+Y/+mgDCfXSpJUEfnfbZEj4190c7LgjlKvYWglHPCu6IvCq9yE2gJNcZiwEmDg
         tQjA==
X-Gm-Message-State: AOJu0YyEl9u4Vopdfr6hNziSqg4PKUpPC0TUm0Pel9CXVDU/QdbtLcOz
	Vzw7H86VkfiF3rM68AXlIsb7Y4fLPKB0DTty675NluhEjF+k7Az/NYWCPMVFmFubC2+6/j3zKCm
	Pq89JZEfIqObfqdYLGB/G8Fa/z5Ct4JZHc2RaaGlfhI+7Bmnmw3HcWq1bS1s=
X-Google-Smtp-Source: AGHT+IEVUoWkP7tctNAznv9vpmmXwZjedhB5+UOdpEZ0kSsCwfDsX7fL5/S0qMxL1XD25Z62RznaFMTMtv1m3wvw9kPPYtFObNGO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2285:b0:3dd:d6c2:51fb with SMTP id
 e9e14a558f8ab-3de38cbf668mr117477145ab.10.1750671942323; Mon, 23 Jun 2025
 02:45:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 02:45:42 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68592246.a00a0220.2e5631.001a.GAE@google.com>
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
index b64944367ac5..fd41bad0a73d 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -293,6 +293,8 @@ static int vmci_host_get_version(struct vmci_host_dev *vmci_host_dev,
 #define vmci_ioctl_err(fmt, ...)	\
 	pr_devel("%s: " fmt, ioctl_name, ##__VA_ARGS__)
 
+static DEFINE_MUTEX(init_rec_mutex);
+
 static int vmci_host_do_init_context(struct vmci_host_dev *vmci_host_dev,
 				     const char *ioctl_name,
 				     void __user *uptr)
@@ -306,6 +308,7 @@ static int vmci_host_do_init_context(struct vmci_host_dev *vmci_host_dev,
 		return -EFAULT;
 	}
 
+	mutex_lock(&init_rec_mutex);
 	mutex_lock(&vmci_host_dev->lock);
 
 	if (vmci_host_dev->ct_type != VMCIOBJ_NOT_SET) {
@@ -354,6 +357,7 @@ static int vmci_host_do_init_context(struct vmci_host_dev *vmci_host_dev,
 
 out:
 	mutex_unlock(&vmci_host_dev->lock);
+	mutex_unlock(&init_rec_mutex);
 	return retval;
 }
 
@@ -426,8 +430,11 @@ static int vmci_host_do_receive_datagram(struct vmci_host_dev *vmci_host_dev,
 		return -EINVAL;
 	}
 
-	if (copy_from_user(&recv_info, uptr, sizeof(recv_info)))
-		return -EFAULT;
+	mutex_lock(&init_rec_mutex);
+	if (copy_from_user(&recv_info, uptr, sizeof(recv_info))) {
+		retval = -EFAULT;
+		goto out;
+	}
 
 	size = recv_info.len;
 	recv_info.result = vmci_ctx_dequeue_datagram(vmci_host_dev->context,
@@ -437,11 +444,17 @@ static int vmci_host_do_receive_datagram(struct vmci_host_dev *vmci_host_dev,
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
+	mutex_unlock(&init_rec_mutex);
+	return retval;
 }
 
 static int vmci_host_do_alloc_queuepair(struct vmci_host_dev *vmci_host_dev,
