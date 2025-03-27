Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938902054EB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064046; cv=none; b=Z9xz3WOg62F4d5R203p0FOO0gVCG8tB1pxsRca6GlLF1s7BkKuPDqCl67zLkmfBOM0zPCU4I4YZfQ1pWHkHAX4C2KfR8o65tVqLIlLUkQ96JQtS+YfRc8mfF3EJuoH4JW4ynSrm2q6PROie4StnNNCvovk7gUnX8FkXGwQ9OtHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064046; c=relaxed/simple;
	bh=KKjvFjiCDlreKGmOBQSgx/CVZHNmcBmUEl9JtLu4KYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ds3aq078A5b3++uAeKPVjApcTsI0IKHtlJWY+TX9zELEb82T5FOeYaLXxF8Q6yKdH0eDwpPX/4tSXJbwYMvkEcTVPO1bkegBP66UcDkgLTOhQ24hEqrtzyPiXn7GGAC8RWBQlN+bJM9BhK7xWpKapRhtYfE75HvRkNudfa0vvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LWE69Ri4; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LWE69Ri4"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6025007e592so373115eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743064043; x=1743668843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNaFBHARD8RYWQkk61EfntzC+oHyDk/Nf1u/x+30pAY=;
        b=LWE69Ri4IRxNo+QPex++mmm18+Ziw6sIELVh7auPWYHAHd99c04N7CSBL21o2OQFmj
         goYN+b7TAkc5bltJ3F3seZvtPGHuSYXPLEja6h4uiL/EoqT2s5OI1m93aT+fHZdntNYK
         oZ4iamCNYa6VM8Jtnzs0xcM0rWlZxQuHp297msRw8yKjNlDlMJvQlHzpBYU4R00Grauk
         iqnJjRc9Z6Wk6gi6hhbDbLVYyVxUfTOekY43sHiXC7Wv0XEMeCraqYeTZQJT7y1mCWQO
         YmCrhl04cPZaYyUX24wmcnX308CJuiXqsaAgN4w+bywoJ3q2oBpAofzQUb9kR0hcL4f7
         6Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743064043; x=1743668843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNaFBHARD8RYWQkk61EfntzC+oHyDk/Nf1u/x+30pAY=;
        b=udr6YZXTv40ZEuCVH/Kcf93dYlIgYMRJTu/UbUjMd/OZemO+SXaQ+lB24uPMChLD7f
         NNDdVJK30VhkuLxnFpANreAwqUq+nJxNZlT33wS030TiVzZscwloh7hD3gn0LdZLEbl3
         EHmzchJbBOAAGTDrWegbCko2+VEVemPbInmxexPyUHz0zuMiJu2VMlIOOK1d4pEwhANl
         zwv7yvn3J/5aMTSzh3nMJdNrBXyxy9ZgPP6Nur06/5YrOz7eKbR8i/yYjHJHnWmwuJm9
         89BbRq0t5MMhHA8T+e77kMglr4IZ+GW7DGP9PgTf+Vt7X5qi4zl455H5kHgoLtoBmjj8
         bUgA==
X-Gm-Message-State: AOJu0Yw3TaqmYbi2BCRVBKH6S8e73ueiGHECN8+vjGh3XPI2nvjNxTqY
	b2yToqI2S9pQwZpuZAU3iRwYcfCtYhsg8y6qpKhVuDr7RqcswjiH916gnJ6RZtg+J278fIWOQoW
	Pso0n0QhIbl6PIhjNTQ7HMswHKDfa03n4JvLyHRwtUVJKnyZ6oWc=
X-Gm-Gg: ASbGncuhayS3YN0YASMDtqknPT2QpfQrGg2DImhSn0QMrpBhs/PsGkkW9sOj6wKYE2Z
	YKMEfEGfXkO97FB2uUATR0oiFUx16biFOabol359svxx/BH6GVLChmeu+N6YHO/VrXKsnROsy3g
	koSdjc3noD92SZv47FDCee9VwWfvQ=
X-Google-Smtp-Source: AGHT+IE4Y73Pz4N1BwH9vcQsjd8miSlNYWKQ9DjG4P07KcqUpTb0YMUN/u49Pwe5re+n/OV+igA1ripHNomVy4YAKtk=
X-Received: by 2002:a05:6870:56a9:b0:2b7:d3d2:ba53 with SMTP id
 586e51a60fabf-2c847f850famr1469213fac.12.1743064042412; Thu, 27 Mar 2025
 01:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Mar 2025 09:27:11 +0100
X-Gm-Features: AQ5f1JrlH0shoTWzAhW6qEWQAlS0oouzF_cE5El7sl3-QfofSRRMGfXh-_QnuWM
Message-ID: <CAHUa44F7HYQ8uR1vpu5XfR+Ag89JPpttW7hUvGROcXbPvXBXVA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] TEE subsystem for restricted dma-buf allocations
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 5, 2025 at 2:06=E2=80=AFPM Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
>
> Hi,
>
> This patch set allocates the restricted DMA-bufs from a DMA-heap
> instantiated from the TEE subsystem.
>
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
> restrictions for the memory used for the DMA-bufs.
>
> The DMA-heap uses a restricted memory pool provided by the backend TEE
> driver, allowing it to choose how to allocate the restricted physical
> memory.
>
> The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_F=
D
> before they can be passed as arguments when requesting services from the
> secure world.
>
> Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> Recording) has been identified so far to serve as examples of what can be
> expected. The use-cases has predefined DMA-heap names,
> "restricted,secure-video", "restricted,trusted-ui", and
> "restricted,secure-video-record". The backend driver registers restricted
> memory pools for the use-cases it supports.

When preparing a v7 of this patch set, I'll switch to "protected"
instead of "restricted" based on Nicolas Dufresne's comment [1],
unless someone objects.

[1] https://lore.kernel.org/lkml/32c29526416c07c37819aedabcbf1e562ee98bf2.c=
amel@ndufresne.ca/

Cheers,
Jens

>
> Each use-case has it's own restricted memory pool since different use-cas=
es
> requires isolation from different parts of the system. A restricted memor=
y
> pool can be based on a static carveout instantiated while probing the TEE
> backend driver, or dynamically allocated from CMA and made restricted as
> needed by the TEE.
>
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml=
 \
>         -b prototype/sdp-v6
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make all -j$(nproc)
> # Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
> # Connect a monitor to the RockPi
> # login and at the prompt:
> gst-launch-1.0 videotestsrc ! \
>         aesenc key=3D1f9423681beb9a79215820f6bda73d0f \
>                 iv=3De9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=3Dtrue=
 ! \
>         aesdec key=3D1f9423681beb9a79215820f6bda73d0f ! \
>         kmssink
>
> The aesdec module has been hacked to use an OP-TEE TA to decrypt the stre=
am
> into restricted DMA-bufs which are consumed by the kmssink.
>
> The primitive QEMU tests from previous patch set can be tested on RockPi
> in the same way with:
> xtest --sdp-basic
>
> The primitive test are tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml=
 \
>         -b prototype/sdp-v6
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make SPMC_AT_EL=3D1 all -j$(nproc)
> make SPMC_AT_EL=3D1 run-only
> # login and at the prompt:
> xtest --sdp-basic
>
> The SPMC_AT_EL=3D1 parameter configures the build with FF-A and an SPMC a=
t
> S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=3Dn to =
test
> without FF-A using the original SMC ABI instead. Please remember to do
> %rm -rf ../trusted-firmware-a/build/qemu
> for TF-A to be rebuilt properly using the new configuration.
>
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
>
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory. There are also som=
e
> negative tests for out of bounds buffers etc.
>
> Thanks,
> Jens
>
> Changes since V5:
> * Removing "tee: add restricted memory allocation" and
>   "tee: add TEE_IOC_RSTMEM_FD_INFO"
> * Adding "tee: implement restricted DMA-heap",
>   "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
>   "tee: add tee_shm_alloc_cma_phys_mem()",
>   "optee: pass parent device to tee_device_alloc()", and
>   "tee: tee_device_alloc(): copy dma_mask from parent device"
> * The two TEE driver OPs "rstmem_alloc()" and "rstmem_free()" are replace=
d
>   with a struct tee_rstmem_pool abstraction.
> * Replaced the the TEE_IOC_RSTMEM_ALLOC user space API with the DMA-heap =
API
>
> Changes since V4:
> * Adding the patch "tee: add TEE_IOC_RSTMEM_FD_INFO" needed by the
>   GStreamer demo
> * Removing the dummy CPU access and mmap functions from the dma_buf_ops
> * Fixing a compile error in "optee: FF-A: dynamic restricted memory alloc=
ation"
>   reported by kernel test robot <lkp@intel.com>
>
> Changes since V3:
> * Make the use_case and flags field in struct tee_shm u32's instead of
>   u16's
> * Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
> * Import namespace DMA_BUF in module tee, reported by lkp@intel.com
> * Added a note in the commit message for "optee: account for direction
>   while converting parameters" why it's needed
> * Factor out dynamic restricted memory allocation from
>   "optee: support restricted memory allocation" into two new commits
>   "optee: FF-A: dynamic restricted memory allocation" and
>   "optee: smc abi: dynamic restricted memory allocation"
> * Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
>   restricted memory allocate if CMA isn't configured
>
> Changes since the V2 RFC:
> * Based on v6.12
> * Replaced the flags for SVP and Trusted UID memory with a u32 field with
>   unique id for each use case
> * Added dynamic allocation of restricted memory pools
> * Added OP-TEE ABI both with and without FF-A for dynamic restricted memo=
ry
> * Added support for FF-A with FFA_LEND
>
> Changes since the V1 RFC:
> * Based on v6.11
> * Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALL=
OC
>
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf he=
ap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
>
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
> Jens Wiklander (9):
>   tee: tee_device_alloc(): copy dma_mask from parent device
>   optee: pass parent device to tee_device_alloc()
>   optee: account for direction while converting parameters
>   optee: sync secure world ABI headers
>   tee: implement restricted DMA-heap
>   tee: add tee_shm_alloc_cma_phys_mem()
>   optee: support restricted memory allocation
>   optee: FF-A: dynamic restricted memory allocation
>   optee: smc abi: dynamic restricted memory allocation
>
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/optee/Makefile        |   1 +
>  drivers/tee/optee/call.c          |  10 +-
>  drivers/tee/optee/core.c          |   1 +
>  drivers/tee/optee/ffa_abi.c       | 194 +++++++++++-
>  drivers/tee/optee/optee_ffa.h     |  27 +-
>  drivers/tee/optee/optee_msg.h     |  65 ++++-
>  drivers/tee/optee/optee_private.h |  55 +++-
>  drivers/tee/optee/optee_smc.h     |  71 ++++-
>  drivers/tee/optee/rpc.c           |  31 +-
>  drivers/tee/optee/rstmem.c        | 329 +++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 190 ++++++++++--
>  drivers/tee/tee_core.c            | 147 +++++++---
>  drivers/tee/tee_heap.c            | 470 ++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h         |   7 +
>  drivers/tee/tee_shm.c             | 199 ++++++++++++-
>  include/linux/tee_core.h          |  67 +++++
>  include/linux/tee_drv.h           |  10 +
>  include/uapi/linux/tee.h          |  29 ++
>  19 files changed, 1781 insertions(+), 123 deletions(-)
>  create mode 100644 drivers/tee/optee/rstmem.c
>  create mode 100644 drivers/tee/tee_heap.c
>
>
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> --
> 2.43.0
>
