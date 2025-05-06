Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2B208CA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539273; cv=none; b=K38AvpLVaaNNTivZ4xRIjirOCZN2++tj0X/ZkeKTmp8K6Q84KodDq8DG3LEe3i8SqMsXntzgAPTj8psaIz/QsBgC9MPDcEPVy86+W8aG98SiRHr5QIMX4mspUDUza7rc4nPiurLmSDx83ps7BSrCox2nNFU7g/TC93CNkDKMvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539273; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suQVs5LQCFi5xxiJm0AslTzr4o5+DWU3oCTsEyZUzMLoYulU05+MACu9o5wMFtm/2Y4oxwxIMuiiE16bcwNHaRlmWgPKmp+NKLd9TCsz9usMoyqY6og7GXWjO8JrfzEriDJbkjZ8RC8ptnq9z+vfFIe9cBBBHrzOpotTf8CHZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee651e419so2998438f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539270; x=1747144070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=IxvNF84yHQrxOtUXBdE5noyvFEyEpo9bbuwe1bVdxzU6AM3hzXCHrc0pOhhrCunQD8
         lXujXeR3y83icVOPHcprf2fOHD2PnuVYxHnMMlr8rgAvLag9mxRy2EkTCqd+mOS7kCLM
         tffU+3geIv/CM7Zw9ybrWATvqvCcYFrXUKhAs8xuiGfjFpHOl2rffWtEa2q2vg/hiHg3
         SHE4zxYYHk31ggAt58MgYwj6cGS11snrvzgrVzsrJjJDO5yudd5ds7onPKn9XfESS9JR
         OnPpo+0/eRQf5VIBzimV0Q6c5CI/1FuOWxhaMUtT84ZBE9mOeOreWItg0FMGQFmVQrx4
         ZWKw==
X-Forwarded-Encrypted: i=1; AJvYcCVGetHsTpcxkE/z4De8FMX2UUHHA83AV6Y7Eur9TfRw34Z16Jt1ZcfGykbcIsB88fQTN9beIfjY5kkOUx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15m7+DTf/QHJJCrp5zSWlBmu/kkCKExrZLMTuH7V+mIRkJBMB
	zhikguRObyAIN1IhJ2Uq3sDB8YaEttu+5rDwsL1oYEKVbj9o1nrM
X-Gm-Gg: ASbGncugkxnoxALjOPWcylIDRp2Qarl+OU1c6bspdGWrgZIEdxYx3F9kUjVpdcIw+bo
	o+YP0FaKbwUXRTawtBbqGgepPew+dJW4TVLJkcAjx763rcqMQhncnLnT3Vw+NkGugW9kYcI3p++
	PBr8rkR+FcvbnzKETQzf2bN7N63iHWyg8DtxxVxXBdqLQD6RBXx8yjm4zr8oCVW8Zs4hwZcf0XZ
	Uwr9MJucv7Gu28YYetd9oZpfkSsou2jb3BukfPZXGHfmeroI+1/6F0n5xMF7O+K2R7mtbZdCbm1
	1liSEcErctmKdbJY+ykmWESR8JXMkee8j9pJwkoJeuiXA5Z7jeq8GT5HlmhRKvAyDyJ/a80qSfA
	cqThlZQ==
X-Google-Smtp-Source: AGHT+IFOJX6YlxnVrgxMK8YmYZahdnlE/xA2AQBbvJYVkjv0CgZMaoGxv+/f07H81htlVd0umQiS6Q==
X-Received: by 2002:a05:6000:420f:b0:3a0:7139:d178 with SMTP id ffacd0b85a97d-3a099aef9c0mr12596257f8f.51.1746539270462;
        Tue, 06 May 2025 06:47:50 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3c1fsm13873104f8f.37.2025.05.06.06.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 06:47:50 -0700 (PDT)
Message-ID: <b31b1bd7-c18b-4d97-8888-f145fa07a809@grimberg.me>
Date: Tue, 6 May 2025 16:47:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: unblock ctrl state transition for firmware update
To: Daniel Wagner <wagi@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
References: <20250502-nvme-fix-fw-update-v1-1-cd7a9f3031f7@kernel.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250502-nvme-fix-fw-update-v1-1-cd7a9f3031f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
