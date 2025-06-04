Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB53290BDA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045848; cv=none; b=JBI9phirrJTHgR5tnZrWJB+vBykronMjaUn5e7peCBKYtAqyGxma54TpC6UZpHuQgQ3Mm1vIrYZ4pE4sfkmh7NX09Ei8eyD9ZhBNsVkNgt1Qx64jJK4rJsWUK8Jnx8DRddToVRj1bNZ54NqUifMRA+Pa1wTzYEYAduqe7M3R+ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045848; c=relaxed/simple;
	bh=nzgbldK+LmxvjUeVLvaDW0e8O8bz+ASstGXZPtdI26I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jh4K0EvdPZM0FhsRgV6Prg/+vbyu8iKWz1mE7kfZk7qb5HgyTZYPQ7cXyaRPiBoFg6Vi6+qzEaywoxCmtOXVqrwUmnJVzryTpzERaUTUtENvnD7HfGJZYT+aUE3IHpgpUao9KYtKrPp93IwuiNT4PiFDCPPvjC/j2nFoHy6T/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc2752859so2839545ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045846; x=1749650646;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0o845Z4tiKBe/x4yb7kJ9IJMxcXX3Frj5AVPiha4+cU=;
        b=krWNiAMzcnTN0Gaxe64ob657QQmoxkUDAcJhZk6dXWofhuWKF96qnbdevO5YKzZLuJ
         jL7esVGLa7ASBB5CK3iNPOTHD34ksZlW/3T9GnKycKC1LWgYvkQIXjbubZGZ4nqhYLAz
         oqrKHpJUJ+Aau6TBWpGOA4BC8kIe1gO5fg0cTJt+OsEF8Vwig/Fz472PBaQWBgRvkyhR
         G965paQdLHMUNH83QIgLYi89+J32LSpqFmEd5VZhjTOMXEZzwtEOJPT9gMPt+uA1Ln+F
         hYHO8kB4lK1uGlr16kkbbkocrhP3u8H2c7N2ILaQclgfnj1N6b08UeksJTCtW2DEknCz
         wPew==
X-Forwarded-Encrypted: i=1; AJvYcCWFJ/6aKBf4KY+KWqgWjfighJPLIBd+ApO2ywD89bv+Qyq255yTgwK9jAqXKKq/pqyBcChg0rolIKBY6Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVX6ZMoKpeyygrTb4v7HHbS4deo3PAHdpI6Gh90vkrJ9ONSJQW
	qXXcZbTAVwRdRK2876nH+P8HbsYeL8uc5+Wq5+UiMqxJsaXiDOKEG+RJOLqNmoP599afcDlBwp1
	+9BWxK8gwJVDmW9QM4FixOeNghV7SjnET7Va8R/S53SM2D2apaQ4dbiD0WhQ=
X-Google-Smtp-Source: AGHT+IFxKwBcWsEivYBDYj/AVNiSpkOyEV8LXmdDUfMx3DUplBU+OBSyFW8NznBpKZ5T7Bd0AiS+8ve3dK2TX0v3oTpjDEFlFgZ+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174d:b0:3dc:7660:9efe with SMTP id
 e9e14a558f8ab-3ddbed0d6fdmr38320925ab.9.1749045846140; Wed, 04 Jun 2025
 07:04:06 -0700 (PDT)
Date: Wed, 04 Jun 2025 07:04:06 -0700
In-Reply-To: <CAGR7w82+NvTjNtc-Bvf0A02BFqZPPrXTr3e9iqaBTLoLyRwF6g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68405256.a00a0220.d8eae.008a.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-out-of-bounds Read in bch2_sb_members_v2_to_text
From: syzbot <syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/bcachefs/sb-members.c:68:44: error: no member named 'size' in 'struct bch_sb_field'


Tested on:

commit:         911483b2 Add linux-next specific files for 20250604
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=5138f00559ffb3cb3610
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ac940c580000

