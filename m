Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6894426B955;
	Wed,  9 Apr 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210087; cv=none; b=IxYYZIJ0JZ7mtaH1rpT6Pd/e7y6/mV1k1eLlP+dCsnFvzIdkwSqSBYUJB6cbEXQ7iGnYNqYcqsCzlDUuhRI2yn+8W5czxkB8j+Et7Gs39oEpF8zuLDHyTUcj6GkrnAiduh/uk7B7R3yG5wnTKT+hIwrhT6NDyQwje3OV/pUKolM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210087; c=relaxed/simple;
	bh=t+sfbVV4SiI1C5sy+DzovZKb19HUWpMy4SsLijVQ49c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFkTtoGg442mM0sdyeZENiVbXWMNfcDFo/Tnnhs4sbnYX5KChum3Q5ZsXtg+v5oxy7ZCeccBzR8PYXHEEzrolVGwtN8cVQbC8PrB6EI2ptYKCsLaz9xS8x5i5T+iXwn+OjtLvJ6rX8XswsWELZZ2d6fLzz3LrIuE9vmakr59jd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cciwX0UF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cciwX0UF"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af9b16eca8eso518950a12.1;
        Wed, 09 Apr 2025 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744210086; x=1744814886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+sfbVV4SiI1C5sy+DzovZKb19HUWpMy4SsLijVQ49c=;
        b=cciwX0UFJGTqX3vXA9nesJlMBhMI470VasEMnE2vjaMK32Wl9IjmMaC/XANqJbAQJh
         Rn1x4DX0pt5VHoiZo7b7Riuitqn2jdHgUu8E2/R6qUeaIxUiNYVvoQ60hxsJod7Ir8zt
         z6NUSiTn4zOUcZqphwaUr6dUCHriRGrX/swMCFODXmrKCwcjDFcwcEfj7XcMfI76GRhE
         SkrVBoF1BcSsb4k3Jg8KehxXwYRknr33k/pqerSAQSSAaGqOhJoODhLWKmBVMsT6XiZ2
         Hxu24qZhjhbzoQ60jhN0B2kGm38X1exvmFUa9d9Upguc9gSNzI3Nok2DnoI3najAdwEs
         CkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210086; x=1744814886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+sfbVV4SiI1C5sy+DzovZKb19HUWpMy4SsLijVQ49c=;
        b=nFyn3pQDwIFRUFy2sWP5aYW8i3jqlXaYRAip+seyNtstk2OsA/FKLB3emFjCjPgpuL
         GZNBK8ziVGN2/P83Jkq43ufH2z4L4xgN8+5QpN9RxCzyNpMAoyLytmOXhYCQ9Li41m4S
         ndogGCfHkpQlW4fACNhc0sL89nizfC0vC2jPnDS+jDUnQFmA8ICn4WNEQS9740TIIkH6
         YM+ys2w3kJZXdhXb6LX+fg4jcCDea5PtfXlobxyVbNwDk4qdBTu9aDBQJhsBNpaFrQdK
         XgESmm0rKC2zII4oi5FeiALqqLj3nhn4wyPAXce9o2gW1/DQh8S3bByDfqcUCEa3oTPC
         6koQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJy5yNS3ie9veFhwrKzjj9e5BcqEKDotBCS4adG1adut56WHEWzq/fjDIZGVuw3RN0uEbth+ZrO+EPaKpD9Sg=@vger.kernel.org, AJvYcCXeCUSVbwoCHl8nsqFJMLy1PrTUrOQIHOeb+b3csLwNPa4cE/I+j7auY7Q41hdSl2NAheaBvKZO3IDdt9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMFkHDjb3YH8so/Ti+VymbpnxJPetgGWoExeuDQDck1ElX5ndb
	6TM9Xn6NO7Egd2O1G4LQ4/oOiBzYskGmzqbGs/QEvLbZsiZ0yeE6kNzBcpgYusKkat8AhoMsZPj
	33XmsSLfeH3ZmsVOFMg90ELj50a4=
X-Gm-Gg: ASbGncvmeedRi5P/TyCsnGIyMWOZ+bfL5Yel7T90NLQy1TTqr5Tn0gx1PKe7wP30+Fi
	tod5Rih6yA/DJvBdMQAluNTQ3iGERbqWC8mgbylwEgr07JFHMk7fDf49L5Om9yacsYFmVStaOmj
	WqFu203ympFQrJdOIqe9bXaGoEzBYEFRcA
X-Google-Smtp-Source: AGHT+IFu3m+E2XPPJm9CpPYU0T8chUkLDG5jm5xrgDt4moQJnQIHZ/KUoOKRsStmjsw1fnexQET8vOP2opD9TB+qELU=
X-Received: by 2002:a17:902:db0d:b0:224:10a2:cad1 with SMTP id
 d9443c01a7336-22ac3f13978mr17062085ad.10.1744210085546; Wed, 09 Apr 2025
 07:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409061129.136788-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250409061129.136788-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 16:47:52 +0200
X-Gm-Features: ATxdqUFqVu5MaC3L7mL4r0bbWRkrPzcLXrBDchUoh9IuHJeyx16OliIVVo32LbY
Message-ID: <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, 
	Stephen Bates <sbates@raithlin.com>, Danilo Krummrich <dakr@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 8:16=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Align iounmap() signature with other architectures.

Most indeed have `volatile`, but nios2 and m68k don't -- Cc'ing them
just in case.

Cc'ing also the original authors of both sides too.

Thanks!

Cheers,
Miguel
