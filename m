Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CF23AE60
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318198; cv=none; b=US/fntZR42oO2kl7dgygq1AFj0CUePoZqp9DWirgKN7+FrSrxehsLNYtlAyBmJ2Hin4C3Kbm+EqByaZx4pHb0ZIUNgP5XzMBYyWN7fOPe0oadZR734NdyLbpBx+bNlnh4n5mm2b6Fm6HyYB06R/rAFDBeDuiwS0/GjlwaY+rfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318198; c=relaxed/simple;
	bh=F4L5VEt9DVRxoYQ/0wXQOya80iaudXF10cJg1RQ7bgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j09LzO0yp+xGPx8+A0zFpkVf1VcRWNVSi+dh+ic94hIPizXFl9OA1O2RKNkXOjlIF0erBFWRM0N9wV7vM+qoN62x2JXGiKSNr6v/J4F2CjNkjysb8urcMZVTiGQzIQw150I8cToXzZzqlVxsuf0CLnKxTjkHD9gNvN3aCuZStTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwIDdakx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwIDdakx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750318196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrTW5zP7MlBHGqZQWq1+imPFaJRxQPrs1A7/mNPRYrg=;
	b=JwIDdakx8+o+hsJ0cAbfGshkdXhavbRFkPaipfAImzw60GRsrD6p7DwKNTwTq+0GEou48Q
	kQDGPe6Tlq3oRTdEJKeoR+tjwVL3DZ/UMusbGMYFWl3RurXrp3fTro/S5HgkbkQy5v+yXg
	eQgzcL4fLxcnA3a4yu2EJT1Mg+BGiWc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-NfzMHMGyPgK-kl_-dm3xpA-1; Thu, 19 Jun 2025 03:29:54 -0400
X-MC-Unique: NfzMHMGyPgK-kl_-dm3xpA-1
X-Mimecast-MFC-AGG-ID: NfzMHMGyPgK-kl_-dm3xpA_1750318193
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so260721f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318193; x=1750922993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrTW5zP7MlBHGqZQWq1+imPFaJRxQPrs1A7/mNPRYrg=;
        b=BmDA4xEqUg5xATHS0b2VlnVCv3LOIWXsoNUX7TZgWVYc5bTBq1ddEV+ZYlVbBGH7R8
         QKN1KD07g/Iq9Rmumd3aj53ru2uuiHCDpEux2/D+GkRArQI34J1/S5m9VK1oc0jFrGGk
         AIC1LGDLFlUFL7g639q+ly0YWqx0tYePe87dXHAyl7wqoNL+qFCT7v6oCw3TTAm5CtjK
         b9ub4a0Hhy1a4mjhskqywWduaAbzQImx+3DHJPkoE6OguG+YS9z78c6p45n0qtmHrALL
         sZ9dxzpXrMuu8Q68EMawFhgz/F02pkISMPoDZMHC5bMvCYQMxbl+73lAwWoq0/Ca/sAC
         BHnA==
X-Gm-Message-State: AOJu0YwK14UhlaeqEv7M5VWcLM+NXzi4Fmc73PDMtsaTc5u++0zWqyPY
	LrTJxGukS6gQIhP7YaHBqavQQrvA5L+d3O48fgK9kEu9TqHYE36xv+PoaFJeLZGtTVwpiVKg6le
	/2rFgHQtf0xwdo1yzev10XljcLu+Q41BHcVtvB5nVZyK29os/W/Y5QTUIdLN0sy2xMg==
X-Gm-Gg: ASbGncvlFkMTVNYQpcFdyMqhfvPgBBbGdfhxv1gm8xsSAVABt6W/DHwpxkkmPLZUDbX
	WYQQSlagV67h/UeDMSbosXuANKmY9K2QSCUIPMpYmmuXzptX3COHzxzZ+1UavKQlN6HkUlNXJfN
	CgtfB+GdIPc1wKC+2m26sWJa4DED1oKIFA4APWZPQeQDQMOE3Ou/NjNlrz5AGw4ZCqdkra8aRzn
	144OX/yMOyX1GFe7/Sa0GYo5mGfsMdgcPQ5XP3cGcHavPwMOuhVjzo2KP1Wego3NQ4ifu3fuWcE
	NqOTWz9vNZGlS0FtqwZkfejRiOFo0pGQH4YEJ2gyI/SAWpFefmZCHZD8Tne5ChWTdG7U7g==
X-Received: by 2002:a5d:64c2:0:b0:3a4:fbd9:58e6 with SMTP id ffacd0b85a97d-3a572e56e89mr15931747f8f.50.1750318193211;
        Thu, 19 Jun 2025 00:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL5IJYUQZEAQa4o4Uqb/OFbU0mSJzdtWHgXz3LKqJc4PLM4uUW4nkSi8fwQ5vcBLwuQTPB6w==
X-Received: by 2002:a5d:64c2:0:b0:3a4:fbd9:58e6 with SMTP id ffacd0b85a97d-3a572e56e89mr15931725f8f.50.1750318192807;
        Thu, 19 Jun 2025 00:29:52 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm19056731f8f.14.2025.06.19.00.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 00:29:52 -0700 (PDT)
Message-ID: <9e82a899-7536-49a6-a4c5-c54fa96d8f50@redhat.com>
Date: Thu, 19 Jun 2025 09:29:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ixgbe: check the ioremap return value first
 (supplementary CC)
To: chuguangqing <chuguangqing@inspur.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20250618092544.53696-1-chuguangqing@inspur.com>
 <20250619071253.3498-1-chuguangqing@inspur.com>
 <20250619071253.3498-2-chuguangqing@inspur.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250619071253.3498-2-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/25 9:11 AM, chuguangqing wrote:
> We should first check whether the ioremap return value is NULL before using it.
> 
> Signed-off-by: chuguangqing <chuguangqing@inspur.com>

You are not CC-ing any of the relevant ML (netdev@vger.kernel.org -
intel-wired-lan@lists.osuosl.org): this patch will be lost.

/P

