Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEAC20297C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306735; cv=none; b=rEGkobD1xvPriyLDGYP0+rWv79Uiyiusa3Th9ePvPzADVDmyVNbnqrksz+KbsE/D7wKHAlvblMrF0blT+fVy9uJX8/ZRvDAONLbyfNJlvR9821ULkuLV0aR4sQ7EF6XTdEA210xNpRR9oZQPbgYbdmkK7PT3mo6YlFkAFV89GWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306735; c=relaxed/simple;
	bh=vPPYtUY34y/32p7NpcGTpHBO7lElYqSCrqAhjqNFxyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQu2z3npm/VE2dXdp4sprorrnXOFPO/fK0bBTBEt5sWgpZdLRppFGVIzuc1NcR7/LHLQMMV6YK/K7wBIpV5FLkmkJPZ2OwiPR8q39nDiL3xMREnVDGCO2/X2UtXw5AVYXKq9EE9rpbOc4TPwK/Wa8GwqYFAxGH8XacV6on2KJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TePl0T0t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TePl0T0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747306732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DtfxJoSnDWueJMCUm0s+V4TijRUNWKn/7xhAqQAilP0=;
	b=TePl0T0tfdchzv/doIsvnAGkeeH0y/mmy/tnPQ6mETfMQjDwTNO2aPKGAMMTZb973IPmci
	9mWnpQtiLaFNM2xMjiIkoe8XjSgF8fue4lqOnmmVXaHoZlv1SXv6rgiSTP6JK+dyfm5U+F
	tisv4gomZa8HyppU2u2ZNwHT9o4Kurg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-1SgNy-byPjy5Mk0cVbTUKg-1; Thu, 15 May 2025 06:58:51 -0400
X-MC-Unique: 1SgNy-byPjy5Mk0cVbTUKg-1
X-Mimecast-MFC-AGG-ID: 1SgNy-byPjy5Mk0cVbTUKg_1747306730
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so4203895e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747306730; x=1747911530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtfxJoSnDWueJMCUm0s+V4TijRUNWKn/7xhAqQAilP0=;
        b=aflDBs2hlxcX/0quU4qWfF30acO1Xenbma5rANX8+O5faGOnhG6n34pTXetmSxAuFm
         hbenopwXt1dSeY5CYfXVqxAVPfomFE6HB5+aRCLuZHItu2KgojQLt5bW2r/Ii7LhVLuU
         9O2G2TBWForL4YIvTVyR7ShbmHJDs68PITtdjJUFjyYFRJ/0HjxKi5oYubTFlE4zvRv2
         o7L03yUd4dSiEDuwC0bCpi/MXpSd6z8Ky81IEfiD+C/hIM4tP5fj/3ftk20zi05uTLTD
         L5lDf4e8/rRcWQimxvgNsl0YCP4pdU+17vSIX6Xt17ijSiZqgaSFSsayBe3UAVEx898V
         iADQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcJN0tkNP6kbmcCpp6KIaTYzLBihguP1GgnpBLqVf3fSiXTypahCbYSqEwHRfob7nYZjZa5mJy+3yR8jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEciXlcSUbSFFNfKI3SFTbOp+Nua3i1BaWRyWbNy4bKVqK6LM
	Ysmuunn5JK+AdNF1LBVtLu0tK5Wdbi2ezbMToqAjRKII6NKDIhwHCxIaKEgnuPiZylzmBsJTWvL
	FRzHR6wbhWjFUBEsZs6pk1WI/g6GXw37wRkoOHUpEpjSeko32oFj368smeXq4qA==
X-Gm-Gg: ASbGncti5XrXdS+a5FiX5cz/h73FVu8VP3h4Pp4ZAQjozk1UjNvxC18WfQzqa6CJDEr
	STJWnyMwaAjaSsW+EjRq5dANYedHE8BXuV7vMUhpbgLe2aF8pghWmuxBU/zmJXQUJg1Uyx+y1go
	uK7sx1BQXAry4I7Mj+I/1SneU5QnFK0VcNtXIA8nVUw/dNtTE6UtlC/LhnS7mEIvGEKtOkqg5pH
	BHOLFR9SopHkk0nEmQlD4T60SQT9aZOIA783ekHwX5j6b3aF36tROvfH0u4/aGWOAyFNaDUSwDb
	uBngXAAOJHvCNGI8Z0o/A0lh8YPid932TS9TF9TSqut6ref3nsW6jfEjcsg=
X-Received: by 2002:a05:600c:681b:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442f96e71dbmr19252255e9.13.1747306730323;
        Thu, 15 May 2025 03:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKun1r8EB6EEojcZibkBwXpYYWAmLbbvr82ustuY83/Rqd+iwXRwApMm0fUlrqQlxH/r6tqA==
X-Received: by 2002:a05:600c:681b:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442f96e71dbmr19251945e9.13.1747306729939;
        Thu, 15 May 2025 03:58:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2440:8010:8dec:ae04:7daa:497f? ([2a0d:3344:2440:8010:8dec:ae04:7daa:497f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c3a4sm66788585e9.26.2025.05.15.03.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 03:58:49 -0700 (PDT)
Message-ID: <4cc7aeff-e90d-4e95-a84d-b874fbb47d4a@redhat.com>
Date: Thu, 15 May 2025 12:58:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 5/5] eth: fbnic: Add devlink dev flash support
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
 <20250512190109.2475614-6-lee@trager.us>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250512190109.2475614-6-lee@trager.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 8:54 PM, Lee Trager wrote:
> +static int
> +fbnic_flash_start(struct fbnic_dev *fbd, struct pldmfw_component *component)
> +{
> +	struct fbnic_fw_completion *cmpl;
> +	int err;
> +
> +	cmpl = kzalloc(sizeof(*cmpl), GFP_KERNEL);
> +	if (!cmpl)
> +		return -ENOMEM;
> +
> +	fbnic_fw_init_cmpl(cmpl, FBNIC_TLV_MSG_ID_FW_START_UPGRADE_REQ);

Minor note for a possible follow-up: since completion allocation is
always followed by fbnic_fw_init_cmpl(), you could boundle the 2 in some
helper.

No need to repost for this.

/P

