Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57D1FF1A0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712180; cv=none; b=SOrYbULl+Vdo4MaFmWhzFdJXBbUOIr3ul80vuy21rqDnaXveU0S1ka8fB/oDW5eEWJiZl3uJFUazCktPyXaTfO3H2LaaHlPKiicwC/xKjJWSxmEgvRg1CwSpY0Yye+K2UJUiyhwLamQcGjCJH5PObEnPMKvSeSxoTU+h1vh7G0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712180; c=relaxed/simple;
	bh=jYM0G9ES4rFsGTmdDqEn/XKwe75r7vjUpoU9BcABy7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fr1W4sSdYdjVI1xi0m+X/ixto/RW08UC3bTMsZxkH9jgxKKBNEa53f5ifqzEbin+oMtL2hvtiHUujo4HyKK68ObZ/Lsl+4mOEtwzAyFw2BimopBrigi4BsTY+skfCuRuAs+xJbUb1MsUL1OgP7JymDreB8HgsGZNOl5z75xp4/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdwCUR41; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdwCUR41"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so5479957a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750712178; x=1751316978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QVzL4zaArPg/5of/Yc7E7efOjPemBYxYx3U1AQg+Scw=;
        b=NdwCUR41MpfCeCZTNJY5pc31HBcDSiD04kx+rceOzQ7nph4wT8xkfp02o95JvAeYlp
         qET8mfcYxj3LuDcGM9ZPnAYcGsfwLMSCI2e0bousJooB3UZkyMu1DXXT30uM9Sb/3A9Q
         v2YBSEwOH0snWddklVU0Xsk0Cuj2tj7mVCABzwyJOh2GYaDV9tHuA6uZZO45wWoe0uZb
         dVxLPzKR57NqL6G4YW0lxyHeYcuxF6km+mtPl0yxwSEYSSKndZenwxZFDGLsllRSySsl
         ebjnBqRd0Rj1WaOcCHFdDs8WMh4uFQQYxHKX7i5FOdDgJype0biMej3craKAsOtG0IHm
         iCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750712178; x=1751316978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVzL4zaArPg/5of/Yc7E7efOjPemBYxYx3U1AQg+Scw=;
        b=Jkm178JhdehURhDA0OZ/0DcEMyr3OM9GHiMT7D+yvK7EQb+OZalyqqe0hXRa4Qb2rE
         mZRPJFbiGCq2tt0BOQi+KYoJyalX1XMULVCy8PypG0qYO6HVVcYNI56Fh2SfLsAv4wsj
         QIeHO9Bg4wi9JIuvV3sGXn8bXAwbNaLwXmFEdKp1MQC35z807Qf5HN4qrqhJNCAc/wuJ
         OLy6p5/LA/zJynHnai83pvcsmoMAkj5BDNrV/d/kDi2i9erZ2tVZGt2CfZ0PkPfpu7Zu
         lhynWeOPnT16nZtxz4MlhcmMuhlR/d4i0hlcUsh7VQq/aEVSgscgiRqalAUU7bP8AV1p
         dHMg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhquHcjFclfg1g+f6IcQDlfbpsMmaTCZtGIz5RQ5V8lTjj7PXOUxzb/3o7bDMhCJFcLyQUSt0M72GXwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2i6xjihCx2LSvsKKOYuJ/tjky2+Gn5o2ENf+quXdDtzReiCfI
	IcucqhMGAr2GL1sSALP3cmzPn1X2W+RZ956ijCh0gNCcwiz1E8QEWftTafy/av/9hOWKUVjLEdp
	s5k0TTPM6+eMkCptzPSeySRHUTyKNRPngdugBo86ZHg==
X-Gm-Gg: ASbGncvsu02TmvQamPbp//nSPrG36Z2QdLcqHTGaXIqLyalZDbhzgZamaerxKZA0qho
	P+rVdAgt6tFEMVSPGL8IjLAf/+sZYjO7syucDjavpGrtRzLzcwdCBOkYdGfZ6Yc70PpRseyp2ac
	VC457o9iGk3Jud6CCvG81QafMNFDNiWcgJ9O2LwCZWf2ZgiLa7n/Aq9PjzdhNcGB4226qlCWuyb
	9EP
X-Google-Smtp-Source: AGHT+IG62A6gBFAgiYMZLM6+rT05GIhGRPJMk/BiwxwHLKvrOe2J7NsF6Q4574dAZySK1HIBp2ZYQWF+gtKGa/ZvJqk=
X-Received: by 2002:a17:90b:4a88:b0:313:db0b:75e3 with SMTP id
 98e67ed59e1d1-3159d90ba83mr20236751a91.35.1750712178330; Mon, 23 Jun 2025
 13:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623130700.210182694@linuxfoundation.org>
In-Reply-To: <20250623130700.210182694@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 02:26:06 +0530
X-Gm-Features: Ac12FXzC4d8GyG_bxKGLV9U5tKPTyHhrkv4bTYglFn3es23dk86lnyhnyukxKB8
Message-ID: <CA+G9fYt+aQL1Z=h7XSccsjmjJWLKvXBCMYJR+vq3g=Pw6wPPMA@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/592] 6.15.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 18:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.4 release.
> There are 592 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.4-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Regressions on arm, arm64, x86_64 rust config builds with gcc-13 and
clang-20 failed on
the Linux stable-rc 6.15.4-rc1.

Regressions found on arm64
* arm, build
  - rustclang-lkftconfig-kselftest

* arm64, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* riscv, build
  - rustclang-nightly-lkftconfig-kselftest

* x86_64, build
  - rustclang-nightly-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: stable-rc rust unresolved import `crate::sync::Completion`

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Build errors
error[E0432]: unresolved import `crate::sync::Completion`
  --> /builds/linux/rust/kernel/devres.rs:16:22
   |
16 |     sync::{rcu, Arc, Completion},
   |                      ^^^^^^^^^^ no `Completion` in `sync`

error[E0412]: cannot find type `Bound` in this scope
   --> /builds/linux/rust/kernel/devres.rs:226:49
    |
226 |     pub fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Result<&'a T> {
    |                                                 ^^^^^ not found
in this scope
    |
help: consider importing this enum
    |
8   + use core::range::Bound;
    |

error[E0107]: struct takes 0 generic arguments but 1 generic argument
was supplied
   --> /builds/linux/rust/kernel/devres.rs:226:42
    |
226 |     pub fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Result<&'a T> {
    |                                          ^^^^^^------- help:
remove the unnecessary generics
    |                                          |
    |                                          expected 0 generic arguments
    |
note: struct defined here, with 0 generic parameters
   --> /builds/linux/rust/kernel/device.rs:45:12
    |
45  | pub struct Device(Opaque<bindings::device>);
    |            ^^^^^^

error[E0600]: cannot apply unary operator `!` to type `()`
   --> /builds/linux/rust/kernel/devres.rs:172:12
    |
172 |         if !inner.data.revoke() {
    |            ^^^^^^^^^^^^^^^^^^^^ cannot apply unary operator `!`

error[E0599]: no method named `access` found for struct `Revocable` in
the current scope
   --> /builds/linux/rust/kernel/devres.rs:234:33
    |
234 |         Ok(unsafe { self.0.data.access() })
    |                                 ^^^^^^
    |
   ::: /builds/linux/rust/kernel/revocable.rs:64:1
    |
64  | #[pin_data(PinnedDrop)]
    | ----------------------- method `access` not found for this struct
    |
help: there is a method `try_access` with a similar name
    |
234 |         Ok(unsafe { self.0.data.try_access() })
    |                                 ~~~~~~~~~~

error[E0599]: no method named `try_access_with` found for struct
`Revocable` in the current scope
   --> /builds/linux/rust/kernel/devres.rs:244:21
    |
244 |         self.0.data.try_access_with(f)
    |                     ^^^^^^^^^^^^^^^
    |
   ::: /builds/linux/rust/kernel/revocable.rs:64:1
    |
64  | #[pin_data(PinnedDrop)]
    | ----------------------- method `try_access_with` not found for this struct
    |
help: there is a method `try_access` with a similar name, but with
different arguments
   --> /builds/linux/rust/kernel/revocable.rs:97:5
    |
97  |     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

error[E0308]: mismatched types
   --> /builds/linux/rust/kernel/devres.rs:257:21
    |
257 |         if unsafe { self.0.data.revoke_nosync() } {
    |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `bool`,
found `()`

error: aborting due to 7 previous errors

Some errors have detailed explanations: E0107, E0308, E0412, E0432,
E0599, E0600.
For more information about an error, try `rustc --explain E0107`.
make[3]: *** [/builds/linux/rust/Makefile:536: rust/kernel.o] Error 1

## Source
* Kernel version: 6.15.4-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: de19bfa00d6f93fdcd38a5c088466e093af981f2
* Git describe: v6.15.3-593-gde19bfa00d6f
* Project details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.15.y/v6.15.3-593-gde19bfa00d6f/
* Architectures: arm arm64 x86_64
* Toolchains: gcc-12
* Kconfigs: allyesconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28840986/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.15.y/v6.15.3-593-gde19bfa00d6f/build/rustgcc-lkftconfig-kselftest/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYPOcS6L7NBPk6w3gHjPLYyFI/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYPOcS6L7NBPk6w3gHjPLYyFI/config

## Steps to reproduce
  - tuxmake --runtime podman \
            --target-arch arm64 \
            --toolchain rustgcc --kconfig defconfig \
            --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
\
            --kconfig-add CONFIG_GCC_PLUGINS=n \
            --kconfig-add tools/testing/selftests/rust/config \
              TARGETS=rust debugkernel dtbs dtbs-legacy headers kernel
kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
