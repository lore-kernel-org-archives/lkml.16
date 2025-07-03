Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009FC2222B4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549744; cv=none; b=FITkCnmQ9Yb/JzNTCFO4ATMAj1WfU1MJYk0OQ89W23kuq6JAjwcmqElO8AuVVZormI0l6q+cdZ6EdHOo4JEW+i7IUFc2RuEo90vYevZ/9TUGpW9fzx/bkn6w+793oylfazvhw4M9h0MApwGjbP2rCoMtTIk8SqTrVy0b4TmgwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549744; c=relaxed/simple;
	bh=a+w31SBzpx20AQVT5u5Pj5TY/qHbG3BfdlMP+1tjTIk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BWpjY5pS1rOjY2YSSYGAAD6NuwNhtUE/b6AmAwKw6z0b5iFyNILU9YIfJ7I2ge2G/nsvfZZTE4SkTmWeGMh2XNR5latObSzJq2Crg5JBEhaLJwhYmdDysVYQJWZIUntTRrMjnD1v/E+nimAFzuk1jcuM1/c/4340dicFrdeE76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GhGe50BY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GhGe50BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751549741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+w31SBzpx20AQVT5u5Pj5TY/qHbG3BfdlMP+1tjTIk=;
	b=GhGe50BYCvVlcDaVtr8EGY/r7NE/chU6iWxhE12eDO1MQJoeNGR+3FEfnks66ppmFQW6Og
	yIEk44cgk4QSWwAoVrxVtAv8Xe+nQzmm7qwlMGhDTJreEC9x6QfODFoDZwTAY4A7RfW6hf
	uLZ5fbhvdVaiC5LjcolozPPyMV0dsaM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-hAXNQMz2PASB2-V1gwMpIQ-1; Thu, 03 Jul 2025 09:35:40 -0400
X-MC-Unique: hAXNQMz2PASB2-V1gwMpIQ-1
X-Mimecast-MFC-AGG-ID: hAXNQMz2PASB2-V1gwMpIQ_1751549739
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b3ba8088fso34764111fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549739; x=1752154539;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+w31SBzpx20AQVT5u5Pj5TY/qHbG3BfdlMP+1tjTIk=;
        b=qlrpbGF3lZB/xmz1gzaLYxyuxgPYcVkg/B85zbyKOL1eC68Nl0bi+9AWrfNgGG1O2Q
         xN3pb/JxikEbzrPg1IYy9BzXdCPYMgkp4ZtE3+X1VIshVpOhUpRNaBI4fbWvJPzydoO9
         HuZfo/+EK4VvBBWY/C8QQqja6HNh1v5iwAgY62UWTm0/ejXhZrK4Q/twi6UzE9e2gaT8
         hAoJDfXTpH2ZBt2CM+LXc1ckB2fvaeMyDfyUv4h5Z0JGVm2x4TdOzKqFvdqy5C55FSaw
         Wf69H8x0enAcBk7QL4Dw+TUddAAdNJKYjN2V2ZXcrlq9AnipR96zA/D1UiKY8fW/gLkP
         Jtew==
X-Forwarded-Encrypted: i=1; AJvYcCVNvulwrCJUubIT1vAIIewDObTHInyfLVPCeJ0sbrf75Qux8x7N0eDjiNqw+cqQNuEQjkfh2twd13sE0v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXVtRSrMficfQQHODAxaocCt9ezxGo8Y+yNPYSpLIeaQ3a8sd
	5bVHEQ2Ci4R2J/ZNdt+bjTa29/A2XuuQsvHm+ELojcY92Es3O9Faa5aBexs/mn+HUbD3WqCteSj
	kaTSUIwwKrY7dXffatxh/Bgvi5J2jaM/8nS6/1V6cKEyy8wEus9e9GjLLnZT9eVo1mA==
X-Gm-Gg: ASbGncstrV7AidQusuE8ibVfvqxfmuMNPnzyPjL2CXP6fM8XfOwfdo1wqwlTyFOEEnQ
	20yyP/8pbaNDGhl0O1bil9zWL50WEcHOKYoy0lXzsFNt0ONZPvzFZ/8ioBjRBD56pHpDYwtENc7
	4ptlKkbm2ganZ4pDZmTLJu33fQb2zFzuKu1j53RSF7TgLhi2pBcp/rW9Knl/O2xdyVZ0xn/ap4N
	gZzhKibvtcmNCr554tx9rllMGw92Y5qVArOUT0H+UyNoA6pXPKLIACi3fV1ZtLbKh5Vy/y1xsDu
	C/VYaFjstR7K65raZEJXYYoWkC4N5lChI9M+cj6Z+c4UKas=
X-Received: by 2002:a2e:be89:0:b0:32b:7149:9396 with SMTP id 38308e7fff4ca-32e0fd18fe6mr8228121fa.41.1751549738991;
        Thu, 03 Jul 2025 06:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQaqzYM0ICxZ0BcYvjzIBIgaPPoPD7CoeNzD4IOdnJqDmOWKXFznuKZROMVSn5ZIRHwy1dDw==
X-Received: by 2002:a2e:be89:0:b0:32b:7149:9396 with SMTP id 38308e7fff4ca-32e0fd18fe6mr8227821fa.41.1751549738530;
        Thu, 03 Jul 2025 06:35:38 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec6592sm21550691fa.57.2025.07.03.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:35:38 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 3747B1B383C6; Thu, 03 Jul 2025 15:35:36 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Fengyuan Gong <gfengyuan@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 edumazet@google.com, "David S . Miller" <davem@davemloft.net>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang
 <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Stanislav
 Fomichev <sdf@fomichev.me>, Kuniyuki Iwashima <kuniyu@google.com>, Ahmed
 Zaki <ahmed.zaki@intel.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cake@lists.bufferbloat.net,
 willemb@google.com, Fengyuan Gong <gfengyuan@google.com>
Subject: Re: [PATCH net-next] net: account for encap headers in qdisc pkt len
In-Reply-To: <20250702160741.1204919-1-gfengyuan@google.com>
References: <20250702160741.1204919-1-gfengyuan@google.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 03 Jul 2025 15:35:36 +0200
Message-ID: <87zfdl8kif.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fengyuan Gong <gfengyuan@google.com> writes:

> Refine qdisc_pkt_len_init to include headers up through
> the inner transport header when computing header size
> for encapsulations. Also refine net/sched/sch_cake.c
> borrowed from qdisc_pkt_len_init().
>
> Signed-off-by: Fengyuan Gong <gfengyuan@google.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

