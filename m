Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FE2248BF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402479; cv=none; b=mdkRshaLIy1WwcPSXdGvPpUEXgIDyhc7y4cydAHntzccVK6G1ReUFrv3xHKy44yXvJCXaQQ+wSuzph2hd4l4RhLPfF5BFNNlFn6e/nuCXySTFwV/qozxyjWYpIrXSmCsmVbfIKWNA+9wxInzoomcLMNPvWC86XQwa+DPMEIibuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402479; c=relaxed/simple;
	bh=bbfx2n0y2EckyJVmb9QML8jEcSOyZ97DoWA3f1jtCYQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N2WXn8F3pTmUFtarUWychkTLO2dDfk4eCoCg2czT+wzP2vLUmWj7uMjuDvTSj/brbmqEnlC8S7V7sOZItV8d1CKppRyYJVxtwx18PPW8B4GAWRqB917ZURdKuZJvF/U+UURBO3hNK1xTHrQFIW0cxC5diSLsvj95+OMw6xaO/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddce213201so14099125ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402477; x=1751007277;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbaep2FPsBJRGLzNpZF/WZNjNYCjbIrWnRi2iEY4dXs=;
        b=S7VJO2uO2iclLhL6qt02iDHJrduykfHoofV+9rCFYRkSheuoHl9fLtFQaK3I3GWRX/
         4XTrfYpUjWyHpVxhQVpJwjyAQRklunKnAaKbVqOyCeIlfPtuu6lTITOxOEfVvNqsy85i
         yzX24LG2ekYfOUNxUljEoA3shlO0gOePD0UhT97sHZg46ThBd11Ze+0jwhdw+I4uhMPa
         1Yqjd2R7cTZ5Jg1gIc9oUusgAAPb0RGRc6MPjfzH1VhSfIn+h8yow5+QRGrqhl6V6+Qx
         KKgieaiBu9TPNPhRPvZDb2fgvHTW4EelQb6b7pfORBg6R1PJOFGryHsMsZ2BscZsIKfT
         Au3A==
X-Gm-Message-State: AOJu0YwSf9QX4wbeGiMSLA1/p3ARIESNYnzL7lXlENciXZ73O+mAMhMG
	/cm6+bf4w6lZkusigIwck/W3ZI9PVINNQ3qjBHxPpNiM/Pkx50wtZraWGHqlkIK9WMg+uykykAj
	4Rp3e1ComtZyNI9LfOEGKpaW+C3++b8KmfuudtlqkMgGWWbMhMUy0BF0FOqg=
X-Google-Smtp-Source: AGHT+IFc+2B1yL3DwY/kW42N+wKpI6NG1p1ZrsjcR4BN23xgvlqTelkiwc0de46PoXMpUUpJgQVWE53ury8JfkDE2h5rBxLANTln
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19cc:b0:3dd:b540:b795 with SMTP id
 e9e14a558f8ab-3de3954f063mr12322145ab.3.1750402476897; Thu, 19 Jun 2025
 23:54:36 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:54:36 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685505ac.a00a0220.137b3.0035.GAE@google.com>
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
index b64944367ac5..e67e6ae48e83 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -398,6 +398,7 @@ static int vmci_host_do_send_datagram(struct vmci_host_dev *vmci_host_dev,
 		kfree(dg);
 		return -EINVAL;
 	}
+	memset((char*)dg + 27, 0, 4);
 
 	pr_devel("Datagram dst (handle=0x%x:0x%x) src (handle=0x%x:0x%x), payload (size=%llu bytes)\n",
 		 dg->dst.context, dg->dst.resource,
