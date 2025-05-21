Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94586DDD2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747858768; cv=none; b=QjN6h005PE7dxHzqFqpj0wuYVSBsN2QQB8Ml+CTVkXWOo8jjlfzcRU9n8vdKH9cM5wFhHcjxKmlR4G3ShRA7dGhgd+V/Itb6KG1/hJ+Fvmeck3+xfqNtmslO9AuY6rn851c5CACHFfnc8xWtJbvq6y0LFDOioqPUWSHxT6DCsIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747858768; c=relaxed/simple;
	bh=M19M230TFlt4DvnhBidnNVu1WXHQfjiIcPnvdlCOUSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjLsnAMKBWanwSJrVtSoIygCRMnTfNPFW5DukrxB+2DnD8Xys31nYmB7Q6+pF5lj7q0naVPzN0SvVs/wtMwGCniYt3AxQtWmJSxyyFQYqRiw6MDVGIyxGpHb66EyDU+KUWOaiGq/RZHKV7fLlMlL4Idr/kTHcBjHVVeqcl8eKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Ea78dVTW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Ea78dVTW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601ab204085so7516204a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747858765; x=1748463565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M19M230TFlt4DvnhBidnNVu1WXHQfjiIcPnvdlCOUSs=;
        b=Ea78dVTWsU6hwvMZcw3wFuURdifyPBATkswhGwuvDSO15oWFK+pS2955YqKmwb9/sa
         UY8U0gi2w0p5v5nwFFMMHfsdnQYVnHyYJpark6KOGkCecTzFY0QFdrzLD7tUjBNHwNIK
         s2ImjVy8n55+oluJd6srMa/qBO6lx2rTLtZcSGTf7LaDLRf3c1EG4iXMf1frnvw/bYwD
         ajW31WFGjz7Dj5MfASA0QZflr7Ehdu/U3Pe8R6UgVE5E2A0obX1Rj7SQaduTxPye37qf
         nHiEtK35GJHENMfJ+UHitTbROSf9iqm9dJ9KxdyPE1nBbbLPmjXMCV9wuHTKNrSMNTmf
         Iplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747858765; x=1748463565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M19M230TFlt4DvnhBidnNVu1WXHQfjiIcPnvdlCOUSs=;
        b=Woe5RjIOyeo38shpMWSVzrtnPQr4B8my3UReo6IHtOfv0KpwiJyKAZP4uba9AqE752
         x+orBhcNqfv7AaB3lebv8K6/It1/GJwqc8WRqjh0cH1guq/s1iezGe9UI8McKYZUcpx7
         Eh7klWtDLMflf1G5hjH36vUObc1gklvQXR74FNZKB8SsGKdWpvojgx4DUR0cEkheBKB+
         Dpl9Vxm6Wu0CdRc1v5EQRcOvjrK5A8fW31+h1++uPvxOiqv8fNIAXI+F/FZhu4OnlNbn
         6nG7jEKw6oaC1YFPvTVWYomuVyPkhS6wERcYAORRFtWLkC63wHAoiv9GNh5H18xGX59g
         ILoA==
X-Forwarded-Encrypted: i=1; AJvYcCV29wFl60KK9NbN7uIIpqIl2UgrDhBAHt357A0/aYq1rJFNlu8JF9Ioq2NJpxxLaukSp/VbpascrxjIfwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOQ6USGklNBTrJB/A0V9i/OjaKV/TpepIPyvNJ797TT9hmPBA
	2084QHzUGdvKvwr6OJQqEp8ah5RdoxNWnMztqExlNvUMVBrqhsS9lCveVzEE81R4zAz0dygwwlD
	hyLzPvHvq8tpinHYkSMBgJHZF0+mmg1XKrvm6YEsYPA==
X-Gm-Gg: ASbGncvAwJoSCleN6+3FjFVthXekntSLPqSBcVMPPkU03w92hQ8UnVbTITuYqt2B84H
	3LLSKSdIvejwVKeNeiZjclHrpBlKfW1E2aIcNYjF0fJExwF/OF+XKXhnBlnSNLqeKFy2i23Dqzx
	6l+b7E2+TOjrD2G9m5En86MfBP++hCqavKXLKT4mlOnokTlYfeBxKouYBbi72S/g==
X-Google-Smtp-Source: AGHT+IFES+Uw/4IkmBvFNIwKxHyHNqcbdDrbZ7cdZydgGpn49/fAVs+dGNE9523zoXkv7jwVNNvVTsANRAf8OBGfeWI=
X-Received: by 2002:a17:906:c403:b0:ad5:3199:e5e4 with SMTP id
 a640c23a62f3a-ad53199e7e9mr1658559466b.3.1747858764859; Wed, 21 May 2025
 13:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506164017.249149-1-max.kellermann@ionos.com>
 <2025050600-economist-display-2d25@gregkh> <CAKPOu+8c4Z_Biie3R6LP3pz6u-bpzBZjfoWv4XAQ5AreziDccg@mail.gmail.com>
 <2025052100-depravity-founder-6332@gregkh> <aC386_UJaBxf5WTE@slm.duckdns.org>
In-Reply-To: <aC386_UJaBxf5WTE@slm.duckdns.org>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 21 May 2025 22:19:13 +0200
X-Gm-Features: AX0GCFs5lgQSFBgQhfwMO7ef4O99CWbOI2Z8yypES3XQaWyFlu-wPDkTO9Oua5o
Message-ID: <CAKPOu+9cPJ_BCctyTEOgS7ghtiL4CV3EANuEZOtsX48XQqWBLA@mail.gmail.com>
Subject: Re: [PATCH] fs/kernfs: implement STATX_BTIME
To: Tejun Heo <tj@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 6:18=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
> Isn't this trivially trackable from userspace with udev?

udev doesn't track the birth time of arbitrary cgroups, and I wouldn't
call udev "trivial". How many lines of C code would you need to talk
to udev to find something out and how many CPU cycles does that take?
One statx() is trivial and cheap, and the btime field is exactly meant
for this. It's the dedicated API for exactly this. (I'm going to use
it, even if the rest of the world doesn't.)
