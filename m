Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4F1D9A5F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744394465; cv=none; b=mQEDkmlLNwL9RwER4qezzBEq464WN7uIJjcCNfcAAPKjAy5Ihf4zIC4Kl6j/Nd3+DGvzE984Or+ql4G59tG5QXIX9l9TGr4VIr95K1pukhr2fk0NfLkopdocNEHacliq1wIi8LvJJ/iI4DG7FUe19U6hOQP2lTDBbJNPRowV0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744394465; c=relaxed/simple;
	bh=29F5/4brLuTIUNZs0SGB0imlFrxYlFI20ycy5m0lvAI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=egVVKLa/B7XA9giM07mikFjuczerqeVBsb7xzKYNQPFdplHrzwvX3yDL8lgTZoiIv1NCfIba/8LcjiAOtxBpKDjzpjAdZAIN+RIY1ZVW9bfNmrs4BPtovQ7/NhW08EEJTv2uhnbA9/jiRH+rtvQpppJ6ZddxYSMCa/7g4qvLLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43d1df18bso23518365ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744394462; x=1744999262;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVK9582xJ/K6d/nWSfhNSTUPLLFVBAToLF5CLvCzU6c=;
        b=iWV+mc7ITszlLnOaAOVBdER/SgNuyqwzJUNj0EqGBfHZzB+J8CLGxZhFCVbU+pIovD
         lGoVPQ4D/4Vn3dnXb5P2ELEa5LGHPitpsYAuLBSI/veOBtuYndvtESp171y1DhIYwBvO
         O4GRIi7yIsYbfiURLGg8harw+MVdraRJPswgojC2woQTNYxF2RbSglB8WUPeDef5MUyk
         Cm/TJRsyRZUk7aFIMRQ7OxR37ERlo9MZRM+d0G6Y7Ro9fhcTctyr00Ng9SnwiHluzXm4
         HfqiycWzerxwsLVkJXsHtnIgBCBN58KeO4yItYDfzIOr97lcI7Pfg4D+V37CQZ/cOTfk
         ijMg==
X-Gm-Message-State: AOJu0Yy6yGk/Ap0QozpYUl2d3+iO0HGXBvQhPqst5iBp4nASbrwl8kau
	9zGRNQlupt2Xm8aa95u2z8VgNWRh6n6r0cBLmR+xNzsW9qMvx/aDaSdwIYitmCvHtsQv+dPNzcC
	Hr3apfpJe17kZ6hhQjy5WnV2u3VVAGLfqzmnAFpPGi++uydCv20DK8fU=
X-Google-Smtp-Source: AGHT+IGhi9o59dU6k2gMxcIg1hQgp3Ck0Mvr7t/t0ubWyyA8RVKUTduF1sJp9JJVyXFNosJxzw41KmK2cNsmoRbl5uMwXgkaRLj+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c261:0:b0:3d3:e284:afbb with SMTP id
 e9e14a558f8ab-3d7ec2276f9mr36758595ab.11.1744394462425; Fri, 11 Apr 2025
 11:01:02 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:01:02 -0700
In-Reply-To: <CAP01T77pot4y_m1eb6AP5K24CM3u8=yfJhFW7R9H-nZTmFgo9g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f958de.050a0220.2c5fcf.0006.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in __bpf_ringbuf_reserve
From: syzbot <syzbot+850aaf14624dc0c6d366@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=110a8f4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea2b297a0891c87e
dashboard link: https://syzkaller.appspot.com/bug?extid=850aaf14624dc0c6d366
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
