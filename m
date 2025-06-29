Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC32236EB
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751210513; cv=none; b=BnIkm4qD+bcCdbutkaM9cHZkjFgqKIdfQ1vbX8xDw4f0Tti5U08754bh4E+CjI18J5IQZWNYUXOY41ksIPR/FpkIgb2qoQLLbO/qjxKYLujYCMKU9lA06L5kvKc9iKholIPFEBJOwnGjteBJe3L/RgBhls6JyJTRdHPBOGsq0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751210513; c=relaxed/simple;
	bh=9jWcu/3gYW1IPHBUKRzNrfiAcCpCDdeEmKd3+r/mdZY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CE3IjNN1MPEDtprJKcwKkiDcDQDYMx6XMoEUuRDjhjIbCPH3fXxo1tnZtuo9lQzxVbtXwoT4tu4RwaAJqfhfdE8ki161IEYwAZDbuJEOw3+vUjrJyF1VtoTDIvhQQ4Nh/mpXcSA/I1g6sVf+pmoBKeNgeXYJWOLUgQAmjY0XXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso26598575ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751210510; x=1751815310;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnApe3xvmo891uH8C+tF7+qRA090b//1t1OlIdOqExk=;
        b=dBn6tB6SEwU1iwcr4oh3HAhD1DXc0+6bCkwSrBwKRv5BKYRQVB6g7ZK4YMNwEwIH+R
         xzyXxNoEon1P0RCVwwFM9I3hxGH3mxipv6utevKs78Dz61oXf8KG4ekOnxaQgm1YjwD3
         Cz2vZ2dJEBY8yvbKBkNU2/2P+uCkt6Ee3Cu8wNNgWnUQfRSDk1w10n1umvlomIjhEmxT
         WWPt0H+GgOrh8uTc/7rBqu3nWN3+kTXHuQXlI39qnA2ack1/XxXuBZGqyHZwX6nzGMMg
         ORAhWdJ+8CVCYLljm5mmfKwBnx1FOWK+2VMdkK6LtN/i5FT3BV2qOnrW1hW+bzNwClWl
         l14w==
X-Gm-Message-State: AOJu0YyGej8G1Le2ELNDPN5V92ux4Jf2T15A15mNO02MXpEfjrkdiAHA
	n3U4k5WGrqqvGgQHCnsT7eHIFLyUeIygaADojqWjUgeJsu2veItij5qTjHDJxwZ4ZcV7WLklX23
	n7HL5VrL6MbAKGi7WjwNO3SpqLZGYRvwusa9N9CXqrvo2puXfijIFNdsXhDk=
X-Google-Smtp-Source: AGHT+IGvM7FYntH95c+xn9ItM5HVLKYYmE8CBA7+bYqbShik8vKgFEokfpKvnknVeVckFGw/8cFuz/xmQhr9ovrACtG8GA7JmTc4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d85:b0:3df:3d4c:be27 with SMTP id
 e9e14a558f8ab-3df4ab2c7dfmr114936085ab.5.1751210510713; Sun, 29 Jun 2025
 08:21:50 -0700 (PDT)
Date: Sun, 29 Jun 2025 08:21:50 -0700
In-Reply-To: <6861280c.a70a0220.2f4de1.001c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68615a0e.a00a0220.274b5f.0014.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [block?] INFO: task hung in bioset_init
From: syzbot <syzbot+a6810ad79a40f9e34f41@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] INFO: task hung in bioset_init
Author: axboe@kernel.dk

#syz set subsystems: bcachefs

-- 
Jens Axboe

