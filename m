Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CD72676CF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716905; cv=none; b=cMoET0ORu8pnW/lGgZkabU3Wv/tBLdlYKY0DJLWoLlFQ5W9lJxDi1hIwL5ziRh3FRMsBNrwBVve3Rah7cL3clKw55V55HRlv/CBLMTgcQCOXRF2OS9XQvmA7rzLnmUyWF+V/m7/5FazvD1PgWXErYU1PwKqOV+oTzz7iWzoTi7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716905; c=relaxed/simple;
	bh=QMBO7s385E9wpAKLsdE56tnQxhF9JHBAqthceUgkueE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QDPJP2+2eTwAgxScxYzTT97LVSDFCJTAFJZH2Wz0UcJu0VXWTQoiIB80SBNO4+cHrNZ0ylOqec9AhXleqGNHIRoPxQZkZZTVulDnd9qQjRHbCP7+xVxG3XH0oXQkikFzQIszDl7xA83VpC2V8OYez4r6P5RNhmOkqDhK2AmdZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so1165916139f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716903; x=1745321703;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZNIc1WYG85SzpoeWu8JTudhH152po17+aoqc2UVZ38=;
        b=jkK+oByNwnoKxV3un25m33RI1yES/0+GBfC02qn+4ZE/ewRBmpUrqjktRVjWuCxd9K
         jOHPAtige4/CPR8ZiMzJlG5p79Laubhrpts0hB0t8ZSKb/WbrRa9dJX1HNhfxSGNksQj
         5ZWbgtm7ZH6LNntz0djSzC0Fy4wdMkGsM0C4IEeZgquV9wrO+EAem1wD5IdkDSnzz8q+
         fHDOn+xOujWVuyLWovWoDAgrYF0muQlT0i0/TUsOYKyLd4P7JfRV2sCJnqRBIb3tWZjh
         AoKesJ0TqU2vcnN6FAwqj9C103p4HzY0A2sOCSXbIvgSdvCjrFeq/vSdhr7Y4nNFyaKN
         fNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcE5AhH7tDMdr54WXJ3LWCIl6qMEUtFLvTS1yZasPptpJm6PR9JGZsApvthP4L+FqUESpq6QrrurzRpxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKMJ7RKjBTQc6SOt1KQoVgEq3h+B2E64QAv5w6+IR+nJJiWKq
	9z4qADnpPluNoWdOlHfvW8xK6iZsL9jm2qUeeEICy7N8uLdlm/wdKjq9bnsYY157HAkaaWOYB4K
	/R4YOmgVE1qtyuocd51n3Ugo3utWl1BDAubqRlmyCaaH8qHD5dq4AFnk=
X-Google-Smtp-Source: AGHT+IHDZtBqgAvBINungu1atdPDykDelhYZ35UbVTMWaK1tO3SyOCkV9LKztHt0oPiCVygEZehcS37fmMULxWVR//AQsuQTt9hj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e6:b0:3d4:35d3:87d3 with SMTP id
 e9e14a558f8ab-3d7ec1cb534mr172656595ab.4.1744716902819; Tue, 15 Apr 2025
 04:35:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 04:35:02 -0700
In-Reply-To: <20250415110145.4052-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe4466.050a0220.6a185.01d7.GAE@google.com>
Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com
Tested-by: syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com

Tested on:

commit:         834a4a68 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16cafc04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a972ee73c2fcf8ca
dashboard link: https://syzkaller.appspot.com/bug?extid=2ff22910687ee0dfd48e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f5f0cc580000

Note: testing is done by a robot and is best-effort only.
