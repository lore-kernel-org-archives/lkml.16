Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E9C139
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588344; cv=none; b=oAtPHFGeMBl75rpcnbFVJowsM8oKxzXCHefyMif0VdhWGIaV+1jHdhHVrN1Jy7vV3zxIJKXbwT/M3HocP7i1dO3KJFiB91G6rRLzpUZK975n2/RGym/5GGZtV0KeWlZiQRTgCFq7WDWCs1dhr9dBz3kPyz5K8J+XdwBKlxgOhJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588344; c=relaxed/simple;
	bh=1Rf62eXRmwpvteA12V5qtJ/DcWfXeXSz5IBgQtwngmk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PI5LVlIEFNxsIOW4McZK97xrjAuuR9zOfntn/Vs19T45xpBfhGORzHDD3Fk7PByodHGsJ/fS00XouTXzOjjgq6iCeVAI8YlWed9nUkKoW9LXl5EboKHBRWq2SCJZjiFEPJgJtI4Nxi3NNMtxEpgDiE67CCoabskeCjeEuK/Gz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8cdf1898so29790535ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588342; x=1739193142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Rf62eXRmwpvteA12V5qtJ/DcWfXeXSz5IBgQtwngmk=;
        b=Kvx/kz8Foi4SP/d4zlnbW0Ksh2fJeZRig4gCZziO6xG0E9QTjxcBISfq81s8ZFfv0U
         PjJMJQpxZa+ybRECilJy1glpSmScEU27f/eTzxDSA/UG3VKAe6IrLgHl1QRTZeQi7x/k
         Vidh27nmATk1X87jTvA2kemh6aU+lwM2MSlUWhLuwaiAu+1sffWS40Fuh/BPDjWbHuQR
         UQ5C2o1jKpvUZztH9NHudraACPr0YzaRh1f1BwtXmaoPUbOrLRQybH6aOWG604Tkg7OA
         HU6HKtFN6ofw+imLsXJMP4PtvaOdWgfkpMm/grydZ5ogw593nWSauXjuqqKrVhyi1ZUB
         aI9w==
X-Gm-Message-State: AOJu0Yyz8HA5NrlU1tYoK731eskdtRJKj+bFMwuC17qiAw73/mDSdM+k
	oT6Y13on7IlrlbM6EMzrMuWQJeP8Wy6EEeNrc/NU9HRb6iZrabVEUGYMUzAWX1qrM2wIqxne4dz
	eS6Aml/RkJQ0yqWeNLp1J54OLY73uIZ5vt5chWZE4gY+iUMFgcs/rtK0=
X-Google-Smtp-Source: AGHT+IEAhMLyVVj8C1r79+b8iqErU0HsCzwbZcjFgQ26JKggGp74rcFaW/obIlbmNMrD90++PgYEvmP4EhdMvsW/oOf2QMmqQhmO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc3:b0:3cf:c17d:5cba with SMTP id
 e9e14a558f8ab-3cffe3a68a5mr172933855ab.9.1738588342138; Mon, 03 Feb 2025
 05:12:22 -0800 (PST)
Date: Mon, 03 Feb 2025 05:12:22 -0800
In-Reply-To: <672efa7e.050a0220.138bd5.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a0c0b6.050a0220.163cdc.0045.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bluetooth?] INFO: task hung in
 hci_cmd_sync_clear (3)
From: syzbot <syzbot+217e3f1283cafe80586e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [bluetooth?] INFO: task hung in hci_cmd_sync_clear (3)
Author: iulia.tanasescu@nxp.com

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
