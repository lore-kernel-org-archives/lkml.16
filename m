Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F43215176
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796977; cv=none; b=B3PjWHhDhMSrjxxOxPZd+XtSNrkxuPKLln7fEeZtCtdb7po/niTeZ7+elcMEkFIs6Ce3zA7BImlbXtOBnjyOKoxuIFbSjh+x+Vpgud5v/koZ/2aGwYA5acfLjmC8aD35vYvwal47pOk78XbkTqaGWGqNvRxWlODSf2+28oWi/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796977; c=relaxed/simple;
	bh=0tONOp1b5SRsZAROp+esw8aYqCFtQ0EOoMDmhHZVrpo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EpDvqz8Q+xjzfoubFetdA1n5fozSLS2YRWmrL4gKYi0NaHKEI13q5o4Hi1KYoXlKgE6LQuqvrZULksJCVg6pL7OKDGNw/ZXRZ0xHAG2NLvpzEbHe3n0MYJX9LVeeQDirHEoThBfrJnqYY+hEXwQjtHTeVUWfgTQdabiXzHuXtJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=khYF0LSF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="khYF0LSF"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B1DC3FA60
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738796966;
	bh=IHCQzji28xdd+EhWALB92Wl84qSvADw6a0Gh6qa1QcU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=khYF0LSFpGa8+4Xz/v0o5mXfss4tkRzzBZEqNJhuihQbXO/pTewfIngwnQ13KlZYx
	 4smtsU8QddmiwfFcOhlxqR62K8iS3i3c6gDz0oJhjbvFwRLHZW8t40hB79nXC/G7XU
	 tHty2hjbs0+TMcEWgC3t9IswBmowNqAtfuZnxK4490c6hB6VFUi+bA2VvKKGjeo2OW
	 ujpK+mAppu+ALiyKukfTPt7hgPSkMJfFXhnwuFVZ6Ymx3OM7WhobdXIErnk+FOYK/U
	 hDmX/+VJId0oQNerofvNYA/DtgxnhPwCH6CRqiItqJ+s/m3x6QhhZmf0us1IWkXyET
	 j3FDmydaeYXPA==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d89a53fc46so338009a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 15:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738796965; x=1739401765;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHCQzji28xdd+EhWALB92Wl84qSvADw6a0Gh6qa1QcU=;
        b=EoZP41XOMD52Vm1IbKmBO06ayO/QWRQdeKfFxPXeO+X1eWPCRFbA3SZlgICq43AHYl
         Ef/Ikenw7xGHXF8qXboJUBt3r/+bIOgLU/lPpnuZBIlGCPOFhYtFEASkkO78rrxGYnQv
         ceUMdu8sLvOQB2bvCwlPw2KTtZ9fLzmkArCzWazwjTLDG/eISa1GctTXQXPHsGONQ02t
         aA38chXqF5IXmXQM2I/C97Gjr7bJknef5LTF7g8fn9Dt0oDoNY4mm5rb53zazHKo3xIh
         P8u5SzOZKCDiU8Tge77DuRgBfWhu4J3vBe3SE6kb5spvjiw29xElGOSXzLmaWBCpuvnU
         uY+g==
X-Forwarded-Encrypted: i=1; AJvYcCUB+8prgvYmgz8amoIqAi88TXfikV96eyrhz9Eh4E3ta09gBog6DuTaqHmgZCOQdFePKWZ9uQU/fs0RQo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSAgyIh6KvAOBrfKzKRkWlt0Xc20jwH9wRF36uAfBqAh9Ew4Hj
	nblWm4+O5I7wFI+bXazCSQhgKlOEO4D+pxcufWaI0q68dYOpAuvNz3816gVtp/7E8X5iio83c1W
	VDLEFvP0yRENe+1UT/wPCs4WVPWLKVZ8JbiuFR75ksZRjWAG14JSJGjoAeBBsxnrpkuzwWXbUgh
	hsgQjm0u0OCjlZfTQJhUbidFfvXtq0UTdrSvdb+Jq6haDkDDVd9PvQ
X-Gm-Gg: ASbGncvkieWJenfPQ5ohwak7k77wDsV8a7keUiOfgMqc8uGlmLGZ+4/X1P9iqvJDxaX
	EBq8JhbN8O4u8xUxNEyxY3ofPFKRD9KU2sxb3aK0eC3fKlHutOrKjMjMnqfDs
X-Received: by 2002:a05:6402:1ece:b0:5dc:8ff2:8b67 with SMTP id 4fb4d7f45d1cf-5dcdb776ea5mr4739838a12.27.1738796964869;
        Wed, 05 Feb 2025 15:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1fESLv5gzNaM5MizNpi9j0ovNWs8X15bEZqC1NhnGeYx/WSsczY28A2jsvF5N18HMtSIAoHtF1Twd9VUhmHE=
X-Received: by 2002:a05:6402:1ece:b0:5dc:8ff2:8b67 with SMTP id
 4fb4d7f45d1cf-5dcdb776ea5mr4739819a12.27.1738796964455; Wed, 05 Feb 2025
 15:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Wed, 5 Feb 2025 17:09:13 -0600
X-Gm-Features: AWEUYZnzdf7jVs6wvqeBgViHpu3kv7yl_bB8qHrwzZfoQ814nnZ-IMm4yhtr57E
Message-ID: <CAHTA-uaH9w2LqQdxY4b=7q9WQsuA6ntg=QRKrsf=mPfNBmM5pw@mail.gmail.com>
Subject: modprobe mlx5_core on OCI bare-metal instance causes unrecoverable
 hang and I/O error
To: saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	andrew+netdev@lunn.ch, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Talat Batheesh <talatb@nvidia.com>, Feras Daoud <ferasda@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I have identified a bug in the mlx5_core module, or some related component.

Doing the following on a freshly provisioned Oracle Cloud bare metal
node with this configuration [0] will reliably cause the entire
instance to become unresponsive:

rmmod mlx5_ib; rmmod mlx5_core; modprobe mlx5_core

This also produces the following output:

[  331.267175] I/O error, dev sda, sector 35602992 op 0x0:(READ) flags
0x80700 phys_seg 33 prio class 0
[  331.376575] I/O error, dev sda, sector 35600432 op 0x0:(READ) flags
0x84700 phys_seg 320 prio class 0
[  331.487509] I/O error, dev sda, sector 35595064 op 0x0:(READ) flags
0x80700 phys_seg 159 prio class 0
[  528.386085] INFO: task kworker/u290:0:453 blocked for more than 122 seconds.
[  528.470497]       Not tainted 6.14.0-rc1 #1
[  528.520546] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  528.615268] INFO: task kworker/u290:3:820 blocked for more than 123 seconds.
[  528.699641]       Not tainted 6.14.0-rc1 #1
[  528.749690] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  528.843577] INFO: task jbd2/sda1-8:1128 blocked for more than 123 seconds.
[  528.925922]       Not tainted 6.14.0-rc1 #1
[  528.975971] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  529.069854] INFO: task systemd-journal:1218 blocked for more than
123 seconds.
[  529.156382]       Not tainted 6.14.0-rc1 #1
[  529.206441] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  529.300407] INFO: task kworker/u290:4:1828 blocked for more than 123 seconds.
[  529.385892]       Not tainted 6.14.0-rc1 #1
[  529.435942] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  529.529973] INFO: task rs:main Q:Reg:2184 blocked for more than 124 seconds.
[  529.614607]       Not tainted 6.14.0-rc1 #1
[  529.664656] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  529.758690] INFO: task gomon:2258 blocked for more than 124 seconds.
[  529.834832]       Not tainted 6.14.0-rc1 #1
[  529.884887] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  529.978867] INFO: task kworker/u290:5:3255 blocked for more than 124 seconds.
[  530.064351]       Not tainted 6.14.0-rc1 #1
[  530.114398] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  651.265588] INFO: task kworker/u290:0:453 blocked for more than 245 seconds.
[  651.349980]       Not tainted 6.14.0-rc1 #1
[  651.400028] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  651.494126] INFO: task kworker/u290:3:820 blocked for more than 245 seconds.
[  651.578543]       Not tainted 6.14.0-rc1 #1
[  651.628600] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.

I tried using the function_graph tracer to identify if there were any
functions within mlx5_core that were executing for an excessive amount
of time, but did not find anything conclusive.

Attached[1] is the stack trace that I see when I force the kernel to
panic once a hang has been detected. I did this 3 times, and each
trace was similar in that they all referred to ext4_* functions, which
seems to line up with the I/O errors that I see each time.

I should also note that I was able to trigger a similar I/O error on a
DGX A100 one time (running Ubuntu-6.8.0-52-generic kernel and modules
installed via a repackaged version of DOCA-OFED) - but I have not been
able to reliably reproduce this issue on that machine with the pure
upstream inbox drivers, like I can with the OCI instance. (I was also
still able to interact with the A100 - but attempting to run any
command resulted in a "command not found" error, which again lines up
with the idea that this might have been interfering with ext4 somehow)

Has anything like this been observed by other users?

Please let me know if there is anything else I should do or provide to
help debug this issue, or if there is already a known root cause.

[0]
System specs:
OCI bare-metal Node, BM.Optimized3.36 shape with RoCE connectivity to
another identical node
Kernel: mainline @ 6.14.0-rc1 with this config:
https://pastebin.ubuntu.com/p/5Jm2WFZY62/
ibstat output: https://pastebin.ubuntu.com/p/S5dfFSdDxd/
lscpu output: https://pastebin.ubuntu.com/p/dfPyYQWnhX/

[1]
https://pastebin.ubuntu.com/p/kxw2dsmwFV/

-- 
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
