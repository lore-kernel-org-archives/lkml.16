Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934431FECD4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359492; cv=none; b=C1Ga+7Uz00T2ahoaSlBbWti6n024lWZcIQmNMaXz+LDwDHcq3FsZS1SNJYnbuUqMq8VtB4JtFiT0L/UO3I/4PrqmwTpBbCoJKM3S0GdmqQh1xromFEw3wXHal4JKFVxSxqf7GxxiZ52xkxN/Jcoq0OrM1g2f12/TKuMaqTLhOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359492; c=relaxed/simple;
	bh=DHq00Jy8ArlG0uUG8qvA+p71m24QNxsUjm+9An1VpRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhJXnzQpOxasfU22GyirVi4NxYLjJzksHDjYcHQ8a5Q66eEundoo1B224+DKe58dziOcI8spES+9bHzSam+eDkJlOmHgQD3Z3y7M4VXVjc12HXolNNC1pRX776TlpxKhhvOo5VjRYhD6Awof73sOHA1gtEdG9FK2Nfoq9mn6FnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CITt3eBM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CITt3eBM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso720001a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745359490; x=1745964290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHq00Jy8ArlG0uUG8qvA+p71m24QNxsUjm+9An1VpRY=;
        b=CITt3eBMOLKWfqhaEqiIyHyPNBdkZdHu3w5zCyJ0Uak2M2tkAf7QQOaBUpYzW/qcub
         SIYxqB1ebnQBhMeaodL8NoohqX4/BSNosNKMslsXhiazBez88abTVdhoJTV2nZ4zu3J4
         oFCZx/f+9Chp1wbyGE8CkU2AhRL2bTMJumi/H23HIJ/O2m5PFEkXt16q4ymqEYLFWNqW
         YX0d7ZQrhrzP2FckVy2WcmOwEv5Vj0NiP/iuM8k1r5i1axDroBwl5P2h0FlFe8P1dwN0
         wRebk0bB2SxqjvDQjcqLwtchysvzha2QKEKA5KWx/nCgfPZvkYOZzd1BdeQMcyrVXqQH
         1O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359490; x=1745964290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHq00Jy8ArlG0uUG8qvA+p71m24QNxsUjm+9An1VpRY=;
        b=cDqmWK30e24sf5HKPYo+Kex7OeWl9kIz+SPlNzlhppmUeHA99PCSrLgRNFG/nNRUqy
         Xr8u+rZwh3OtRBTTrS4xIeF3sySOR8a7IoZLAssL+4BDj4ETR158m79YJfbVs2H++Hmo
         B9wsdGpU/KLV6i4EPPCb+WbYuByKxHNv2e3/xkyvIxL/62wyQ63HgCNL9MBf8vASAVcU
         rU2iEyWUrelSpdnkL8lOkWFheRoFm56tQh0j3UmlkkuM1VXAfWuO+N4qREjQt+DD02GQ
         Mg17hKPKEENFJVdSbVrCG1K835mklthFSnO1pjirk6h7ycqTe7xIBQhNcB5P+GmwsQja
         E+5A==
X-Forwarded-Encrypted: i=1; AJvYcCUi83ZL/FJ8ESp28NQdl/AGkfuFoUOf+EgN6tKohwv8it//0/30gDL+kM6Ml5FpF1yTPi22+0+Jq1oeLps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+QqawMkCRGoFBis1GHoyLEl1i9P75Vx9pXkoKr8HA4/sJz7vs
	CU6Q0gSfwz0rOaj8kn8qNxl8iF3pStLd+h7T3AKi10Fo9hepC7GvBQqcO4it8UCbfNgqpG/kDcP
	fryR3USXr3/4mj1XRlyNCDG/3/Zwc8pIW9axc1lO0HPvEwz+3HLYfQA==
X-Gm-Gg: ASbGncuWYzSynCsu6plUg8pSMKfsbbxAPCJ4BIw34npY0yUjbjSuGQR+qDxb+uFGVvk
	/LWY9V3UnLAYi9DtYAdzy0s2QWekQatV8BEpAQ66RsRDWKx1J1+XyNwucYukvTfSipK9L2nFb6B
	pNxEzLTJ5O3aadWJnzcNZH
X-Google-Smtp-Source: AGHT+IGxTPbKr9qKYKe1IBO2sOP3lYbwPMBHyRNRwoKnjkYWlMMKK1yxTaw37paLFCn3ldrutm1hXKT7IveI3tfJZGg=
X-Received: by 2002:a17:90a:e7ce:b0:306:e6ec:dc82 with SMTP id
 98e67ed59e1d1-3087bde2b2dmr8960212a91.6.1745359489559; Tue, 22 Apr 2025
 15:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422161959.1958205-1-csander@purestorage.com> <aAfWUGAMTpwsHf2b@kbusch-mbp.dhcp.thefacebook.com>
In-Reply-To: <aAfWUGAMTpwsHf2b@kbusch-mbp.dhcp.thefacebook.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 22 Apr 2025 15:04:37 -0700
X-Gm-Features: ATxdqUGYBZdgRQ4qkjYHTy-PaoU7kaf1JKmQBOijRSNMhG9jko2qg-c3dICA2yk
Message-ID: <CADUfDZr5nq9fAvxSZJwUmuZKry6pHqLrucLtJLmV8cAvZ6O6eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] nvme/pci: PRP list DMA pool partitioning
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 10:48=E2=80=AFAM Keith Busch <kbusch@kernel.org> wr=
ote:
>
> On Tue, Apr 22, 2025 at 10:19:57AM -0600, Caleb Sander Mateos wrote:
> > This reduces the _raw_spin_lock_irqsave overhead by about half, to
> > 1.2%.
>
> Could you try this atop your series? I hope to see if we can squeeze a
> little more out by keeping the spinlock and list links local to the node
> using them.

That does help save some CPU time in dma_pool_alloc too. It's down
from 0.87% of CPU time to 0.52% while doing 5% more IOPS. I'll include
your patch (with a few tweaks) in a v5 of this series. Hopefully
you're okay if I include your Signed-off-by.

Thanks,
Caleb
