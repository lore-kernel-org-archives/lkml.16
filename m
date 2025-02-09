Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327C1DED7B
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115945; cv=none; b=e/2xeB8EVyiKC07dIA85xXVhVrfd/zGuvnrro/bo6R7H068Y+nQ7+WaPE/bjuWNxijRSRlth2zRLNMQbNjVmFLzCdE/bnEB22HGmJiDGGrZUa2QDQlGrYe0Xp01pHqKsQAK3gn3dkl9NsYxd1aI92z5Er2Vn6slUF7QLeuz9sjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115945; c=relaxed/simple;
	bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg7CKAPGEt6o97Ij7sESr+5gP6+5zmzngo80nCI677lLTIjrGkI62H1Kz0Go8aCO+LXJUeLsyYIxjdS0HvF5fFMq1mqZKF2O4wxlKDC81fJybzTh6CcC8QiCnV2u/t/Zm5KZeJxUqnzquT0sFwkM6F5GPNkeE9eyW9Thy2s+jtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dGZ5sNht; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dGZ5sNht"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2b869268d01so234010fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739115942; x=1739720742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
        b=dGZ5sNht4OWKGVAHbbG4DLazyszX7dSV5lhOi9poiNg88TJIZD1ZVSwlKEGxFE05KI
         +oLC1rcAu1qfgR0VS4PTr6zX6/g4Rrsv/vfiPY4I6OvzWx6RRq1s+mficbrxZDeE+HlW
         V1gvCgjASNYFWku/e2D91oIsgIpAKXQ9otfwyACeH0lm57vwsBfgd3j2d636Cm8n1htv
         SQoGA9uaRaCsJ2WGenVkrx96E8VBKEqP2DaRN14DgLg8nuKqQT0xjOUokk25rlbeJrVB
         BcG2Y/5DjqkVvQkAznAegY/v8yb82bJWcQ+wXtuG6RGEAb03zJ8PAU53Mgsk0cS0gGas
         6q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739115942; x=1739720742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
        b=klQ5CMVsDStENoE6Re0xhhIFjoG2OTlan04KS6hWTvwSbwez3bOBwvici8tH9uolYu
         NVBYUz+/OqhMUw0v6jzI4pN4GtuhZmKoPVbluIe25VOcvRD2zq1pKO92xdngqgKAcQ80
         flPu9F6ysKio6BHc3h08gmsjQgKizO+MyOL0ifZwxTzbpDl5cgh7K2WHJFZ7fIF+szoY
         QBcGJZeGf1U7gpTp784wPYc4PmJYy+J6kO7OhcLK+LP1YvB3ZP7HI/U3MMbN6KujCZZV
         Zwq7nYWKUrXVEsAE9333np87Upkl51StmBiW+SXshkt6xydaY/Bg5Lsot6ALan+hxXa1
         5q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWftdRvcCKV6eXTw7Zh99hktXCrFI/b4jicFLpb3a+0jenFDqXrFr4EsZZ5oI8XqhmL2+PphCIabUkdN8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqnxpQtKRPTycbIVasrvvKFilEAEs68zSjXbo7aCjB9lDMY+e
	T9/L6Z0Q+EP4G/yia0H2NH2IRxpm81RnzUxOr/sKep/+1Bfv6C9kNm83ghi8W7WFLzRXnBVetNk
	CosRZziZfJYDCI8HYwrCm8P/wDJDuuec4sYfTCQ==
X-Gm-Gg: ASbGncspgPx9+MNIhHck1FiUCx+Nu9uDHRWvHoEY0q+DZp2JP+XdFmY19oRr0xdLsda
	O9zMySGzW+TW5JMEoi46JKb08U75Fc+XiFzP1+C/BAwDAU7AC/GNS1p48/zW2xMHCb5o6Lgkq
X-Google-Smtp-Source: AGHT+IENz8t4vUeXGtVHid1JXOXuNJTbdadkrLtEQr8ilv9ZuDGPzHbJyKQfQcMH15TIJAyObgIJoVuODrlm6BQNqBM=
X-Received: by 2002:a05:687c:2187:b0:29e:75ff:4d0c with SMTP id
 586e51a60fabf-2b83eb5153amr7084882fac.4.1739115942497; Sun, 09 Feb 2025
 07:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org> <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 9 Feb 2025 15:45:31 +0000
X-Gm-Features: AWEUYZmSRsawKgL0IuzGCyXzwqdW4eDJSShnscBuwYbznWcXl18S7O0nhsTO_i4
Message-ID: <CADrjBPp0nhUEP3W-GG1xf=SqAmSmkDeqzP--wRmrin0JYYQDcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: gs101: drop explicit regmap from
 reboot nodes
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Feb 2025 at 13:08, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The regmap property for syscon-poweroff and syscon-reboot is unneeded
> here because the poweroff and reboot nodes are children of syscon
> already. It also is deprecated.
>
> We can just drop it to simplify the DT.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
