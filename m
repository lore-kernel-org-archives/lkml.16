Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CFA28C017;
	Wed,  7 May 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639173; cv=none; b=fjRujyk1xSFe0diNyTsdoNQ/SlllNgylwEbt/94ocgegvxXzHtcIYXUuthrrmVGJ2UPhw/MQYp6ECm2JdP7zjZU8aMsOE5nI8l/yyNcbUOud/jb2U5FUZolb2XS2ZxCy+Qqv9VWUrqEw3prXCzHverE5iowgg17ZYVsunDBjiNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639173; c=relaxed/simple;
	bh=eImAupe0WyYYvaMq+KAQ6LNTEVFa1LhXqHIbWL9QNb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI28JuU1U30Som2sq6Rfuim2ynYedq6K1Bwz5PDgh0G7YxsNODqvj/SFWkHXrjMsTY/iG/wfXc4cA1MXdRd52+sX9r7TuEvLNlOUHrdZpxgSvL3ekFgMZCjxHzitHvkj97VLV52VhkhyujxdenOnoqVQm2OWmlwK7YBr2c+eB4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFWnwBET; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFWnwBET"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af5085f7861so20392a12.3;
        Wed, 07 May 2025 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639171; x=1747243971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zENkAwahiFCyrrq8JwvOzNXl8YB0vFHaWrpbkYUjV4=;
        b=JFWnwBETHLiUzYTDRVkjPrIyTakK716ZX0pO8zCirt+vn5/8cF413SqWYXnJznGAEz
         TkUElIGPm2a2kg5Eq3bCK2V+YxMToXGLBqOX9iHt/Mt/KukeNu2eCu7cderEepg7/VtE
         /eoJHzmAgfjAppQSsTsXLqrnvEeuRAEAIowz7DWOM9fdTSg8C/8jpVOhEp9XNQ4z31YO
         Y+QXce7BfaBQpzsQZgjzE5fwe4eKaiM9Zg9IIkRj2HNMNX53oUCMs9HF4Y39+gqaegLR
         k/gkJxy0WpeYNjGNC8YEEVHQpQQt9hfcvV/UtLGWvX6aN/aCoaZ8MA4e++KQFkQ7mEuk
         C+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639171; x=1747243971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zENkAwahiFCyrrq8JwvOzNXl8YB0vFHaWrpbkYUjV4=;
        b=sUbzdBeqBYcskdEidTHfU6IrcuYdEMTAz8gBPXPSHoduy+r0FlLDmMu7VgRnICE/rC
         qEZhbxxDh7h1pB7BTb95qM9qpxtetCbN18STUsxlvvIF5qBCS08v5smBa/buhukwcnox
         fXSEMCX24708FDnTLPgu1cVu1RkwAmEv4azE41kQ8abv6dZZzv5HdHP3/t2GJk6ybMAU
         r1N5Z5MID2F01dRYCovw2IrRMu56E3keL09n/7NrUf5COL/EF8bfcFNQ807sk7zvMj/A
         UlDpB82O3prVI5sj6b+9WsSlKAfmoxiCQc8ejkLJAyTPis0ufVa2iEcjU0kvi6Dvy3sV
         jJVg==
X-Forwarded-Encrypted: i=1; AJvYcCU7fk1K/HGYCOylHSR/mZORT7Tt9olTrWTEJwWax32AVXjuM/smH5k0k/ahWy1MW1UtBekb2Fhxhk3s@vger.kernel.org, AJvYcCWv8hA6XEIOE50dDOXpmnMfbmdbBMlhS0p9ngRVA5yVgDlsHVZzHvo5ptZCHcTylVTLBcx4bQ7ZPrJLQx7k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx7gG3ix6VmSGwcX3w2VplOWhSS8E5B8dD4HriRPbAjmKXnF1b
	ZfYX74Kkgfg8NsxkR0NAkxWsXzpu14wobhdGYVKiyoj7wg9PK4A2Sa5GkRusVvALWLJ68lTxwRt
	/yNbnTinXd4sMb3/a2pnkO4kUBFU=
X-Gm-Gg: ASbGncuN2YO9B5T3Z16x164OOh2flsg8vQwjbJH6gIXWBhCl+Y8vAhQJrYog5FlmOjl
	le3SqLIyDcwU8CSIt01VeSB+yAsZ66p5VK2zFWsXBOhJYLlUq3uveKs8JkzYq4jA39We0btBDr+
	c4OLhNB+H05lpcXM5F0Za4O4eBHj10jEx0az+/tfDSUYb2T6wpulxq4VA=
X-Google-Smtp-Source: AGHT+IGWNuAYMlpvX16JWYUCVFZ1NtmJAEkFDsuE+ZGOmSYWN7OYhlpJLePrhR3AqlWRk9F31hIt71S4dQvCv+Ejdgk=
X-Received: by 2002:a17:90b:4a82:b0:2ef:19d0:2261 with SMTP id
 98e67ed59e1d1-30aac1b3322mr6523442a91.16.1746639171139; Wed, 07 May 2025
 10:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144626.1287879-1-robh@kernel.org>
In-Reply-To: <20250505144626.1287879-1-robh@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 7 May 2025 10:32:40 -0700
X-Gm-Features: ATxdqUEyEw3z9OW2Lw5ioTh8g-yhPwoS-L8WeFLQnqum0g7LR_WiDNb0IPsNDDE
Message-ID: <CAMo8Bf+TPuZs_bu=X2HfedyBe2Fq_7CLQ-Xv=S9kzb3EC15cbw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 cdns,xtensa-{mx,pic} to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:46=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the Xtensa interrupt controller bindings to DT schema. Both only
> vary by the compatible string, so combine them into 1 schema doc.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../interrupt-controller/cdns,xtensa-mx.txt   | 18 -------
>  .../interrupt-controller/cdns,xtensa-pic.txt  | 25 ----------
>  .../interrupt-controller/cdns,xtensa-pic.yaml | 50 +++++++++++++++++++
>  3 files changed, 50 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/cdns,xtensa-mx.txt
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/cdns,xtensa-pic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/cdns,xtensa-pic.yaml

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
