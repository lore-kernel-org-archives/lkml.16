Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14383202C49
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501296; cv=none; b=aqNDmGQnOS9ibY/paM5FSw+tzma2NHMQSG+yjFBEOKY0MY6eVfsq6nOOSOoDs78mLxbwtCl6s/cOrwuCSKjykeUlZxG4Ed8PThXcjsioPrV2MgQ0c4aq00SCbYEAbapf8pmZxW1UUQLt3lMPnDSBe+aoYVHe7YEKU+whhjzHN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501296; c=relaxed/simple;
	bh=1fbS/Ev5Sd8gaucxtNZN2NqHT7aWtDJ79rRoNoySgk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJ0voUOuI15H52tO2aIqZ61AWZS8bAJe7WhgGv0+An+OFI2RX+riG/C+ZvMbp0hMIUa/ZiFm/Mu3hoV0UTHMfE8USwxZ1ObfdaEYIKEDlYmIYdmTPeLlQm/JuO/qmGr2L9DCviLiRABaz1vfYfsfkmCJbCATYsPAj53RZJcRrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eArGwLzN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eArGwLzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748501286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMuc9cgQoEf8UuMw4POuc5bnLyfr5YSzP4kZ94xMcgg=;
	b=eArGwLzN/YcbY+HT0BB1KheLrbH1IeKPUH3tXBzDAT/FDqPG86U/UcNr5ZV3mAFJctIKnZ
	16ffAhrF0ZqfcuVgLnExqpkvc+K7V57VDSWSsKRixD7rPh/0j5tte1g6XnfhBhtWa2H+FU
	NMZ+Xf4wAVlEGuojhuO+ngkOjo21C6g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-p0h7t75vPqWNbj7KCJkR_A-1; Thu, 29 May 2025 02:48:02 -0400
X-MC-Unique: p0h7t75vPqWNbj7KCJkR_A-1
X-Mimecast-MFC-AGG-ID: p0h7t75vPqWNbj7KCJkR_A_1748501277
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so245453f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748501277; x=1749106077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMuc9cgQoEf8UuMw4POuc5bnLyfr5YSzP4kZ94xMcgg=;
        b=rb+hsb8HhfLe8f4qMthX0LW3KZLJU17noigbucZRRSlZb9eh2xlOiOoyclqpi4uQse
         nyhKWRcTkCzSTAPmNAAL6uVAKerlxSXzytRavtGcaK6KuojZ6TVUDi+wjxn+8YkUulzG
         XvfKK23reT8bKqiJl4DwswnzWJtzA5EREs7JUzZSNEShDAOTz6SMZ9iwj0PAG2LiEQCC
         l79Abi11W33BwY2iFtj8mhc6fqVN4wvRnIKT4Kxjsz65mGYVype+hAYWANErSQHYkjL4
         2XFEh4uu2me0Exz20ge/aKjyZDWvpCc7/CY9J8+Xtm0hrmknRfwGAuXz9LeLfjWdxIml
         setA==
X-Forwarded-Encrypted: i=1; AJvYcCX/PWK0qFHu/StwHWIJdoRMG/naialJDmiwDheGfDxjngLw2g5ORLCs/UP8R05qupDjpVBk7iioZN64V/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD28xF3freerO3aT5XW8hDVMyoKgQpX7RQOvS1rUktqrM6IiZq
	opJrCPEHC84ZEMDO3GJ0u+2iNSl54JWUOb1Jar0pcDBXV3+Shs0hAyQrdBMPFDT2OoLMv2wLHFY
	bTSjab09yzOx/d75C1uYUmdWJs/5bxvJxXQAYt67vmO8BS3yh5965i4Od8STGV79OFQ==
X-Gm-Gg: ASbGnculN6kEGjBMpAzg0LoMm6E1/ppT4biuIP5RGiyaAmZXZsvR7+d8lpav1tLPPFJ
	OuaNqpwL02F6fqZlcQCmz/6VomVKaVb9UIUbuT+nyWxuOzDMN1kYZYBclhO+hq7PXwUDUiiNeJ2
	5d2aj7xLF+xBYYbj4TFvQtuuVIS596CAU4it4aBaNCjqB2jyKr8oIE98Wz2kTTaFy78/uMDU3aM
	CCiZH/VHTh0cAo8/yRU6sTJvVXS9Z7TkxgyJe9Y8jXhAQBySvorJSbEsXBJIXCddqzdVufawrXr
	Litlh2syEEvX01U5qn1SzZXPxoF+MTG0xlUNv+iuKiyw9ud2DyOcUtR7t/w=
X-Received: by 2002:a05:6000:188d:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3a4f35b69e4mr707991f8f.20.1748501277266;
        Wed, 28 May 2025 23:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmaFT8LYjFaC+myZjagymMCOO8GMv8kvRVpJoRgXhOkI01smhZMOpldi/g+qfIFn7s2uYMjw==
X-Received: by 2002:a05:6000:188d:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3a4f35b69e4mr707965f8f.20.1748501276819;
        Wed, 28 May 2025 23:47:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8b3sm1014514f8f.20.2025.05.28.23.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:47:56 -0700 (PDT)
Message-ID: <58dd23de-ffba-4bdc-8126-010819c6d0ac@redhat.com>
Date: Thu, 29 May 2025 08:47:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] rxrpc: Fix return from none_validate_challenge()
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <10720.1748358103@warthog.procyon.org.uk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <10720.1748358103@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/25 5:01 PM, David Howells wrote:
> Fix the return value of none_validate_challenge() to be explicitly true
> (which indicates the source packet should simply be discarded) rather than
> implicitly true (because rxrpc_abort_conn() always returns -EPROTO which
> gets converted to true).
> 
> Note that this change doesn't change the behaviour of the code (which is
> correct by accident) and, in any case, we *shouldn't* get a CHALLENGE
> packet to an rxnull connection (ie. no security).
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lists.infradead.org/pipermail/linux-afs/2025-April/009738.html
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Marc Dionne <marc.dionne@auristor.com>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Eric Dumazet <edumazet@google.com>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: Simon Horman <horms@kernel.org>
> cc: linux-afs@lists.infradead.org
> cc: netdev@vger.kernel.org

net-next is closed for the merge window, but this is actually a fix for
code that is already in net (since Linus pulled and the trees are
forwarded).

We can apply it to net, no need to repost, but could you please provided
a suitable Fixes tag?

Thanks!

Paolo

