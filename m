Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CDA2EBB95
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189469; cv=none; b=KjnNKQCfvTkBi7EhG6WCmYNR9UtDzk0+Vjin8f/Aj68C541O7AqyoBXbSglLFmaHQEoxBZQd8vdzqNGRMacip49yGUclYplpvdRWOj6KdVyT69uCk8Ql/dixUpQHhX16kPVHzTOyKfqpTMw1cdoxPv7sPu6amKgL9XC6QGr2nII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189469; c=relaxed/simple;
	bh=d7Qa9uTwQP9IlFVLep+Lf4kR5fWHlvWelL/qOpCe/Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9iDmalaWpD4wBaPXsqid/PSTqUuJsS/E1tV91bQ0uLCLVdDV1UamhDRbegR7ZiyigNHfbGWkUe88+i8v/iZT7zLwLSzsHHG6uOF2QadcXuLCS4Z4NlxZe/iTbPfdcN8acAGNNbfgpBNsnjC+q4c2qJzqMMVwn9Kodri/tkxNKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKG6LGoL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKG6LGoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750189466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xz8wxuAlhJWtQEwDScEI86WHmU+E7vfWayu2m96ONxo=;
	b=bKG6LGoLNXCfL5oBx7iG+72InMHC242OBpDsXUGuZ9g+h7MeUxbV7gghfqwMrg3OtC7egU
	sllsZWqUbxw7CzPz2gUfmUO32wwMWdnMtdhpSLN5U8nJpOPjW+OguNPPn38KaO2hXV5ENj
	tnxzJMjqk19BfngCtJaNRuLDgVKi3y4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-azC8hDB0NJCv5gkpDVf3Lg-1; Tue, 17 Jun 2025 15:44:25 -0400
X-MC-Unique: azC8hDB0NJCv5gkpDVf3Lg-1
X-Mimecast-MFC-AGG-ID: azC8hDB0NJCv5gkpDVf3Lg_1750189464
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so10368f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189464; x=1750794264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xz8wxuAlhJWtQEwDScEI86WHmU+E7vfWayu2m96ONxo=;
        b=bQL8Dsmvp6X+/yrB0TbDLDtPf2dNO6u1ieye4cjlXGfRezjbS+82JIMSFRSHQeLLW5
         PqVTCY0LSKgBSii60M8Bi00YMSv7WSGNgWtRtm1CsNXOFyAf3AXdiEO2wipvYxaB8ufQ
         Qy+U9LmoWqGuU5OBLm/uVRivhSPYs2EZeLaIdY6IeSqLclE1rD68IWoWsbc+hDmyw9/6
         lvMY4nLFUIoqjp3Czy5th6g3+qW1UbDOMCewWmKxwJtrYjyvDaeaW3RwAOgoaRShqE08
         puqvrT22aiKDToKXVZd23aBTxc+a4DfJuOvuOMpX0htcYp6bTC1vBhYn8Xf60xDf6+5h
         uFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXH4IyuoPVOM7hKlYE+c7qcj097aNMG0JdMQ844iR/M/IWWtMqKzRj7KkbAyTkrH7v3JdCtA61/4jurA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzX4+gejTHieUiK8WEzJAzDGLNYcgFmfQZxem8Qrl/DoIJx5X/
	GRj0YcO45LGkZ3iFyLo43bs5X0R7L5m8qlfpEp/jnCO8+CqT0UgC3UEgF8DQX3Uh3Z1hBKYApON
	qvdA5SSUqyk9wb6n+ogRtrP38r2U/gk1YP0vt6oW5YYH9WYLBSmwEVlwT+p72uSesHQ==
X-Gm-Gg: ASbGncsFCVR5P+Ptg/lLLCUEMpVPlp7DueDa6BbBobnP8XR6v+R29mGI7X2yUDMhSnQ
	EZlSxW5uYh2TvqRXdRdYudLt6DbIqoooZUzyT1DLyGWL89vGAY0oxMxpgj42Ar1V/bgQJ6ILJLM
	MqrPBBI4lUJpFH4XYz5eSk0iP4NuPhrueoZ2NQFuh7WwxDjqG2th6ybrFCuMFGeFi03JeG7j3Ld
	WR5/uUxMZNdzt/5D1Gu278e3xKW9PBfVM+IwB3l2PaoPhwABprDsvnfepnZpquPXLJHEnRoSDVk
	yXquj/hdAdBNQYfa
X-Received: by 2002:a05:6000:1884:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a56d821e4dmr13616048f8f.16.1750189464058;
        Tue, 17 Jun 2025 12:44:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT4nXs8VZp00DXkDGFfmjcwryY7G0O/06cxd3nB1XVq44C9m+cjUSonQ6A1euh9PZFFnKMsw==
X-Received: by 2002:a05:6000:1884:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a56d821e4dmr13616025f8f.16.1750189463650;
        Tue, 17 Jun 2025 12:44:23 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:4300:f7cc:3f8:48e8:2142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b09148sm15304977f8f.58.2025.06.17.12.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:44:23 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:44:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
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
Message-ID: <20250617154331-mutt-send-email-mst@kernel.org>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
 <20250616132031.GB1354058@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616132031.GB1354058@ziepe.ca>

On Mon, Jun 16, 2025 at 10:20:31AM -0300, Jason Gunthorpe wrote:
> On Sun, Jun 15, 2025 at 02:47:15PM -0400, Demi Marie Obenour wrote:
> 
> > Is a paravirtualized IOMMU with interrupt remapping something that makes
> > sense?
> 
> IMHO linking interrupt remapping to the iommu is a poor design,
> interrupt routing belongs in the irq subsystem, not in the iommu.
> 
> The fact AMD and Intel both coupled their interrupt routing to their
> iommu hardware is just a weird design decision. ARM didn't do this,
> for instance.


why does it matter in which device it resides?
Way I see it, there is little reason to remap interrupts
without also using an iommu, so why not a single device.
what did I miss?


> So I would not try to do this at all, you should have a
> para-virtualized IRQ interface, not an extension to virtio-iommu
> adding interrupt handling. :\
> 
> AFAIK hyperv shows how to build something like this.
> 
> Jason

