Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A81C84D3;
	Thu,  3 Jul 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524753; cv=none; b=ESlbHNOdt7QcNw7QStp1ZnMUdOnr6/J6tOMbMXn1mRnSlctXW5B+tG/nO1XeTsVTXyMD2q0GRqjHbjuT/Q5pRECC3fy1v3eFoXKgoBRyQ8ytfbclI8NgVlstSZJUUz64/JzwoqGkTF6p1GThkZ22fQ7qAtYhb1e3FsVwJzZaWs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524753; c=relaxed/simple;
	bh=SEuHRbUYQuSyUnUlJ3MFvtKGngEAsGxiOmKtyGZwERM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ak01YabDJs12fDq0wg0Tf0RWzjePsAP2wTqW95hY1mm25Mh0+8fTeYSs4MMp+uG+uvLf76VMXiyebdYarPKznpptFueO2OZCzkVhzssf/mZ2f1fTyT2+Gh8uhaLSqYY4x3GU3GRN6RxnVUA3Lt+yPl0JGZoxgGD0+BxfhLxuTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk2bXbVa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk2bXbVa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d366e5f2so76870145ad.1;
        Wed, 02 Jul 2025 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751524751; x=1752129551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oe+sWEVso78SOxLLY6tg5bL9bv3313gukS23cYuxM6s=;
        b=jk2bXbVaXkcaIjeXpiy0axaoZfl5rHlbyVyWiY68md9M9zC6mTTD/U5ya3PXJAcE7L
         yTqqdpkbEP6J6PytBabVOYYrgWs3hszf4ZbnKE0Qa+OpSovlYWBsh+2Vi9KfF4UBAtre
         caC3TIiD3Rp2pq/h7I2qOXB8aZq9tM98BCdAZPXfMg6gc3c8CAZP5D3ExTnn4gQ5329S
         iFXVFBZtcmjN5BkgDLQHK75FuTtPaqrmPs5jAqSmvPnrAJh30NBMbm/9tZ+Ke8fYGwJZ
         6UB+yHIsuNSGOqkzJpMW8XD39RksoRssXc0JmWHOcMpO14GU1OFHrD/YNM4kAq9gS+U5
         gfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751524751; x=1752129551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe+sWEVso78SOxLLY6tg5bL9bv3313gukS23cYuxM6s=;
        b=PvgdMwkHSnU9LYBVmuOIhmXk1pCkPkFAiQzqrP/W13Bn6t/SK1ly7frVBKSZjWdu8K
         CZK2MWGJthqKi9nvKTT59zRzXCKdw1QHh89RN9j+qodym/Kuie7uIiBa+eW1OWMYki6P
         qHmfTKcLIF7NSpjvdCKFwj4L5f6P3NPx6PYKw39svFH+txDxvxUL9F80PWYGaTPsMDGe
         MqFZApeny6N2IW7S0/xgsPFMTbAqdBMmGrR70HRFzgl7TqhmwPXmpMVOIL0HOUy0kLNH
         dS+2xSQB/JApP/JkqoAfZSV73bB4ZJJL07SKmXmFJHYJBgYBeKbZweht43jSdiwABVVo
         b1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbhTdP2pl6UahWEqKUyBj8VB1WUhaPto6FZR8BxnhbiRRSV9c+72+4WApoCU3vU1VYCo4K8EOSNA0d+/Z0@vger.kernel.org, AJvYcCUzjLiTCnIzyJk6g8EVIApFdzmalsCwHb6vKXS9AXu7ZV4gGJrY6O9WRCIvU6M9cM/idkVvXMU89V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjjnEu8K95tKfa1pvVHPfnz89vCYc/I8W4KZv07mA/xMcGY+oj
	VE8p3EQ2KpCrHzVplB2b4l79bjd3w0W9dqkNp7ir/uBYculhDGAzF/dy
X-Gm-Gg: ASbGnctckO13lXfWvanHNlMODaq0X/eH2NsE2+oJKNf4PrBIXMXLNiGIdRk6SZFa54i
	3LAi1DO1ns3/TW0VD/JdhoiS5ASdpG5yJDwuU/2zKXNGmlXHUKTaWHY2w0ovBGVa7Bq81MUrYbe
	XN+KjuKyAnkdSceT6M7vkaGujom7vetV5F18rkKrRV8Y5Xc5gYmEoAYiKkFjb9YqwJi/GzKVuLM
	5NUQU5KEfUKatqnXFQ2hvjiMGniwN08/3xvQ28yLHSwkROwIa2wkvVFHEqssIDGcWsJycyEktE4
	rlqrUsmsCphqitdsUdnrhczOsBrL+Y3FcUiz6aEjbW3gRZP8pFF4tWnP6CbCoZzfA/sdJq22Zk6
	NjlP+
X-Google-Smtp-Source: AGHT+IE52Vh8mTBpEzFRFmD3tRCf4ApeWmHGWRSXRnc/d9d2YfMquOFtkCbdIY9Rr9RikCAKQ1gXhQ==
X-Received: by 2002:a17:902:f690:b0:234:db06:ac0 with SMTP id d9443c01a7336-23c6e5caf64mr83737185ad.45.1751524751175;
        Wed, 02 Jul 2025 23:39:11 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c8b81sm141081965ad.242.2025.07.02.23.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 23:39:10 -0700 (PDT)
Message-ID: <9f89f8fe-8182-4d45-858f-3c2564e828ac@gmail.com>
Date: Thu, 3 Jul 2025 13:39:04 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Randy Dunlap <rdunlap@infradead.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <aGX30ATQaD2EjWwW@archie.me>
 <194f16f5-4e26-460f-ae4c-8a5f93088fae@infradead.org>
 <70ef2227-55ac-482b-9bcc-df1fd847abd9@gmail.com>
 <e4bea8cb-1367-45ab-aae8-e29efbdbd082@infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <e4bea8cb-1367-45ab-aae8-e29efbdbd082@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 13:06, Randy Dunlap wrote:
> 
> 
> On 7/2/25 10:48 PM, Bagas Sanjaya wrote:
>> I did quote the whole diff to provide review context...
>>
> 
> If you had commented on any specific lines in the patch, then that would
> be necessary. Even if you were commenting on only a few lines of the patch,
> most of the patch lines could be snipped out.
> 
> The Subject: gives us the review context. It's pointless & annoying to other readers
> to have to scroll down thru an 847-line patch to see any kind of Tagged-by: reply.

Thanks for the tip!

-- 
An old man doll... just what I always wanted! - Clara
