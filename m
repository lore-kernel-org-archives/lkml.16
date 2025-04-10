Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462C1FA26C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744323951; cv=none; b=cneaC8g7uTrYecLItxgdWfhMvCAwSTlkm7YE+svvxJeyGuqEkS4Md3hMdc7n+Zj+LGVxegpCFeIS96AXvgO2ErE/lHwmLjRNByhWImzCBxewEm72tTw55oM08iPt+Vi67BcTOLSAsbuN8C9cZZEngKsImoZftB/vzHZrwuKLFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744323951; c=relaxed/simple;
	bh=mfywADYqJ4ew9xI3CclYYcgrZFl/YoOSYDIBc9Dd5cU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pos4FNO0wboQMaS+9tnQeEBOaEcyCQOjTTv4zb4fHU6PHV6uxy7S9scbjd3SvSn17CtUW6w9I/8HuNM1kkPVachx4dEoEEJgNY9OkfwGpHBzS+9iyCRRpXLZpWpnm/Z5CViIWojHw0FvMp2ZK04J59pepJiuy0L46zDZLnrxxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AeWBF8tu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AeWBF8tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744323948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYR4fCas43gwQw++5uVITo+VmUSNg0r33Tx+gqd6wEw=;
	b=AeWBF8tuawF1jJVhKbsD4C0gy4rARZ/kzgd+/qCYGMeHtLg43E0e53R7FGi3ZrakXkEoHO
	/DY2KykmntMCvZxD3er5F0/8Ob7HP1xzczSBS/bJWBBHoDLUOmrNDZacUz1vXJsnxryxMg
	mBU4R0WEbAmPdbK3L7ploXaskC9MFEk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-_Py07wDjMBStrGbB-cYG1A-1; Thu, 10 Apr 2025 18:25:19 -0400
X-MC-Unique: _Py07wDjMBStrGbB-cYG1A-1
X-Mimecast-MFC-AGG-ID: _Py07wDjMBStrGbB-cYG1A_1744323919
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85db97c5c47so13068139f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744323919; x=1744928719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYR4fCas43gwQw++5uVITo+VmUSNg0r33Tx+gqd6wEw=;
        b=Dh/JoesRCwGBlkfzhq7kZ3GpU5kxzvoPe0ysDfNKUwx0u253bByaeyml3oeZbURM1/
         1bQ7tKigcmuDZwenstxQoJMNP1l6KLeIrT20wWSiueGBh6YRbzmAhqOJYXX9qB3ECGy8
         nkoEa16s68/hukWBuHyQE3Qou/qgRvuertB2ULl6M/ikYkkAEFZPCOl6PNgwEmEEWoCa
         4lPvtxRLBWMpBzoM2tRkFXSKFCynEiEuxuollM7T0ppKaK/9hC3csmVv5VJ5ClgtdS08
         YyBKn9DwCKCgQjQd1/irCjcpjDNy2bmtC7TGRWLeFyprfPwuL53y3UTPYXod7xIJqK4e
         DtRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwLWhhp1KDwuPATsaxS+fwSt/WEgpZK/EACWbXv2JBN9QY1NaBp2go2lWhNk/PItbR8vPTrJ1kGsVcR/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1RzSVI02ndUyEaVDOQ29YTpA+PyrKe0GjbyTGWSJGXgxM2w8
	8ePvVgzhTVkd+OFaFGNzTdO2PyhZvu9jrD6mrTvwRmJFT6ts31UjAGgu8Jbw/RRAW/kEUtFLE0z
	Qz0+WFCFqftQ1KSYgDi5Tw6BqLyBC1jZA17+bey1uy/t4NpVOE7ddMALp0cz8Jw==
X-Gm-Gg: ASbGncua6oVjl9f655wsdj2lu9oNCU2idkY5BgK7WTgF0TuXhUiMM3uWeBAwavvre4A
	05zYTcefd+w/Bw5Dr9+k2VcKGMEGurVlPuPydfT2ZSLQlAJWgwPQvrCgBkZsXuas7TSLpzzbPg5
	rY1vDDPO6JuuB0W0wA4uDZ3lqH7C/QT9ixLbntpjufN3k2UxsSq12t5ftdARh0IUwaE/mlvgKNN
	j2hOq08R0ApCgR3np1doPxqcrivNqWk9cShYTiQUKxDZbcsbgYqA/nojnrF0LUrZ+mxKlYCqCij
	pJoRTYnS39dVAKY=
X-Received: by 2002:a05:6602:134b:b0:85e:7974:b0ff with SMTP id ca18e2360f4ac-8617cc2c796mr15149039f.3.1744323918869;
        Thu, 10 Apr 2025 15:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQkXdAZ+OEzU4A2DZsacWYyZwm7ExYFaPxcS4RRuyEG/aWoQJVBgD7p6QneavEDnZmQ4ZUXg==
X-Received: by 2002:a05:6602:134b:b0:85e:7974:b0ff with SMTP id ca18e2360f4ac-8617cc2c796mr15148639f.3.1744323918540;
        Thu, 10 Apr 2025 15:25:18 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2dce4sm941729173.110.2025.04.10.15.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 15:25:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:25:16 -0600
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
Message-ID: <20250410162516.6ebfa8ee.alex.williamson@redhat.com>
In-Reply-To: <Z_hAc3rfMhlyQ9zd@google.com>
References: <20250404211449.1443336-1-seanjc@google.com>
	<20250404211449.1443336-4-seanjc@google.com>
	<20250410152846.184e174f.alex.williamson@redhat.com>
	<Z_hAc3rfMhlyQ9zd@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 15:04:35 -0700
Sean Christopherson <seanjc@google.com> wrote:
> On Thu, Apr 10, 2025, Alex Williamson wrote:
> > The "token" terminology seems a little out of place after all is said
> > and done in this series.    
> 
> Ugh, yeah, good point.  I don't know why I left it as "token".
> 
> > Should it just be an "index" in anticipation of the usage with xarray and
> > changed to an unsigned long?  Or at least s/token/eventfd/ and changed to an
> > eventfd_ctx pointer?  
> 
> My strong vote is for "struct eventfd_ctx *eventfd;"

WFM, thanks,

Alex

