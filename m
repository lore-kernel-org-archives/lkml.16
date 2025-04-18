Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82348155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744973706; cv=none; b=AoVP1SkimtTeHYjGVA05Zjh7/YUnORlP0F5nTdvmzumiaqjxH6PPycBdRaKycuAYBK7rNyJZmWPvW075U4VhRSIyXc78GyfOhAvdIHBrHFStD3aGLRKdGMrQijcITLh6DFXu36uTCE3iq4pOrySJF58xNVWDoOIJRhxX5eOhTBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744973706; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJkK4ZMa0QocH8CG/fqzF8ThgyI/VhcVq7Bs1jwhYKcOLd12r5fZ5BoUHJBr87R77nyPQNj3zMPjHHM0bG5FF/436KJbocWP/HEM4wIerTpTiALQGqffuhp8lEgP4IwFjaLfHrPnIF1P1HZRWtBDFt9WOVDMlwUAHtqEP1TtNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39149bccb69so1766647f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973703; x=1745578503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=hga9ymm74Gdz4HjUoOBHindoEOzNzkeMgu5nJhaZbVoszZOq1F0YZ1xzcTtM+0Lvtc
         XlgH1IlNzpNAwSwrnfGC9Vu9pNkjto9M0lgkuHQ0zbQ+NvSXnX5NJbKoMPtpW3TJiE/h
         dBmG2nx1LYzhYEFAJSRoEKOsCMxvVZh/isWkin9rMsYRZ6jnf05jeoKS54O4RbG2QaEZ
         asa77REenODTJunXQ98BMr1idSfwyzOrSi7YeEHojNylCmrpq4ZESppVe7Km8gLaiX2E
         1/PO/T3sb9o8tHGPEJQUXscqI9n2vy5GZx1Z14w8HgoidWqGS6m7R2/zQ1q5WXYz1xtf
         eIdw==
X-Forwarded-Encrypted: i=1; AJvYcCVM2RJuOgmADx+p98msgSNaiyI/srJwi39kTpzBvq/wcYW4fnU542Hf1ZT6j4sqoBu2CvTPHhnbzC6Fk6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjZ3yinDWGuKwL+4LPSNQSkJiHxvReGRE+drnSHgosG7OrWuTE
	+zO/n8Q32fwOJzXuSq3ocbL+j5c7QVjfLQQ3azhUPLILmyUbCHPzc8mraNPY
X-Gm-Gg: ASbGncsQHjHxlTNB9ps24t3SCYyegAFu+Pi4iTkE4ilsLnfDmsCM0K/g3S36KZcr45j
	zR/hRN+Dhs0jMl/5rH4Coz7pqQ1/JKJb5SUtVUBpze+d/zRHsQyMgguSAnUfumGpbjkvqiesd1o
	qFntqR98D1LyOgNkzhGdEHTZhdLJ7fC9T/EN3ie/DMLtvQzFyhzTHeqJ98HORVJrgGwNSt/cxBj
	MWUWwfwHI8WfIOHABHzxKsCLgbSxnaSJ2l9awJ9euR6SzleIkTpzDloNhwF7Q+JsS5nBdIhQcau
	j2j19WLlphUbDKW4u6OA+dqKgNiujnS4q5blyU44
X-Google-Smtp-Source: AGHT+IFTMnm9+bfwTjn7vrtWKhFTRku5ftbLqGSkkbWOuXv0EEKFnV3+WhSXuKtWzRUp57rrY8EEUA==
X-Received: by 2002:a05:6000:2489:b0:39c:f0d:9146 with SMTP id ffacd0b85a97d-39efbace605mr1682750f8f.45.1744973702792;
        Fri, 18 Apr 2025 03:55:02 -0700 (PDT)
Received: from [10.100.102.67] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acce9sm17980005e9.13.2025.04.18.03.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:54:58 -0700 (PDT)
Message-ID: <07238ec6-ef31-453a-a57f-d22117e9b76b@grimberg.me>
Date: Fri, 18 Apr 2025 13:54:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: Fix out-of-bounds access in nvmet_enable_port
To: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
Cc: linux-nvme@lists.infradead.org, dlemoal@kernel.org, kbusch@kernel.org,
 kch@nvidia.com, hch@lst.de, upstream+nvme@sigma-star.at
References: <20250418080250.2736590-1-richard@nod.at>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250418080250.2736590-1-richard@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
