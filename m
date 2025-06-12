Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8001A3141
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715462; cv=none; b=PHYH1PM4TLRlBpW4xJms15k99mofGGB5L6fW81RYkQ6tcVlG3NXfzhKeWRxTNcPF6Rs88b70Nvtaxy3VAEI9plSplrQYyIVjk/XWx/W87ovqf53ZP6rmHBVeLsOBzv+9m4u99Bc6eWTyfE2e0FwgXZo+ge1gRvOzHbJ70Iu01Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715462; c=relaxed/simple;
	bh=dZMHVNBbyE0k8GdpEWwXqBscTuEFNGdf3G5hSUKiNHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fM1h9XVXQqaBWNsjHlUauCYxq1efQcR/Lg/hF/jpU+zQYglb4X68u/+V1yyNixZ95/c3ZGoyza9XniCkWj4xU9cPHE43lea3Dvew+LNXL3xFr1rd2rvetBoIhKqkTATC/jua9HsK+t1LsbrQUrn5UYvT26yikcEFuW+P77VifY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KIjXxLxi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KIjXxLxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749715458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZMHVNBbyE0k8GdpEWwXqBscTuEFNGdf3G5hSUKiNHU=;
	b=KIjXxLxiCmEJIDxzkjGmne8g1+0Y1rhLCOkoQ7M37rCyM+EXPMNocp+b+SEx+hFigiDxZc
	wc1ZO42fwcPf9gy51aS/WYECB1Rf7rPtZkEcqbnWPc3UImYlhoODWfGz6v54+nuBAfH6wz
	kLLe+6FRBPEw6HFT+FZbWSDUTpfT1rs=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-qYC5lSZQP3yjG4VOKEzsZw-1; Thu, 12 Jun 2025 04:04:15 -0400
X-MC-Unique: qYC5lSZQP3yjG4VOKEzsZw-1
X-Mimecast-MFC-AGG-ID: qYC5lSZQP3yjG4VOKEzsZw_1749715454
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70f841fb19dso9051667b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715454; x=1750320254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZMHVNBbyE0k8GdpEWwXqBscTuEFNGdf3G5hSUKiNHU=;
        b=JsK1XhKkLMmTNUwIXApMaWk1Kf0QXCKgHNbkwgsZ5bNw6tr9235B9424NAzy+7/OQE
         W9iyaHGFi7kxl8wuI5XMudS3yLg1GnZ05+M06khKSkSPjzMdo9OJKmjAvH9Bxs1zf7pC
         WPJiTc8PzX2w/flOWgrENJrBvrZ9fmMHZRWMOCS+CYaOVV02b5bkNECk3+mCSJQa9I0S
         bmHbAMKJ+IUQORtb0E/obvG9omG90elzgKOkWPfAQZD5N2CbZ9MK6wYR579I9Ihj5Fna
         NbnuL+jtDbH8fF3W8XwhTzBiP7WIvCQ18w1J5Lut2Rvbb5d05kbxafzxWObvgw+ug/Lg
         NAlg==
X-Forwarded-Encrypted: i=1; AJvYcCWInzOp4IJwBvCY8TO9AwnZvb0dyFmDopJeOnmuy4ArHYF9WCU8MDW+2LdCOSFcnGl/jaBLwH0wHS529AU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCO46XI00e9rApBBlO8dNKKD4kJkDB+XbVlKCMvWozGbf2Btf
	+5p4foA48c5lJBqiGyFCb+3oLT4y3ALzoYWIiYijkbRNQqYulzQ7iWunYk28REUeWfx4rWmf+DG
	O5GY0R6eKDN65jVuOeVHZ8zMlVAPPE8hpe/xu5oPMPvN++voPpUnK9Wo9QK2E2ANwcw20jy+Orw
	2l+h+YBJJrHaxePWPwu2IEjal5SJYN2Q0eFZZ0DUJX
X-Gm-Gg: ASbGncvz9c3h/smLj2Ln239SdeE91EUNgnQJbTg+I5+n1LpXQeDGbdZ6mAH4/1JK02i
	AIf6IfLwVo3zo++XFw6rfcgbeIjWxUVzx7kguk0/Tsg7waz2q90PFwoQKF/IWqZGZQq0HDoQgdj
	5o5TRQh/S96cjgfT3mLvnzfZCLqdI/Usn75lw=
X-Received: by 2002:a05:690c:39d:b0:6fb:ae6b:a340 with SMTP id 00721157ae682-71140af6833mr89683197b3.30.1749715453793;
        Thu, 12 Jun 2025 01:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKpH0zV8WAQdWv1lhM5ZZcw077V1kJarsSUj2zqX5HwhgGv6teM4sCUgx4Nym37iltxkdXS6Iqa2//rPnys9A=
X-Received: by 2002:a05:690c:39d:b0:6fb:ae6b:a340 with SMTP id
 00721157ae682-71140af6833mr89682727b3.30.1749715453466; Thu, 12 Jun 2025
 01:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612023334-mutt-send-email-mst@kernel.org> <20250612064957.978503-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250612064957.978503-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 12 Jun 2025 10:04:00 +0200
X-Gm-Features: AX0GCFuxXcX7tZ1g-iY8JvPcecHdu0pQdDpj1BwVsu9-6iJkGFvAwtpFRMmd4Tk
Message-ID: <CAGxU2F6c7=M-jbBRXkU-iUfzNbUYAr9QApDvRVOAU6Q0zDsFGQ@mail.gmail.com>
Subject: Re: [PATCH net] vsock/virtio: fix `rx_bytes` accounting for stream sockets
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, Oxffffaa@gmail.com, avkrasnov@salutedevices.com, 
	davem@davemloft.net, edumazet@google.com, eperezma@redhat.com, 
	horms@kernel.org, jasowang@redhat.com, kuba@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	niuxuewei.nxw@antgroup.com, pabeni@redhat.com, stefanha@redhat.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 08:50, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Thu, Jun 12, 2025 at 01:32:01PM +0800, Xuewei Niu wrote:
> > > No comments since last month.
> > >
> > > The patch [1], which adds SIOCINQ ioctl support for vsock, depends on this
> > > patch. Could I get more eyes on this one?
> > >
> > > [1]: https://lore.kernel.org/lkml/bbn4lvdwh42m2zvi3rdyws66y5ulew32rchtz3kxirqlllkr63@7toa4tcepax3/#t
> > >
> > > Thanks,
> > > Xuewei
> >
> > it's been in net for two weeks now, no?
>
> Umm sorry, I didn't check the date carefully, because there are several
> ongoing patches. Next time I'll check it carefully. Sorry again.
>
> It looks like no one is paying attention to this patch. I am requesting
> someone interested in vsock to review this. I'd appreciate that!

Which patch do you mean?

Thanks,
Stefano

