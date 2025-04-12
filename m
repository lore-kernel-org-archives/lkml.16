Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793EB20CCE5
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480962; cv=none; b=NhOPyAkJtc5kv29x3gmLQ2jho0bqxn34nBWTMwrEXMOWfjGsoNxCTNPbgeT36QdrxcVvtomKi4hQo4PVg3EctlpaOBY8m7tRzTTs4TEsijuMzid1gzTEge2nRVpShfhfPyKOoEG3LupO9rUBcP6H6HPd3vwQfnf+1ruRSGM9UHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480962; c=relaxed/simple;
	bh=PPOXLjQCWquAW3bizjj1wGNfi+TdiH1y5Y3HEYPZ0/s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=lBS5qSIdrvS7sNyP9UDI11cAUuq0gnbuUsksodVujfhVdzRUCE9NjYLPkY4pJ0f/LLM/UzsA8epjp5Tn4T+N93l7FLPjogbxGlzO4DIyUVVhU6cdw1pH507mUwvp47qAaiIJ/1bblJYPyu9rlYD6QhPZo86pmKj3/6E41xRkU/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso330919439f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744480959; x=1745085759;
        h=content-transfer-encoding:cc:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsleT2zNmBeqBCr8bxis8VYVJxFTReJnxrmAeezeuFo=;
        b=FBkYHBq4EJ4BVovLQL00GBFbOo5ho9fBVlp/TRzUbwyhlu5eXH9HoGMwVpC4x8Qh8v
         cuoSoo9FlRLcIvY6rQ8LjDHPTcBQEZJmo/kxYX+BBLuRsN5R9v7RgF7HO+rRbZuSalWU
         yhCFdmp9KnMoeB7UMZzHatQEjCM8cx7U5FQcSub5MGlLAcXgXICB96IqXEJpezbmy2eL
         34uS90yAc3c2BMlB4FCU7ms24obneESBd0su2JW4lsjOCxBvLwNOfzku/xTr527kx3OW
         7vDZwOncFBo5xQgl81MSXUVsh+8g+EvVnxNNaTuFpw/PA5zRN2UFHtnChvW5ETVVaoAg
         SKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHhrD+XqzI/1gbUDB6bcJqvaG9ue2LkF71S8faFjPIE7GFIXWwMiWXPMHNutLV7x58m85uK0+Sb3/bX+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbdR3Jb4E28949ce3SY0WXKDHqTPXuq05oQ1ASH4Bw5Ydi8jnW
	VuS2+uQtwmxdY+I2sYmJB1RsgM8iJWtQDkdnsD62RovyVXGCl7/+dFv7ATKg5ueurC/Zn/7cBex
	zO+mJF03WSTOxu/38YKjMSPVdcsNnmioIOH5vvxSAQAWDd4C0ysPyrxk=
X-Google-Smtp-Source: AGHT+IFfS/TNHNec1ihJ//vaAsHdsYhSOFDBsQsii+O+8SZEx91ZWjzdorTlLt+WUxzankzLpp7EfsJBi/jupoJyt3z24R7YvWhH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2603:b0:3d4:4134:5213 with SMTP id
 e9e14a558f8ab-3d7ec226052mr65930625ab.11.1744480959192; Sat, 12 Apr 2025
 11:02:39 -0700 (PDT)
Date: Sat, 12 Apr 2025 11:02:39 -0700
In-Reply-To: <20250412180235.244744-1-gshahrouzi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67faaabf.050a0220.379d84.0012.GAE@google.com>
Subject: Re: #syz test: bcache: Fix device removal failure when filesystem is read-only
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: gshahrouzi@gmail.com
Cc: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Try to remove device but fails
> Reinitialize reference counting for write operations for device
> Shut down the filesystem
> Make the filesystem read only
> 	Read-write bit is not set so it skips trying to make the filesystem read=
-only, implying that the filesystem is already in read-only mode.
> Encounter error because write operations are still assigned to a device
> When the filesystem is starting up, it tries setting it to set the filesy=
stem to read-only but it=E2=80=99s already set.
> When failing to remove a device, it tries giving back write permissions t=
o a device when the filesystem is read-only (not sure if this is nonsensica=
l or not).
> Since a device has write permissions, it tries to remove them but fails b=
ecause the filesystem is in read-only mode.
> So the fix here is to prevent it from giving the device write permissions=
 if the filesystem is in read-only mode.
>
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  fs/bcachefs/super.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/bcachefs/super.c b/fs/bcachefs/super.c
> index b79e80a435e09..788e870bfef6a 100644
> --- a/fs/bcachefs/super.c
> +++ b/fs/bcachefs/super.c
> @@ -1757,7 +1757,8 @@ int bch2_dev_remove(struct bch_fs *c, struct bch_de=
v *ca, int flags)
>  	up_write(&c->state_lock);
>  	return 0;
>  err:
> -	if (ca->mi.state =3D=3D BCH_MEMBER_STATE_rw &&
> +	if (test_bit(BCH_FS_rw, &c->flags) &&
> +	    ca->mi.state =3D=3D BCH_MEMBER_STATE_rw &&
>  	    !percpu_ref_is_zero(&ca->io_ref[READ]))
>  		__bch2_dev_read_write(c, ca);
>  	up_write(&c->state_lock);
> --=20
> 2.43.0
>

want either no args or 2 args (repo, branch), got 9

