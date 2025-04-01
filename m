Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E50192B90
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480540; cv=none; b=PBIdtIOK4SLyXAJBPU2w+byQCDIqkYSyZimzfx0Nijw9FFDFHqBv0y3D0rrDRbhshjmPY4q+IpbrNsUhsOdhH5dFSuQ6imD1dtmf8KGgt4a8r5aLHA8ppucOezT0doD+oIFKZ/gpDPzbLKYuh61NvMpCrfGjTrp36lezFju4bEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480540; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IdjTOPs74xF5uD+iiqIJYsPzQkE/L+iplPs6gR/PiRQ/UL6UbLUuAo9z7dY4xIaLT5lqSOMmGMp+uSmAiJxKqS3Gi9Qo/kYCPzhlE/KCRkWbPr7e/OCocVTIbLVLU5FZPZVJ579Nzdy7MG5DknJvDTxQYmGQFpnPEoYJo4Ccmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5b3819ff9so46352905ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480538; x=1744085338;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=RUY26sfBBtFPdwvXJzziIsyNzjDnDCs3vp4a1IKogN2a/um0DqH9athWBOpIStdrRV
         MUwelGdqkztvfh7UAs1uyxlxCUERjrLebsHIBX3snUA1m1J4XZu6iCI2Ls4SFIpwx3bq
         Q9nTTIE3MlxoxllwOl+ArpbgWlsxuwKG2ylq4qB3IIM9Ij7J15G2/rwPgRPMV0nBfsLg
         X3F1ilIw0egOpTfphzHUgmFKQA77vdJ+XbjWZv76oHAdAdR5feOmqYcs1kQOEWd51y5x
         JK2Yt2OET3fN/YFbti13AGNwydo9fy23uIO/vXcnO6/uDyV1KKqMycoYo80uOt8k4AO3
         s0Iw==
X-Gm-Message-State: AOJu0Yy8XUEOCLrQqltYe/9E+zudz2EFqTyaRNX7fXfcZUtRldSYMFFF
	rL19ht1O3eVKKiTtrcX6vsC7lCsLlVGuHfe3e/5dGcktxsvqz7kWiBl/Q4mqocBWnWMFGbxM3T0
	oIPlU66Mzg696onFp5wTJLzdDP4QjOPeL6cJTxmq9mYXCcFOE7LkZVW8=
X-Google-Smtp-Source: AGHT+IFLxx0dBTrn6Qow0h0wTdL/x+Nhvi/Vu7S6fmx6gIDxq9Qqn69vuJnC0L68yETcneDzwlyAJQssarhl883YfHYm5flKM8of
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c04:b0:3d4:4134:521a with SMTP id
 e9e14a558f8ab-3d5e092acabmr123784745ab.12.1743480538605; Mon, 31 Mar 2025
 21:08:58 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:08:58 -0700
In-Reply-To: <67450f9a.050a0220.21d33d.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb66da.050a0220.3a8a08.000d.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+f02ee424846cc4e04e04@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
