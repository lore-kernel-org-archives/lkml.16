Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD92528EF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455042; cv=none; b=WJWXnpRzypUELVPzpiBnKJ6nkwholphuEBNIynExHuD3tZEI7BNgDAaowbedcLPD6GtrRNiKOOc2UgEcSmZXF4QhVpgLtzWR59eDYymV9bJV9CHve3DIIrZvY4NttDqRfch9om9FikL/55CifpxQ2LJY2sWRqL40fhpzCTUoniU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455042; c=relaxed/simple;
	bh=8N56+TGylsQY7gFnKtTRVknM2MRo5gOpmc2AwA02aio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEVgInLwJUcO9uP1y0V6iqDztz/EWYGNWY88JxrrtAy3ieTBfRzkZDqumTAj+svlFFKrrOQKVpdAHKloKQuJmpcBHco39wGXq169FaZp3dUPFFc2FSrWilsf8lmpXycoZD63f6SqpMSVs3vbj5WmIgNBei7Xo4hYcjB6xJpfRGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WmZ/CyvD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WmZ/CyvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751455038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wldKfbxnDfMUjnGQMZxO+EJVdKQ4uPilVamWozU75kA=;
	b=WmZ/CyvDp8hWgurY5blr21m7uMd61Ll8G/emFFymjxvWSrEZgV6kYBcIk7oJKhYRuGJajU
	22fIf0oClYIyaseEjoS9ZqFrfb6ci1wSbVelwIXmGIgSzjS6hSCco3G+2T/TWNf0F861KT
	NxJms/NSsHAgoC5FV47v/kV0FlwnL7U=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-yHpwSfg6MqOl_rUtJA8Ugg-1; Wed, 02 Jul 2025 07:17:17 -0400
X-MC-Unique: yHpwSfg6MqOl_rUtJA8Ugg-1
X-Mimecast-MFC-AGG-ID: yHpwSfg6MqOl_rUtJA8Ugg_1751455037
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a38007c7bdso106314621cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751455037; x=1752059837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wldKfbxnDfMUjnGQMZxO+EJVdKQ4uPilVamWozU75kA=;
        b=W+WdyFCoUTpAJ5mbZ1YnKF9Zf1Bu3Xo3tnSLoW0Z3e61NwLARCex6XzxZS5ufb+zrH
         usLKSmzfZDdBF04sLuTJTImesU1DCQ015HRd6GYcV+1ZpzrxAvRN2UTzs2hkoqg8mo+l
         rYx9DuE5a1aljG2oKgAsED0czZl+Ku6zRf0eja4rb9kVDhgkcRDYI9+3J9hq5QBTHLD2
         Vpo8dPMO1l0gPvoL1HQBaA3VxgVarTu/3HDLAKlzwn/vDixKgjdQnIaCRQH1lmIeOuRN
         MSKCYA6/b5fYmmPZJXG9g0UrkT9momvebPp/t8opdDJyWvC+jVqyAl7wb+PVlEVBVhWw
         59GQ==
X-Forwarded-Encrypted: i=1; AJvYcCW000PhXeCMgzzAL1AFYjhTWUiFzfCtZRL8TS8KQ9wowoCF2b+6yB4PHekKqogJm6+kOV6/eJhnaaVUed8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tL/LFudZRfHK7U08tAtWVcvSXSRX4vxWurNZiQ82lPv03nPL
	hYdzfsqxkhPZDfVaE8YwraM9xoSzVM4+4aPc4c18PcoOiKrsCIG5EZBK8VFJiOolp10860o8Bqg
	cWM3PKzICusX0kvpLkRRnLvpZyStzPhekiZYjP4uoOZ0dVSYTIU9MeIx19zwhIjrD5GQU8YEYmw
	==
X-Gm-Gg: ASbGncsPKucStkXwQCx+JjPxUfTOGb0vj28aOgU+K/fTcjoisAemkAM2Lhg/GaLGBZ+
	HDdtvII/lNsxBVs22WtGBOSCEWxq53f8Pom4yRHEeDtysM8SI52XkC407jLA8/qdOWsFDMwQ2q0
	S+y1oZ+81xmsizgssEqf9O4RLqA5wDe9BboXCWogtUu3VCBKn2yJ43VOP7Pcx1W3uv2UaDtjhJF
	/x7aD8ESM8wsHMS+NrK2NLr2JOvCacgRxC9dj4rlXn3kaVRKNYxph82Qi0ZIeRqviTtWB9gaBzY
	z29Wl0d8Gyvp38XD3ma9q6X/fafj
X-Received: by 2002:a05:622a:4892:b0:4a4:39a6:93c4 with SMTP id d75a77b69052e-4a9769152aamr42028571cf.21.1751455036586;
        Wed, 02 Jul 2025 04:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyX529Bjf/JHbkZ9z4pNDGbh4lbiaMrqb6Gqb4GFhbQWEzxXEP/dakYHu4BYJfkNuEVi7vkQ==
X-Received: by 2002:a05:622a:4892:b0:4a4:39a6:93c4 with SMTP id d75a77b69052e-4a9769152aamr42027891cf.21.1751455036019;
        Wed, 02 Jul 2025 04:17:16 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.164.126])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d8acsm89956541cf.63.2025.07.02.04.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:17:15 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:17:07 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] vsock/test: Add macros to identify
 transports
Message-ID: <hv4ufpmyuyzreh4n4tofco4mlbge3cqvuvfnpadek4scov3jyi@f72cscihqcsw>
References: <20250630-test_vsock-v5-0-2492e141e80b@redhat.com>
 <20250630-test_vsock-v5-1-2492e141e80b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630-test_vsock-v5-1-2492e141e80b@redhat.com>

On Mon, Jun 30, 2025 at 06:33:03PM +0200, Luigi Leonardi wrote:
>Add three new macros: TRANSPORTS_G2H, TRANSPORTS_H2G and
>TRANSPORTS_LOCAL.
>They can be used to identify the type of the transport(s) loaded when
>using the `get_transports()` function.
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
>---
> tools/testing/vsock/util.h | 4 ++++
> 1 file changed, 4 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index 71895192cc02313bf52784e2f77aa3b0c28a0c94..fdd4649fe2d49f57c93c4aa5dfbb37b710c65918 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -33,6 +33,10 @@ static const char * const transport_ksyms[] = {
> static_assert(ARRAY_SIZE(transport_ksyms) == TRANSPORT_NUM);
> static_assert(BITS_PER_TYPE(int) >= TRANSPORT_NUM);
>
>+#define TRANSPORTS_G2H   (TRANSPORT_VIRTIO | TRANSPORT_VMCI | TRANSPORT_HYPERV)
>+#define TRANSPORTS_H2G   (TRANSPORT_VHOST | TRANSPORT_VMCI)
>+#define TRANSPORTS_LOCAL (TRANSPORT_LOOPBACK)
>+
> /* Tests can either run as the client or the server */
> enum test_mode {
> 	TEST_MODE_UNSET,
>
>-- 
>2.50.0
>

