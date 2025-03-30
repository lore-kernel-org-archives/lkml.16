Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E862F44
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 04:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743307355; cv=none; b=ABinAUCwN/IaRIff+zLZTX7e7yLoJJcfiNvvfQSP00zhDtzBqfZnkzW8+I/ItPZ1SMiUHMiJMMpSdfw2j4rIkCWGgd08CaKAezEmNVFn6M9SBwQrptGNGc7ngNZeQCXdD507XXy7u4mjiSKRJBUf9B3ge0dLgp7u4Udu2qGNWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743307355; c=relaxed/simple;
	bh=g7nmG3cuX61qblNdtGJqtqikiHFRv+SmSC2NYgXjADM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SkNSSwlyB8uwfEGPZuaRjxv9UF3jtEroyK9qoz4cc+J7C4RB7zv5s1FChuE5XY2pz+YGyDBZUYb4jkxOStDot1l5D6TCOQMBl2n0pPiAb681OzkcXcDchVuP7VMiuB57DSnGxvLSljZ7GTEonzMkhKxDCxvmE2PJkbH6YD5wO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so36253795ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743307353; x=1743912153;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7nmG3cuX61qblNdtGJqtqikiHFRv+SmSC2NYgXjADM=;
        b=Qvtgbz44I4ZohswPmA+BpUwQioNnt7h3DP8ncM00O8YAz91g6wkKlIKU5eVQJlrBk5
         1QPARf75RT3nAlQNb80FpJ8cZQjksiL93QbWkY2RMmyo+RobtNXt8bIzOa9tz4m19dKH
         lo/ktH5096UytrgH9dZhb7UVzCxAoVxaoc3FYuOnxg1nPMu5oEI1aoxg74WJRjmGJkiy
         N+KEd7abjFj+HeKSdkBJXSehwvsi9fb//pRZUKsswNlgxqMwkfdeKfhTZpgTsgcbHFoh
         0VsYab2FNbuBx+rogWpOIpA9uMrZzOuVrIm09BbFFmZkAwNEi0mIA4ibvHPORyVN9WiM
         DY4w==
X-Gm-Message-State: AOJu0YwcV/WUC0YlmT+EpbvFwgl+5ChWCDDqsgRAYAwkBEMomyAhYSF/
	Qlw4UFayq9BYDjiXBD3qTurJ3IK0f3yydP44qkJBXNd3FWg6a7IFJ6xxbAUKBiWCvMeT8vRM/6g
	9hxX071jgoK60lABHSWAFyvC9+h+UzuhSUH420Zapin5iNDR796xi4Z0=
X-Google-Smtp-Source: AGHT+IEOYbkFG/9PfV3h0VVZizWjiQKCtpSSSuysORuIS/Eurvapy2Je/Wl9tVliMuofjkqeIentcUTdZ+yZcH/PVFYYcLUQDlKI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c:b0:3d4:3ab3:daf0 with SMTP id
 e9e14a558f8ab-3d5e090cd94mr49628725ab.7.1743307352759; Sat, 29 Mar 2025
 21:02:32 -0700 (PDT)
Date: Sat, 29 Mar 2025 21:02:32 -0700
In-Reply-To: <67e57c41.050a0220.2f068f.0033.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e8c258.050a0220.1547ec.0086.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [mm?] [fs?] BUG: sleeping function called
 from invalid context in folio_mc_copy
From: syzbot <syzbot+f3c6fda1297c748a7076@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [mm?] [fs?] BUG: sleeping function called from invalid context in folio_mc_copy
Author: mcgrof@kernel.org

#syz test: https://github.com/linux-kdevops/linux.git 20250529-ext4-migration-fix
