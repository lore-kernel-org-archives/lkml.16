Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9628C8C1F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 21:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743976537; cv=none; b=XxDsuAmV7pFVIWwPMz5jMU2Yzfgsvaj0BBQrkbmNKh7IGZT7CV6H0OVHXKwxO1ffJcHZOSnWU1UDvI/1NZ7kefFqgWZClYcLEIc9r1Wcut3MXfuqL09eM+Wyn9DKvKEj4XACfSDbDr6I6q9sE8634Lj+fwVP8IpB+o1Ntt85+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743976537; c=relaxed/simple;
	bh=g6pYceACoECe+Rhww/YIKfEe2jPzOt3S5mrtvjs+GLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcQ7BbdT+9pMa3kFgEOOP0a6AWa45lz82qUyKf7+u61AvNQD9WM92hVjvyxruUnFm49lVK0pv0foi7H5RctOgckMd8RJBsAx2OoYmK8qUMwcEaz77UIN0wA+7e/AU6ieuEprzJJqElNntGkA3rJsiOZSoVKIBRYxfy7D8+WKzT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsEizv1X; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsEizv1X"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-525b44b7720so1642414e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743976534; x=1744581334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6pYceACoECe+Rhww/YIKfEe2jPzOt3S5mrtvjs+GLw=;
        b=NsEizv1Xiic6KY9ytjzkoPxePDv+YKq6cae7+6YlDfMx/tSnCaJurLvd6xjx3JeHp9
         iMwk3CezmAdEdeWuC9wV/buhheFtzomLNYTB9uIgtvlNKfspD3PnEEnJcxs5J7flNP7k
         Ex89dWCYLT6YYjNLKexPOwNN2RJrKLtOcfMJuXSPbAuJuxudTkEb1/NgBgzlWOun9euK
         D9tyOlIEJNCvhKFyL6nWx1XfdHiHJZwi6vyZfRtr9LqX2/C+36bdStjkKvNK3NZQx9S2
         hSURCShjbN0iWnmh3YcKXJVmPx/3W83Zo5qMbcl97e25gA02uin61oyVWqON8cPOSmoi
         DfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743976534; x=1744581334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6pYceACoECe+Rhww/YIKfEe2jPzOt3S5mrtvjs+GLw=;
        b=xUfJxy7JNs4kb8cT1gWn2/faANtrDnzERteBmHz7LXP3MQRjkGo+g6pjQPq1CoT7Gt
         ayU2DwK/1/OXXNuI5m1CQf4uxolU/7VZdNsjaksWKn8G4OLNtOKzyCGVP9ryn8T0N9Z8
         F2vOdoKM0zT+A3z6lb40yi5KGfOfbhQvM6Vy7Tv3ynT8i8ZIh6m6u8PyBJ1eOsyFgeh/
         lKaRmzSO5zOpLSB/O1vM4p3IoF3pPX/+FOuiNTWT9In2G/NWrnDAaNbwdEDOtbhBakqN
         PEe9j28NhV1PtXqzTHRMGNOa87fCeCzccDmYNS2PQO8VRIAaOAUflwFin7Y9QfKKvAEa
         MWpA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Kvp435J9u74twxaUpQEEhrphl+vE1pipAdgk2gL7gq2iYxmyCkdqfvSHYoiAlWS6SFpws1h11GoOlgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywqktudEuFCG4hMFToLdhXPuh5pBipYW111DY3fSYzYfayanHX
	ZUWKZMMs6Idl4BU+EBUr8moJp7ASJj++DCuOKDlXE9DdcrXfTi4v/xFw5OlayWY53qd7CCn9YoP
	pzKJHmoAd8tKbI+02TnkP5Zb665I=
X-Gm-Gg: ASbGnct1a8X43NJTwnNEKBeFsQ5rIBwJfmxLNRDn2l2sj04nY2y5fFnYAOTCCRzqmAU
	jvjvtPdZVbvE8aUZXTmiPh8ASeVcZpKvq4npd5vQ6ZIQyGcv5pUjhSusC1Ve2K/E0F2iQJHeGTa
	SipNCXLnbFFHcFtnx+z2LmEGBH2EU=
X-Google-Smtp-Source: AGHT+IEt6764hA/Jd5CwgHqItb0CGB/8b/dQXtSSNDXlu2Lw2GtsrjMFepc4xWyzsjCSncnPV6m74bNb8JI24lFwZ1c=
X-Received: by 2002:a05:6122:8c01:b0:523:7316:7f31 with SMTP id
 71dfb90a1353d-52764494388mr8013512e0c.5.1743976534439; Sun, 06 Apr 2025
 14:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/Bro47isE8zhcu7@ubuntu> <20250405101318.3fce2dd5@pumpkin>
In-Reply-To: <20250405101318.3fce2dd5@pumpkin>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sun, 6 Apr 2025 22:55:25 +0100
X-Gm-Features: ATxdqUHmBJavuVTAsCOOoR4pbO5-Fac5DY2pAqOykH_Cgbax6-OmWNhMoXL3Aps
Message-ID: <CADYq+faLiL5f+HBxuZoKJLLc90wM0YRRbuhYwo+Or2w6O6SMEQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: David Laight <david.laight.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 10:13=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 4 Apr 2025 23:33:16 +0000
> Abraham Samuel Adekunle <abrahamadekunle50@gmail.com> wrote:
>
> > Replace the bitwise AND operator `&` with a modulo
> > operator `%` and decimal number to make the upper limit visible
> > and clear what the semantic of it is.
>
> Use 4096u to make absolutely certain an unsigned module is used.

Hello David,
Thank you very much for this suggestion.

Adekunle.
