Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEFB3D544
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555135; cv=none; b=pYpSmQgkV2S2kdYgyHvwfnYAmP+6izMJ930WtELgca5JYW0znKdaf9CkIqYAXaKCo+XSKTQdonShfld68i0QKUJL3aVdfYKsSGrniLTgUvMX8HrCckYjLMYfl8zpMw5XiBlWgGu2iZorgyIwEdCog2cZBbgWoUBcTf7V9lbunZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555135; c=relaxed/simple;
	bh=kWy2YrKT60IwWsq++tLedZ+gnW8uDSTJv9+75+m2/o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGOlalyDbJh5fJQXHxj0x7Rg+fNQiz7vahypOM2f7N57sp7nkLyUASd8s+7pJaUJ2QWp1Pd4KY0poRFrmUpkWSAmv2+xWoGRJJB6jKK2jU7Uq8MFP6iJU1lbT4bJLuGKIyD7+xuX1t13cisZgqBK0ozPGneNcrQpfBF5Hp4ypQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=MAWIyps2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="MAWIyps2"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7481600130eso5210238b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749555133; x=1750159933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofChJacQ1qiYJqBxicfF0O8ZtFsM5woxFYS+jj/lodM=;
        b=MAWIyps2X8XwJNfyRG2hflezERhd/NrDTY1lM1Nf5+x9IzifLlw7B3Euh2DjluqJ6x
         rOejVjzVA7XuxQc8iD/KCu56xV4t9LWTTNVZQ9LPGDBwa3uNuyzcMbDc2HWGObJJy+RR
         XMxNTVSSSCmBQj96bK+VaWBU+BGumLn0DI3Yead74COnSNvw2SMaYc82N4HFcGDBCWjT
         dZ6Hk7qVCRURHiaIXZxytEpDZrPXkGNIDH1rggYfJCRJPLYKLZlFEH2zlPWE6GTd99HL
         5TkPMDRcrPTo/z2sjfvrjZiCiayTV/kdQVPzD39F9ITquPXrgUUkM04J6VynBBU3e29q
         YXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749555133; x=1750159933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofChJacQ1qiYJqBxicfF0O8ZtFsM5woxFYS+jj/lodM=;
        b=ioNFmo0YYRiuS4EnfzLAuquBUS0Y4bx+4Be4V2HOWwyy9HLawkvNyqQSod9W8jrr0j
         ryusXnccQ7lqsjOG/HHwGXXD3VIAIZm35E7H37S0H0CLYZ0JtR27RtiF3R90PVfKMUaB
         gn9WMwy6FG+ow0nDAuW2XDCbKcmG/AzlkUG8ieSiZYRsn1spvXaSbfquQ83Kw7A6SW3/
         xiKyuGK+dRteC/hDC/hR2Qgt/TaGpgGKPbML5twCBGOcBYOrj+K5gn18TMfbpFuT+Sav
         7KYn71Q0GlQ/0ARAEYwxjmrVgrD+eBWoLyG9tDYeKlK0o8gYQJneORJmxpBb9YOEACgq
         3LTw==
X-Forwarded-Encrypted: i=1; AJvYcCXmYEkGk5Y2CM1vyiXyREBfjRmX+OtW5f8PabRxrz7jlMK95NoOJ8EcXQlfwc1nbeHN26UVP8Gg8HCohJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFC/zk+Vw1oBB6aE30t0arXrnFcpokjx1lLRiKy1U90Gtm6Rp
	5MWFPSS1XgH97qpIvPvh8jqiB4XWoFwZobfYAKiKvlhDg6EjuAOnWudMouvoEE0ReuUKqNwtHbz
	bgEciIHJkxs5VN3zTO7xPegwnecVFH07qmyg/LOWQcQZ6UeHdPBtcCF8=
X-Gm-Gg: ASbGncvFr1AZMCFrQzNiTxQEmLGO/xzOaIk3rxIoB//BbCSUwDCB/mmij3NV3yL2z/n
	Fdmc8Ack53Mfmycu7/yBkWn5xIHK9u0At9P5H69cMY9c6OWjMhRNYB4hqgIrcpbQQvgy3CSYs6u
	rzjbrutu7o0hgQaJ1683fKG3Hy1FcG2i40n+7C14kM
X-Google-Smtp-Source: AGHT+IHarIKTCg7Wh8AuZ0Tt40r0q9LllShk2yggWVtkhQj8gIAUkQYg7kT1J8Wyzz1/DOT2OhgAA7LXwaUXjy9MHtg=
X-Received: by 2002:ac8:6f08:0:b0:4a4:419f:8329 with SMTP id
 d75a77b69052e-4a5b9a033c4mr286210601cf.8.1749555121947; Tue, 10 Jun 2025
 04:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610085327.51817-1-graf@amazon.com>
In-Reply-To: <20250610085327.51817-1-graf@amazon.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 10 Jun 2025 07:31:25 -0400
X-Gm-Features: AX0GCFvB36FQ2mONd23CJy-bQAsJdpMnU5jLlIePTapa208TPsg1wFXBXlN5zec
Message-ID: <CA+CK2bBhUdEjD=-gM3=D6mKBYctbXh74_hq-bMf1fa8mfS2Edg@mail.gmail.com>
Subject: Re: [PATCH v5] kexec: Enable CMA based contiguous allocation
To: Alexander Graf <graf@amazon.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nh-open-source@amazon.com, Baoquan He <bhe@redhat.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:53=E2=80=AFAM Alexander Graf <graf@amazon.com> wr=
ote:
>
> When booting a new kernel with kexec_file, the kernel picks a target
> location that the kernel should live at, then allocates random pages,
> checks whether any of those patches magically happens to coincide with
> a target address range and if so, uses them for that range.
>
> For every page allocated this way, it then creates a page list that the
> relocation code - code that executes while all CPUs are off and we are
> just about to jump into the new kernel - copies to their final memory
> location. We can not put them there before, because chances are pretty
> good that at least some page in the target range is already in use by
> the currently running Linux environment. Copying is happening from a
> single CPU at RAM rate, which takes around 4-50 ms per 100 MiB.
>
> All of this is inefficient and error prone.
>
> To successfully kexec, we need to quiesce all devices of the outgoing
> kernel so they don't scribble over the new kernel's memory. We have seen
> cases where that does not happen properly (*cough* GIC *cough*) and hence
> the new kernel was corrupted. This started a month long journey to root
> cause failing kexecs to eventually see memory corruption, because the new
> kernel was corrupted severely enough that it could not emit output to
> tell us about the fact that it was corrupted. By allocating memory for th=
e
> next kernel from a memory range that is guaranteed scribbling free, we ca=
n
> boot the next kernel up to a point where it is at least able to detect
> corruption and maybe even stop it before it becomes severe. This increase=
s
> the chance for successful kexecs.
>
> Since kexec got introduced, Linux has gained the CMA framework which
> can perform physically contiguous memory mappings, while keeping that
> memory available for movable memory when it is not needed for contiguous
> allocations. The default CMA allocator is for DMA allocations.
>
> This patch adds logic to the kexec file loader to attempt to place the
> target payload at a location allocated from CMA. If successful, it uses
> that memory range directly instead of creating copy instructions during
> the hot phase. To ensure that there is a safety net in case anything goes
> wrong with the CMA allocation, it also adds a flag for user space to forc=
e
> disable CMA allocations.
>
> Using CMA allocations has two advantages:
>
>   1) Faster by 4-50 ms per 100 MiB. There is no more need to copy in the
>      hot phase.
>   2) More robust. Even if by accident some page is still in use for DMA,
>      the new kernel image will be safe from that access because it reside=
s
>      in a memory region that is considered allocated in the old kernel an=
d
>      has a chance to reinitialize that component.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Acked-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
