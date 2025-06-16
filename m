Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72192BEFF9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089787; cv=none; b=U7vQ2mcrVsBOVUbKyNJ7tL7LOyCP41IC8nevoyl5luku7il0jvjo0zgtYkcSP52cRDpzdQwUhG3VDqIjGhmi036IaGcGEm4yKHrTS57f4MYwwEG7gX9e37bt65Rug8erRtM4SRJr4HbyKYB/xvTv8h3DzgmFKHnhCuJflEC1Vok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089787; c=relaxed/simple;
	bh=VrRMr/oE4Lv+bUa1k3MvYvoDV+jDxeGAn6ThJX58AEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WMbFMrkoJZt4dI0L7oG/dVcDVMJbNUN1bUMsa8d65Uw+G9Iqd1V/dbqn+loAHb6N7xwLEl+tiPIt77fG2U6O29KiL3dQurFNk0aI+eFL+A/ovu116lYIBeD8RvxYShutpYpiUkRhp2gk9MSS5YngvKDHJFua4KiwIhLjNRBAPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc1af1e5bso117426855ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089785; x=1750694585;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrRMr/oE4Lv+bUa1k3MvYvoDV+jDxeGAn6ThJX58AEs=;
        b=ktJNffQKmzfdqe8HpAfWYqwDL3bV8+1WkO2D9lMeYvFY6U3u5GNFO+vPjs+Lz9j+Kn
         fOmqbtqlJ2i989I1NglIqsNVAdu/BRenmno7bacbqoIM72wz6eJCX2xkXhN4H7vT9rrB
         WZ8l/oGnDsQ/aqhPJwBhOAOPOd6p9km0+HgwDtAWe+b9Rflsa79l+r7jknwqEZ4zSfAh
         kfshSE0UMtKFVI/u9E3tSZTBa9dU7mbDZpgPz/FpaMdKyQXjGZMcr6H9zboaQyPJygKf
         QQHUsnhuD7+9h4pZS2kp8sV+Qe1HksMPf1ruGdvH9EAJfUgsfCmCW3Y0bNvwJ7D/IjUf
         USkA==
X-Gm-Message-State: AOJu0YyzP8h7pIyp0yA6qIAgMAYDz7Pntya4ZABsuqPciqs6TOZm0IV/
	a6tprzAjZMn2mNeHP1/Yoq7g0wA4ymmkn0Llz4HX7esznoeO2Du0fwk4BTwakFdhxVOIn5vIUj3
	gKKwEECGyMu88lvcmcbm2xws/S1hfJ5ss/dwHAsxfeSNyZC+Nlkh5obPDptI=
X-Google-Smtp-Source: AGHT+IF9bpL4OtteE7KbW5IrIC8Vtj1hFy3fvj0DYM3XJGHbM7vIuGvMB/ao7lsIEC7SFUD/MsnSNqY1UKMbgc9AQAbM/qeyXhvR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198e:b0:3dd:f4ea:109f with SMTP id
 e9e14a558f8ab-3de07b91362mr103155845ab.0.1750089784814; Mon, 16 Jun 2025
 09:03:04 -0700 (PDT)
Date: Mon, 16 Jun 2025 09:03:04 -0700
In-Reply-To: <000000000000043dc4061e61370a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68504038.050a0220.2608ac.0004.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 e04c78d86a9699d136910cfc0bdcf01087e3267e
From: syzbot <syzbot+916742d5d24f6c254761@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e04c78d86a9699d136910cfc0bdcf01087e3267e
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e04c78d86a9699d136910cfc0bdcf01087e3267e
