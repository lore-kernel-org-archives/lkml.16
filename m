Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B82853FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291326; cv=none; b=e3X5OaVulLzv6qW00MJWbYKHxuR0LE8dOnHJ1pnqZPymIzagRS2aF0PnglZ3baYoep7jBuM5rKTjYDcfu78ukCDd4CccVwOe3VEf9Ii5vtxHHscA3xizv9STKDm1hYgAEOsNypjQtteG1XqvUGgY+1bFJDtIe99i8z5vrCUbKfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291326; c=relaxed/simple;
	bh=TxpinXIVox58balXQ9mjFYVf5poJ3SM1tyO588NrTqc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dKg75qj2x970ww5w+hgAgjl19+0CAyHBmYTu+w2xm6A4O5ggcmb/N4x1rJoAn8xn54zLTFFs3W4CctzuKB/1FGjhp5ZJMAwtHVM5gjjchdL93nZVOaMNwUuxgkNRkJGRD3oodPKAfQkN8kXQkzOPG9YBE3QJtMycI6BMRZ6q7hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b41b906b3so91149839f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291323; x=1744896123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b72eM9eMZlRKFXr+o0KTa33dW1ftqcPwLSRLp9ZZfV0=;
        b=cffg4BUnuuuqpbFfwT5oGjzSsP93cTPx9g+UDSfF9khTMFcMIqR22jMzZfaFmVCKZ9
         X1vTo0sezRglXYZHCLJAo4ZfhH37T9MczTl5nkZOEc4rOGfN2ICtPuDTuboBAbSDA8Cp
         PtV1HMQwTWzXVcqRU4f1oRa56VMc2pB3QLzmWeLL9wd8eY+4G3TGv/+CMkWQ87fwQ5by
         XgzbIy5H4lHIXw+QnUzer38iFLSwW8QvwD1YSQExNyEKmYbAIVS2On+/UGhsuKmzzuZL
         CBxd9LweC78zOOoLydRdu0wbjUEaFhLrF8nQTxgb7t4xzBAoqJSkFiScZo/jZfbFYJLp
         3mZA==
X-Forwarded-Encrypted: i=1; AJvYcCXg7RHITpscfGllZzsXVNph7ASkEfNOfYIc0c4tfjpP/kXfpHWF/wGqyhsCu7NN6yUeeRczz2l4djT0jhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1RYg0C115xJ2DEE95f7qn8gF1XqU1bizMu1nux/Oa+EcTBxg
	ztYXy6Ka7Y1QYYL7ibQ1Ir83meIIpeOWqR5JGf0NHVxrxgBmVFqkL52/JS7pcucFyd420X2Lvcn
	UeMqdFxfkZtW95fOespgm+QP1jesfhRCQmb68zDUBzfJTkpEh8DE0FNk=
X-Google-Smtp-Source: AGHT+IGU1BugYKtYSCi9Fl/9FsIbPPTncwjselRA4wXdisDf7Q5xTu9+qCpgT81N6WVOO6wRNToO1AvfSg+/VmOV+eylCgHxBo7S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f81:b0:3cf:b87b:8fd4 with SMTP id
 e9e14a558f8ab-3d7e47747a0mr30941585ab.15.1744291323816; Thu, 10 Apr 2025
 06:22:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:22:03 -0700
In-Reply-To: <20250410124315.1201290-1-memxor@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7c5fb.050a0220.355867.0003.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in __queue_map_get
From: syzbot <syzbot+8bdfc2c53fb2b63e1871@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, memxor@gmail.com, 
	netdev@vger.kernel.org, song@kernel.org, syzkaller-bugs@googlegroups.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e403941b bpf: Convert ringbuf.c to rqspinlock
git tree:       https://github.com/kkdwivedi/linux.git res-lock-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1524f23f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
dashboard link: https://syzkaller.appspot.com/bug?extid=8bdfc2c53fb2b63e1871
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
