Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78B1EEA43
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261629; cv=none; b=eI9Q7VUs1Hzw/UjUYQimgOmn92LZ/sxJj6vGt/vA1FtrKFSrQ/ED7qzuaNJ68E2v3DAvhBdDjVePXssL/WymVPajeqvhzKoPDITzjX/7FMcfoHSJLSDHiNCKcIPQx6hVZ4oapxW2jkn0n3uyHYveuLJJsr0PYQj83GjlQmfpVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261629; c=relaxed/simple;
	bh=0dvMrOU+jpUj7tdCPK1OdWeuBFlDOcoyCJs0wbTUm44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJ6Kb7JRjpskZ1IiK5+Q7A7byIVr2lIvAawUAssjUPEdnhu3xIjDgBahUoIiwytz0wSG+b/e1I2+srpdjHndMDZKR/lK56zxQ7eDSVamrevRuIR9+JNHeYHgsJ9VcmfVlH7V3sIfsI8Jpvq7OxLsgLyPbku8YmunUHISU34jLpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mm7HucCf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mm7HucCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739261626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1n8vkK3pIQpfbo4j0Rb3+1FkQLwn21MZFeg/srwCbfE=;
	b=Mm7HucCff2epne8NoNkoni8/GBfcgX16txM0qzATD6r4ovUchwIQPWNWuXs8dUBM17Th/v
	ZFipfmPZz55S3oGV7JeswlHHDgV4AcGFlI8nqAm/JMTj0OC1yl8y3DOdZBestlkk1KEoS2
	KgQlsEXSNSegR9EFgKTyE81HIXzS//k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-VQvY2XztNUCn9VSeWsvg_w-1; Tue, 11 Feb 2025 03:13:44 -0500
X-MC-Unique: VQvY2XztNUCn9VSeWsvg_w-1
X-Mimecast-MFC-AGG-ID: VQvY2XztNUCn9VSeWsvg_w
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4392fc6bceaso15558835e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261621; x=1739866421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n8vkK3pIQpfbo4j0Rb3+1FkQLwn21MZFeg/srwCbfE=;
        b=fd/l2+KRtWsQh4TDbPDAyXGi6vVc8Fv1RbVPV8QkeGJA9YsBdEV6ss2nQ0fNBqmZhp
         E3/MsyaxkCJYz9lEJ4c+ovRHL0RXG2sEiFNW2oQ0Kg0m1Pd5Kqa25mq0XXkNjuXhYE/t
         +2Kk3FeHYiSJskJZeVR61kOY4PwSoZqgCfdM0MOM8Rv5V8ve4h8z15Rp/yQeEoAFNOGU
         W190mcGFRpFUswO3iXg80WQZzSYnE8gTWEpXHfgcsRAD/5lUuA9YYP4f+whWvIJT7Vzu
         MzV/wmBg1sCAZX8V+y0VhC4GPH8tzz/wkoI9Z396pmzIHdt1Mqpp2A83UXqgv0cAtc5H
         eThg==
X-Forwarded-Encrypted: i=1; AJvYcCU9VyMI1DiDvpPdN8pirdhrymYHFOCL3RpCrqUprDtNoaT2Lep/+AQyaSLCn08FM/q3L2iGTUWcB3ATGVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2tuiTBw4KSDtrJv5guXoGN7PbJlExnrj0kh6xardRCzipKGO0
	34nypx28BWO2t76spaSeNMljGJORlfB0VqXn35UeULWw+HEwxIe3Vt7I3R07QHibXnTgQyUvEvP
	M27dcqpGUq1LXtO2xvZXRX9D0ydsWAVtDGN/1azHssOrWbxIed79/PWoMZBigFg==
X-Gm-Gg: ASbGnctOy7LUlCMPk2xZbvKZsXUlt3OvMUQp3Ny5Ese+99lgmYdU3dee6H1GjIQr6h9
	tlSV9zFXZf3oFtQEgCHYn/xIIgi4QEW8cpVESfGTI+87KY2zRILAwMwpOwUpD+fIpRUC/4advRv
	ZXmfIhvdhVOVbomGRNAzN14iwlTB4hxwpxEsFx+7Eul4sdFdDGZx4Ll3v7YH8ew/TEMUX66QJIn
	l8aAiFQkBIrTYKeeaEVUDm+xHMF0DrzS69U5ev/OpD6EqXKVTQdCg5lRbVGTXMf49dRYmMpwxma
	R4ecMfcIBMvzApl+oJWxWcBqAakjLmka5z/wIrWIZwQbjwP/Q+SSjg==
X-Received: by 2002:a5d:64a6:0:b0:38d:dcf1:d191 with SMTP id ffacd0b85a97d-38ddcf1d528mr8272406f8f.21.1739261620704;
        Tue, 11 Feb 2025 00:13:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESlByLWTFDUB78pjxA1Dd6V3iLKw47Bgjaj5JruimINPkrnWdgcGJctJ+ryQRtChMGWsKZHA==
X-Received: by 2002:a5d:64a6:0:b0:38d:dcf1:d191 with SMTP id ffacd0b85a97d-38ddcf1d528mr8272350f8f.21.1739261620000;
        Tue, 11 Feb 2025 00:13:40 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm8087046f8f.83.2025.02.11.00.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:13:39 -0800 (PST)
Date: Tue, 11 Feb 2025 09:13:36 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: syzbot <syzbot+71613b464c8ef17ab718@syzkaller.appspotmail.com>
Cc: bobby.eshleman@bytedance.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, leonardi@redhat.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, v4bel@theori.io, virtualization@lists.linux-foundation.org, 
	virtualization@lists.linux.dev
Subject: Re: [syzbot] [net?] [virt?] general protection fault in
 vsock_stream_has_data
Message-ID: <xx2igtwgro5ffbmdaahbwz6irolnfh4ktmdfatfrl72kppne7m@rp2ajscxfpp2>
References: <67867937.050a0220.216c54.007c.GAE@google.com>
 <67aaa81c.050a0220.3d72c.0059.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <67aaa81c.050a0220.3d72c.0059.GAE@google.com>

#syz fix: vsock/virtio: cancel close work in the destructor

On Mon, Feb 10, 2025 at 05:30:04PM -0800, syzbot wrote:
>syzbot suspects this issue was fixed by commit:
>
>commit df137da9d6d166e87e40980e36eb8e0bc90483ef
>Author: Stefano Garzarella <sgarzare@redhat.com>
>Date:   Fri Jan 10 08:35:09 2025 +0000
>
>    vsock/virtio: cancel close work in the destructor
>
>bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12bb31b0580000
>start commit:   25cc469d6d34 net: phy: micrel: use helper phy_disable_eee
>git tree:       net-next
>kernel config:  https://syzkaller.appspot.com/x/.config?x=d50f1d63eac02308
>dashboard link: https://syzkaller.appspot.com/bug?extid=71613b464c8ef17ab718
>syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125a3218580000
>C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147f11df980000
>
>If the result looks correct, please mark the issue as fixed by replying with:
>
>#syz fix: vsock/virtio: cancel close work in the destructor
>
>For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>

