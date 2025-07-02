Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EBD2BE652
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484301; cv=none; b=XIJGr2WBNcAdZMULth6gVU9UP/WoyiE2ZGurkTKMhbil5e5kZ860wu1xCLJbK74XzHEwmKOoiAcrfawRkJUbukDvwp03Wkbfh4YbaSbHiOQQfTpjbPy5mSeA8ItVlMW7T/+7NVN3/b7S2hXIM9dfFCfgHna2zrcNFM/jHWNBy68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484301; c=relaxed/simple;
	bh=KK4ynMiBHY0thbjaKNOn/kUYd4MYbYdKNVAr0/lf4n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0yb8llQ252ra9L0kuv+1vz5x+6CEpXxJ0GGhAMy1ROfY0WiiuytnqK1ooVriK/F+wxtV4K7dNEwRC8Z9vSSTfp9u4C05wnOlZIDx3BtSWnmIjUdcUg1vKlncYZQUAPAao2zJZc+XBx5IUGLExp8nVkcU5SyL4BNB+PWhe2mDyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ByItZai0; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ByItZai0"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e81f311a86fso5668743276.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1751484297; x=1752089097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RisGUs6Qykk07nJw80m0Ftg7mf8erIx6Cg/HctC8ynk=;
        b=ByItZai0w8MGT3rkQg9Fse6epWc0z7aza9psyjNIslDY02rb45inRL5w27IE/oJ11f
         toscM2B9hzhUCDHK15bMnsPE/Di2s1Fnzup6bh7976ZiwfV/heNX4UwBgb9ogSoco/OL
         k8ON+PSZdN4V8YpzO6Y9Ggr/S6rKfC40f5GbvphbrqMm9Xzo20823UAr62YyCVa6TdV6
         5kiXFi6zt5BX5S4WFny3X9Qf+qxgCUBdRgJ/F/hF0BTnYamqKTtPEijdzi4/9ClftHUD
         oAJ5qjAaRWbqoSuQSZK8e4mnB9jHFs9k/8Ko8BjapzrR+Z4FqGj85d7nSwCD1SUGYz/q
         GIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751484297; x=1752089097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RisGUs6Qykk07nJw80m0Ftg7mf8erIx6Cg/HctC8ynk=;
        b=vUmVZFlV6lWaEjbc0LGn1CfQwKo/m5bisk8rNc8Z6qFU+9eykXDX8XhtjrciUY5KCn
         bwe654tdcj5tRscxxJdyqF6/ttEifszcsqpWQTmXy3hqe9qX8Ry6PomsJm7OZCjsYJy5
         n7oe1XyE1/FWZa4scw1c1XJ5wOfhfbGACDjuj4v/9czaCmMJhd4HqokAg2qrtud1hbWn
         K8NAQ0kmL3KAb8/FYKS1F0DrfH4n29SFzWj4wV70IoLilaEVi1NMyOlPcxsnbxpTjalc
         x3VyfSVmZpiq2Vkl/fxqR3RFvgwy5Qgtg3NtSCjvC4eWsmBl3qUVbipl3uqJmjPxC6VN
         +CjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB9jqUSJpjFxYpDwOMLQdaIGqjznmBzVixLJQALXYoypE8/NAucVReUxJ+aB3T2Z/l3UuPiqkz2q17h38=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEKZhDuTkstKlqMt+evEoFqcqDEMdIyaM4cl8zw3i/1fdNiY0B
	93HN2FsWlPTpcduro71RSyTXaNVpGp+IQ8obsVQO1tq/mViReSwjg1AnUKbD3+QoQoTzdqCZ250
	+xSle4FPABQT9F3Lf4GGE/qmnyWpEKCNpsr3KUH2v
X-Gm-Gg: ASbGncvnarorJjx4LdwbIiTDeIztUdP2BA/WNbF0Qw8c8/LdC9Z+gEr95M4Gmfy1aaL
	Zf3/MlFqvB9+2Ge1V+6RF/ouW1NhXUMYa3ihF1lXOSebt3+RPUe8liax5ydZaA0uvLYE/sDPAzu
	caYXXbL/o7KueAZQc72t7STWWVn/sfqy+ooidqb0zOKpE=
X-Google-Smtp-Source: AGHT+IHvhasAtxRO9RpFu2NYbRrcynF3zeEZltmoq9Luzh1btO4Igu87XYFa3nEiA/TfmY8TNO2agVgG/zRUYfJtTIM=
X-Received: by 2002:a05:690c:6486:b0:70e:185b:356d with SMTP id
 00721157ae682-7164d398834mr54967477b3.14.1751484297140; Wed, 02 Jul 2025
 12:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702055820.112190-1-zhaochenguang@kylinos.cn>
In-Reply-To: <20250702055820.112190-1-zhaochenguang@kylinos.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 2 Jul 2025 15:24:46 -0400
X-Gm-Features: Ac12FXyjMghT7240fFXsw7E25qCJfe8hMIplSYH8wjk3i5VEZLbQ2yBp0Z1HQmU
Message-ID: <CAHC9VhTg7cwXu17tHMgSJF3ZRWjA_ozZg3TK3aLJOs2X4QBJ=w@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: Fix spelling mistake
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:59=E2=80=AFAM Chenguang Zhao <zhaochenguang@kylino=
s.cn> wrote:
>
> change 'Maximium' to 'Maximum'
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  net/ipv6/calipso.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
