Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30F73477
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744475853; cv=none; b=GYhcQ7en6N8dDZmAlCHoL/AmGw4kP6hrdoOH4AC/K3Gf0olj3O6ENUbPblqQbDxqkp0LcCBkOD5B5KBkfP5T3lfVnYzcRM4fB+D7lXGSAW5IF39HIeOWkn3PcrQdMl3QHeb45E3AepHdSAv+emaJ7ph9jW7aGIFN5xBIjlUe3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744475853; c=relaxed/simple;
	bh=3nlQeqLpakx9VbjVGGaVN/AwOVYMXPCNfTYZtnneuv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohUqdSrUmtWi/gZIDyyEDjFBfDvlOL5Mm9DRGkFd1W2D1lF+ZXDgW3xUhoaViKsmjDIDFWJmwTiimyvo4kBKisQA215JJSLFR72yaqkdhdl4sLfWN2MecxTIciEk596rBLHMaK2kQ+aMErILFspw37bYQ4wkOkxQRv7Rc46X0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=abaBpV7J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="abaBpV7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744475850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3fiFsru6LnJQq9k1qZHmlYdUChXvApej+AwnAQ3uLE=;
	b=abaBpV7JPRwVTf2QqGPNcLm1RtEi+ptRoy7trLUtn6jKP0Rrhq6Y2zq5g5hsX+ssvvesfD
	ItG33TloUqJDTxK8UGjrdwums+O4ElaWp2MCkjBxYZZF1b4qHyNbxewaZE3dXpwNyTSWJr
	eD46/ZjzlWzQs6abtDOnqoAksiDbmdw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-dSVo_5YrMWWgP6_64JuNCQ-1; Sat, 12 Apr 2025 12:37:28 -0400
X-MC-Unique: dSVo_5YrMWWgP6_64JuNCQ-1
X-Mimecast-MFC-AGG-ID: dSVo_5YrMWWgP6_64JuNCQ_1744475847
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22650077995so42384275ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 09:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744475847; x=1745080647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3fiFsru6LnJQq9k1qZHmlYdUChXvApej+AwnAQ3uLE=;
        b=QYJT2gyoQnHFdvtAci/7eXwLFcJW0q2dAYaTYgECAtN3EPFIHP78m21u2kzUs0r09f
         j7S9Ho+v/SGOxONtD7zm/huXUiHzc9QixiUMG7fzkfZ4YPcdSTlmuqFocqHz3jbzNwcW
         G2Me6CvlAn6cCt6mS0DmVElsB+YPTuOTIHo7qFIvf2eWFTjsvqeqikm0Tsd6JTXI0wWT
         bdTRIL2CbYOzQY3Ew+ueqYKjvZuT4mXWG+K1CiaXpgTsYygDdv0hg5vGwQ7kr0isq5pR
         fEdcndUH8x3mpB0E7o3A9G9NDvOUVAurW8wW/9eksyjOqIYy51gpO0JneSklnUvAAY5Z
         jXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYLp8/zxfLeVUTgEiPbIaxjkWzPqR4ft6G+CcAFOHMU1QIL5JRuX3dEj1XpTA0PED/nIAyHORgontyIOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS32GG4fuj6QdgH0cULZRMTvRSxzCG+8zxIJGm4IqvCy+Cvjzl
	+g4W7LUCZ7hDKOqZTzasUTF/MZLuhSYGCI6vtZ+X4o0kF3uM2kqjlkbeiRqWkL9WSWKX3xccfJ6
	D3Br1nn2eE3vuMcLnASwn6eqvX9eZ7omDsLB/EbfijYfYzVprTqEkPdW6lINxnPNsmZBZKWKUcB
	tzjbS4DUMnhElrm3i3Yf3Yb0vnHWl7eIo8g77/
X-Gm-Gg: ASbGnctp8ZJqOwX9XlvGS7Zd+b41k/Y30zxnQFU9lc6J1aD3SwXacwwgRJZ1rdW4rWz
	J+OdgPzqNv6VfxOAl9cyV8hTHvqHi70oWEEjDS9xn4jKZ/Z/TKHJitQ8e/eF/+IqT5rM=
X-Received: by 2002:a17:903:17c5:b0:223:5ca8:5ecb with SMTP id d9443c01a7336-22bea4efaaemr91129645ad.42.1744475846938;
        Sat, 12 Apr 2025 09:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7sLLGDrtrxmDABKermY+/WFSctIXR5dmHRBwVPDD2cHAaEfr8X4dND2BPeABs3RlvZSRMNQ6ofK7p0cF8CSo=
X-Received: by 2002:a17:903:17c5:b0:223:5ca8:5ecb with SMTP id
 d9443c01a7336-22bea4efaaemr91129475ad.42.1744475846684; Sat, 12 Apr 2025
 09:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411173848.3755912-1-agruenba@redhat.com> <c9014d1e-c569-4a7a-aa68-d7c32e51d436@I-love.SAKURA.ne.jp>
In-Reply-To: <c9014d1e-c569-4a7a-aa68-d7c32e51d436@I-love.SAKURA.ne.jp>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 12 Apr 2025 18:37:15 +0200
X-Gm-Features: ATxdqUEc6bK4RDS8nTPgD4dEmZc4tgzp1L5AosoT3RAQjOcAirWwydpqqoRpyIw
Message-ID: <CAHc6FU7XDXCE--4vtH+q94NBZK-ScYSLTmeY4+J9T9YH7BtR9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix false warning in inode_to_wb
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: cgroups@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Rafael Aquini <aquini@redhat.com>, gfs2@lists.linux.dev, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 4:21=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> Please add
>
>   Reported-by: syzbot+e14d6cd6ec241f507ba7@syzkaller.appspotmail.com
>   Closes: https://syzkaller.appspot.com/bug?extid=3De14d6cd6ec241f507ba7
>
> to both patches.

I'm quite reluctant to acknowledge syzbot for this. The bug has been
reported several times by several people, long before syzbot.

> Also,
>
>   -static inline struct bdi_writeback *inode_to_wb(const struct inode *in=
ode)
>   +static inline struct bdi_writeback *inode_to_wb(struct inode *inode)
>
> change is not needed.

Ah, not anymore, indeed.

Thanks,
Andreas

