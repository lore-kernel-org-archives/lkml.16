Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856CB29CB22
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341551; cv=none; b=gFztusE4jn8WFck+jsaRmDzJqSaA12ZBIhod2ebpApJfYDB20yJQaQ8hB0jADvcIpnceEdkVLfvIA2N8tHDD0QVFNdcD141BjlI7hY96CknIVdHzHQN9HCzzpccilwyPUbgoBoN3ZIZysn5cmrtqf+cNd2s0tJpN6oms3eum+Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341551; c=relaxed/simple;
	bh=5LvY5tzl6OpWTrPnPisYnQ8qd/DVKQU7fKCXD1M2VvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEPVESHsxOhHCb7ofIY8zjIN2hEet07HPlreaUSdUR07XuTwWlaq2nLa/mQxeXp9Y68T0CDTyR/NrMlRJFkwYavcGViAGNUcNvX0zSKDyQg7JBu+DlxoMk87a/+YwF2xwDVp9GhP2kLjDPcCtmAIPC1IykGwOhgPYTw5iWmGriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=b6ESvTV7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="b6ESvTV7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30effbfaf61so16386581fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747341546; x=1747946346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGd89Ij3ihsDUANJWKDVjCfRrcPwOEzhW7E9noIOuHY=;
        b=b6ESvTV7b+mx9WOGCBbnI+Gmhu2CiawJBWgBsr01xFolu9J1NEjBhJwOGuaIKoz/gu
         Xk3qPqpqoAWcFYg8l3u8/WKOjmq/DMFS+6mjw4aQzlOLLvpxart+4gyGyMCwJWRt9V9j
         dPJX5Mc+sanynPvgnfGxCyIFQha1qpFrJ7ciU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747341546; x=1747946346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGd89Ij3ihsDUANJWKDVjCfRrcPwOEzhW7E9noIOuHY=;
        b=AC6Xkqq5bVgen8opGBhXZCZfZxn6tyCrZfCvVivi0j5CKIsbE3TypxrK+z7/nNNiNR
         AJ7HuKtBaVi6+/J/5t5IpXWZPWYUrXCk0LyayekKMFwi30JEsWvmU4cftEOYbVLaYff2
         d4PJU9UwenSvpYArwgHzow5tmysHCMgZos1SOLPR5he0i9PaDMhr2EeN2I7e7c5lDbSr
         pmoNlzthJCTScqNFyAvB4qdpOFRl6L/KSv7hZjn2ev58JiQGPzV4nDhY8WMrIF7zqEPQ
         GUHLec2I8L2S/frGZZHPn0BXZOJBi+Aemvd8P0MQM34VAyD+ehHxDnTOZQMJdmo6HsJq
         SmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWifVOREw4cFSfMJyAUNa2C317bw4am+ngipye2BgsOkS+U3dr397fpzCT4vZRXCXxujdruWG8VcrG4uEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysMtg8MwV6fqSGWC8qnvtnI54WB2YFwozx9aBKfDGeYUlsLZZ2
	SDERf1vyZtt7eMCcvZ5D5bZwccab2D4LDVMZyRioD+1QXxXj2vbGahx/+GU/stNVJoddNZi1ZUr
	fJX+EAdJQfWMccoFv7HmpaRTueiMFyqYY2DuAdjyu
X-Gm-Gg: ASbGncuPsY09UxnnN76sXGV7EhUcZx0ptpCSD2ad/MeXqQCLSrJq2ryrSQvYpKyzjjR
	1kPe7avhU4o0swlfW3RtHeogKjrlR7jNu+GfYZkoZNr9Pu+X1T6vhQdsfDJCLcJAMdY6OZgGF6y
	z8EFWCkS1femhE42XDDv4zEINZ5OfkF7fniQ==
X-Google-Smtp-Source: AGHT+IFEpyU1SVPtYkgJNaWkDU3vfROG0brtMk2c/tj0jWAjvmdg/YHiXLPyCBT0NU9510I+dsh+53qxgZ3Rtnmi/rE=
X-Received: by 2002:a2e:b8c5:0:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-327f8484b1amr20578561fa.9.1747341546527; Thu, 15 May 2025
 13:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513210504.1866-1-ronak.doshi@broadcom.com> <20250515070250.7c277988@kernel.org>
In-Reply-To: <20250515070250.7c277988@kernel.org>
From: Ronak Doshi <ronak.doshi@broadcom.com>
Date: Thu, 15 May 2025 13:38:49 -0700
X-Gm-Features: AX0GCFu6WRwaZwKs1VmGpZoHM3Ug86kZLV0H4pZQIn-f-tFF39RhsCaq2N2sM6g
Message-ID: <CAP1Q3XQcPnjOYRb+G7hSDE6=GH=Yzat_oLM3PMREp-DWgfmT6w@mail.gmail.com>
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Guolin Yang <guolin.yang@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 7:02=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 13 May 2025 21:05:02 +0000 Ronak Doshi wrote:
> > +                             skb->encapsulation =3D 1;
> >                       }
> >                       WARN_ON_ONCE(!(gdesc->rcd.tcp || gdesc->rcd.udp) =
&&
> >                                    !(le32_to_cpu(gdesc->dword[0]) &
> > @@ -1465,6 +1466,7 @@ vmxnet3_rx_csum(struct vmxnet3_adapter *adapter,
> >                       if ((le32_to_cpu(gdesc->dword[0]) &
> >                                    (1UL << VMXNET3_RCD_HDR_INNER_SHIFT)=
)) {
> >                               skb->csum_level =3D 1;
> > +                             skb->encapsulation =3D 1;
>
> IIRC ->encapsulation means that ->inner.. fields are valid, no?
> And I don't see you setting any of these.
>
> Paolo, please keep me honest, IIUC you have very recent and very
> relevant experience with virtio.

I did not hit any issues during Vxlan and Geneve tunnel testing. I did not =
find
the code which validates inner fields being set. Maybe I missed something. =
If
you and Paolo think inner fields are indeed required, then I will remove th=
ese
lines.

Thanks,
Ronak
