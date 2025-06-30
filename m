Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62C295DB5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304363; cv=none; b=sgtxVmjZb+AQBL/QH+S9V5Pyr6piR3p0po6QJTXDbVXzCK4XTHxsCSxnDGhCjVqkgOjQmpNXCSSgMc3nLrScYY2JyAsnKjvJTwJL81e8U4Vw1q2tRKAYKNRcgz1iNW43lcYWzPTXd5gX+cadcsi2wYUyDpTpJY9k+9INngOd9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304363; c=relaxed/simple;
	bh=/ed1E/z18Xh1fVpk+ZX4y+GGRM+8GW66EdG4YQHARuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHwvcFtullpQJSyZvon5E/mRAkZt+OKnvpXFzNTDrhJ4GjBr11KVCicOKQN8XpWPU9KGqA7wZ2wRc1m+pXpq3X7rBZ6lTmBq8w0j2HNj3D70V58OE+NSNLUe4KlFAd9Gj8/yEwGwLwD41u9DLQ4hXZdBPAg+CbaiMgXJXAdgvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E2SWx4iU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E2SWx4iU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751304360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DirzX1KCKtv521PxYtm6kg9uFvxjRQhuzEiLEHXJyMU=;
	b=E2SWx4iU550hFrgi/zWOq29xcw3QdKve7hcCY4gPtBj2n6JVRyJXaif2zbH56R3zUBQjg+
	k7V4Y7jZ7K8X3QqU3WZ5vtBKOzuWse5ZOOg6neqyy0QU/cygsAep668Wc3+xsuIT7YchlY
	Owt1A5PH3RK+6A/fVr8ZUn8v1VtxKtM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-LqQzeqjlNyqdMUFo5e0cZw-1; Mon, 30 Jun 2025 13:25:59 -0400
X-MC-Unique: LqQzeqjlNyqdMUFo5e0cZw-1
X-Mimecast-MFC-AGG-ID: LqQzeqjlNyqdMUFo5e0cZw_1751304358
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso15296355e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304358; x=1751909158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DirzX1KCKtv521PxYtm6kg9uFvxjRQhuzEiLEHXJyMU=;
        b=udJpWPzmopfCguVATs8blogEOkgke16zYvpqrXYzxwE+afppan4UB46TeiBMFcJhrE
         N/9X+OzriNzCg/DSCeNCCtEFlFinasePl0J7cot3KjnLvZUkIFj3pVyq1K3FEFbFQ0Qp
         4oTbNtDiwmUnHYepqVRaGpTgfaCvAwbyFyaaxlM+TPt1K5iW73pYWwRTkYqXQhF93cWl
         l5jIqRXia9j1pYsKmutgY56WfaV4OOcZJ8oP0NgDI0O3klL2t+Si8DVTBcIFliyjLalD
         BrKq6Dh64grNn2WhMk3SRRoqGKPhRTpRpn8XxVRC+rDm+qRdjAeym8mz7NR63dfW8Geh
         Wsvw==
X-Forwarded-Encrypted: i=1; AJvYcCXmbFVhY0NPYPv6eBx597EQudUT/0GymBkRbhIZx5d5jgCEziYRmP0LYXUfAnBe8nbJmaNWYX22JAzsXZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqE0mZo8bbic7KcMmi1V2mYEF1ggMy0ESvDHRMMBKc9ITUsU/7
	lx8sMVKYlmC8EXhNxhBpGLtasH4L0CMVgDh6LQGQnYMTHyHBDTJtG2FZzJSHVLVuntVP3CjziNa
	PRKg4DaZja+gdBNTzcuc0TJmIzA/Cbc1fzhSdTzkzZkHpdrVv1+TdHIiKZNuUIBtpMA==
X-Gm-Gg: ASbGnctYmf0f+iDyYK8RN6lvJ3sszhGGsFOKMnp2YWuqhoILeiR+HZZfkv6VwYjVeXW
	M7RpdLe01Twyt/qUVoPS8rmGneUKpfYud0BADw19CZQoGVix3chD8P1kxHLqxc63YPlnuxz810k
	FOrd1fzZeifyPYjhO8/3ChaZK8i+fHTKpblkl4yiHY3vZe24sMJdsa/FfP2gMQLslSpdzPUaj83
	2YZrhDNWmKvj36Um+0jBxCm3cOqscTPHcqTvrgGHxfb2nOG87DCSOuQcNdWIyEMHn71IAumH6ED
	Lp29A3C365YEe+BY
X-Received: by 2002:a05:6000:710:b0:3aa:c9a8:a387 with SMTP id ffacd0b85a97d-3aac9a8a39cmr8482268f8f.0.1751304358213;
        Mon, 30 Jun 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJNxP8kFLxbkJcu5vn1wYxIzXeajCRrSl1+SZhoLGhSVkUygc5Y6gw3Iwu1mrPLUoBFlNVA==
X-Received: by 2002:a05:6000:710:b0:3aa:c9a8:a387 with SMTP id ffacd0b85a97d-3aac9a8a39cmr8482242f8f.0.1751304357754;
        Mon, 30 Jun 2025 10:25:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm152948825e9.21.2025.06.30.10.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:25:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 13:25:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Parav Pandit <parav@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH RFC] pci: report surprise removal events
Message-ID: <20250630132444-mutt-send-email-mst@kernel.org>
References: <11cfcb55b5302999b0e58b94018f92a379196698.1751136072.git.mst@redhat.com>
 <aGFBW7wet9V4WENC@wunner.de>
 <20250629132113-mutt-send-email-mst@kernel.org>
 <aGHOzj3_MQ3x7hAD@kbusch-mbp>
 <CY8PR12MB7195F2F2900BAEA69F5431E9DC46A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <aGKUqsudjfk8wCHI@kbusch-mbp>
 <CY8PR12MB7195583E429203129577B51ADC46A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <aGLB_8SFF1Cw95MZ@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGLB_8SFF1Cw95MZ@kbusch-mbp>

On Mon, Jun 30, 2025 at 10:57:35AM -0600, Keith Busch wrote:
> On Mon, Jun 30, 2025 at 01:52:26PM +0000, Parav Pandit wrote:
> > > 
> > > But I didn't suggest calling error_detected from report_error_detected.
> > > Just call it directly without device_lock. It's not very feasible to enforce a non-
> > > blocking callback, though, if speed is really a concern here.
> > Yeah, it would better to either always call a callback with or without the lock.
> > In some flows with lock and in some flows without lock would likely be
> > very bad as one cannot establish a sane locking order.
> 
> On closer look, my suggestion without the device_lock may be racy, but
> using the device_lock prevents the notification that needs to happen.
> Hm, not as easy as I thought. :(

I think I will just add a work_struct and a flag that the driver can set
to schedule it on surprise removal then. Hmm?

-- 
MST

