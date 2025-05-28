Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7052D052
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430424; cv=none; b=gvfE0eHIhhQF9pS0dxprfdREN2GJPCBMrDtF3kl3xZNHZrXJ1K5kcPkIcrW0cbzQaPpgIuuxMiCeOucr82oc2FfTikWvrMRN9wUCY0feuvUmZeq/mV56f1lcETXscjKWgs00w5BWsgVjgAgSyrGYLXvkdekxhrl22ceGINf5SJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430424; c=relaxed/simple;
	bh=uRJ+nl+kEC/Zyrz06cA/vmXXAkKhRJi2Lz55+XKRCxE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IATHj3fajjq2cMeo4Gi91ditMmr0rWGNJgkILvaI/dpyy5v2Zr2B++bF2iTSTuiJGhdJ5E2qewhVChwl7d3es4epz67JyW7LtEdV+GtqOlBmbPdObRtgEStj6Vv67xUZ7NFR8D95qc0c83wcAwqDx8lUprm29MZdAksXNQ8VNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dd770a7424so30734895ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430422; x=1749035222;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mgL/x/YHoJUO47bxr6DO4OugZYTC0g3jOaRlGF9olA=;
        b=THwBTgNmf11VPXWapP0jySfaST6Uf+LOWjDxqrC+0wDG08ojP5wa4H75xExpYxaoRq
         n5OAfYVucyptRkdBEnNpPln+tRSykGVHVi5Ma9UIcg4QsLHdPk4QU53pGhaRnS5ig35S
         2zRpAI5v19a8ZNdZmQ6qOQ2UvzjU/4RuFikQ+y40l8+LYFF4N9aRvEWvIQ42ITM9o0hI
         7BPzU4yqwlzSz/whntP5JpTP10JNg3jP8LNtJCuS391/K/FyRp9r1xXozCpcTkgzvc/x
         fm/dWmzbJKfZg+BAg8m93ObHehEamBcNTaVyRj/3aqRRVlW5RkWHjoN2A6IeRFvHxT/X
         zbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy7vyfG2CAmOk4XuTzEeIO8aa40a9QjRjJXOk+PgBzB3L4vsV1zxd6O/7+pI0eHEYGH/neNd1liUpLkrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASn8KGrESyhIcOn6miYADSRYXl5CC47Q+4S7+RXa9RyJEqdjo
	eW48hcIiwdq4fRa2NBW54aTYXzfsE5UG5rs/i8puJgTlxp4fVrHoMX4mK3kuPvZQHJcLkBU91CN
	ZplyX6W0iSJU4sHpxgwJl8sgZdPhwzB9Nkhc6XJVdR3YmcoGaFq8sNu6MsdQ=
X-Google-Smtp-Source: AGHT+IGjOaWcXU3B/77xfLZ/lW1IaZa6EkyYLOsx5d7mgo8nQviQfaMv2tGbIuXxzUD+7gkqw7RGPFb3zNups+8chbcZpUQDml8k
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160c:b0:3d9:65b6:d4db with SMTP id
 e9e14a558f8ab-3dc9b696c46mr169994285ab.12.1748430422140; Wed, 28 May 2025
 04:07:02 -0700 (PDT)
Date: Wed, 28 May 2025 04:07:02 -0700
In-Reply-To: <20250528105149.2400-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6836ee56.a70a0220.253bc2.00c9.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in __del_gendisk
From: syzbot <syzbot+2e9e529ac0b319316453@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/block/nbd.c:1707:4: error: use of undeclared identifier 'retuen'
drivers/block/nbd.c:1712:4: error: use of undeclared identifier 'retuen'; did you mean 'return'?
drivers/block/nbd.c:1719:3: error: use of undeclared identifier 'retuen'


Tested on:

commit:         feacb177 Merge tag 'sched_ext-for-6.16' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd18a1001092f95b
dashboard link: https://syzkaller.appspot.com/bug?extid=2e9e529ac0b319316453
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11e70bf4580000

