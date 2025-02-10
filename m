Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECBA1F76B3;
	Mon, 10 Feb 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189462; cv=none; b=NNE2AqKo9OWLBb7wKfkM9Wm6Eu6Y8sO/StInXAYg5MY6v+QOxlPt8I0o9PjWH91wR0G90VGdg6/f5EvqQUT1HmHxaDSn/8qHJwPEd/NnHv3wUk3kNLtvjHIBQXm81PC/CEoxs8OKWKxE5mMJzgEhYsE1b4YBJps8vUSS8hoo5Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189462; c=relaxed/simple;
	bh=jA/6LnCbfbgDAQHR9dJ/IqXAKKbltQxe2EtN6Sfpp+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQs1XgYDGzI6jdY3ccMaTjRe2IszfBtZt5gOdi/0JWWTYoQMFdZyeP2dpq2RUidMNND+ZrN99yvTrdhbslsPxV/oma9wLGWd+eZJuErooHkCQJcJy7dK3aRifHvE+DB/ql6WpQA2/499aHqws0XqI4h9m3N512HykM5FnTwNUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTvJT8Za; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTvJT8Za"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f7f1e1194so33043165ad.2;
        Mon, 10 Feb 2025 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739189460; x=1739794260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA/6LnCbfbgDAQHR9dJ/IqXAKKbltQxe2EtN6Sfpp+Q=;
        b=PTvJT8Za/E2TgTfZ1pesKwM9TN4lLqTIJrdfv93e9MzBxc/RqOzEG3SRlB9Th8UYO5
         Kcr+drWrFWJdCkmoSOkO+M0mlWInwhZaDn/k7xAE0oNzGxdJ/3ezNgk/DlV7KBZwr99P
         DylAw8UWtuLneMuzEJAfuESn+M33KOY9vFvMto0DdkoDlj/WyOEiDSHX3CMaXmh3iKM9
         SeBagSUqlBpb9o83rcDUdXgvOBsdA912+Hb7sVbJwT3VzOBXnu3kgQx3R7Ve1cX+8paW
         j5JhFDsd0pB3x2EWTFppwQVjr2XfyoMZ8LMHogGFFbZRzl5n3nh9YJivv/cS7w54HS5D
         fTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739189460; x=1739794260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA/6LnCbfbgDAQHR9dJ/IqXAKKbltQxe2EtN6Sfpp+Q=;
        b=Trmzs7lyWwouN+fuhrrlYjSvrpveJPvZ6bDMfcQyBda4OI2L2MQwNZsyr678e6zWLD
         Bn0MXzrd7K9artzRgNcX2RWv5o1SoDZS62qgH6EUiX17sB9OMa/85bIO20AJh/fufHEX
         KW56hq/odS+WfXjYAp1QqqkCc1iwVGyjgIAt4qsaGoRvbxvRsqgq5v2YHQm/ksV+77CW
         hNWiBXys3WHK05hdtLTuPOwCK/NNQlHrod1A5XupQylhtOOvQ0Gqi1dKANRQU3F4DyDf
         7gUs8bdAMHwht9y8MCxBhdm15TVCCBlz/p1ioe/1ZPrp0XlJDANT33hb00cmWb8kikvd
         6Riw==
X-Forwarded-Encrypted: i=1; AJvYcCVyKzmKl/Bc/Waap4oQrn3QDpc0ztWsSOif6BCxbHJsMqCh371ApAlVAHPRcJE9aEPDeDg3aKOmIHiPV41x@vger.kernel.org, AJvYcCWzU7UfV+9bvWFOw4PwK+Ef9rpXGNHaCZpbk7dNUqJd9c+oUJdo6WRJ5Dg/oERf72pfoEqqpaKzW44X8do=@vger.kernel.org, AJvYcCXacBQY8wXujo0I+j/AFA2ouIYcE+KD+O5TKIzki1SWssrCOqmqZXL94Zr2dMLH9Rh3cLWx4J7/+gj6@vger.kernel.org
X-Gm-Message-State: AOJu0YyDDsDp0b5iL9W5etlVNJ76eX4gvmpgKbQjaqbha7+p4YgAbjcS
	3GpXuxPbjTk5/PYy35+JBH+KhmlDjCZno4nqkaLmWOpcKrcCh5LhbbHuHEcmyeuO0ASi/4pMeod
	UMLzdx1FfawD08QXn4SU0cVajqGifHTFa
X-Gm-Gg: ASbGncsbdqznYtBoNPBW8ZJ0ZnQ8u4YOquwRI/o2Zq66ZtL51HcUStUFVXN5t6g7QnI
	gBvNK4l1cdm1W9JW3LOWzVQhBw+tUZh+YNrgB96llSq5zP+wLwrebbXeZToKUebtmsXkbaw==
X-Google-Smtp-Source: AGHT+IEvjrhWFzJvBsLl6xi1YtqyygIWFxtRxN32tq1kDXYWrDyozinWosbhDBBFPu5SMhjmFqi7Ptu6XscwFJGg5gk=
X-Received: by 2002:a17:903:987:b0:216:3d72:1712 with SMTP id
 d9443c01a7336-21f4e763ac0mr245249885ad.48.1739189459935; Mon, 10 Feb 2025
 04:10:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207163029.3365-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250207163029.3365-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 10 Feb 2025 14:12:28 +0200
X-Gm-Features: AWEUYZlwnIdi4-pK3IZB8j0QQqGx7k7sKf_zSbv5i7OpxcseTByf4rVDLfbpjE0
Message-ID: <CAEnQRZDStmdQ+3YfmX7jNemiLmcWA+2Ms_wnXbn9FJNWym0=8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8960: add 'port' property
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 6:31=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The wm8960 codec may be used with audio graph card and thus may require a=
n
> additional property: 'port'. Add it.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
