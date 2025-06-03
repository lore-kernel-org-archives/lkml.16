Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46244A0C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 00:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748910691; cv=none; b=ukzJxXxBZNoned0uRQx2Iw4wHcQmY6zrWwLDbrmCEWp4gAWzKT4TBhAUoWzJcZsIPKZE/rUvV0DYEfHvpSzw26ojO75NyjLygypwlue9KSPMCsmtQpstsY5/AJ+3O+uOBlnoi9pDu6vDDveI3U8vvBRVxjaPsq1VK81fLmlMFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748910691; c=relaxed/simple;
	bh=+C0Gk9Lo27j17lR1Om5aDZ1uBMHuV88Of7KaaLuQJvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdMIPyjl9uQYVCz/RzQxmP1rQtQtD0zVtVrY2yYLi/FZV5uoV8RJVzuV8H1Mf1c+kNjYzevjFAxVrekrpgVo1emFWPsBEjVoPPZnsBGR5VgDNswLk8d7DrmJ9tjJ6xkMROTloL8HSMmMhvS5dfCemEFuPZ3TS55fHYMDwD1n9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtZx3ZlD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtZx3ZlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748910688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ub9Ld5Og2J794EXigKYKviTvauaVfB+CsjKmCFqc+fQ=;
	b=GtZx3ZlDScDNy8eQ4sdpV6IC7QSdavb/2EDspbbtRQ3NXByL5epjYO6htBrFET72jEoJOs
	nm6LVXl6UDKq82AG/sznfa7z2QRSQJvdm6oXYvb4hMhLNPFEKjHPBx0yTcgCr4mNSY7VU0
	woZ7ZqYpopFiDsa2kTl2/fkCeVxh5tQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-MA6RoPzxOs6I_CRdB2a-xw-1; Mon, 02 Jun 2025 20:31:27 -0400
X-MC-Unique: MA6RoPzxOs6I_CRdB2a-xw-1
X-Mimecast-MFC-AGG-ID: MA6RoPzxOs6I_CRdB2a-xw_1748910687
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so415778885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 17:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748910687; x=1749515487;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ub9Ld5Og2J794EXigKYKviTvauaVfB+CsjKmCFqc+fQ=;
        b=qYcyJudw/Sw0Cc7vJOYiUKxiSZFh8q0UV4Ph+ubEVQvYDgAlBVYyUGuChZWVjLT4k0
         CUNBdBZtyjUnijgmMh9v+cEADCroGLpg9xA1JS3DUqnlwu9F5gj9lEub6gvw01P8r6Nz
         4j5XvrzFkW+cUexK8A9Wzkdx+q3JRPCDb+98pPKxnSoOdc5lWPO+490c4obGfqzWHERG
         39445xbXiFYXpNW4GH0NJNxJPs6SQtgUQ3oD4Nmt1hrTLnbWGLU4kZe8xbPlkfi9goNH
         Cq6BLD5Ic//Ic3SKFYk0caXOpFbmOwpeWraJ6nwCBchf4tPcHKzfnRJy8TOW4aWQcutl
         6kiw==
X-Forwarded-Encrypted: i=1; AJvYcCWNGMwrErKbEA53pf5rJsWX6D/15Bl1GqUeoBNTf0t9UTGdqpzL565a2JpuiIcZMGJjdJF75QuEdYaFvDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1W9tQVORG0G1oM+pTyLj4Mpte7DdnqtI7Qtpp+H8U652BH42J
	oQBib4uIpFxIN9/pe/wDLuA/iIS8TsVilpnQr/P3iG+yazNkZPLpi8VOCx3dKMoIxXaYiIGQOZ+
	fSJj0BLog7jHemMplWW0jhx8sneyXix5shhrhZwk0pKxe0uZEK6oToO8igxqI2AeJIA==
X-Gm-Gg: ASbGncsWWecZXEhV+hfWE34qjfZAhxrPEO4/8JGUAPRr0zhVQNCfaSXfIAdec2ByZWu
	u03BpyEzu7riCICZ4AgNZJ8OK9LtdSXAYmKnMnsJgnDjRhKuggSNj2AoNYmVShD2/Bt1IUS5fEr
	hnoOPImwTF3KC9Zu5zrrw9dPfpoGu108UV+kQN8rOMhT1TIGCTXbuwWA1UezUlMzpqnvHdFjYGV
	+cBEOlQAokO78gFbvySahzLAB8MWnvBwbnnsU1ofmgzRGg9v5l0VL+nvliY6JAI3Ze2RtTrA99Y
	JN2372ls9ykD50oI6hRIJ7DNWJ0Y6W7IfkA=
X-Received: by 2002:a05:620a:4509:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d0a4e394e6mr2020790685a.28.1748910687044;
        Mon, 02 Jun 2025 17:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXeGj+rAUYQBxhqVmcHl5R5OWVK/TVJ/1hYqSQFU3Oar1jrFtXFjwuXkb+WGyr5ryDc+1iw==
X-Received: by 2002:a05:620a:4509:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d0a4e394e6mr2020787685a.28.1748910686549;
        Mon, 02 Jun 2025 17:31:26 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fa9sm726038285a.24.2025.06.02.17.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 17:31:25 -0700 (PDT)
Date: Mon, 2 Jun 2025 20:31:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on
 clk_ignore_unused
Message-ID: <aD5CXNy5Qtbe5cOb@x1>
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org>
 <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
 <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
 <efd38edbed2743a258bbec7e80ff2238.sboyd@kernel.org>
 <16fd590e-7a00-4e71-a003-d6aafa83567d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16fd590e-7a00-4e71-a003-d6aafa83567d@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, May 22, 2025 at 09:47:35PM +0200, Konrad Dybcio wrote:
> On 3/4/25 8:34 PM, Stephen Boyd wrote:
> > Maybe we would be better off with a config option that removes the clk
> > ignore unused ability entirely. Then you can have a kernel config check
> > somewhere in the build process that verifies that a user can't even set
> > the kernel commandline to change the behavior.
> 
> I used WARN specifically to taint the kernel (which would in turn throw off
> any reasonable CI checks). Perhaps we could add a Kconfig entry (unless
> there already is one) that would do the same, and clk_ignore_unused could
> be gated behind it.
> 
> But then, it would make it harder to debug production kernels with that
> parameter, which could potentially come in handy too

In addition to clk_ignore_unused, there's also regulator_ignore_unused
and pd_ignore_unused that should also be considered.

From a power-management perspective, a userspace tool like powertop will
warn about various things that could be improved. For example, on my
Thinkpad x13s laptop, one of the warnings given is:

    Bad           Runtime PM for PCI Device Qualcomm Technologies,
                    Inc QCNFA765 Wireless Network Adapter

I think it would be useful to add a check to powertop for the presence
of any of these three kernel parameters.

I know that power management isn't the only reason for the original
patch, and this won't cover the case to give some kind of warning where
the various core parts of the system controlled by Linux are not
described in device tree, and the system is relying on a resource setup
by the bootloader.

Brian

