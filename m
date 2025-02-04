Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32820D4F7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672364; cv=none; b=GVU8SA5uN+XD0+A8w41Teh3dSiclREztMwuMNOXEEFH4w3tkmQ3ii/EXPSdMKqvEhOi3LLWC3TxqoAp2pSzodO9AYSdQJnqPCAoBffeqLci1ALyYdlARZiBSTW8QxEdGUOBUcBPcfPYDIK1tHg3bVQhdNcjvi/YnQJucADHH+7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672364; c=relaxed/simple;
	bh=ZXCyve0sUTK6c4XTKrMCSgDTrRmbMhPKy9Ob/dPEpwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoJFG/2J0lvcyrrZO+s5ZRb+UJgROKPJh+Y+xPECZpf19Gz8bmBKAgVA8LXo6bClMmzT+Owc85vZ/NFocv5oTq4cDDePTYsyWcCyPz2GI0DYMYLvD8pgovVXtHDmJVN/jotwcOPU1OxghtMYIOreHhU2Adkgcy7TwV3uNTPXqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iECYI6A4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iECYI6A4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738672361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AX5LRiS12WNOF9SfYpl9HqapEpZa+Gag56j1GQy3/fs=;
	b=iECYI6A4Fkf1wj+zHcERNHLA8Z0Awzoz8kVoKGodWXidX/fTKbOCassp9LBDBjetctzPFZ
	Jc0ETO8pWT6sTgYHOp+WI6PBDzPY5tmJ4PxiZ/yC/JY3dGkdL8aFjJcGMNQ/U9wZ34JKVN
	MPukYJOwR6tFFSK93OD1X6JNe3M1Msk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-sGfdezKBPnuIe59bqvPl5w-1; Tue, 04 Feb 2025 07:32:40 -0500
X-MC-Unique: sGfdezKBPnuIe59bqvPl5w-1
X-Mimecast-MFC-AGG-ID: sGfdezKBPnuIe59bqvPl5w
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e00ebb16so2027781f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738672359; x=1739277159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AX5LRiS12WNOF9SfYpl9HqapEpZa+Gag56j1GQy3/fs=;
        b=udeuci5Sl6Tw+sL8fls0xgNYpB9aMJlIwz0HejzOSoR1UulvLR1SocI55T4TUNgot7
         TGmXKbEk0zgRoEi2rtEfPY0n4ye74iLeJwQsKCN302y4rtL8IuGG0d9OMru2m9YFGTMP
         dakWZIXYlDJ+LF99PZejCVVpdxto/17ExztQaCbBQZr8FLf1xa9zX405gCIc9+XHq7vA
         Se9mZJBRDtPIIDyfB361MHozawv5By49FyaiXNSNtEWNMe2VxaxxWSpOLVtgrkaNSqXM
         fVJEvEnjZ25k1a5WKoVorwgwAo12ohrcKio/tjzCYPA2ON9w5/RcxMQal6lMN2T2z1ex
         R+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0x4UCPvJrYZfMuGeErICcX8MSLYcyyQou8etDjST29DohuKTTwO7IaiI9NAwKUFVF2GifW2AjXds176Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/LS4Wt+AjYRLs6fJxNcMnPjXlezcR2lwpMq08ZwmszRwIU1f3
	+zuEXaYfIEEOQ99AIW1JfDFaTle7Qm8UBL6466BLCaTWn2jAOS4NBxsWZ21oVCzASyLxqhzAGKZ
	oazhrSRJ/yRyrBDXC+nAMkiZQkQ3j99Q/N5xu1zf3EcFbfdUkHr6D4QqZ7G+Y+g==
X-Gm-Gg: ASbGnctrTpMNojqZcGwk9JknffL1oFjgs25r7AAyuPUKgVRMFNM+eu8TFdxQX+qHgmZ
	QA2h6Aph4URdHcP6tP+AKUCgwwAiZlXJDd9QxyfxkArdE3OWBoTTKTnb1L15jWkzA/ObyzNrHED
	EC8q9Uic8FNEg9cj3Qp6UNcB9QUL1UgHBbmlES/o9vXPHA8Clg5AJ6rg0SN31TcOJcOoy0zwdQ4
	RPjU63ndYyBrkIcmOhyqprXiSdNWBI7/LMmczFMLPjyBgkl81r6gXHUq5IqFozE1ZmEkQR8XxZM
	ssDVhMK7CoarIEa3smCZuOHaTEFBuwjPP6U=
X-Received: by 2002:a5d:6c63:0:b0:38b:ef2b:422 with SMTP id ffacd0b85a97d-38c52096052mr20648856f8f.36.1738672359127;
        Tue, 04 Feb 2025 04:32:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET/fdmBxwT2kEgeJ6xq9QXxCTtWqsruKoqpBh7wylvEdA7HYKJAa2oNIfrVb0R3o0Sw7rwuw==
X-Received: by 2002:a5d:6c63:0:b0:38b:ef2b:422 with SMTP id ffacd0b85a97d-38c52096052mr20648813f8f.36.1738672358717;
        Tue, 04 Feb 2025 04:32:38 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm222469255e9.9.2025.02.04.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:32:38 -0800 (PST)
Message-ID: <a97c4278-ea08-4693-a394-8654f1168fea@redhat.com>
Date: Tue, 4 Feb 2025 13:32:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/6] Device memory TCP TX
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 linux-kselftest@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
 sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk,
 Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>,
 Pedro Tammela <pctammela@mojatatu.com>,
 Samiullah Khawaja <skhawaja@google.com>
References: <20250203223916.1064540-1-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250203223916.1064540-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 11:39 PM, Mina Almasry wrote:
> The TX path had been dropped from the Device Memory TCP patch series
> post RFCv1 [1], to make that series slightly easier to review. This
> series rebases the implementation of the TX path on top of the
> net_iov/netmem framework agreed upon and merged. The motivation for
> the feature is thoroughly described in the docs & cover letter of the
> original proposal, so I don't repeat the lengthy descriptions here, but
> they are available in [1].
> 
> Sending this series as RFC as the winder closure is immenient. I plan on
> reposting as non-RFC once the tree re-opens, addressing any feedback
> I receive in the meantime.

I guess you should drop this paragraph.

> Full outline on usage of the TX path is detailed in the documentation
> added in the first patch.
> 
> Test example is available via the kselftest included in the series as well.
> 
> The series is relatively small, as the TX path for this feature largely
> piggybacks on the existing MSG_ZEROCOPY implementation.

It looks like no additional device level support is required. That is
IMHO so good up to suspicious level :)

> Patch Overview:
> ---------------
> 
> 1. Documentation & tests to give high level overview of the feature
>    being added.
> 
> 2. Add netmem refcounting needed for the TX path.
> 
> 3. Devmem TX netlink API.
> 
> 4. Devmem TX net stack implementation.

It looks like even the above section needs some update.

/P

