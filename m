Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0841F4CB0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610357; cv=none; b=KGBfLMiyGm5/H4BHBB0WsP9WOKiKUawfAfTY5ITYoiHrpsYCUIz/sDgfo+gmbuvYMDTXsSLU9+s28875DPqm6IGK2OmPaxnxV4vACAnXc6JDo1fKu72s3qxQiNaP+780YBcrqSkgmCRz+ZBi4A1apZzU3Z1kiN9XuL9XyDMlXI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610357; c=relaxed/simple;
	bh=+dcoGM/MPnQ7gR2bwDmEC4W4glqMT6D4Z27/zHMAu6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbnPGWmG9SvZianCQeKXZIIa2ABk5xFoArlYAbCbsQnNW5Oou6ZVIr6V9MFYrrVA0OtCKn7ztizBCZ1zQZYYUxaHCFazj3RPzwO8yaXK6hYKgD1kCjaKvUuzxCfAk/x+nbPRhVEHeZzQb1ZNzZEV/4SP+UrcQUh9mszmQDrC4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EAVaGMkW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EAVaGMkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746610354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89g+uUbAmI4s1rHApPcoGavOskeIK/6Orkxfvy6zQ+0=;
	b=EAVaGMkWRfNyHu+JNCLBg5grhE+9T9x6WnYJIdHxj8mluF+ovs2uLMEqwL/CASWY9SLBn3
	aAevD6ev+hfInM9/1VgWpBq5zUQqZ+iwIB8dBNtpWUI68bNhLore8sRr32WAmm+HpT7LEK
	fMpVbnLQ0c696uD6CAm8LZY6156y0hQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-Qv26vmtvPQOFmP_m5T87Rg-1; Wed, 07 May 2025 05:32:32 -0400
X-MC-Unique: Qv26vmtvPQOFmP_m5T87Rg-1
X-Mimecast-MFC-AGG-ID: Qv26vmtvPQOFmP_m5T87Rg_1746610351
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac25852291cso602274666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610351; x=1747215151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89g+uUbAmI4s1rHApPcoGavOskeIK/6Orkxfvy6zQ+0=;
        b=oa7X8x/1Ie4fiFxNpnI5RbOmejnFD9mGGhg+FoO37uSTocbFeFMlht4kuMMECJUbQe
         Onbe4Tc7FN00SjdbTtJpbnPaOt3kujDi8C2biKSZTcE7q9FVvqCpHzscF7W1yiSu9PFV
         DGKK18jQgNZPny6ehNDeDO5cUufLD1kiHJFb45tbtmvkv9NME1dQUTNCwZLPxdQNZ9C+
         MKmvzc33F8BU5HTUIw41b6gOzUODc5/GM3XgaPijL+f4riGwMgxl/AA3myqaFNWzjLhH
         j9Al0918n5NzEIhetJfCnf9fn7XG+ALhG0/S+6DCLT//BNXrDXA7K+Etq9Lv8hItxVxN
         +soQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOSMfNx6xeROWjl7Ob4hrmbiMxz4tfBHDB07QmUrv9NKqc+x1btKTazlsMUAtcV28vDGswSTKstKpphKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2FtgV/8v80eU2weIeYscchNYs9cVMmGwIZQ4lRPL/8VGpuYO
	wYVLlv8VzXG6oa/oCn4Lj2WT40Dvm4thCA5wCRAgrW/1RCbVqHoy8mHIKWk2VUaRiUFIKDfwKyF
	RVl640+s7RWGhbesK1Mb5wOizPV+A3K0szBi535L08K9Et5kGxFvvl2Dcdo55Qw==
X-Gm-Gg: ASbGnctdKIYWN6lsqyrmn9J5jOGBTav7DixPvcRaKEjxjklO0A0Kh0oLiwGJXFfX5l0
	wXgjxrOcFtZdpjxX/c1yPJYAuDvRm/l56v1x68fTwq9pdkdwBS8QYAaF9a4laSqY26fv63lrBwK
	oARmE01kahbTvCe2sFttTUP9/Mb4HAhABKtMK32V5enL2Lubprt19xooaa0eTRk3gX1uXrZJwTK
	hpcUGwsRevUe7gxijIwqHWDB0I7k7eHI8XHeIeTKPE4Wl3gOPESliDbFWQp+AI3H76+fRzzUDN4
	YuO23nYt6UyDVf5K
X-Received: by 2002:a17:906:d54d:b0:aca:9615:3c90 with SMTP id a640c23a62f3a-ad1e8d0ba2bmr267000866b.52.1746610350919;
        Wed, 07 May 2025 02:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB9GITuMuYoSYN8HyavQFo2/J56H0NB7QS0JaWBQv+IFH3p+ygglDzNeMYFn+SDDKrajLukA==
X-Received: by 2002:a17:906:d54d:b0:aca:9615:3c90 with SMTP id a640c23a62f3a-ad1e8d0ba2bmr266997766b.52.1746610350328;
        Wed, 07 May 2025 02:32:30 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.165.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm869562066b.1.2025.05.07.02.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:32:29 -0700 (PDT)
Date: Wed, 7 May 2025 11:32:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, 
	peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org, pmenzel@molgen.mpg.de, Yinggang Gu <guyinggang@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v9 4/5] tpm: Add a driver for Loongson TPM device
Message-ID: <CAGxU2F6m2=+07sUoy4PKVs1vMR6Yr--pgkOG3SEGg8gi=HRf+g@mail.gmail.com>
References: <20250506031947.11130-1-zhaoqunqin@loongson.cn>
 <20250506031947.11130-5-zhaoqunqin@loongson.cn>
 <2nuadbg5awe6gvagxg7t5ewvxsbmiq4qrcrycvnrmt2etzq2ke@6oyzavctwrma>
 <0b148f09-d20d-b6be-d31b-6c8a553658c9@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b148f09-d20d-b6be-d31b-6c8a553658c9@loongson.cn>

On Wed, 7 May 2025 at 03:35, Qunqin Zhao <zhaoqunqin@loongson.cn> wrote:
>
>
> 在 2025/5/6 下午10:13, Stefano Garzarella 写道:
> > On Tue, May 06, 2025 at 11:19:46AM +0800, Qunqin Zhao wrote:
> >> Loongson Security Engine supports random number generation, hash,
> >> symmetric encryption and asymmetric encryption. Based on these
> >> encryption functions, TPM2 have been implemented in the Loongson
> >> Security Engine firmware. This driver is responsible for copying data
> >> into the memory visible to the firmware and receiving data from the
> >> firmware.
> >>
> >> Co-developed-by: Yinggang Gu <guyinggang@loongson.cn>
> >> Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
> >> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> >> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> >> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >> ---
> >> v9: "tpm_loongson_driver" --> "tpm_loongson"
> >>    "depends on CRYPTO_DEV_LOONGSON_SE" --> "depends on MFD_LOONGSON_SE"
> >>
> ...
> >> +static int tpm_loongson_recv(struct tpm_chip *chip, u8 *buf, size_t
> >> count)
> >> +{
> >> +    struct loongson_se_engine *tpm_engine =
> >> dev_get_drvdata(&chip->dev);
> >> +    struct tpm_loongson_cmd *cmd_ret = tpm_engine->command_ret;
> >> +
> >> +    memcpy(buf, tpm_engine->data_buffer, cmd_ret->data_len);
> >
> > Should we limit the memcpy to `count`?
> >
> > I mean, can happen that `count` is less than `cmd_ret->data_len`?
>
> Hi, Stefan, thanks for your comment.
>
> Firmware ensures "cmd_ret->data_len" will be less than TPM_BUFSIZE,  so
> this would never happen.

I see, but I meant the opposite, if `count` (size of `buf`) is less than 
`cmd_ret->data_len`.

I mean, should we add something like this:

	if (count < cmd_ret->data_len) {
		return -EIO;
	}

I see we do this in other drivers as well (e.g. crb, ftpm), so I'm 
trying to understand why here is not the case.

Thanks,
Stefano

