Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB719D087
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750976703; cv=none; b=ceA8NcYuvF+aMB+qyCNdcWBRjp3qK9evkdrckpijjbVvtd8zjyfaFMYiMuAZIygaQn3UnAW2dOyvYA9jIFkPLPnskxWZ+bFoTqr/6BExGe9diT+Y7LIfnG3scNdC2BS7xkg7TvgBWQaYC5iFQeOD0ymRKnQs7EgCkWyi4EzFlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750976703; c=relaxed/simple;
	bh=M8pvDEBgu6GiSU5hFeDKveH5vyAoaYOZb4acdCfV660=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BUdarnXNGmfF9w1chkRn7QnOKAeqQmRqCbaqsNDTJ9RbQ/eh8cCCemiQZkFxBHNyaU0gapvyOcJJVOkOR7+XQ6uRkD6IPHJ7XJc6ewcsrwHJ0RQXf7nLL7rfCZOoE5gAekEWyaT/Mn3pynZ8MHGb2fbTsx9/iLQTHyQWpMz0IgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3de0dc57859so18244365ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750976701; x=1751581501;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRLthsUnwHe+6RNJTHv6KCafdpsAqYFXxp/PW3uWVqQ=;
        b=P8dVkC9bqJk+d+RtSVTXJ1Tu1Ln8Z5j+5CI9XRnYAZORBf4MeWLbK8ps425m5grbgt
         FqfyB3hNPf7m+s28wFbVewfaCa8E++QovxsodfET0ghAj5K5oOkdaqpbLzFwTgiOUsr9
         x+i4vJt24pWvLPiQZpADt+Ia9AWwW4Yqq+BWaDgwpN7AkxCvZEj60DD/OFAPjXQ3ABsv
         95IZRKXNu4NE4VhGLdgtRsKdpTccDxNM1vu3cMkdUmfU4tut8tfx3bploUCeR80wWK4s
         2Jr/GrEO2RHwZtxSzM/qUAnmCZbqj3GBDSuQC3/rZOw1/YSTJDdOBw6Aqyo6mGM29alo
         Hgjw==
X-Forwarded-Encrypted: i=1; AJvYcCWcT1ryTsiWDgBB1Kv7yflfljggqZm8Y9q4v0ryRZhZzwAUXj6Wa1pYYVRlz78mNkOJNGEXPE2rSkrkppM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhLnIlI6LGrylQ/fKkclIBEDsgXo4bxWmg6cUvU7ByXAMewd7P
	+IDhpq7UAfbG2bFYjzVjRyBQMSs5gP1V5GJAe0FS8kX7Y5wRLjR6nVYX40xeJVUQNckj4ISmQMd
	V/czS/D2IPFYrblT2nmvHSIyiE006hG7jX6K49l7GaB4yqatAcNqds6H/DJ4=
X-Google-Smtp-Source: AGHT+IGlYuU+xY7dA42mkckoNClegdwpq1yODBJxpGpJiCBxGEkurlK5sw6853r5gBAG4E8/Bje3POGtoVnqgfmFceH8bycOyUCt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b45:b0:3df:3620:4035 with SMTP id
 e9e14a558f8ab-3df4abae904mr15203975ab.10.1750976701502; Thu, 26 Jun 2025
 15:25:01 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:25:01 -0700
In-Reply-To: <c6528a69-f229-470c-aa60-012049d7287f@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685dc8bd.a00a0220.2e5631.0382.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
From: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
To: jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yanjun.zhu@linux.dev, zyjzyj2000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git@github.com:zhuyj/linux.git/linux-6.15-rc4-fix-rxe_skb_tx_dtor: failed to run ["git" "fetch" "--force" "9a778a5fe5e4b8c26d97f27ad3305a963b60aef0" "linux-6.15-rc4-fix-rxe_skb_tx_dtor"]: exit status 128
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.



Tested on:

commit:         [unknown 
git tree:       git@github.com:zhuyj/linux.git linux-6.15-rc4-fix-rxe_skb_tx_dtor
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
compiler:       

Note: no patches were applied.
