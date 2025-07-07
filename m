Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3725525F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859871; cv=none; b=ElfwBdcuvMZihEAHD4BlmtSqyIDRMQqzAnlBdofawy8rWVknmu3/ZTUP7Bw7o0q5mgTYXyfft8bchd4wqZZwlbeAkuVafiOOzGYKzf4+gKBaRsRCwVYa3xECnHM8m6C5zmjrcnlG6CALBX0RtRIBSWYCkwBlBxfsGjfwnrPhPYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859871; c=relaxed/simple;
	bh=v+lWgSyoOtCf+VjdFCWVDMbMmwGujDRm79XmRjvY/vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0Rck2Hv6LhH6I7b/HtghNa75RYMPxMd2AGxB2jBn1F5ekYsPCXs3x1NMLfVdWFP2tsGbmqPNCEurSWVK/1NhjRcmOhpiklEYPVb0E7mRV3UsXeZtXmTBKK0wKre86wOBIKwyBB8Zuz0f84TB4JlfWnz4s7L2adf6wb5HEt4YRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Uw8F2oXo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Uw8F2oXo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-749068b9b63so1462640b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751859869; x=1752464669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9T7JAbV7vhWy0qtdBRWYfecJwaqMI3weyY2as/tnrU=;
        b=Uw8F2oXoYUXS1o3vVGFxIGBl2LBpQAFca6MBWcobKIlzgXEXbXaz+06Ie4JkmR+KCY
         E8HVCXv+7nHpryizyOVUbTiODNcup0N6KqdN10TnOk3QJp04rp579+sz7rHrihuEQ/8m
         M/qXVOovBjB/1D7D+Uwugutn5q8s80wPaie5s2XCWppL6rmGtMK4Djdbn5tiOXWADwB4
         wkEW2wahocnywgBMYpF+F9z065v8S9zzSLaPfTfPVqKCutSfz4QxeETjVDNa1KQEDEcV
         97opmWCwkXpjk5qb/Hg6D/+c4uClttOc86UUeecsPVewuoVVenaDV4mfzbJGRn5T54J5
         Xp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751859869; x=1752464669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9T7JAbV7vhWy0qtdBRWYfecJwaqMI3weyY2as/tnrU=;
        b=DndjBRzfkOZCkc26YfgRQtOlRCy2Rav1S13OtBp7nrOHPdtiFLHfflhtZlFSvdaPvg
         rmClYl3CyC1JJgmQx9fl3EF+YN4S/Jlb6t75FAv6AiPkfDH6J/jBQ3xkC+wAGxjD42SN
         l0FLxwhhx7zyLr9zsHJ93t6jxIehCbWZif/8GyFcS1+Rdo9e1Bvjd/rOQc5Fptwusdb8
         xjEvnCg3USjrbxnWQx5tnvyCkyPFP3LFqAnO5GCab+4Dn9MErwSfp3zL87yI2NmTNXM0
         WYegvS636J+asgufsnNsKhPa5g/MXMfuq3/xwx2p4KShJ+UEcc1NFAcdXbxTsBkIhvIO
         0ojw==
X-Forwarded-Encrypted: i=1; AJvYcCUMzwOiFaX6PnhvbObNiAc4TtQ7nFICtXVIZHwhefwc29KOU86CF1FYern2mTe1nVtOTovZwSLf7JcpDkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUdlGfkIYDA7RXyX69c0UY7q6Ukfeaf5bJFJYZK4YwaJyGZZx
	iPzcjC93Q+R7IKQmnrkVIELWsXs+/wYplXE8MQPF1UiOoi2X/LRZa78T7GSSKYmI93o=
X-Gm-Gg: ASbGncvfEULOi89MgQ9Esj0NtEoak/rUv6m8LRW59AEsMYkdueJE4/jPMCFaFcS/+9u
	jfSrIGGbRCERzEQYg8gIQFROgO+mtxOK9ci84HQWO/z9vFC/thTGnEtmXocwrm8QThn0aBv+JTx
	2n8nrVkdR3yG8urSgjsBlZzvIM0PhYjebcxIbHOKM3439/0/gkTYw/Udq4eogPqzZxLuxsLwIVU
	8aDJlYROOSwNSOFPs4A6THZwYbLXy3zWjxM7Oar6dsyK8vMa1O/M2myabaXQCQdyRf12dXmAEeL
	fDr3IxjPnInOA9K7BvLltvefMznjaNARV2nS6RwypqErG2vWRXxjKKT5UH5YBgWTU1+FA9HOBwr
	0NjwoIFbwG9xa5Q==
X-Google-Smtp-Source: AGHT+IFhikC4ANTNT4wO7MH/YDAPzkIkD1KcHaFO9YiTTHdwtSqlnsVb8YiTPSRI5B9f3J+BTMiLgw==
X-Received: by 2002:a05:6a00:1828:b0:748:edf5:95de with SMTP id d2e1a72fcca58-74cf6f309d2mr7682954b3a.10.1751859869592;
        Sun, 06 Jul 2025 20:44:29 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429a003sm7735262b3a.112.2025.07.06.20.44.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 20:44:29 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v2 5/5] vfio/type1: optimize vfio_unpin_pages_remote()
Date: Mon,  7 Jul 2025 11:44:22 +0800
Message-ID: <20250707034422.60153-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250704171123.GK904431@ziepe.ca>
References: <20250704171123.GK904431@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Jul 2025 14:11:23 -0300, jgg@ziepe.ca wrote:

> On Fri, Jul 04, 2025 at 10:47:00AM +0200, David Hildenbrand wrote:
> > >   static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> > >   				    unsigned long pfn, unsigned long npage,
> > >   				    bool do_accounting)
> > >   {
> > >   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> > > -	long i;
> > > -	for (i = 0; i < npage; i++)
> > > -		if (put_pfn(pfn++, dma->prot))
> > > -			unlocked++;
> > > +	if (dma->has_rsvd) {
> > > +		long i;
> > 
> > No need to move "long i" here, but also doesn't really matter.
> 
> It should also be unsigned long as npage is unsigned

Yes, unsigned long is a better choice.

Thanks,
Zhe
