Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB728F938
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320537; cv=none; b=ePuMA6wuVSIEIRqTWbMdR0V6+4oYWyjjxV8Z0fkPpYe8Bt1yU4/qIJRosu00wmPR4eCWZl/9uVNIUEpRdr5Tm0mL+wCbhaEyf45B8o/er+YnbtaqXd9c3HXw0EAhFmtRZCYrwh/8wH/NB2iBoA6rs7z86wgGdAmX/n9bidRCZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320537; c=relaxed/simple;
	bh=PQyLMk4yD/KMsB1XsXeHfOQCgylwKZk+b6OaxBJWI7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZzoZuswvPQdxVSeBfIa/GUaI6VuNmjhDOV6KKfMPnXMecPU94r++kURyHrNb7+TilmLeRuFRrbVSOEtIZDc+7n19UureRnvdZ3BDGytxoytbKCMQ2HOmEAMxdK6AhdwCE3Er+LjhBAJk9fhkZNC9nWbu/unNkTU388f0/i6isk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7bUe9P+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7bUe9P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744320534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wUygALbmEVMFAt4v+g0d0hTcs9oRhp7Sgk/twG05FU=;
	b=D7bUe9P+uuUCgkLxwrATaynkYI5/P8/yiHNHAko2bw3hpNsT7mPtu6SPDan+7ID8mYoeFO
	zYrLSjGYJV+9uxUi3s6IjxoWsOwjwCsWi6JvHEKTcyjm+0LSCkRggc2VE6wyOTp+Puh3bn
	qXB6ua7QrkBwNrLja8VVWPwGl/gUXuQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-T-lfF_p8Mz6RRrGgKYpHOQ-1; Thu, 10 Apr 2025 17:28:53 -0400
X-MC-Unique: T-lfF_p8Mz6RRrGgKYpHOQ-1
X-Mimecast-MFC-AGG-ID: T-lfF_p8Mz6RRrGgKYpHOQ_1744320532
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85da07ce5cbso13175339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744320532; x=1744925332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wUygALbmEVMFAt4v+g0d0hTcs9oRhp7Sgk/twG05FU=;
        b=gchXPHPCVATkmFIXgpbABVDFjXKJZZs/s/TSCQYvggACNllSady5IsII+8ZWLuYrBH
         W9sfU9dO1Kec8s+IBKgfQt1vzY7YoRL4U2LA5d2QcFzDtnLxdmqiG0MZc7f69MGoSd6C
         Yc3qsPb7gojDy3GwFhk+3yTVpsIqXpViJcuFU2vXoHI9XxVCIQvKue5dJRaFH14cUVTw
         vBGwyUStbFgNWOK08pMmZ6B9ofjJ2zytg8IoctTE9mH02ylzSqURMJ7CgzAyIu7/n3MS
         W+zTaF/NV1WCv6M8b2gahh6qoM7hXR020iPS6kg/EzBhQFwc2TfGegqhuiGVLSeQmWKx
         Ucqw==
X-Forwarded-Encrypted: i=1; AJvYcCXJrtUWOZd4O6ytx37hgh5rI+w2JMA9aITk6R+hOD9u+9XgQJ55WklFQt3A3EPfJl0y1/fmO+3nk88aygc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjShDl6RG/RvfOzvw7sqLjcrCB7ApJqVxgro7Z9hU99JlM+OIh
	BgAbhfXXKt6rDElXQgIUr6osj3T8i3Ld0hlpCiEEoPWV2e0qgST/uU5m9K2y8kdFSV4derYgs5g
	bAVsrBkJoBo+g0XhLTbiRPArW4OtF4g5u8VJgJqFz2dYK30P2L1Ls2gRupWuVnw==
X-Gm-Gg: ASbGncso9Z3AW3r2OlaSwL4wXRQ1/UEt7xBiIsiUIV45OKtLzX9UataPcoRZ6wRzXVE
	iS7A+sWuOkeco05Byj+Bpzg27Lypy1JQs9no8ufjsGKN6zoGd//ONdbVpi2KiDkq20GgXZ5lcZn
	1EsOHlqlbTEMD6j6sp7XgGiSTdbS6tAJW1SBLwbVZ8aM8LE905JflAtdgZyPtw1rWgSnVWAUF1O
	IxQ5QIsT5WZJRg0BxA+ZgFA+VtM7BG55UUfqASBn7/NDYwN7g2JLIdbA1j9TCdgEdEynaZLeOgq
	1f1pmndqpJtSpWI=
X-Received: by 2002:a05:6602:6019:b0:85e:5cbc:115 with SMTP id ca18e2360f4ac-8617cb5482dmr14195439f.1.1744320532152;
        Thu, 10 Apr 2025 14:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGObbSU7MqLRum1IP35oPdq16S0/HCvuDlUPSjApwT5xtjRxU2hDxipatt8y3sRp60U+ll1fA==
X-Received: by 2002:a05:6602:6019:b0:85e:5cbc:115 with SMTP id ca18e2360f4ac-8617cb5482dmr14194539f.1.1744320531830;
        Thu, 10 Apr 2025 14:28:51 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d1873bsm923375173.48.2025.04.10.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:28:49 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:28:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David
 Matlack <dmatlack@google.com>, Like Xu <like.xu.linux@gmail.com>, Yong He
 <alexyonghe@tencent.com>
Subject: Re: [PATCH 3/7] irqbypass: Take ownership of producer/consumer
 token tracking
Message-ID: <20250410152846.184e174f.alex.williamson@redhat.com>
In-Reply-To: <20250404211449.1443336-4-seanjc@google.com>
References: <20250404211449.1443336-1-seanjc@google.com>
	<20250404211449.1443336-4-seanjc@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Apr 2025 14:14:45 -0700
Sean Christopherson <seanjc@google.com> wrote:
> diff --git a/include/linux/irqbypass.h b/include/linux/irqbypass.h
> index 9bdb2a781841..379725b9a003 100644
> --- a/include/linux/irqbypass.h
> +++ b/include/linux/irqbypass.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/list.h>
>  
> +struct eventfd_ctx;
>  struct irq_bypass_consumer;
>  
>  /*
> @@ -18,20 +19,20 @@ struct irq_bypass_consumer;
>   * The IRQ bypass manager is a simple set of lists and callbacks that allows
>   * IRQ producers (ex. physical interrupt sources) to be matched to IRQ
>   * consumers (ex. virtualization hardware that allows IRQ bypass or offload)
> - * via a shared token (ex. eventfd_ctx).  Producers and consumers register
> - * independently.  When a token match is found, the optional @stop callback
> - * will be called for each participant.  The pair will then be connected via
> - * the @add_* callbacks, and finally the optional @start callback will allow
> - * any final coordination.  When either participant is unregistered, the
> - * process is repeated using the @del_* callbacks in place of the @add_*
> - * callbacks.  Match tokens must be unique per producer/consumer, 1:N pairings
> - * are not supported.
> + * via a shared eventfd_ctx).  Producers and consumers register independently.
> + * When a producer and consumer are paired, i.e. a token match is found, the
> + * optional @stop callback will be called for each participant.  The pair will
> + * then be connected via the @add_* callbacks, and finally the optional @start
> + * callback will allow any final coordination.  When either participant is
> + * unregistered, the process is repeated using the @del_* callbacks in place of
> + * the @add_* callbacks.  Match tokens must be unique per producer/consumer,
> + * 1:N pairings are not supported.
>   */
>  
>  /**
>   * struct irq_bypass_producer - IRQ bypass producer definition
>   * @node: IRQ bypass manager private list management
> - * @token: opaque token to match between producer and consumer (non-NULL)
> + * @token: IRQ bypass manage private token to match producers and consumers

The "token" terminology seems a little out of place after all is said
and done in this series.  Should it just be an "index" in anticipation
of the usage with xarray and changed to an unsigned long?  Or at least
s/token/eventfd/ and changed to an eventfd_ctx pointer?  Thanks,

Alex

