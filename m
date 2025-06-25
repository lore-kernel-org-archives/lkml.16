Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F33074AD;
	Wed, 25 Jun 2025 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839132; cv=none; b=hdinZmYWRJ/HAAy9HRbdfUBjNJDczTvso1V1UFh+1QSTm3uPsPlfN/WNALtgwYflrZ+r4Dfu1s7UBjVAureYC+3S6u3xKCbUv29nYEXU3mQ6FLoIjXBM1gL8Wyq6Rm5tPQrwinPfXfhvH2fqsJJJk4KC+YWTTP1mAGkBhkqVzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839132; c=relaxed/simple;
	bh=RPthNI2C/lrp89NRWEZYlwKMiNVazZ5c0wzeDk1uOYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqGN7cL30GCcdDueXiHr2m2C4+8h/W2g2yxY/J3M1i21Lb5oE9GjmnoBtNHi5RW115RNmvclENMl3dF2BwRgFRhRJuuhphaVgQk/0WIcq7+ct9ubZJlLb4EdXTZpriJw/NOAWbTj/Jz+msU5wT2T0uiXq8ZAqscnfCSkds+nQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU8EiHFP; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU8EiHFP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31aecc78a3so948602a12.1;
        Wed, 25 Jun 2025 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750839130; x=1751443930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPthNI2C/lrp89NRWEZYlwKMiNVazZ5c0wzeDk1uOYg=;
        b=LU8EiHFPLwCzJ48Q9lYWkkM1p+cicj5werslgxisopFBmSL2T65ig/8Sqzq0llQXzR
         x7svrTcUn0+0GwiR4ZrBRr0Y3iigO2MaDggpHx0hV9tRnktzZmoX7kGGIOS3C0521nQh
         gm6ZSQrbTwl3aEuo1C6cq0IRYGzxVWswBtE1b9mxd2nJbuproXAREmwCbFnt471UgjGU
         r2AbqCD1Nbi8YH2tf75IIWX0nhYGVBKSdAFKpzIaAQOY7//4y9SfKjN1uFi80/M5jsTA
         9hIrvXwS+WiQt8zCOHkYnM4WiEwvcFzSsrYl5EOFvw5+dKGMI5qkqXiEn2rOtOHXxck6
         nt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839130; x=1751443930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPthNI2C/lrp89NRWEZYlwKMiNVazZ5c0wzeDk1uOYg=;
        b=VQBYxATzzOP7G2dN6Zz8pAuIZW13XWQYAke1CPBI03xpjqsKlpH/plefcuNNEIpW5E
         DAW8BpckYN/2r7UHKvKCCGk+KhXGzJ3ev3XlVUX5fnbHP/ZUsrAmVW3RBPdLyNififL8
         7r314IyR4dlrgpQUpJdBPTjq7m2WCml+HkWjZhSa4zgDcgf94jXWFZuBoZ/b67R7kYv+
         3LYdu13vtUv8qxBDbv2zdBdbQ3GaRGsmRSkWsrSCRQQXE91Rz7CzlsF+qiXyU2al6uJg
         g28PMnhmxSl0gWyO+niX0c7PlypMU0Zh8SZPcEmPgrnjEhI+0pDYpF7JuQ2Vty+PVVIr
         /vsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnx+H+qf3xADb6o5iWWdQaZe9KAfwVVBBSo3NeIR+hCQM3fuaj6213z9qwtP97iPvatwNEIttdCFAPo18=@vger.kernel.org, AJvYcCWE9qnMgeuwoE/+9IpsbmjvTFgGXdbzcTo4c1usN4UXK39T2UgiZX4FOKzB8g3Bgp0RPbG4AvXLT09jdT33ey8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpE/At3/2J0l/Eoeu5zOWSGl80j42h1YV285dg3yuRhMKkPehz
	03lQTsQoUT8PBHHfCOGUrOpTA7c/0v9DVwkhPOZvXsde1MREDdF9VO4nEnpV/8vUq19PIxvhYGV
	Kd636eBtDf7HtmhaS8+QrIEgIDFV//3U=
X-Gm-Gg: ASbGncudaIOxcQr1ZLGbrU0BnzRZFHKZ7UxM2VgtzOZaLgeysPYCGgce5yaAjHNBzgu
	ucYyMA+tWJ1cWEmj2lP0oGgDZRj2bMDnM59aLHlHJtzYOZDIbzIuNz6LAKhkGpA31WtQpKnNU9e
	ItOPx7xCzmiwxlip0G3nj09wIMu6J/wV7nnOx4Pna2lU8=
X-Google-Smtp-Source: AGHT+IHONdZBleDNPC2jvtYGuDshMDyt73BVAEWCwRyahLfzKy/0ntQud6He2dbe+DQhe/sU9IVl4x1t2EppyxPT4P8=
X-Received: by 2002:a17:90b:55ce:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-315f25caa86mr1162469a91.2.1750839129974; Wed, 25 Jun 2025
 01:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
 <87wm912sjg.fsf@kernel.org> <CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
 <20250625.083037.1910124819838055415.fujita.tomonori@gmail.com>
In-Reply-To: <20250625.083037.1910124819838055415.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Jun 2025 10:11:56 +0200
X-Gm-Features: Ac12FXxywKqxxuGlkGsX4oKRETARJzoIWQl7FowBwzTAGrNUxsxTt2rM6e7aCYE
Message-ID: <CANiq72mTKTh+GSWUW5aZwkqpdMFZ5VwA6djwubtsVn2KOy362Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and Delta
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 1:30=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Just to clarify, Delta implements Copy:

Sorry, that was a typo: I meant it is `Copy` (the table says `into_*`
is for non`-`Copy` types).

Cheers,
Miguel
