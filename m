Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4FC195B1A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751336426; cv=none; b=r1eStWRtchNSqBjJUzPIq8B8HdrKqyMgc6eZH0TAFdURgnuXOGKLH59rcZn5hVa1oMC+dbk3tYxuPDG5FyvR+nykBOY1TRqK4B5UUvfKHUeALn51Zk7IpC+VJtKumwELSShdw2A5w1YTCrbITzVdNV43saKz32rSD84XyGLu2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751336426; c=relaxed/simple;
	bh=WRkNpi1+u755d+RTOomAEvo4QL0439YSaBkjP0jh4c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZUEjphSNXEZYWXI+OT/dUjsD2buC7fAe5hwux934yEpejIwCX7/WozIQnadgvpqmp+LldrI7h3GDyhy+dGMfePmUo56jkFLdGJSrODzmi5KTiCYVknkgAM7wTC5Ek6N1D/dJ7uwS1Fba06vCQyIgnrl7snDkBfp0eZeDJFWuzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TqFxtGTT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TqFxtGTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751336423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRkNpi1+u755d+RTOomAEvo4QL0439YSaBkjP0jh4c0=;
	b=TqFxtGTT+Xl6hV9PvImmZ8naU+2SeXAa0BWxPSkCSB+6r4gn7fpPTwDH6kTP2OaIeVFz0X
	DRpzfvBALO1PAj3rd/IZFhbpWJh5U4rbrXDpKFJF1eXD9i7RxIlE69VxNeuJbRh5RN3ANI
	d0JluGzzKDA0nb8/CrFblcdiQCjYYzo=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-TbUqcub9Pia1nsE0eLp_eQ-1; Mon, 30 Jun 2025 22:20:21 -0400
X-MC-Unique: TbUqcub9Pia1nsE0eLp_eQ-1
X-Mimecast-MFC-AGG-ID: TbUqcub9Pia1nsE0eLp_eQ_1751336421
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5316d00ecfcso870457e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336421; x=1751941221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRkNpi1+u755d+RTOomAEvo4QL0439YSaBkjP0jh4c0=;
        b=JH43CSAWbopD0HYv0fxcAqr7U0vGDSPzCMEPsq55l9cG7+jE3rKMVN/dfwmKDCbgJe
         as1OEYxtFVOKJh9XtKj/rwi6cTNhU4p6c2Cf8WWzvkMAmlMyN83+UU5vGIPQ9RKHyRuT
         Y4eZXkZnGgA+2Fa5+YnOZskWVUVSE+cfoi2rs2AW1pH26EWEQx1+Dg6s59mwHioi2yOT
         4J9tgu3jcq612k0/4A7b8ViNbUi0eEfppcpKK3Louu8I7NFmRwN5QGVO02NmKLKCSCUR
         Qu3vGbBIg/Ok7EoSl1s48eQ44PiYpzH5R+AML17zKhWYhdvwQFsUZm2vl2U5ZeoYaRau
         qzBg==
X-Forwarded-Encrypted: i=1; AJvYcCXEaW55n54fIVGmcxE/H4sAgQuLwWgFtCA8E8AzkFn6T8HL37WRYUY4OhLpIVSLbRDYV64gyYH1nbEFceo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRl4dJPocrF/vbMj5NSvERcQkzx+qc3SXvZRqq8Li/AwwXqf+
	gn1d4qsrb0LtD+pM0b/gXEcBWDMm9Yq6pz20Khphf8/HQpPYwcayC3UgntowC8Vg7KSjFjd3m9y
	HVGuHvGtvRFLhyVnGGYv7ciJp4UsFNqwVrkK5U75694ZZZah8el+OvziS1KIzYEzzlLZ7eJ4zIF
	y4rdUfNuSgnRZrE3zabbH9kd8V91I7Rt+1SbHMH5oz
X-Gm-Gg: ASbGnctZbcvIHRDubomFFJZ8PE0D0uUQqrbP9iXQb3cVa7KhbGjpVTG4bEhs3oC18Z/
	3UFZOc9HKpbbCIHPZdBWw8A22qwjyxp2tNZgwlxWhjQVzjJ7LYHipZPUwBReyLcRhgI3f9WShEK
	Qj
X-Received: by 2002:a05:6102:2c05:b0:4e5:abd3:626e with SMTP id ada2fe7eead31-4ee4f9e6313mr10405283137.24.1751336421326;
        Mon, 30 Jun 2025 19:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcgqA4GY5HeNzIXNDy3m2/0QUTCkMPWazV2oM4SlXLsY44Iog87PMmTUv3dD5hme1ectzbCFF6OxMHcOYRnvk=
X-Received: by 2002:a05:6102:2c05:b0:4e5:abd3:626e with SMTP id
 ada2fe7eead31-4ee4f9e6313mr10405270137.24.1751336420966; Mon, 30 Jun 2025
 19:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630144212.48471-1-minhquangbui99@gmail.com> <20250630144212.48471-4-minhquangbui99@gmail.com>
In-Reply-To: <20250630144212.48471-4-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Jul 2025 10:20:08 +0800
X-Gm-Features: Ac12FXzTGbPc8d1stXK-UyjLYhm6Mh_lf0LlWolyX6yBYCOFZ2SRlUxOM8CEHbs
Message-ID: <CACGkMEt9za5v2tWDBOs_1d8nCk20CC4XyadszKB7ezKRz=sBmg@mail.gmail.com>
Subject: Re: [PATCH net v2 3/3] virtio-net: use the check_mergeable_len helper
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

On Mon, Jun 30, 2025 at 10:43=E2=80=AFPM Bui Quang Minh
<minhquangbui99@gmail.com> wrote:
>
> Replace the current repeated code to check received length in mergeable
> mode with the new check_mergeable_len helper.
>
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

