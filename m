Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE39154423
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724603; cv=none; b=osDgfvYoSj0Rj0EO0dwVm8dptSTk01pFZgvljbD6bd6/OHI+tza6zkuL27Qfn3m6CG9vXFdt3cgHEh23ubIQ6E5i5fjiX4b1KP83KArN49VBQx7b0ATTaOB0+E8+ekwNDmpVQzNa3Ic2U84wX7gQWxm0G/GL/AOTXNJh8LjMFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724603; c=relaxed/simple;
	bh=Kr1AFDD5BTer6jIrOh1jS8j+MJa8b+J/by2OIVffdRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+gWN4nnfNDNHu5QnD8nZqt1pqGR7R6Qr+9+jiefbEuRDgD2OPlqZ4QrS5S8stK8A6reDArKt+DG8hbs2flqJSFrWUFviSj4QPOeIyBD9IKoQIHwhcHUx2n0n++Ea3BepE6MF/NI6DeazqiecMdm8Do/5y67tLBVLYTGlTrXYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alAQXHpm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alAQXHpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744724600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
	b=alAQXHpm6q7vB3vlrIfi04Cz5+LYp0S/EVncI2bIVPU02L8MlVrt4UAhk27E4JKMAPwxhs
	6k+TDMoYps2stPdSVulH2BIBBxRElsqlYNBks5jxWsY+nbBmdDt/43w6C4hAqr9iHdDu8Z
	zpZSilMmlt9BXbVOnIz9+RGhK+yQxNk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-EKGW2kt5MoSMGGPwUlVt9A-1; Tue, 15 Apr 2025 09:43:19 -0400
X-MC-Unique: EKGW2kt5MoSMGGPwUlVt9A-1
X-Mimecast-MFC-AGG-ID: EKGW2kt5MoSMGGPwUlVt9A_1744724598
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so3771014f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724598; x=1745329398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
        b=SLCVbOeRTMjj9XENBBpd9Qrx0deOXGQR9s2/oPEnVSjmJWXqHseArX0t5LnAH7uyMc
         s/pCBi8xVoq2Fi4P0qEW73RrRUZwV5hvtbjyz8GVzJZ8b7hB7r/msGADu1b8d8uteZVI
         z5jnuPYYxxoX8jJN6/5VmY7xpi397DXBTqDe9NbHQJ5i2t0OYRuJniuccEj2TJzxQWWv
         KFTZXnlCmF/lDkV3okk/Nj9w7BXbTLzILYi6udO9f+FVU9PSsd2AWkxxe8pkmPxtan9W
         N6MuviBZqEuZWeukGxIbEIpR3E+r3IH3OIsBuyWIv9TWNeGU8gvevh136BTg2XJUsRIq
         gzJA==
X-Forwarded-Encrypted: i=1; AJvYcCU9OYTP0MwHddrdRtl2biHcBPrqd5aveEka6tYQ53hwQGD2SbvXStRm+0KufWRgDS8hsE/Wew0TfxRU+yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrWCACYqZFQo/FT+F+9iki0iF88aqoyZbkzmVMnN2trhZOk8k
	Jkj9eC7vVxp3uzIw6meUE06Xn5PMJlatk6N1IlPq+EQHbTtCUNRgh/h41s0JYqfFGKxySybIc6n
	pzEraorCpHhKql8TVlZ+YJIcvBwBreNlVcBMo3RWcdCUrXyU8X43wuPbAQ/0Dhw==
X-Gm-Gg: ASbGncvY1ftHJ3zvVzdn458Yp+V+s0MBR6GPj9jOiT7sv4iYspAI6fQUubOp9mk+trq
	DvdgUsp9zAlJQDoOxv9LhlMGDiXuWBMb39vfYggSxnf+xXOrM+RhdrxN8aeV14A8ubYJPtqja76
	R8YpBCQcWerB71Dteb/qzrVmpZpfCqm219lqqZ/jV9YK7TfyQUrAv38vhDRzSuzxhRgFlfBaOdU
	pZwuAaQ9RMvWT5yqR+/3KWhHPz4EpDNMh9aIiS4jzyPbZoyKYW4aBS2PAS34hGa06BScdFdjLul
	ImVaWI1OyPRr+TvU+Q/NzBaPv+SYrEYna8gRyjA=
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282369f8f.33.1744724597995;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0JyZk7iu1Ps9aWjZNEP8lEOiYdz+v1T/ibFseJb/dw7p9p9LOXvKaUssvdPPF8RDwWIrTgw==
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282344f8f.33.1744724597586;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c02esm14065754f8f.23.2025.04.15.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Message-ID: <4ffd3630-bc75-47db-b63c-3dcb7af8249c@redhat.com>
Date: Tue, 15 Apr 2025 15:43:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table()
 hooks to enetc_si_ops
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-7-wei.fang@nxp.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250411095752.3072696-7-wei.fang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 11:57 AM, Wei Fang wrote:
> Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
> different from LS1028A ENETC (v1). In order to reuse some functions
> related to the RSS table, so add .get_rss_table() and .set_rss_table()
> hooks to enetc_si_ops.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> v5 changes:
> Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in both
> enetc v1 and v4 drivers

Note for the reviewers: this changelog actually applies to the next
(07/14) patch.

/P

