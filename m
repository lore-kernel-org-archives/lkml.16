Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9871EB3E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215273; cv=none; b=BURc4YZRRhTGg+41shwGAnzx611sIDaLQrnG9N1yn5DYZ93FyW1kVMfJxSgUwbMw6Nd9HGGAbzaXejNvOY7rkmgYYqmoYFnRoYyIj5VvSa4rg0rNRsbev/jVBk+VNEH5Bu4zoUfWnb8gdTy2w/sOxAzXj4jU9cjrdriRU792wwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215273; c=relaxed/simple;
	bh=Qj1s8hJ9DXiEm9MNH49j1b4bMmSc2pA7qd4oNUeIcbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNiUWdamBIq9JKzYS1oAKKJRtSN6LcCI2/N930o/0RQFYBJjqek8jzGZ65rxLR5kdmiYCTTTLoTpTsDgVEXfYEl2M7Rex6+i48b18/6e51n+4IS5Y40zedLG9bAACNan6ahH4FB0CLSo0V0mKWKWzsTWPYa9RJeRBMSZyn/+jYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G27RepnC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G27RepnC"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so3459323e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745215269; x=1745820069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj1s8hJ9DXiEm9MNH49j1b4bMmSc2pA7qd4oNUeIcbI=;
        b=G27RepnCfgkP1NmeaXZUAEHKaAtvckvcD4xaHtyMKbJ8B+5sd68G1tePjLixCF4fV3
         4ACY9cMka3IlNWIO2cTFchPpLYDkcjmGuANQR/8iVk33rRBDbd8rGQRKUXYqRuBsUYu8
         X4u8dDqdyoD+V4qaCcjogX7DNcX5onDRDFCnenAzBCGCLefQMqKtMmn/ugoWMbWCKYcb
         adQ+NRbV002gTLUyjoQR8wnFFe9TmNxM0PlNTpwLQStEYpzu45pAN1S0QpkCXKsJJ7IM
         TnWoFqbOtac0E6QP85Fk1rUrg6OQJSE+z/3LFlkyQMh33vEy1mG9X791HQDFLaYqiHLr
         wEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745215269; x=1745820069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj1s8hJ9DXiEm9MNH49j1b4bMmSc2pA7qd4oNUeIcbI=;
        b=C+qhIwGdfNovYcW43W3Wj8YIpXOfigI7RjVd9011fzvgv4EUpLSxSxVo6AgjrZOU7Z
         oOg8o/fYzuNQb4AARJTnmWrpeA3ezUl/fApIiegAzZ9ut1acQNs885/dPMTN5cL0chzl
         miqN8/ecnR8868xs9uqmshj8sKkhvTF469SHIBvjHdxmKqM9hzPMBENcBb7RsG44Dwf3
         H6djfV/CXFM0QYCZ9mTBRs+Mjz4QU0kigpUs6i8YVF6E4ISm6qr/c/QazLcWnYfaE6NT
         LOkIadIsMkY0k5VmHp2AphxMmLo5nAh40LLG8bdd3H2nYKhQl2Z3Vv1gYrWjNlHTMB7e
         NU+g==
X-Forwarded-Encrypted: i=1; AJvYcCWmrzb2+Cq59FM39p3Dmtzk0Xvk1GZUzln9a4kR2FSuUtk26bthwIIs/7bD78P3BmPcsCtApNA0mI9ZZP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaeUfxRARTz7TgJfOCFtWuBY/tUchujBNK2x3BFuO/W5OL6Di
	7pbRurQLM4Ll20wIIrPj3UpFWr7O5i/UolbgKv2eoYCLGqfiG2eCT7IBI4CKuAd2ktGSx44zS+9
	G/THQhiky2qg8XCnZx9GGwYK3brYYocqrTTan5w==
X-Gm-Gg: ASbGncv5S5ml33ghSWB4A4vcsd26krqCOkQK04g9EdKhQ4VyhDxRR2Ve5wdZ/RPvEXw
	MmCfmGMoQkL81b2pGMqX3y0xkFHXcPl1MTgWRjXT+b+FPP2FfPQWP3E03rb1Pacq1NHm9Ni4qjC
	qGuEdi9vd26n4+5cflqUSdDVcHRRw=
X-Google-Smtp-Source: AGHT+IFpdIjOtEnxzjKCdjSva/bFhUKuTrOh7qIYruUBQR/M2P/bhrI3sjKrLZhTnHSoz7nebIh9KQbhGyVxmzuzWZo=
X-Received: by 2002:a05:6512:3dab:b0:54d:6555:44a6 with SMTP id
 2adb3069b0e04-54d6e65777bmr2612352e87.36.1745215268658; Sun, 20 Apr 2025
 23:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418080130.1844424-1-baolu.lu@linux.intel.com>
In-Reply-To: <20250418080130.1844424-1-baolu.lu@linux.intel.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 21 Apr 2025 14:00:56 +0800
X-Gm-Features: ATxdqUF2Hbg6JZF5AMHnIGWAfLBf6Ntwc6Ex8d-AAeUImsUJKzLj3aUJE2ShbcQ
Message-ID: <CABQgh9Ehp+mMyHLzCrpkMN88mD8+T9144Nx-YtyVez7Rq5h76A@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] iommu: Remove IOMMU_DEV_FEAT_SVA/_IOPF
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Fenghua Yu <fenghuay@nvidia.com>, Zhou Wang <wangzhou1@hisilicon.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Apr 2025 at 16:01, Lu Baolu <baolu.lu@linux.intel.com> wrote:
>
> The new method for driver fault reporting support relies on the domain
> to specify a iopf_handler. The driver should detect this and setup the
> HW when fault capable domains are attached.
>
> Move SMMUv3 to use this method and have VT-D validate support during
> attach so that all three fault capable drivers have a no-op FEAT_SVA and
> _IOPF. Then remove them.
>
> This was initiated by Jason. I'm following up to remove FEAT_IOPF and
> further clean up.
>
> The whole series is also available at github:
> https://github.com/LuBaolu/intel-iommu/commits/iommu_no_feat-v5
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks Baolu for the re-spin.
Re-tested OK

Thanks
