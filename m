Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DACB2459FA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366443; cv=none; b=bKV8pTT6Ri9JLNNx0Avt+QfTwU4IIUZtQ9fKAqVV6lGaEd8cVmk2gHWsXcY4AYzc35YJjjmlTEk7C55HcqYl2kiIcWJGBNUPk+ijM6b/xCpwrHZBnOb4Dmfj6Nzayg+s7bOuxQ7sEnUASoqF6IkeJtOQnQJVHQ0Sv8obatrtN88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366443; c=relaxed/simple;
	bh=w9Tn7yjzWR2uPqn10gqrrwL7BPOpISHaZKXF7dsIRac=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VEcMX1LGGf3rawr1vRm4BtGoWJtj3vviw5GTt5V6BctDzz2Do8rciUAxuw9uaMWYtz7YarPj+1Oaiz0dcskUbozqkxY4cIyexxwAJ58aMLtgGZeRdIKi3e7oGNl9UAVoAnAr226TAEP5rfYxvvJHifcpwu0aGljZ5SPnCBRa6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso25295305ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366441; x=1750971241;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAE70NEi0T0FADs843dUAT/MnCqmvusO6x4sAWrq/mA=;
        b=i3bDpLVfuyleQVTEKuiIEWCj0PQKjLOxtkNuEhVlIFAwzVy41p9qgPS0nrRqSPRPbS
         A1oTuz4gPJCRHHNzFdfMhnaZ/cBJ1iKqBPOtfr4wFe/vLAJHvLIeYjIzRJIKWjzHvgu2
         2zdIbti8KmcwAUanUtNPhbdGiZLtV3quHTw495ZJmK72DJb9Tf3+stbHOUVOegTiHGp9
         7/x0wu6FmUicFznF/n1ut7IMkhcT0JYHc8m69d+q7CSztRM5LRHoJZNr8xCMSUXqFitR
         C96R+5ZvObTpusfCk24GytHjxpGono2bC3mDV6Myh3ymzJt+fUn13wWTiCImIWREvnb8
         rNVA==
X-Gm-Message-State: AOJu0Ywryp3jsJxp+KBI190APOtJweJ96IR9xbVfHk4NIPO7FtarKfDP
	JrPH3w+jD2Ms3tEGKw4TVHVht5vSMueGxARQrG1hd7uVOo1tM+cG1HlCBvXciZEKfHkRPySL0tc
	G+wWicSftz1jJ9W9K/V6Q24QWl43I6sTMt36C75gV4CwqwaM2LS5YgjIzAmM=
X-Google-Smtp-Source: AGHT+IF7yImLJrwQHoDMn21VV66S4Xl14FbPjWSreF6YsxijzTEDWu/2mVlZKiys4X2klbcrk+b2z7hscVnrMtc0bu4ox9kBbcOp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda4:0:b0:3dc:7f17:72e6 with SMTP id
 e9e14a558f8ab-3de38c2ee00mr4002885ab.5.1750366440741; Thu, 19 Jun 2025
 13:54:00 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:54:00 -0700
In-Reply-To: <684a8734.050a0220.be214.028d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685478e8.a00a0220.137b3.0019.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+011218db4fea20179df3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Don't put rhashtable on stack
