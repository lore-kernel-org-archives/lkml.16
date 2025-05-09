Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70F2918F2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796927; cv=none; b=oMs/ZoOpmzoc6MUcrYHDIJHLQZrA9A96OI+UGEgAE2Dgl6EAWKxTUL75uD5AWiqMVgt3bYe02ckeeQLE96edLY/WrG5Nh9UwdEk/IvWn8grGL5QuCLD5hUPeEzjK0yq47wnviVjr99/+VCo5X5N74i+rZfzr+coyqmDFu2juFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796927; c=relaxed/simple;
	bh=0On+d9nVwimScMV6Zs3Tk1Sr5qxnEGTdVbFoSOLcB1w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hjsFTGn8rrnWBFLuY58BnQBNMlK0b8fT1h59AifYmbJ1RVfhM5OrkHSzdUASwIWZNkxcJkxEzgu00TsfeJmocaAgOqIXG1jlA02jydBy5eXu5viouiC2tp0aJV8lplZKUWtwAgZQwcu8e12Q+6Ca+N/ep6DdtisE1MISjGeoizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da7584d3baso24110135ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796924; x=1747401724;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJYQQlaTccTEUpfCp0I+UHILKy9YK6R0O5mWKLiGsNw=;
        b=GItCvFBn6/Q52RN8uEJ3vGQ+xuEtAg5uV1gDuI66FymX6IqR+PKI/chcX4vHXq1lf2
         TMEkOKq1Fo/MfpD7sgFPOobejMXkX07UVNAX1xTxv5ghdVglXfcygjz+ra37jynKI3hj
         nvYD9Mjxvjr/Zzr0HvMzLhAM/PfFGHB9/6CsjmC/XZgWq3c+UEiZcnSlf+wj/IB1xiXO
         WHVWc4FeXny5sOW7XAa38rrPq658azItDx2aO8WKp0/5ilSEmlB3hvFhG6WSOg5yAGKp
         ZHPaMBHg+2rtd43XbGmnnmpIhTkFobYBR3N4hZ95FCr8w1W7VwA89jV5uVLJpEcn81X1
         6YaA==
X-Forwarded-Encrypted: i=1; AJvYcCVx40K6WfANRcqj9yZvc36PlJM5Z+AiQM6VcE2KsRTfXZted1ky7fek1XWKxVXKIAstWmmlXrAjFGIMUpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSgbchZK0y1QyJLmPxuO9MqGJ2TlzJEC84/Dr2R8+FI5ZX1pr
	g78BMyU3jE3FR1ZNNXLveC0Fobeo/I6hdSD/jsiZgUADOv8+CRiNrI0+f9UrWUg7P+IV3Ezo+xq
	3wXP7sNuNEcU7k1jRAc3Sidjddabl8J60UkydgtMIdi937Y4+1btTeO8=
X-Google-Smtp-Source: AGHT+IFWDazcRKqOfDTajh2XZBqKYx13Bx34NqKFzZjZq5XGAhkSdffanAOeY1x3H7yGqeK/Q2i4vgy9f5eTv2KomXdJQTcL8MxV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc6:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3da7e1e2545mr39537095ab.5.1746796923982; Fri, 09 May 2025
 06:22:03 -0700 (PDT)
Date: Fri, 09 May 2025 06:22:03 -0700
In-Reply-To: <20250509124246.1843-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681e017b.050a0220.a19a9.0132.GAE@google.com>
Subject: Re: [syzbot] [sound?] [usb?] WARNING: ODEBUG bug in snd_rawmidi_free
From: syzbot <syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com
Tested-by: syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com

Tested on:

commit:         9c69f888 Merge tag 'bcachefs-2025-05-08' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=127b4768580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f72178ab6783a7daea
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17032670580000

Note: testing is done by a robot and is best-effort only.
