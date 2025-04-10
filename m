Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC11E1E00
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280627; cv=none; b=UfNoKA+iEMWNzmHu0g6B8TKov5jAXg8l7SHfg2eTe+TQtVBIgtE3obLUP/4tTZX8wZW6zEVc506Tte3ucB8gtJJMm6QWpg1Q28ejlUwuNzKdPWgC0gQKlDdlgCh/jNnJw1NaZsE4JM3W0035FG+OVDUGmK4eoveaZZeszvoH8so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280627; c=relaxed/simple;
	bh=OfuCOFKjvMskfnz1F4XFE/u3fByc20wvO3rC2eyS2l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdAB0H5ftB6fjoJ+QulY/h93pNA26okxbIZG9Meg323nFh7O89dFFHGxASKTPfOUcLFQlOqIGU7H4Hrb86rvYbwJEnRHt0te6hGxTWttZKhKK1lHWq+AgYgi6A3oiY0tSjLUB/VppqEmZsCm3gZlje17v44bheVds5smFZRBV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNJOCEez; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNJOCEez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744280624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfuCOFKjvMskfnz1F4XFE/u3fByc20wvO3rC2eyS2l8=;
	b=LNJOCEezNXPLIHVGgBo3jzS5/MEgDnHHfCMarbzwLI0XldBQ4rj/Bdl3aATEZzXHIoIZ89
	pb8BHk2bUV1kSJ7iFobyakc3IbVmfW5aRNaKNYLMTIo4LFgRW3t8/pSupvXO2Np1krgsoT
	ywPERax/Axk73A8WbnGYKY8JY/T6Pnk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-HsYIMb8QMWKatUqcykx9-Q-1; Thu, 10 Apr 2025 06:23:43 -0400
X-MC-Unique: HsYIMb8QMWKatUqcykx9-Q-1
X-Mimecast-MFC-AGG-ID: HsYIMb8QMWKatUqcykx9-Q_1744280622
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c2da64df9so331872f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280622; x=1744885422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfuCOFKjvMskfnz1F4XFE/u3fByc20wvO3rC2eyS2l8=;
        b=jN5q9w2wPzEsN7nFgNwjgiMNs0iVSb6paTJbIsnzb74/+D3OtMUxhXCL7A8Aff+ttP
         FYskkPx01rRk3uriQDeVMo3OvcnezASejZSAfxGTv3tWIgg7FUKfcLClCiNyjD3mMk2A
         QpVprsDjukEZY0d2S4ufyihDaf7NLIISot63m3XM5F5XVdMcPoAl8bl+UBHny0ywQ9eN
         jjlzBbMNbGVjSGv15+GCbW4HmDmKjrYs1wofM0cuG3y+TWVG/HR6A+xxwFvGiGIGcY5X
         WDYBSMtVFWTAEmnu7vCVg2poifgxgnmhz0on1KW2zz45UQOsP/Wq3Tdu4ohiALAG1IVp
         +t/w==
X-Gm-Message-State: AOJu0Yx6QbBwVEVkSH0TVSl4bzQHYyuuSciCoxdSI0A1nLI3o+DTeyMB
	A/ePREv/bgXWTmbWu6rjgwzlcC2oPo0Qk3qg2+ruTWo+d2JP69cr5aDPOZ2PJJ8UpNpQ3Y6G9o3
	t125zn3BzVTiugUx7gEq7sbV34TOZyx8rQyPZzSZZ+cgUYZjiG6ANXV+K5a40pg==
X-Gm-Gg: ASbGncvGt6M+SfuoiBAr3kTt9h8xXIINxp5bsILF4SfZFCaXUhuXdjjpkF6FIjUoo7M
	pGtVHPhSngCZ2IkPFBFEna5Ujefbs/l70MmwsUzehO/aaLzFHj/ZW+LFCN9WgHQKmgju4LYXmey
	V+rnCBRfwFj0Ye5EUD5QLZKZf5w55eGCsbr+KF2BjgCSLYJGDDatzREgtHk/zxcGdOVgfUqgUBg
	wdmjV5+AWd7cgpIZYgVbBEpJyRYhD57GhRc0/5BAudHN4q5HZQrjO7XwzrfAShfdNKzEY4jFUlg
	PL1Zwsi7QuZ0Ae2mD5TcahnLGtuaU32majtjAsg=
X-Received: by 2002:a5d:59a4:0:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-39d8f271ff3mr1349577f8f.9.1744280622406;
        Thu, 10 Apr 2025 03:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlGK+RDA8sZsXCeD/oZHDHITnRrGJZDpmPkdubQYhIgKQAR+h2AH1WJpCXG8zaPEaVZ56PZA==
X-Received: by 2002:a5d:59a4:0:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-39d8f271ff3mr1349564f8f.9.1744280622098;
        Thu, 10 Apr 2025 03:23:42 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c46sm46370505e9.13.2025.04.10.03.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:23:41 -0700 (PDT)
Message-ID: <2c779583-bac7-43fe-80db-0dc0bca2e0d2@redhat.com>
Date: Thu, 10 Apr 2025 12:23:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ptp: ocp: add irig and dcf NULL-check in
 __handle_signal functions
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
 vadim.fedorenko@linux.dev, richardcochran@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250409092446.64202-1-maimon.sagi@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250409092446.64202-1-maimon.sagi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/25 11:24 AM, Sagi Maimon wrote:
> In __handle_signal_outputs and __handle_signal_inputs add
> irig and dcf NULL-check

You need to expand a little the commit message. Is the NULL ptr
dereference actually possible? How? or this is just defensive programming?

If there is a real NULL ptr dereference this need a suitable Fixes tag.

And you should specify the target tree in the subj prefix.

You can retain the collected ack when resubmitting.

Thanks,

Paolo

