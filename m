Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA82561AA;
	Mon, 23 Jun 2025 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688384; cv=none; b=WwWWEo9yPsfjHQ2tOe1/fkehQUj7Vd7mK2m5O0Juj5x/tGDtePU/uFwnaoEwxMEkuNqiVC7JNKeuhMjs5HStoE5aw+OFH+t/sRCJnhnWfvTyv0J+AL9wKD5KkeGrucSc8EBru5T9inyo4ZtnoKjw8KA2c3SYXrPFV/lIREFyzao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688384; c=relaxed/simple;
	bh=2eXRoLGrutdapHVUIYcYjg3zDaVUJEsXBCFHk1LBPqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYtIq7ibSon5/tC353jWvmUbi3StnpwlhPNt2B5ItcL62QcMQkAinb+izwyBr7jo+SsjP2HmyEJyIk1Busi4sLZwHg09htR9+N8ugDV7zYXmPI+7adrESnDfQWn7S9FPWiOGt5kh64PYGPNLDl4sZ+kZ8SRK4OOmuseb2+8dJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRnJoMlN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRnJoMlN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb5ec407b1so704144366b.1;
        Mon, 23 Jun 2025 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750688381; x=1751293181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=;
        b=HRnJoMlNWbJDDzM5BYdaQ/ynHigzBXBAz87e8IkVF776oQunUsqaPU/RUR8mI6jYxN
         NXB7ZuNpuN6Q2z7LpNgKEt8AFXxNeAL9kdHT2C8DW5z3eeBsTggvsxg9e82hmiwd++dT
         LginB0cP2BLatgUfCZ1li0fflfOJdZUHlHwcn3ZQFwjoB0v40a75N19uPTXCuTiY5xBL
         GVZZ0aU6sODrExmkunzzI6brNMeoCUeQFapsXjb8wyw+dUXFu3sTW8KE2HgOWRQ36RFB
         ko3gNFZ/1h8Vn72/47E8kAoHfUUy5fgx1vn5BPeKli7GqNPb0rPhyUFWHkhbi59KjA8p
         VeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688381; x=1751293181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=;
        b=ZjWjRgh7cOz5yOqBfYCzG/BdYGIvE3c1+gu2+b0aNTRAJuSTSWDK7SXFpvDJCEqJi9
         TJCP2z6ADxeOffbgymkh/mNiFS9wRVzcTG+PmS/RZUFqjYSrel21DRkRE2yj1A78cc9y
         aIJ2Mdj+F+5/kdUXSFDv+fgKwmBIHvviYi77Vl6lJFXwpFrFehVJniog1EyQhFjjoZeU
         3bxybhkyrzblsOtLMAwhpglkX0dQNafKyCxd8RVX0mg8HDUj7s2opts5qivg9ydJxtMq
         S0b6M4Lt3KqcPJ82F9vFvcBs43sy2IHol1Bf7IY+hKm3thod8wrFxHscI+ZjH7HuMSBL
         UFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYyOH0cQw8oappus9gCfKwByLYMrBThx7NBJ+Mxwlp9vZt7Vj4zpmaQ9wZHHN3YOuRTcSW+0YQvA0ecoon@vger.kernel.org, AJvYcCXJV5eGVa0H+OK+TNbQBZpjbaLJezGZEl1iut+Y4hWB+Z09bFpPpKs7V3p3evVP3giWVE2DW8jMENSC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyq4fo6+tQnN6M+VhiYZFb3+XLkiveNW35IV4h0CyV+BsMfs/O
	LOdRf4V6VeP5jm0R6hK8NP9/Lb64CATmOWecRa2Owbi8xUiOduh9vxXs
X-Gm-Gg: ASbGncvA2ZOgBhPRqYIg8Fbv3b/e6IxMMKsZ7uCBmdCgiMtKXx9ofOoIIQIk8z/6dNl
	ygbvfysUlo2sA++qRrDy0mQLNKYbVpc+j9m/VQoYdkFFSmFbAUVFqHK0AjXmtVVBxw0mGDofUMD
	l6tCOn93OyL1CWlByo9Nk5WG2wOnSpgS9pdncisOPSwwIPt/WHkk8oAhbOylvbYyLVqtPfLJ5Jw
	DBhzMicECre5OuLFuPUJdnnm3+jR7BYaQvmpweF+5c3z2nQfClCe+BERZoX1D3yc31ZlkLVDYBi
	Nr8XWX0RKEdIOpRq6sdl1jWq1vsm9f+2WjGtcmsnYusYwYpE7eCvAnNvwYrDA0XtBr7zdHs=
X-Google-Smtp-Source: AGHT+IFysmPAl7SZsmV9pPCgEFPxil+tuIOlJgMNXwTSQbww7umYOSo53xU6pPPX9Cpuqly+9XmnGQ==
X-Received: by 2002:a17:907:6088:b0:ad2:3fa9:7511 with SMTP id a640c23a62f3a-ae057bb8dcamr1242357766b.41.1750688380845;
        Mon, 23 Jun 2025 07:19:40 -0700 (PDT)
Received: from [192.168.1.150] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054082d0esm719221466b.79.2025.06.23.07.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:19:40 -0700 (PDT)
Message-ID: <0a73b9be-d0d2-448f-91db-209f0d59198c@gmail.com>
Date: Mon, 23 Jun 2025 16:19:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com>
 <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
 <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
 <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Fabio Estevam wrote:
> On Mon, Jun 23, 2025 at 10:17 AM Goran Radenovic <goran.radni@gmail.com> wrote:
> 
>> I was using git send-email, and I did not notice any problems with
>> dry-run. I have 3 patches and a cover letter. All were marked correctly
>> v3 0/3 - v3 3/3.
>> Everything looks fine here:
>> https://lore.kernel.org/all/20250620122353.150700-1-goran.radni@gmail.com/
>> Or am I missing something completely?
> 
> I only received the patch 3/3 in my Inbox.
> 
> It seems you missed copying everyone on the three patches.

Thank you for the feedback.

I was using the following configuration in my global .gitconfig:

[sendemail "linux"]
     tocmd = "`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nol"
     cccmd = "`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nom"

So I relied on the automatic recipient generation from get_maintainer.pl.
I didn’t explicitly specify the recipient list, assuming the tool would 
correctly assign To/Cc entries per patch. I’ll make sure to double-check 
and manually adjust if necessary next time.

Thanks again for pointing it out.

Best regards,
Goran
