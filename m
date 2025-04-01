Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22D1FAC55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516703; cv=none; b=bt/c3K9Pp5DJbtKPnNA+KJdvRvKtN0K+lELclINiZmeTvc/fohzn72kofqQGwa3+hgKSOwLf/3hC9nGg5zJv8v6Pc01Hwhq9Wq8LSoqyz/9aGdHVhQnMvX0V0aWTDY8h5+g8DOna7pufJsJZ0jSEkELdS1q7NZ6gm9F5NXdg3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516703; c=relaxed/simple;
	bh=0trOQh+jrJl3FmJf61aJ7jvlRp+qH/hSBjq7p2l8A8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j08Y2LevJhnH4wHfDonA1YuarpWcu4FJoH3okBUfsl8WVcqr/7aC8OljaaFMX4X9C4i3u4jc/StwCjhTXPbY5p3XvpGZnlZV7mV0M4RsfY56HSCpvH6nZrM/TKzA+HIuryayqfcX3kITP0eMUhHWaA2AIepJe2AGw3JGwe3ngVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Yc7TqD+r; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Yc7TqD+r"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47688ae873fso56854091cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743516699; x=1744121499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0trOQh+jrJl3FmJf61aJ7jvlRp+qH/hSBjq7p2l8A8I=;
        b=Yc7TqD+rnF2D4uO+5IYqM0hZHyoGRt5eCy3t/VEno38WkiIEXr8IscWlCQeDVu/0Rm
         BRKhn40XfReOuNvUyUqZWR2CSfOQpCl3Qzg1A4f3pL4PmNYJMgJWzu9UFOZxsMU9hpUA
         yUwDhUuAaS1zNCSg0rgmUmyp70yR6eUBasKdZfjto6dOmSALa7lSzXc8Q9rBvRUBjPM0
         puDVIwa2rbite5Ej2r9C8uVBseQ0czZML1QFxjr7bLQyeJgMyTLr6RL+VQlkyFoMIEup
         3LSZ3RsjFc3reJmntwjrw3FGwPnzlfe6ZJBFRGNl6FVQN/ffqXljxQnSP4td5vztXkaR
         s+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516699; x=1744121499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0trOQh+jrJl3FmJf61aJ7jvlRp+qH/hSBjq7p2l8A8I=;
        b=JJFGGvc1R1WW7NDbakfyqJqfBZMR0Cw28KLiFIGB4T16GRrEo1ifyqH7iTOW5lvI8n
         XbKDqSxutY++JYD1GIybeKImqL5lJzKAOuDAzIfuIYArEmlo+y5HQNZjTzfhZBFhDSP1
         E4Gbh5t2gvYHsPIF5EUQredutYRDZA+23MC+1m2UgclJLLVQzdCkTLOYIjBc0zw0ANwe
         J7YQnEyreZoGJEpahkoyQaLLSJWkl5ItCyRMkcjJMqfZE1RWrXYMk8z9VNX1x8AjTou6
         JZKdbcZmqbLR1gogaaRR1sjfOZA13JPUNLiMidJVDWjRXRBSicguL2FOoO1WNmZ6JfqZ
         GWmg==
X-Forwarded-Encrypted: i=1; AJvYcCVF1uuByS1pUxjFeiWzJmDbvrYwyDw6g7XKPbonoz5HZYHjaksAKVw1ALmRmGH3XIKATV73opSDpZZ1kSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqelji/xPRrWrWhIzFLIuz/N+tQZmHxMDruJpqPlXjbNQMKwSi
	5MOeE/d9FC1L1dBwlVeKRhc6JSuaAf4Dl4K1dIw+r1aoY/7fPKd/Z4in4fUjM6E=
X-Gm-Gg: ASbGnctzwIS6gBkYOaBRBXun4L6AM7Yd6nEKp5NbfhRZnvRgz6NKN5gLzqlT+7PRni6
	K7TWyyQi23mh8jFvb5I1D1NJrKc1+M7ElWMpTujI4ZZ6zv1xN+kjCaRSsiluFge19flwH/HGgMe
	3Ir/hjESycHSVYPHjMiXgbP7S6i0FPIIfNhNjyKWenpfWjqgwQwxeW86U1e1oGVmsaAVtnh33OY
	ctIq7BZ5YZgSRlijcQpbhMV6FrO5c1utPGq1ro5dfRcBNbCpOhRZoTCvNNMFknFyRuKgFAs97PC
	/8MpAN0k0y0XFbrT/unhKbQF+lT8XgCFltksNgYScKco1k0GGhI4OuihwEYsO7EAKoI+y17vq6q
	5n5WSpxrSDx+Us1Umprz1Bdk=
X-Google-Smtp-Source: AGHT+IGuee4s3yxDEPSINUAFtQsa9ux8jxq1OoSPRsoWojLLXuG6p9Io2ozsOuCD3yEeRFQ6PGF9AQ==
X-Received: by 2002:a05:6214:e48:b0:6ea:d604:9e59 with SMTP id 6a1803df08f44-6eed5f89c29mr176486186d6.9.1743516699490;
        Tue, 01 Apr 2025 07:11:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f77804a9sm658374285a.112.2025.04.01.07.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:11:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzcL4-00000001LLA-0nQB;
	Tue, 01 Apr 2025 11:11:38 -0300
Date: Tue, 1 Apr 2025 11:11:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Wathsala Wathawana Vithanage <wathsala.vithanage@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	nd <nd@arm.com>, Philipp Stanner <pstanner@redhat.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	"open list:VFIO DRIVER" <kvm@vger.kernel.org>,
	Dhruv Tripathi <Dhruv.Tripathi@arm.com>,
	"Nagarahalli, Honnappa" <Honnappa.Nagarahalli@arm.com>,
	Jeremy Linton <Jeremy.Linton@arm.com>
Subject: Re: [RFC PATCH] vfio/pci: add PCIe TPH to device feature ioctl
Message-ID: <20250401141138.GE186258@ziepe.ca>
References: <20250221224638.1836909-1-wathsala.vithanage@arm.com>
 <20250304141447.GY5011@ziepe.ca>
 <PAWPR08MB89093BBC1C7F725873921FB79FC82@PAWPR08MB8909.eurprd08.prod.outlook.com>
 <20250304182421.05b6a12f.alex.williamson@redhat.com>
 <PAWPR08MB89095339DEAC58C405A0CF8F9FCB2@PAWPR08MB8909.eurprd08.prod.outlook.com>
 <BN9PR11MB5276468F5963137D5E734CB78CD02@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276468F5963137D5E734CB78CD02@BN9PR11MB5276.namprd11.prod.outlook.com>

On Wed, Mar 12, 2025 at 07:53:17AM +0000, Tian, Kevin wrote:

> Probably we should not allow device-specific mode unless the user is
> capable of CAP_SYS_RAWIO? It allows an user to pollute caches on
> CPUs which its processes are not affined to, hence could easily break
> SLAs which CSPs try to achieve...

I'm not sure this is within the threat model for VFIO though..

qemu or the operator needs to deal with this by not permiting such
HW to go into a VM.

Really we can't block device specific mode anyhow because we can't
even discover it on the kernel side..

Jason
