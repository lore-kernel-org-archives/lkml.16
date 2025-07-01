Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4861273D91
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373744; cv=none; b=jGDYlrVXyvXScQdmk7+a+XjMyxMUUi4nfifUGcP3VyQ/w2VonGmlRp3LCRM60jm6YyOCsjUaOM0Xh6eqQCBG5t+KkYeET3vdtNN08x0OHhxdWeCINH6hpShx9KrUGTPtxzUXEtL07N2l3SEcayhzE//34mTQvgPOAmWBhZBsnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373744; c=relaxed/simple;
	bh=J91jMOtn5S/iU+jH4/neCXnUUr4qOjenQaNSHFyZoE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrZ67dSz0H72pqsOVtyA8MFHI1lEBuHOmTl6iIyjJC8Up0mhfecfFfSWZNR76aqcSbdANM6fzXLNQRMAEmf56Oq8dq8LaPXi3lod/9Tf/LdzCowDSAmfRc9JdV75EQ3rwoqXa8lwLxTo2PW9YDYUQRdMRdiHwKb0j/UhGpgPZkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0IeMfI6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0IeMfI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751373741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrdnzuePJ7Xg/Glg6SaL3CaNK9Xu+C89jdkEFr3FdsQ=;
	b=A0IeMfI6xh5nRg42Jp94sx4RueBCnC6Qn9PkqTdGrbCi/ILV1y2tsQXB/qu6Taotl8sZFF
	YvrMtsP5xxzDQNwpd8pzTuDZ8LfCBAL0J+C/8/DbJlRUOVzDcKJDmLhoUdjuXFoy6Upt4a
	mUt9ntVqUzMF3aHVtg8nzIilGYyx7DU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-lYhl9tI0OU2K-Pq3KiuD_Q-1; Tue, 01 Jul 2025 08:42:20 -0400
X-MC-Unique: lYhl9tI0OU2K-Pq3KiuD_Q-1
X-Mimecast-MFC-AGG-ID: lYhl9tI0OU2K-Pq3KiuD_Q_1751373739
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso28128605e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373739; x=1751978539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrdnzuePJ7Xg/Glg6SaL3CaNK9Xu+C89jdkEFr3FdsQ=;
        b=M/ZEjLsbHOu+4yZIzsmliiJNRln4r2YpBYh8HVu5j4SiN4xD1WsVZc1T/HbVanqzE3
         yUPUVWTjBiqsong8Dga8aLE7FW2hjb6PsnJlpiwnfg2mzCH+N+EHmJSNMUyEpR1gylBW
         6XJDsUh21XqDrcV1LMUVGcJ0o9ahVqRSJjaTFFtVqvrXTEdN62dkjL1AxVe0/A+lHWRH
         lRAss5danyGQbC8mTAg+VGQTKeRdiHCDiMuor9utdYRSkQ0W6uQbSrpynoFEKwdSfilG
         I2IOWVEk/gOLL0jBWJv3f+tsm46IBI/qaXy6zps43gvSv20B6bUbunf/fq0NNd/7E9lN
         8wjg==
X-Forwarded-Encrypted: i=1; AJvYcCWWZvKtPVUjHYd8liLYap//ydS/9+yTLz3d+kPWT/+DlzpWKIbnA4ZQNn9WOa+FWRxg2VwRyMnHReeerFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCmwv2FqNmaq5j2e0j8csD8nd4POPDWYhUn0Agm+7RMpT+i3Z
	+zBPaS3PEXmA9+iA5U5IgK7vAGdt3I5psdaKEEioojpf+DbHGwZSKjZTKTv17EE3BGbrqzgNucb
	m31fjkNX0MEzK6zVLDAmMKiKqAXX+v5k+Km1apuJu3FE+T3HSox8RfDKuzTQtJUrysw==
X-Gm-Gg: ASbGncu4NBbMnBXNbKJdX/FANf3mXfjnpNJSfSTDqs5ponWFxn9l7rSOr9ugUtczpfu
	z9eM/ss3hiFURKLKoSJpPMt5x+40Lh8XQ9X90ff/cdZcGpgMsF1BQJzdaypDDveXJ8+h6/xdPza
	jJgGZ/e/Ne+7ff+Vli6Va1szOzYvlrhXH/tSeR6CNTvNROeoMhOlnLxPybRHbkwRVvO/XLOwK1n
	/GQETqcZ1sqw1SI2de5Vg+JgHVWBKG5dv7CrDW8n+TjgaEoUvC3Yh0YRir6S4CGI/y9WJkA3dGQ
	4OdzU39eU4y+xky+EqR4qQXAAQYMYyyZjeNA5ByWjIkjPWpboSBLLyd2rVFd1wPBVkEzsg==
X-Received: by 2002:a05:600c:8882:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-453a78b958dmr25714745e9.2.1751373739253;
        Tue, 01 Jul 2025 05:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ3EnuyE6lLMsRMGUyZPzTD0QSEjG+NpmThvDPouoHgbNQqJi+Gp8Xu2okKPmPYcfeQSwkcw==
X-Received: by 2002:a05:600c:8882:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-453a78b958dmr25714385e9.2.1751373738797;
        Tue, 01 Jul 2025 05:42:18 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247b:5810:4909:7796:7ec9:5af2? ([2a0d:3344:247b:5810:4909:7796:7ec9:5af2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3a96sm194865485e9.35.2025.07.01.05.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:42:18 -0700 (PDT)
Message-ID: <f16bb726-e8ba-4b9f-9657-5860b4f118bf@redhat.com>
Date: Tue, 1 Jul 2025 14:42:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v06 2/8] hinic3: Complete Event Queue interfaces
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <helgaas@kernel.org>,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Meny Yossefi <meny.yossefi@huawei.com>,
 Gur Stavi <gur.stavi@huawei.com>, Lee Trager <lee@trager.us>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Suman Ghosh
 <sumang@marvell.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Joe Damato <jdamato@fastly.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1750937080.git.zhuyikai1@h-partners.com>
 <4695dc0171c0366ef2fb4eb46e7a9738061164cb.1750937080.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <4695dc0171c0366ef2fb4eb46e7a9738061164cb.1750937080.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 8:12 AM, Fan Gong wrote:
>  static void reschedule_eq_handler(struct hinic3_eq *eq)
>  {
> -	struct hinic3_aeqs *aeqs = aeq_to_aeqs(eq);
> +	if (eq->type == HINIC3_AEQ) {
> +		struct hinic3_aeqs *aeqs = aeq_to_aeqs(eq);
>  
> -	queue_work_on(WORK_CPU_UNBOUND, aeqs->workq, &eq->aeq_work);
> +		queue_work_on(WORK_CPU_UNBOUND, aeqs->workq, &eq->aeq_work);
> +	} else {
> +		tasklet_schedule(&eq->ceq_tasklet);

I'm sorry for the late feedback, but tasklets API are deprecated, the
suggested alternative is threaded IRQ.

/P

