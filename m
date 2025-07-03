Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611572E3AEA;
	Thu,  3 Jul 2025 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538332; cv=none; b=WwgjYBemLENA0sj3X7prylJLY8uYo2dkJyqVu7UERuQ2wub+GpFEj/iy9pBodpWIismqxjuxfi6/VAwKLCHCwO4qck/GEwzsrZOHf3iWL1VL4nTv0uaRdtFav45vRLDdtgVXSv7e9A1q4yFRfLlhS+9UfRX2a4bt38B8sb/JcYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538332; c=relaxed/simple;
	bh=QHuNI1J0mocagzipGR5aQ4IGSr0R96zNPV5QRZknJuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlJelYwS1uQSTvXtJxfbBbhTya4kkGsGVW0TeORhRtwsJIIO/VFOWcF1gTiUlKG3mtDtY6XScsxI9blOQuSu8PmU3TPnnMo9JJbXZnTyfdWOkByp0oe3697Y8JGrwcrKQiujckaEBS6crRxQt8zW2Tz9C6KJYfs/E0Ap4ZAnJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArY5ktzf; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArY5ktzf"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747e41d5469so6036388b3a.3;
        Thu, 03 Jul 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538330; x=1752143130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXUjD7MfImAQZU8+JU7QOVIdG7kZgmgU1R+Tfu+SNUU=;
        b=ArY5ktzfYKV1Nr6ZYoRfWjCeaZm+nsrrPiIIziTzGEnyAM3ZwfUhbeG4HNoda248vJ
         iusC1U0sDNBO2BSymbKLS8wEfZX2uYtSGWfQmIxYoJrsdb0eMNR4hb/e4Qjc69FNxlFG
         J5vatpZkba5DOSP05NBs2fFH26gR6hR1BcVvP7/rEzEMaNiiYsV1NykBsVnQcVhPeNVf
         ph92VK9HwhM/T1KHPPHCslGZCPQmqi6JSAIe7uHviQpxuWDvdZqxY3tBn542uNof03TL
         mFvWRTn6CUWs1s1qv2gflfffQCtD9JoUdMavtwFjVNlLryrBsDOaEVW+k/NlvQ8LypxR
         88pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538330; x=1752143130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXUjD7MfImAQZU8+JU7QOVIdG7kZgmgU1R+Tfu+SNUU=;
        b=olGkSmWLzSEilumvMuXClGxjQm9Zv9zd96WrJeY+kDK6IcZ5bEDeOp79c1p8WdDrmP
         NMfNTdFPTSTPSYQF7KpFHWnGmLZBv/PsZxhmt5PSxo9HhyGvfjV9pTFCMIvNZesmLlq6
         Tju7tVp8kFR4dthFakIcPQnOrZ3f1190hWRq+wxLNmUnYPMR2+M52Tob6zg4QlWkV11F
         06hQMhE+GoBcATPnhtrdueVwHXcjTACm4qwHo4jiQN/I8N0Qzfhh/Cod00qRYaUenbfk
         0wZ5JsKcPCkiPQIvl2omrSji2J9uYtMOVKILh6nKufb1vadfPvyIGLB8mrW5MK/h4KHa
         +aGA==
X-Forwarded-Encrypted: i=1; AJvYcCWKZrE1y5kg18XsOWviL4AhtknOykQIrJLwnxs/s7gJPRaBU2y6iXzcm3d8PYXbHp2p4hUuAYfiBr/y@vger.kernel.org
X-Gm-Message-State: AOJu0YyApuvdKgy8wh/WFQg+1y7FmENQLBkvTnUnq4g6TmigvRFxzqIz
	hgQJY7F8eovnuqNml9VaBhL8xa11Ok16XUNn5fWEabIufpow85jES1cg
X-Gm-Gg: ASbGncsqNxIaBBeIocW7e3bt/VDvRg8uC3ltyqWjBpsx6H8iqMcRTTcS9/xa5wC7iXb
	X1IGZ0cPdqm9nju2zLZScUqp+PM5Nz5Y0WT9MgMs9BDgvzWefEkbxWhOcqahR0trVW5TseGHjux
	IkLyYDHZSYskirYgjA58cXX+YMHlc1EmHCM2KX+biK+ukO9RQ0MufUQpCrxfLgaXqCc2Y2usUpP
	8nMWzx4PCil14rfnjuz8NOAjs9lBypIrZyQXLLBqfIm5sQl8BGewZkDAcNQoS889GUJHI6I4gXu
	/FodkvsGsK8qb8hbIRSJmDPoG5kQL4WOiem6YMSziYIxlalqinWMMfjQlWkVNU70HEL9RJf9
X-Google-Smtp-Source: AGHT+IHzz3RRYRWu26js5qfVZF7wwD2MorMUcc2Nqsg/oVzDHjgNVbsweN57uB23YZEzDzkG8THccA==
X-Received: by 2002:a05:6a00:3c89:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74b5131899cmr8373208b3a.7.1751538330427;
        Thu, 03 Jul 2025 03:25:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af558914dsm17503280b3a.78.2025.07.03.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:25:30 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:25:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: Question for CV1800 mailbox users series SoC
Message-ID: <pfe2tzvujcfogxnj6uvnjaicktl5ifcj3rhw6d5nyq77cyhzlc@uonejrloi66h>
References: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>

On Thu, Jul 03, 2025 at 06:21:38PM +0800, Inochi Amaoto wrote:
> As I have seen you take the mailbox driver for CV1800, I wonder
> if you have developed the driver for the 8051 core on the CV1800
> system? 
> 
> Regards,
> Inochi

Please ignore this, I have forgot to remove peoples when replying.

Regards,
Inochi
