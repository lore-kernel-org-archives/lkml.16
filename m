Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4733EA
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749396823; cv=none; b=K7W04sptj1L71csE++Zlps7xhMQZusGJOnwLQ7rkTL4W7Aq8Ly54StuWFuqXHtqlAppaP5C6HZDVgiEPIamx32zO7tp+RL3CE/H6qcmu7z41z65eudrdivOCL6hE891fZcLuFS2cRFgrMvzj0smovKGNP8opkDx0PAUFVeKPu1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749396823; c=relaxed/simple;
	bh=bGxwRsy5v7P/zmboBRYDy57katExvCZKTduH5FICWQc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gZoEyTn/s7we68VyQ0Fe2z78pbCxA6aIIEGnOgtFGSamHfZuIENAGpP7vRmPFpM4dZDX4FCYBK7xAd+0ipagj2eL5Xor/D323milqCyG/WDHe4sZDeyV5+bun7OxVE/0KvNJE6N64nGpm6FBao+KjkjGSBDi1aFrCpEUEhAA/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddd045bb28so15793775ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749396821; x=1750001621;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf1F7Iqd6vpQLgOp+vEI9i4QKhYDjwNhs0vlkjS40nc=;
        b=NpP/DJfLf3hFmsHShHIBMbtaxAUR6litojn7n5cJvu9ixNAuNdCW5c+8GyoqE4D1jK
         amcKxqhkpHF5UJEuKKOrRJExL9bGC6475EAQcga/ES3p/fjyiM+J/vBGQ7BIbxw8ZpM9
         wIZcf8hyA9Cu76MGjuJQmAh2dQgMUhqB+p7RhGS45Yc0/tKYTtA2FHQj4KWpeDxxNCP2
         WBnraANO+5sNeiFHrrszVvP8Wt27reTs4DFA/0u4OIK/k6F2o7h7ZE7g0meQZRzDLIs1
         V5ACt5MxCg7dk0v82xQayypAKavKuS2vQ0V/4E0Jjrbyw+kcPsp8yVjdT5RXPR9xBRmT
         oLBw==
X-Gm-Message-State: AOJu0YyWkBB3RPqBDppOogby9UfON74+a0HQZUdBXmril1KCtPoItltU
	xHhCy+2ql2AeiqK5bYSgAh/G8jXWk2r7m70i2g57mUotQrzK9KqhvtYD+8AZn6O+qB9bIIsnoiO
	VXDrJAb3uQOj0BVEZxmSjA6Om2O9GgJvVu1FmY+KGqGx1YKfnwcp0klp5VM4=
X-Google-Smtp-Source: AGHT+IGMEvWneTPV03pegI5kN03x/+D8XGQvEcctJGg/f72z6XQ6bhphNHUTJN3VOwpxv+W/4eGbGTt3HFQYBUTai2seSwWZS4KT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156c:b0:3dd:cacd:8fd3 with SMTP id
 e9e14a558f8ab-3ddce4c2e56mr114098825ab.22.1749396821626; Sun, 08 Jun 2025
 08:33:41 -0700 (PDT)
Date: Sun, 08 Jun 2025 08:33:41 -0700
In-Reply-To: <68344557.a70a0220.1765ec.0165.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6845ad55.a70a0220.27c366.004d.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Don't trust sb->nr_devices in members_to_text()
