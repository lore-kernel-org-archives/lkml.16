Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5B1D554
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178776; cv=none; b=f6rm7fSjV/FoVU0PHJN2o6j1aa7gZHQ9LtJy45O6h9VZw62NegakzeZxr7NOh65uxwzmS9nQ6WDI14q9NVsrX0meCJVl2KQUrwoGmBE+qjmBXUmyUqS9jepJM1fBaDmCcHs5eqs7g2JZcURDuS0FxD9FHpiaiYVezwlqxqqIoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178776; c=relaxed/simple;
	bh=bUC2ovIqDRYMP1p5Wi5+V8mwpGNo86wFcWNQiaEONJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZYpilQeM4BT2ilTk2RCp4Va4CYAxdk3ZZ/TEt4Cxa85Kr9CIdEyfVzw2+fMQLRvn5zO91E/lvWJ/qBSK0ME4Ee0xwhJCAkWCCeQYyRWMA109vbv6B2NGTWCrGmAZ4Q4CPel24lAZO1NsYWiYhC/7Q3ZVfELoDHsoduVEKTacq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bTylJekk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bTylJekk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746178773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvMTjXIr23L5UkFhokRaZjcjsplgryREMKqsg59/0zg=;
	b=bTylJekkEcmxmyDaOoXwXtc/31l1fHOC+1yJPtNRVHiGnvUtUz7hTxzCxv8zZJwvtaxVR+
	7URAUv2Lkpa26mk2mpyDaLGcTuUIl/No6SBZMWiDYz+vsm6+7+faB5dtqe9wrJFmyIyLk3
	K0DaO7GuJXbgcW9tSkJrBPQkT7NILZk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-vhsESbuVNUe4UYbRfqVAAQ-1; Fri, 02 May 2025 05:39:32 -0400
X-MC-Unique: vhsESbuVNUe4UYbRfqVAAQ-1
X-Mimecast-MFC-AGG-ID: vhsESbuVNUe4UYbRfqVAAQ_1746178771
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d917b1455so601136f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746178771; x=1746783571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvMTjXIr23L5UkFhokRaZjcjsplgryREMKqsg59/0zg=;
        b=lnRJ9aJLRVvLy+kAQnFXMxnZt17e2K+6gi4AOOGNrnLIvswgF8cLypNYixPWzuzalj
         9gDziQ1c1l+kSbB/oFYz6Z5rMCtZl5FwaHE1POaauU/4DRh4mQXXoz2MY0+GWrIxqqyi
         V0s/7lDnEVGm+OurZRLLolnhaetsFsQaXzpTRdk+koz5utAwP+Tj0qoNexNLI6NqbJq1
         qhxJ5x3EpOx+WajPHILSdFWmbvbuFXPell2CEK1UvIsjarCcNe3oFAB1KAiXLpaaorSo
         J7IgQl9xGQ6N02BL95kmcbYVRPZQttoJWQyn79KC5NDtiRbb2NqtiyeFK0dGwjuP6cM0
         jZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUxF5gt2UZjgO59W7s3kstbGbGQpzb15/7hGQAkNuB+CREl36NIXiTWJYYcQLw/EXJ9xWA7Sb+N9eXbHwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hc0RC5q7IjqyEshQ2ttrvROJnvmF3SxllOd9GPppZbqAmcA5
	xlPrTuiWmjNagapfg9fZcEKa4+juskKU1PXxTIFZGE0B+w6QF76AgqgiletcvZ0eUPJMv6tVTKm
	fHC1d3SX/jFCZOkYLkb50dJTC2uWBnpxgBdR4+8Ql5DFHMrQ3gC+qxgKYemmNvg==
X-Gm-Gg: ASbGncs/OqrRTBYMmwOVMuc2acfnkO/OqDdUSu1BDKmgxkqQZUAxTqIzmgUfn51fL53
	nq1cavaUIKkVRhfdrxQ77VjjC02MzW2nri/75ytbF60UWm5+sj3g6JvBQlNM/PYSt3P5q1YR0FB
	yqF+h2ozRN9t+Rfm7bE+4PMr5VHcBxtvAbm3aUk/mhYbIbfw/IzCY2RmaFxzahg6MKM0FGHgThj
	EuMsEWG6g7El/VON63wKUCmI+LmTU7CUdM64rq9NPp8E6GMhZNGIOHawyF9sTJ5x+DSpfqnZ/Tl
	GkLf8mOt7Q1HsR4bUoU=
X-Received: by 2002:a05:6000:1786:b0:39c:1efc:b02 with SMTP id ffacd0b85a97d-3a099adcf74mr1557128f8f.28.1746178770910;
        Fri, 02 May 2025 02:39:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5qRtj7uOx+MrGjrQ0dlSuVyHoANGSwgxM48EP/hxqRnPg/Z9eT562Fod9WT5DTPyqxAshJw==
X-Received: by 2002:a05:6000:1786:b0:39c:1efc:b02 with SMTP id ffacd0b85a97d-3a099adcf74mr1557108f8f.28.1746178770589;
        Fri, 02 May 2025 02:39:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:246d:aa10::f39? ([2a0d:3344:246d:aa10::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bf6sm1660706f8f.18.2025.05.02.02.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 02:39:30 -0700 (PDT)
Message-ID: <cb94f33f-2e74-4e5d-8f68-58322a290ffb@redhat.com>
Date: Fri, 2 May 2025 11:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 08/12] net: usb: lan78xx: Convert to PHYLINK
 for improved PHY and MAC management
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Phil Elwell <phil@raspberrypi.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Simon Horman <horms@kernel.org>
References: <20250428130542.3879769-1-o.rempel@pengutronix.de>
 <20250428130542.3879769-9-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250428130542.3879769-9-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 3:05 PM, Oleksij Rempel wrote:
> @@ -384,7 +385,7 @@ struct skb_data {		/* skb->cb is one of these */
>  #define EVENT_RX_HALT			1
>  #define EVENT_RX_MEMORY			2
>  #define EVENT_STS_SPLIT			3
> -#define EVENT_LINK_RESET		4
> +#define EVENT_PHY_INT_ACK		4

The patch is quite large as-is. The bit rename should possibly go in a
separate patch.

/P

