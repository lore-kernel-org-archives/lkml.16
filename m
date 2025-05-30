Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67D74040
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748567550; cv=none; b=ofI1FzL9CySRVEvfKtMR3VNATW5k1266ZKsFKuUhqo7+bhkgu1++JlVijCsE9mqKJU0lzQYLUOqaovdbfmlSWaAywXvk3tXlTm1OFuqtdaU+oa1ZFLaO6/7khK5uCLB+TFyA31tplpEZMgoIUL4oVwVe28x4icHcAQyJbH4Gc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748567550; c=relaxed/simple;
	bh=clOYv3dnJ+TShXUkp1L3GsXOXqSgKF+RNbjkUtidq8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+g+dgIGdWyKOWVGImZ3d3M/i3VZ1tIT27AT+BZxFd33lqplE9VabKfq71DpHLMgFqV+MZAr5w8TWeWmJV3QN3sr4TwGWdJCvhVF761cORSuBrM2U7bSOkLcDDCRdbjdZzIWq5f1woeZzPvG1ORIv3WKf+ADZoP6rbWbTFMxJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=jRqFkbqu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="jRqFkbqu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2301ac32320so15582025ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748567548; x=1749172348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3JilLzV2DHootoqEMA3T8iks5XhI6tqHSdU2GxYNKU=;
        b=jRqFkbquJ3SUsLiMG/rDjtFsTef8mz2stufBWJAJaOIYFKtOrjAq0QTK6nW7lRb21d
         1WEzTmnFEOwaXHqPOGm58wFX58r0m3FZDCdPzoE3gWLmzS5NE8Iw71DlWaaSwq3Mncf3
         l+MZclYZ6hLUPFbO94tadaNApnZUkDERstRJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748567548; x=1749172348;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3JilLzV2DHootoqEMA3T8iks5XhI6tqHSdU2GxYNKU=;
        b=aUxp0xDYM2aeH6ka3DWgvNeIaHpQvKZM0Fiptt77byV+fLGqX6afaO9OpmnvV0nT50
         jqSQoAZry4yLGS5a2QGrADuqHu4MYR8uPYXyX4ftWupVMi2OVfCnEvp25CfokKF2cgMF
         /HV4CA1OWt5p4Ak8uEm8fpfSOylei6is8tHXb7kfpTegztWkeTIpfUA9qpVyjZibhLpC
         gHuxh10xb5VCzzyrULkwgDaKM/sIbe73+ANtldCvubd2mCGL1gEvifbWnFWVqDTO3QS0
         5DBHgiCNQqiGFYs2UzP2qcQCpxp42bmBPYGzrL5x2suH9k/lW06RBRrtn7+hjPZ7sDsW
         OUnA==
X-Forwarded-Encrypted: i=1; AJvYcCUHLMibcaECmAliHR6CMe4JNqZTD/60k8m8nG7/xzBB6AUveQ6UWirXpYqxsgArt3EZj5GocvjSMm0dgf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKC1PVflClpij+Jf/jwC0NpYqhEIRAUXGlV6n+MqOarKVvnL14
	gDkoL6Fj11zuCzQEADoN72QwRblvYeDoRZHB98ZZPxDil4ogb5QbxjoALh0YH88eyDk=
X-Gm-Gg: ASbGncuHl4i51Bx2Rjz+yworwBqmIOG+61bg4BDUIxvvfypTYkuevXIMW9C5fSbWYfQ
	vGo/BMGQ1t9kdNdIcJBh8SG628M5cER4TmhziF5yExQANY+6lR3BMl9WaMNa7Wkq/ms/Z0VbhZj
	RWx4nTTGgJYW0qAa2xCTVxidsOdU0gy8pfuDdR5C0aljKJha/eiOFfE1tkZ4EhWgOxp0Wy95yr5
	SSM/8ycAOESHKOZxaTHkp4N7FDjXVyxNwCxrY0Id3ut2YQ4xkitKbBBJ+xiV4dn+FKLdj3G2lHX
	EbJm0PwIHgapU+Zl6dgcCdLfjy6dbjyaFY8WapxdzzIn/rjy0eHzwsS0ocHIW7W1Wo2ozVs9W3s
	5GI157TYB6vX9NWzg6w==
X-Google-Smtp-Source: AGHT+IEfiZxx6lbiiXFwfi8oNgiGKbU3wyp4lqiu0NJfRIwH51vrgcK/4RpBMyMXJ6wF+G+lYudcaw==
X-Received: by 2002:a17:902:f683:b0:234:ba37:87a5 with SMTP id d9443c01a7336-235290e65e2mr20475055ad.25.1748567548437;
        Thu, 29 May 2025 18:12:28 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bca137sm18118685ad.10.2025.05.29.18.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 18:12:28 -0700 (PDT)
Date: Thu, 29 May 2025 18:12:25 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jacob Keller <jacob.e.keller@intel.com>, John <john.cs.hey@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug] "possible deadlock in rtnl_newlink" in Linux kernel v6.13
Message-ID: <aDkF-Q5K6RhIX5MD@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	John <john.cs.hey@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <CAP=Rh=OEsn4y_2LvkO3UtDWurKcGPnZ_NPSXK=FbgygNXL37Sw@mail.gmail.com>
 <c9b62eaa-e05e-4958-bbf5-73b1e3c46b33@intel.com>
 <aDjyua1-GYt8mNa1@LQ3V64L9R2>
 <20250529171640.54f1ecc6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529171640.54f1ecc6@kernel.org>

On Thu, May 29, 2025 at 05:16:40PM -0700, Jakub Kicinski wrote:
> On Thu, 29 May 2025 16:50:17 -0700 Joe Damato wrote:
> > @@ -1262,6 +1258,11 @@ static void e1000_remove(struct pci_dev *pdev)
> >         bool disable_dev;
> > 
> >         e1000_down_and_stop(adapter);
> > +
> > +       /* Only kill reset task if adapter is not resetting */
> > +       if (!test_bit(__E1000_RESETTING, &adapter->flags))
> > +               cancel_work_sync(&adapter->reset_task);
> > +
> >         e1000_release_manageability(adapter);
> > 
> >         unregister_netdev(netdev);
> 
> LGTM, FWIW.
> For extra points you can move it after the unregister_netdev(),
> the existing code cancels the work but netdev may still be up
> and kick it back in..

Good idea, thanks.

I'll post something to the list, but I don't have a reproducer to
test. I'm a noob with syzbot, but maybe there's a way to trigger it
to re-run with a posted patch?
