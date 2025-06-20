Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24349223DFA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439323; cv=none; b=RhOAsO4Z8mBxil7/5hLH9Ew4pZjxyV9U3zv2xwMoV1LejjebyHXIS/9fvsVUlLbbmKdtW+1ONsV4KCeHOPUaKcs7iGIA7dNIV4NPyx73c9iPccRG2IkjBLtURvKL4F9XhNw0RqWi1CGwgsX48dxE49U8oSszA1MZmy6AUiC8l44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439323; c=relaxed/simple;
	bh=fObN6yzjxDjOzWz/0Xf5eodun9aHHSe/BLDu3akzsbg=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=h/vHTI0QeP+hetV6kwP5U96DpaviZPMr51Lpd8b+BQcV9LhVVMqog9afrzhOoY+duSplCcISv932b6KvZ1574+yI6jbCJny3WDBNQJ0q9frNNWCN5Wl8r89jai+Fyy/ZF5HBhbGq5ngek3eNAq00F4Mp8PZ6YiINAzf3wdc2g3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=s00RIW0y; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="s00RIW0y"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2363e973db1so15265855ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750439320; x=1751044120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW3qXd/2gaC3iMAyCifS2wM+Xi4gx8o99xTUohrh2is=;
        b=s00RIW0yQtnRboXeL2ydHgXBXObMExD8hyt4DEKtH7+4zj4liQuw8blRf2+KbdPlud
         CIWE7ssc/r4zk/fepgyQzWXsupURo0OQsHLdyIwUKvJoAr3lXQEJCcH3KEnxv/BKOeJW
         FEVPxHydd/JTcgJ5yNhbyHrwoELbipG9LXEbVUw4SrC/4TQ2Je56OaswN8NPIS2stGzR
         IWE0HqFpajqGYAkoap+O6nSohYMClmLP1wRzws5tAljmb8qsiExgzvBgIAYTzOrcxVqP
         JgaBG6C5QIVSVw+6PJRrTkcW4l9ZaYUnpxYMgrU0l02L58GKe7JMVL+aQSufGSiaG15m
         dwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439320; x=1751044120;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW3qXd/2gaC3iMAyCifS2wM+Xi4gx8o99xTUohrh2is=;
        b=KZNs5qPNQBm4OM8nHpxrtqHNhznT3yp9OjCJocJ24v9zxwQV21tUEMc9sCqI10AUKq
         DugbXNypaNpK1q21P8kwACKxHp0Jg3AtvVBmB6nMHjZeDL3wABEUUpY2TWiCuPr2i3Ji
         Qaa6HAR/8yoijUu4/v7m+0bDCzC57OeZ4TX3qWGm0zmV63qETi+OLdZ7NG3G8mGJn6UP
         s8i3Dd7dVEncpz+rFfNg0n/dITSivBqNlDIfmLdO4khNnglrNiKmOSYqzlUa7TF3QibD
         Uu9YUAX8yvKKn35cGk9nMmueV1DMRS5a7wdQti4ux4xUaKljX8JKBNqexUSvogQSFumR
         OpPw==
X-Forwarded-Encrypted: i=1; AJvYcCWb5VROtaFp0nH4DP+UELrnZ+YkFEY5p9euRDWkvsf0BwWa1KcjgJ50jx0h3CPJcwMm8iKMlS+5t2G53FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK9s2BUYQuVRgUlkoqiokwqM+CMYUDGu1YlurrsucKnxpsivcA
	XPcLFrIN6y7BPI7qs79gm10rROtddq+dPkBDXEuxVBkHzw52smbNW9ZVFdkd4ooVi/R4NrS0apO
	OQ7tkddw=
X-Gm-Gg: ASbGncvWvAJMRi0X6chnwE9gVOvxoL484lvMwn/a8YUvHeAB2lhfHqnXo27Cb1vDon1
	hysCEu7OLY+s/8hu4W1p0WwWobiDPgN5m2w5OfNDwCe+dWDxy3fHM/7arxDdXVYRQP8BS0IXVVP
	ES2BHi4ZrIF2zWY1zJN2i8DaQfheYK+t7soVbBcKDwKQ2yehKedne6R+BQYUCwVj4gTB2ZRksh0
	UQR0ODPCbicGZoJff3rlntcpN6nOL5LoAnHv/JMuCQ38y3UGQ77/5BjxpHzdYY673Pl/RHj9BC9
	9quTe0xowNi78M5SF+oMSHybadUNP/pxpChKuzYOWylt3cLVgoTAXV4iKMd4Pw98/OgW5/jSgOh
	V
X-Google-Smtp-Source: AGHT+IGog0lZn2mb+loaio110SZf1ffXhS9dV9aURo+rX7+QtGK0IqscqllXCFYx7lE1EdnEFyTnfA==
X-Received: by 2002:a17:903:22cb:b0:234:11e2:f41 with SMTP id d9443c01a7336-237daf97e51mr50003565ad.6.1750439320243;
        Fri, 20 Jun 2025 10:08:40 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:ac69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83ed5f9sm22282265ad.71.2025.06.20.10.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:08:39 -0700 (PDT)
Date: Fri, 20 Jun 2025 10:08:39 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Jun 2025 10:08:37 PDT (-0700)
Subject:     Re: [PATCH] MAINTAINERS: Update Drew Fustini's email address
In-Reply-To: <20250619035457.331065-1-fustini@kernel.org>
CC: akpm@linux-foundation.org, lumag@kernel.org, carlos.bilbao@kernel.org,
  jarkko@kernel.org, akhilpo@oss.qualcomm.com, othacehe@gnu.org, linux-kernel@vger.kernel.org,
  drew@pdp7.com, fustini@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: fustini@kernel.org
Message-ID: <mhng-FDF80D17-A976-43B3-9B99-E4EDB9E2D31F@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 20:54:57 PDT (-0700), fustini@kernel.org wrote:
> Switch from personal domain to kernel.org address.
>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
> Note: Palmer told me that he'll take this through his tree.

Just did, we did the key signing and such so we were already talking 
about it.

>
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index b77cd34cf852..4c3be5a921a6 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -222,6 +222,7 @@ Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
>  Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
>  Domen Puncer <domen@coderock.org>
>  Douglas Gilbert <dougg@torque.net>
> +Drew Fustini <fustini@kernel.org> <drew@pdp7.com>
>  Ed L. Cashin <ecashin@coraid.com>
>  Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
>  Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1d245bf7b8..383dac9da517 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21377,7 +21377,7 @@ N:	spacemit
>  K:	spacemit
>
>  RISC-V THEAD SoC SUPPORT
> -M:	Drew Fustini <drew@pdp7.com>
> +M:	Drew Fustini <fustini@kernel.org>
>  M:	Guo Ren <guoren@kernel.org>
>  M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
