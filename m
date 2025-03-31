Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F31D63C5;
	Mon, 31 Mar 2025 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409604; cv=none; b=bYyBBjLGBadFRMlibBbrJGzLteu9i3VoEi8/ZwPAushCf5hU6fNDV3EmqSmaf9c+eVzruhWTABLpO+4TW8gRuI8fk6CwtMVE3tDLxNxukAV+kR5m16Cpls8TdLpA1wBSrmhuHKvwOBpqZ+BOYI2m6BVKhbh3R0u48m3gFxOnhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409604; c=relaxed/simple;
	bh=Gli8/+KAP7ljAfApXsMxWK7njtvd3QaXVrxWApvVuno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDPbrhrm0vNd7ACabOEmw1F5S+xDBxdOOFenF6nFusUo0Dy/2tO0HmpsDk+cv8eohR0lukFKdayQJakscFQ6FW6c4wH5Pb0pnbYgoknVTol7bhl1sqSZILQNPtQ2fNfeMXURbdx8y/ocXlKvIED2BaEtGvMdjuTdM/XmDmJKwoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV2GadRZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV2GadRZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227c7e4d5feso9656445ad.2;
        Mon, 31 Mar 2025 01:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743409602; x=1744014402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wjaq6YU8TJxGGHWiFNcZUv7EhE4e/0xF8m/zbdvM7w=;
        b=YV2GadRZr9beybh3b2WMBXs3xH1QFJZPIWaNkrtIPffRjoQ0iIAFzirH3eiU1YAJ2U
         B0rXPVfXxwNZc9D4U8IiYdAJaa77mmYh/LLo01dn5MUbVt9RfAApfH5hcEClKr2F98G0
         XU6EeTDhmWai3x8ED6CWqYvXbpv9OVLoYnJxx2ldtPHLNK+UpQ6uHCwbVwJkdxTnfVWg
         pYzBZfOH4peDZDBxIEIsiZPa54TtRVBmVscbE20iFMpGPOBvLml8j6Vjr754rySRADMF
         V8KGJdJ7M3uCV9h/01AOvf96o6Sx14GQERULketcb3luy0NX70ByTiBwrM2JKLR3Kzg+
         CbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409602; x=1744014402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wjaq6YU8TJxGGHWiFNcZUv7EhE4e/0xF8m/zbdvM7w=;
        b=iwA22nnI6XL5iWnbZ1/Xlj+sy5EHLL569/anS5C3qn9TtpAS047LAgu6fWd3vxZeLi
         tfZ+sWs9X7ShAFHnUsqHMYA798ch1ZmYa44i5EBrZN9AmJrjwJAdy3E1K6KXndk6GPoj
         L+zWPDlMJI4/MBwXcSrBwO+fgu0QH6AR2xlxt0DXKfTuqcTSFQ7Al3N0Tj5F/UTv5FQp
         1WFmY8wh4A9CzvCVCuKpzZumgfTO+W/NwWoRrN+mMCZADHwGL9Ma2NChby/KGLpzHOjh
         JO9mUtUEyVO8H2KJf497zcatO2smaIAoGfh7KibPXIfDHHuSLcn9kLgziEcOQ4Ur2TlI
         j4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7YTCvQkCfOs3bPdTYVHLZnNpbMV2qTliFOLCLTbqUHHHueincPZBSIeMjVfeUrJIFCJ2HAjqA6RTuYig=@vger.kernel.org, AJvYcCV/gOSypPX3pgJ8tEecCKs6BdaQEPR8ncf45pGcagbZYZ+oUhr5B6k4dtc4mwMPeS5WpfeCiV1hgAY8ZVo5N/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyObeTNb0yQoIJggDXF0I0Zi5CZr0tUbQeRYN+pBteilXxtsfsb
	P13WS5o8UuC+6fC8YGuKkZtC3aZO0zUxJi/Gxyk8+MyR66A3pgoVJJj1CYgsgs6+NyAgPYnf0ln
	DjCkkWAfDyyj1VZyZhLj6UbhqRuc=
X-Gm-Gg: ASbGncvuKQZIxqFd146Xae+Rn6yA90uTQ7EeXiRLw7/WMVx1Sz7S2sZ2TDIdACtWtFK
	eIu0w2iFe/myOuH7ubjBrJ+/etHWmb85S4SuX0c3T7hMT6/GIj6/a975CAzW8MuXhDxpGF8Djua
	jheOU3LZqBh1b1xec2WcQopO2avY36G+0/E7uP
X-Google-Smtp-Source: AGHT+IFtlIuZ+OqPSiiZ1JxrxVGa5UQlhTzonLvYdk/RCEHvevDAudDnewIXxfujrlr8+KMDjWbR2BMhH8RhkH8xY5g=
X-Received: by 2002:a17:902:ef09:b0:223:f903:aa86 with SMTP id
 d9443c01a7336-2292f9491dbmr47861065ad.1.1743409602154; Mon, 31 Mar 2025
 01:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
In-Reply-To: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 10:26:30 +0200
X-Gm-Features: AQ5f1JoLthtmFW_UEIfeZiYstmZwR8YiUSOBR5lZF4LhyJhTQMs6C0wL4VFN58o
Message-ID: <CANiq72k6KJLaaZ54D-dKO8FgQOupCAFVCboVUvE-ny--Z10+vw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: fix pin-init name in
 kernel deps
To: "Lalaev, Andrei" <andrei.lalaev@anton-paar.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 8:18=E2=80=AFAM Lalaev, Andrei
<andrei.lalaev@anton-paar.com> wrote:
>
> P.S. I can't use `git-send-email`, so I hope, that the formatting
> is not destroyed by Outlook client.

It worked! :) In any case, you may want to consider the `b4` web bridge:

    https://b4.docs.kernel.org/en/latest/contributor/send.html

Cheers,
Miguel
