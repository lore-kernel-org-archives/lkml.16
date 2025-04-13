Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A82AF10
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 22:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583738; cv=none; b=ARbbNJbgculCz1oT4YSEfTjO27dfPcnjd8Vmk9e1HGPih2jEMqI+XvKFAF9LipbEEBCffrJ5uh4HuZjYHNS0YSPidzTgQQTDoKh/vvsX+HAnjy+YwbHNJXe9yxD3qZGPPuce7i8PBHBYioA1fUBM0ccQDwzSFuz3IPj/6ZTZWAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583738; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqFI8CfJUDbGQkaYpGnqD/ix/xwo0GMXiF16TUJG9EcOap5q7xU4DUbMAkGZ5iarRvpBAC2+grYpiFGV0M1G9PEYDwDgUq/HD2pNQxd+IfVgy/Ey/FfnhwJh5sJ6LpJCHbxzngKgc8ki1LS+ipywJNcohXZ7iIJo2lwV2i98sSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac289147833so745873866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583734; x=1745188534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=leChM06yVaoeXF0PJjvk39JyTh5sdS5fvL7KfujdwXj4Xn61RKzI/Ph/I/Px1RY958
         w5oRVg50BQLLh7seKLlGLwoTI4tFoVS0zQGeIdTzzLGBS06wnJyxMnz3WI5Cvy0AEZdJ
         8r4gdpX8utBk46juen9UQXGYeWv9usczbQChycGy6gPeCjUAbqfCwL4bfrYIgmSERAo1
         DFyaXfgRxNJWreOK95PAo9RkM9swAbOf/tAd4sZitPn5uA28JwfOxzumD/V9yFA+VXpe
         ExtmBBwak98g5RvU3ienCmqMtWS8i5YWwLmVj1FhBdVjKfDbiy7Pxxl+RF25zNnlG9pW
         PXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd81lKadVip0sm9zeemf3OtTHVLYue8ToQOOClPylil0IZkcIeH3Ls6F/K8Eb6V8tgghWh1fpUyvW+7yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJIgrVYm+HTYPuPvQo7DMFcr9KG0HiiWp6MiygDoaXx0oyb6uU
	g7lkvPoqSS2JAcycZ2KowSj9lv+PmxxU7yf5aqTN9JmYhO+Cexmv
X-Gm-Gg: ASbGncsICnn0xtPDYYjfYc1hz0Pbl9GP8DwArYj4/98z2SuCwy69n48TuFTRt4YpqYj
	w656VmOAJcoL08292Vi3n4L6TtV2oKLREh3zdkHWoi7ja1FFLEvbbVHGJ3zxAQInSgY5v2NS4N9
	S88N+7mJ0ek+q3jNZpexHsJI2aBxqmBkNy2ow0d72f3G0apegcVye4n63CjpN52cFTbSYSU3bGb
	L9/OVlS+bn73oyHpOr/jjbvrxXbJ5eFf0DfBL+Rpzzj6SOFfpBIv2xRkw3kHFhFRJTcOrZpqKU/
	eLN/358HP7qp8aYKLRtttMqdEGcV77WXprxuBmjIhKgmceUEqiXaIV/OcI1r/4qosUjN051A
X-Google-Smtp-Source: AGHT+IGoVVpTI4/XlK1SFFy8xTEt/qKGCnntZqcX+NDUOQpOgvv7L/T65tp94jg9yFaZ1tfX/Ym1cw==
X-Received: by 2002:a17:907:3f19:b0:ac4:76e:cdc1 with SMTP id a640c23a62f3a-acad349eb53mr765160566b.21.1744583734452;
        Sun, 13 Apr 2025 15:35:34 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9c0dsm809066366b.61.2025.04.13.15.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 15:35:34 -0700 (PDT)
Message-ID: <98d8909b-9890-4152-98a7-5ea553cb2bb4@grimberg.me>
Date: Mon, 14 Apr 2025 01:35:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: multipath: fix return value of nvme_available_path
To: Uday Shankar <ushankar@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>
References: <20250404-nvme_type-v1-1-920053372832@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250404-nvme_type-v1-1-920053372832@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
