Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E5428852E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092585; cv=none; b=ZqrWd+6hNYOMNc0BET6FucjXS7DDfA7lGO6KCvHyS5CeBPbIgowIKHPSDYdOFnizG7+gV6H/GlHU6yct1enXduN5yA5sN1GCf1+JyHaGJABXAUiJXj7tbSRnr1UYJ95pw3v+Px9Spm5PC0UQB+pcYDNXpc20R6sdVcBBAfdtVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092585; c=relaxed/simple;
	bh=wbAqs2QPNshQFNfnQJ3Nsx3pqJB0co+3divXRM+3D9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkRtbnJml8JK+ca1mCUj/55fRQ+JoN5mxdDCbV4NSunUIZyGmMlLPHtNUn42Tonud/T8ICrux2eKDKGm+zJVJ0wAHQC0KyeN7NC8QaQoY7Md6IUYhpVMwkMUEPPBTEliVdGVDBZIcMZYNICWMKXE/pt9gyvsTk2DRDViwaXmD5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZmAcJWqB; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZmAcJWqB"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d0a47f6692so529656685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750092582; x=1750697382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9JkdL6Mk2e/49VSWyYi+MjdDg5JZvsaiQoJd8x2e2l8=;
        b=ZmAcJWqBRHW3WUR75tpkRys1FRZXwz1yDqUvGlk9pSexSNOTwBWdl0pt+TNP8cdrnf
         +GYqdv+xJ1HL35WfF5T8hd7Gld7HnEwQ4nq23CTikog+RisTr7/CGJX1+t1DEsBvYShT
         azyf+31v2CnwM1GY9Ux510fm6UVoLhrq5i2hDDNA/ZE4NHxfyzoY2QSAhkjF0b+2xkoB
         3mprzitZ9xBMKxiLh1T1Viubwn75Dqr7nVlMDCQx7hs2oGYALOomKTSWOgLCebDHZluy
         EqbIWcAjZTYQ/u2+tfNaolkFcSLrpkmXjYSvEClfdIg2WpdtFdIRvTrD/KL7SthxYDbt
         iKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092582; x=1750697382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JkdL6Mk2e/49VSWyYi+MjdDg5JZvsaiQoJd8x2e2l8=;
        b=tjJH1v7zTLLAOWQZzB6O0v3erUY0WIMUJqCAig1jeHDldlMxP7VS600sZwriNA1nJa
         b5t5rrRfhrX/PuKfWwStBliiiFdra5HIvtkNUEx/wWeVQdNjfvPXqDXLpxsdJA2IwEeM
         yoWp7hCwjPH957vC9eOUn5KQTRLTr0PCzv8RQQNPdcz/02LYfDTbetbVZuAqYDAjBqPt
         F/KpvfGZ2PMn7NCvXl8VlHkL0ioPxIAokrGQ7kDWUsncHYMvVDa8qdUD0Lm9YPmtyVMm
         iKGvyulOlZ+7V7k5LKaJnNQj248/Xjw0KPvGbW2zhCmQoTgWavM1l0k5dUiVUUDGqjqW
         7h3A==
X-Forwarded-Encrypted: i=1; AJvYcCWgdR2VV/zyuQ8xgiwTDZUkzeqb6cYQQVlnhkLD421s9efCQo2F9nOGC7NDsc5Sz/2hlzbpA2QuOrnPo2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ezJWNjvNFTu4Cx2peyJSm2NTzBtCVyhM8nMKc5Rh+elEbIik
	gbiIOd4R/s6rcCvoKrKMnMD8hqg3EpCEicNveArippqaGGtN8Nicg4bqpRY2TkzeAy0=
X-Gm-Gg: ASbGncsGOB5o8wiBA7M0vJnQCwnxsBPTHEjn2C8Rx6C6W8W6XZUAzUmsGijjnRM4+O5
	AXyy/Nh/CSpmXOdicG/vs328UfiV3i3/8fi/BewPXHlQrNs8olj9Y/YePMLifI6Ro4yA8e0uIIF
	9gqRZfwXnhFLEkuSiIujXNVsI77YVWYo4UuuKe5nXlMpaIjvPLhsin1lafPFcvXlFiZ7NcKe9KB
	bvSxpg457RTdokEUUZtGb88KABFAj3aCJ23fu8lZFHE8d1hfKeCUoRGmCWP+3Hel4wkvG/omQ1S
	65wFABK4b/yTINHn7ZumwaYN4ka06y/bVnxY7ZY/SX/WuJM7RsM0UjghdO19ykAwgQB89aKh5Hs
	XsQI9Vl55TsY5l93XPpqaKNSkOjr/SEVZAlofSA==
X-Google-Smtp-Source: AGHT+IH7LW8HsfFZHHGu9OtydHNIM8xqpwob8vEfETKl1+Ftq+mpH3z1NlGNTqm4xT5IAWMHRxxaXw==
X-Received: by 2002:a05:620a:2990:b0:7d3:9109:4472 with SMTP id af79cd13be357-7d3c6cda074mr1763524185a.37.1750092582358;
        Mon, 16 Jun 2025 09:49:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfe954sm549843385a.31.2025.06.16.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:49:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRD1h-00000005lad-1ENt;
	Mon, 16 Jun 2025 13:49:41 -0300
Date: Mon, 16 Jun 2025 13:49:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] iommufd: Destroy vdevice on device unbind
Message-ID: <20250616164941.GA1373692@ziepe.ca>
References: <20250610065146.1321816-1-aneesh.kumar@kernel.org>
 <BN9PR11MB527606182417BB7A35349F598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250612172645.GA1011960@ziepe.ca>
 <BN9PR11MB5276B467ADCC57BC6571CA458C77A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250613124202.GD1130869@ziepe.ca>
 <yq5abjqotim7.fsf@kernel.org>
 <BN9PR11MB527633CA2F698E83E12BFBD68C70A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527633CA2F698E83E12BFBD68C70A@BN9PR11MB5276.namprd11.prod.outlook.com>

On Mon, Jun 16, 2025 at 05:37:58AM +0000, Tian, Kevin wrote:

> the expected destruction flow from userspace is to IOMMU_DESTROY
> the vdevice object before closing the vfio cdev fd which unbinds the
> idevice.
> 
> now we are discussing how to handle a malfunction userspace which
> violates that flow: let it be or add a tomestone state, after extending
> unbind to destroy the vdevice...

Right, to be clear the concern is

close(vfio_cdev)
ioctl(DESTROY, vdevice_id);
close(iommufd)

Which is a possibile sequence for userspace/syzkaller to trigger.

My position has historically been that DESTROY should not destroy some
random unrelated object eg because a parallel thread did an allocation
and re-used the kernel deleted ID. ID's that belong to userspace have
to be retained right up until DESTROY.

Thus we've historically avoided creating scenarios where IDs owned by
userspace are destroyed by the kernel.

Given we can say the above is illegal use of the API we could leave
behind a tombstone in the xarray. The goal would be to prevent lookup
of the object (since it is destroyed) and prevent reallocation of the
ID.

For instance a simple thing would be to drop in XA_ZERO_ENTRY, this
will reserve the ID and fail all future operations. The userspace will
get a failure on DESTROY so they know they did something wrong. The fd
close will clean up the reserved ID.

We just need to make some decision about the above sequence.

Jason
