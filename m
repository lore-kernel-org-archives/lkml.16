Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A60613C9D4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665628; cv=none; b=ItiMyO2m5WsYiXq8VcCd2LsTJLznNIaHVswudXeAFWRKDeADMXmRsnak7wO07mmSFdKEnX2HwAEsiuAKUG2sQzqHc6dK9Jh6FjM25s2dyRLmFg6qDCcGWCAxllZRd7oQcjYdcdYx+CXksFbWCqQxORQRc/zGpCBWmasMl55N8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665628; c=relaxed/simple;
	bh=172cUWlhoQgNf/Z9lM1RjxC+OqlWmgKCVShfli6QUsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLKhlS6oVuUu6fIKNKSovyYVWu9aRX0AT1/t52ZvTJCUX9seb5tBu3ujbOjtpynGAsm3YxL/RGA12bzmXht9NxuwTj3xlYc1sEvzGlj5h/1zo3117l2XjAYMbCFhtXA3XnSEF+KbjsLzvu6hjFXMqEdUEhOd8HUhi+MYYMo0B/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NqLPdWsf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NqLPdWsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738665626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCFgA/QhpVNocdNIuyeEH/cghaHxUWNYBCCDRrHvU7k=;
	b=NqLPdWsfK3F7oivtsfrFEnM/TwvDMsadOk+LGpRDGQXPOY6k6cUN8FpDMmdCN+MZifR79/
	RsAuAXg3QxyH0vW/WKpKTAB9ZFcAyubScTQhR2VB+xf0s5Z7zw+vgpf7EWvOlXwHugkp6X
	w45UQYLctpWLjR7YT8OimQFwiQH54TA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-x2WWAIH4MaWZDHZRe3jlsA-1; Tue, 04 Feb 2025 05:40:25 -0500
X-MC-Unique: x2WWAIH4MaWZDHZRe3jlsA-1
X-Mimecast-MFC-AGG-ID: x2WWAIH4MaWZDHZRe3jlsA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38c5dcb33a5so3564547f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665623; x=1739270423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCFgA/QhpVNocdNIuyeEH/cghaHxUWNYBCCDRrHvU7k=;
        b=fZ0/fsofLYg/VkCra1yji5Q02M9ZZ0kd+WY4IdU5ummgJkvx4S1cr1Task8pX6F2oR
         5pdV9Ai8/cDLASznHxcjQGkKfzOCVPa8pMe/7Suabfy+b/rSUonm7BMaOAbFDb0z02PQ
         74GRw4nbVPtpR1Q1jyqYICTO1EQ/VNSl6fa3nnfS4qe+mMjNnzQUdPjfwQLsmOUbI+OA
         PajC6ieDYHXtgqEFN6d1lmd7vxk8CfDlm1lMnbmEn7dRIXJqyxnwH7sioX1xmaUNxDA3
         ak1g77XG7PpTm99WCVdgN6osNIsMh/2giF89OxfV7ZfUbAmhPjUNlISlejgF5+7jrStb
         3UNg==
X-Gm-Message-State: AOJu0YxazZa6h2JJxq/2xzjmLUbHFPzNkEUAYJl/O4hwZU+RUK6/AoD/
	WRmJoKiCswY+BjD1qeAEDuuo5WGjV7BiN4NZgMckv5zVuJCGXM7HSU5n3iMuTFXiAuA963kD9hg
	Oo/TjrJ0jdBMHeNDpawA3BvwQOo8MbIOvSM06AwkRuqKv1/jQBpQUFilW1eYqD2v9HfBnlQ==
X-Gm-Gg: ASbGncsLtBBaN5mS0rPlVB6zWGs4KnkN4IWbmwaPExh/0l2V2EB8xflxcyKtWrvB6bH
	kV1avf2mWdqXGPZXQ9GVImB6vYFWaFbvBcPzvWPpJn7DMMh1Lprl1/Q4/keeBhVXBE2M8R5APHw
	pPtZ+zsM+NXOPjjBcb4zU/f5mgP9q1ojPLnR83655DcxkFRIJO9zrrrVLOZid7ZrWUqIdEnd8gJ
	tmfpG3obyC38aMz8R0GcgwB01Dq1hMRCxAbIdjSqm9sk7YHEBQFLIRVBmy+YaoA5K8UxxgKjBtf
	P8tIdyVcM6BB7VHkNBptUL9WFOTGO64iQ4k=
X-Received: by 2002:a5d:584e:0:b0:38a:8b00:6908 with SMTP id ffacd0b85a97d-38c520b0b23mr22055229f8f.54.1738665623486;
        Tue, 04 Feb 2025 02:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUEIF09zz2Q0ae7dPZVMSCm1S5VnN6t28UpOZM4XPVDSCDcccMxy8E1ydHF9KTDFcxhKre4Q==
X-Received: by 2002:a5d:584e:0:b0:38a:8b00:6908 with SMTP id ffacd0b85a97d-38c520b0b23mr22055210f8f.54.1738665623166;
        Tue, 04 Feb 2025 02:40:23 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f1b570sm12259835e9.1.2025.02.04.02.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:40:22 -0800 (PST)
Message-ID: <914e488e-af7d-4301-8be2-410db5325f14@redhat.com>
Date: Tue, 4 Feb 2025 11:40:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/10] net: pktgen: fix access outside of user
 given buffer in pktgen_if_write()
To: Peter Seiderer <ps.report@gmx.net>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Artem Chernyshev <artem.chernyshev@red-soft.ru>
References: <20250203170201.1661703-1-ps.report@gmx.net>
 <20250203170201.1661703-9-ps.report@gmx.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250203170201.1661703-9-ps.report@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/3/25 6:01 PM, Peter Seiderer wrote:
> @@ -806,6 +812,9 @@ static long num_arg(const char __user *user_buffer, unsigned long maxlen,
>  		if ((c >= '0') && (c <= '9')) {
>  			*num *= 10;
>  			*num += c - '0';
> +		} else if (i == 0) {
> +			// no valid character parsed, error out

Minor nit: please don't use C99 comments, even for single line one.

> +			return -EINVAL;
>  		} else
>  			break;
>  	}
> @@ -816,6 +825,9 @@ static int strn_len(const char __user * user_buffer, unsigned int maxlen)
>  {
>  	int i;
>  
> +	if (!maxlen)
> +		return -EINVAL;

It looks like this check is not needed? strn_len() will return 0 and the
caller will read 0 bytes from the user_buffer.

> @@ -882,39 +897,45 @@ static ssize_t get_imix_entries(const char __user *buffer,
>  		pkt_dev->imix_entries[pkt_dev->n_imix_entries].weight = weight;
>  
>  		i += len;
> +		pkt_dev->n_imix_entries++;
> +
> +		if (i >= maxlen)
> +			break;
>  		if (get_user(c, &buffer[i]))
>  			return -EFAULT;
> -
>  		i++;
> -		pkt_dev->n_imix_entries++;
>  	} while (c == ' ');
>  
>  	return i;
>  }
>  
> -static ssize_t get_labels(const char __user *buffer, struct pktgen_dev *pkt_dev)
> +static ssize_t get_labels(const char __user *buffer, int maxlen, struct pktgen_dev *pkt_dev)
>  {
>  	unsigned int n = 0;
>  	char c;
> -	ssize_t i = 0;
> -	int len;
> +	int i = 0, max, len;

Minor nit: since you are touching the variables declaration, please fix
them to respect the reverse christmas tree order.

This patch is quite large and mixes several things. I'll split out at
least the strn_len() caller fixes (possibly even the num_arg() and
hex32_arg() ones) and the refactoring in pktgen_if_write().

/P

