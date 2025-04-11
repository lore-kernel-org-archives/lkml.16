Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC91DB346
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392725; cv=none; b=MxIqq/X1rmK+Y3zV6iXJbgz0/EChaNjDmxNBJ2+sGM4toSNZOlFmqeBMWdn+98QTU/ISfv+fIaT9c7kAqdoD+ODkHlFlyCi0dadV4z9tMjM8l2pleB1CuxcsXg+WlxN3O1opdbTyQDNTiY3oqva8+GKV0b4Pt2sQxF9J06tSZfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392725; c=relaxed/simple;
	bh=JEObpoeAi7mpJ4XtBWdTdJGAZx4mwP9jUytvLhjRH6Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=l9x8L6IPk1aZTU1DOt+Ugbp+M13thxfkUX7HpY+x9BNAPEoqfvJrKPM30Dze5U3iju91OV2IQ7qs0hdIdNcKbmplmobi2kkUgG9VWArN/sdoWx50Dsd0QGCLdlOugLLNnULW7VrcaZj/I1QENHBfpeIr+Ish/UwEPbzEAsgav/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44ba1c2b5so21891305ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392722; x=1744997522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4luqEepRVG2eUJKzsszBXGgVmEc2HgHZcBzd3X/PEqU=;
        b=ILiXw748L1n1AKzH6j5xK8CbzbbrhAUxvaVvYCVaJrmw2tap7E8Dfv62j6GEkFsFdw
         GMX7TS/npOE2FRvnvnjw+CouNnJd3yrbS2RR29yEDM4l971e8mtZ+bvKEaL7ghmca0/D
         PQedH5CEs0ATWSg7ZbdR5npmvh0jtGno2nkdp2XzosXeuCtBsWPInAvtt7QQqkUAgd9+
         FBqBudfUAjBjq20IUpsf9MetXR9jZSDy/CW12RLU8ViP1U96/Fo0dr2+S+rcAixM4A9u
         a95oKRNa4FWgHUfeJcEXoGpcVv41qBa4sUrY7Kr6CvFmr7S+VH7/ws1kRRiMGXFpahYv
         xz7g==
X-Gm-Message-State: AOJu0YwkSkxlYz6fb/GLuURAHiR5TjUL6Pw4ctFymhA98nHfGm+fw1vB
	TGo6Elw/3mWno1dZO6b/NLwZefasGbEtqlUcBiH1ViBKd7hRaS8hHfIbh4uLG3O/AS6v2r93WZ9
	RuI0xsh/XfnUiI/PYzXRyUTXalQj/Nqtc/RRHopOwMMOmMlMPwrzoFT0=
X-Google-Smtp-Source: AGHT+IENbT2I53iWGd9TaeW5jKbUNCHgfYhoWvD5lbvUNA/HDZj78D9hp4MGu+FetDAUKhYy4ahWorabnWKBsxJyZkQt6gAjlxeG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349b:b0:3d5:8922:77a0 with SMTP id
 e9e14a558f8ab-3d7ec26b625mr47725815ab.18.1744392721953; Fri, 11 Apr 2025
 10:32:01 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:32:01 -0700
In-Reply-To: <CAP01T748Cq2O0LXeaNix1zLtFuhuPWutyHo5XLt2ytNLdAno-w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f95211.050a0220.379d84.0002.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in __queue_map_get
From: syzbot <syzbot+8bdfc2c53fb2b63e1871@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, memxor@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e403941b bpf: Convert ringbuf.c to rqspinlock
git tree:       https://github.com/kkdwivedi/linux.git res-lock-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16e61c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
dashboard link: https://syzkaller.appspot.com/bug?extid=8bdfc2c53fb2b63e1871
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
