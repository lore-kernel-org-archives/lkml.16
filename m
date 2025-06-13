Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869DB17B4EC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838428; cv=none; b=lN3Y8/x0aNz43IOQE5p87dPJG52lFASHyaLIggSBqP3pwJrq/RSLvVU6zd48IAF/NDJ4GzSu6dsTDKkYhQlVEJvE6cqCnk5N5wBClKAvVWYxLTS6GhUd4vhyvc+a3f2nbPGPmL7Afp6kbcqa5oFQGz92T2L+VtS7ygLGyM6ap3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838428; c=relaxed/simple;
	bh=UmgzyBzQ/jgUw39z2VUJbMgNeLwbSTLTYJ0VBxIVoxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKfUU1ev9wuZ8d8P1X+eNORpiM16CfisTgTHsCoFqGjYS9hIFaSzLzXISZj7AhhJ3U/ddHkyyrrrHz3YshFA+SkgHi39QaqucwQ3aZTMMyMFho+XdQpCetT6YEjD6zKFJEiMHVeWT4N8RL2R4o8a7x+5X3n7vNmQpd/+ukOwgk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srVXObpj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srVXObpj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso4478110a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749838425; x=1750443225; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0INhtq8UslCI0h3j7LA2BL7iWR70QyFmUejwynW5DK0=;
        b=srVXObpjf9dkc2+PC97+KpAXQ4Lsu0HR/LTLJj2SgnZxH/1wx9ZycckFUpy88m2kQY
         /1k3DbaW9cOEf0ES9XOhprPwwyR6viZgXde0NS7z/WqB4O9l5raLE8qMtDUcWaeAtoEF
         vJLWkEHSKDtNX4Yyx8X4jIc5lElnNSP1oPW82HwcsqM3Vd3CTrTvjLRjEZY1LtmyJIgw
         InGkglEcvvrFE2XWmv3rn5u0T/bSM6vZo+fFssJoiuXFdaXeKE43czCsMGOl/m8hSA21
         dT/DGTUR5vw5cbrGgFtje/b40JysRMKUwzRy7F8NQtdyLzTxG2/gwolREF4M09twixpK
         PIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749838425; x=1750443225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0INhtq8UslCI0h3j7LA2BL7iWR70QyFmUejwynW5DK0=;
        b=rTeX69mJY2CcbnxnRnoZ+vnervVJ0jba2pO4auqpxryNx6pVqUg/+XgLx2bGCuv5vU
         BnFdtHBWRZH9KxhJBOjjZvb4pVexRESd5TScTXVHaGC/+3KLG4ixkwAGWCMfv3xHQplA
         +M9RhJxbTJaJfuO/Vd3Tany7ESxIiONLesvhQvOmlR78wdwR5p07QKMFq60y5E+3UZsO
         WaW8ZGTm0lR+d6OTCgC7r3TjvY9CDWVlOE/L0Otnm4KMvdWtFTfv/O3ORX+MTLnuUlRl
         bhDrmtnSFUb/uOnvM2DFil6slIoESonyCFWulHLbwz5Y4wVEwuKsbbz+IHFx+Qjq3+VC
         /Fgg==
X-Forwarded-Encrypted: i=1; AJvYcCWwvHqYUnaVymkwJz1cr4ja8zfF5AVO25qnZKQupl4Yl6jkNEmI5D1D/QTTTrgn0/Mkg4d+AfiwUDdQ7FY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywunx7mQ+13Q3crTEfw2SSFxb9zDuI/rKZh1CaH6BKOR+Tpwd1D
	LT00Nip8j59yCHydqhIUyvAW29/PMEqIHsE+6Uxo/5MzLh+pwf4+aEchktc8mcyuu3syjd/npMJ
	6SfD+
X-Gm-Gg: ASbGnctJ76lYUyImtya1ApbtfDUUAu1x+jq/1LjduAuURgXcXjpZ6gzKCYgzB0FUk+P
	hkHms6fOd+P9eUTuc4fW1v5UeyXaOLHjEL9KtwgPf2EOfGQEYx8vZ0n1foR0CjosU2IiMjttJYq
	d4u2235EZEiqaIdNXhysxXVpQrNtv8V5lacU/EedrVCWO70gQOD8vbkHtbbHtXtYJPIa0W7BDWR
	qMBHvLdoJMwC1MOoYQ8wtwxXNsoXFjOLzA4D80rfUM0El57ayTFNUcaXXPi60yr7SnjwvoMansM
	JJGTNa9nwx7nc/nKLTPMYcfxLXXrtVRzn5r3SFZC01dQlR8gQ+V55b2YI/y067IK2PG8WgTiJq+
	0TPkYBb4spJo=
X-Google-Smtp-Source: AGHT+IE7chg7Stgbh4Yr4tdDPknvVXXUYCN1Cbm/Af0sSgXY5X2QBDtOR02WyyHHfHlz7aluSu81iw==
X-Received: by 2002:a05:6402:2550:b0:5f3:857f:2b38 with SMTP id 4fb4d7f45d1cf-608d0948ae9mr218552a12.17.1749838424741;
        Fri, 13 Jun 2025 11:13:44 -0700 (PDT)
Received: from myrica (92.40.185.95.threembb.co.uk. [92.40.185.95])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94d18sm1502508a12.67.2025.06.13.11.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:13:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 19:13:45 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, virtualization@lists.linux.dev,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devel@spectrum-os.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: Virtio interrupt remapping
Message-ID: <20250613181345.GA1350149@myrica>
References: <c40da5dc-44c0-454e-8b1d-d3f42c299592@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c40da5dc-44c0-454e-8b1d-d3f42c299592@gmail.com>

Hi,

On Fri, Jun 13, 2025 at 01:08:07PM -0400, Demi Marie Obenour wrote:
> I’m working on virtio-IOMMU interrupt remapping for Spectrum OS [1],
> and am running into a problem.  All of the current interrupt remapping
> drivers use __init code during initialization, and I’m not sure how to
> plumb the struct virtio_device * into the IOMMU initialization code.
> 
> What is the proper way to do this, where “proper” means that it doesn’t
> do something disgusting like “stuff the virtio device in a global
> variable”?

I'm not familiar at all with interrupt remapping, but I suspect a major
hurdle will be device probing order: the PCI subsystem probes the
virtio-pci transport device relatively late during boot, and the virtio
driver probes the virtio-iommu device afterwards, at which point we can
call viommu_probe() and inspect the device features and config.  This can
be quite late in userspace if virtio and virtio-iommu get loaded as
modules (which distros tend to do).

The way we know to hold off initializing dependent devices before the
IOMMU is ready is by reading the firmware tables. In devicetree the
"msi-parent" and "msi-map" properties point to the interrupt remapping
device, so by reading those Linux knows to wait for the probe of the
remapping device before setting up those endpoints. The ACPI VIOT
describes this topology as well, although at the moment it does not have
separate graphs for MMU and interrupts, like devicetree does (could
probably be added to the spec if needed, but I'm guessing the topologies
may be the same for a VM).  If the interrupt infrastructure supports
probe deferral, then that's probably the way to go.

Thanks,
Jean

