Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669521E0AE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738733943; cv=none; b=s+NZzk4M/hKJRs8To0OtM04ipVXzbZ1GSF/vdZc0vxh8jJmUpR7YHe3W17s060oU19KPE2Z4Eb7agUAa1yi6ZavWVI0cCSyRvzQPkpcdFOweatk1lM2TxxH4c644uQ4rBmqruJ64KHCLtINb2l5n8vEXoQirDOTC50jO4EAFlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738733943; c=relaxed/simple;
	bh=oYZIE1WKgBIkinbX1yVJwFqw1Yy25EB1bt9R4zIMPsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oN/ULKHNG3KNrzG5P6xOb/KicBb0YI/C2yLPTee5+enFeg3KgJc2+zrLbfHIk8/R95nUwcLL3xRmFC1edzlOg2yAvAQw4vgnNaNGe2cJuO1j6BJxStbMDKir8KAV/nhg2kJyq7MES7L0FVrTmhD0xGbJglguv2PG1L7x/wjRce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVl+RPbW; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVl+RPbW"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso1389762241.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 21:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738733938; x=1739338738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iZcHmE5LfGpzo6oy13bAZTRZiNz/yFAVgtXYT5lK3YI=;
        b=mVl+RPbW6wNN+LNnSkbX934oKSA9UtfYh1HzscpzHEVAMVcCh+5RDlFVM7tJsOTdvx
         XuRNo7LyVsNz4+eq8EeBhtn8U/iKe1P1XoVXdP7sRfdC3AbJjA4KmG8LFPs4pDja7GE6
         h5PUiEL1vUDvmD3fjf+Cj1bqxOBSUWME2PptT93C8OIAe3aJsozRqtUY4oHnLbZ56hSs
         y1qwpu9L2W2gxi57VGJK2FZHsAcBKBpkdOFRj7JSDrX7a7By6sZJoWekJwEQj4qcPTCM
         scm526iZNqyMFsNmA1bJCLidIvOLGmdiWsQAzKuiBvZBnRk+g2+XSIP9UzP25AoGWtX1
         guZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738733938; x=1739338738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZcHmE5LfGpzo6oy13bAZTRZiNz/yFAVgtXYT5lK3YI=;
        b=WS4s64CXvtpqN/6rgDlqe7E541gxzVpfzDKmYgWPcIMD4miIKNAOmzod4boxlOeYf5
         iaWUE+AOqfKws1zhHfVytkS2sqcOTeMlHt3AWvqPVhSnzdfBpSw36/htRMegdsFT5Ebc
         Tl+rA2QYUjNCQ+S8OCzHTndTv+YcoNTxa8NjF81CQuGe+Gl2ZXbcopwRtZqLqB9V+FCI
         9YPqSh1jwZN18Vx4nhI5j53GJI6qW0pAlcqZIIPCT5KhEf+lecYxwy/2ecftkUCo6fqB
         0FnM6+lGjG8pAycFrhwmJmLj+DZ4ak9QXMS89HltOokjx/cNmuKpBgDALLgEzc0gJsu+
         j4wg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hRrqL9975mo5OYJ6oggIHdtcFIjBmmRma/QFcSa4JX9MAMVD0Wmcl2ataogve1HGL5yihZ6nYr/GZpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFZrdqD1hZ7/ukz/xEgEcthS2rujIV1hycN1rkoXz4HnWYbhX
	tD5NFuyg0gz7675Lhxk/h6fkDN8D7LF/QH+jH2Iw6PWiwPRUwUqV+s+OUeOwuo2RGrHvxq4RH/L
	N3yiVjUgpxLSF2D1EKdWFSz3A0xmWF7OlBf8Xww==
X-Gm-Gg: ASbGnctpZAKVz8JyXr7V5p7Ek8wc2+3Z+8iVG556e8tAtJ864NRgFjMqzlvhIu0A4+B
	Wr9i+gNsq4jsr+besuJ4YOD1EWm+kl+kPihwKyu4pTS1Zj+cicQTCa5l/fA256GPR5SascKEqVD
	c=
X-Google-Smtp-Source: AGHT+IGP8iaV1lSJK3k61hP2EUn7b4J7C0feOjedPDBXitriSHUsXfoWs2rikX22K7TDZvBiWOLJscwElk2khGF9pWQ=
X-Received: by 2002:a05:6102:3c8d:b0:4b1:1565:f4f1 with SMTP id
 ada2fe7eead31-4ba46dab143mr1416296137.3.1738733938448; Tue, 04 Feb 2025
 21:38:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 5 Feb 2025 11:08:47 +0530
X-Gm-Features: AWEUYZk-9uPQuZCvuldLLo0gp1nCZvfng0cr_ZdFUSsUs5f9vvtvhtZ_fCOgRaA
Message-ID: <CAFA6WYNGH_LP-R4hQx-+XMY3zFN74ij-JngwnuKOsz8=r_-bsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Amirreza,

On Mon, 3 Feb 2025 at 08:14, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
>
> Kernel and userspace services are also available to QTEE through a
> similar approach. QTEE makes callback requests that are converted into
> object invocations. These objects can represent services within the
> kernel or userspace process.
>
> Note: This patch series focuses on QTEE objects and userspace services.
>
> Linux already provides a TEE subsystem, which is described in [1]. The
> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> can be used by userspace to talk to a TEE backend driver. We extend the
> Linux TEE subsystem to understand object parameters and an ioctl call so
> client can invoke objects in QTEE:
>
>   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>   - TEE_IOC_OBJECT_INVOKE
>
> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> used for invoking services in the userspace process by QTEE.
>
> The TEE backend driver uses the QTEE Transport Message to communicate
> with QTEE. Interactions through the object INVOKE interface are
> translated into QTEE messages. Likewise, object invocations from QTEE
> for userspace objects are converted into SEND/RECV ioctl calls to
> supplicants.
>
> The details of QTEE Transport Message to communicate with QTEE is
> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
>
> You can run basic tests with following steps:
> git clone https://github.com/quic/quic-teec.git
> cd quic-teec
> mkdir build
> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
>
> https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
> needed to build the above.
>
> This series has been tested for basic QTEE object invocations and
> callback requests, including loading a TA and requesting services form
> the TA.

Thanks for sharing these test user-space applications/libraries. Can I
know which platforms are currently supported by this QTEE driver? I
would like to run and understand the overall stack on a real device. I
do have rb3, rb5 and db410c on my desk to test with.

Also, platform support is important information you should put in the
cover letter as well as the QTEE documentation.

-Sumit

>
> [1] https://www.kernel.org/doc/Documentation/tee.txt
>
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
> Changes in v2:
> - Clean up commit messages and comments.
> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>   instead of QCOM_TEE, or names that are more consistent with other
>   TEE-backend drivers such as qcomtee_context_data instead of
>   qcom_tee_context.
> - Drop the DTS patch and instantiate the device from the scm driver.
> - Use a single structure for all driver's internal states.
> - Drop srcu primitives and use the existing mutex for synchronization
>   between the supplicant and QTEE.
> - Directly use tee_context to track the lifetime of qcomtee_context_data.
> - Add close_context() to be called when the user closes the tee_context.
> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
>
> Changes in v1:
> - It is a complete rewrite to utilize the TEE subsystem.
> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
>
> ---
> Amirreza Zarrabi (8):
>       tee: allow a driver to allocate a tee_device without a pool
>       tee: add close_context to TEE driver operation
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>       firmware: qcom: scm: add support for object invocation
>       tee: add Qualcomm TEE driver
>       qcomtee: add primordial object
>       Documentation: tee: Add Qualcomm TEE driver
>
>  Documentation/tee/index.rst            |   1 +
>  Documentation/tee/qtee.rst             | 150 ++++++
>  drivers/firmware/qcom/qcom_scm.c       | 128 ++++++
>  drivers/firmware/qcom/qcom_scm.h       |   7 +
>  drivers/tee/Kconfig                    |   1 +
>  drivers/tee/Makefile                   |   1 +
>  drivers/tee/qcomtee/Kconfig            |  10 +
>  drivers/tee/qcomtee/Makefile           |  10 +
>  drivers/tee/qcomtee/async.c            | 160 +++++++
>  drivers/tee/qcomtee/call.c             | 741 ++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/core.c             | 810 +++++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/primordial_obj.c   |  65 +++
>  drivers/tee/qcomtee/qcom_scm.c         |  36 ++
>  drivers/tee/qcomtee/qcomtee_msg.h      | 234 ++++++++++
>  drivers/tee/qcomtee/qcomtee_private.h  | 226 +++++++++
>  drivers/tee/qcomtee/release.c          |  59 +++
>  drivers/tee/qcomtee/shm.c              | 102 +++++
>  drivers/tee/qcomtee/user_obj.c         | 712 +++++++++++++++++++++++++++++
>  drivers/tee/tee_core.c                 | 121 ++++-
>  drivers/tee/tee_private.h              |   6 -
>  include/linux/firmware/qcom/qcom_scm.h |  27 ++
>  include/linux/firmware/qcom/qcom_tee.h | 286 ++++++++++++
>  include/linux/tee_core.h               |  15 +-
>  include/linux/tee_drv.h                |  18 +
>  include/uapi/linux/tee.h               |  54 ++-
>  25 files changed, 3964 insertions(+), 16 deletions(-)
> ---
> base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>
> Best regards,
> --
> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>
