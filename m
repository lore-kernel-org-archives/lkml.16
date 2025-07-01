Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FA12B71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751336613; cv=none; b=OxedfM86QyEc6Snm9qm7aRZI9Lm3F2YonujLDfklhPTScf04SCmikjGdoJ1VdOvpezolTMp2uoH0uU/Pc0iZjVv8gBV059PTPuVrPgpfI/AhjXlmLP9kQ57uPi1rnRoutP4e0n2Vwws4nnrdKcVSAiDdFyAIGwKdvKxC3lSDf7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751336613; c=relaxed/simple;
	bh=UzEAJUUD9OK3W0bVuYO+NSmpMMWNsePaoIENu1gvApg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INCCSQ56QxesWIjWCvh2EjiJZzMtAgnmoQ9z+aHacsHxUOXt8aRdYJBmeFUr7p/JciGUXzNODg8b3CbTIQqRTUHFN82uC85hZ/vwR7kDAExaTriMUo1qB2pTsWowXg45Y6ZTii2qUpKs1hQvBuKjhQCCSILt+73LRcRySSvMSZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A54fC3Us; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A54fC3Us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751336611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzEAJUUD9OK3W0bVuYO+NSmpMMWNsePaoIENu1gvApg=;
	b=A54fC3Usp6IAEXfjI9BhNmg6Wg97Ae8qnkVGyCZf+Fl/5dJNbVXPUXyjhSNfbLKY4Dv1G1
	5xlqYj7HbIl8jx7tm2DQiIWUNdTztaewCaPn/lxpQM1HHHHmXvdhUnkv5dWmccaj0gXnCn
	uThczIaGgz/iHkYpn1tWBalU3tgllSs=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-DBy4hGBVORWNC9SMvH_bSQ-1; Mon, 30 Jun 2025 22:23:29 -0400
X-MC-Unique: DBy4hGBVORWNC9SMvH_bSQ-1
X-Mimecast-MFC-AGG-ID: DBy4hGBVORWNC9SMvH_bSQ_1751336609
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5314dd44553so1644496e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336609; x=1751941409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzEAJUUD9OK3W0bVuYO+NSmpMMWNsePaoIENu1gvApg=;
        b=R1ymGV6X6qe1eq0+R8oy8joCt09skqdiIJKYxDOH+MYWoQHcYbwzl5NsMO82Iyx/nz
         vQ06ZRjBpM4vHyf4ag31rN56MwdDjD+uzkR+z11ufyAV2czJ7DIjOj8r3iSErbn07uag
         Aa9m6KeInr2MBlbEQA+8GnK29pgm/8+Q3sQ2WDN6TifU56D7ELhQfqrO7ZBHM8vUGN19
         mOxApsPP1YQebURumpXfe8Iibrln668wHTNx8DPW3zEBeXEswM2hsL0nb8wp5N5Iaxk/
         lPc0JP7VoHQy2AzsO50rhpu9Ik3SDrFIuRX3iE3mljmqk03s6TZlbUh9I7MprTge5pAb
         kCqg==
X-Forwarded-Encrypted: i=1; AJvYcCXny+IkzMf/gjV/e8DFDqV0TGZmPmN7AeKqfslxsX3hXbN6dp5EzIpLQS3kLiL82zsBYPT4VNCqk5N7xbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqobx9a0ZfP2FUDgf8Hp5TuJ5d3uri0k1vq2td9NhoZvwfUN4
	jw/Ftd3bEb+QRTkka9TPGQmw339en9+ntgntO1jykvU9scghMUFyu6gaiaRC/NVO/9fy0f4g7bL
	cUVmah6Hx02JHszd5n+vB1w9QcXrV0GjuC0bEJ3Dyylr9luIlDcO1xm3Ihq3QXG5U0IJ89s7XIs
	FFho7jMFtkXiue4cRQK8B4v4jjjR6AS4m/n3q8OgfY
X-Gm-Gg: ASbGncsZEy2zuW/qO0rbNqHPuGZjiwN/IDrXKEAY1BdQ0rJcizDgsMy0cjkctwyyhFE
	xsodp5RvVrZXmZigc3WahA7uHH+ldfMOz0LqqM5JogOwyejsFR4gIMOJNSrMnFFb1/7vJwnPqZ/
	+/
X-Received: by 2002:a05:6102:5123:b0:4eb:eedf:df65 with SMTP id ada2fe7eead31-4ee4f55fa28mr10132608137.11.1751336608771;
        Mon, 30 Jun 2025 19:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYUKosjg1xV3/2kEIImXNwrpXMZl3+XgrJg900Mb6VAWhQ1VVykJLy6Rp+l/68SJ/VfW9TfhDDb0JYqP7DqAE=
X-Received: by 2002:a05:6102:5123:b0:4eb:eedf:df65 with SMTP id
 ada2fe7eead31-4ee4f55fa28mr10132595137.11.1751336608477; Mon, 30 Jun 2025
 19:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630151315.86722-1-minhquangbui99@gmail.com> <20250630151315.86722-3-minhquangbui99@gmail.com>
In-Reply-To: <20250630151315.86722-3-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Jul 2025 10:23:16 +0800
X-Gm-Features: Ac12FXwmRMP0wrScNXo4jLviRavx1GRKuzUNyZLulsaizoOGTdjbvUZnQk8mBA4
Message-ID: <CACGkMEtv+v3JozrNLvOYapE6uyYuaxpDn88PeMH1X4LcuSQfjw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] virtio-net: xsk: rx: move the xdp->data
 adjustment to buf_to_xdp()
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:13=E2=80=AFPM Bui Quang Minh
<minhquangbui99@gmail.com> wrote:
>
> This commit does not do any functional changes. It moves xdp->data
> adjustment for buffer other than first buffer to buf_to_xdp() helper so
> that the xdp_buff adjustment does not scatter over different functions.

So I think this should go for net-next not net.

Thanks

