Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03921266B72
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277466; cv=none; b=AGcEOqpnnTDd4O7NvqYtPyakLcJleT5GKOQ7BZF8x/x9llZCw2UmTHFjCgQDgUzvmp3pEnFrn46OX7btA/OZSA/TjA0cs5eGkpMjHwIxMKd1eyGDJAu/60rxt/T/ZWaZrRpI9Nqk6MvMuHHsvzfVCnCNqYnSrZppOcxZNhBKUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277466; c=relaxed/simple;
	bh=p8WnN1jop2bnv+TBKh5ZzVW7Loud1RsCr86Lhw1nSC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3/9vVP0U+onJc0dYCmvtmpz39HFn2OwBXAYKUqeAKxrp5nTydcFuXwililE76a2GQzBlze2Sn7bDbIdFGMQJllPiwq5OFF1mwDm/W4mHYwU+t5WvsQ6ZVHutx5HyeCnuZqGIOKmOToDclP6QQ+qMHIJVdmOxw1KtoG7W5HXhfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Byc2DOiu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Byc2DOiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744277462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVfmgRn9b+MKfQINqgY7O8gFSVgjcr0dyC/SYpb7QXA=;
	b=Byc2DOiuIxr7B13Vco52L1NfV4xSYlr3ZGmr+QZ0Agv6vYRssPP30qkOSYBYX4E4p0kkkN
	WnRcN6MPAL5tEZ5dQYrUIQiHvAu6QdoKf8zrEJMWTKv/Abe1G7vahN5cB94RYf4SqFTFlY
	RCVp0vmUZ58ziO//7685pV/AccIREbo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-eHl-dKk7P66KDw-LPENLvg-1; Thu, 10 Apr 2025 05:31:01 -0400
X-MC-Unique: eHl-dKk7P66KDw-LPENLvg-1
X-Mimecast-MFC-AGG-ID: eHl-dKk7P66KDw-LPENLvg_1744277460
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso363368f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277460; x=1744882260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVfmgRn9b+MKfQINqgY7O8gFSVgjcr0dyC/SYpb7QXA=;
        b=lc5UHZIY1lkBzSWwYKx1hh9HBMvcqpfbHqSewAh5e6th3xqIjSspmzWXMMOoSd87Pk
         FtLeWO1DF02PynCYglQbv5asG/HtB+ovj3tPWw2MEwvs/+H9YOICEZf0lsb2UeEIco+a
         JlgDYTWWmAWOW9MVZrHrZULJygKOng+osRTNl9rNgOnLG3ld/r3hXwH7q0+Icg5wRVBm
         SmDwzj73zvMMw0SiYdnO9FOTbxvuDOReOw9ey2lA5TdERL8Em7b5Av469HewmWQzWSWP
         kJ8iCqfmO81iuNwrvvhXgzdshVSPDojU/3OlbTmDzSabT2TzL1TmFc+26vWzLz9TwHEF
         EsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfjCrlUptYepI6Rw1Hn6WL8Kxm4ZCZ9Tgv8kbwixaLIKcnbB3TDcBVNWsbHydpRjzT+UQeBLYmvUs9u7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmpYbuKrnIhQSLKjT+Bloqz4RsAhF1I0uHp12m99Ef04viXouT
	z5cK8sE2iw2XeSf2cO+BPJIY4hKsh8uXo75mPnNrqIle2CbQ63oSafeiljV7Hx6BwoVII1hNhIp
	YeWlg8KQNrFBpPD9z/4vApKDSS4Hlu5TwIdpya/6lsl9XNYxNV9uOI/kOX4AGyA==
X-Gm-Gg: ASbGncvLvFp9fmABmGNIHsHGkXmGF70BCxOZY14Ev94ysX/N6FuwaOlDr53+xih6nCI
	Hw9u9dA8pBrfR9sHreo6gtFGjyeGWI7v1zSzVpb2xinBbhTC1cxHToCDpQNhFC5D6CDvoynnnOM
	kqhWIfMIo6jRrmWU8fUK7mUN9NKlzZC7feM1wB3RRF9k2eou9FKGa/roa1Ko4dDjTbXWy2Vf/gR
	wajl3F3T6LDLXLaqNOvraRRpgTOi/Q/KGZQNZD11tRSsag8NKg42hM8Ce1yIfD4QcctIgD/A626
	1yPdZTy2OEQN45qvVd18IVVULCYT57ImD7ehvzM=
X-Received: by 2002:a05:6000:4202:b0:391:487f:2828 with SMTP id ffacd0b85a97d-39d8f4657abmr1372765f8f.10.1744277460113;
        Thu, 10 Apr 2025 02:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsq3LGvvA3jJ5Ac8MsDzHgTZ2+T6jVK8OnBPioVOk7F1bhAo8k8hGKF874SxsPTxBYjyatKA==
X-Received: by 2002:a05:6000:4202:b0:391:487f:2828 with SMTP id ffacd0b85a97d-39d8f4657abmr1372740f8f.10.1744277459756;
        Thu, 10 Apr 2025 02:30:59 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm45760155e9.26.2025.04.10.02.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:30:58 -0700 (PDT)
Message-ID: <09aeed01-405d-4eb7-9a12-297203f1edcc@redhat.com>
Date: Thu, 10 Apr 2025 11:30:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: ppp: Add bound checking for skb d on
 ppp_sync_txmung
To: Arnaud Lecomte <contact@arnaud-lcm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
References: <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250408-bound-checking-ppp_txmung-v2-1-94bb6e1b92d0@arnaud-lcm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/8/25 5:55 PM, Arnaud Lecomte wrote:
> Ensure we have enough data in linear buffer from skb before accessing
> initial bytes. This prevents potential out-of-bounds accesses
> when processing short packets.
> 
> When ppp_sync_txmung receives an incoming package with an empty
> payload:
> (remote) gef➤  p *(struct pppoe_hdr *) (skb->head + skb->network_header)
> $18 = {
> 	type = 0x1,
> 	ver = 0x1,
> 	code = 0x0,
> 	sid = 0x2,
>         length = 0x0,
> 	tag = 0xffff8880371cdb96
> }
> 
> from the skb struct (trimmed)
>       tail = 0x16,
>       end = 0x140,
>       head = 0xffff88803346f400 "4",
>       data = 0xffff88803346f416 ":\377",
>       truesize = 0x380,
>       len = 0x0,
>       data_len = 0x0,
>       mac_len = 0xe,
>       hdr_len = 0x0,
> 
> it is not safe to access data[2].
> 
> Reported-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=29fc8991b0ecb186cf40
> Tested-by: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>

A couple of notes for future submission: you should have included the
target tree in the subj prefix (in this case: "[PATCH net v2]..."), and
there is a small typo in the subjected (skb d -> skb data). The patch
looks good I'm applying it.

Thanks,

Paolo

