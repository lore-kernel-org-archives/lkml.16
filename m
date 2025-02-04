Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94B213E81
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693957; cv=none; b=DlKmn2qzCsRgKzyzEHvAghUrT+jK4sdixFiOdJ5Xavftrkn7YcKUzBWt/wbZUG2Px28OLNRBiLzfvAomZr5dnxKIMfY06yGg+qjOzusViqDtW2uJA3Ge6a3Jdvmskbcf87ZBE+6HQfWY6zRbWBrb5PhW9PdC1PTBG7oUff5lwrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693957; c=relaxed/simple;
	bh=xODQit6uCyf4BHOUHzlpnmvPH+m6KEWI7kEV2tYKTKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tjj1B7/pHX/vu+h3muHQ8FaUPlDBIeR+8bT7rsSwwyla+bp//IT/k7zxehOV8ssQCZmfKO5vPDXkvmcVo0NxP0h9u+9XsUiIbPQv670MXAjIGADurDJkn1BbWhEfTze19AUfmf0Bjem9YDOoxW8jVABaTT77B63jCJHp5vh4K7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHchEZNn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHchEZNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738693955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wOAl5xAh2GGBxVsErS9v9Tjb+O3mJNAwDX/dH5vXFY=;
	b=MHchEZNnBYihA+g+lKmN13OLuirVHRU3BmNMaCHamZGmVFNZdAWg0ElkFMAJ1xVqQnPQGT
	JDpwFS5IVyW3+6CjjVWYDZiOgh7oIfexZ4M8cG//YMrgsySosl4PlWpBWvR5ITKMgaUcvn
	zlyiOk2oiy7WKuQT1GPbyPk3t0YVna0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-BmvNeY-TO26W3EN6KI3XzQ-1; Tue, 04 Feb 2025 13:32:32 -0500
X-MC-Unique: BmvNeY-TO26W3EN6KI3XzQ-1
X-Mimecast-MFC-AGG-ID: BmvNeY-TO26W3EN6KI3XzQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38c5dcb33a5so3913807f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693951; x=1739298751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wOAl5xAh2GGBxVsErS9v9Tjb+O3mJNAwDX/dH5vXFY=;
        b=XYApb5FESdPZp1LbU5dvIggdk97BMI8HtdviBR/HqQzqIz+EDQfYDAYxMuZ2C0DhF9
         acaeYI/PlRhhZhOd6eZZ0WUByFJ16H/BHTZvPG+la1pVMvpoAWarTYeLrm6W0SGoNmS7
         EbRx3ir4Y1wK5DKFBgIampDIXF0bBxMbl9r3c0u7BjRW+7BVjDh9jzxxxuocT49Rqemd
         q1cnMEzcLtcJmtPR/Xe3ve7MumiQW3oo5HNvnwGNVjZgzI4zftr+jtw4QKsjmQbQen0H
         31tWxnA/sDytACnaKVWzm2irXgp4bFHTyGsh7bPd2Q2zLhC+UYaf/xYjP7CghuGEZxpP
         QyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaJZhvxg/RFRli1vjqhMtObjmHsRavPnmIrA6VwL7UWuwzQv/yeIv+hxZnUdvM83MHkbp4+yNWZmfWDJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6wIQ5HHnczyCwRCg1EHpP+EfwwiHEUBdCQtM3Nmyc9DdhSqg
	RTAcPRJicBL4fbk+npBUT9NSTQ8UME+XhR5PBhNxtDNhYb3RQqf6W0dDNtGx+vx/YqUOXpn1JJc
	np07Zp/tiNvmIjYh732RmWcpwqJHx1xdToeP8rDjt78phE1j4BAqWWSqPb+fnOg==
X-Gm-Gg: ASbGncuASpXoUCRCpI/rclEFfxMUl4X0SFSlH/pT7CZI0kUNrd95NrI5s9aN0etxJL0
	cDhmrO/juHBukuYNvNjh/oP0wJ2g4kkRVqnA/JMvMbud7LH3HUsX16dV/+7nt33IffvDoru6Os9
	eFiy1mbSmwh9/pxZ5boWyY0i/wppFEeDnODwxrcjhfoX/KCC2jltReLlWlemoFjSbD5ey/DuIli
	A1ZV1vqJVk6YJzXm3eVCtFW/zqdcYOxG6lUZk+oWewW4sCIIwTEqCfuabOfU/0leFRrAog3iyJj
	EmzS5fJtOn+oTc8o70TF+jI26MkuRVhPKg4=
X-Received: by 2002:a5d:584e:0:b0:38a:8b00:6908 with SMTP id ffacd0b85a97d-38c520b0b23mr23613470f8f.54.1738693950906;
        Tue, 04 Feb 2025 10:32:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD/Vu5xJexoTki9KN1frdyawMdJlGIYRVOCgdaZ1pwR1o9hVUkrti8bPAifEmhLPHuA8ZQBg==
X-Received: by 2002:a5d:584e:0:b0:38a:8b00:6908 with SMTP id ffacd0b85a97d-38c520b0b23mr23613436f8f.54.1738693950460;
        Tue, 04 Feb 2025 10:32:30 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm17079089f8f.53.2025.02.04.10.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:32:29 -0800 (PST)
Message-ID: <60550f27-ea6a-4165-8eaa-a730d02a5ddc@redhat.com>
Date: Tue, 4 Feb 2025 19:32:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/6] Device memory TCP TX
To: Stanislav Fomichev <stfomichev@gmail.com>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Neal Cardwell <ncardwell@google.com>,
 David Ahern <dsahern@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
 sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk,
 Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>,
 Pedro Tammela <pctammela@mojatatu.com>,
 Samiullah Khawaja <skhawaja@google.com>
References: <20250203223916.1064540-1-almasrymina@google.com>
 <a97c4278-ea08-4693-a394-8654f1168fea@redhat.com>
 <CAHS8izNZrKVXSXxL3JG3BuZdho2OQZp=nhLuVCrLZjJD1R0EPg@mail.gmail.com>
 <Z6JXFRUobi-w73D0@mini-arch>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z6JXFRUobi-w73D0@mini-arch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/4/25 7:06 PM, Stanislav Fomichev wrote:
> On 02/04, Mina Almasry wrote:
>> On Tue, Feb 4, 2025 at 4:32 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>
>>> On 2/3/25 11:39 PM, Mina Almasry wrote:
>>>> The TX path had been dropped from the Device Memory TCP patch series
>>>> post RFCv1 [1], to make that series slightly easier to review. This
>>>> series rebases the implementation of the TX path on top of the
>>>> net_iov/netmem framework agreed upon and merged. The motivation for
>>>> the feature is thoroughly described in the docs & cover letter of the
>>>> original proposal, so I don't repeat the lengthy descriptions here, but
>>>> they are available in [1].
>>>>
>>>> Sending this series as RFC as the winder closure is immenient. I plan on
>>>> reposting as non-RFC once the tree re-opens, addressing any feedback
>>>> I receive in the meantime.
>>>
>>> I guess you should drop this paragraph.
>>>
>>>> Full outline on usage of the TX path is detailed in the documentation
>>>> added in the first patch.
>>>>
>>>> Test example is available via the kselftest included in the series as well.
>>>>
>>>> The series is relatively small, as the TX path for this feature largely
>>>> piggybacks on the existing MSG_ZEROCOPY implementation.
>>>
>>> It looks like no additional device level support is required. That is
>>> IMHO so good up to suspicious level :)
>>>
>>
>> It is correct no additional device level support is required. I don't
>> have any local changes to my driver to make this work. I think Stan
>> on-list was able to run the TX path (he commented on fixes to the test
>> but didn't say it doesn't work :D) and one other person was able to
>> run it offlist.
> 
> For BRCM I had shared this: https://lore.kernel.org/netdev/ZxAfWHk3aRWl-F31@mini-arch/
> I have similar internal patch for mlx5 (will share after RX part gets
> in). I agree that it seems like gve_unmap_packet needs some work to be more
> careful to not unmap NIOVs (if you were testing against gve).

What happen if an user try to use devmem TX on a device not really
supporting it? Silent data corruption?

Don't we need some way for the device to opt-in (or opt-out) and avoid
such issues?

/P

