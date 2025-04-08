Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAFE2459CA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146460; cv=none; b=khoOpls7dLe/XIu/Cp3/nTPGHK0n73dt1YMxQpOmql+LrXo8pza02P+zx/nQcRELpyGpdvAYQhqI4kUyvJc5tHmNkRwYk8RYEs36JVs0Z59V3P2Fxu4h7jtOmOQ/PBRJYMKwYTGo8uvjPz47mqEGDHgSF2sd70ZZi+xd0eeiKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146460; c=relaxed/simple;
	bh=USohIxxv1dStzheOcbnIzldsKL2qZ2vTlgyp5m5vOnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzskjWA9mDg1RFn4pz7xWbqHf7udctjl2i2xHS55lBzfAyyPXXFJlBRNjv7AaJ+OOxF4aZ5BTzfEJOWSP5qboZV+Zjn2TGgCOwC8Kl8sW0jqFzJVzyph3RkPYwG/F4aWjpxwNH8F+cCXWsVDsimlGFnWug7vEZUz3YOcVyf4c8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JkBbTa54; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JkBbTa54"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0782d787so41291475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744146456; x=1744751256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmKQGNO17JlT5XX3kTPlf+6BMGl0Zp1Spd/vSsRvH2Q=;
        b=JkBbTa54PPS+p+N+JiSkFH/fOCe7J/Hi5GoTxTBfaDA09HOBI+zTs6DxhkFmxNXHJQ
         hMRwsdCntvb2wWKGVDdQIAWtKLpF0YzJjtOcaPXSL6GhvbUBpvZa5guw2qPJbMSxFAoN
         VRwPJvoBeMlkd5Cj/UtXrp5w2DVq4uVsuyYCznkm/NBzXFybh3mafy57qfxAuaA3PerI
         osQrZPTJqRTsfZYuj9Xfye/0gJF/a71xAGJobAZHwBJNzaUvlTVfer3UACk81RWH8TD4
         xYB2oZ93vR1J8cmg60lMcMhKe8KNwtfTd1l4/LyXmaiN2qO6uuukI9wHfT8uizxqYCBw
         NA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146456; x=1744751256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmKQGNO17JlT5XX3kTPlf+6BMGl0Zp1Spd/vSsRvH2Q=;
        b=IccJB1oC7MPLinSnSRH+dzqAFD7O0gSIsnYsRrRiN9igCYd7eDruehZmqrP9buahsI
         jpAVR0qtmQywjh7OJK5kGCga5bxRJ+9djzA04XXCWt259vcDgiQT+8uHFexMluEBUdH0
         N5qd6gotgL7LXkwJKdsBM4USU1dB7+wdafLWJyA0v7uWnBIX2QZzCXjID5Odn+kdoLpW
         bWHDiX/gr+Kv28o6K67PJjCJqH2312cd7VYgGcnqL/2Nk+ArsXfQ9f7+MelkIm8uXzqW
         LsEkGOwlHtsmnjHt69eS2c0ZPLSyIWaqwh+VVipiug713NtTu6emM9U2mDPMusHO92xy
         40gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcvEOtLU0mJ3bOHTnFvQe4eXI5NUgisJYClgp1ljtZ6vrf9N44u/Xylcx6Zs4K3ksq82tUMZZufkFhbOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7mmOMoOifKXrNLpAiWrQm/VmmCCs+Y+LbY0gA7XDnwlZ578fs
	WiCCIKq+bPhAPuPre7IJFVRdlfnXt4ZoJQYsWag9vBzEpSxwxKbuYklVoe6SE27+vkqUJTIuUDA
	ulOIcnH5TLMZdU9JnEXNkixzXsl51vzUA0PDOzg==
X-Gm-Gg: ASbGnctLsHUt17eeNRREVwCWeeZLb3yyNsyDYMsMSoFdSDK5M63v8Auzd+IRqGei+3L
	m+RVnjm9SY/Z4rjMSZKdCFCS4slAWhTAtOddKXGAXCmgUor0v9cKneGwk8XjRmoa7cNZ3OpaHLa
	U9IRXbv8wEtsQSPrjC+Yh0KEd8Sgw=
X-Google-Smtp-Source: AGHT+IFQbVv/s84Y+T1st8tT4/l6Pfqjnc7EF+pvFgIp4N2vKFFcQDYEDpKwqMKa9jDGgHo80JlGjfoxQ6bfGhLYVlc=
X-Received: by 2002:a05:600c:cc4:b0:43d:82c:2b23 with SMTP id
 5b1f17b1804b1-43f1ed33369mr4294535e9.23.1744146456118; Tue, 08 Apr 2025
 14:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250405054848.3773471-1-mliang@purestorage.com>
In-Reply-To: <20250405054848.3773471-1-mliang@purestorage.com>
From: Randy Jennings <randyj@purestorage.com>
Date: Tue, 8 Apr 2025 14:07:24 -0700
X-Gm-Features: ATxdqUFFtjYbMoveKboHE089vHuNzkw5X7zdoXj_S3_G1loNm5Y_nWMwyRt_KL0
Message-ID: <CAPpK+O3_3KLxA6QuLSu7QbBwAt9jLBKmihbqQUYfmJwNzNGQ1g@mail.gmail.com>
Subject: Re: [PATCH] nvme-tcp: wait socket wmem to drain in queue stop
To: Michael Liang <mliang@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Mohamed Khalfella <mkhalfella@purestorage.com>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 10:49=E2=80=AFPM Michael Liang <mliang@purestorage.c=
om> wrote:
>
> This patch addresses a data corruption issue observed in nvme-tcp during
> testing.
>
> Issue description:
> In an NVMe native multipath setup, when an I/O timeout occurs, all inflig=
ht
> I/Os are canceled almost immediately after the kernel socket is shut down=
.
> These canceled I/Os are reported as host path errors, triggering a failov=
er
> that succeeds on a different path.
>
> However, at this point, the original I/O may still be outstanding in the
> host's network transmission path (e.g., the NIC=E2=80=99s TX queue). From=
 the
> user-space app's perspective, the buffer associated with the I/O is consi=
dered
> completed since they're acked on the different path and may be reused for=
 new
> I/O requests.
>
> Because nvme-tcp enables zero-copy by default in the transmission path,
> this can lead to corrupted data being sent to the original target, ultima=
tely
> causing data corruption.
>
> We can reproduce this data corruption by injecting delay on one path and
> triggering i/o timeout.
>
> To prevent this issue, this change ensures that all inflight transmission=
s are
> fully completed from host's perspective before returning from queue stop.
> This aligns with the behavior of queue stopping in other NVMe fabric tran=
sports.
>
> Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Randy Jennings <randyj@purestorage.com>
> Signed-off-by: Michael Liang <mliang@purestorage.com>

Through additional testing, we have recreated the corruption with this
patch.  We had a previous iteration of the patch that ran some time
without the corruption, and we convinced ourselves internally that a
portion of that version should not be needed.  So, unfortunately, it
looks like this patch is not sufficient to prevent the data
corruption.  We do believe the issue is still with the zero-copy and
too-quick retransmission (our tests showed that data that was only in
the buffer while userspace controlled the buffer was transmitted on
the wire), but we are still investigating.

Sincerely,
Randy Jennings
