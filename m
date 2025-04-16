Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BAA238C2F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800462; cv=none; b=hY4Gk2NydBEtMWvNx0hoa8+kms0SBIzushuTGwtm++wQHEx93YGJCzBStCoMsLOirBH2iqHFxfUPwmTUb0GRw92tMPt1PTCBEcA9MClkzk4fpJoa2YBIuyBFIvPv1+VXG/v57eA3l0SuMLjpj+KHUBmdELyg1EweW4TSlfw73OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800462; c=relaxed/simple;
	bh=ow2o755hDN65eNTebJT2nbWi3hUO9mnbMb+bi8mk81A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnxZ6Y8g1MfL/0BrPsBCpBFmIqIWIrY4DZSfChLTwHSZYbklfokxsg6seMs23KT3cNz4tNkWNYufnifM1++tNnISc3g9EL/SeYY4wuhdVphwbnxKHSWpn+7bIrL69l/IgIY5847XGSklao97K7faehXnDYgcAO59VGiciTg1IxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cJDTHf/+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cJDTHf/+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so5228115e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744800459; x=1745405259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u11VhY2QSny+fecbKoNk1f06ww5pDVr9wxORHp5CLoo=;
        b=cJDTHf/+pWVgUx8DqpwBLH3Y8KMONQVpKau2JT59QdY7ozVtBT8JWSspC281PV35hg
         lrBxQXzdJiOI+Bz3EDia467lHaUpv7EjDd1xN6D4POIvoJudZyqDD1S7SwV9PnJkJC78
         0W87TYUtHmcyrgQbFCCaj7ti3jDbVLXkO+ftzVPQ2X7Wjv8QttutK2NGpRZSHy6XPXdN
         q9lfhX4wRCKU9opd2QIF51QobbKGPMjkv3x+f+s1kmw8PAOgxHN/mhTDVzY7+QP/2Rkm
         iRNFX2aTyeItg3/MXAom1pKKfFZybdcECWS9F8QsCDnI3qyS/zkPFhiJ/Rq/zApWr8cz
         PO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800459; x=1745405259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u11VhY2QSny+fecbKoNk1f06ww5pDVr9wxORHp5CLoo=;
        b=SRtp48whTdmX83JwR7Wj6YA06b0l1MNd/h7Ns3gxWs8ZWwgylcif/m+A7hg3WP8iq3
         YF+nHkpun3KuMB+C/gpef9x+ToVscTu3IkzIxIpe+dPvXVAXFQFyfj1wwZOQiM5HivtX
         yJZVCv/2goP+vQOAHKdsDoa3ndkPSHncoONkKjSX2lhQ7hRypVr4PU/0LJqdFFIdEOX4
         a8sHNw3MGu2pbE5Mzvw19iJPdYQIHQDZX78dqPtCxogelrJ8npcqrtaWnCAyne70tamK
         bU4mErjsHxmhgDv/+S/6KGftxBTf3pCFsGu91vxo1/WMi2454DUMTym6anuh2UDAFAjS
         rwJg==
X-Forwarded-Encrypted: i=1; AJvYcCUoSrt5VxVXYbk1N7dZGRP1B0ibewyK3xizSvBi9G30SkesfMOzcKs7NQCZFSAtX+ncSiEmRcrMyOId0H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJoKdJiLMypY0jmYJB3a73mLvu3cJtyAmkx4hWlM8qasmcLif7
	e1cCO3R3uGCRd6Jcq2xBB/iDpHg3piuRMnd1pkzp8zQx+ixz6SuPOB1B+LZc8A6mne1OA9Bdqub
	MJfOWxg==
X-Gm-Gg: ASbGnct1N43RfXfJuKoZtbZVsNRlcSbGGuvBRm8U08I7i+DQTb4oCMSB03nvi3ip+0E
	NnFMonc80wKB9aUXXZ4S3gXlQGHqJc26QjcT52TBnBcGBqv/920aEC7YqIFZUY2t1RLTn67MgPK
	LlUY/0XoLeeE/wjams8gBg2n+iERx77guQHO0Sx+/MpMGVhHigl7fE2KzblkxkZPg5aRwrm+hVm
	+dQIYwyjnIDbQmbdcsEfXttN3521kXb+VirGYW7JtucauepiQWuQXkowyqPsCMmpT6EfnyTz+2M
	0XvcyMDy4LNTVKPMzmpG92FKN2Bi/YbJQQlkNpBKbCoR5l/tuubS0jIZJUi94iDog5rXDnRUH9/
	QvuZanhPn/cYMRnaAg8cvRWQcFzi6tg==
X-Google-Smtp-Source: AGHT+IHN01zeHrDQJAoZP6S+65R35C5DCBsqv0lIu9aVzxX6MmRnNY/NfVUsXR6If1SQjV7jJzSkwg==
X-Received: by 2002:a05:600c:5109:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-4405d69bbd8mr5267555e9.4.1744800458781;
        Wed, 16 Apr 2025 03:47:38 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405f583bcesm5289655e9.3.2025.04.16.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:47:38 -0700 (PDT)
Date: Wed, 16 Apr 2025 12:47:36 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250416124736.3ac2bd55@mordecai>
In-Reply-To: <e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
	<2025041110-starch-abroad-5311@gregkh>
	<20250414090216.596ebd11@mordecai>
	<522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
	<20250416094807.2545efd8@mordecai>
	<e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 10:45:19 +0200
Oliver Neukum <oneukum@suse.com> wrote:

> On 16.04.25 09:48, Petr Tesarik wrote:
> 
> > Oh, I do, and that's precisely why these GFP flags are no good. The
> > address (and other) constraints imposed by different buses may not
> > (and often do not) match any existing memory zone.  
> 
> True. So we currently have a non-portable series of flags.
> It would we better if we passed a hypothetical 'struct mem_constraint*'.
> But we don't for now.

We don't have this struct as such, but all required values are stored
directly or indirectly (dma_range_map) in struct device, which is
already passed around.

There's merely no mm API that could allocate based on these raw values,
so there are some ugly kludges to cope with most scenarios.

> > However, zone address ranges are determined statically at compile time,
> > or latest at boot time (e.g. arm64). It's too late to adjust the limits
> > when you hotplug a more constrained bus at run-time. And I haven't even
> > mentioned bus bridges which add a non-zero offset to the address...  
> 
> Yes. Hence the only time somebody would pass a flag like that would be
> on very arch specific code. That means that such a developer would be on
> his or her own. Hence I'd say the simplest solution is just to do nothing.

I have found no such thing in tree (with the exception of s390-specific
drivers, mentioned elsewhere in this thread). But whatever is possible
with a GFP flag is also possible by setting a bus limit.

If I stay with the USB buffer allocations, AFAICS the mem_flags
parameter should be used only for non-zone flags. If you specify,
GFP_DMA here, it will have no impact whatsoever on allocating DMA
buffers. It may unnecessarily allocate from the DMA zone for doing PIO.

Now I think I should really write an article for LWN to debunk some
myths about GFP_DMA.

HTH
Petr T
