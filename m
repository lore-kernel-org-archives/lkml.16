Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08244220696
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171425; cv=none; b=B8ATKs0R2x+NqRw3IddCNlSi6rVKyWikYFYnKGa3SvCeQMcz6EW2ecGKmmFpx3kxKmlOYihp/9W0jAmEDQyJIUEkUZfmZXQSlxcYpQf3j0hnV0AiROOWwDeRkAQJiUAHKdM0VFajLv3xDMPjLp3aBmXLXnY1rovBesDGSNGr3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171425; c=relaxed/simple;
	bh=vBXYpiuevWTMi/1nNtUJbKESjuRs2n43jiMJE1nOqL0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R9PbXwckEICjIGDxdHl3ojgawc3HlbZALkZZGxQ6uWWdB7bR7Vb4dTXXAcwDMtPqnMO2/P6/flD36qdLPYXH+9aVyVvalmdm98V2c+y/X/jE53LSpfa46GVP89YrYkpYI0WTzh8tjjzcyQHJLp2XLcAFB6FXozEsz3fB6gbpUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEHEeXp7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEHEeXp7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1204542f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171422; x=1746776222; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vBXYpiuevWTMi/1nNtUJbKESjuRs2n43jiMJE1nOqL0=;
        b=PEHEeXp7TnNvn3g6im4JaliTX75Rnv38YLu5KmZlNGjk4iYP4DbS4doLU3bvcOy2Iq
         ZwfEKEtABNlt9dxTxIy8F02GMA2f/OuHluqbeMH1wJnB0XR4ukfL9aP8+L2YpYNCoaZf
         zXJgQlPJrThVJ8HOFyF60RIH3kmnM+Caa17ecgXEVuZb4dvikUtOxedR4E/pk9Th3gVr
         BRloG4LyjjQRCRDh6I4rY79dHZYAMN8nxurXn+uoNC1lwZlEnTy2HR0NXKc9lAZs7qjA
         DQwqbekG+JpiqWUH3KP8Wuj4tlhXcRt+thQRARLJPfbcc3rq4B3nkTfhCDL/Uk9pLQW0
         ulJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171422; x=1746776222;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBXYpiuevWTMi/1nNtUJbKESjuRs2n43jiMJE1nOqL0=;
        b=VHFxPiWfKo8pUjytmDXCqQDyf5v5wWEE4AA1cX20TifGK5kkOR0gAlAoRd0PpQAdDi
         5ULwTXQBpHYjG1Vuyo989Byn4IkeqhF3WGLiUKeqttlSGOjN4IOC6kxLsn8y/wNVwzbL
         owiQWTGFwKUUC3bauNPv0SAVB4Oz+N/LS9L8I93+KBII36oeOuvmtAZButajmjE1gcka
         +MD45Yzh0fdoQOruRPiQtA28RtfZ9+hDIDRHtjtMS8NVriheWUeawb0BYPjXHV9leLUG
         dwBZCscv2+MN4cUpAtY3BRey+IYv16D1YMgoFXKBmpcwyxlW9wAuG03+C1P4/jUZhGGj
         FhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcii9GFj9dwt8oU+17mBaMnXeqhcD6A0j2/+l1PelNzJb31FPQezfioNd+112JcX4yji+dN4nFhL5OdnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyunrV5zrd4RrLsmVR9sJz/mtaHEwdfw47xhhj2vAoMUbLFpuZz
	+2M3ETB1QOwUC5EBO9IZZpgyllGPJnsxHmt+IQyknqR2xzZUE393
X-Gm-Gg: ASbGncuUbvCFcs4wHIXGrTYZVZFkxRXi7UllFuQnznM/n5/IzrK1iLEQAkcEi0JuojF
	yWXNhDHOb0Uc8+MSyaL2pO2lg9CTKAHvqxWY4iy38qBS8zHmnMbZg6z/TJQw/+LZjwHyiYjDLzr
	Ml+P9dK5MjHoie7m6F7nTCPTg3RVi1TlAAioC/K5oirW/05X5M6nE2Ecez1OfzKBGZ0lavWlgeX
	Bw3V82w9viA4AhB+QWLSQG6JpptXcAfiar8q236A6gcN8fzsicXtGXS4OPwneKYhjZWfETfemHH
	MK/JGFjvJEHu0RZiPqGDEo87O8QaaJFhfsfVr+HmKzJSuBeITFbXlFt/+XO2sDIXKPmPEsIOEtz
	BPoYyCV74lKCi
X-Google-Smtp-Source: AGHT+IFxtcs4l9HcRDaxZDAQOP5k4BaScOa+b6sTV3maiE6nVQ/jGLYkJqXMC5+XPAcsJNmNNaX7MQ==
X-Received: by 2002:a05:6000:4312:b0:3a0:8c46:1763 with SMTP id ffacd0b85a97d-3a099a87bc3mr1107790f8f.0.1746171422361;
        Fri, 02 May 2025 00:37:02 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286b9sm35133395e9.28.2025.05.02.00.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:37:01 -0700 (PDT)
Message-ID: <6e7927176c29366643a13e69d0f66da74ed1a31d.camel@gmail.com>
Subject: Re: mfd: adp5585: add support for key events
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>
Cc: Lee Jones <lee@kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 02 May 2025 08:37:08 +0100
In-Reply-To: <7a6d0a8a-aa14-488e-9072-0bbafaa84e5e@gmail.com>
References: <7a6d0a8a-aa14-488e-9072-0bbafaa84e5e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-05-01 at 12:09 +0100, Colin King (gmail) wrote:
> Hi,
>=20
> I noticed that there is an issue with the naming of device tree property=
=20
> in the commit:
>=20
> commit f674cea99d03199a4fc9a96c68149b8804053f80
> Author: Nuno S=C3=A1 <nuno.sa@analog.com>
> Date:=C2=A0=C2=A0 Tue Apr 15 15:49:26 2025 +0100
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 mfd: adp5585: add support for key events
>=20
>=20
> There is a property named "rst-passtrough-enable", should that be in=20
> fact "rst-passthrough-enable"? (an h is missing)
>=20
>=20

I'll need to re-spin ate least one more version of the series. I'll fix the
spelling issue.

Thx!
- Nuno S=C3=A1

