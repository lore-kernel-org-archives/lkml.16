Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E520ADD6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665780; cv=none; b=EauNVJZR0cp9F3LiVL1cBWd9W5VFYE96s5RGvl9/bkw073yb9N2mXiD9asPyw6+/AGZsDCMRetHf6is6QjNc1OdE3vkI2SKk4SP+1dBE3SWpPD7L7kpS0UJrTmUjP/3Q0ytzid0F35k1/fDcnsTBlf0uqxyQ2DNHDDQPin2bsWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665780; c=relaxed/simple;
	bh=O9fK3I1pzwKP4nLc6/iAkvLdftAlb3h+THZJIPaOcUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Got3IEZTuOmp2LuxVQhDzSg1WB70tb1VdcVyyij6gdvsTMmvpWsgNu7gZnu809cfFlXKF3xwJB1BsUUXevpWyCi8ccZyfL0BNuB7m0Ly1LDcJjECSjG0epnZNJOa60CZHymgbJIj1SEhbkW/icT8Q64BSpwsYHVCc5wO+k9Y4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I7lYGzHv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I7lYGzHv"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3c47434eso407074e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738665777; x=1739270577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE2w/bQJpX8Ezf3hOPnZ8S+RoX8BTDVVvaDLT5mRYhc=;
        b=I7lYGzHvU0BIKzXN8+MYN6s/pBGNbsu18VNl0KVMsNRP/0bQJL0KbLWpSvTLgIL6fm
         xZcumAOfZcd1ZZM1Au5prZx3JuRGG36Uddc6zNG5mX1QqVr1FbQfMafvYZXC5fUyxEN3
         06zeMYaNVxPHWmxAVm4q9Ti5UiExaSR1/CSJLFFTfAjCc0HiNWwnTRWb8U2CRzz4v9ps
         6GqUzZj4enmv9KiMdaKU8d/rIq95qB91+dXwCcx0WsdxsmlWhJQK0F0DKap/fnuPAI38
         WbvBRHTiAy1yJb6bv6MqPpjRW6NncHqUQp3wjlw8d8nxjrklqtNTkb+rNH7Y61hLQJK7
         lw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665777; x=1739270577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE2w/bQJpX8Ezf3hOPnZ8S+RoX8BTDVVvaDLT5mRYhc=;
        b=KI+33+MBqU9g0BsSdrl+15O9e0ct9Vhv7EdXAwC95O6w8y/NYoR3R9km6LNILWgPSn
         xnts+7ajIuI0Km2Ut1iYaUugFBe4sITQKt77GJiOCuEEYube5GZETFXQTXd0iQKdgV+l
         WAib0Tr8QrSBcQcul48UhvGEATgQq/MnIIQ42aFWfk7QhhCy2idwJ1uADfc5tOTj19kn
         Igu9uDnIn+8bmdE+8MNFn6pcFBxTu0+KX0hBkcX5/s5+CjbEb17N+I2GT9rJuRbeZvs+
         zzvr0om35mI+iiZcsB9dEJsFrBJqBzm0P1aaSPtz4sqDqqBwtF+eXR5JDu2R9JJ6dA4Z
         cNJA==
X-Forwarded-Encrypted: i=1; AJvYcCUO63WzNAhgJGRW1PxjEOkQD0kpQCUHobZ0/b/fwYuJ60QSCCt8cUWuScCTbYXjkGtCbix40hkurXdLvuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpQ0OoZicwAlxvFwk8UValaW5hTNttyYN0D2851cEqlrfUVmvy
	JSe2yeHTsw3uVriySNCRGcuGRdK1jrfH0SN79/iGR1x47wamwRZTVyyN/RKyOXkx+GnLEh6i/dE
	dzASBWnD/exkyn+AlC/Bs4Cg6xUO5/C0PJIuZig==
X-Gm-Gg: ASbGnctF2Bh9uiwp0/8E5Qv4qOM+VcNw7tYBRa6N/IcjG4yQv41djIF9VIz2NDYEHfy
	C4KMWcqSQBW592wc/Vcu/AgsGCWEDvuAfMXXkor0MKG9Fq+mBd7147N4g7z9Mns2Dg6AFL8q3i3
	GVYh2n2yexjBTbsbKM7YtYF5cxBfJC
X-Google-Smtp-Source: AGHT+IE5CYBdpn6DfP3V68IEBp+LNXJHRO3XMVbiHUUscPeksGzYuA8lgJODapvJJrdvbNiLHm9bcRL2vHNots0NUJA=
X-Received: by 2002:ac2:4f85:0:b0:542:2999:399c with SMTP id
 2adb3069b0e04-543e4c3cac2mr6409529e87.46.1738665776073; Tue, 04 Feb 2025
 02:42:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204060041.409950-1-ebiggers@kernel.org>
In-Reply-To: <20250204060041.409950-1-ebiggers@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 11:42:45 +0100
X-Gm-Features: AWEUYZnKZTyWo8D9zkwZDMqGx-d60ikbe91VkAnSO7h5ypwW4ujvIIcv_3fYFsw
Message-ID: <CAMRc=Mf-iTgUM4K1c6NpsWL+dk9BP72rJsXKf6tCKUTB=SSizA@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Support for hardware-wrapped inline encryption keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
	Gaurav Kashyap <quic_gaurkash@quicinc.com>, linux-fscrypt@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 7:03=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> This patchset is based on v6.14-rc1 and is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/fs/fscrypt/linux.git wrapped=
-keys-v11
>
> This patchset adds support for hardware-wrapped inline encryption keys,
> a security feature supported by some SoCs.  It adds the block and
> fscrypt framework for the feature as well as support for it with UFS on
> Qualcomm SoCs.
>
> This feature is described in full detail in the included Documentation
> changes.  But to summarize, hardware-wrapped keys are inline encryption
> keys that are wrapped (encrypted) by a key internal to the hardware so
> that they can only be unwrapped (decrypted) by the hardware.  Initially
> keys are wrapped with a permanent hardware key, but during actual use
> they are re-wrapped with a per-boot ephemeral key for improved security.
> The hardware supports importing keys as well as generating keys itself.
>
> This differs from the existing support for hardware-wrapped keys in the
> kernel crypto API (also called "hardware-bound keys" in some places) in
> the same way that the crypto API differs from blk-crypto: the crypto API
> is for general crypto operations, whereas blk-crypto is for inline
> storage encryption.
>
> This feature is already being used by Android downstream for several
> years
> (https://source.android.com/docs/security/features/encryption/hw-wrapped-=
keys),
> but on other platforms userspace support will be provided via fscryptctl
> and tests via xfstests.  The tests have been merged into xfstests, and
> they pass on the SM8650 HDK with the upstream kernel plus this patchset.
>
> This is targeting 6.15.  As per the suggestion from Jens
> (https://lore.kernel.org/linux-block/c3407d1c-6c5c-42ee-b446-ccbab1643a62=
@kernel.dk/),
> I'd like patches 1-3 to be queued up into a branch that gets pulled into
> the block tree.  I'll then take patches 4-7 through the fscrypt tree,
> also for 6.15.  If I end up with too many merge conflicts by trying to
> take patches 5-7 (given that this is a cross-subsystem feature), my
> fallback plan will be to wait until 6.16 to land patches 5-7, when they
> will finally be unblocked by the block patches having landed.
>
> Changed in v11:
>   - Rebased onto v6.14-rc1.  Dropped the patches that were upstreamed in
>     6.14, and put the block patches first in the series again.
>   - Significantly cleaned up the patch "soc: qcom: ice: add HWKM support
>     to the ICE driver".  Some of the notable changes were dropping the
>     unnecessary support for HWKM v1, and replacing qcom_ice_using_hwkm()
>     with qcom_ice_get_supported_key_type().
>   - Consistently used and documented the EBADMSG error code for invalid
>     hardware-wrapped keys.
>   - Other minor cleanups.
>

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sm8650
