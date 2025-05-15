Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E81DE3B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319254; cv=none; b=QN1bJeL6Hws4NVJRduOK1BuQaXH01052C12BXEhrim+A0wF/W/hFfx5L3e+ZDN/7R6fXSuHpysf0lgB0RS1JZX0HEhmwPzui2eyvII5bfdakFgA2vy8cQKazzzPG5EU/JH8xb7p0c/wF8I/H3T7qoLhaElwGh0VLgO+x8EctF1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319254; c=relaxed/simple;
	bh=CrapUCqtIZ64bZ3SgviGRhkKvc64KRNrgaWs4qmblys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1m/NeLBohHoyw8R8FzTLluxRwDLYnf7TDrcGPSAJND4qomJ1TUa4CgHvDTeIfHZaUCwQ6MJQl6AmlDa0shqQw3J+Sw2YLe850AfXedlceKYOOUMzJOaB6NlC7KsXeSusaGQonioax04b0D46/qa7nos8dUM6nA4ZqizZY6xWig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTVokyQA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTVokyQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747319251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huz51ddnBUzqXDXluJaM4urWwAvADCicLLosUlW1Gco=;
	b=LTVokyQAKHTbvPk2LyRPOuB+TfoZHIvDwMo/BDaoJYPlHrScHS08qAOIEVrWBKSaqLUkiv
	cvHpvDBKFAc2H3TagPHDU6f4XkqvnG8k+/TTTYUsVOdjPK1F+J82jeZvXJoHjDUS1clUaG
	ef0+OSwFxVvc1ehGasa2kSpmqRG6G2A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634--eGkgGfDO3SZIGdB4BNHlQ-1; Thu, 15 May 2025 10:27:30 -0400
X-MC-Unique: -eGkgGfDO3SZIGdB4BNHlQ-1
X-Mimecast-MFC-AGG-ID: -eGkgGfDO3SZIGdB4BNHlQ_1747319250
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so8277535e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319249; x=1747924049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huz51ddnBUzqXDXluJaM4urWwAvADCicLLosUlW1Gco=;
        b=ouxt3Rh64A53cj6eBzoofWpu/924zf4zcDdqiWiCmSGQuFusOmLHcXp5a4Ihq7hCp7
         J/iZgvqwtE+dVYqGD6YTe3kbP4mACZIm7AcbF4mojyCj9I4GAQNhSZd5CtBpTHzZsKW3
         9qrBDiZr70K77/O/FjSQF+HG5af/0Pnqaa4OYyvD8HBUqKqNXX6w2hq5eY6sroFemeUP
         qLHx/Fo5BCpt7s8deWWv3akK3njP/fVzNWQ7m/sB/gL459SAW+M+y8Dnii4LmygsymsU
         V1Ci1MYHfaGfjZSB6567t7jkIV0g1tZtYMhiEUd05pwFUQwoivoXaf9rT0vmvg06tgFU
         UA2g==
X-Forwarded-Encrypted: i=1; AJvYcCUyD83FEFtJyl+hZMAfE0FA36RG/nTZD7LP7jqKm1YGErTNKqFb9tuMDLnCcxHMk2RUl/2DsSy8Vv/7pDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydfL8QVjsrUoGBCnwUeXC2XlqZ6pzQg1pXQvgG0WHS1ZVaiWnu
	3jJrzAQVSNNkoO8jg0jxhsEE58wbFuYesCfX/AWMon8UdBG1L7P6Bdk7upaFb1u6ciCOP2N1RCp
	O8tbYqJZLOSjhQG7Km9QJ7sFYEderkjeQ88oPvtX6EBJpGKF6nTnoE9EbTX3y+g==
X-Gm-Gg: ASbGncsR8yeWEV1X92Jfy9VNBoxw704az6qRT1iKz75KG1+IuNDuaFXxDMIqgxebWO5
	OtFGNBTTkBse8+aeeEtVGnbFwsS34kAN+cYrWQ6CpxGi+vQjkQvkpvzc+/KOV6nJlhib7LR1/Vc
	uQ4O9bNuLWyJ0Pm3ZbTTYw5ad7tC2hcUUeCP+twlKaK8tD2vOtxSOH+I7lpHb4shUyMZcJwlDgc
	ofLNAkrIxDVzBDvp4yVrGpmfp8FbppJMeu3rL4TIKoe4zhNZ6nmTdGDfSR6cUBbZ6IINxYy0GF+
	xoqTHfulSYpCQZoRM8c=
X-Received: by 2002:a05:6000:1a8d:b0:3a0:b979:4e7c with SMTP id ffacd0b85a97d-3a349699b9bmr6954412f8f.3.1747319249248;
        Thu, 15 May 2025 07:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqqzNDS8gHcKXPhus7Y5b5W05r7fTBd+OoE1w+5qSXRDsxkK+I6bPjSes89yOPcONJkNsChw==
X-Received: by 2002:a05:6000:1a8d:b0:3a0:b979:4e7c with SMTP id ffacd0b85a97d-3a349699b9bmr6954387f8f.3.1747319248915;
        Thu, 15 May 2025 07:27:28 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2440:8010::f39? ([2a0d:3344:2440:8010::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ceccsm23174624f8f.64.2025.05.15.07.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:27:28 -0700 (PDT)
Message-ID: <9d16bff8-1a8f-404b-a5eb-6da5321a3bb8@redhat.com>
Date: Thu, 15 May 2025 16:27:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] WARNING in ipmr_rules_exit
To: Guoyu Yin <y04609127@gmail.com>, davem@davemloft.net
Cc: dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAJNGr6tmGa7_tq8+zDqQx1=8u6G+VtHPqSg1mRYqTDqT986buQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAJNGr6tmGa7_tq8+zDqQx1=8u6G+VtHPqSg1mRYqTDqT986buQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 1:37 PM, Guoyu Yin wrote:
> I discovered a kernel crash using the Syzkaller framework, described
> as "WARNING in ipmr_rules_exit." This issue occurs in the
> ipmr_free_table function at net/ipv4/ipmr.c:440, specifically when
> ipmr_rules_exit calls ipmr_free_table, triggering the
> WARN_ON_ONCE(!ipmr_can_free_table(net)); warning.
> 
> From the call stack, this warning is triggered during the exit of a
> network namespace, specifically in ipmr_net_exit_batch when calling
> ipmr_rules_exit. The warning indicates that ipmr_can_free_table
> returned false, suggesting that the mrt table may still have active
> data structures when attempting to free it.

Thanks for the report, I could actually reproduce the splat. I'm testing
a patch I hope to share it soon.

For the record, the above analysis is incorrect: the warning is
triggered by a netns creation failure, not at netns exit time; the
problem is that the running kernel has:

# CONFIG_IP_MROUTE_MULTIPLE_TABLES is not set

and the ipmr_can_free_table() implementation in such case is
incomplete/wrong.

Cheers,

Paolo

