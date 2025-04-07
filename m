Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7149212FA8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743992108; cv=none; b=B6yW+Tu8pQB1/QWgABuK4x8DSDmxxAXsyWOyLpQdkgItM5ToFU46N7y8+ep5Vt2j3CGRwKHWOo5OpYPF7EET+U3Si1uW77PLqzCmHPlHfK7/26rWzn6efdyQQLskMoAY1M5XDU0VKUwxF0z+ILHlh9/w/RrUdHnItj/xzatI/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743992108; c=relaxed/simple;
	bh=5iGnaKTdh8qdUpTGBnIaXxXw7Npl7YWIGBbllmqoExE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4pPRVxD0xEuNCLe7ST20veYKynA/j63EFtXvT2IQkz2QJg/daNtSL5+IYy11GaolEmNyOBlhHeAGp84dWFFZ4Vxu79imjV1c1dxx6aPHJB/hVBAaQOLIn7XOYcDrTxIffejdL9DFbyJ+P2HySOlKlMe3nZX5tEgzR5QqCmpUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwLcE8MQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwLcE8MQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743992105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iGnaKTdh8qdUpTGBnIaXxXw7Npl7YWIGBbllmqoExE=;
	b=JwLcE8MQsdv0WhuBZVzPSpW1luxfBlpUyqiMMZqIF/qQa3w40ziGZD4fTZTJJWYhccsJHo
	evyO5Nj7nE+TnglDmmiSf+QVfAtmKSm0HYxX9X+5B9twsenEj4xrrWKAb1xrk2bGSXRlqC
	Mk+GsYZI7xiKaie51GsWjMk3Y672tVo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-xfqn310TOPGEo3YTMRUrAg-1; Sun, 06 Apr 2025 22:15:04 -0400
X-MC-Unique: xfqn310TOPGEo3YTMRUrAg-1
X-Mimecast-MFC-AGG-ID: xfqn310TOPGEo3YTMRUrAg_1743992103
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736c89461d1so5992248b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 19:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743992102; x=1744596902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iGnaKTdh8qdUpTGBnIaXxXw7Npl7YWIGBbllmqoExE=;
        b=Pj2x3r2tg20AfLRkpbdnUK6dnA8vi2jLydqSFK/BT96OOomdJL9NTHBe3NvjWU7tRU
         3bh9+PhuGHtxjtyuffgPFwF65W89eoq0piFTveqUcum/Ai6TEmVVtIAELECWX/gg/hd+
         VH5rxDrisyckRCL/AXaGkBe6EjDxKLptX/NaBr5tP8Ka3jHtq7hUZUp9DshHnhNES55z
         8ZXxGcC4ftNbwjNYuwj2tYlOdCtzZwjj+dOaRZH+4Qm+griiX+S2McSFbIIoQxCbpu8D
         NU3CechxBrEgojOcjrp0wX7NKDvUITcTDmHgsxV/AvLepuDRhe3yr6sh4Q5t16X7i9RE
         iihA==
X-Forwarded-Encrypted: i=1; AJvYcCXLn1d4YCXEgb8wu7qaJRGNb+1c8bArkuDwP7vHEc5FlxTb3fkfKReWtu2ddzJ0rFVvX5SOlea04ixtJ7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlizhgmdEPQ1vVdEhVLESaYJEU92AmUzgEE4tI0VRnsdWMfQP
	UcenpR5bSN4q81Uzq/K0FkLMllwaaTAY2EKjEP2IbRrX+oA7aic6Rjc7/+6pGoefztrIghTkS+V
	UKXWIZar/bhPWf+h7du56WWPtSqlIcd+/S7RItQb3gYs0SYJUgto9ljXt1w/28agBcMeal1JNd2
	2lWnaB5Vu6nHliyzDcEXrw3/9LnK146nBRMhvByqI3uDKEhugxMtTk
X-Gm-Gg: ASbGnct7dq5Dnj/bI8TO122zOQbuXKyHrazBEDdZF3KX3YvYki3ZcsCVJGiGTUleAqh
	BY179mcdBvbjqHo1k0bb+9Gh5E7sKs/ryfZ6ldadwsgqWWMK5JT7Vz7ELQkYOyGcc/XhqKw==
X-Received: by 2002:a05:6a21:6f01:b0:1f5:8655:3287 with SMTP id adf61e73a8af0-201081894f9mr15997600637.40.1743992102453;
        Sun, 06 Apr 2025 19:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2xrRUCjmDh8gU4TsrPWubO4RaHlHA1/mZMFsc3k0pvCi4jb3ExJetOAjK+ODkU/PKVNydcIKM1LkzsCQTKWs=
X-Received: by 2002:a05:6a21:6f01:b0:1f5:8655:3287 with SMTP id
 adf61e73a8af0-201081894f9mr15997577637.40.1743992102154; Sun, 06 Apr 2025
 19:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404145241.1125078-1-jon@nutanix.com>
In-Reply-To: <20250404145241.1125078-1-jon@nutanix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Apr 2025 10:14:51 +0800
X-Gm-Features: ATxdqUHS0zfr8JGoyzsGJ5km2ABwTqNENhD1uX4yKsHGytOkPk4bkII2gJMMLUM
Message-ID: <CACGkMEsFc-URhXBCGZ1=CTMZKcWPf57pYy1TcyKLL=N65u+F0Q@mail.gmail.com>
Subject: Re: [PATCH] vhost/net: remove zerocopy support
To: Jon Kohler <jon@nutanix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 10:24=E2=80=AFPM Jon Kohler <jon@nutanix.com> wrote:
>
> Commit 098eadce3c62 ("vhost_net: disable zerocopy by default") disabled
> the module parameter for the handle_tx_zerocopy path back in 2019,
> nothing that many downstream distributions (e.g., RHEL7 and later) had
> already done the same.
>
> Both upstream and downstream disablement suggest this path is rarely
> used.
>
> Testing the module parameter shows that while the path allows packet
> forwarding, the zerocopy functionality itself is broken. On outbound
> traffic (guest TX -> external), zerocopy SKBs are orphaned by either
> skb_orphan_frags_rx() (used with the tun driver via tun_net_xmit())

This is by design to avoid DOS.

> or
> skb_orphan_frags() elsewhere in the stack,

Basically zerocopy is expected to work for guest -> remote case, so
could we still hit skb_orphan_frags() in this case?

> as vhost_net does not set
> SKBFL_DONT_ORPHAN.
>
> Orphaning enforces a memcpy and triggers the completion callback, which
> increments the failed TX counter, effectively disabling zerocopy again.
>
> Even after addressing these issues to prevent SKB orphaning and error
> counter increments, performance remains poor. By default, only 64
> messages can be zerocopied, which is immediately exhausted by workloads
> like iperf, resulting in most messages being memcpy'd anyhow.
>
> Additionally, memcpy'd messages do not benefit from the XDP batching
> optimizations present in the handle_tx_copy path.
>
> Given these limitations and the lack of any tangible benefits, remove
> zerocopy entirely to simplify the code base.
>
> Signed-off-by: Jon Kohler <jon@nutanix.com>

Any chance we can fix those issues? Actually, we had a plan to make
use of vhost-net and its tx zerocopy (or even implement the rx
zerocopy) in pasta.

Eugenio may explain more here.

Thanks

