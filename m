Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58065215762
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873051; cv=none; b=DK6Q+LtreH0lCMj3tSuHrFVnHbpx2E7EDuQ3F7v6Wxn7/FcF2W1PL9Bmf0nZbX6lgodCIELivyRtkn+QQ0ViVHaCNdqX+KnlKdBgY7i0H77lvzHnZ+PjHBxqZbi6KQc4Y05EKxH8ehn9APa2yTZRCZW/RpXJGDLv80swoKQQRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873051; c=relaxed/simple;
	bh=jjODyzoHgOaSkMOizAfMka0/yn10076bTRY95dAS8m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q157LE68VurGF/9eBoxgwPr/2Z/vDo+OlgjJEfn03ks5Zb3zYEkouxBnXo4ieQVLeip8yYteIBdBLw9rBpFmR5iAHluAkuBDEU8KvTnLMfeVhMSJcSI4CZAB+Q8Dy4zuulyiE/bZhkxP43H1RD7zIZSVA8/uPOLtEyUh7SFl8RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NcqLBxSg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NcqLBxSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744873049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjODyzoHgOaSkMOizAfMka0/yn10076bTRY95dAS8m8=;
	b=NcqLBxSgsicmKMUpmjdlDHIM6vhtiSlWWZKlcxU9QRHildA+z8tZUrFlXDjuDk9Meod/4B
	m3WBdJO0eL2iR4Oi2gAdwtV36qBRC61GbgtVax8CTdUnkOfb9LJH0Wyq6la27xni2AtEVP
	dpT+wB5Yt7XNcYTJ4baVpdB/kwFD760=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-jIrHH3dcP620McbZONzgiw-1; Thu, 17 Apr 2025 02:57:27 -0400
X-MC-Unique: jIrHH3dcP620McbZONzgiw-1
X-Mimecast-MFC-AGG-ID: jIrHH3dcP620McbZONzgiw_1744873046
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391315098b2so143254f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873046; x=1745477846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjODyzoHgOaSkMOizAfMka0/yn10076bTRY95dAS8m8=;
        b=LtKz3fjLcgd/o2xwrO4GUh2lckIpn0DlmSvTpUs23hxZROdfVTaLmITKnnqD3mJ2Cu
         lcYjRl+pnSbihZ5+JwqcFLNPXwiQvCeuQeM035HITlZ+FcV4nYkIfGzHa+aeSnk0WnR/
         xCCBKM8BF8gtXhFK3FaT4/rkDeKRyeLDiZDFdLs8WJxny/qslmoBZ9ZGGMN3sRs5DLEk
         elfRzEC4gaVs8TU87jzL/zuzmilIgmwafLigXCuil0YHAuXzKkxLB4gBDgUVquW4+Ctw
         Hjf3kIa21fsUopD9snOgg5f9fm6Du4549GK7mctgr1IKAyIAnMbgWZ8EBfGR9doga/Kn
         IccQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+M4mXfPD3yfT2+S+RlkJz2r+k4Afv1AsW3gJqXwOuQBHJ3T74APArSI5kC5q2VyVcWu9FsvLFRBH+448=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wMFsybUFQeY95pm6CXYxk8zK/EOvLZyM6XDGBRgTuG8OYi1D
	jouU/tuXlNR/mbIETt7evDO5yczWBadMNSKtO2xuUDRDhv17OJNPgKyBDP++PTXgFV5o+H5IFLH
	o6svWn5LnRNFuNC7hWRDFu2O64yLXJhG0uCSXPDzW9m4kqg3JvRzROgReIy6zJg==
X-Gm-Gg: ASbGncsmdMbDJ01/e92zn9jPZL+ftCuJc/+3Esg8Sp/6Zfp7JBSxNISgQrpE3J+1DZ0
	yTc5vHiQ3e8TqwnTe3AUxbqCxh8evDmMNVY+n0RFxyt+J+KN4CuOaT3sK/rb5VgNi57p4zOcmQH
	35Rp3b0zQ02MR66e51RwsR1xh5IL6rMb9GHe38SnM4gurHb5xlASmfJmMKs46rFyvAP7Sj6lGF4
	ZXaQHfXATCI+JFZyZkRNYuJYDb/ziGahEC40cz6zYHCXioLR8q/ejgimKrX3VAadWAh2HVX+Wy1
	PrcbnHidN5D8gh1yYji6shJP0HT0afrQ2CUfo0yC6g==
X-Received: by 2002:a5d:598e:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-39ee5b12f6amr4246217f8f.5.1744873046361;
        Wed, 16 Apr 2025 23:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxeneD4PU1badohm8V9WmJtKj9YkZnOXQdqdLY0Y/Fs91DJ14HKRGByKHiwMz/4SXoc3HdGw==
X-Received: by 2002:a5d:598e:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-39ee5b12f6amr4246204f8f.5.1744873046049;
        Wed, 16 Apr 2025 23:57:26 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce3bsm19526728f8f.66.2025.04.16.23.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 23:57:25 -0700 (PDT)
Message-ID: <67a977bc-a4b9-4c8b-bf2f-9e9e6bb0811e@redhat.com>
Date: Thu, 17 Apr 2025 08:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] udp: Add tracepoint for udp_sendmsg()
To: Breno Leitao <leitao@debian.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, kuniyu@amazon.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, yonghong.song@linux.dev,
 song@kernel.org, kernel-team@meta.com
References: <20250416-udp_sendmsg-v1-1-1a886b8733c2@debian.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250416-udp_sendmsg-v1-1-1a886b8733c2@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 9:23 PM, Breno Leitao wrote:
> Add a lightweight tracepoint to monitor UDP send message operations,
> similar to the recently introduced tcp_sendmsg_locked() trace event in
> commit 0f08335ade712 ("trace: tcp: Add tracepoint for
> tcp_sendmsg_locked()")

Why is it needed? what would add on top of a plain perf probe, which
will be always available for such function with such argument, as the
function can't be inlined?

Thanks,

Paolo

