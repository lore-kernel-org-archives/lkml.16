Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED51D8E10
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699102; cv=none; b=GDZv7qdmBH+WzshyFUz54nsj6vcmXVL1ywcsYf6vdoUZPmJNWL45Mnn2dsq+ZPQP5S2ezjgucqGZxo7t7FCL9ToZMT7nXu4O4PJM38kBSbMq0HKQhQUKGRdEWTxc5s2s4D4JNq7lKVAFBW/Qzk2TojK+SP9oBVQf+88fWwn/hXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699102; c=relaxed/simple;
	bh=On+eNzKuN+amPTz93qf1g6YDrx19UUM+He9OpXK3udA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aL8HvemOEGiwQWMNpfgRRMeprAgoOz5LwuO8VhJocEBJ8jqdNZOKRobWPvDuts6dh255qP+TS2S/BI4FaK8WYPyMsF5dPpnFSW+HGiTGeMpLYCAdFyUOuZG2E4l0AWsAvZcO1g6nSjiUO8KdfJ051ys6jp17ww4/rzS1r7MwuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=noVJKyBW; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="noVJKyBW"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2d0d25cebfeso691264fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699100; x=1747303900; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ5dCEOEywOXExzoNtHF395pMJNUPTYfr0213Oivri8=;
        b=noVJKyBWunmeWfEWWFPz5/+pB8B1xK3ovAF4F2BJQw7M5AuqWRcCoSyT4twcRNZnKd
         wKGeHuPvtlHdovn0vG7AAQiFtRp8XyAB6zMNM6ytTGMQnjXEDSs56iKA3rvZ6rpVJlc+
         nhc8vVbHjuDFvLlU3zfcv3Zx1yKClEaJ82OrSRdfaJyttKxKAm158d8RDlwxSjQJspVT
         UU/lxJVnWpX5+D2XbUFHxZKImBlhqqJVUrfWEheXfxEraWUD6r0gyLvi58cJ1cbU8SaY
         SxM601BTNrnijiLT8pT0NQyxPCohHaNwWD8Xmw152/0vd43lgWdSvDoXwQ6u9obABvJK
         w+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699100; x=1747303900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ5dCEOEywOXExzoNtHF395pMJNUPTYfr0213Oivri8=;
        b=SAdrhCZivAuKshzHvQhNv42t/C9A6sqa88/K7uFbRAWF1fjqh4WghASQrkfgp/Koi8
         DscHaS3tDPO2dcXuQl7RcMFf2nSxYJ0fd6s73JepWysps1FtZONC7SHv1qnTIE9R0bTg
         PwreDEaZc6Uag3zQaKTQ8fpzAvIS9hR5OqDjUhEOeBbsZO+jxPPF1e8WcuCmOGaOFVW6
         h0ioL+RbIL43ICl8udYw7Oj7pz3UOS/obt5sRnaiXVxPc8Y+2WPXGOF00H14ZfAag/vn
         rxf24WmKuBe5AzV6S9EAW6RqH8fdLHrasIOayoMCiz7H2G8LLDQ9JlS3m+yCHYJYljKX
         yi9w==
X-Forwarded-Encrypted: i=1; AJvYcCV/K+HVIx3iWKVmf1BOAiFLas2pmL98EorRYJlM8FOIEV2P4cKPIMkWd62JTk2H7G+ovy2XRfrHcTRaCuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywGJsxgk7fO8bwxQ7rdZBdHdH0wniOQdBMG4e+Jqs4Juilw+R8
	XBWRig3badteOLbz8kU0KlH2e/bUq85ku06Xtn7Dqi9K9wTskSOllQVEG1lheNJIuv9AwHXlOR6
	RD8NxpCv304iDTfXHLgvPoT1Ja5zsI7RBCW/mVg==
X-Gm-Gg: ASbGncumazdGhWSrp1nA0qalNsjyI7azX2J45ka7XZJlNts0zWtP0gD+g9X0cZhCvIW
	/xHHlxyVlmXA9wNM4hWk5Wk+eIcLBgYd5ySTWeyXb0t4+v1h8YjdsTMfAABNzLDnrBa+DGcSoFU
	9J5kc/ea0CP2k2dedlMwQUwtk=
X-Google-Smtp-Source: AGHT+IHHXXnIYY/blUtMMSgG++YLeS7dxymAnQLTsOYoZnzz6dKtVl2gZBaYez1Lnzo1dTAwj6L+w9Z+nAfO1s/JwvQ=
X-Received: by 2002:a05:6870:7007:b0:2bc:69d8:a39e with SMTP id
 586e51a60fabf-2db819c5ab1mr1885103fac.33.1746699100067; Thu, 08 May 2025
 03:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-5-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-5-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:11:29 +0100
X-Gm-Features: ATxdqUH6wo2bEt1fpwg-JytKDz-8k2kgNoYHvmdBlsX3gPg4fgC2u7MgLMrGOfA
Message-ID: <CADrjBPpDy0itLoxTif=iYYOQspStjsHFza6bn1wDTmWs7em44Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Will Deacon <willdeacon@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
> From: Will Deacon <willdeacon@google.com>
>
> In preparation for switching to the architected timer as the primary
> clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> property to indicate that an alternative clockevents device must be
> used for waking up from the "c2" idle state.
>
> Signed-off-by: Will Deacon <willdeacon@google.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested using gs101-oriole with linux-next plus this series. With these
MCT timer changes and another series I will send shortly for
exynos-pmu to program the correct hint to ACPM wakeup from c2 idle
state is then functional.


>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 3de3a758f113..fd0badf24e6f 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
>                                 idle-state-name = "c2";
>                                 compatible = "arm,idle-state";
>                                 arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
>                                 entry-latency-us = <70>;
>                                 exit-latency-us = <160>;
>                                 min-residency-us = <2000>;
> @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
>                                 idle-state-name = "c2";
>                                 compatible = "arm,idle-state";
>                                 arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
>                                 entry-latency-us = <150>;
>                                 exit-latency-us = <190>;
>                                 min-residency-us = <2500>;
> @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
>                                 idle-state-name = "c2";
>                                 compatible = "arm,idle-state";
>                                 arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
>                                 entry-latency-us = <235>;
>                                 exit-latency-us = <220>;
>                                 min-residency-us = <3500>;
> --
> 2.49.0.472.ge94155a9ec-goog
>
