Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7B20DD5B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672166; cv=none; b=eZLK0OzS+Qf/AqChqWWWPfJNbZvEr/mXFotoXH5jYIdFpNkz6wxcSoerQ9L9qZs4dut0OaQSSVJ2+AfxTPjS8ppvMD4GEblHCCk1JfW9BPrwvi01l8hcFR2z4leEa8orH+IC+b7EtJevpasVxGcnUKSKfEive19FtbSUll4YEgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672166; c=relaxed/simple;
	bh=u6K1gc6fqbQ9CyQmR1XZtEDc+/599QHfU81+5JM+XJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhunIFrmbg62xND0vptJW89LqvKvTJF8ZVL+yuxKFGPYNSnot9Q0X0/UbUNjLVjVvbj2KtTkepMWkvrDximyKPb21L941ZjWNaFwjTwlfb3tlg1HyyNb+x392F3eeIZYUn0SotYr0nWbWjQ1L0Gw0ruxq7Lh+KldgzrWfHF92Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gpf4dkAg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gpf4dkAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738672164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVt11t4VdzXmaGrVYonLKU4tNbyq45g4LumiKNuZLV8=;
	b=gpf4dkAgfZJjGroqrLhLo3yFumiFQAk31z5ESXLMhDdRsT+lQuGavqltxlpN/7zOUmC8nh
	aTwS84LAU+1deAaNSOI9AuQ2yVC1ACrk8zt+e2NXiwMKgha1x6qno/cGPZp+dWxl/+QdRm
	nlNcTk6Bf1bHEzcw+QtC4YaaxFYDY2o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-NNfTHQRLPjmFl9L5_DM6Cw-1; Tue, 04 Feb 2025 07:29:22 -0500
X-MC-Unique: NNfTHQRLPjmFl9L5_DM6Cw-1
X-Mimecast-MFC-AGG-ID: NNfTHQRLPjmFl9L5_DM6Cw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43673af80a6so39026025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738672161; x=1739276961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVt11t4VdzXmaGrVYonLKU4tNbyq45g4LumiKNuZLV8=;
        b=fRzU1n+R0RlQDPRrDnlw661VxCsDWuLY1X/yPx92I5LS3HCkcMNZgfcFD+GhVRgINa
         flIAw3hFB4c14CCMogTDX3AZAL2zX0VoYX1VOmOVEVp+M3CNjHe2A4WscxtYEZlH8jMP
         aRVR1v3yVr6z7GI/Anqlywgue3CIU7cVHpDlivmOetejVp0kwXOcZGE56641vAQsHhGp
         Qzt2lYTA/+N2rAxrAVMF3HdeiLj+M0yOK0f3IGJzmhMEQ94LhxbjIS+SrNRMK7PO5+Wu
         LYjHeJSIyGb1MBS58NDnMlJ+q3MnstZ9VkHoqR4D+a/OkLizpOj38mJ8D/ZiGVGylr07
         yi6w==
X-Forwarded-Encrypted: i=1; AJvYcCWxOiQ3/m8a3MeN109z1ybkr3xj0d+jxW8BfyRtFgWhRK9N/7bO2J7rRnSOvvirJJ1Id9nroB0h6rnHhLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZC+2wlr/SRLAcud+HsBlU0bfWMts+mpWB1UTZWKeT7/XUeaE
	7JgfUwYJHrmaxOzeV3M1ze0U7sEo9II7U9HA75XCjwoKqj3HJdyUH2kD7oArxBZMqmPD8UyJo/z
	sirLCvH6bb5vJFfS4RuEQkVhCvvZ1F+Hx8U09AHnbRlRy1vf3wLHiClp1fzWR6A==
X-Gm-Gg: ASbGnctS7ySEXgavw2P1MnBYEw2iZkesaRGF9Hl25EpBbYkm0yyKf/qctS/haKX8c16
	u+Qb0b5/ZetkGpJe7fnh+jOM10Tg6YHWW+lKoOHbBSM1SJ2g/3bIbAAKuz1ENQA0bp5biYen6H1
	UeNa+3O4cmSwdS46LymW0wXzAyJmlOWPC1kxJZh2SoaBTVPjZapmRGcmB3Bt3albXlrU0hTa2Vz
	kmSWQq3pBPSX1Q3qiteNX6VxHsrDFlFrG193/zWIGof4+vuyQaXru1GWUdCniuOmYBSCyn2hk3k
	Q0pOXFufsj3EX1Fl7IBrH/6eDEzE++I7Y00=
X-Received: by 2002:a05:600c:5248:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-438dc3cac3cmr242156205e9.14.1738672161571;
        Tue, 04 Feb 2025 04:29:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6sf3mUWx9f6oCktAawZ1NkGZse1Cb+QiEWr0dnqS8PjvhkiCOef50Jj0CTOWCanLTCjNSYQ==
X-Received: by 2002:a05:600c:5248:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-438dc3cac3cmr242156005e9.14.1738672161191;
        Tue, 04 Feb 2025 04:29:21 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc8a59dsm228847985e9.40.2025.02.04.04.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:29:20 -0800 (PST)
Message-ID: <c8dd0458-b0a9-4342-a022-487e73542381@redhat.com>
Date: Tue, 4 Feb 2025 13:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/6] selftests: ncdevmem: Implement devmem TCP
 TX
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
 <20250203223916.1064540-3-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250203223916.1064540-3-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 11:39 PM, Mina Almasry wrote:
> Add support for devmem TX in ncdevmem.
> 
> This is a combination of the ncdevmem from the devmem TCP series RFCv1
> which included the TX path, and work by Stan to include the netlink API
> and refactored on top of his generic memory_provider support.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Usually the self-tests are included towards the end of the series, to
help reviewers building-up on previous patches knowledge.

>  .../selftests/drivers/net/hw/ncdevmem.c       | 300 +++++++++++++++++-
>  1 file changed, 289 insertions(+), 11 deletions(-)

Why devmem.py is not touched? AFAICS the test currently run ncdevmem
only in server (rx) mode, so the tx path is not actually exercised ?!?

/P

