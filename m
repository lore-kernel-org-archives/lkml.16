Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7DA2116E9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148741; cv=none; b=b90+SyxMKJqWpCO3Ldgy2eWe/gMEYvK+BcxS+IAcc4lKZnl1aX77ECDjGcNcTCNu6aeGeh4++47ucOg1D3U+IDgfN1GcOIhNz7nfLopr/w9hRVkGbO0bgMCcq8ZbFDROqxbXfQh8AVxQFYKentVb65jVC9mNY5yws8ibVqUOT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148741; c=relaxed/simple;
	bh=2L5aR0c2GcBaUNPGmIPtfmh8S5kkoZdASScGp1O5Jmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GihEU9Zzv9fPsP/phUZQCM9dVbl0H9rFGBmKCZG4qip9yNAz37KEFrlyNYkXZ11V0hNLa4fqfuighwBv1AjmdeBODfvKRSCglZA76cfNVzyRZxg3hYyE4Cmf2iPgkVo4CSNDCxN8JkBysOdz6+N/g6mA3sMmfOKrBU5Ui9ah2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cBE7qqyV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cBE7qqyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750148738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bm5aTFTS9Qh17d2Pxd5wPdYdMyLTNdjwRqtuRVZzJA8=;
	b=cBE7qqyVQ6kNtz7Kn6jn/eIH7AuKPwwcJKIa8CKBU5Y3YdySm2APEF8m1OuN0tDBkftf+v
	2sgjSZr56JDN8g3hW79zmSyn0IYE/ngAdOkFH5kfPowH8Xjlnm3qAi5Nxta4GvCNdRjT0x
	BJJviWABa38EzHxGS5iaHpGqpmxlobA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-8M40dEnKPcCrwSrIBbGwAg-1; Tue, 17 Jun 2025 04:25:36 -0400
X-MC-Unique: 8M40dEnKPcCrwSrIBbGwAg-1
X-Mimecast-MFC-AGG-ID: 8M40dEnKPcCrwSrIBbGwAg_1750148736
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabb9286f9so113039346d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148736; x=1750753536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm5aTFTS9Qh17d2Pxd5wPdYdMyLTNdjwRqtuRVZzJA8=;
        b=QLbOmFzLhc9kqtu0q+IiasiYGMlEZJyY+OaGqO4quOQsNkBCGDkhZldaliguXVSGt+
         vf8NrL4BVnlKn4IOH0Iy3fdX/AksLAmm6aloYozUUiAYnvZ5mHqBaKjSNN+kCLGFQCo3
         uC6VrAKawZWyXzVIpqU74XaUVyrGAxcIjLF8Ad3bFtrOk1bFB/F1mYuTtiiYARUGJgle
         8pX8IbordsISgrpTKXo+qNgZCFe9rlZp/g9pGpF9GHLOMDDtMwTM9P+gC21IdECrNFHD
         /I6okRz3rJ/C/9rs12g2ulH0gSiitz7A+UprzPOFqlMRmd6ssXQ9/VoMHouVCMl8eT/A
         2MNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW77eixIgKIrTSeJQuvkbx2JeHT8zFKLYsuqcyBmDW/9G6F2ENLohjWCaa608ONZ8QPrx6t1rKtTEhfRuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrclG7KgfhVZwnWfujJSV6hYaBaySm5eAH1Zl1QjK2LNoKFHV9
	PPHrYVKxtcmrPiLhR/a1Nxnl4iLe9Xqv3GbTZarzbfEUJGwAguz3VTtgdjciiL+lzNczT6jBzfW
	AbVbOjl7Unq967ig1e+xMvLLDNx/kGiLisH/jKfWVUdGGeWJxPPt7WCXWRzU/MHV8Rg==
X-Gm-Gg: ASbGncvycwJazahOJOSMicppfDvHpExiaorsSyo9D0LGJaujCuVdFPca3xt3kvNDcAF
	l6SY20jA5IJoqrju8eYXqqWj1fP+MENWLSRyvO0xurR8ps8fTTgcMUnBrbfs/XxM0ez0ecSuJJz
	HMub6VYcGRZXEt5WxRhhDxpmXjta0W0GnGp24iRmZrtQ53PKAul6hS1Pm4QSlkpmR72z91W8Rkg
	h8TwqAW29k60tM0WP4IotkeOJ4ubibZfwSRFBUQTHQmIWdKxRGtopsz21PdPHaE6fp2TBHz7KWh
	z7BTrahqfwgeuna1GDOalZkJi2c=
X-Received: by 2002:a05:6214:3d9c:b0:6fb:3e3e:89da with SMTP id 6a1803df08f44-6fb4776e0e4mr194710686d6.25.1750148736375;
        Tue, 17 Jun 2025 01:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLRf4zLAmzAVq4IjIYsGrQ8BUWjxhlo96YjZ+1KTdj83hkddJi7LyOWjuyU1fI+YDVS19qGQ==
X-Received: by 2002:a05:6214:3d9c:b0:6fb:3e3e:89da with SMTP id 6a1803df08f44-6fb4776e0e4mr194710466d6.25.1750148736042;
        Tue, 17 Jun 2025 01:25:36 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.161.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb58e7687dsm12877366d6.115.2025.06.17.01.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:25:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 10:25:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] vsock/test: Improve transport_uaf test
Message-ID: <fy5xo2kzx36ukxxutwzrqslvic7jdv5yaj3247hbzsza3ae4pd@hr5ijeldvcam>
References: <20250611-vsock-test-inc-cov-v3-0-5834060d9c20@rbox.co>
 <20250616145729.1a16afdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250616145729.1a16afdc@kernel.org>

On Mon, Jun 16, 2025 at 02:57:29PM -0700, Jakub Kicinski wrote:
>On Wed, 11 Jun 2025 21:56:49 +0200 Michal Luczaj wrote:
>> Increase the coverage of a test implemented in commit 301a62dfb0d0
>> ("vsock/test: Add test for UAF due to socket unbinding"). Take this
>> opportunity to factor out some utility code, drop a redundant sync between
>> client and server, and introduce a /proc/kallsyms harvesting logic for
>> auto-detecting registered vsock transports.
>
>Hi Stefano! Sorry to ping, are these on your radar?
>I'm wondering if the delay is because of devconf.cz or you consider
>the Suggested-by tags a strong enough indication of support :)
>

Yeah, it's because devconf.cz. I'm going to review today, thanks for the 
reminder :-)

Stefano

