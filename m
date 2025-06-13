Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883814C97
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818526; cv=none; b=eOyUiH7y0gVpcN3Bo34uknaEUKPUGgKDVVFzVqp/GWMfQi69GnZAVMybU2B7rNVssiTXTIX2dwmEunjUiF/eTW1xFvRDhOwBXyLSyWsk+nd6KXeynj5FbGf4Bsvf8AH6P9Z9HSGqxI9XToY2cGBs4ynyEBq26E24QP63gcLXUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818526; c=relaxed/simple;
	bh=NF/1irqy4jJ1L6V66mqdBPhra41pySte+a4okmBQcdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1sCnYgla+puEVDy1rrchec1HxK7rSZ1/vuV9pedelufwSpStzNFVkNw7/jbRXDE3SsocN1vqooaoQ/Gt0bNOP5f1GgFrAmgNQuUFFMnj8MtMVPUKAjHy439FIrvKkxhTqVjQxJq7zuFrSJqcOyTCnRdmeMwsnu2VVpGlOW6iOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SKpLxp5u; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SKpLxp5u"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476a720e806so18325771cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749818523; x=1750423323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl1a0a1dTiH9ND4pj3QHpu2/HcDZNYc3TWBsAo2QFhs=;
        b=SKpLxp5uj0/JBSb9b4/QWSr77CmXm/WgIT8Tt0tCIDbDpbsmNgrUrIN2IIFq6h4ao5
         xl4p2P3WBeSGPaAlzxzVK94E8LxnCte0yc/QleiOvr+XuSJXbd8g197GV+8FkBK3iV0R
         dC0ISxpV5QDlFCipBK3+za1m2VuFMk4u70Z3qWRdM+REXL7LiUnBCxEIoeTwZQmFPmM+
         fRTsukJJ0lHRq6MijiWF0N17OnH5/6OS0zZUb49ep4UEphD5UAxy0ViRB+EPS4pNoI3+
         O+ZU508PJCfJYjG8WjIZB70u/iX88QIqs5w58T77/Yn/jF0nGg0xQ48ZmPbB33ctRxOK
         ZDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818523; x=1750423323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl1a0a1dTiH9ND4pj3QHpu2/HcDZNYc3TWBsAo2QFhs=;
        b=BJ3rAzBIc3dNCuR1b5LPxhUZFKVT8JxOEywNxuAFPNc5B1uO1oW97QSo0uC8pTDZgU
         1Qiaj571ufFkfWHYjkWy+twNVw7ERGxWZSa8lEt061ADnNQ19jdjuLAvjev2edHdUU/7
         rH2dpl3fMm5QgAoA/se4qCqYRy1kdFIa0qqO2nd5nB6vtQCW0/vYd4pnXH5zdHRMTe2Z
         RQ6uZDoDNI9A1zsYNdFBhwQ4kZd+QFQpdv3f5rDbnvTG08WkOrZiiRnnQfXkmN6dCUtE
         Zu9FJbvKrbGXr1m5XUQm/Z6ZCefvx8ee4CrG4ehqjCv8YO2dkSR4/lWHG8gOJtSn/szb
         3nZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXerdRPdIj/KmVwAYYAWUwDS1CyaLiqmCgqmK6L4GNM1ompml9C7TmT8ylhdXN2EKb3uvxCK5rMueRQeA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtNc5SeqX1xVYVZ9hFgEmmL5WnAskx5vOTKt3LgfTSVHiy4ePS
	cG4GNhwU6hrgJpLZEHbpDjyYvv2l8xuY60zKNB5H37qAIDegxiqFAms2Hs0ycs6cYIaT1s2+CHk
	Cc+Yv
X-Gm-Gg: ASbGncvSZ6cHMglI5fM6gami0YJgLsLX5bnYo6i6Wb7PWaTYPGlWLSR5xr1VwG0NuNQ
	qEuh375Z62mAklpo44Be4ZqvQ8zvp5rVPZ54He7MlwKqzKTDW94nV8xzujlrK6iXPsS/1+KNMSW
	BdsmvrW5QDeNWhsm1WLAKB4vhg04r/FaYPwknQMD2+AMzT3W6PlVkpBE5uC7oDLK/GFXaOtNXHa
	iR47Xy6x38KY8uclhgHHXlUkMDcVDyDD2yEiMTxq4dDkFFRyYFNzlUqytX2z2zGURhuCRy+Z3lb
	0cdG7G5YImMIrlAQQ5YRtPaAq/L54NGNg3LZc4CiChOQlwIfqLSBJxmO1h1e6Iuy4iDX3w4bW3d
	/ZMyjdCOxKjr11/fCZ2M4WdKsoOuZRMbZTRYVj08DPbv8Jo+/
X-Google-Smtp-Source: AGHT+IEMxc1apCXqPdiscCu3+jTMN5egyKcnrKpFBxG3GqFbDqJieLgrbOGckcJ4ZD2K8JgzUZhGZQ==
X-Received: by 2002:a05:622a:1e85:b0:4a4:4af2:5cff with SMTP id d75a77b69052e-4a72fe5b8d7mr51010151cf.3.1749818523244;
        Fri, 13 Jun 2025 05:42:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a50985csm16302801cf.72.2025.06.13.05.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:42:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uQ3jO-00000004qLu-0nK4;
	Fri, 13 Jun 2025 09:42:02 -0300
Date: Fri, 13 Jun 2025 09:42:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] iommufd: Destroy vdevice on device unbind
Message-ID: <20250613124202.GD1130869@ziepe.ca>
References: <20250610065146.1321816-1-aneesh.kumar@kernel.org>
 <BN9PR11MB527606182417BB7A35349F598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250612172645.GA1011960@ziepe.ca>
 <BN9PR11MB5276B467ADCC57BC6571CA458C77A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276B467ADCC57BC6571CA458C77A@BN9PR11MB5276.namprd11.prod.outlook.com>

On Fri, Jun 13, 2025 at 07:31:48AM +0000, Tian, Kevin wrote:
> yeah that seems to be the option if the said life-cycle dependency
> cannot be removed...
> 
> conceptually it's still a bit unclean as the user needs to know that
> the vdevice object is special after idevice is unbound i.e. it can only
> be destroyed instead of supporting any other kind of operations.

I would say userspace is somewhat malfunctioning if it destroys vfio
before the vdevice. So the main aim here should be to contain the
resulting mess, but still expect userspace to destroy the vdevice
without a failure.

> hmm if the user needs to build certain knowledge anyway can we 
> go one step further to state that the vdevice will be destroyed
> automatically once its idevice is unbound so the user shouldn't
> attempt to explicitly destroy it again after unbind?

I would assume a malfunctioning userspace is probably going to destroy
the vdevice explicitly. If it had proper knowledge it wouldn't have
done this in the first place :)

Jason
