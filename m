Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2790F9D6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598517; cv=none; b=sggin1Im6arc2C57jCbUMVAWbJ2UPZZ6Lfq+8xzVu1fNRpbkjpjaAZAibH7C9ew/PjyecViVb/h5cNu4Zq+EYkrrWwKgYu3uRSdSfTnifO/KGDkYxhsadEzf+NRI6EKi/01kfGvyCGZ99qHAcB2yI/rV2EINTxAfj7BfKvUHKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598517; c=relaxed/simple;
	bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvsZ9g/qjvt8YgBan7CoMXqHUHMWF7+knK4qGx8nFw4zuaGSuLwhUkiLOWXVw1c1IWdcBtCdDsBNoaWd8B6GDbY8owst2rjdIeMVzbd8ay6driHwEAqo+XThdR7eypS1L/ikf3cV4JYkTJ56kTBxEJiPgWtip22euhjhPjEIOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=gUWi1tp+; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="gUWi1tp+"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3cffbcd520aso14043335ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1738598512; x=1739203312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=gUWi1tp+1bolsLx8ane/+nB/4dK116oyiGHThrkK6H2Uq49bZQTCLB15WGL2rGTKmy
         VMOwNHqQC0oobPs+W1uQQynoWrZXUniaLQ8Ycgfi3I8opftFxNN3X11HRhKrDBkX+g67
         mlVdAqk4af3GCy7wEXyU5m9mVkwI51zTar7t8ul1bfBD8BKSPl09hWhj0SlsyFOsDPzp
         VJo85ZFShLYzliLQFQ3+dFjdw2gx+nE/WuBKcrs/eMUWfkagRuNEKCL8W9NJZL3L3Flh
         5PdvtIXuywyvhbc2wRcKKvXijxY6JTf1nW5INozZpfWpbW7dFnOJmXM2CkNtIQZgBg4M
         Yhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598512; x=1739203312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=hmP7IRjPYfDWsdp4nCi7S3Rhjmj83RM2JdK3I3U8nY71YQEBH5AW2k7XujXctfxYGn
         hlinzu3KibUPMbIoaojOl9wOqV2B4rB7po6b4pjQ6VPaSfJNmRse2dgZR/oEMlz81Wux
         lQ1xkx4D62TcJn16hnLtR5SQBAATW4esPUa27nz/6xy0ORGrYFqV/h34H7/tiRzY1mC0
         6TCcUiBP/Zuy/lGOSMfJAcPO7dkMrEz32TCo+sDiM8sRttsJ79cKDivYnx9jIZHKaIGB
         gIkzyURthZB5IjMaBgOGrIf6Fi/olYc0MqDdxWyMNm4m7N3wQKROlIlZMgfdaHAB+kSW
         UVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJeiMEifP76Hqpm4OkVFfg+tqO6ChQ92xO1iFv9u0jH44QjlB6qE3Tjb0hUSot+bZ2CXnOuopB16bXpxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWZHv6EC0CAnPAgXGsxBDuPghflEOKZ9R1sdHwXIPo4tnYudc1
	wnYXMWYcouRMvHA4ggnS7kvemJeeF6DT/x+jifN5HzbbBtvW0VbIKhZGIHuLCdJhHOnYofyjGlQ
	7dolaj5+sUtH6WdjK/Ddo/8WXBn/ZwslawHM/9w==
X-Gm-Gg: ASbGnctfR9Y9eNtwTjlbYJcZ1ZW8jLDBXGH1ARaUbP1gSn52UmPxdejrqYm7E9VfQYc
	/PO3vaNTHMQDr11JYoOQwbv5Q0B11KejHQcTp9uvGVfoSF5VLu1COHBtMiRoDnuaU9kkctm3Puw
	==
X-Google-Smtp-Source: AGHT+IGh48EGwTYFSKrKDNbwh6iM4EsoVfBSxF4gz8U4VFmSmI9atHaxKvm8zrK7zrd+YcMu62K8X5RTMCsgFSldYNE=
X-Received: by 2002:a05:6e02:1809:b0:3cf:c7bc:4523 with SMTP id
 e9e14a558f8ab-3d008eec85emr149079765ab.6.1738598512548; Mon, 03 Feb 2025
 08:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214172549.8842-1-apatel@ventanamicro.com> <87tt9bnmcz.ffs@tglx>
In-Reply-To: <87tt9bnmcz.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Feb 2025 21:31:41 +0530
X-Gm-Features: AWEUYZlO5PZddtosW3YVPDmyhEnZw9_BooCQby6hNDlavzyqwz_yNvI7qNklqJg
Message-ID: <CAAhSdy26zZNOfD8CW_MaYq0PrZCVef6gqD7b=D1KWNZpcqYjrA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:47=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Anup!
>
> On Sat, Dec 14 2024 at 22:55, Anup Patel wrote:
> > This series is based on recent discussion on LKML:
> > https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamic=
ro.com/
> >
> > It primarily focuses on moving to RISC-V IMSIC driver use common MSI
> > lib and GENERIC_PENDING_IRQ.
>
> Can you please respin this series on top of rc1?

Sure, I will rebase and send v3 tomorrow.

Thanks,
Anup
