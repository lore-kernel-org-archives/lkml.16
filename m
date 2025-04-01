Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149E01519B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503978; cv=none; b=Dye+YVcsZ7Sl+yplWUFCF5vnSIpGCFC5zeM4qSPyAm4LVrqmCcKDcridtmBDAWknvPiSM7XjpDce9oDm4v1+O146vtSbbffFdZj5lfTGVJpuOGAlVVkx0O29QPsqHU8ND4KI9AFY2pRS45NmrLbSnLU9vVTZ8MByRnqNBQsLNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503978; c=relaxed/simple;
	bh=M/mq4JnSQpKTggcsMpPy/Ed800gvVrVsqjg65DhPwtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHcScW02VipHkn+14YLW+Xh0ALfnQ7UBTAutF8NTi4XOl7KPjqcj5zmsskqBGHXfYljXGFjDqcsPwcCs40iP8xcD+gCZkhrFB6+MAPgb4SAVdgDpS14JDFHkGLS366QQb9Q10/N7k8T6ACgPN4ZnPI3RfN4Hdbs8AF9UWmZdVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S1xtA2gp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1xtA2gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743503975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQNG48GY5mypw3mSkzgUDbnnJJHt0dyLOJoNC+0wZEc=;
	b=S1xtA2gp/3UEvc2JCeP6ea/BjG272K11fFc8l3+td7IXeVK6WsiX9e+blwpxpOmTGzX6NS
	Pm6/W3OreKFTU0M5EzuCI0XTJ3pgsnTD/1l6raxfgnP4K2SUrvm3xTBvOvQfYfuCdSQ/jA
	VoLyymfMQ1Dy2TFlc8AMwost38rlqdo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-72gLPjd_MuSrvhPsZYX5_Q-1; Tue, 01 Apr 2025 06:39:33 -0400
X-MC-Unique: 72gLPjd_MuSrvhPsZYX5_Q-1
X-Mimecast-MFC-AGG-ID: 72gLPjd_MuSrvhPsZYX5_Q_1743503973
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so38367785e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503973; x=1744108773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQNG48GY5mypw3mSkzgUDbnnJJHt0dyLOJoNC+0wZEc=;
        b=mmK803lyRBnKgIm8h+T7srS9yF8yc1UGa3OCDXMEW+yf17EInUrCo+bz86dQobxnB9
         Zg/3KR1CqmJlX9npc4dwRSGKFdBrtcfHn147y4B2bCteD1FXvAdHNmLW3o2w5Q8f2bq5
         LybbnBf5nMg2DD4DjuDS4QPr368rxb0N1f4if5JFdRipIZcqId2mmferE30ZAUmIZtc/
         CqNxXOFDGL3am4bK0s6QOKwokS+/6sn8KBLDkwa6nVsv2Nss4uU8nY8JA505ANap8Mdp
         XmQQiEnW9OcP+d/c83TH5bsScGaMVqat3hFK2LLgN6B38dsxxaGWwQ26EV3bhGS6L5Pr
         lkLA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPYHyOXSYMAFL8Tp7vli9oWDs1EKyAB+NcPRFUO8CO1IIm0roNKYvzs6CC5roOC7lYnUJMHLnkS6IdlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKqhrGCSCMnktxnx4JibiseQYqYilSDzPujkuTBwamFXM7bcN
	Pa9NoxoGDkZK3pCMNIKlXgA+GG8ZSbAwtTaajGKXVr3dUnLl7CFbZHwwvb9BV56PHXSthvq2zxA
	Qa34H1d3as8Lwwt6sb6EXOHxZ+llxZ6DWhAAGQc+ywODktGzZWDbt2zyGV+cMGg==
X-Gm-Gg: ASbGncuAGxuvkhtNr6GUETlXKn0IDrEXn0II1/7hdk0bW2LP32zhR2aUVcblPk9UxN1
	xPcnfsSJpaWSQlAnPiH/wb9RRAplBWCAszU5Jxu4/XV0FzZ8VSQ0+IXlopU5PkMtRGHq3DTX0pG
	99/Yb0ZnwrTP0HVUIniq0M+L16PFry8PVQrydW/xeaWbfnqLOn2DH7/qJ+RGUpqmMNCl8kGtHQo
	/DWASPEIb6kDGu01w3LG/Ij9ys/LGUeRH6Ja9lzADIWQO7GmG4I6BVYpVrtIi26MRoqqUxpWu0e
	pKIBZdU+eiF9Um4pHqd3rBDgqDoWZSWVK86RlnX830AoAQ==
X-Received: by 2002:a05:600c:3c8a:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43db62bf4e4mr111608455e9.30.1743503972752;
        Tue, 01 Apr 2025 03:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMT1F7Au7S2zYRnLT7IwgveOyfD8e/jDXFa8aYnAAV9srHq09g2hSMlUYYnzNdWTUVtEhQsg==
X-Received: by 2002:a05:600c:3c8a:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43db62bf4e4mr111608175e9.30.1743503972421;
        Tue, 01 Apr 2025 03:39:32 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba4c29sm157427945e9.5.2025.04.01.03.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:39:32 -0700 (PDT)
Message-ID: <3b13fcc0-31d3-4565-b5e6-b75c6b167311@redhat.com>
Date: Tue, 1 Apr 2025 12:39:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/mlx4_en: Remove the redundant NULL check for the
 'my_ets' object
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20250401061439.9978-1-a.vatoropin@crpt.ru>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250401061439.9978-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/1/25 8:15 AM, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
> 
> Static analysis shows that pointer "my_ets" cannot be NULL because it 
> points to the object "struct ieee_ets".
> 
> Remove the extra NULL check. It is meaningless and harms the readability
> of the code.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>

## Form letter - net-next-closed

Linus already pulled net-next material v6.15 and therefore net-next is
closed
for new drivers, features, code refactoring and optimizations. We are
currently
accepting bug fixes only.

Please repost when net-next reopens after Apr 7th.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

