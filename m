Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B02D372A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532528; cv=none; b=Fd9m2pfybO0pA93Tn84gBkPjo0yW3fn7FhuhEEUjHCJLSpsHonfuqTkAhXBIINexugr1QwPP6y0ji1XBPB+JJepAnpHUxvAW/dUHfad3U1eJUYsE67hySgi6oiAQ7uk5lhG1XNSwgO0A7g/KRN/QRzsIlFttMz6wSVV3fsho320=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532528; c=relaxed/simple;
	bh=/RTepCs0dztAoAhV3cYzw3AFqbONWKbO7CPOvH6DzM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCQKsfnFJj9YdUGDs1C5nFfkPs1n9QALD3Ar+jen3eyslX5Ddk4eMPH5WCH1WJtET2vOlJM8yeLsWFwl5sacfUupl2kepfsrOO0DpXHmVuwdXyyFafJcgTu4ZIOdZC8I6h5TjXMVVL/yH/mvkQ+mxOMrhgMWSOJdkAmpP+HP5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YInoDZzd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YInoDZzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751532526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5A+/MxsYcbYH1goxrESZ9WwNmbDxLlkxrFPCFIvbec=;
	b=YInoDZzdfLJQ8eeFdicZDIWq5fcrqElfyghwPW230FEhwLJQj/pXBu3lAir6RSzv2dwyBY
	uC53DXbk8VU50vfx1eCnDy7X+gE4Kmd0J5GaFIQP4D8yOme9FLD5bfWSJdZX49Mdo21Qef
	O8c0+tKBHcL1dDBlHZiY+y2bGyoMB4c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-tN31sjvfM4Wj77aCduWmAg-1; Thu, 03 Jul 2025 04:48:45 -0400
X-MC-Unique: tN31sjvfM4Wj77aCduWmAg-1
X-Mimecast-MFC-AGG-ID: tN31sjvfM4Wj77aCduWmAg_1751532524
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3835101f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532523; x=1752137323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5A+/MxsYcbYH1goxrESZ9WwNmbDxLlkxrFPCFIvbec=;
        b=hxtlvfOITI2PMSbcTj/zswBt61tD3c4ITBzkaEzh+Nk/NMKzHbDctETRtfec8z1dxx
         SVtmayi0F/UGcq1HTvOUEcbDZosymFwj+ItqY8ZC2yvULxs8FzLpz0XubqAAg+ze2YEX
         PGkWBPQW39IUyY291GsMgWpIEGB4j9J1+eDrOP046ouOGOhhQRc7NBjBsOwAE9OE+EyO
         2vyFLOmP/9M/w1JzmxLdaz70ZlV67SM/7ew7CxgzTyOEMXMA2Auj9QJSZ2nTsMRb0mAx
         XZFYO1rVn0Xt1Qw8oSRU0u1ArTzvoYjmGa4U3VIjzClihE2rlQ1/Hg+ugz3Md7FY/r0v
         80MA==
X-Forwarded-Encrypted: i=1; AJvYcCXyRJJbtKoEwTDjlyMnDAkfrwhHnGoXeLL5JXLkUFEN7uPObbs4J3/WgEt0+7J4h0FBffu1kUpBzcxdbqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKn8RoLmySvW8smA9QYzGqdkozMkGdNdmaNj/s0Vsb8qgrCx5j
	IXE8JCXzUT8DSh+1N3Nq9Snf1lr3gRXchdL8JKzxrtNTaQ5NNuB7H0K0NGE1vdmpE9E7lx2enhC
	PG35qr+zm95BTFweoHegIytJGZQy99Wm/9IqzrrZaIzN5KiZ/KwZyF0V98eCRyyvOLaAPPx2VqM
	ct
X-Gm-Gg: ASbGncvJReJ20uOgZ/EDm7TBPFb63Qk937Z0TssT0u5SB+LRcIrIp2fYjiug7N3eDOi
	9M6Z6N8fTjjCS4FyBntH3jP4A4r9CbjZpAybH31BQjuZgHfcNV3Wrey51+tE4QgafGuB39NW2Tx
	sqlJtT3RYm0WZd3p2pdkVpnVzgLB81b2L1+FeMOZfjz6DYxDn2nFkjYqeRvTZG9B+FqbPXnUDvh
	60yjx0zkQTbHAnrSU7QqEew4hr1YTAdkDbQlbTG+H2kBTsd9vLW1UZZoGM62BOkeKkWGXERnxyl
	J1dZZMNCsKAWTc2tbzYStUCmkG3eeDiXUTDcKntdakktx2ALdNjLm3H9382DEpQ3NzY=
X-Received: by 2002:a05:6000:1ac9:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3b1fe1e69b5mr5343056f8f.23.1751532523279;
        Thu, 03 Jul 2025 01:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwJWsJ9Bcq221tnNZUrZgPxYaGKS2ioIMyKtLjbCKUp7n/zy8XxkU4Y6rahZ2XUyogggC6pg==
X-Received: by 2002:a05:6000:1ac9:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3b1fe1e69b5mr5343032f8f.23.1751532522882;
        Thu, 03 Jul 2025 01:48:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a999c632sm20422205e9.23.2025.07.03.01.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:48:42 -0700 (PDT)
Message-ID: <e7275f92-5107-48d2-9a47-435b73c62ef4@redhat.com>
Date: Thu, 3 Jul 2025 10:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] skbuff: Add MSG_MORE flag to optimize large packet
 transmission
To: Feng Yang <yangfeng59949@163.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org, willemb@google.com,
 almasrymina@google.com, kerneljasonxing@gmail.com, ebiggers@google.com,
 asml.silence@gmail.com, aleksander.lobakin@intel.com, stfomichev@gmail.com,
 david.laight.linux@gmail.com
Cc: yangfeng@kylinos.cn, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630071029.76482-1-yangfeng59949@163.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250630071029.76482-1-yangfeng59949@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 9:10 AM, Feng Yang wrote:
> From: Feng Yang <yangfeng@kylinos.cn>
> 
> The "MSG_MORE" flag is added to improve the transmission performance of large packets.
> The improvement is more significant for TCP, while there is a slight enhancement for UDP.

I'm sorry for the conflicting input, but i fear we can't do this for
UDP: unconditionally changing the wire packet layout may break the
application, and or at very least incur in unexpected fragmentation issues.

/P

