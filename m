Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F127BF7D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322813; cv=none; b=BvHiWWhD6EXATB+WW3fadmzJzwhlnatxF0kXBLcxLv4VkhNNBdELMbM2GpQ6YWvYSCzaMt8GCwwyrS8XoMi7JtZ1EJtwK3OWiwo5k0T4nqkidNpu/x97LOQ6iveVXEn+fnwaAu/d6ntUVDFZMkxvJsw0i9k8R5F/7uyeZCwNiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322813; c=relaxed/simple;
	bh=rwS5Z1QObT2KlW52KPIui4CmpQqEJswXv+WZsP87AQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9HOynQ/jaSaEs8lTersGdWcxqdySvgOM/OposOPdpvg+xQq7pRKen3ca7X+tvW7+Nke1UbsnG/1y+2ms7AiF19KctqiZNTlfHMczIZ/2ffLI2RqyAGbeefyjCW3VrEp+ca6g46+oc7N8+WXBe1ql0SlYaqJgNFCzb6nachHlVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3330995f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322810; x=1745927610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwS5Z1QObT2KlW52KPIui4CmpQqEJswXv+WZsP87AQ4=;
        b=c3dmMJFoVCRcStdNl7jXPOqZwXmh8YCjtZkOH2/Kq5uIwrhO39ww3cVH1jTOoGHU1e
         wNMs3N3wz7WVfX146tADOJgMFOfESY/8q2a8pG+9vmWDHDEd0tI5P7K0tY+KAK4k6C09
         vL5bjenZuT1c0RIhUi7+IvEqc8rEhVzJS0yTecGhYuSDMwpOy5zTnuS60C9LUsRQUbWK
         Dsl8XicIEDH883lRMf9qlJGHLbO5f4q1BwqNxg/Q8JWLXqPWsP2BSfD74NnPePDvx8Th
         AC+j1wZr6CkMUBlQI+ZdTpO+PpD5BJ877r8dWmCB5Lou4vDKb20QNSBru2Cjx7kZqwyi
         65zg==
X-Gm-Message-State: AOJu0YwefUq3Ks2PQLRhbkNwSnaXthSd0FH8TdSbIYG70PRMTgRqOlU2
	kpK4GGB6Uyh/sR3eO5DGXOEWh3QpoGiApfHuQgfUUVAC9jqqJe0e
X-Gm-Gg: ASbGncvN5Z7behFSv6HdmpjgApAGCu0ElHm6i8iSavELix2ukvVN1JiYlYY5bVlZtO0
	OUx5JI0ouwyBr8EGD7OuuiP3AR255bJsOV0DTV0yGMS6DBPM4M4v4kzJW1aXpkhnbgE8ogx249j
	XKxrB5SgxGv2KTi56tx8PYUCIE8dp7MXpw2ljBhSbHjD3+IHLobuj/LDeXUP6fztbDQFIJqNHME
	DSzZvyMIRg7wpVZ4Cll9q27qqINEnPy1LkATe1LDHe34w5qQe6akjc6R+apU9/5rIzNIC0RJZSr
	weuTf6RQz2H86pF10B+9jX3ox+Y9NugL60qSm4hsaSUh1fXGjFnUBPX+/QvmrqHtYegtOzV7ahq
	dkt3t6Q==
X-Google-Smtp-Source: AGHT+IFQPQikS9tfx8dxYSXvYg6ZLPFqwkw3J+2/JqN++g0gt3hZJ1+4QT03fAj2WZJLh9tdl0XEpQ==
X-Received: by 2002:a05:6000:381:b0:39c:30fc:20 with SMTP id ffacd0b85a97d-39efbad7d4cmr12337102f8f.37.1745322810229;
        Tue, 22 Apr 2025 04:53:30 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4f2dsm15135764f8f.95.2025.04.22.04.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:53:29 -0700 (PDT)
Message-ID: <31cd8d05-09ca-46f9-8753-665feaeb7e6b@grimberg.me>
Date: Tue, 22 Apr 2025 14:53:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nvmet: Restrict in-band config files to root
To: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@kernel.org, leitao@debian.org,
 kch@nvidia.com, hch@lst.de, upstream+nvme@sigma-star.at
References: <20250420104726.2963750-1-richard@nod.at>
 <20250420104726.2963750-2-richard@nod.at>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250420104726.2963750-2-richard@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Not sure who uses nvmet outside of root user, but looks fine to me:

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
