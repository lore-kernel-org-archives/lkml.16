Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126C71A83F9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243044; cv=none; b=O3bWBDQtiSY38FCs0l8G/tNV7xzQWy9K8SMoaIQ1Q5ShpMzWQwDmoYAep1UWGiizDWxqwRlV8wig4JJC3iTrLMlCn6HVUWv43lmMv6Rl7vVRxXxSfiGFuyYQtYpECU9Cvpz/pJuW5kFKe7pstIHlBeGCUB/bJ144keZ9k9LZbRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243044; c=relaxed/simple;
	bh=L7LVovb7i54t6xGC3eTK/GKnVT2U5I6IxinxPBEfwiY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gmU4ZADYY67lp6Q8aN7elhLQz71z7wLuEasM7APB+x4hKyRRaAhvyUcAQTP4Ej4mHanXWHI0Sf+7sgNkk2x57cS27YszPDJATNz6C+xUfu4gdMrEm9ZshVIa7QZt3VJLLcP3L5DlA3a5mNIVYiqjxEmZi82uk4w/XaEqFRqsOp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so76941785ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243042; x=1745847842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eK7UM4Up5itS/iAzTbj0F7GLYe1ZoleXVB8qBXTXCBM=;
        b=pz/w1i1gR54v60NCblMfZRuCpi4aiBYHWEI9NbO4ojlnBI0lUv5SBTFGW/W9uR7lrj
         rZH84he2tc5PTOmauWMaZnqoAIeGATlCIUXivWrAYeGq+hGbZQyC94o03RwvFeGE13gJ
         bbKQr140fAxaal4YqtAJKnAz0BX0LdPzhXSde7MM//c7vfu1uwYYabMGjRFJoZszcaJm
         q/B8cMX/gxDaO3WsrtQf1WaxEzj0VHO8kLGR7OUux69L03iUTZ/uIcD0mzfUAr1KtIZH
         +hm0K/mvldvOY2WEPMtzfLGSHvmdkRjsbQizuBvtwGQzHfqP1nDo2uDe9wDyOTjtqT4+
         sYJw==
X-Forwarded-Encrypted: i=1; AJvYcCWJbldfUurG63FVcve64LPFhETyR5pXKW7UgEN/q4wCoBgeNsPFiicPv7ZAOz1XkmZfcH78e3XpMhBJ8Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyphLezVkmHGX4/DI6gIhv+GWw5mdduG9XT4kkQpyFkFyAUYcql
	GZTOw1Pm/Wq5tcDZ6h3Zuu67m+6UWlhaG8wMVBeWSpsUB+UddMObb/UXHID3Agguir1afxa8bM0
	nrtCZ0JsUihuM2aL8dOuTf5vfyQZTUu6coRbNWTLmxa/OS4xxfnzkqyA=
X-Google-Smtp-Source: AGHT+IF9ysXMTFf8CgWzRMriDXjBqouYEyJHSrGNeZyFXfnk4ozHjIBHx5IncQiXsLC8nkI78KnM0RTNhvhIW8dVHe4qJYJ3dy9I
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c21:b0:3d8:1ed0:e17c with SMTP id
 e9e14a558f8ab-3d894298bfemr97551235ab.19.1745243042260; Mon, 21 Apr 2025
 06:44:02 -0700 (PDT)
Date: Mon, 21 Apr 2025 06:44:02 -0700
In-Reply-To: <20250421134021.155569-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68064ba2.050a0220.4e547.000f.GAE@google.com>
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/media/usb/dvb-usb-v2/az6007.c
patch: **** malformed patch at line 15:  	}




Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a7c679f880028f0
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16719ccc580000

