Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B36C202F87
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905544; cv=none; b=fMvoJLuizs1jQdRVh/AUYj6H9iWDZ4O4U6q1EuoVISDf+6QBFoYvsBe6CUOX+QhKn94dxf5ZxKzYnA4jykDycxEwfC3jBMBQsFaDTBZvKFTmtEEaqLauAsz+4wWHE8ap9DQxm2s3kWaPx0RRR2SWow5/XmJA7EG5sPxWm7sSxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905544; c=relaxed/simple;
	bh=PtV+hGmWzCGGAq8XJTGqpjrx3hzHcShvqveug29QiX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkTUCbhiuUYkCZnpxIPFHjj1/82X70/6G0FqqZ8eFihzIqSTOcGtMS8eIXCqf+D6zTU2ODULoBTO3mJuCKNrbrfc9ENC8GZOtqUeCewdbWrrvU6Jb8iL1mxAgP4MDoVSy4CtMZkhS05GNqiwWCzRQh6UGT+muk9mouxLw00Jj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GpGg4q8K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GpGg4q8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750905542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtV+hGmWzCGGAq8XJTGqpjrx3hzHcShvqveug29QiX8=;
	b=GpGg4q8Kh3LzKa6ebCOrgqW09cOh2AscACGseimvPM96zHYB1N4qfCkNF2y9M7IKyx4HB5
	kHa5THA3lZvi3x10bMhFH6HNow44wccE9RivR80ptOT1FsuT6wCg23mrkmap0UAj64xYsB
	mN2oaLnsN5E8MsHWE2n1ech8npHOalw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-SUTl34slMtmySRrE4lY9Rg-1; Wed, 25 Jun 2025 22:39:00 -0400
X-MC-Unique: SUTl34slMtmySRrE4lY9Rg-1
X-Mimecast-MFC-AGG-ID: SUTl34slMtmySRrE4lY9Rg_1750905539
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so5001105ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750905539; x=1751510339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtV+hGmWzCGGAq8XJTGqpjrx3hzHcShvqveug29QiX8=;
        b=HLXk9cNKKpx+rauAi954imh9s9oymrR7eSQP/aWplILgeLPatz3yDBGZIvoK9mfe2j
         Y2q8eh7yWh/qCBGddHeWvcawc8Gk/JBqw86MH6n/O7nSuQVe0L+QqKtFCagdM+mK+ICA
         aSs4JiWx0HNgQYzoqZZijOrEdxv7JRv91GpNB6mvS5BGXhHgFT5ObotuxvvuBADYT06S
         r7862LNCC8WwR0Q0oJvFHgiekag0HuUX2MqByn0kAss7ukBQIcQOT58z4b4OpWOKt5i7
         N1AI86ArqnfZ8ZWo/8orVKtEqxO8kJPs0kOHW6+qwPyiSvcyfNt83Q4BFwwe8PHFab2G
         jLGA==
X-Forwarded-Encrypted: i=1; AJvYcCUs4TrcuEeJ4gIuNYbaVbtLbrF4BrtwXapBDMCY21jkGw2Pu0decocQzMa4EAUj9KJvDRn2lRHjD2gWNng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+iLYgEZ2UmaBGC8MpYu4qYpNs0CVUNjBlqNVgYTEdtU7myrTu
	SZSSIc+/8W3yeBGZroyVAREZKTXhIMzti18exyIIXiWUw3uQPC/vC1Ko2Cj7lo8+/NwUeEvmgNU
	5dxEJdN3o5JNO0gQuHdI5c//GM8KRyt9UVPyYhRnmJlojApnqmiDyU9+s/MJD1TZH/3dhYU0KX+
	Ix1oq09PqboSLRqj4WkzFyU8ecD/hPizkceLcetzd+
X-Gm-Gg: ASbGnctoQsFoJrzrT8fx/yo6EwcE2+qexV9/wjTtJaZJPG1eJCp1G4A8TThAGnKJ01Q
	N0TWlwfkIxi0NSqaRwuaRhy75j22MOqswxjhtQLD3XpOwGX6mrvnGTOfHtGccAgLDyCtQUqX88g
	viEZHW
X-Received: by 2002:a17:903:3c6b:b0:237:f757:9ad8 with SMTP id d9443c01a7336-238e9e06b68mr26264465ad.1.1750905539244;
        Wed, 25 Jun 2025 19:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeb7cSsXZgQCsbZuX3BxI9ea2eoF1dmzDHFHzV2vn7oWQ24AkuEOzAXNT7eLnpup8aMyphvstnn6ceEBYA5HM=
X-Received: by 2002:a17:903:3c6b:b0:237:f757:9ad8 with SMTP id
 d9443c01a7336-238e9e06b68mr26264205ad.1.1750905538830; Wed, 25 Jun 2025
 19:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625160849.61344-1-minhquangbui99@gmail.com> <20250625160849.61344-4-minhquangbui99@gmail.com>
In-Reply-To: <20250625160849.61344-4-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Jun 2025 10:38:47 +0800
X-Gm-Features: Ac12FXzGBspfM0xNLFV6s_nJRqcVgjaFcF2_Hcvm4OR2ygauzrYWua0l6j8T7wo
Message-ID: <CACGkMEvY9pvvfq3Ok=55O1t3+689RCfqQJqaWjLcduHJ79CDWA@mail.gmail.com>
Subject: Re: [PATCH net 3/4] virtio-net: create a helper to check received
 mergeable buffer's length
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

On Thu, Jun 26, 2025 at 12:10=E2=80=AFAM Bui Quang Minh
<minhquangbui99@gmail.com> wrote:
>
> Currently, we have repeated code to check the received mergeable buffer's
> length with allocated size. This commit creates a helper to do that and
> converts current code to use it.
>
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>

I think it would be better to introduce this as patch 1, so a
mergeable XDP path can use that directly.

This will have a smaller changeset.

Thanks

