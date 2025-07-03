Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8C2D46A9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533088; cv=none; b=dbGiWD6CCr6SGWK+tzriHGFzLYC0iujbXeT4HwBVazWDxZ1PinJKvRnNR1p6+lrCn2pxDGbbDLD0LLP8AIO2MKFDWQcs7USoA97UmfWZWWGOKE5bznvVAhfc/CBHGibPRTAA3KXlL2eDFkpnt94WYjx1/Ny+sHk+Pfc+f1TbYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533088; c=relaxed/simple;
	bh=lhjP+UD3mPes2qhDBUbvRkQCukdiLp9g4euWuITb7Ro=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WDYT29ws6Sn+WAIiFqokiLkSygGhTtNSeAzAhPio6knkI9hKXV9Q5UAEJO8IkC4LCkPwYzdYw2FEWbN2UgtFfrymHU5UYXY96eQ12s/1UrRMBCrm02gbdDxaM6CA5vg3chKPNuDjT74uYhiojkp2V7R9uLdbiak9crEPhpSPujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-876a65a7157so70429739f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533085; x=1752137885;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkLs6odJ4TRnCadcfuqyskWUAvf1QN4507XUB956zZw=;
        b=ZCgP0hABlUCRZbAn9CDzRhmZL4/cXKybDidjtVPtxjRImp1/8fzSE+BXkBXEzxUKmS
         XvuuqbMDoqDZQ6EBzmACTU3lNqzoBXM8LLtVlwXUjhpARWmDMptmy6oVQg+d5/63+lJ0
         u6gjopnVfWBtXKjv/FnKf5lnmf8vpu8lIi8D5pOiF6hMn3PrkFOEej+4/EQSUP9dmbAW
         WOp3BC8BfeJ6TRiOxogCAqXoFlsQG7MW+7xPW4SXCHw4k1INmpcG92iVi/lE4A4EpoEU
         HkruaXYbEMRiXPlQ4PKx81GDPKP6WYRUmqskWxpEW6lcVg38Yr6QAjTRnVVafR7akTwB
         VK5A==
X-Forwarded-Encrypted: i=1; AJvYcCU/dPUi86An5+emxftz9/edrtInVZkVDj/CfnNmyWdB932VmHtMc0hOb8YtPMJrvBj1/gATZcrymMpzWOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvk69vcfUy21FfYh6zKNGWuScOiklpYQPOI0SHml3sTwA4PRCN
	iShzapNxCUitVBDKroNrtlyQJzxrq1/PtxM/gClOa3wOF0ZEIiUM/1S10vShwO/ZDXlVK7etK1E
	MKbjYBXZeigB5JSTOjtlHasd9wBq0lBC+dxOI3u0/yobATgtj9W4RyFlP8pI=
X-Google-Smtp-Source: AGHT+IFTdFg+Wa6NGB7kKWXpShAYTetqfttgQCLuf/HyGVkjrvw+fKKMGo+8khRvhO3XyNKCE/BlTO5xwWXcdtwxMgBAdLuKwwGx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1344:b0:876:bac1:f01e with SMTP id
 ca18e2360f4ac-876d57a38f1mr123625539f.5.1751533085698; Thu, 03 Jul 2025
 01:58:05 -0700 (PDT)
Date: Thu, 03 Jul 2025 01:58:05 -0700
In-Reply-To: <20250703014020.2257-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6866461d.a70a0220.2b31f5.0016.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com
Tested-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com

Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1791748c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d012e863976d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=151db48c580000

Note: testing is done by a robot and is best-effort only.
