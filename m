Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702A1A0711
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614194; cv=none; b=fKVLJXB4UdKm4kmKBZKJztwWCSoAP/4soo6rVgKbKARYS9C74HlfPe+mVoFT5TpaK+6YMFr3Yu2d9C5E9TjgK6ODZrO2quWyDgB2snmZumxmvEXld20UMQPCtOJONXKf8I6j9ztoDKQxaiOjIjLtq/QFLOclYJocMMfkCnOqKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614194; c=relaxed/simple;
	bh=M8n0PSHddyTE6fc+cZMW8tLH2wTWAC9GQYr616Qmvlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwaiWpfCNahfXgKxp5DQA573gknzp1yPC9yCdBm9RgW/eJwRtTKPu4Ckqqj2WQrU5qOvmeJu412uq0VAuFcj98ItsCm4KaTV4JqcK42esyOoDUcKkaSBHrvW92aV0qVQMWTgG3cXAL/LkxGI253tKtJ2nLj5Jh0qYzKp+QVkNOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZGkpFXN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZGkpFXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744614191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KJ4c0a3Aexij9u47Hm76JUGfKE2lcIO7FCQlwEhiSF0=;
	b=dZGkpFXNsGg/U8jaHidpE+xbw1IYKSfnGZUw5LoeK/HNqKj039QfbTtu/KwzunU+YMgvRF
	L52bABXh9v9ssm+lit9YHCwTckTRu0mbqWOuhHx2du1LYzMgXxztHZR//F1l2kikdLwszP
	XaUdGxFdmRlKZooa3oum+tG2iAIHrDM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-tDpPiDC_PtOVpynPKpAZaQ-1; Mon, 14 Apr 2025 03:03:09 -0400
X-MC-Unique: tDpPiDC_PtOVpynPKpAZaQ-1
X-Mimecast-MFC-AGG-ID: tDpPiDC_PtOVpynPKpAZaQ_1744614188
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so536810066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614188; x=1745218988;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ4c0a3Aexij9u47Hm76JUGfKE2lcIO7FCQlwEhiSF0=;
        b=wGaN9VtMmKQPSgoRCuZ9xgDcuH0+Eq+3U25tBocl1G7kPpJQyStzWozDaljlLPMcXN
         HcrPUdehX/nUIrsNgyw4QoYc1U+TUY1yhyG3vMIxhq9PNkgGRrG8k/hujO4BXZ1Tw9NR
         zPKfxppAWRLPQ1X64XMmUkxrhKUAZt6rLa5Qu0whGHHFz6QGYfKIKp7c+qlcQFVQhefw
         YyNCSv5oz/qNnKsr4g+x5CWixnZW5+mr0fJ/EQxz7T4QZqoUjgMlN1ZC4+1SCXUCkkP/
         giIkSHEzAC7kwu2hCAQ7mkMtkKjBc7qRzGyrI+Ev1Y4d5zLa8aTEhU29mkRA1Xu5bl25
         xfSw==
X-Forwarded-Encrypted: i=1; AJvYcCVQbg8AscMRciUC57uVYs39l1+MXDCxGKwUUni4wdbAK0EoFVGJ5/TCpL0/GwP1O6XcEOGukW/qiRZSHB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSuNkcHLeNbSyjAOZ1Z25qwXUmX2nGMpDY/JWj/B0rya4LFWyD
	mZprPLJTD3jZQi7dZ+R7FLLNZ1KVVIeTdvwD178Kbp/ydLuEwKF4DeFYdzlonWIrBcKpYtG6o6+
	lzP51rslTQWrCfe4psLRU/1AhdUYiiVPisOs0u7WmtaL1BUZkaaAu7fYNI1E2Sg==
X-Gm-Gg: ASbGnct1dch3SqvDxpKLRdIYfsWIk7WIj1L+MvsHeGfmH2UkJ8RC9WVmwfafZBmnuUx
	f+cxhs+Qt3JPS5l2ytp+vtpDC/Uyc83s8g3/B62zlcD65GfJQenn8ado6NAHKm3m6OCao5xn/aL
	fIqCC29fRsOfO5+6nPiQN013wxUssKXl0/gOZ+w4+BKHVHU+qsXt31/92fwV8dwHK4LofzVNgGR
	z8CLgsxBV35XyMEXBqlXA1vxIvMeECSJ+w7K4lgdORa9cUUvEaKfzig6tmQ2PB8B1103TuF7xvu
	L7a97ocNxiIe0z9hVq/1pu7oJoSUi5f9cTmVpAoURxKUFRUmPrDLUUw=
X-Received: by 2002:a17:907:3d0e:b0:ac4:5fd:6e29 with SMTP id a640c23a62f3a-acad34d8a60mr1051268866b.26.1744614187919;
        Mon, 14 Apr 2025 00:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6kUFXmElchnX/VTz9gfGixQp4NvnPe/DcOgLrFIMflSHFpxy7Try/58ehYN202cHqJyyGXw==
X-Received: by 2002:a17:907:3d0e:b0:ac4:5fd:6e29 with SMTP id a640c23a62f3a-acad34d8a60mr1051264966b.26.1744614187474;
        Mon, 14 Apr 2025 00:03:07 -0700 (PDT)
Received: from [172.16.2.76] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce818bsm851777166b.182.2025.04.14.00.03.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:03:06 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 dev@openvswitch.org, linux-kernel@vger.kernel.org,
 Aaron Conole <aconole@redhat.com>,
 syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
Subject: Re: [PATCH net] net: openvswitch: fix nested key length validation in
 the set() action
Date: Mon, 14 Apr 2025 09:03:06 +0200
X-Mailer: MailMate (2.0r6244)
Message-ID: <8141724C-7CC1-4715-B5DF-0469273E8358@redhat.com>
In-Reply-To: <20250412104052.2073688-1-i.maximets@ovn.org>
References: <20250412104052.2073688-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 12 Apr 2025, at 12:40, Ilya Maximets wrote:

> It's not safe to access nla_len(ovs_key) if the data is smaller than
> the netlink header.  Check that the attribute is OK first.
>
> Fixes: ccb1352e76cf ("net: Add Open vSwitch kernel components.")
> Reported-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b07a9da40df1576b8048
> Tested-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

The patch looks good to me.

Reviewed-by:  Eelco Chaudron <echaudro@redhat.com>

