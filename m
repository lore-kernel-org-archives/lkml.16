Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246A202C5D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310086; cv=none; b=XU1nkzkc2njkk9HqLbN2S5IvGYwtYxpw2aK1ZmSiBivdhEciM1K1nADaJmSrGyk+tOhej1MGxtUCc2P1+AJVfrvSosP1BOiYxPp6unbzpczH7jCBqOvvsr8tt/gEYQQ3jZvzWi9XFHI49ZmBa3VZAdVkyRZ7tSgwVNXSKxZlp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310086; c=relaxed/simple;
	bh=epsWvjWHu9kmVNTaRRd+qtpyAjbj5OYYAn55OL3IWmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn9w/9cEIXUsraZ13NDTLuwJf5tphU4YFgcVJBEmRmhQC/qqHLx25Staj2w8bFbZ5rsYPFxfPomkIGq26d3h3Smq3FlLD6fYFoBYyVHD1AQ1k+/kxj9QOTEFs3I6hd2ZP+EM8Mwl3tVzFHVY1C0inVjKTzq9+WleUIh4C3W8m7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/TOaeMC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/TOaeMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747310083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epsWvjWHu9kmVNTaRRd+qtpyAjbj5OYYAn55OL3IWmE=;
	b=T/TOaeMCrvwW1KNA9hYC0Upw+XBlGV4amypHiHgzBRyKmnNiFIMy8kDxpkG3e9qDvihWx8
	jNtJJljcY8uYNd6oFxvhzID8EFBQsk+Wp85TYpVygcYgYgeIUIudD3m98vVnMJHJ8+yoY4
	cdtNZ3oBQFP0DGHstGm8x1zOHo9/fAU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-9z3m76s7Op2uHj9zljrFzg-1; Thu, 15 May 2025 07:54:42 -0400
X-MC-Unique: 9z3m76s7Op2uHj9zljrFzg-1
X-Mimecast-MFC-AGG-ID: 9z3m76s7Op2uHj9zljrFzg_1747310081
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ea256f039so6929145e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310081; x=1747914881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epsWvjWHu9kmVNTaRRd+qtpyAjbj5OYYAn55OL3IWmE=;
        b=E6oK07EANENTPKlpjd7pYer5aj0ZM3g01XC8tWpYyp9JPkrettgosjFgUk18ohZfry
         0t4VMU6veoM/4w6UH3l0/d9Y1FlkZYc2sxnSKC8H+gw0lRHk3IghFKzGUvjMqT4X5VHm
         xxaXk09WcgkuzDZ87EjkhSonSqsmlrw1Cofqs3AM5Zxb91MDUZFNrsanH06q2Ub08fnX
         b2gsnN1wBsTR0jL0HagcmxY4R0eHXqHDxxRb9O4XOBRwep4XXW3f98DD7HS6ddLlE4OX
         6e0T6To00jjHC1RYsqWz3H0xpCGR9PwMH+D5S9Al3oaQUUX7C4jGrk6m7EmflWkifUBR
         Rnlw==
X-Forwarded-Encrypted: i=1; AJvYcCVEWvp1019mGsrmUWqwFeMeV6D4QYd+OzSwOL0qmfciaEQHc1Q+Un/wxOX0y+B7IWgiKd9fpxt05Alwd8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwkL+6y4wcSsyGIXvmnA9IrBDnSJDt86QIxvTThZ6sY2kExyf
	Rusnoiy1k3pA/SIJdfzASbxTqLtKyLO047vaIR2c/AzoXx3pPiI3GHsRojUfq21as0bgtSOMhYl
	yIUP6Stl9YZbveoFxfdUz4zgQbmGfzxH9PY1XePR7ENSnj4eKMDB0tgW+6Xhk2Q==
X-Gm-Gg: ASbGncvDrKxg9dZoGJokMHcgfw9mCECeSPxujPm26r2mKex2kI3k47n6FxKPEYWgpyy
	R/DxoC4wEaUAA16wb8/dHE3zWLMfnkb9W2g1BQX4gN8zs8zjLaxxZcYNvjeeGsyOqPa3o+n1Pmq
	0WZDe0Fi1gKfW43r3rKbsFArPqvJbgEipS8gmLH/8yNf9+CY5+rQnpOlr5JcwPGjes7CiLnRLM+
	XtB1xbdxXhUAu6Zvbd2fjfJdTPc89qQKrQM/n0r6NHYS/haJ8Tf4c8AJAg7wIJklL6uo0I5tfW2
	sCOiy2+D4bAM2vIG0XmiuTFFYlu++PiVeI7tsnyUmLeEXgLYA4mViYXZvmE=
X-Received: by 2002:a05:600c:c059:20b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442f285da04mr40196565e9.2.1747310081300;
        Thu, 15 May 2025 04:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF94kl59CRKh8KcTSkw1SAiKI6cImxvIQTZSHoUW1IK/I8r2VxJB89xu8sNKWWPqxAdRF3Xqw==
X-Received: by 2002:a05:600c:c059:20b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442f285da04mr40196275e9.2.1747310080913;
        Thu, 15 May 2025 04:54:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2440:8010:8dec:ae04:7daa:497f? ([2a0d:3344:2440:8010:8dec:ae04:7daa:497f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368e3fsm67978805e9.2.2025.05.15.04.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:54:40 -0700 (PDT)
Message-ID: <1b1f8131-80e6-4671-b4f2-4cadf426d4fd@redhat.com>
Date: Thu, 15 May 2025 13:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/5] eth: fbnic: Add devlink dev flash support
To: Lee Trager <lee@trager.us>, Alexander Duyck <alexanderduyck@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jacob Keller
 <jacob.e.keller@intel.com>, Mohsin Bashir <mohsin.bashr@gmail.com>,
 Sanman Pradhan <sanman.p211993@gmail.com>, Su Hui <suhui@nfschina.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512190109.2475614-1-lee@trager.us>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250512190109.2475614-1-lee@trager.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 8:53 PM, Lee Trager wrote:
> fbnic supports updating firmware using signed PLDM images. PLDM images are
> written into the flash. Flashing does not interrupt the operation of the
> device.

Apparently the bot did not notice, but I applied the series a little
time ago, thanks!

Paolo

