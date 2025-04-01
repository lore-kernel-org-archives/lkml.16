Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEDE1E5B70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503597; cv=none; b=MWX6f+CD1f/ZW91rMeWu9BdYnPVbsIFlWi8Pg5aVwCCHkcSQFw2U78D1NSQk0nNR9sPSC7rfWuetZ9TcnHYxZRuBE6Txm7ws89dlO1emIl8auWSQXuuplc/NunHTImVr1GsLD8qhFA2FH1S+tvj7YabeKoW0PgDTF16hI7Q6mno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503597; c=relaxed/simple;
	bh=ApBnmgcKqMD058hx45MHE4QVSw6qEmgZIyz8Wmp0Z8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdvlT4mo4JDJiLvr99pcdK5umX/wJEQO7nYGTO3z0+pgRDaCZSpvot35ErQgukBvzYQCfKYeCdXndTf9yjkrbnDBmZpF9mHEUnKD7gNUmACnMocyjM9pjYTPCGwhtSqHvjSqqrC/lRBS6F8wArdP2dFQKc+wcGHqk3O2hx99uwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5HMXC4w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5HMXC4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743503594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TsOOeVbIrS0kLjU5o00N+CHVLz6q84BnG/iW8mymGA=;
	b=O5HMXC4wRotUbBHqnAThf8R2t0IKOHhCdwlsa3dXKDW63P3kzYciCFaOVVAq9jyW5+SIeU
	kRIPJVl3HnsysxWezdzRkPnWrjWSrRXRAHmvwQR1GxPpzY/8gaXji11WUaRFvaHr8P1O9x
	WqIIX8ZaMiiNdIMk/6MkoY4reYHC5h8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-CID3rIZOOsWr7YBYBZaVGA-1; Tue, 01 Apr 2025 06:33:13 -0400
X-MC-Unique: CID3rIZOOsWr7YBYBZaVGA-1
X-Mimecast-MFC-AGG-ID: CID3rIZOOsWr7YBYBZaVGA_1743503592
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so42511685e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503592; x=1744108392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TsOOeVbIrS0kLjU5o00N+CHVLz6q84BnG/iW8mymGA=;
        b=rBL3LK7pOC1Qva7WI5h/dJdXKMyEMQL0tWMieK0ZV/nPSFDSG6WOYtCt0w2vNL///B
         MfBdoBteF/WIRryRZ7ckWTNWV3kcP7Wuvc8HDdXHaHOIQYHpaZZyR1CBC+HrSkNpboaQ
         o1wXgt2JYkfVGbiV/Y2MLg26WeV8NFkwkSgfoY1IQSX1dmvreSXz6XofeMcF1kmTuABP
         1ru9ry8Dz5FvDmoDRSi9OZNv/AtQ5k1jwKgREr2j+A2+mdmpkakDUCIuyg9m6hStExm2
         fNBruCHRhv5gLkNRcHxcE1LW1BSeh3qgy7mqIU4q2hVJ4po9LZL2Xt/kwsmqXFtHQYdv
         s/JA==
X-Forwarded-Encrypted: i=1; AJvYcCWcSi9prNRmX8047SKPOBCLHlnmeWFbZS1ficTJF9ANIN69ZPy8Ci7hakM7KfxcgWEBhP0mXf2cOZNRvoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvrg52N2OR3Evzcs9Ue9Rhnq4y+PhQUkUhSUH8aalor4HLb3Pw
	2NcwIEZYSa0XlJqRb0ehjfCFnNMp7E0ro/JjEV0kTyxqmQ8zKIM6HxeHDFl5eowP1IX+LaQznuP
	u7T/e3wU632q6hWpO6TsXZvu6JMxQio8OFwpxkKCwQT0m0zggyDIla0GmH9zSRg==
X-Gm-Gg: ASbGncvHZ+DApg4BsYp13twUSjwQW7hDqsLmI6ib3aUr9WSJUt6xvaYf/R2QyZrUj+R
	4a/G3Rp2io+GyzpibsBvLUcC5nLB1e+NhlPjxkkOffHmtnc/do8DusDVqek1tt0BgeslNJ0c3Rx
	sADN79J7KrYaAJFXvbDDhBFUNNgqNNgZKaqlLNgO16YPZkWy6h8DafLsR1zts+BEsWYuesv2DF4
	6ol+QX5xjJ7niMqDE5gBXMN5CBtOvusNGXD9iKhEMtrsUikhoqL62kWZmFXcx3xEDEPgwC9enKS
	niKM+Z1vIcUsVmMOOCP8FgGSNAbnvOj8kKE4LZZhQPJ5DQ==
X-Received: by 2002:a05:600c:4f4f:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43db6228823mr106308225e9.7.1743503592246;
        Tue, 01 Apr 2025 03:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMLjX+su0ElU+wdiotWIkpWOESzlWW59YNDgOLOqWSNKSZCQnxyBq6YuI7/DjQUyGF1DSr5g==
X-Received: by 2002:a05:600c:4f4f:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43db6228823mr106307925e9.7.1743503591949;
        Tue, 01 Apr 2025 03:33:11 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efdffdsm193576985e9.18.2025.04.01.03.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:33:11 -0700 (PDT)
Message-ID: <d2914c9f-5fc6-4719-bf6b-bc48991cd563@redhat.com>
Date: Tue, 1 Apr 2025 12:33:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] bpf: add missing ops lock around dev_xdp_attach_link
To: Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org,
 netdev@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, haoluo@google.com, jolsa@kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, hawk@kernel.org,
 syzbot+08936936fe8132f91f1a@syzkaller.appspotmail.com
References: <20250331142814.1887506-1-sdf@fomichev.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250331142814.1887506-1-sdf@fomichev.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/31/25 4:28 PM, Stanislav Fomichev wrote:
> Syzkaller points out that create_link path doesn't grab ops lock,
> add it.
> 
> Cc: Jakub Kicinski <kuba@kernel.org>
> Reported-by: syzbot+08936936fe8132f91f1a@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/bpf/67e6b3e8.050a0220.2f068f.0079.GAE@google.com/
> Fixes: 97246d6d21c2 ("net: hold netdev instance lock during ndo_bpf")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

LGTM, but are there any special reasons to get this via the bpf tree? It
looks like 'net' material to me?!?

Thanks,

Paolo

