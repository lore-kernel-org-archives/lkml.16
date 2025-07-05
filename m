Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0403BBF0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685416; cv=none; b=i/WyOsturSFOAGoXy3ev8pavyYl9q0LOScqbIJ5wgyz31jCbC1HkJimg/YDHVp6jOuprL5vKwf2taRkJs7V7JrqWgs6ce2WxU2a70kv+FGWTdbb84GWZlR5nFl0T6Tv05z2otIw/MRJns5A9BDvXW0si9wEdgUFAzBWHW+ytG1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685416; c=relaxed/simple;
	bh=ajI2fOMNM7VmmMzJA6K7jAhhx/O37PB3bOaLeMSufaE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h4K4eIpFTQ7MnCYHFAaPuwtZcB9/g13wvYDktYt4WjYFw14llHA8I9BGKWRYkwoBpLsPvGZ70ks3TM0KiFBPOhtalIBeAMG507ERhBlYcbDd1f5ev2c0idltjWocL4INg/mCDo4r3KJ/xqaIv8sq7u6dp/CteHZH+zJRRhffkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df6030ea2fso34071655ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685414; x=1752290214;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmSpvGvWy4qqywnjJmNWaTcn9VCxM1VyFaH6G2Lgjmk=;
        b=miNNGX6bKkQvqsKarYO8VkJkOu1S27jQwqbWZhxA2l5ei2uvCmy0r6gZ4IYDW1rdME
         c3vkuyX0ieGVSTKitmtUGB4Nm3S1/AOdmvjmQCl1Wupdb0/IULzBxkZrMd0V+H5WkAIf
         n10eWezSWyZVSO4IfuIblJMBExGGTgne+bA4OKlGImrsIPRvUt9oz+FmeXIBNWKhow/G
         ULXoCc6gwfJAYdkpCiQCjzUMoFKdSeDHtoP9rhVBDNRZFvz0joLQBTdS3laNXcRxq78Z
         k0HEyVVbsDRclCfq1B8oiz5s0LFa83oMlzdJCQui7ZHag+2vGhDsplsmVlIZW5fZIbaH
         oDQQ==
X-Gm-Message-State: AOJu0YzCwLCTPzELwHim6RyJh/YHbaC0dm6cub5EhqvVwwt+B5JqzHiV
	AtGpF8sT1p/DunP8GFVVVq0HJWhyr4a0+ohtyzrF6OdRovHwu1+a4i4jRxoq5+RBtXfZv08YFD0
	gPq6otvYoBIHHKvyc6VIqE9seLzhelnaQynCAOszem9+PF6BdJDR6/GLsxiA=
X-Google-Smtp-Source: AGHT+IFeDJMPzMUtEbTvzhyzR+sIEph6pgp1ZaXf6ER1N3KVSy9bb2V9l+3jzQ0SmsYXnMpLYjDJ/RE3rl/TsfTrgMZaIHSbbx6f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f12:b0:3df:2cb4:56cc with SMTP id
 e9e14a558f8ab-3e13ee92ebamr9514825ab.4.1751685414330; Fri, 04 Jul 2025
 20:16:54 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:16:54 -0700
In-Reply-To: <67d5645c.050a0220.1dc86f.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68689926.a70a0220.29cf51.002f.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
From: syzbot <syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
Author: ipravdin.official@gmail.com

#syz test

	Ivan Pravdin
