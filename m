Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072314A4DF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546122; cv=none; b=togaIt3u1bS3gTwVKPmNFiGDogKQkkB7qNurJvQV2l6mcYvFWEw5NpPBtbTvMq31klvogHHpm/Gn3VAA8vIgU3aaXF+OTG42DiNvH/M7LApkDHDi7/Kx9/75i5e+sfTZecIFyVpi+87/CF6uQDuNFXEZrtwoOWxUtc6ogzIiOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546122; c=relaxed/simple;
	bh=0xM4x/NdPxWOJEQq7qpLLhz9UL91FLMRr+fWHWDDJGQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b3voGxRwhPv25EBJm7C5c0lV9RF0NM3TZehRPiJk3vg4tMLTS8ob972vREG43H9Xc5BmpMOUNH2VYpXrXC8VLouFr/kftCRBT7KW9V6TlTqk9tVsPygAkfjfs9OlYF8i88xav0JkWWLKaNz4u+MP5dGqZ8dZGNAnMZM3q6ehADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b53875729so348999239f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745546120; x=1746150920;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1FDfF2TC4r8vKPyGZxhCxiyLX0oc3egD/D2gIhDY/A=;
        b=J23EJpSWVxDVIaMDRHs/yD0m2Noh5gIOeSMdVvNE+4m/4YWDfz+bs/Zb2mh41v2rz0
         Q+j+PJSGTA0XijK3JoNg50Y6RuDOI7Vc/k8+gPRh4bZ7tyyAsUexIwZ2wfAR1nQQzQpp
         O02ffLenNl/hE24k01elgpqXseNKpDQzmIPu64gzz+Xh+2mZYBNctL5Zv7kNnm73KRAG
         gRAHWAQs93Sou95Ib9BtwhIhTy9rQmaskxuk8e6xJYapdY+pc+czvlhlqaU66gjLNY6s
         QPaMoFkhkmKvcjlvPrxvvw2rNVlFTtha5mapiS91n8fEuIz0WSanC+kQbhyuUYahx+Ep
         UCVw==
X-Gm-Message-State: AOJu0Yzb4/UlWnQLtf2L+yMonhGXX4gzgTAbiFHkdAnudZjTXYsQ3xoK
	9bIf8MCMouGGpWaydlnwB84VhPM9KxReJsrA/0fzHm6Q7W9ePJDtaOPnm4RAFoMpS1AN9bDaMHV
	uFicbKSli5ewTqC3nHtOp2XXJvT722Jai+vcyHDr4sSgv48D4mHSJ9eM=
X-Google-Smtp-Source: AGHT+IGBjhL3xEZPW8xPXHTLnBQ7Ob7IQU/NFI7w/xFeHeuPEkHEkqWboK+zUskF2/9uv0T3eU1GaV06gv2svXe3tUJjMuQ4bGl1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:13c3:b0:85d:f316:fabc with SMTP id
 ca18e2360f4ac-8645d1aff28mr64975839f.8.1745546120524; Thu, 24 Apr 2025
 18:55:20 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:55:20 -0700
In-Reply-To: <680a45db.050a0220.10d98e.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680aeb88.050a0220.317436.0053.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [block?] BUG: unable to handle kernel NULL
 pointer dereference in lo_rw_aio
From: syzbot <syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer dereference in lo_rw_aio
Author: lizhi.xu@windriver.com

selinux policy not support read_iter

#syz test

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 47480eb2189b..2bf0d2b2f2ea 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -481,9 +481,15 @@ static int sel_mmap_policy(struct file *filp, struct vm_area_struct *vma)
 	return 0;
 }
 
+static ssize_t sel_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	return 0;
+}
+
 static const struct file_operations sel_policy_ops = {
 	.open		= sel_open_policy,
 	.read		= sel_read_policy,
+	.read_iter	= sel_file_read_iter,
 	.mmap		= sel_mmap_policy,
 	.release	= sel_release_policy,
 	.llseek		= generic_file_llseek,
