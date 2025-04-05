Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418519DF4A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 23:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743897544; cv=none; b=VCABxuZpgUawS5hX7gHeyRXhTyONOsAodPu8Cso+DKLAk9n9UUa59125NyeZ4gxd/8OQSstdKJDQ8n7L/i/OTXKuKItnCLlBUMzpwiD5FDjOIJdzRolC2yiauMsaO40Y4kzm32qT8v2QC0Ytj8xB/vON5N64pQEH/tW5kXOZubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743897544; c=relaxed/simple;
	bh=j6rqZnWCGb8xF38LEndZVydWX8LjpEp/y8znR5pYq8Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SFQVpYeKMYqq0H3XGvwUYvoOFpERP2dKkaoe0Hb3lwIOJyMu8c8icG9btWqW9SVcPiusnYnnhwU27S4Fe82ABVwq9RcznPi7g2nzX43yKGhiqJIgpohvw382abiY6JXJfNC6m9WqSkakDWtVZ9tIhjsxwTUwrQblgytbQArL2Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85d9a52717aso449021539f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 16:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743897542; x=1744502342;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lw397YWASEZPkst9lt6LEvZZICtQhiQ8fO1uVLfDBjc=;
        b=aMrZ/UBiwhudF1Pl51s6A4jHoZ9pd1qnC390+xToMCt7EmtClD13E+7KuSSx6gtU3b
         /Fv6O9U2Cn2CDkvF8c8NzBlKatCZZuGOuD/kUHSmV7VPn1swempypl0ybljzdHRtwhyM
         h1h3erdYeGCUS1uc1WOXYvHGi1GQz84kBLwV+8wfbTEGTVZhAD7jTwdZD2UB9zkMmuoj
         aUHIAGtAfM6QwSpXPUM/niBEISyN8JvMCvVKjzX1QFq0FpMJTnSjGyDEfViUp6WT3gId
         4bo8hBSgDgbuAONZ6f0tbwPIb1INb3AvVtgsaXEAPaE1HA8xcKvJvluVAhG8KKRndDJ3
         7xRw==
X-Forwarded-Encrypted: i=1; AJvYcCUd8/z9c6CWo/vxvHVLI0RjZvo11YaBX0eINuRdRoL5IbiT15kr6sIK1YLyAdGWGCnjczbZDKJhytwj2d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGZsNlsuI2NPMCrwR+TRGatrECAUFkp27et7p9wZzjhXAQQjZ
	MQ689irOcbwu8lsq+P0JFQwvXvOTPys0nmdm1bzHVQLByg62Fw3MMXbw3Mb02KtEamLU67HSCLH
	OmJbX7Lt/unaiGErn0mOtG1lLVsXZB9U/+NcwtO/Ozj5Xz3Oy0jiWNZg=
X-Google-Smtp-Source: AGHT+IG37vakfk1AvHi75wiN3DL99J6hmuAKuDgUgc1sRnatijMZPQkMuY9IJZEqBLURNSAP2//SQkYTcyzEsOhqlRPb1JnDeqPo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd83:0:b0:3d4:6f37:3724 with SMTP id
 e9e14a558f8ab-3d6e5877040mr95175725ab.18.1743897542276; Sat, 05 Apr 2025
 16:59:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 16:59:02 -0700
In-Reply-To: <20250405225848.588332-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1c3c6.050a0220.0a13.0253.GAE@google.com>
Subject: Re: [syzbot] [perf?] WARNING in __free_event
From: syzbot <syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
Tested-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com

Tested on:

commit:         5fc31936 Merge tag 'net-6.14-rc8' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10f3e23f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5729e4e4ef1e3907
dashboard link: https://syzkaller.appspot.com/bug?extid=ff3aa851d46ab82953a3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17c587e4580000

Note: testing is done by a robot and is best-effort only.
