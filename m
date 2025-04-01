Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8381DD889
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480377; cv=none; b=BhypEldoRp+XA6WHTfqq9ZQ2Tt6cwlFzWqe2Nvx4pJbWQXDMOfX75A2Y2G22Cl19Ck3KKLARxSCtn20Z+Wk+zFj9iklEkQvqlp2LRYV5mcfMkHwVA0hiMWxSSf0eMF4fUVpyxUvRB6CFZpA1LD2yW2MvrHzHIOYr+NRVVVYYL4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480377; c=relaxed/simple;
	bh=FZvyO+CH+waPGu0bUdSrHBMNWzHkAiiI7Y/QcwEqSk4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OBf95Gb+OMeccWKwuhJYmrFaY4/BtcZaJIC1MRpyGbv4M5E6XWHwx41bnur6jWEsRX0hW/nNBEp/0eb1DVk5QO0NYmdqcK0x9Yufkz0Z9tfrzdoEGb3Bn6Zb2doX3crcUNRZ74YojfhtbBeQfcd4cENzxVNTAql2bJ+VCRmzPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d44ba1c2b5so54768575ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743480375; x=1744085175;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzG2Y/TurTR7M2S+S/zPulC1BtJ09P274Dqqe0OY7h8=;
        b=nfRFQcQ5g6CltU8ImYk3Kc17SZY/GxM89Oe3wFgRGxeBFgQ4bThCphA0sK5pNCIY0m
         v42Iq2nJDtsKyv5GWu8/jCLQRswaGAC9QKXKjzlt4xUb9l5rJkU71+KBn80WMGxwQv8y
         FNRxENDJrlJUcj/JQItoJYRE5Wjfe0FSiI0wbS0CJyht06CS2WneU4veTQUjkvu8pUfO
         xqXvKHqRK7WBSpTL8itqaLCfSYUijNo24p/duL7uS6HBRC2PzFl9Rn9e+uEGM6uAK1cA
         R2eS+HcfMjbOwHFPoMNJu6cphXuFhxdBoZo6EYnz37brwZCvFU2Psxrz2JuBOXkjPJyo
         mhzQ==
X-Gm-Message-State: AOJu0Yx3fA+jmtGu95yDtxgAhb2EJ9QS1wUe9I0CfU6rBHHuG1byEYxN
	1ce0P0HXN1NP10tdnEB9sil0you38AHRYAVgY3JlNeXiK34sxOF+S8WpfDkf99r+RClkJv4BPlX
	7n1qP5ZyTeYEypUzm0EROmQMxXnuWob2a1kE+KPajtEiIfVkxey+8esM=
X-Google-Smtp-Source: AGHT+IG9zuK9bOkY6qDjhR3HNREnXwqnkexQs+w8XrFEv1CWN1JnVgDqGutvjS+L1Qzhgnzaha9WkCOxC8RxhZ33LQPU8M0+vvcB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156c:b0:3d3:dcc4:a58e with SMTP id
 e9e14a558f8ab-3d5e09119d6mr116171105ab.8.1743480375383; Mon, 31 Mar 2025
 21:06:15 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:06:15 -0700
In-Reply-To: <675be8a8.050a0220.1a2d0d.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb6637.050a0220.3a8a08.0009.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+983249082bd062b1c4ef@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix bcachefs: Disable asm memcpys when kmsan enabled
