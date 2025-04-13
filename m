Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCB17578
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 22:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744582250; cv=none; b=hENU0ds8s0J+xSpmqtpFmIEPYAQZO3yg5EbxZYLAItRxXR/JTpc61X7jRZnq1fAA5WMjAymQxA2apdJvZ8TDGwFsWdckiFy5WgVhNN2jLRdI3YAWSoYV+z3arFUgk1Uuu3FGkcFyV8x1yqzQnrDARzou7tVjwG5yFiDHK2OBnvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744582250; c=relaxed/simple;
	bh=y4Y8GWJgjyJdzkPCuDCjUrgQR4XgPreS0qim9Maq/K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQ+a3J+58btdKjdvWgHtpqXhQkAigpXsy14Hl21tfHS3RIY/6CujMtRBHuVkHxGLmCHojzy16gNuUjhdRednRIbEGDnz2cBvadqQFHrCHzN1zm5qiBSa0Mkq1rnss3GY4Cg8Pa1E0Jw0XG3Sg+SRp2d4H11bk6DHWJQj76QXOQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2971979f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744582247; x=1745187047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4Y8GWJgjyJdzkPCuDCjUrgQR4XgPreS0qim9Maq/K8=;
        b=nzfJWFrwfFww0l69rw5e/D7guMw2cLeEKQpFcnGatLDYYgCa/Fd5bNOwAgTw1VY75d
         d1n2qJkgooGDr0LEmzm4fGbNm62hRAk5aACw1OGQwpPzQXGnXjIpqlT5cydMa25afT7k
         jpoRnajaGpsrz8oGtsJymmQLRgT1c2xIv4DxncUBQEoYgw65Uy11Ui2P+0aAiXUerkRO
         AnPxyg2DAetx4vywh7Y5q7Fi/inOkaTa0HaJrxx+c8jhTIKbSQzksH88Nv6v1wBPMzPD
         NVObDcr5lMSkDQvkdtTpsMKVN3ZrEGLx6OsdUj1xxrSeXa3NMd8QXoLFA6m3LB9qUNgX
         I/+g==
X-Gm-Message-State: AOJu0YwZakhy0LU3p281euwQT9EtXnZVfRRZAkXOhW8iQQHDlSjrRIXm
	9A0y3WGnpeKWuKTyWpst1G/oEw1mvUEc2oW2IAjaZ469jOfCStDR
X-Gm-Gg: ASbGnculXGnQmKCUAXpv4Fpb/co9rJHhZF0vo/tGsMR4YG8U49aq8xT0szPaPbI1aQz
	Ta4tKbkbsCTbpf2/zz6M7sPTtZtQo9pP+++CqRmpml84eaN4hRLjXXbEFwOjKHWitAFlMc4tLLY
	c6JQ8sQeR3k0D6R5eZfJbguWm/W10eDlWcqsrZFp8nyDlgKwInlCOK5+vJIOppGThLcRw5DOc3j
	v8I8Tw4fs8h34OtJ4sBXEwTRllAkbzLVRj0gY0Yii/hKfvUABxU9YQr9d96THLimimFQAUhMT7s
	vIbA5xTGADCIaie7Qn4R7nHWe521ejIITSFJUsOKlJCPyx60zjyahowNe+hJjCkoBxCcjsW8
X-Google-Smtp-Source: AGHT+IH24PRq6NUwCfTeQZTPsdEVr3P0sCKTm0cIW/re21anWuBU5oMiFZBDgbTEzwBNltlxgjlcIQ==
X-Received: by 2002:a5d:59ad:0:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39e6e45d55dmr7125805f8f.3.1744582246382;
        Sun, 13 Apr 2025 15:10:46 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44572csm9324344f8f.90.2025.04.13.15.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 15:10:46 -0700 (PDT)
Message-ID: <f2596e53-d8c4-4e18-8632-baefc17eb7c5@grimberg.me>
Date: Mon, 14 Apr 2025 01:10:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet-tcp: switch to using the crc32c library
To: Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20250226062841.60688-1-ebiggers@kernel.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250226062841.60688-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Again,

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
