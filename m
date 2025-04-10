Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BCE20C013
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275628; cv=none; b=W/53Ywvw0AavMWjeKwQ5IOnZjc7qOcCVGMeQMq3NNqd6ZxEu+zDYwLR7Zg1d1tpPZrSDLEf4OBIMOOrITlBy1d+rmL3yXgo/sDe/R00WyraWZjdFBgok/GtZTkCxLrfZrT/ZwKN97eeqJUqgvCRfvWN8Txqi2xyl8uYdqCrFw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275628; c=relaxed/simple;
	bh=I4MIJOc9JhWSgFTKA4FNrkTE3IWfo47F4Wh31dwTSsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCy8NEtxzbTcl/8LQJ1P78ZjgoOoEX1j52vJ/yV/BWWECWtFtpDohybizS3sxubtiHOdYrqLILgOyjbVs/tERDZpRzyKIzXfTRezUxyuYg9OZor+6NATs5YKHeQfagExuFXyaJbGxwcgiI3LnNrx6SgTMKyc5jrwhRnpXRgMkf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MBheZ8eb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MBheZ8eb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227cf12df27so4647805ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744275625; x=1744880425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oi08ZUj5nmzNApBuQkkZIOeXhhQ8NRPpEYlY/zuaL9k=;
        b=MBheZ8ebXbNreUM6G2NTjS60IkEH94pf0ZhgPF/0akC/5OvUm7na0n/6DN+aG2PwWK
         n8+RHLnFyzInqRSaR94TYYE7oGYU34eEJle6c8tn+OPOLpW4BbGd5h5LAoZKmgoZJyX8
         t5zGTl9tarui0ZtplYTRp+RuoeW29Hk1lr7HkaGDxC1aD50EpPFl82ch8mI/S+5fsNHX
         5IuEvOPCMwwQZ2sIOMTVCXX/IXjdZSPPCXEKgvrpBCxMOnRgmsMUPh/iD7+gebXwp5Rr
         MoAXhIntlDw0Fx/3sXtf6fwKdsuTxhCu5R1N8P7+EVILtOYGDbD+5SYsKnBL4bltprmN
         J+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275625; x=1744880425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi08ZUj5nmzNApBuQkkZIOeXhhQ8NRPpEYlY/zuaL9k=;
        b=qDBHPf8IdNnWJu9FdhJxAWYpy4YdeufcgR1FwuapQdN7Og/VuFtBJc82AV3FrUGAq/
         KCvaCu4bbzGKjqLpBZxWWXOjGfO7E/OZ2tIYE6J5x2nd7duar2WuAzwWb+8er7kRrERv
         25A6guaKp6l4eocrWXs0pjkMPrbSi2L1wSZ//tnZuwvrbTvlTW/SIq2piUQlNXuz2Hc8
         ph+QT77AwaD67BMfNyN6KCs9ldoVqgmiM8quq2KSNYmi/SSc/KFkM4RNJKza/rdhquJr
         bhbNtDb+2maVfaGUxj/Euge7ly8uVfrmDBkGobRpPmP/MzfjqCB/YlGVAh3EqCFyYdQV
         ZZfw==
X-Forwarded-Encrypted: i=1; AJvYcCXmIgCVWvI7xLK94NKHV0BmhVvMDm5pqwRZcQpM/fpmir60ZSY3pxB90Bur3E4sUqWfVht2Va5nTAz0Fa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YykRAB9ZCxFW2dHO6AM3BrogaIjM/Wuz4q+MKze17olBFp+7TeQ
	mnotTlh76RYrbswuMVCPITVu3IwvehkA+BU6fB/UwiqXrgTN64nVO09TclZ1DRY=
X-Gm-Gg: ASbGnctp2s+vCaWN4Sxl7UQcREUBL7VbazPYaEb5Pa1dgKicu8GSgGFFOLhxFycGiri
	5O2IOmVYGHMyKsP6js8Qrdwv9CCV4KZjrbvfaveqhEO0C4lCehH4DBP+7vXeVMH0Sg/A6rBqt5C
	3uN4pex8jBWI8mxolzy45mhAgyaSCMDYQ1AN0h/vD1y9cHoiZMhsP0GRPgUSlKJqWZc/eDrJ9/C
	rkt95dulxmZGHk+lfiSUrCSCKvaXcpWUbds69KXWtO5e+W8QkBITkd0aAurxtoCbgEilZ5nWDFq
	rvA2vc+mpv8gx/YrKtUocoFlJQMvSboYX4HGuVxSG4Gc+dY=
X-Google-Smtp-Source: AGHT+IHvhWnHATaAYKumHYbk0dW2labQ8ZJNKeRIo7kd5Qs5AD2+Hg6lM5xWwGK/Wyz/+ltT4oPazQ==
X-Received: by 2002:a17:902:ec84:b0:223:4d5e:7592 with SMTP id d9443c01a7336-22b7f91b908mr26302915ad.21.1744275625363;
        Thu, 10 Apr 2025 02:00:25 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2601:640:8900:32c0::e120])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22ac7ccb34fsm25299735ad.228.2025.04.10.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:00:24 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:00:22 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <wagi@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] nvmet: add command quiesce time
Message-ID: <20250410090022.GF1868505-mkhalfella@purestorage.com>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-1-95a747b4c33b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-tp4129-v1-1-95a747b4c33b@kernel.org>

On 2025-03-24 13:07:56 +0100, Daniel Wagner wrote:
> TP4129 introduces Command Quiesce Time (CQT) for coordinating the
> shutdown sequence when for example KATO expires.
> 
> Add support to nvmet but only report CQT is available but the controller
> doesn't need any additional time when shutting down. In this case the
> spec says nvmet should report a value of 1.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>  drivers/nvme/target/admin-cmd.c | 6 ++++++
>  drivers/nvme/target/nvmet.h     | 1 +
>  include/linux/nvme.h            | 4 +++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> index e670dc185a967dc69c9b7d23930bb52bdcc3271a..09ac5a43f70dbe3889c1b404d6b59c0053337192 100644
> --- a/drivers/nvme/target/admin-cmd.c
> +++ b/drivers/nvme/target/admin-cmd.c
> @@ -733,6 +733,12 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
>  	/* We support keep-alive timeout in granularity of seconds */
>  	id->kas = cpu_to_le16(NVMET_KAS);
>  
> +	/*
> +	 * Command Quiesce Time in milliseconds. If the controller is not
> +	 * need any quiencse time, the controller should set it to 1.
> +	 */
> +	id->cqt = cpu_to_le16(NVMET_CQT);
> +
>  	id->sqes = (0x6 << 4) | 0x6;
>  	id->cqes = (0x4 << 4) | 0x4;
>  
> diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
> index b540216c0c9a9138f0913f8df28fa5ae13c6397f..47ae8be6200054eaaad2dbacf23db080bf0c56c2 100644
> --- a/drivers/nvme/target/nvmet.h
> +++ b/drivers/nvme/target/nvmet.h
> @@ -671,6 +671,7 @@ bool nvmet_subsys_nsid_exists(struct nvmet_subsys *subsys, u32 nsid);
>  
>  #define NVMET_KAS		10
>  #define NVMET_DISC_KATO_MS		120000
> +#define NVMET_CQT		1

Setting CQT to 1 is a promise to initiator that target will quiesce
pending requests in 1ms after it detects loss of kato traffic. For
initiator, it means these requests can be retried safely in 1m after
kato delay. Is this guaranteed by target?

I thought leaving the value 0 means CQT is not implemented, no?

>  
>  int __init nvmet_init_configfs(void);
>  void __exit nvmet_exit_configfs(void);
> diff --git a/include/linux/nvme.h b/include/linux/nvme.h
> index fe3b60818fdcfbb4baabce59f7499bc1fa07e855..983b047e7158dcb33da66a25c67684b8f1ef5a7e 100644
> --- a/include/linux/nvme.h
> +++ b/include/linux/nvme.h
> @@ -335,7 +335,9 @@ struct nvme_id_ctrl {
>  	__u8			anacap;
>  	__le32			anagrpmax;
>  	__le32			nanagrpid;
> -	__u8			rsvd352[160];
> +	__u8			rsvd352[34];
> +	__u16			cqt;
> +	__u8			rsvd388[124];
>  	__u8			sqes;
>  	__u8			cqes;
>  	__le16			maxcmd;
> 
> -- 
> 2.48.1
> 
