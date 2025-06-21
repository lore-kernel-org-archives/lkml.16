Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CB21FF45
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750520150; cv=none; b=tq/gSD4X3OWEl0r1PeNTlZ1sKAxy/KUKh4WdQ0GmXQiStithImKa9cEqODPj1tzULK6W9Vnp5vGZEkTClngbNLmcILV5U7JEEdUXfmvDD8TKbSatDBYD79Jc5rEMogmftlr6pZC6ZooFk0ms05ZEM9uMhcuQYJR7aO68+IHJlXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750520150; c=relaxed/simple;
	bh=Z0YvMrEXahV6Bau7dFtEzJFPdcZeXuaz5bkrjlZVLCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAOS8IgdEdx0210jG25DyZtZoZ8ZYwyJcSKU7nimKThPodnvaazWFsh1BZ37Ebkg0cf0DkKJvg6yk/G46JMLX9ktwg1BUGitILxvpxz0STcJ8RK0CAhfXwwqJy32MJNY4r6mJK4O21OyJ5uq+hhgtytm9DtM5j71V4WpXlAuWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CT5VV+2m; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CT5VV+2m"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso5361998a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750520146; x=1751124946; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/J+4tuN+K5ETkGh73Z2WxB3VAuuxIUgavzZX0gT9Qc=;
        b=CT5VV+2mB0Sm9ewjUD+9HdFIjbt4t1zzciLGQS6+abKSh9CT20f7L1z09INvlrutk1
         ZNgMCtuG5cy2j+gnYByxuBmYbqrDeVDfZTndJkYsrVRkwKoYnRwcB7Boe8Yl3xvDQehS
         U7OyM1ZeKIOvU81UL/yQSl//y45CWy97Cmzak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750520146; x=1751124946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/J+4tuN+K5ETkGh73Z2WxB3VAuuxIUgavzZX0gT9Qc=;
        b=VS9wjaOlmHLoT1K8yyvytc2Fz1KwugNk+Y6pTpDkvkqlI1NUhS9PRitgpqm/gPpacp
         oyF54AqA1dXKZ8xaLpqV06edgeqBiguwV1/m60LBDEeA/tUoXxz3PiMC6rurhomzMmOv
         4/e+ajikxIpfLfpQjadA+niHqVr9Hhr3q988GwcO6QbMhL8eQLdUUiT07lq/68ylZWt7
         KYAX4PQSbYT/8TE1Z9EL+bHVoTBq3BYMwN3jtM0I/X4rcJQ06VcIAVnRcNpRjCf8A7TR
         FNJXDap8XV7plG7QRJIRuKeT1TOI4wqlTPlbzY9P/UWOKWxffs/UvfLHWp0CFQrRdYcO
         sYSg==
X-Forwarded-Encrypted: i=1; AJvYcCVW60IWeEEnMtY/Tak8c3PCMEqYzAj5t5giC1zdenGtsWUzOZkLUv4XqFvYDi7MksSIDG3Z8Dh+q54ATYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhodw05yCNMjEgR+9WdwUtoN4HIHgS0rTkzaMIGLh7dnDcM7VN
	3+RoAgzK+3rvbrgR7nnTTC6yFAnb0ApxO79Adrv9t3Vu/yz8w8S9+X2omhCQaxUvo0iwq6rUcwE
	Uk+vNdx8=
X-Gm-Gg: ASbGncuVhHPjM/hois9ay+3mAntmUnMIVpCIjbDf3qXjN1fVETrUFSTRKkYHmtrt2nx
	j43xvUTr5aiD195nDJ45gZMW85k6efM1EXxRVM+b9cTW/xRMv1j3MJL+6rH/p/utTKhFndkycxK
	eksccjY1CEoRA16yMHTb2fhSuUMmRc5GT9onV4jKwDOKRomAmNpdGKygQqQqGHdL9cJtdH94DHn
	5ekAX8I39i69LvU69bxyMFe+kKvqi7NTVwT+J15CdhhabrEW4RgxNapS305G47KOECvG/hHQmLL
	czOHI9CkTnlINhp+TlwxJUuAd1Bc5RzfQ1GBmTwMeIgEO0Bg4p/TbsSZcUT3DHnT3RvggsbsyRc
	1PNJjndbwce2GrHSGTskhn55gh9wLqn3YJ7Bq
X-Google-Smtp-Source: AGHT+IFj8Ig4RX4AdHEEoaPSWvJxnNSwLLSEueC+YZWyjIDw4DSXa4DojOtDSnz5I3GEkvqvXmyO6A==
X-Received: by 2002:aa7:df0a:0:b0:60b:af9a:726c with SMTP id 4fb4d7f45d1cf-60baf9a8055mr571981a12.25.1750520145884;
        Sat, 21 Jun 2025 08:35:45 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a185795b8sm3360346a12.33.2025.06.21.08.35.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 08:35:45 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso5135774a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOLBo+TJS2/lMmubo6N3OYhqA+gywEkNQZsYv6dH0qwJaKAWWBdBg2R7eT4+irzq8sa1HgqjOM1CJ3dxU=@vger.kernel.org
X-Received: by 2002:a17:906:f5a9:b0:ad8:a935:b905 with SMTP id
 a640c23a62f3a-ae057d7a6b1mr515906766b.22.1750520144897; Sat, 21 Jun 2025
 08:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJZ5v0iNVFFJVgzeMx=+UMw5MTOUgdu_WGpJxE3qjHikQ4Sp4A@mail.gmail.com>
In-Reply-To: <CAJZ5v0iNVFFJVgzeMx=+UMw5MTOUgdu_WGpJxE3qjHikQ4Sp4A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Jun 2025 08:35:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPwhqr7mwmXDzYkfAcMRu3zyKRxz3hh-wfg-BQxj+UZg@mail.gmail.com>
X-Gm-Features: AX0GCFtfvCldbS-qaKxG9GOLReH4rkHdVfY5_ZteJ4VslcEcSQtyhd00NZjb348
Message-ID: <CAHk-=wgPwhqr7mwmXDzYkfAcMRu3zyKRxz3hh-wfg-BQxj+UZg@mail.gmail.com>
Subject: Re: [GIT PULL] ACPI fix for v6.16-rc3
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Jun 2025 at 04:31, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> This fixes a crash in ACPICA while attempting to evaluate a control
> method that expects more arguments than are being passed to it, which
> was exposed by a defective firmware update from a prominent OEM on
> multiple systems.

Christ. Reading the ACPI issues page makes me go "D'oh".

Does anybody know what the heck Windows does in this situation? Does
it just happen to work because it uses random arguments and happily
dereferences bogus things without realizing, or does it do the "zero
out missing arguments" thing?

Because clearly that firmware bug must have passed entirely unnoticed
by people testing that thing on Windows...

              Linus
