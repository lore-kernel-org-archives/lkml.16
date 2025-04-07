Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE72253FF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012367; cv=none; b=U7ZfkcHMVzd42VdVtoPCu6+NobmTItL+E8qtWniCqg0U2BiNgum8Guzbsy/hd4+5qG+9rJFZtB7symTCkhnoO5zNZ6cqfOcusJqX6CFw+fPzc9s9FvNY4XQizbo5jvbuAHmqvs1MG0NXSpNCT81YvDabQhErnyPqrdcgj3lpoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012367; c=relaxed/simple;
	bh=rUX6kwf2jcF8ugrawlFPTy7xjQXkwZR1IvpwRwX1AmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQCCA57pFSbE7WWBamWaaQ6qRtWRqJO0toqSH+V62uLExU/8g0lGpC7rQh8r6qu64nZAzZp5LE6wBK08ffiM9dY12edqWvo+zEvMxEivIWwNYuAmcFdfFROFGpUhN0u3MVy/l6dSTot1vbVYq+t9HtLniFi4So/vSwqEYMtotPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dEfPSiMi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEfPSiMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744012364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SWeyxgVRp5P7mOHz2eAUtnv3gFTxLpkuE25ons4rBo4=;
	b=dEfPSiMiA2EKUviZFjwC6pQ1BjlCBHkoWLN0QiZiLBRDBtu8ODJRfqK+S0mvSzKnkkMxye
	lhMHEuU3h1i1mzRWq4vawDJUwJd/GBPdP+eMDSafijSrO/Nx7pyi9xtZB8NIcUqTNcSUFE
	vUCZv4FCoZT0NvfMVvkrvb7/Yzzj7wo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-hs8QEPL2MmGFBMDqjxzy8Q-1; Mon, 07 Apr 2025 03:52:43 -0400
X-MC-Unique: hs8QEPL2MmGFBMDqjxzy8Q-1
X-Mimecast-MFC-AGG-ID: hs8QEPL2MmGFBMDqjxzy8Q_1744012362
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso2664175f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012362; x=1744617162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWeyxgVRp5P7mOHz2eAUtnv3gFTxLpkuE25ons4rBo4=;
        b=jndhkKw7dkdUz4Sd5kFs5GQ0r/zs/RP6D1Bl+6S9Zz77RfSSmWnWyZfZXpca/hdItj
         apE1IqjpIvkJOOLgdeLx+CGi3uzS12eySMCJDEMRSlAr8lUdY7IO99NEXpih9swhTjY+
         0UqcJUHKCmUbG7zZ0D8Wh8ZG5GMp5t1VZxvsOAcV7h8qsVwOp659cMv+At1miSAH0ets
         JaDxBbeUjvcrNE/tNc+4Z9OTuYKdg7SSd0TFdUmdQ7JRXET6w5Ez4doYpJjtpxWmehVm
         aFTT0Ehwu4i81mba5oK3hJau9NfNipkDhehD9FAhhWz3H+ULZz8LeOgNGq+gitvzgj//
         Bq+w==
X-Forwarded-Encrypted: i=1; AJvYcCU4pr/wD50QUlT3q8bVhl6nwKEtoP8fVSofq7M1gVhUO4r8BjmDHr3oIwr+7KlDGrJL6J8OuG0yZP+9D/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdO8oYek90C771hfjh+HnobzKeldYd0fJuq5AANXvC6U+7frj
	tcbj+VvfbaKFf1wX11ZcgHyNAoXpk1omML37Ga2vUaiy5GmPVf1vM8QRiHIxa+XZEabRvTSzsGe
	QQz5debDAB+Si50hQqGaUEUG4drtEou4DMBUqXWbjI/NalCyUt4vO9Co2sco6u4HKWluTJg==
X-Gm-Gg: ASbGnctNYPwFwW9xQxEUQ0xOIV56Od+HaRURzu++tCBK9b3K00WV5xx/DC3yfwBiJRW
	ZVYjEWydPLWb73AFbDFVWh7m1uMOYqspVwsDPfgXPmDXnpI6ArHfRFBmOj01FGviR6iBIvXUYWR
	UMA0tWbVW041bfAIdyUKaGsZriXVWNMWS210ZGTehyDwM/WTRbOqVuc3bzea4khPSHAbCiTN8DD
	iutIeJhHkdj7jjKDCDbL5gXSE4VPkD5X4F0yZNrwFiT3nmaMWCCQ0GtTPKP6Nmyu57cm1FyonQR
	YsDsN7jjaA==
X-Received: by 2002:a05:6000:2ca:b0:39c:30fd:ca7 with SMTP id ffacd0b85a97d-39d6fc0c02emr6572095f8f.7.1744012361844;
        Mon, 07 Apr 2025 00:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJsYAXUaNdpV/VhhZQQ5RxLgg/gr/bn4kaQg3vnQsXyz4+tvGKcyIi12k0f6ULNipYdQ/RcQ==
X-Received: by 2002:a05:6000:2ca:b0:39c:30fd:ca7 with SMTP id ffacd0b85a97d-39d6fc0c02emr6572064f8f.7.1744012361448;
        Mon, 07 Apr 2025 00:52:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d75ac6d66sm4958408f8f.14.2025.04.07.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:52:40 -0700 (PDT)
Date: Mon, 7 Apr 2025 03:52:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, Chandra Merla <cmerla@redhat.com>,
	Stable@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Wei Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH v1] s390/virtio_ccw: don't allocate/assign airqs for
 non-existing queues
Message-ID: <20250407034901-mutt-send-email-mst@kernel.org>
References: <20250403161836.7fe9fea5.pasic@linux.ibm.com>
 <e2936e2f-022c-44ee-bb04-f07045ee2114@redhat.com>
 <20250404063619.0fa60a41.pasic@linux.ibm.com>
 <4a33daa3-7415-411e-a491-07635e3cfdc4@redhat.com>
 <d54fbf56-b462-4eea-a86e-3a0defb6298b@redhat.com>
 <20250404153620.04d2df05.pasic@linux.ibm.com>
 <d6f5f854-1294-4afa-b02a-657713435435@redhat.com>
 <20250404160025.3ab56f60.pasic@linux.ibm.com>
 <6f548b8b-8c6e-4221-a5d5-8e7a9013f9c3@redhat.com>
 <20250404173910.6581706a.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404173910.6581706a.pasic@linux.ibm.com>

On Fri, Apr 04, 2025 at 05:39:10PM +0200, Halil Pasic wrote:
> > 
> > Not perfect, but AFAIKS, not horrible.
> 
> It is like it is. QEMU does queue exist if the corresponding feature
> is offered by the device, and that is what we have to live with.

I don't think we can live with this properly though.
It means a guest that does not know about some features
does not know where to find things.

So now, I am inclined to add linux code to work with current qemu and
with spec compliant one, and add qemu code to work with current linux
and spec compliant one.

Document the bug in the spec, maybe, in a non conformance section.

-- 
MST

