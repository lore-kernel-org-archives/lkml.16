Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC820969D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667563; cv=none; b=HSZurPz5kgU1kyTK6bWNkUAlOkcnEEpnP2DfeYfAL/m1CRnvS53LKlN+xKLPwsq+NL57yETT9ZrXuxSk9KAvOsKjr6AQoC3Vi0AaE4p9sXXN2l90yXp6AGj0DOBMEP+/3ITHbuvGQHB+mbeeEXo83oKLs6OgW87j80fK0IW6zGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667563; c=relaxed/simple;
	bh=1/713bN1D8cUTwz4gjzXDUB0uMBKEzC0B4M22LuuSzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rv0m6XG/sBICmtckZVrE01g10RYXtGtPJJj0L3bLLe5sWDbVOIXCHXO6e9fig6zwOb+HmTPastkWUArf3NG8CBoyYOyL+XUeokwhpsWF+LukhH5+Sq12wZbtKT4l0vu3XTkK8piBx/nDnkkPkAd3OhBk+Im8tV+iXuEUBed/7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkz8gvMY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkz8gvMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738667558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQ3PkXkywNKtr2C3RWWqSpKemWRzvU4xaOraOKwYJnE=;
	b=dkz8gvMYXb5y4ZKwUFKi8AxaMqFM6U3AVtHm2Rwt2HNZ4LNVRUQGkAIKfpA3ac8e49vqiX
	Zc9zAa+LcuT2KmgG6V/m5qVVl9NHiKtMw4JCdtF99FHr9uE77/75++FCGgZWrb0bi3i3B5
	fA3bn+VP5ZndMRQsrDYqHaEOnI+k35g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-SkoELSlePrGy1Xw8KXiyxw-1; Tue, 04 Feb 2025 06:12:35 -0500
X-MC-Unique: SkoELSlePrGy1Xw8KXiyxw-1
X-Mimecast-MFC-AGG-ID: SkoELSlePrGy1Xw8KXiyxw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3862b364578so3027076f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667554; x=1739272354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ3PkXkywNKtr2C3RWWqSpKemWRzvU4xaOraOKwYJnE=;
        b=sdwbWxsRow/umeInpMPqlzWVF3hg8Lxa6Ig/K/8SOAnuzFqGIYqyiUMWegE7RcQUP4
         /zkuqbUNHOgr3EGqt1Be7f5ltABEUwpId6+8MvXZolCxySCIJXtiEn5dKYtJIRqKO6+2
         s9mSTMvNjkxBjVTaO9M5ClMXjdW3lWxFBiOMrXbzUNrKKIe+TQew690Kf+Y/wr7yhEn2
         aPzG25jWf4WJI4NA419yVo8hsw2ICXO2eUsucr4GYWqY2PBVjPAqpiJIRz3Ih6XRoVAj
         sZuInuCDLuK8G14oRJ8gTyVdXrK5cn40H2JYNIYVo2zFMdfopukIyksqWFebGO3AWIlJ
         cleQ==
X-Forwarded-Encrypted: i=1; AJvYcCXycMEKvginYzV29MDBArFNS7HYIfZ1WnSsjF85WM/+ZjYbCqXe6vYIHse6nHrwVhvUIKgEN22iRR89/wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhRERR/wI1te326hYsumNo4xCegwKDPJtFde09bGIk+89Q1Og4
	DzBra6OQTx5Razy8LD3mTf01Utfj0r1WS6EuQUpP9NQjYIG3DUvIgGGHQ5sGWwTVJ0/+OKtiu/4
	Y4bDXmqFjVIyjN7EhBrKzfG17pWuFGg2kf0e7L4xTMEvCsceVAV3egbS3l6haQg==
X-Gm-Gg: ASbGncuWq/bl5CpF9kVXILzs/ztv84zf2Wl04mSKYAZYPK8B32hS9JTZJb8oX+klWAj
	wCeQL/rwK51p0/hpxv+J55aK7HzFA9I6PusrfywAk2NlMtqoGhLCwzj/+GENXKKPO/79U0/wjWc
	GcsRcC91opc/fvK4XoxT8ioTxwxB7estQxY9CoGJXZ6OFO+2Lv2DOKDdoD+q3KbdQaFqYVYCfm/
	PZjDglrcIOAVpCH5PjULtW3dgkIostH6VEr3CtWc0W0aPT4PMCepP/0rvH1OPe1eIw20bjKyNrN
	AnyJ0sEjlonG4f6OTCiyN9VwcXEC+tEXmXU=
X-Received: by 2002:a05:6000:1a86:b0:386:4244:15c7 with SMTP id ffacd0b85a97d-38da540575dmr1951801f8f.25.1738667554422;
        Tue, 04 Feb 2025 03:12:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrrGo+monwgvf+7AuszM0f9IWAHfFpNFGC8MBZ2jHxt8uvQhWqSNJyq2P9OQGfeWLNK/iSZg==
X-Received: by 2002:a05:6000:1a86:b0:386:4244:15c7 with SMTP id ffacd0b85a97d-38da540575dmr1951780f8f.25.1738667554036;
        Tue, 04 Feb 2025 03:12:34 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db085ab80sm411156f8f.26.2025.02.04.03.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 03:12:33 -0800 (PST)
Message-ID: <716751b5-6907-4fbb-bb07-0223f5761299@redhat.com>
Date: Tue, 4 Feb 2025 12:12:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] rxrpc: Fix the rxrpc_connection attend queue
 handling
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Cc: Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>
References: <20250203110307.7265-1-dhowells@redhat.com>
 <20250203110307.7265-3-dhowells@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250203110307.7265-3-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 12:03 PM, David Howells wrote:
> The rxrpc_connection attend queue is never used because conn::attend_link
> is never initialised and so is always NULL'd out and thus always appears to
> be busy.  This requires the following fix:
> 
>  (1) Fix this the attend queue problem by initialising conn::attend_link.
> 
> And, consequently, two further fixes for things masked by the above bug:
> 
>  (2) Fix rxrpc_input_conn_event() to handle being invoked with a NULL
>      sk_buff pointer - something that can now happen with the above change.
> 
>  (3) Fix the RXRPC_SKB_MARK_SERVICE_CONN_SECURED message to carry a pointer
>      to the connection and a ref on it.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Marc Dionne <marc.dionne@auristor.com>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Eric Dumazet <edumazet@google.com>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: Simon Horman <horms@kernel.org>
> cc: linux-afs@lists.infradead.org
> cc: netdev@vger.kernel.org

A couple of minor nits: I think this deserves a 'Fixes' tag, and
possibly split into separate patches to address the reported problems
individually.

Thanks,

Paolo

