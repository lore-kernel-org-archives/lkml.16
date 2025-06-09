Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A625A62B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479012; cv=none; b=ION/K6hlY1nDHVwu+4szBnlsPqRJwSon3tHPVetfA3RqnHt2tueDq6XirE8CgX+sXjEekhipPIOfBNv9XPSbc/mx955QWLKISeJCHIlsjC0Ts9WefxRESKxTLRcW8jjjg7llm0M5jTyPy1/xCMfTShdNCs1dGghLMh4CsmryBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479012; c=relaxed/simple;
	bh=8EcgqC560eYHVLzzIVnGqJOfxiE1usTuKVMr5c5j3O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jB9PQdID4bSgXBCqrfVNQcuKwYgV4dhu8DCpSb3uqMdqX9Kl/MACr4s2kT2IP3R6PxTiC8/1gKtSxZNoDlTVvfOMnCfCtQJas4A6+i7l84uoE+tU2HcyfmksDV4dp9nwgiKS+Q0nbEFaKCHOR55Wx856KaMD7+/qgYxFqswNKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpNQqY+0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpNQqY+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749479009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bu95bqt5fllwDHdUjFRYtS/5XzWEF81181iRUHtLAbM=;
	b=MpNQqY+0wnVLVxZVdPnhHJ9TxvvheI1eYL9P6t++aSow+kkSibsVtqEXYLJPvLArn6/C8M
	1YM/9TOQqGFmyItg9/cIqw+PwYAT7L3rBzbcdW1csMchjRKT/SqGw/csJllXSpEIIYIOOY
	lyGHdFcnxmpVId64AWYfvoQg6R0zkh8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-rS85Egf-OIq4TMzuW1hTrw-1; Mon, 09 Jun 2025 10:23:28 -0400
X-MC-Unique: rS85Egf-OIq4TMzuW1hTrw-1
X-Mimecast-MFC-AGG-ID: rS85Egf-OIq4TMzuW1hTrw_1749479008
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-601df3b434cso4965070a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479007; x=1750083807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu95bqt5fllwDHdUjFRYtS/5XzWEF81181iRUHtLAbM=;
        b=NeB/rKpIjhJhfApy6pqCa6W5JG7t/6CWlDYCrOp35Z9zIDuXFF4YwZ1F++/ubnmxJZ
         kG1h37h/12mq/qGRG83gzV4oRchfNwAQfJekHm4CizMbgFGiB4+Me5o4GZQuypkqxfFL
         IBZPEhk8FE/GzrRyM7aBuml46TF2JZuU9ENSGtNegO7IEuNTF0TeW5CAuuui7jc1ypKJ
         uC4U4GJYZ1h9CFakfjHbFHLoO6W7A4vhqbrTd+FPUl0rQp9zkcdBgfgaQ5/zoQpYVDmI
         pFJnbbeF/3/XCnJUZzACZM4undQLbjclEhzKWE2u7ctj4IWx5ZNzAi6COPsLQJPtzOXv
         zyIQ==
X-Gm-Message-State: AOJu0YyQq57mLMifw3DRDiFMx8SenunRfIfP3XPGbMML6GCKxMe1sTgi
	tmznI8i5ueQYk8dWYkd74HTNNB5x7srhu/MvkQGq9u8eKjDDV6R9jH2+kZEefVquDX9KmvQjKIL
	HH1r3zmrQlZ6XBW0ERUB+/z7Gri/Ce6C9138xDeuRaXh6/KRs+4G4avcoDAGxUt7aUI85kQhnmc
	a4pioZ/UZstpCWQ0EBY1Q/sxcao0BGAU5Wj3fl/6XohhshS37n
X-Gm-Gg: ASbGncs12pG9FCyD5sKp9y1ioxuksTj+U32nmcFM5F3Dj+geT8YC863ayOS0ffcT3bM
	enCQDdoR2SPd8duYn6SsLi040Otxd54YJvO4WEP6Zv6wbJodYWVILajZ63kqroVaFol4fDMDPd1
	t0YdwounD1j+RuqPW1KRj+J6A5MrRLWn4F6Sw=
X-Received: by 2002:a17:907:7250:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-ade75fc357dmr5540166b.10.1749479007499;
        Mon, 09 Jun 2025 07:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdFm50ZqTrtiAaeCZxzMTOJGmQspyn0ugpdOkFaeB92pob/RBEpCC1LY+p1SzFJRFwG9ViOjpKT8qUbWccq3U=
X-Received: by 2002:a17:907:7250:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ade75fc357dmr5538366b.10.1749479007066; Mon, 09 Jun 2025
 07:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530200305.85319-2-jsavitz@redhat.com>
In-Reply-To: <20250530200305.85319-2-jsavitz@redhat.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Mon, 9 Jun 2025 10:23:11 -0400
X-Gm-Features: AX0GCFstG9gKn9d8F0xmlxeWHmxs0iVZJEdQNQ8-CUXHyj5wlOfl7zEH5cLtapA
Message-ID: <CAL1p7m53yJ-dpg6L2QVQM7bshWYXAxOJjrVGdTG8cDMEhNogyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] kernel/nsproxy: Minor nsproxy code simplification
To: linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:03=E2=80=AFPM Joel Savitz <jsavitz@redhat.com> wr=
ote:
>
> The first patch removes an unnecessary guard by the same logic as
> commit 5caa2d89b7f1 ("kernel/nsproxy: remove unnecessary guards").
>
> The second patch fixes the total ordering of resource acquisition
> in validate_nsset().
>
> The third patch implements usage of the cleanup helper added by commit
> d057c108155a ("nsproxy: add a cleanup helper for nsproxy").
>
> Joel Savitz (3):
>   kernel/nsproxy: remove unnecessary guard in validate_nsset()
>   kernel/nsproxy: fix put_*() call ordering in validate_nsset()
>   kernel/nsproxy: utilize cleanup helper for nsproxy references
>
>  kernel/nsproxy.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> --
> 2.45.2
>

ping

