Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8964421C19E;
	Mon,  7 Apr 2025 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067039; cv=none; b=ZreuOrKxCXhYz8wCMDWAGMTmVqUmB+ybWkUHwnQb/9b0tNntmOxBgWfvdJZhwRwMtgKA9mkbUusxgh0zgg+v2vmTbBf0WrkNi5zbXyOuun4vaIPoxfTxBtU3gTA9uzEd83vNe42ZBOnygUMBeLnPuygK/vScsVYFc0Cw+HlVggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067039; c=relaxed/simple;
	bh=O3Cf9PgyHCa15CTeS4JLKK7LTfvTs++ESgNxy36Bzzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4Afp/mCofVj84YhR9ajD8JwBYajAOpp3Ndc5JmkNjt7pW7VRMVA1MBI6Dfssw0pXloJzaKHw1bIZ1YfIn4rEJupfcdDLUUoeTn+jUuiTW4s1BAmdV8v9WizcnY6FobRY7f7qNSVecmGvTY9+C3XNN94TGKw109xZ2DIi728Rf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixcNC0Rg; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixcNC0Rg"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso55934826d6.2;
        Mon, 07 Apr 2025 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744067036; x=1744671836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pB3YyC3lg92dsQDu2Vh7F7+riGLIxr8jqmJlW8qtJFw=;
        b=ixcNC0Rgir+fCD6Wr3Z92jHw4KCvBtByQvfBVh8B1CAaEC/XY1MgQlMICZZtkjHA59
         OPdzDEjApopVxZ2NaUHbpWmpAksZ1PyVCAiKEDkd04TFicgciV8jjxpYDlsDQLWIPnC4
         dUprfzAGyUBcaC4VXU3kXItzfkW6Fuh+u3RciYlHbZ+NykB+ZeMLcXHZUAs7pK5b04ep
         wiVzjr7qdhkdMs77zj+CUyyK+xeqHPL5SN5eU8UVT+LE8qWB04djpmVX+Up4PT58huuh
         xyeTFPysO4zvQgMoya4ymB+n635ErwKNK7arueM9cVSd5vNx1HbvnLioKD49SGzIIUbh
         9phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067036; x=1744671836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pB3YyC3lg92dsQDu2Vh7F7+riGLIxr8jqmJlW8qtJFw=;
        b=X2Ipsw4Blm2nU1TcSZRoQRkRIBglOzN+BhKTZmG/1CfYc1l9XKGwvSBrfps1VkSZTs
         2nx/VEjtPw3fBhkgLu2zzwvx5eGaFcj0XvTZOJQWSa+N/Uqd3k1u7IUlCuB1Xufvi9L3
         0K66mAVLgzSFw6nnaZCkcjtsCE5lp2n8s643wI1pUdXVQK4Jp14h/Frs8I9vE3ae+OBQ
         p3BxKI3BZnJqvDQX9WoYyQlFIJCRKwi4dA/NbiqRW4L11Fe6xLLZSfGaZT0Ajlt2Dxpo
         OU9CPxMB/PM2dLtTvz7oMTc8/h9tcjfOnHEA8dYedxuVceBfIQ0fCciVM8DrUUPtVRFq
         qrdg==
X-Forwarded-Encrypted: i=1; AJvYcCUPNl5qPzxA2dgH8Zno01MrBXzeRyY03fuPrX1YvU+6DosJ2UjbbfL7PcsBP1z2EnAlMZLbse7SUppnhIM5@vger.kernel.org, AJvYcCUpEtzudeHw+j44NYaZ2kx98lrupf8mdV41+d/yrXGvzDLmIEOfjRGD4a8OCcexgbFdW5ojLQBtMNYSdoNWiwE=@vger.kernel.org, AJvYcCXWu5syQWNLVFXbsMC53PZIIHhbwc0cdF8XP1yYNZP1S1rekJ9YDSjM6FDn31WM1sv/1rr3DfexXRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfyg2yOmjIT0OceZafX4ZePGOUF49lCVeG2Pw0ALms+pIH6Lqn
	CAl4zrYHWfhTH4XWPQgs9ryS0qMIxQnetM/rknNXfMAWcvG2LA01
X-Gm-Gg: ASbGncszbOyU2GamyRgPQn9hgXO0h7n536PecDiBpNUS8S2BWmeNlxjTBcuPE3nUp+d
	rh5fmp8TINzTvbliTUG2JqyjwEs6vuakp1ohlTNrQHwljBZZuhSnmUgehHzHjX8QQ4NY1uPBsIX
	jVPFkqoJqDV+xTZslIs5FD95vFGSTdozCc4GuVoc9DJkC3CTpO1SgaEtgrS2rPkCnicIRabWbLS
	fCL49ggY8Cb+9pDhuHR0ZBGHWntDu/+pI8aByVat/VER91fEIE0Acv36QD2S/WUFxj8eRPG7m8L
	RQgiqA+5pmUit8BAHf3C3qoGNWgzofpm010jSAw6nIy21Q==
X-Google-Smtp-Source: AGHT+IGRh6q4nlQ8y3Y9jq1CRRkrjO0aDfKO5qHIs+ZCmg9yhyOY7oHV+KQAoWlwYDMWk9ci68IKrQ==
X-Received: by 2002:ad4:5e8c:0:b0:6e8:ebfa:42f9 with SMTP id 6a1803df08f44-6f0b7412fc3mr169437916d6.16.1744067036291;
        Mon, 07 Apr 2025 16:03:56 -0700 (PDT)
Received: from [192.168.38.58] ([24.35.8.11])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138d68sm64577546d6.75.2025.04.07.16.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 16:03:55 -0700 (PDT)
Message-ID: <c62e514b-08ef-4887-bc8e-fc77bcf3b0fa@gmail.com>
Date: Mon, 7 Apr 2025 19:03:54 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Benno Lossin <benno.lossin@proton.me>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch,
 ardb@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
References: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
Content-Language: en-US
From: Manish Shakya <msh.shakya@gmail.com>
In-Reply-To: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/7/25 12:04 PM, Benno Lossin wrote:
> I suspect that most of the people sadly don't read the description.
>
I must admit I didn't read the description. I was trying to get as much 
as info. Since it was my first time building kernel with rust support.
