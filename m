Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5413281355
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284288; cv=none; b=fXnhZ8f5FySq5+AuO5C7ueUeCUgJU3UfmcLvDvkZMYgeY0nbX/+Fdhbydrh4rCjNpk3Ztkz7fbUbEB8t1eCnpeTlY/UmDK9SBbr7ZJBaT61V3WbpAXNqzpuNbxp7VHSIUaPpawfJmyz38RFEz7GszTCAbB3MoHO7CYTiogLOui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284288; c=relaxed/simple;
	bh=uxZG4n3nv8upFUF3AElIC34tkOtzKRJkS7sA0QWrrlc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z8FsV8VexHX7CRVWnW1q2omahUj+tt1GXMKTG67qN62qotiSluSOQywYEsx1wHSCCaror62kct/0OThgCn14Tu2z3UOAOEE82DUmWVDpgAan38g4scF/p23EiKojir0YpCe9uaDZDqzD/4J7cltSYgWpw+jztuMVf8igfbmtu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VCGMXqyP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VCGMXqyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744284285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bRUqjURXRfi5I4u/cU2aBmMRmmhkdr8UnK21YTbfjM=;
	b=VCGMXqyPTSXeKbI8pdpIlA5o3i3ALJyCXVN9j9m9VGreemc5yaL4KC8KKjJaFaFe5gRmGH
	nQWfxkqqjWLM7Fcg10NIuRGSazaDLMEWrowGv1ZPZHQZkGqo1DrdPJbpERY8vXQlkNJ5uu
	wnLIxSa2wKKLuq7Te1Wg+sBRN6PW8SU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-ZllAiCo_NPCsp9n9stmhWA-1; Thu, 10 Apr 2025 07:24:44 -0400
X-MC-Unique: ZllAiCo_NPCsp9n9stmhWA-1
X-Mimecast-MFC-AGG-ID: ZllAiCo_NPCsp9n9stmhWA_1744284283
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso64705466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284283; x=1744889083;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bRUqjURXRfi5I4u/cU2aBmMRmmhkdr8UnK21YTbfjM=;
        b=a0PLp1oFgN4PXjZz0xvSk0Th5T1XuMFmM4CbVI9JJ6czXx76ZThdHiic+HnAE0AfCA
         zYYqMFVieiqajbNg/7ubiRpwNX9kJyW4a+L+ohBUI53rMdZ/zHer0yfA9H07n7c0L/0R
         Idg2askZZJ9jK3FRQkMBx8nv7T96p2QIa5eOKYMcOl+2/Rt9QQcerJlT/y+Ze6jhmL7r
         +hWHJU3WCb5+q7IFew6u3snxIAKI8J+YsYGVFSczugwxi7hvNlyQbGgoKYyPv405uXIK
         FvAzPv3RBvh/7NO0Mr5irhr3ggSclDXl6d4IFVVhPYI7P4tF1DABnavjSXnf9qw6I8Cf
         6eNw==
X-Gm-Message-State: AOJu0YzKSfH4/KjC9On/uloa2nMW9DeHbUmXmy7gyOKy1QjFPcR3J2MF
	TJ4Rq6McHfKm7eFjd+9yJFQIS+a7HdAxrUtOC5pgNCKWbSpfgIoq1Tqrq2SK4frHlg+QeI3/f63
	JYHRBSAHkvILNprmxn3yQi8IqBNxQTG+uIyn5AY4L2ZPrb4fVYneqChWqMiBQNg==
X-Gm-Gg: ASbGncsIWOsQ9OvyrvZWH+SHTIIzSz56oqn9DAWdggKeNhMqLjHDRhf+ZIc8wJs+PHI
	8M4CNpSh/SbZqPq325JfaFfXpIVVVOo1LzovHcBzKSTtjG4yb+5ONWXz3GcOmGzBZzaHN3eHFoR
	Vw4Kr1Cod4qe8DOp8Oob13ZcUPSjMfIXjFZvvlaMJ/VN34c8li3O83HtaEhfyHi6Tyns4OpjmEU
	jFEnjxNmzHjOY8WSi/cVbaJ8ImkraoAuHp7Pz0MqQ/FnnBNzsdwvGNEQQQWpb75Vb48KFZpvsUQ
	/Reqm3Vy
X-Received: by 2002:a17:907:2d22:b0:abf:6ebf:5500 with SMTP id a640c23a62f3a-acabd194daemr265371266b.16.1744284283060;
        Thu, 10 Apr 2025 04:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzYJr1mbcVFMmyOfUdrNowN0DoumFwjn6olFk+s/oECeaB2XhRLnSDLWVgdEThGtX1Z2TGXw==
X-Received: by 2002:a17:907:2d22:b0:abf:6ebf:5500 with SMTP id a640c23a62f3a-acabd194daemr265369266b.16.1744284282695;
        Thu, 10 Apr 2025 04:24:42 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb312bsm260985966b.15.2025.04.10.04.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:24:42 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 490101992292; Thu, 10 Apr 2025 13:24:41 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Peter Seiderer <ps.report@gmx.net>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Peter
 Seiderer <ps.report@gmx.net>
Subject: Re: [PATCH net-next v1 00/11] net: pktgen: fix checkpatch code
 style errors/warnings
In-Reply-To: <20250410071749.30505-1-ps.report@gmx.net>
References: <20250410071749.30505-1-ps.report@gmx.net>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 10 Apr 2025 13:24:41 +0200
Message-ID: <87mscotg1y.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Peter Seiderer <ps.report@gmx.net> writes:

> Fix checkpatch detected code style errors/warnings detected in
> the file net/core/pktgen.c (remaining checkpatch checks will be addressed
> in a follow up patch set).
>
> Peter Seiderer (11):
>   net: pktgen: fix code style (ERROR: "foo * bar" should be "foo *bar")
>   net: pktgen: fix code style (ERROR: space prohibited after that '&')
>   net: pktgen: fix code style (ERROR: else should follow close brace
>     '}')
>   net: pktgen: fix code style (WARNING: please, no space before tabs)
>   net: pktgen: fix code style (WARNING: suspect code indent for
>     conditional statements)
>   net: pktgen: fix code style (WARNING: Block comments)
>   net: pktgen: fix code style (WARNING: Missing a blank line after
>     declarations)
>   net: pktgen: fix code style (WARNING: macros should not use a trailing
>     semicolon)
>   net: pktgen: fix code style (WARNING: braces {} are not necessary for
>     single statement blocks)
>   net: pktgen: fix code style (WARNING: quoted string split across
>     lines)
>   net: pktgen: fix code style (WARNING: Prefer strscpy over strcpy)
>
>  net/core/pktgen.c | 111 ++++++++++++++++++++++++++--------------------
>  1 file changed, 64 insertions(+), 47 deletions(-)

Most of these are pretty marginal improvements, so I'm a little on the
fence about whether they are worth it. But, well, they do improve things
slightly, so if the maintainers are OK with the churn:

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

