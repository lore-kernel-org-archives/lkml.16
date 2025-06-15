Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25237264617
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749981366; cv=none; b=PfDq0PsLp/h1C4vEfnaWvNtGmoz8+mKRJNyT5eRiBWyY5fboKaV1We5bPZeYlIF3drvx3B0/Qh25h/MUTqtrbovPj8WSQXvXKbmavF8OavwOi1xt7aNCJwtIuGFSLXrYkHedio0fBSYSABRS1dVK0O6OEfC4rO92QgmafwSDOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749981366; c=relaxed/simple;
	bh=dZIhcLUob/yE99krHJIG/yTSjf70smLK4p8/iQjCoPE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GHz5mZ2S6X24x4GWS/0jiVxsx0HU7Bg+PznDv7JV/nOS8gKl19dHXFSKk6OusSLH5xfhBaKJ5BUsNZ0R3xqvrgjiWy/e1AUomrwExqU/Ts3oTQdyhFLW7X/hV+vH3KI3WOV+wY9VtA4SSts5A8Ug6VJzga4HaJ19VZYe0B7XowQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd045bb28so28801665ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 02:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749981364; x=1750586164;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocLTJRY+fhwTjCrhxf4nK0M6rGEU4j+JnFi0dOpX+ow=;
        b=m4m8n8Wj00UMH+VTvNrlyUyn6U8t+BTafFTCse8JLSVs3ICrT+vCI2dkfpYuNc8iAn
         yRATLF5fuJaDfg974B+Ipi8lGVXmLhgSHAawCtqObrzvMCVKNyDC7IBkmYAUkyts0knp
         JGnmEjy1pfowrp29ckAqPmxJZkywrmUdbBZYR88wt3LkW+OEsUunEo6KZEMpjej+ztUy
         e5o0zbwwaVBbKJ6b9si/tFueK7KwJrsl5Fy8lUWVl7FN9s14YCXdGpIs2QVhMnnySszS
         3tcEVAfJKB7hlBXgY48yB5yJ9bzPfiHRBnHxEhjGuG9XQbrtYc0mwUXRUmc1grXJvujF
         cIkA==
X-Forwarded-Encrypted: i=1; AJvYcCUmX3SNxsGQ/QAZrUqGvLU33ySeF0Crm/8Ko0D8WbTVXMCpuNuMs1sFFcPbpHxFRMDOAAE+IrVC063Xats=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYqXbK5Vtw+c8AfEsoLDtM72Haa7vaBLCVji3gTrakA+CYF30L
	wVBFSzwjs21wngrysaVejMXENYFwCBmm2RLJrRoKKxIxFNJHaRvcE28gH0wZQsrStcR+F1SCTuB
	2lc6fEDYJOfD2a4/NVbWzvNADkkpVSkZLx/72ZTrb2AUQI/k1YrHLs9DNzx8=
X-Google-Smtp-Source: AGHT+IEgPdrA2IM9OWgw6N/hK3nuguJZrWn9t3hAUZqWQkF7lKWgmWhh4O4vCROHhhDs8bphPbTlJovLhvktfgyPBoq6myrdvO2n
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160b:b0:3dd:bb7e:f1af with SMTP id
 e9e14a558f8ab-3de07cedfc2mr57014685ab.20.1749981364287; Sun, 15 Jun 2025
 02:56:04 -0700 (PDT)
Date: Sun, 15 Jun 2025 02:56:04 -0700
In-Reply-To: <684c5575.a00a0220.279073.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684e98b4.a00a0220.279073.002b.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: use-after-free Read in poly1305_update
From: syzbot <syzbot+bfaeaa8e26281970158d@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, davem@davemloft.net, 
	herbert@gondor.apana.org.au, hpa@zytor.com, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, mmpgouride@gmail.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d97de0d017cde0d442c3d144b4f969f43064cc0f
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Tue Aug 13 01:31:25 2024 +0000

    bcachefs: Make bkey_fsck_err() a wrapper around fsck_err()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1683290c580000
start commit:   02adc1490e6d Merge tag 'spi-fix-v6.16-rc1' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1583290c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1183290c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=bfaeaa8e26281970158d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1555310c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12810e82580000

Reported-by: syzbot+bfaeaa8e26281970158d@syzkaller.appspotmail.com
Fixes: d97de0d017cd ("bcachefs: Make bkey_fsck_err() a wrapper around fsck_err()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
