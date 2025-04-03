Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E502134CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688963; cv=none; b=H6OXEpV01wvnTva1EB2ysF9WleSoKY3X4uEtv2EUZox/PaEYrKRkMs2rHFdiIygRHdLuBph+cTzpwaHmbTkFVJDFDs+tHn2ZI19kFdCmW0va9mxyzVzkwppdskfEZ+ObGotmBXkeqEI/hqQPGFnFllZrlA3LhNftyCAtLOadIik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688963; c=relaxed/simple;
	bh=S2I5uMGMmzaswrHxMNr8vYNfkMq3kEcFyspItbcpvic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPa5FImG1g/pyR5SuwWStVG/FJGyBbILl1BPWJMsA/XuZlI354CxvwTTOvQN7UItfrZPaPbMy+nKRC0qiO3QpUR8PnX1tG88qVzGGvZhmRUeqIXL+Uo4quwR+niEi/wODooWdKZfZQZoWs1Ubkz0Y/mv4RTSlN4a2Xw/ZybXe40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXd5qort; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXd5qort"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743688959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kWqXe38cLRXw8rlot99ne3jbC4BOsP79Qw7Xj1goMU=;
	b=LXd5qortuvM3CTozhSiBpQQ93+w/ckXyB+acnhouNiK123OcaXJXlxpYjKuZtc5fZSfkOI
	zLY6aWutK8GCcQWffmOa5wohcygaJioJmde09lSL4HLmrUQ/pAPzp5eS9P3wJyy9QkpUCo
	pQszNWjrj8V430TbWAiFE1qC1LZUGMs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-cMVQfG9eP6akGKAZCTHjJg-1; Thu, 03 Apr 2025 10:02:37 -0400
X-MC-Unique: cMVQfG9eP6akGKAZCTHjJg-1
X-Mimecast-MFC-AGG-ID: cMVQfG9eP6akGKAZCTHjJg_1743688956
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so5307575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688956; x=1744293756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kWqXe38cLRXw8rlot99ne3jbC4BOsP79Qw7Xj1goMU=;
        b=Pat7dQiQvA1UetaAfJxkMtwGiQOAxEOpaIaqT8f0iO4CToymp4+WUoKx2hp+3ikNT4
         ahsg2AzCpzX3iDMJwetox/ZRSaGC3Hi8NSKVWWaIPmgkGz4oEIIZn1/rLXlLG6Hrz5ke
         GxiS1tyxpBuc0b4WAhrwUPrjiU7OISGl9xlzQ6+pmzZUPmqcHJRu4C7dYyAZZdb81t02
         v89S0G0YncZVzDVHxdNGjBr4+8COq4v1ZWOiXonbIXd2fAf3wivFprtrn7s5CQBLYpZD
         Z/UR5xICuHUj9RsRz1fGWlzILm0OpM7BWE4MVklMlkWc72ocbQoyqmlZDlUN2ZEciG49
         2CFA==
X-Forwarded-Encrypted: i=1; AJvYcCUeOcR/7W/KJ+DxbJneHWPri7LDz5Ifm/T0wz2ezi7xDO39wM14FNS+p5L1MDRBPxpd4ZjfDJ61/tRd6ZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXGcNcZaCTHS5moIGiEwV3vWTR/Nlgd/nQ/o7XRYsNXYqRQQL
	teAS6MwVDbKy5HrXgRNJE9BgXLjgKQSJ8g8q5QlOZMk2DGO1/lL36TM6eOVaJUhQIYRdSaU3Bz5
	Ixb2NcdYgjmpSzSJWmwhEgYw1/j1SlS83x1cJJXLQhHDrVwyhrjf8rt1vl4mcWQ==
X-Gm-Gg: ASbGncvIHgtWiVKwklC0Q0uSteDhRHzhwdY77mHzW7dV1xWv4NiC259qMJyfupFgSfZ
	UXiYOaxrNDJsV46LImZ6NqAhG4x71hQwnvRtaChwdgc2tdAXGXVdMKgjs1vGEJrNI9f6vXtVnMh
	yPTkLEtee/bJl0Hu3hrkLZhEOwoAoC83wHv0Te4oFbKlHnc8wS4bYn2qxCZpFJGXbH1R+vaGx5r
	zr+XwHF/1rA+UUiwd6YRcOqNWfJNONNZc9ABPvotYkE71C+1RSSNYW2hgDujrwW4MUb9hc1tEHR
	4ocwrgg7SjGMeQWVFiQDIhxs+70mjCyBl3DgbO7M+DZ08g==
X-Received: by 2002:a05:600c:1e0d:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43db61d78c9mr209456355e9.3.1743688956066;
        Thu, 03 Apr 2025 07:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEcH3URdYpyXxENBkWaOZCl6SCATd9gstr45DnynhqDGmUUru1LNLrjf8EszoAacInIZ8pkg==
X-Received: by 2002:a05:600c:1e0d:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43db61d78c9mr209455765e9.3.1743688955644;
        Thu, 03 Apr 2025 07:02:35 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea978378esm51169005e9.1.2025.04.03.07.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:02:35 -0700 (PDT)
Message-ID: <d99b52d7-bdd7-4c67-9be5-f5c48edc8afa@redhat.com>
Date: Thu, 3 Apr 2025 16:02:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] bonding: use permanent address for MAC swapping if
 device address is same
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Simon Horman <horms@kernel.org>, Cosmin Ratiu <cratiu@nvidia.com>,
 linux-kernel@vger.kernel.org, Liang Li <liali@redhat.com>
References: <20250319080947.2001-1-liuhangbin@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250319080947.2001-1-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 9:09 AM, Hangbin Liu wrote:
> Similar with a951bc1e6ba5 ("bonding: correct the MAC address for "follow"
> fail_over_mac policy"). The fail_over_mac follow mode requires the formerly
> active slave to swap MAC addresses with the newly active slave during
> failover. However, the slave's MAC address can be same under certain
> conditions:
> 
> 1) ip link set eth0 master bond0
>    bond0 adopts eth0's MAC address (MAC0).
> 
> 1) ip link set eth1 master bond0
>    eth1 is added as a backup with its own MAC (MAC1).
> 
> 3) ip link set eth0 nomaster
>    eth0 is released and restores its MAC (MAC0).
>    eth1 becomes the active slave, and bond0 assigns MAC0 to eth1.

It was not immediately clear to me that the mac-dance in the code below
happens only at failover time.

I second Jakub's doubt, I think it would be better to change eth0 mac
address here (possibly to permanent eth1 mac, to preserve some consistency?)

Doing that in ndo_del_slave() should allow bonding to change the mac
while still owning the old slave and avoid races with user-space.

WDYT?

Thanks,

Paolo

