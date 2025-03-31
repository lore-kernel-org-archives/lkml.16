Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2027726
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418733; cv=none; b=eGMgZNU2fxHuhAn5HeEvTEOmecd2Wf2ezd6fzCA5337xh21zZ/imttantIPjn9L9QKg5Xp7xeEto6XCKh97w/qtkqJtL809IHCkfokWb3EvVijTTB6/25/IgGAWrw+cxX8mlMxuNcUWHQso3uEPqvgi9rBt3+gZyezHDRL8Ks+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418733; c=relaxed/simple;
	bh=psEBahj7VoXf5BDmQJg6N1MhT2Zw8Jg1zsV6pXB500k=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=D/vDQC8m40vr0YLWMG9TEDBhavazv8tpf6SI1ADXytcfq+1WguZrMXIlhh2kmYhMXkkH/vBEIY6wYY3+4waLtBZo6Vs+KtA+Eo/ZRIToj6xX5KPIo4Bl1txNsgwqei+BxJ+i/CFmjK24O9OPoYZpyC18eRln0N0nGmkuzjWExtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GreVspFX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GreVspFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743418730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93tK4DRtwDWGVyoA7NmKuVzLCQ6rWQ4QQB+PjsDLqfw=;
	b=GreVspFXn+i5h71BqvgpS7ryaZTxdwL6fqy19rQtG9HZM7s6Qd8kfVTWjI3xKjBrgAtpYv
	/w68hG1l9nLbfZGtUFBu0HtGx25y/f6egXtn6JnLenR/ll1iyUMu39ynlYIl5ZZZzlA1l6
	cCi1b/NfnbIXxTksvqOG3F8AuIzSBpw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-l18-nn5cPAqdlq9ANEiJog-1; Mon,
 31 Mar 2025 06:58:46 -0400
X-MC-Unique: l18-nn5cPAqdlq9ANEiJog-1
X-Mimecast-MFC-AGG-ID: l18-nn5cPAqdlq9ANEiJog_1743418725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1866B1955DCC;
	Mon, 31 Mar 2025 10:58:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50B21180B48A;
	Mon, 31 Mar 2025 10:58:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
References: <67e57c41.050a0220.2f068f.0034.GAE@google.com>
To: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org, marc.dionne@auristor.com,
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid context in __alloc_frozen_pages_noprof
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <241599.1743418721.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Mar 2025 11:58:41 +0100
Message-ID: <241600.1743418721@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Note to syzbot maintainers: the C test program contains a compressed ext3
image and decompression code that I think is entirely unnecessary.  All it
does is provide a directory that the afs dynroot can be mounted upon.

This is the only bit of the test that is actually necessary:

  NONFAILING(memcpy((void*)0x2000000001c0, "./file0\000", 8));
  NONFAILING(memcpy((void*)0x2000000002c0, "afs\000", 4));
  NONFAILING(memcpy((void*)0x200000000400, "dyn", 3));
  NONFAILING(*(uint8_t*)0x200000000403 =3D 0x2c);
  NONFAILING(*(uint8_t*)0x200000000404 =3D 0);
  syscall(__NR_mount, /*src=3D*/0ul, /*dst=3D*/0x2000000001c0ul,
          /*type=3D*/0x2000000002c0ul, /*flags=3D*/0ul, /*opts=3D*/0x20000=
0000400ul);
  NONFAILING(memcpy((void*)0x2000000000c0, "./file0\000", 8));
  syscall(__NR_chdir, /*dir=3D*/0x2000000000c0ul);
  NONFAILING(memcpy((void*)0x200000000240, "./file1\000", 8));
  syscall(__NR_lstat, /*file=3D*/0x200000000240ul, /*statbuf=3D*/0ul);
  NONFAILING(memcpy((void*)0x2000000000c0, ".\000", 2));
  res =3D syscall(__NR_open, /*file=3D*/0x2000000000c0ul, /*flags=3D*/0ul,
                /*mode=3D*/0ul);
  if (res !=3D -1)
    r[0] =3D res;
  syscall(__NR_getdents, /*fd=3D*/r[0], /*ent=3D*/0x200000001fc0ul,
          /*count=3D*/0xb8ul);

Basically:

  mount(NULL, "./file0", "afs", 0, "dyn,") =3D 0
  chdir("./file0")                  =3D 0
  lstat("./file1", NULL)            =3D -1 EFAULT (Bad address)
  open(".", O_RDONLY)               =3D 4
  getdents(4, 0x200000001fc0 /* 5 entries */, 184) =3D 168

David

