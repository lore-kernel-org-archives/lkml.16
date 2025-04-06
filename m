Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898F19C546;
	Sun,  6 Apr 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743935287; cv=none; b=lyJi3JGXeM4qD1SDcud1Jr1AM5DVCUofYBl13+BVy8OsBueyVQD5oyQgq1NeBd9mgig13uYtU2Vlnti9QxdzEXlgbfSEAsQ+90B222rv8+TPEgZCyGaGvvzquYd8R6FefYo1vGoNDS25qNELloE5n8M49hJfVFj9FC2joqvSwM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743935287; c=relaxed/simple;
	bh=Ds/EHRcbW1fQ9vSrhDuOvsxpy35gSYew1q56WWGx1J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eljbB7xDMx5hfqcgxFUWgALCqUo4w5y1CQb/oW8BNB2FkGIDI0XxVjUVSNk5/XQtJb69O5tjdrces7YIXFsQPCXVYFYnnkEnWgmUu1aOTmCqEGnX0Q7lsbfqJ+hNPz5AK0sAPMtcRy3PQIfzwFjQzrRFaMNDpdjbZwyA01h6inU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQCW5BLI; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQCW5BLI"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso677816a91.3;
        Sun, 06 Apr 2025 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743935285; x=1744540085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmqSW6TwffvBILaVrMbvieozlgt4lB+aem/Hd3IBsbE=;
        b=QQCW5BLIMcGNjhWMT5N+cW/g/DUkPN2FUH7KM/AbNe8cEaRPQ7JpTZIYGPjqv51lKe
         TT7sDsP/KDsBLzFzVwNHqC37yCzM8pvAeWQmqDXnVT8ZHMYv8kFoqWcMbQPqFtjz5May
         JL97aKNDzF1EOqYfiyCJsU+WMKOwHB3haX8Qh6V+DsDjCQfG8UrSj0WYyUVHqD54CJtE
         B9wukJtDsNQvTPdnem94+0ru954T3IZ0rgLjW1NjIH47tCuX4/upWt3mBm70NBUPisXl
         c4uKK5Teak2i8xU476xU75rpKgWgDArVO1LOyZvL8LTEs7wOqOOC0daSmLCtdUmRLhL1
         C0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743935285; x=1744540085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmqSW6TwffvBILaVrMbvieozlgt4lB+aem/Hd3IBsbE=;
        b=KYqkYseDCba+4UKR3fybZahfMs5IP8OzC4GR/EbLXXGF0cEYBLqGqX/xBwvAuYw4qo
         5uE6akItdN/alJPbS1lpI+xWkWfJbeX/KjKRd755OXZUfj4r/BYxu9N807EXBaiRFooE
         k+MdcBXLjUTdXgSvcfz4161PlTrp4zOuQKeK/r9SFvyll6XoO61ygumUkYW3bVOnq2Fn
         7A3qaM4zq39biqJ/vn18Qa67L68L5gF+ZVSvP2har51TH+aV/p7Wo8hh5s6VKtS7wlqq
         /3Pu8gvib4fcaC2oohvIHJkIe2jDmRjAoFwEd5U+Le2b4u0VAAb6qpMiy+v/SHE9Mlxl
         yGVA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ow1l2KqcQYz5l+W7py5gIXhLnP42UwUJlANwy54U6tL1IIpuvzZKyXiQt6kxRy2i/mpHtmi5AOF9/m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcscIsibjfKgrXUAa5+wqto3g2oj7Rf9gj1pMue38wzqnnX67N
	EpsT1FGavDGf8iVUExvU99kpmj5vPNIJ6eJA3ROzssOBxHTKlLAVf60mphkalJBRrGGmEgPtccW
	uUOdYd8QjbaiFKcYnnQ2HsQbomnQ=
X-Gm-Gg: ASbGnctpqHsbkGxVZB+QmEGQHQiODYtYsckUUrmK1qqSn5GWxLmA9E4Se/5TQxaoyo4
	T0eUj44kX/aznWvtxzdkyjDpGuJu1bcXVDNlZKJ1M340s2FgunB3ejjxcfV92/Io6taJS/SAaVB
	aLaIBra5rfb1SdMEIATrcL47huLg==
X-Google-Smtp-Source: AGHT+IF7ARgNsZLghgpskglcRUiIaATRek2ORxtV326eeTWm9504H44zRqMPRhASvAbQow72w3FmMazxy4a+WSK1Z3I=
X-Received: by 2002:a17:90b:534c:b0:306:b593:4551 with SMTP id
 98e67ed59e1d1-306b593465fmr1876804a91.6.1743935285091; Sun, 06 Apr 2025
 03:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
In-Reply-To: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 12:27:53 +0200
X-Gm-Features: ATxdqUFUStzc7fYH5Ev4BuWuM2EroFK-dCYOU1KuZ67NUjxNEQCNC6LnJK4UDrg
Message-ID: <CANiq72m55Fi-XyFz=h7_3QNj+mA0N+E9Vo2_anLFyN1sr-FXMA@mail.gmail.com>
Subject: Re: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
To: Xizhe Yin <xizheyin@smail.nju.edu.cn>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 5:51=E2=80=AFAM Xizhe Yin <xizheyin@smail.nju.edu.cn=
> wrote:
>
> From: xizheyin <xizheyin@smail.nju.edu.cn>

This should ideally match your Signed-off-by.

> Some comments in Rust files use raw URLs (http://example.com) rather
> than Markdown autolinks [text](URL). This inconsistency makes the
> documentation less uniform and harder to maintain.
>
> This patch converts all remaining raw URLs in Rust code comments to use
> the Markdown autolink format, maintaining consistency with the rest of
> the codebase which already uses this style.
>
> Link: Rust-for-Linux#1153
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

I am really a newbie on the Markdown spec, but as far as I can tell,
Markdown autolinks are the `<...>` ones:

    https://spec.commonmark.org/0.31.2/#autolinks

So what I was trying to suggest adding a few missing `<>` to a few raw
URLs we have.

By the way, the "Link" should be a full URL to the issue here :)

Thanks  for the patch!

Cheers,
Miguel
