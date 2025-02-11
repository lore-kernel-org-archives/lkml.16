Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171861EDA20
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263212; cv=none; b=jPV7w7pBnWNTdpGHoAmnj0HZlUCC715HLpwq2HrZZWetadJwd5gN6maX/HmWEGELCjPZ3QlntpDDW1FSmfWJRphrygIZacimVOMpPO1UYXucloKWeRaojU7Q/HIRFP/yKsNaQJJ1kvcf629HyjfHOu1JXRnS/FJw1kR/4Rt2dAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263212; c=relaxed/simple;
	bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E95JB0lyuzmq+ILxDhjL9kpOv/I8HuVqCtosVQ+joccoOLmyFQWvhVXiMadtDtAFt7mVALZlKHHaU/0yzQH5tZqQEMjzpfavL09XCFXvblIyJz2zbfiFQZ8OJFr3RbIhM0Zc0rPKJz/tovhGXtZ9tYWQ6w/ADWLyqZjQOwNATLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExeKpU9H; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExeKpU9H"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so5310996a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263209; x=1739868009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
        b=ExeKpU9HTk/wvyEOrC1ZJs0JzlzDxCBvjDobJLkpdp2BpnlRCJs97CIbCn94GDYw9i
         o0hl/yF9OZRJJduwpeV+XmHCJ+qiaS5O8wJns9HQfEcmxbe4qcAzM8zU/GFdjmKCiBj9
         0DIcm09LUiAM2yIFCI9AnFaZf5PL9ma0iixVVKBD5zYRN6cme3tUTAyfM/Ey+HHIaIui
         FiwevtHmOTkM8DK0OwLHGPVHVcUfh0WXfaEghOC6TPgbueqhO+0stmUcfraufQvjqmbJ
         F6X3KuImszdN+lnOlBp5Urjj+fnkUrI6kdtV3f3jIWI3PQ26Hefp233qd34sizOgBoSK
         7i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263209; x=1739868009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLWPkGYLTXZ6KZLjG1uvCkYfzVSGcFtVAE6ajRD+SJ8=;
        b=LPvwwQFC24lrVzz6nse+foWrTufeXOzFAuriK6+hOCK9fc1M/KszOMPleBkBfBw8Rj
         L3gQIZCKu8ghaAaUG5KNhkgdevjPiPVbiJi7Ak6KVAFNobGarQtB9A/G+r3kKSlOkITe
         u01waAv3E14M1yzmhC3NIPcMmVU90ZRalqbvXmautnd0ZyHzxgxf/RbwueuFIYH9YB4Z
         lLs8zq6XDOw0ZCgZEWdEY0rn3OsVH8/c8om0fwtnkJ1qgbLE3k/u0jmN7C3DqIx/5lN5
         l3YxGnyH1I7A73TwepwDj9kO7AJgkcOn2J5E82WGwCXS2BlUEDc+Q0ZXkb/1eclXa2T6
         AWDw==
X-Gm-Message-State: AOJu0Yy/HXj62JmqOo3xP+d3XYFUhgfHACjGoHbwFawvKH4KQ5xZzR7T
	ObS/IZO/o7R757WAEH8nK1keEV1FB76eisSYZgwTJr3lGUBI4cA1qiSEKu5WAWI=
X-Gm-Gg: ASbGncs/oC6A4itooQIKh/ASL7ujjPPOxIephMHe3rv0isLMJDY/jbqvbleENXQbE/k
	iwm4nXFNE3lQ2Ww1ouY6kjSx8UG86OTladSeKhCWceej6vgBAbX3u8mjqiXAKiiH5tw3sGvGqiG
	WTPMQ5i1SM7tszC/cDUUFjSO9vkqnRC/1f8Pr/4PoKb55FbraqBgC21kevr67g3BYXyLhS/skkR
	RfPMnBDVCE0bnU7LN+hN1Vhxm22d57Hz9qN0Zd1KpHURHPjPiHWf5tHfExfcn1vh2GTjYkiePSy
	GSaYcNVUdw7Q35hBthFr4MqJ
X-Google-Smtp-Source: AGHT+IGcNPi3rZA/CTA/KZxJg/KYFxP9+ErymmejAcw4HslSUTPYtftnIqEPAddfpjtGO6oKFni/vQ==
X-Received: by 2002:a17:907:c308:b0:ab7:c6f4:9527 with SMTP id a640c23a62f3a-ab7da33acedmr246065566b.3.1739263209240;
        Tue, 11 Feb 2025 00:40:09 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4aba036sm470650266b.45.2025.02.11.00.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:40:08 -0800 (PST)
Message-ID: <b29042fd-919f-4e57-9ca3-58ead8a8011b@linaro.org>
Date: Tue, 11 Feb 2025 08:40:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
 <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
 <503b7ec9-e0b1-4351-aa34-3089b2055eb9@linaro.org>
 <60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <60c7ed79-c344-4f6a-aefc-d6d45a4d9004@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/10/25 9:23 AM, Krzysztof Kozlowski wrote:
>> I'll replace the open-coded mutex handling with cleanup.h guard(mutex)
>> and scoped_guard(mutex, ...), thanks.
> FYI, Markus is PLONKed so I won't ever see what he writes.

Thanks for the heads up. I don't mind using the scope-based cleanup
mutex helpers, it results is smaller code. And since I already have to
send a v8 because of the kdoc warn, I'll include these as well. I let
0day bot run on my v8, I haven't seen any complains, will publish it
shortly.

Cheers,
ta
