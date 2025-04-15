Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B42186294
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727978; cv=none; b=o+QeAgawmpr5Y131Ck2qNQPh09VGuQ7mu1B8NJ0CDJacFgkrvRMIjmpP5GKIQzUyQE3D29hZdDCPYtxB6IvqOFjmi69bg3QYbHbhfvvk752P2xdnwzuUO+1rnKtXTxPOIENS+ZcDjYiUimZUfqFJiMMiaaFpr9dCqwq6jDbmQJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727978; c=relaxed/simple;
	bh=4Qo7/jYjUQTUB3RkM/YYt62qbjbgAkpEpQ1sQPCKRJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxg5SK59vuQU2B7hGaaB1MN/haP4mEKYKdmXTbjKFgA3GzubsPKkCuLuB1KUEWAmZvq49/uY4iVUoxuZBV+4VBqZBLhbYHu08lHkOWKT549RMaJ949lPPFJ5eRYfCJeD1QSep40REhRHLJzpipVgkTjZX0GMxr2rHYHRN/fdWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=A40o0yAE; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="A40o0yAE"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af50aa04e07so505943a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744727975; x=1745332775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Qo7/jYjUQTUB3RkM/YYt62qbjbgAkpEpQ1sQPCKRJw=;
        b=A40o0yAEtsQTMg8wkuRvGjIHvPb6zUxauOnI10Whz0IEdV0K2PRSCcfOTyGmgzGxS4
         NXyhTo0Nzofl1HMxFRoyih/0KZDO1lrclwDzAo6yvnf9TqxLy7UKZoaqeSYwH6mh59su
         863cmsyl2DqI+KNs2WakNMI5rFRQ677phwu+SrdDLhzUTb/q8jY5kUTUbCEe0GN1shq/
         L0bEcpZiJbEnifzahg/beypU+rKOk1Vpghm3fMBmSr7dreteY6xaqHpcbwM1hjRe9cLV
         Q3U/csezVAmC3IYMik3tqcCw85Lu5CzwoAO/KgKIbU3QWFwUtmeT4Q2JSRXe7J05Zn7N
         Zebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727975; x=1745332775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Qo7/jYjUQTUB3RkM/YYt62qbjbgAkpEpQ1sQPCKRJw=;
        b=m74vh0ufKCheauAA7oMo3KXXDI6EgI0GAkIPIRFX5qX13Aw1qVeKETP1jI5hiQW5W0
         x0D9Gz52lmY7EkLB3wlccKXFvgi7Dk9SEcQVnWj8qebZGC2o+adx+S+XjrHw3+Zm/8Ka
         dAO4FXBcPsKlp2o+wHCy51SJQ1a6lQzxR6ITVZc2uLXm+i47irHvpF5cqHvCpWBpn27M
         pJ0Y2BjMDh4TqpOXlA7qNNIty2a1OikCOeXJdMln/goWI1CvHQAnYMOlw/blWI0jljpv
         4MSbDSl0AAkXJVmbKqAaKsNQNQa9BHEMF/7AeP54Co1YojUgUowg1bIWGgCZGVIbdlB+
         AWeA==
X-Forwarded-Encrypted: i=1; AJvYcCVasxN7XjEyNw4o/q+drUY1rYlz6BUbDCNWojijuikj+QGt0kegRCx9fOOBBCN1U1h3rtPeyECYzKCfUGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24M+2USKsru4IJfnVwN3lcCfeV3fFsKGh9lc3JdG5FalRslqT
	C2OW5vMeiovvyTO8twwcGrpWD5yTaqieCalP0GVt8ySsMPAINvIdi9sTNo+j+CTtycdsx/jFP/+
	f2CdW++nMb9odkDYpx4j/tINq34YZQzSIjYi7mQ==
X-Gm-Gg: ASbGncusURJg8V9lGt7fOqJAgWamm1SynBtA4F2dSYEy/R3PgS7u31JPcZst7MAVL3y
	tzwU0xND0AzziA8ZFVzNgqjXVzjKlO+l6JuEpeLs1oO/Z1yoQO9qStWE7SIpYVy4dZPKnsyYz4L
	BPHRgKVdtlBFCWu9GAQe1Ej0jh4MftJ4A=
X-Google-Smtp-Source: AGHT+IEZoFL7sOJJPnQMtyVfw1ECc8U3oRsk84i0RjIRWr7Q/XBZMJwA4kqwVjp/zN/LS1cp4wcTev7INFBTPH3wUeI=
X-Received: by 2002:a17:90a:d886:b0:308:2a7b:547b with SMTP id
 98e67ed59e1d1-3082a7b5563mr8462884a91.1.1744727974742; Tue, 15 Apr 2025
 07:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415003551.22949-1-kevinpaul468@gmail.com>
In-Reply-To: <20250415003551.22949-1-kevinpaul468@gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 15 Apr 2025 07:39:22 -0700
X-Gm-Features: ATxdqUG0GG5wFLRB1204WyA_VVJCOTVIXgifzHeujaVr1tmHeWxIG-001PIfu5M
Message-ID: <CADUfDZqcniNgTUC0v0R450LrL=oMW+-6fh8cgaOXe1K=V1t3+g@mail.gmail.com>
Subject: Re: [PATCH] nvme: Removing deprecated strncpy()
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:37=E2=80=AFPM Kevin Paul Reddy Janagari
<kevinpaul468@gmail.com> wrote:
>
> This patch suggests the replacement of strncpy with strscpy
> as per Documentation/process/deprecated.
> The strncpy() fails to guarantee NULL termination,
> The function adds zero pads which isn't really convenient for short strin=
gs
> as it may cause performance issues.
>
> strscpy() is a preferred replacement because
> it overcomes the limitations of strncpy mentioned above.

This patch was posted to the mailing list earlier:
https://lists.infradead.org/pipermail/linux-nvme/2025-April/055004.html

Best,
Caleb
