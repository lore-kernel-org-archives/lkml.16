Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8321ABDC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010045; cv=none; b=lZuVzQqcNNH1vnX5Kx6E61mq/OR6jW9t8RRivL/ffFsVwp8jJ2iFwspQzAIUN5GffEJPpgZVBYIP6wVN2PIGATi4Jsraq+1lE/e/4t28szM4u0mwpDue7psxbSFRbHkVpYOzI0dehcuOBkLKkD3/KPkwzIL8AlYK/eZ50TzSyBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010045; c=relaxed/simple;
	bh=gN5pAE2IubpyXdGdukqbjuNT7itxOBgkgX1Y5EtimiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fh1/43bqTUCcUEJrMdgNsjMh9dwmaTm2tmXcucKCPzbmWDUOowA4LajvOBA0qTlfLsdtQ13e8FGK+DDjzkX6eBrnVWgyQSES68vPHEKNzvVAz1xoBoewvAgy14H2RI5GTVh90NzLax/1s+l76Z7hb1YXdKKacKLOMxcP7W/4IGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z1D2b5jX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z1D2b5jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751010043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBnCGbSfprcirqT5UrYZ51B5MHbuiPAu4AbyyIVx9XA=;
	b=Z1D2b5jXp0BTZbpvEEVaY16eBUQPRnRFABFzBshcA25E3pcI2r67TjRnqaNPujdcGS8kkP
	n2VSz9ai6v0MT5BLXdagDGRMle27qUZbkZBIoRd46f/blrwnH+6JLtcvLxWyE/ubnfha1a
	U0N7H8A1QiNs2f8DsDnIvZHqhdugOm4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-9tCC96o_NfCvpaL82F5MYQ-1; Fri, 27 Jun 2025 03:40:41 -0400
X-MC-Unique: 9tCC96o_NfCvpaL82F5MYQ-1
X-Mimecast-MFC-AGG-ID: 9tCC96o_NfCvpaL82F5MYQ_1751010040
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so1431596f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010040; x=1751614840;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBnCGbSfprcirqT5UrYZ51B5MHbuiPAu4AbyyIVx9XA=;
        b=wh0MTCJEwUxKGj6O57+wMxVdrW744QF6ncctbMLp6nmkuzHrL7BTGGe2WTzlhS8slF
         TFlc83opzsveDLgPrlX/n5lLsq15ATPerAZPl/E4jZZU+wgreTVhu2wI0XmzTTC1BfFj
         aXBBcDdZrgLhk13GKCylTbl7a+EZCPR0yHedTS0GhVTac6hLcOcGHR2JiO5mlpSRZliO
         vq5BaV+8fIYrUY/8GLKU93M2GRjYtSJk4V7XMgtoMW8hYVt5aqRzbR4p2wCVBQba0Dh4
         ELHH/etUb0OLVk+sPpZFWkj44I8xgxmwmxq5g5+mEIFAI3tK75e/LJ2aV7OMoCX440/c
         YxpA==
X-Forwarded-Encrypted: i=1; AJvYcCUandFfU3W9qoAVucugO5U2V0mMdHsiW9eOTz4nP9cBNTHLC6M0Bs8MWga87hzacbe4CjaGjzfoaE/c0y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RIp6sKsVseAoyqJDkoX21cpaqPeg1m/+6aAn0PDj9VbQUGRy
	hWSy39ZiDyJyzs2ZEr3CisbvIA16fXw0pBZsmCQUjLigbhJN5WkHCdWFi1Y7zC5Vk54OZ535Bu+
	Ac7JYWET1l9xLMzgDKfTe7O87MPLe6MF1K1vJDdrtL1SQd8umeTlr4h/6D5T+0FWCIw==
X-Gm-Gg: ASbGncu20d/rge5aKehFPHW9F5Cy3bxnDGcsnqe7aDhL4VergRl4EEYlYB1Cz/oEhux
	G6aDcgOvUz3pmvLpelX9xDERVbGXuOQ0bHhhESKCavPszO9MVFTHHPgUSMkXQ/AatCbL77Y2eq/
	eLKqH5hB57kKBwmh0Ir7MWbCbLS8If/SpqJpCd3E9sVDLKsgAl9AJTTUbgsJag7FK8clmnZI9sT
	Jp0/14pOPzl8ELnUiTDQRqTK0SLhdYRgUuvDV6L6pSc3MX5nYmRniCEi3MdspZb5ahAry5NsFSm
	F68C0igQ1BQVgJ15BKeyw974u0ZfTLWViu5NRLqcc229TcpW9nrTlBHrmDGqA7o085dkuvy2uRR
	bMGjW
X-Received: by 2002:a05:6000:21c5:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a6f312ded8mr3496370f8f.18.1751010040102;
        Fri, 27 Jun 2025 00:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHffkWr+tNQHcP3BKAqhEIUlPXtP0GPPD5lJm+uaf4h6Jumi+zY3AGg3kh3v10ckZG0pyurtQ==
X-Received: by 2002:a05:6000:21c5:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a6f312ded8mr3496353f8f.18.1751010039681;
        Fri, 27 Jun 2025 00:40:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e528a9sm1956705f8f.60.2025.06.27.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:40:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge
 Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
In-Reply-To: <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:40:37 +0200
Message-ID: <87wm8xd43u.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Weiss <luca.weiss@fairphone.com> writes:

Hello Luca,

> Document the interconnects property which is a list of interconnect
> paths that is used by the framebuffer and therefore needs to be kept
> alive when the framebuffer is being used.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

