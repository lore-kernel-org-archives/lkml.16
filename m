Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87171898F2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738318203; cv=none; b=PPNgx1ftnsPgd8Od9z/0qZ2tLseQKhC8VpAcVmzjQq2HOEeijb3B1aV9RyVbCdtJ/1xZ85tv3EwAd2yiaCYPtgOBpxr4yFMWl/iWExTS2jbie+sVkrr7HdL2WD1R4y2PQ62My/qfOJmlnDdGhwMC3zlGXsoeC79pIJNi69R4ZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738318203; c=relaxed/simple;
	bh=v/iqv3fJvlKUt6qdrfpU+6Y8Tx4lsqcAcwbADBY/fWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggIayMi9HR/37lgpJZtOEQ+TTfPw5y2V5fbnls+x1bRlXaUdTDhaLUxEdbIwyYfyzACMX/fJ50Dm3jtGPps/YMrvX13dr9VFGWPCMP8xesP0xFCUhTGhWs7K0wy60MReSkjatxF4xz2Agg+KIr1yzX38B49hleield8tQxcpjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=dSdnHOR2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="dSdnHOR2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso12466835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1738318200; x=1738923000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBPk86uZmfcTkGurL1WDJzw8BH/2k/njCft7aLxhOMQ=;
        b=dSdnHOR2s9BljaQKCuVwCJnAv//GzgAVFluO12Eutrxzg3cjZsuqTCd0RVPR4JBVC2
         oG4yX+GQ7fiwdOHnxKPHQTMRYYIek2GB2zRGPqGS/StM/hLeCgR9KpNgwdmlqkVT8JUL
         TlMfEyc2qVIiBJp/+qJFPDf2mE0jafzlyTjML7uSD32dV2pVwFkxhoYuX6cHCyeYHhpe
         wL0dcEBuVQbc0AOUBTX602bzr1BeJeT9zkZ/EIXr7Qnq6KsV1Sc8c4A9HfgL1QSEAg8S
         BkVHoqyuxOSCgr/gwCTB67W33m0UWKhthB3rVN3i3iPB3fuJUCRZYVaZx3Fn0phNO93g
         qT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738318200; x=1738923000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBPk86uZmfcTkGurL1WDJzw8BH/2k/njCft7aLxhOMQ=;
        b=vbtMpLfSY3BZBfIhKnhjQ1HXXAiWYmmjnKrwfn/PytQrjvxDdXjgo4ARzjky0NCKX1
         AhwWsl3pwdikab8A9bAKfNRMYrEHp68Nfso7EXFKU4xtpuLPpH4awcttqglEPmYNJZEa
         1AAfgpAhNhKS+74qTIK7s9T26uY2zvGFy4nGgkDyF/2dDZNVrR7SsKA++AR0bq9pu3ho
         FASuaiLT4WZ6g07y8kIJEH/TXUdDbwMBKeGJO4tT6VOr91qMJnb7pdFXDBxOGraUpmay
         DFT9WfmeNYaP2BUoRWH4CtjuNKVFpOorSVPUZ2rSlOlZL5Mvg4a0Gi8HRfe0SVFGOS7h
         rMcA==
X-Forwarded-Encrypted: i=1; AJvYcCUOSaedR9AyaDDKsjh+88CK39LCNu5sbp5M82dLEHd8IQ/ffcOogjjSPGk7oKhT4nIvw7Hxaz3e0PujBN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTlF6qDSkxseIXs4p/iEVfRM8/PQTPOsls6xy5Bbq6ITbFzCJB
	vSq2U9EMcr5wX/QdRcuMIwQeVLWxJVoPdDQn9odyfaCXt2ZkoFdks6Bt8YLeiXE=
X-Gm-Gg: ASbGncuEAjCK6ijhgBTjwOgN7NuDdsqpmFn6/sw0+NfrCcT1klYJ5dVvdjtqguxvnND
	4KwaPEdrvJRzz02ainWgWCvFA7bUv+NiKkGcYkK301w9X1BuMdlj7ltJgJRxDJBIRzHCmQWLtfS
	jeYkkTdRaKDzwr8JA7DJRXCjQR8CjuMSCaj9nhOahaC4ppj84BzTRL+6WcRWEm1ncBZb9GFaeC5
	9tq3zAmg3El8LCqwidM76NRNrnymXzREYnwURWaT2vBn6DV577lpLQi95JvPTy9dXmz4WCOhkFe
	klFUTOKFaC1tS/5A
X-Google-Smtp-Source: AGHT+IG4w9PGW6x290JACvG6usdJ33ACoHALnMSvc5iVVZ/OSZs2xydGAkK9maY6DgMqQJZW2uo+Xw==
X-Received: by 2002:a05:600c:68c4:b0:438:e231:d35e with SMTP id 5b1f17b1804b1-438e231d655mr61602485e9.0.1738318199783;
        Fri, 31 Jan 2025 02:09:59 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deedfsm50680095e9.16.2025.01.31.02.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 02:09:59 -0800 (PST)
Message-ID: <09d0c81a-1a46-4864-995b-731d980edd92@sedlak.dev>
Date: Fri, 31 Jan 2025 11:09:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-3-daniel.almeida@collabora.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250130220529.665896-3-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/25 11:05 PM, Daniel Almeida wrote:
> Add a generic iomem abstraction to safely read and write ioremapped
> regions.
> 
> The reads and writes are done through IoRaw, and are thus checked either
> at compile-time, if the size of the region is known at that point, or at
> runtime otherwise.
> 
> Non-exclusive access to the underlying memory region is made possible to
> cater to cases where overlapped regions are unavoidable.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>   rust/kernel/io.rs     |   1 +
>   rust/kernel/io/mem.rs | 125 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 126 insertions(+)
>   create mode 100644 rust/kernel/io/mem.rs
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 566d8b177e01..9ce3482b5ecd 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,7 @@
>   use crate::error::{code::EINVAL, Result};
>   use crate::{bindings, build_assert};
>   
> +pub mod mem;
>   pub mod resource;
>   
>   /// Raw representation of an MMIO region.
> diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
> new file mode 100644
> index 000000000000..f87433ed858e
> --- /dev/null
> +++ b/rust/kernel/io/mem.rs
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic memory-mapped IO.
> +
> +use core::ops::Deref;
> +
> +use crate::device::Device;
> +use crate::devres::Devres;
> +use crate::io::resource::Region;
> +use crate::io::resource::Resource;
> +use crate::io::Io;
> +use crate::io::IoRaw;
> +use crate::prelude::*;
> +
> +/// An exclusive memory-mapped IO region.
> +///
> +/// # Invariants
> +///
> +/// - ExclusiveIoMem has exclusive access to the underlying `iomem`.

formatting: ExclusiveIoMem -> [`ExclusiveIoMem`]?

> +pub struct ExclusiveIoMem<const SIZE: usize> {
> +    /// The region abstraction. This represents exclusive access to the
> +    /// range represented by the underlying `iomem`.
> +    ///
> +    /// It's placed first to ensure that the region is released before it is
> +    /// unmapped as a result of the drop order.
> +    #[allow(dead_code)]
> +    region: Region,
> +    /// The underlying `IoMem` instance.
> +    iomem: IoMem<SIZE>,
> +}
> +
> +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
> +    /// Creates a new `ExclusiveIoMem` instance.
> +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
> +        let iomem = IoMem::ioremap(resource)?;
> +
> +        let start = resource.start();
> +        let size = resource.size();
> +        let name = resource.name();
> +
> +        let region = resource
> +            .request_mem_region(start, size, name)
> +            .ok_or(EBUSY)?;
> +
> +        let iomem = ExclusiveIoMem { iomem, region };
> +
> +        Ok(iomem)
> +    }
> +
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
> +        let iomem = Self::ioremap(resource)?;
> +        let devres = Devres::new(device, iomem, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for ExclusiveIoMem<SIZE> {
> +    type Target = Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &*self.iomem
> +    }
> +}
> +
> +/// A generic memory-mapped IO region.
> +///
> +/// Accesses to the underlying region is checked either at compile time, if the
> +/// region's size is known at that point, or at runtime otherwise.
> +///
> +/// # Invariants
> +///
> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the

typo: inststance -> instance
> +/// start of the I/O memory mapped region.
> +pub struct IoMem<const SIZE: usize = 0> {
> +    io: IoRaw<SIZE>,
> +}
> +
> +impl<const SIZE: usize> IoMem<SIZE> {
> +    fn ioremap(resource: &Resource) -> Result<Self> {
> +        let size = resource.size();
> +        if size == 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let res_start = resource.start();
> +
> +        // SAFETY:
> +        // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +        // - `size` is known not to be zero at this point.
> +        let addr = unsafe { bindings::ioremap(res_start, size as kernel::ffi::c_ulong) };
> +        if addr.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        let io = IoRaw::new(addr as usize, size as usize)?;
> +        let io = IoMem { io };
> +
> +        Ok(io)
> +    }
> +
> +    /// Creates a new `IoMem` instance.
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
> +        let io = Self::ioremap(resource)?;
> +        let devres = Devres::new(device, io, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize> Drop for IoMem<SIZE> {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }
> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for IoMem<SIZE> {
> +    type Target = Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as by the invariant of `IoMem`.
> +        unsafe { Io::from_raw(&self.io) }
> +    }
> +}
	Daniel
