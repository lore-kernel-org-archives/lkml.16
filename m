Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B019E967
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746352326; cv=none; b=lqRYL2jbs4jcwVXjODSa2SogRn4Y6bpA0gpvqYpwtSjd0LXyNmNmYG5TqKgW26mXY5CUmZH3AwuY3sHKYoKv+0CGs8+WLZosxxzSfIXVqFIvlSqj+/4ykKLJj8AhTbS7iKelKGtLZ8ZNpschf9A9XtWX6YGPu9GShUMYbVOOefs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746352326; c=relaxed/simple;
	bh=u3ZllCEErUzXM10HEe/yG0/k1hIxUJeRwUILm7bFe6g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m0BCCLSnA3cCAosxpf9Nx6Dm9ruQ4fPTTYoGfXT89I5v5GPHYFoT5e25LyDYffH3Kg7gtaG299Hm4JNmLvdzUrO0GDWyG97RD3ZnYDKIrSNCXijVPq2ZGBJqAFHbMdWqbYSzishTIIl0vN/CRCHK1ZT1QIGmXZ85VYsF4jEAIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d43541a706so29789045ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 02:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746352324; x=1746957124;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOqB0ylLnisnS82w2E9eqZPt6lMbQjhiPur1Ic1Rq3Q=;
        b=WMorFEZyXcpQVsb6hBBouGISBK0tSxPCqPbNjgrX9/cX4BPQu4umQhEUr+KTNJ+9xM
         bykakDN66SyRxZzaxvYsELnRRw5Y0oQUtDIAPFEB2chVnjrDLCeg0M2nxhpng4uCbaUI
         ZARc7vJ7vegcShaPlaIfJ4XLQwCNtwgmdtR/0b82Z8SDmJdVpVhvYx9uPuROYI4jdWBs
         IGecxt3rizSUUQxsV+phoEQPT5C55t3jYeAC2dRn4bEsLZrYW1wH7chOBfMQtfI+edMK
         Rgge3K0rRHC2YQMO5F+P2bia1/+gQjJoLa/WpC+RdkWyMWBwgea9oeOO4kFFB+7iBec9
         rP6A==
X-Forwarded-Encrypted: i=1; AJvYcCWvuyTVKPqOBu1vh96If9zNd4XUnzJxL5QjFfqLKTR7wct9ITfuSyVcL4FmXYShY2CD0GLugvBp0/8ZioU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIz+hVxvvxvpvjfVrZ6yH2K2nKlzC/ZsvMjfjB5jYYrhPBXCqi
	K/h8ntoQH6ZYlBIvJzxOBMjTH/RQwVjWQBjhJjRNjyOCVGjXera1Tn7jd7FgbY6LOi6Koxdfr3n
	bSFWdcuqpGuf+qpWQPDgWzS5DD/TxlHNEFxn4f8NlM1PCrYakPRnpZoY=
X-Google-Smtp-Source: AGHT+IEgwdAkhvFU8+ZwR1aaoOoFlKOilkqvB6dUsIJVl883e58EoTxNMDwQLKpYrPh6rhIqv3SrF33drLa9mDdl2mjxUSVH08Dv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2147:b0:3d6:cbed:3305 with SMTP id
 e9e14a558f8ab-3da5b27501cmr27271795ab.10.1746352323999; Sun, 04 May 2025
 02:52:03 -0700 (PDT)
Date: Sun, 04 May 2025 02:52:03 -0700
In-Reply-To: <000000000000820e380606161640@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681738c3.050a0220.11da1b.002e.GAE@google.com>
Subject: Re: [syzbot] [hfs?] [mm?] KASAN: slab-out-of-bounds Read in generic_perform_write
From: syzbot <syzbot+4a2376bc62e59406c414@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	dvyukov@google.com, eadavis@sina.com, hughd@google.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	tintinm2017@gmail.com, twuufnxlz@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b432163ebd15a0fb74051949cb61456d6c55ccbd
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Jan 30 14:03:41 2025 +0000

    fs/ntfs3: Update inode->i_mapping->a_ops on compression state

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=115c5b68580000
start commit:   fc033cf25e61 Linux 6.13-rc5
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7cde9482d6bb6
dashboard link: https://syzkaller.appspot.com/bug?extid=4a2376bc62e59406c414
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1654aac4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ff26df980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Update inode->i_mapping->a_ops on compression state

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
