Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195BA2749E7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422824; cv=none; b=SGq8kOLrpQHQh4lQj6BlGReDRmeZEtFa3MSQE5A2E+HUYYqJ6g7i0repVwc4rnByWVI0dpTOKBGE4bRQyacOgKPNdqiL57EW9gXyInmwdk9BzDi7rsFvTiBhW2CqQXyEJzlo/eyta/YEH5TQPyv7jaxlQlk6eYfSN3wi0hHZ9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422824; c=relaxed/simple;
	bh=t1e/HvfosFpsLoFkhIGG8ncpvv+6aZviJ2nKgmWiOW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwnDxF03nWchpmqqGZv20SKFkG2hMToFg91xcMju8keIpUHgcpt+hQIoEkIamnIp6NzoksIHurFCfuQ0rMokMCO6FgczZamzvqn/hAe5+yuMb0Rs2PjdKnfgtNg8SOe+9SVAVQkdVW4TQAd0j8OQzsbDiiuO5p7J3tOsa6t10Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2fmwfCT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2fmwfCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748422822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64QsXwazpQwW+tOYOMo7hDdSauBGVg6nC6ZKTpmi0VI=;
	b=K2fmwfCTDs4dGc61cpflZabEFOjCWO6oam0nm+IY1Lvbu4lzezAithrhmsp2vOKWGMMiBJ
	UAcOhUN6o7hSsJ/3z4jDSmQVHpgbwJd+W4wiTQy9xXxlKpWMG9aSxVq2vP1DXNLWggV3l+
	CVn4NCFhicR0swLEFFd3vemDGlKeLVA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-zq31eJI9M1y50WE8YFheuw-1; Wed, 28 May 2025 05:00:20 -0400
X-MC-Unique: zq31eJI9M1y50WE8YFheuw-1
X-Mimecast-MFC-AGG-ID: zq31eJI9M1y50WE8YFheuw_1748422819
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so2463405f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422819; x=1749027619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64QsXwazpQwW+tOYOMo7hDdSauBGVg6nC6ZKTpmi0VI=;
        b=LpnEvf9VXKi8dWURItagPglfLpISHG4AQwQZIYqrN3TVi6aBcgXejgfNMDfuQEzsL2
         54Of/+QIa35V7JVJdyKLhrIUKs7MLjVZwb9HTtBnzq3oLSiawEemKMLzl44DsOUm1E6r
         44JcprAnsq6aEqOBeMaSqibDkh0E+wX7x73OWoWiFjO/jNyYEgYHOjWO7V5KLvBiW0xH
         bQoynO5Lgl7yd+xfLSh/G+3nDIEOOXh3oXiRzN5V20z9BkKf6gSkOLH5MGpr0b/8ZfeC
         npfBogIx0L0XbnSuufQJeRfNkVrtyvRek0Pc8AEW+QMQCyZ72KjxGlkIzWJXdjPFqEr1
         CNvA==
X-Forwarded-Encrypted: i=1; AJvYcCVlF20E6HrGfLMHXy0osKCJfE11dJN4ZA+3+IDRul/TDbAC0bZHcXzm8qNNd8nOsyVMH/KhEt6LhtY9Sjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nieCquecTN72rmLIVbnxvK15k9aPijGC93wm2WaQDdYHCrTY
	cGNs3USoIKBkt2z2TNDZeuZVK4xgmiEF5hEsTcUi0Vnxu9tq1hePh6wM08dwdwG15qqd9OpenF/
	qsRocShs88KUydGSdtV6dV1H4IndiA5EaSAq5Y1B/8dBLMe78Yjb4KtlhYYJfSLYReg==
X-Gm-Gg: ASbGncvrTrqTGRHXvZjSAqILH7tZHqrDyRzae+iMouGBQFHo+x6tg7JNtfStn7ZrzyZ
	/JSCoUMzSXaYR8XCarHSqhiTxK3p4d6kRSsOTdzl3X1Oj2LxMrfQ8hSVWDmtdtg4k5tv8n5jPtw
	dhFRpfsJh5/Us20wGzSTBmwLXwoFER7HU41bJbGihxO1E//cn7cIP9IyVeEHeBjp4NH30oHro02
	3SfSRrYADDjzFUDMmTNe9+g99lTY8kuAac0Vx/sIyOx24NAWglxcdgQHtyBpm5pxzgKTDQ0nQSk
	NRrNDEzVR6FyPwRMu9d0t2RAioqZwZXTFMEEql6PYW3wy9xS+j8/PyTEuJJ2
X-Received: by 2002:a5d:5f8b:0:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a4cb4b822dmr12928267f8f.41.1748422818883;
        Wed, 28 May 2025 02:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrV5vgUL5ysXDl7B3oxB4ovG+UqKk+QHfVQ+EndsK3P47vCbb2duzqpq4xfTjaqx9Sg54xQ==
X-Received: by 2002:a5d:5f8b:0:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a4cb4b822dmr12928217f8f.41.1748422818345;
        Wed, 28 May 2025 02:00:18 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eab0b596sm892079f8f.0.2025.05.28.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:00:17 -0700 (PDT)
Date: Wed, 28 May 2025 11:00:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, jarkko@kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, peterhuewe@gmx.de, jgg@ziepe.ca, linux-integrity@vger.kernel.org, 
	Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v10 4/5] tpm: Add a driver for Loongson TPM device
Message-ID: <gymx5tbghi55gm76ydtuzzd6r522expft36twwtvpkbgcl266a@zelnthnhu7kq>
References: <20250528065944.4511-1-zhaoqunqin@loongson.cn>
 <20250528065944.4511-5-zhaoqunqin@loongson.cn>
 <7ifsmhpubkedbiivcnfrxlrhriti5ksb4lbgrdwhwfxtp5ledc@z2jf6sz4vdgd>
 <afaeb91a-afb4-428a-2c17-3ea5f098da22@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afaeb91a-afb4-428a-2c17-3ea5f098da22@loongson.cn>

On Wed, May 28, 2025 at 04:42:05PM +0800, Qunqin Zhao wrote:
>
>在 2025/5/28 下午3:57, Stefano Garzarella 写道:
>>>+    chip = tpmm_chip_alloc(dev, &tpm_loongson_ops);
>>>+    if (IS_ERR(chip))
>>>+        return PTR_ERR(chip);
>>>+    chip->flags = TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_IRQ;
>>
>>Why setting TPM_CHIP_FLAG_IRQ?
>
>When tpm_engine completes  TPM_CC* command,
>
>the hardware will indeed trigger an interrupt to the kernel.

IIUC that is hidden by loongson_se_send_engine_cmd(), that for this 
driver is completely synchronous, no?

>
>>
>>IIUC this driver is similar to ftpm and svsm where the send is 
>>synchronous so having .status, .cancel, etc. set to 0 should be 
>>enough to call .recv() just after send() in tpm_try_transmit(). See 
>>commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} 
>>opt")
>The send callback would wait until the TPM_CC* command complete. We 
>don't need a poll.

Right, that's what I was saying too, send() is synchronous (as in ftpm 
and svsm). The polling in tpm_try_transmit() is already skipped since we 
are setting .status = 0, .req_complete_mask = 0, .req_complete_val = 0, 
etc. so IMHO this is exactly the same of ftpm and svsm, so we don't need 
to set TPM_CHIP_FLAG_IRQ.

Thanks,
Stefano

