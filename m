Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8991E0DFE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089717; cv=none; b=ambsYvQdGfYqkSnOXhF1t+cqzX/7RnvLcwZrUqwocjpZPS9zu9PdbHhSFrnrgkl8PcZblC8I258CwE+JIvv1ytLSVuYx4R2xmIoLvPnvzYg1a5rQdIb3vTWU9AjKbSNockwZKbZZkg0AJKWhwWON2H2iJVPr64jryHQMAZcbPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089717; c=relaxed/simple;
	bh=VrRMr/oE4Lv+bUa1k3MvYvoDV+jDxeGAn6ThJX58AEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=inywyRp5p7oCMVrzVpeRswc1eI2jriaia9Yqwsp89fodvZquLn5VUtJYUEzMnPPyQ9lZCvjAlNjah+i/aZm0kaVy0CjFEDRYDppoEEBAod62H0kWDglm91lpe+frUkZRedAs53FRaKU9UEf0b6FAzNuvTzsoUSminAtTlYQLSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3de0f73f9e0so14857125ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089715; x=1750694515;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrRMr/oE4Lv+bUa1k3MvYvoDV+jDxeGAn6ThJX58AEs=;
        b=APcumZ2uM6kEkAvfLqAvYoQw46pKHCcYj5ua+EBvJuXuv4eZzs8jCMU0VwX2RQyzRG
         vX2zAwnPhzalPYT3IOzRyOmmg9ljGQ6wo4wPzmjPnFT+wJeRQID2kMWNbWrb7lf+4nba
         LLiueiNrSnSti8DVLbRfu+P3GVHDdv/eRStKPcg+Jm/b+Mr7b2EofFU7C7nDSsOiGS7k
         8sdm6E8j59gXwqxZLWS+ai1z0yH5fP4A42co9IO1plVNM0pBZV8+G94z27Hu9HHJRUTB
         aAW1hxYH6HpsywBzyW3QQuIahceJRrQAfAPfhh4TgekSffxpbW/mG5eYkqPRTrBrICUz
         1sqA==
X-Gm-Message-State: AOJu0YxJ+L/R0e45XTVABDq4wFWCuBZNQqTu+IpG928S48Iy3I51ZnnC
	rPAsuhpmQzThPGaXY0pPmBlGfxvr4g0EG89uhAqM1kUYW70IEr+XErpoLljrOQiyKHgSaLoljaD
	susnCLHbHZQ/gBhd2pCYr7GJ52Wi2VOSWOEigjXhVVPMjXkfsZTDpswYwVag=
X-Google-Smtp-Source: AGHT+IG5KvcaXAzeI4aVFy/9ZrXjyiauQZS9nR6oUSD3BAUXQbJN3OGU0jFfkufS00kcahbILIYjT0syB5Y+CTCslT09Qo40pB4v
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:338d:b0:3dd:cc26:61c7 with SMTP id
 e9e14a558f8ab-3de07d34062mr110038985ab.20.1750089715153; Mon, 16 Jun 2025
 09:01:55 -0700 (PDT)
Date: Mon, 16 Jun 2025 09:01:55 -0700
In-Reply-To: <684df1ed.a00a0220.279073.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68503ff3.050a0220.4562c.0009.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 e04c78d86a9699d136910cfc0bdcf01087e3267e
From: syzbot <syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e04c78d86a9699d136910cfc0bdcf01087e3267e
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e04c78d86a9699d136910cfc0bdcf01087e3267e
