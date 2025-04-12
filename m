Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EDE1F0E2C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481077; cv=none; b=mzJmwnMViqYrquJj0PYnKH59EVX+m5OFy9h42eQNW7q2f4psEjKigzyhdU9rTkP+hpmi4l8fExJ8pIO7Yg1ZEko411/Po1UWVYDnaGHkcMmCuGCCsuN/2vHL8hUUmHINJnvI1eXzOzcbIaCgdKeDk2lN9chPZe+y4Ym3ufRXE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481077; c=relaxed/simple;
	bh=o1+j9SdXj41J8uzTtsahM4t6OBWwdcLbKAkiYzLGz+E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eKUUweFzPmzb0wtqbZKfuqVSBNGefgheQ+avCdvBZmfd8Jv1DDtYWsmp1Nocd4aXqgC39zZacwtJMhm9ZYUnL2WWpLzyh4IopQuZlPm/3bikOODxzodVjwCWvDiG38BUwwXhqgqVeqm2HW0VWp7QBvkSJcogIdt2DtmSFdNNbFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d43c0dbe6aso58949965ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744481075; x=1745085875;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2knTX2uIuqaGUOlE0CBKIzKL91Rwf0r6rw/x7RKLifI=;
        b=YmNk7r+DD2DWETXahPcHTXyyIQzR5/Phl7FN1IZhBM44E2TojLNeEyM7+PrDFIsHa7
         YcNgs8UDuLCyo0d0cMb0gYIbcEGt0T6S9KkCTWXW4AlT0WXXBSVCMf1aOsI0mjmhRBt9
         Tug+il303+KveYxd/bSh0IzgYUvfaG9PDWeUM58DcG9Z9lmSkO/Fc1pkuKZvxFC/eN/J
         +r2l2xPeP9k0MQeeKM/jwLRQ+n8LRfG7LYzeULixZWr3/usEzRyF3+Ngo9yajxnCuBL4
         6geL3iFAuDcjH8Q5Cg09+u6xzHU0BgsjJRevlemSYkB2vLCtPikx6Rg7E+JMHTRh+oMy
         OTeQ==
X-Gm-Message-State: AOJu0YwvuxAHWRo13i5T8iX3H4MhDW0HHC097fwDxo7QQVARXcKLnKN8
	IDuTWAtLnQhtl9wehJBAvaeKBFtaZQid29N00Ov4UNYkqBn1qyHo8RhIPCW4nRXS2ewXsnn5eQW
	q5YOGQasR/KmwS+akrK0kXNktAFz/bfeeV1L6Q5X0eNxpva3HEOC6VAk=
X-Google-Smtp-Source: AGHT+IHHCJkrhRplrhOrpC9QQv5SfHWrNVKloPNe8ckCsc7jvJkqShHkc5wcnEioxB8/9bfFAbaAM+Js6nGwXHWugVfwEXWLmcLR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3601:b0:3d0:4bce:cfa8 with SMTP id
 e9e14a558f8ab-3d7ec1dc7f4mr76197985ab.3.1744481074997; Sat, 12 Apr 2025
 11:04:34 -0700 (PDT)
Date: Sat, 12 Apr 2025 11:04:34 -0700
In-Reply-To: <67f50e3e.050a0220.396535.0560.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67faab32.050a0220.2c5fcf.0010.GAE@google.com>
Subject: Re: [syzbot] #syz test
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: gshahrouzi@gmail.com

Try to remove device but fails
Reinitialize reference counting for write operations for device
Shut down the filesystem
Make the filesystem read only
	Read-write bit is not set so it skips trying to make the filesystem read-o=
nly, implying that the filesystem is already in read-only mode.
Encounter error because write operations are still assigned to a device
When the filesystem is starting up, it tries setting it to set the filesyst=
em to read-only but it=E2=80=99s already set.
When failing to remove a device, it tries giving back write permissions to =
a device when the filesystem is read-only (not sure if this is nonsensical =
or not).
Since a device has write permissions, it tries to remove them but fails bec=
ause the filesystem is in read-only mode.
So the fix here is to prevent it from giving the device write permissions i=
f the filesystem is in read-only mode.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 fs/bcachefs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/super.c b/fs/bcachefs/super.c
index b79e80a435e09..788e870bfef6a 100644
--- a/fs/bcachefs/super.c
+++ b/fs/bcachefs/super.c
@@ -1757,7 +1757,8 @@ int bch2_dev_remove(struct bch_fs *c, struct bch_dev =
*ca, int flags)
 	up_write(&c->state_lock);
 	return 0;
 err:
-	if (ca->mi.state =3D=3D BCH_MEMBER_STATE_rw &&
+	if (test_bit(BCH_FS_rw, &c->flags) &&
+	    ca->mi.state =3D=3D BCH_MEMBER_STATE_rw &&
 	    !percpu_ref_is_zero(&ca->io_ref[READ]))
 		__bch2_dev_read_write(c, ca);
 	up_write(&c->state_lock);
--=20
2.43.0

