Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57C221DA9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193702; cv=none; b=qCeZt3OSYzzc73Ulnr/QZyauM82MxV0zpWipG//3M3Yp0VvumdiM3SZJryiSGLybm9QMwhxn/v736Ru9n6A7eKFMndJO/ihG11yPNpnQm2oarYd/7w9S/x/cM/G7JoM6/iTXUtCq5NIy7oUuP4ljAU1jhQNSkfslEtb6YFQ2IcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193702; c=relaxed/simple;
	bh=PAbz7UvKpFEgLj5Z7hCy2WOCUWyJvYsgJPImf2cSkAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEPR/VYxJzb1NLgqla2bnWyYRGObItdEEIymj7VOweT21wkFgLJ/TYs/YKApcJB6HIJZvjj0BfGceeK7+RTup7OEn8N0ojwQWTYygBxSn/QlGpFcVxffrmaNSofBu8BCq+3ZeaMbMNUc4Gjci3IA3qOy8OMtnv128DUn+ZVNtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALA6V6Nq; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALA6V6Nq"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f6ae4846c7so35101697b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739193700; x=1739798500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSOkGddlFU/lkCcHnNp+1rcvb+cBDqhlRIZAqPb9NJ8=;
        b=ALA6V6NqTbpqeUcyRkvDFyHR3O9phqg6duCl0D43BHbZWiio9aeFsSKvo/ZqvbAGOT
         i+IlIwuFomW1Y6qS7KRk8MCuF+zk8v6qge5qtUm7EtEczXEyyggSBV96oDUXKCs3eB9K
         rhXrNNR403C2pEncKfpo5gCvnzWiddJMU6/CAgwCY51cqt4QBO1Q97LPr0ew44Z1qbEU
         23HoCSnAepJtFS39NR1QMaoJddkdw5gPJyk8BkJFfqVKiE/NNYc6D969CLCxqLZhlEFP
         8rxEEVux9hT6jA/r6hHkCKXzsMg3eOxg+Gk9yToQr8iQ80xEEtne/eDhetAdAICZbtKX
         ObTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739193700; x=1739798500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSOkGddlFU/lkCcHnNp+1rcvb+cBDqhlRIZAqPb9NJ8=;
        b=BWVPkz6Ul67TjwmAITnEyI9qaIz/Kh0PEmdUvhkvv/Wwfg9ZDxc+4CnlrvKC8tBnMz
         +vNumhWPTVlUJbH8MjdipXIPVPNGDn/+EsRA0yc/vuDrMTGV/9BRG6g+ZspPHQfaOBqZ
         C+uU92kRbbuLO0I2tUmvPuvUpQsiHpdGo0crpggekF7PBhb5c7oQ3HHVeHsLKZQIfaec
         vopWgA2/cpUuGAtSusSTA8hIA4CJWNAWAEz1CxXWkIOLSHpiCpSM4ZH0ViEff2dz71wR
         lZxm2y0zaDBcFJ7Go8GI7GvxfvU+6k3AGNUedaQNwr24CRDho3yglqM3wtfV1ihuHQ7J
         0X5w==
X-Gm-Message-State: AOJu0YyS/uRTVnf4JHHTTIPJd7XJAZUOxZzZ1OcIYQtSirYsHTirZDdY
	YT4YfnK9lKxaR0hM59wkNgybcIq0wW88xK82to2VF2pFwQcyZsBnX64X9upndQLL76IfygJywC0
	k8HLRd5E8JIyAGTDIKUdRUqu8CjDd0kCDKInGNg==
X-Gm-Gg: ASbGnctY64ZnDM/rbMb4+17gPYSDLjdUciGQ0j45idUnez2F3itKiuSs/h9RVyb02hx
	6sf58iu6EWZqxvWAhbLPq8zipLG8V13gdWKB/z8Bp3jdRqGf5dFSZTDcfEMeqqwCdWHh0tMy+hA
	==
X-Google-Smtp-Source: AGHT+IGT/GDZ6Gxp5I3tVgS1PGL22uLGu8gT3RwgG3Vcr3l8bKWAi7Qxr4psOTaJndd7ZmGbBmIMtA2xZ5DujtxikjI=
X-Received: by 2002:a05:690c:fc4:b0:6f9:4bae:450c with SMTP id
 00721157ae682-6f9b2981b0amr124519297b3.26.1739193698224; Mon, 10 Feb 2025
 05:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
In-Reply-To: <20250206220940.10553-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Feb 2025 14:21:02 +0100
X-Gm-Features: AWEUYZmw4p2ewkot51drspCy3hd_woeZ-XwIYUHgv-bUaKg6vpiCs0WxHAlmW94
Message-ID: <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
To: Kamal Dasu <kamal.dasu@broadcom.com>, Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	adrian.hunter@intel.com, linux-mmc@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, 
	f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"

+ Jens

On Thu, 6 Feb 2025 at 23:09, Kamal Dasu <kamal.dasu@broadcom.com> wrote:
>
> This patch set adds support for Broadcom TZOS to read and write to RPMB
> partition using synchronized access to the controller hardware.
> To achieve this Linux OS and the secure TZOS make use of:
> - shared hardware semaphore register
> - a set of SDIO shared work registers and
> - IPI interrupt registers
> The sdio shared work registers indicates next in queue to access the controller
> and current agent in the queue. The currently running OS that needs access to
> the controller puts itself in its slot of work register and if its next in line
> it can try to grab the hardware semaphore and complete its mmc requests.
> Next agent queue state is changed under the hardware semaphore lock before it
> release it by looking at work slot register. send and receive IPI interrupts
> between linux and secure world are used to indicatecompletion of transaction to
> the waiting OS. TZOS has its own RPMB driver which accesses partition when it
> wants to read/write RPMB frames. Current implementation assumes Linux and TZOS
> as the two work agents.

We recently added an in-kernel interface/subsystem for RPMB
(drivers/misc/rpmb-core.c). The optee driver (drivers/tee/*) uses it
ro read/write frames and route them for the secure OS.

When the mmc subsystem probes the eMMC card, it registers it as an
RPMB device via the new RPMB subsystem. In this way, it allows
consumers (as the optee driver) to read/write to/from it.

>
> Change required adding two core mmc_host_ops request_start() and request_done()
> to let the host controller driver know when a mmc request starts and ends so
> that the access can be synchronized. This has been tested with both the sdhci
> and cqhci access. Currently these ops are implemented by the sdhci-brcmstb
> controller dirver to acquire and release the hardware semaphore before and
> after access. This change to the mmc/core driver does not have any impact to
> existing controller drivers.

It seems to me that this isn't needed at all, assuming we have an
in-kernel tee driver that can route the RPMB frames, but maybe I don't
fully understand the use case.

I have looped in Jens Wiklander, allowing him to comment on this too.

Kind regards
Uffe

>
> Posting this path to get comments on the initial implementation.
>
> Todo :
> - Provide  hardware smeaphore using the harware spinlock driver framework
> - Use IPI send receive interrupt controller driver
>
> Kamal Dasu (3):
>   mmc: add request_start() and request_done() mmc ops
>   dt-bindings: mmc: brcm,sdhci-brcmstb: Add sdio sharing support
>   mmc: sdhci-brcmstb: Add rpmb sharing support in host driver
>
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  16 +-
>  drivers/mmc/core/core.c                       |  14 +-
>  drivers/mmc/host/sdhci-brcmstb.c              | 275 +++++++++++++++++-
>  include/linux/mmc/host.h                      |   4 +
>  4 files changed, 303 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>

Kind regards
Uffe
