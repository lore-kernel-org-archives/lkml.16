Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF431FCFFB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836300; cv=none; b=iNDcpDOUryvLUN6rHRi5Ww7HTxdEyOg/6AB3d+12jgib257Md9dGt+OtdHhroJyb/0w8GMVQAqA9IVuPRVt4AVTLsYjFxvay7E2QK+qQGHLVo43sSs7XD39wMAfFb8ffWnI+4UGMn9g5LVmTssvfTlZhRhLdflmg5orMbNoRdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836300; c=relaxed/simple;
	bh=ce1UdDUU7h2aNFOM8myKE4XHFYi78SBsoNdAnOZm/JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXj2Llj+TdAkcVEpGlOMRyWRXC1nUM4WBbG6eRKNYusHEpANBizyBak07xs2bhhgtGCSrtxorOna8Q+op4t9KUkk2tPP61KOGpids0khW0UVkRkzzFZrk0b/T6zRYwM2bytufVNf4o/2IZQ1S+O4q5wprHBLqpPLpx3A1A/moBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lw9QD5As; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lw9QD5As"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750836298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gb1EG5rVAzkyLlYvRtxAnYGAwdctzybaq8suJ9itpCc=;
	b=Lw9QD5AsyfH2/ENQfEAPeAYYjhVrwYy8cfW+t311nef0k0OJ7gxDc+a7jEzGUY4wVvBmho
	9oTcEtKLrZEip5uIGz0fc9DKYVcHKCoDUbEdA9pUIqeSOjC+dCtc7KMb8kJXtv3nm+KNWs
	YLk8fW7sxmAk9gu1a7cBtUJbyYZCSV8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-J8VKH_MkMo--uiebmQ1OJg-1; Wed, 25 Jun 2025 03:24:55 -0400
X-MC-Unique: J8VKH_MkMo--uiebmQ1OJg-1
X-Mimecast-MFC-AGG-ID: J8VKH_MkMo--uiebmQ1OJg_1750836294
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso32851235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836294; x=1751441094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb1EG5rVAzkyLlYvRtxAnYGAwdctzybaq8suJ9itpCc=;
        b=RluL+xCrnggTZvLEDEQ7e19jtHKmn7RjozchIBSbRJ7NZfzSCRfdC/CI7mtsMRabmt
         uTtAgaXzquHmz1g9qhqapdq+0UwrS5CozM6stUwmDMzSyxCiZa3rISAmXutfQm79oNBR
         je5wIQiZ5vQaXXPMkZ2J4evIsQ8DHTZ0uY46kwCp35irykNLJDycXQg92J72SjGhP1zv
         QljeOWkPp4RJQPpWjVX6fpibBDSOjRL1W07MeJd7ZlRVGkrjlcjbMEnVraFLLkpC8tVH
         b0MP1+JhpUvFnva+lqeieC7ltwY2/Y+NXqsQ12Y0bCgd6BRXt9daE3Ea/teZA9CtPdp+
         y1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx+eqwlMZaFX7jWot5h3mlHHtDr3KMvbVTX8HxfRV8bBiVCxjNYohraWQm+6kRCftSWNFDvgSQzLaYY6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdNFJpAxUNKI1NNfwc8C3W1e4A8ZKJbTtnjpN8q8AGt37FUBN
	cAyp+Xvw5t5enmvEC299+qHOjqBsemMI5FKLMy0iDQ8KyVdGCrYxJyhUW3DdzZWZiqqWN+W3S1M
	ARMpBN3DBriUakXSqgXwPRF1a6dBlN38t+ziq4H37dGXMfw7G/DNi3SQ0BXKVSqbi9B+HjFAQxR
	lY
X-Gm-Gg: ASbGncvEMA4lRuuCekyT2rJSGyU2hAyWbey9BuLSkWl2YEuOgvI3s9MwG8MepmmJvIE
	nLZp6FN/m2SL+m89dgv8cJB5myzx8ODeIdkCU4ZH194OdrfdyBkGY6jZvlUK4JDoKbeb/qT6bgw
	XKPZYb0SJxECf2EvoXIwPk5RwItGaJFp/qQEFcgMG+DdmTKzuRiyivKEhGC6wqxs8Gp2V3Idvfk
	aEUPaf9bq6DEHevryBkLFPmLiwcYCi8H+ey2SxUSmOM7qW1/8kT8pAER32Sg+zQXHvAyN5sW6AZ
	C6YMqCl9P9DY59P1/cYm/i2MGD1BGGlPi8JKQCGatlzcymv8Ss5EZ2dttHfqv8/oRXVy2A==
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr1223622f8f.49.1750836294081;
        Wed, 25 Jun 2025 00:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA5cKazsGi7+isNP4cFmVJmrA4j/6038eVM8NMzh2KqkWk8sKK482rCdusN3KvxTYpOH6e0g==
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr1223598f8f.49.1750836293687;
        Wed, 25 Jun 2025 00:24:53 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc86:3510:2b4a:1654:ed63:3802? ([2a0d:3341:cc86:3510:2b4a:1654:ed63:3802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805e828sm3894469f8f.32.2025.06.25.00.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:24:53 -0700 (PDT)
Message-ID: <81a216e8-e675-4564-84bb-039e0851a8ec@redhat.com>
Date: Wed, 25 Jun 2025 09:24:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the bluetooth tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250625111648.54026af1@canb.auug.org.au>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250625111648.54026af1@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/25/25 3:16 AM, Stephen Rothwell wrote:
> The following commits are also in the net tree as different commits
> (but the same patches):
> 
>   4500d2e8da07 ("Bluetooth: hci_core: Fix use-after-free in vhci_flush()")
>   6c31dab4ff1e ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
>   d5c2d5e0f1d3 ("Bluetooth: L2CAP: Fix L2CAP MTU negotiation")
>   866fd57640ce ("Bluetooth: btintel_pcie: Fix potential race condition in firmware download")
> 
> These are commits
> 
>   1d6123102e9f ("Bluetooth: hci_core: Fix use-after-free in vhci_flush()")
>   db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
>   042bb9603c44 ("Bluetooth: L2CAP: Fix L2CAP MTU negotiation")
>   89a33de31494 ("Bluetooth: btintel_pcie: Fix potential race condition in firmware download")
> 
> in the net tree.

I think it's an artifact of the BT tree being rebased. I pulled from:

git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git
tags/for-net-2025-06-23

It looks like the first set of commits is no more reachable in the bt
tree, so the 'net' ones should be the "correct" commits set. @Luiz:
could you please confirm?

Thanks,

Paolo


