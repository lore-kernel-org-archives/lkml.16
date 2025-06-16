Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D02A288C92
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095189; cv=none; b=tsC0dcy4YwBNr015q3SH8tUUdV3NdO7ciQI77pEQY5G94znagPch/APXbjSYI0KbMjyZcJ71C9YmKFmegamPd4DDI4+2ukTAAFGxQ5ypMovLYnE43Bd4N4V3IHaou5VyxgJs/bJFVqSIZL7d0jlxH2PtYBG8YWVWlCilQdH1BKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095189; c=relaxed/simple;
	bh=xFsrEhbFGU3z9UoiI2uJaXv//xa6Xz4juyBcTH3R7C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4Lyum2HnASpdc+gNHkYKJbGz/YXa7K9Cg/HMPyaA5NHa8iC1EW0T7nJsOzMFDIV9j2/Vs0tYFsX8++AtkmtzlKpmXaBNin6SSj2XGVzi3OoZ6Piobm0GPeYt6CtGPz6yVxTL61vZoUgUqFgU4xPhJ1bcuLay6xG/K/R4UsdCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oQPUQJ4/; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oQPUQJ4/"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d38d1eae03so463275685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750095186; x=1750699986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8X31SysrSCqMRM+zb4wzBK8eDdmvTJaf6Uq+iS7ehOE=;
        b=oQPUQJ4/1oySx4jwKLAAkd0IMLjz6WrFi26YbD4TOJkOl5YM0y6Nn0nVHYTJ9gZAfW
         peAaW9oCu5RrJqytt7Nte7StlkQ83wkXEpY5lQhUIZin79/sp0xIVtNjHyPRmgraA4EX
         q3iw8ovrds9hb0mDf1u9TJMrc0FZ4rrYi0EAQnv95600Q8ncqvpWm2aLv7rEjCbBa7LC
         wbuEOejizRVHrPcVJDA5qJYXUEKGq0rPIMWBHRHqgWiSrGbGkfywl5KMc6JIP0kqNaSJ
         HsM1NjwUQr+7p6GSdn1pcEPrUzMD3w/CMdT2mbKpp5oHaQbvfvwbzkZarMW1ww0WwAj/
         jfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095186; x=1750699986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X31SysrSCqMRM+zb4wzBK8eDdmvTJaf6Uq+iS7ehOE=;
        b=LcioOU06qFRXvHMhMHbkmH1ydQkWpZiK5TMipPS39Z9BCO0Bm01/RHgpTTGwAedl6i
         HimGxAoaqc3zuA/F4sUDeSP+NTyvWCfdgL3yLsbtImCxyN8TzXI6jIs2+to35ZLofTVG
         Wc1FHT+D6bMj6QkA7z9sTT7T2EPn6K18lLKCHSkPGRO02DYRJ8790g3sCpG3WdNJWAqX
         Y8r4OsFhicaumaSp60u+pEqWp7zWSRUU850ZxtAVJ1Oqybph+xTI8Yf3M6xCbjFgas79
         acTFPRJgWy0ZdUOO+vMTBm6JiVejM9mqalopOepmObdKNpgZbaQYA5PVuEMJ6HxgCrJD
         Nncw==
X-Forwarded-Encrypted: i=1; AJvYcCW/UknXzzwXBSbCvcVDtvptJgBbBtysbzvzaFICWYh+IoP6s+1qadVZ7qM0Zahjhe50Tb7vH+fLCiMuZFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BSSdPRW2GGfL4GHmhBEdmdkQE2ecBxnH5pT2dylQzyiwa5e7
	9dwQO1naF2pW0QLYVK33ehiY2c3P2+B0ydDs9SkiSdN1H70zjAWHM76njQ/X7NLjWW4=
X-Gm-Gg: ASbGncs3Q1a1KIEuM1Rk27j3CwzrLR+WsVjpyaPZ6et1gX65dn+ZLvQ3P9AR16b8V1E
	EN6Rk1fBmw7v/wE5eIdEx5zdCWTvaMgEUUWDKtzg0EURUFerqC/A7bj6D1uqpnDXBvoq0r7tGKY
	vLFiSySTO/5mXCFUA+dbdcSPknRETSTwOnDP3PlNOiLL7pQQSBrYBYmX8btLkZx90UrftbzGa83
	sZ8/lctsyvn88/sSdAX8Ag/7H76AkXWvThH95SYUd4NEy5VG2r9JNHYhVhhZuS7a2Xh69GvMQfp
	RHIzmjy87ubLnzXoorEoa6P/1L2GxNHtsoVt1CagXYcRhx5PWfz+yddG2qV+TGSQz855t25OLZV
	tbAqfd1Ndi2TTe8gFzaTAjbQklW5Q4kxvoxI0mA==
X-Google-Smtp-Source: AGHT+IF4chGBuDLOAfxdrZKfkSU9t0Ai/SG6GB1rXrSJpRvbZP1WNygH1xEW0dli48w32M0hptcl5w==
X-Received: by 2002:a05:620a:c4f:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7d3c6cdf0c2mr1264284085a.28.1750095186387;
        Mon, 16 Jun 2025 10:33:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dc9b58sm553436685a.13.2025.06.16.10.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:33:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRDhh-00000005m43-1aC1;
	Mon, 16 Jun 2025 14:33:05 -0300
Date: Mon, 16 Jun 2025 14:33:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alyssa Ross <hi@alyssa.is>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, x86@kernel.org,
	Spectrum OS Development <devel@spectrum-os.org>
Subject: Re: Virtio-IOMMU interrupt remapping design
Message-ID: <20250616173305.GA1376249@ziepe.ca>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
 <20250616132031.GB1354058@ziepe.ca>
 <8c3b08d5-24aa-4db2-84e1-dfd1d2c52065@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c3b08d5-24aa-4db2-84e1-dfd1d2c52065@gmail.com>

On Mon, Jun 16, 2025 at 12:53:40PM -0400, Demi Marie Obenour wrote:

> > AFAIK hyperv shows how to build something like this.
> Would this need KVM patches?  I'm concerned that implementing this
> in userspace would interact badly with the irqfd fast path.

I don't know. I think you get the same issues even if you did
virtio-iommu irq handling, it shouldn't be any different.

I'm not sure there even is a fast path here, remapping happens during
initial vector setup/affinity change only. That isn't fast path. So
long as the MSI is delivered to the correct CPU vector entirely in KVM
it seems OK.

And the hyperv approach of asking the hypervisor for the addr/data
pair to achieve certain parameters will work alot better with existing
Linux than trying to build a iommu emulation where the guest is
building its own private addr/data pairs :\

Jason
