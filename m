Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F822331E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788583; cv=none; b=AGjdN1S6Yn8xR2y+QLFAKZ3VgAbjITrjsCcU+hi2KQALNFgIiG6LqOoB7ZDXu0zF0pjzuijSKcA4kmHiG5w9CcRgBh9e/ML2PdtdcFTqI4DfFYxQomvMdsDAUtM4J0f98ofOJgXoz9PgTECEZeezqrln+zI0FMhMGXGD3/lyuu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788583; c=relaxed/simple;
	bh=AxrFm7mECps3NAVYQZ/1AtNj2pO+p+u28rcLP7YnJ6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4VHkGDx58oazg+aP4hMe2nVa08hpIsS5nkSYnhaol/4kmw2aMC5t1fc2GbnLVthkclKxb5yXqk6f52ba+uKi9oBiaGBO0Q9hvPXmXO0L/HvdiY5+441TbCQbsM0bVv5cpE0kWZZeOFEw+pYdy4wncz/E5t9VLgsuZBbB8HBTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sS+NpT2Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sS+NpT2Y"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso7733157e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788579; x=1745393379; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AxrFm7mECps3NAVYQZ/1AtNj2pO+p+u28rcLP7YnJ6M=;
        b=sS+NpT2YiAUNoXZ+3MBsdnovrngBVj7HZkogHrQv9UotMSQbyDPsS6UD/0O320VTcL
         QeT36cDktaZyQ+5UdONx2u9VgTZrE1LiyaWMzfM8mNjXvA1y1oa1Y6SYtWxfU5nFnnoU
         nWdtENTFi7VAUXu13XA5Y3M92caiYHe6HKw55hzQkQdDowVs7MI/3SdfpivHVj1xX/1v
         fEXOLRx7UuGwC14riIqyhlUa8nSKObsZUldttJ3jYyzWjRp2QYyPhc16YSI3ajenaXVi
         r6uTnYpKzj0Jwx1iQB00wLVTEt1DCR8BRdZ4hM983I8Exz2FDLsO/CcgXPdM428gH2IL
         6o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788579; x=1745393379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxrFm7mECps3NAVYQZ/1AtNj2pO+p+u28rcLP7YnJ6M=;
        b=UwqfuVZIcupI4fgA88VZIltHYbQ4StRAmeP6vbDd3OaaFjqs9tW03oq3mMcesfM1/X
         r0poVn9gIkav7nwYFDE3WMp+vu9A2AWbYkz6f0fX//UKHG12tfjgD2nH4gQfGYenSmCl
         5HKteTTKFiaZzYnAloqwkFJasXNjVWc6m0EgVyLESvxv2m/VVRl/L/VsS5Zs3SkyVNe8
         JSVX1bOM9bi5dq29xxCez8/5Q84tn8jGeBFd08quIyM+9UXObSJUKGqgQx2kU+8yb7kk
         GccgEGGQictVVlOOyD+ZdM1IkVzAw3VO7TFHliGESkDIxaosTWIlZbCj1y2Dl+jAUY/7
         zI5g==
X-Forwarded-Encrypted: i=1; AJvYcCWwbhG94jCJyInqZ4aTH5U+mgADuUyo2Tl3Z7JvYUNgFd51BTrmwLvfoe/C3wy+Ick3oFysEoVR06qH3Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjedY6jnddZFrwDwVuSftrtQ/rjsIFV9cDwnSVZqEjBZvcI9E
	9gf57rcloBoXOmbOy0gGYHMc5GFj8rs+XE/dzR/QgAItzbZcPUqGTyUDPLL+iB+qHJMfA/h5Arl
	KRC80lF5aN7mmiZMczPUofuDqKh7+nMVlJ/mUEg==
X-Gm-Gg: ASbGncvnTvK3LNF7hfvlSn4nC0SQ7hVfGGKJeR/EIh2D8zhTKoVMtFatW7/XXrJwN+i
	kF6elgPvuFPQFIyxMtsf0qIUUXyRm98ofo0iGtKQjMsZ7FAGlDRDvVKenpMiofFV1mF20qGjQ8w
	icmRP53UndLhr00S2fzBrFk7MRMsk=
X-Google-Smtp-Source: AGHT+IGZWFmMw9jMNISg9qXAm/8QxzvIK8y2LFzg8WsosYGLrR2V6y3+hI+Mn7J/kJPCN2eqQC7miGeWstaMkW3JOh0=
X-Received: by 2002:a05:6512:3d94:b0:549:7330:6a5a with SMTP id
 2adb3069b0e04-54d64a9d377mr239109e87.23.1744788579234; Wed, 16 Apr 2025
 00:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313051953.4064532-1-baolu.lu@linux.intel.com>
In-Reply-To: <20250313051953.4064532-1-baolu.lu@linux.intel.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Wed, 16 Apr 2025 15:29:27 +0800
X-Gm-Features: ATxdqUGYZ1JRHppABWSGDBuq1ICwAaAqDmGhKvQGJ6wZswlbpffJy7z4MGxxX_w
Message-ID: <CABQgh9HbFOYsVinxr6eY-C-5UACaYeLcX8kU_HG696Wks9wn1Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] iommu: Remove IOMMU_DEV_FEAT_SVA/_IOPF
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Fenghua Yu <fenghuay@nvidia.com>, Zhou Wang <wangzhou1@hisilicon.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Baolu

On Thu, 13 Mar 2025 at 13:19, Lu Baolu <baolu.lu@linux.intel.com> wrote:
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
> https://github.com/LuBaolu/intel-iommu/commits/iommu_no_feat-v4
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>

Will you re-spin this patchset, it is not in 6.15-rc.

Thanks
