Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACFB78F44
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004217; cv=none; b=sdwZP+q8O2kH1OlBXQQn8WBosiqjK9omUcA7ahIQohI28nNSDT2pZZj42nmDFUCzK+QQ9Q9rvBRKfBrUjvz6BXYdTHqfCMr1ICjurY8xo35MWsH+UmHti0Q0HH2gG3bJ9duMoUniCeycnmfBYXGcHyZKnw5MgIH5rbHND4f1W6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004217; c=relaxed/simple;
	bh=igMUEO2jdAMJa66FnKgZHk74FDW367SkId7b0Aj61PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6Pclmv2Qb0sXgfLZMXdp4BsL6CbxToEfN/U8bX5iR35Sq/LMWFL+6VoPJOuWoOPYGwHdF765gXukim3tD0suq3sekFmvP+SyP2B3NpyKoIfkJMj5ZPiILGznqdLQ1Be3I+HiRaSSAq3HQSbIoxFWxbE1d7dTg+dR1kIP+iQssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJlPibJp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJlPibJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746004214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RBM8h9GXkd4oRheqBQptKlBrFr1ALhS3777dATJTzNQ=;
	b=eJlPibJp+2E6PzUzZWKN185mIsg8aDJT2IQOJ9+ROLdL3ou+nk8/HVgfyxM1rWML1yYqDy
	Foo9j1Uer2j6ZFiBBQ9U1sguIHaw6DfM+fjJV9iHepa7R6QV7rzObiBYSlB5l1wgin4E4s
	YbRRsMKF434UP+UJTCX8GZDIo6AOk4s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ErEzdI7iPiuMmRdMqVTypg-1; Wed, 30 Apr 2025 05:10:12 -0400
X-MC-Unique: ErEzdI7iPiuMmRdMqVTypg-1
X-Mimecast-MFC-AGG-ID: ErEzdI7iPiuMmRdMqVTypg_1746004212
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb8f9f58ebso523612766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004209; x=1746609009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM8h9GXkd4oRheqBQptKlBrFr1ALhS3777dATJTzNQ=;
        b=dCP0uzuRkivWaA1LEGBzgf5KXT/GA2+TXOCvmNrADb+biDK3Glg3Zi72GAPRuxaCIg
         +YNwBN0fEOBk3hN8cjdWMBM3WJqIGr6fmILZHYmRjDGs0lDStq4SSHDsuxAbq47fJdH4
         ID9zE+jJdnfvo6MOZve+7XnXNdaSmHZ7hDzIy153hnqnKs10PjNyLUMbjadtsFSd06hd
         D6kS7Q2Pfj56/p9OHtqps/EaFJmlvX/ivPTT03nwziG09RQjGvzoFuY1G/3ZSZhXlyah
         7Y8rPNHROmisL4DJcn+uZG3Ef8yKSA++AIpzKC5L5Csla9ZVJMm6qKDfNaDLSTqC2jno
         p9hA==
X-Gm-Message-State: AOJu0Yx3wYJ7rc8ltoCKymNgirf284+QggL/+YDkC3akBJbc1NHdSuqv
	gBE0sJBUs+ZXB+AGuRY7T6nYXqrcUPM6oA3kcLHumMnHunEXfVbkcGE6lfBkPXwinhU49O7XlHi
	wG8vo9tk3wzlK7hLETqjxjXAwzF5uznnpQCMfefXJA1+P2rKJzKGvUO9tUyxZ/w==
X-Gm-Gg: ASbGnctQTcpJI2wbcWziiav6k4/X443Xtva7QcIkEvjogc8Yh7g1JmvpCAkjahr53PW
	Gann5ybM+4UC4t0Z7AIFVzX5F+dEywNIj050ZEDql6Efdsw/St6rtbaH0KPfKkDUQUuP1qKLfuZ
	48eo163AD3chjeTCocFK8Jo/y218+rKHJxJJOi4aIAgCIyXAhrR5EDWJ+z6GhC/T5m9V/UfyXfp
	7ScqjDx5IL45mQiAQ94nnmCJeSufCMmr4iGI3PrtaRrtutZMl7DbmGbKvwEfprRSAfHWUnopuro
	JN//+IMSyzDWVCQzLA==
X-Received: by 2002:a17:907:7b82:b0:aca:aeb4:9bd6 with SMTP id a640c23a62f3a-acedc574a4cmr220066066b.10.1746004209560;
        Wed, 30 Apr 2025 02:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBMPamEhDPbDLqOXiGcIZesC1dmK+7e+0MqQ1tv9XUC/crH+ZQmawf9DLNdOJwg2QfTaPusw==
X-Received: by 2002:a17:907:7b82:b0:aca:aeb4:9bd6 with SMTP id a640c23a62f3a-acedc574a4cmr220063766b.10.1746004208996;
        Wed, 30 Apr 2025 02:10:08 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acebe7a4ee8sm313299266b.74.2025.04.30.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:10:08 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:10:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, jasowang@redhat.com, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.6 13/21] vhost_task: fix vhost_task_create()
 documentation
Message-ID: <n2c3bjkh4jbzm2psd4wfrxzf5wdzv2qihcnds5apfgfyrojhyd@l6p47teppn62>
References: <20250429235233.537828-1-sashal@kernel.org>
 <20250429235233.537828-13-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250429235233.537828-13-sashal@kernel.org>

On Tue, Apr 29, 2025 at 07:52:25PM -0400, Sasha Levin wrote:
>From: Stefano Garzarella <sgarzare@redhat.com>
>
>[ Upstream commit fec0abf52609c20279243699d08b660c142ce0aa ]
>
>Commit cb380909ae3b ("vhost: return task creation error instead of NULL")
>changed the return value of vhost_task_create(), but did not update the
>documentation.
>
>Reflect the change in the documentation: on an error, vhost_task_create()
>returns an ERR_PTR() and no longer NULL.
>
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>Message-Id: <20250327124435.142831-1-sgarzare@redhat.com>
>Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> kernel/vhost_task.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

It looks like 6.6 doesn't contain commit cb380909ae3b ("vhost: return 
task creation error instead of NULL") so I think we should not backport 
this.

BTW, this is just a fix for a comment, so not a big issue if we backport 
or not.

Thanks,
Stefano

>
>diff --git a/kernel/vhost_task.c b/kernel/vhost_task.c
>index 8800f5acc0071..0e4455742190c 100644
>--- a/kernel/vhost_task.c
>+++ b/kernel/vhost_task.c
>@@ -111,7 +111,7 @@ EXPORT_SYMBOL_GPL(vhost_task_stop);
>  * @arg: data to be passed to fn and handled_kill
>  * @name: the thread's name
>  *
>- * This returns a specialized task for use by the vhost layer or NULL on
>+ * This returns a specialized task for use by the vhost layer or ERR_PTR() on
>  * failure. The returned task is inactive, and the caller must fire it up
>  * through vhost_task_start().
>  */
>-- 
>2.39.5
>

