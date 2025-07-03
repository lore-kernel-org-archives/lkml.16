Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26ED2DE6EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580284; cv=none; b=CGopJ0viMaQlcl+amlqT0Z6ykY/Te90CD6SHKjUOPRq+buH1HVPJDlhdNfLvf9tk1bT9Q5exq29Fq2BTfPARDzTVvOW0LPqOkW3O/r9kpj4jtr7tNlnQbgPKH75Zpqb0GYS/ftqKpRfENs/MKWGXp/DGaGtQfSLUJCH8i/LoNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580284; c=relaxed/simple;
	bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pF1nG0n00PhjRXlFrRZxjuAw2zJhkNZqE19/vfdwI5eGM/TRGt6VSAoplnsnFk7OnXKalps+o9+bYBicDci1tGyKSkuQGhkHzs+ULVNmg8659kbdJCezdWKiVmPFMwswovTejbLFzO3WIw5FDNAJtNxa10SJfKLa+1FEfFNsGMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANj8kmoT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANj8kmoT"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso3884611fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751580280; x=1752185080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
        b=ANj8kmoTEkEyXEz+7Zfl8fWKE0C4id12ZxKjRwLDJb0W+dShbDpwEwSbwJJ/yvFWP4
         pHeT1ScfDZpdLswr+j2WQ1gfQHj7nP5hPLhDCpGzEXmZCBq5Qy8MIqoLwLDVr/dMldhi
         M9+8wSF4gPnrm5skus1RY/YErKAS/HbcQAAsRDLVMaQNgF0jc5d050dZzoEV3cMNdtQ+
         dHe9M7xFzP8L7oFJaeTXHSKPLP5elmn4X7MCPQFX0Ioml920VbVwGl+5XGwCU/lyRv/W
         7jsuZULL7eKmGVY2akXbf0wZUEMvqKIc/voHFYDIFaTkFRej47nWPPjBvQl3gskUF+UU
         zsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580280; x=1752185080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
        b=psE9n151YcX9Cgi6MkW+TzZ9bgZJMBGl3WoE/HXKtPEwCUsu1TsIk2DkOV1HM7snj6
         YNx1y7vFCqLz710gO2uMOxY/DqUNl++AGa74aDvik+Q95Qs4t0Db2Vjc7etOg8ZiQXMd
         9rzyo2R2Z3E3+kQYcpc1Yf6afvls19VawXmwu687I66zh/A5cAKpl/nrXfv2Y87IAYQM
         ziznqiKaUA/HVWgiG6SeP/SbTDMSXXvwkomLo6B+nlOwX8NeeCt6R1sLk7YTzezEkEDD
         E28WLzjGyLsvhke5tupreba0tzO3Dt3bSU2POg4mI3fMx2DBPwjNTJ7k4l392DGWaPN9
         diXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoAj2Gm4F4dh/RxE5KcT8VhqCjeemHVkLExwMzUn3GuNOIlBX5NAXiAqWGI5PC2ociZyktYd6mPlqdj8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3TpUcCQLXaeOksD6Adqpg7u2rVg9DlQ/OpQX8FaW5pN7mtvf
	VBddmqa+ShDQDj/4NeToyo1EYjZLw28b5SqdLU7WAmyc2UBFcrHANTRGFybSO/Az/5ihZWTu21s
	M0sSQ3kLVM6LQ2ih4o8fpIrc0JJVSCw7jIOltajGxhQ==
X-Gm-Gg: ASbGncuVNeJnf74SC1E3edoL2bRJFtPZ+tykETY8ttYmCgctU2mq2+snx9nAhbaRn3z
	pjWZWv01J7Ktv+ey+9Tmk+JQG1EbSMr8X0lMPeI8zQP0EnlRfFPJwk3+zkcRxT/cRUKjAU7+asm
	8Rml7ZwKaYGNY4qCQlpaAjutwyqmw9vsiZJSbJ15Z8Umc=
X-Google-Smtp-Source: AGHT+IGImGMP5Fq/y4gpdZAXe/bNUj9t48oLyRIX8c3HTSvwJygjhM/8i/8L71e57dTnyWSS9tDnQTa49ULtKebAmMU=
X-Received: by 2002:a2e:8a8f:0:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-32e5f581285mr443871fa.10.1751580280107; Thu, 03 Jul 2025
 15:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com> <20250610152309.299438-6-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:04:28 +0200
X-Gm-Features: Ac12FXyERrVVYpDPvl_uPGT_I6xGEjEKe5SU2NHnd5_uoaadOpsZN_FvQyb9INI
Message-ID: <CACRpkdbKNDr00y9-7gL5vixuvtdx7WgkPh5krGKkW9fNizx_HA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing
 blank lines
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:24=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Separate the properties through a blank line.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

This patch 5/5 applied to the pinctrl tree.

Yours,
Linus Walleij
