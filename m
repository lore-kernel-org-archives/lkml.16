Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993E1EB19B;
	Fri,  7 Feb 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941690; cv=none; b=NuPdapiq3a5UzH4JDw+JEkRgSftAfkbHyn5FGElHxv7JLYNC25WhyQiyqnn1ZjoU9YJa3holIwGouSZvs7REXQJGuHq+ZbWyeBDy+mi0SwKbOomKCiBwsDQiSynFvpTE/WR1UJ9oyrWz4Df98Ws5MIPGr89R4bJhCTXtL9Jiun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941690; c=relaxed/simple;
	bh=6xSu6yqLwW31sE1dgN0w1jhIDjrnggzQLcHIvx6aJY4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=KR0CLuveXvGp5O9b57bnMAx++73vUqPzGrESlyxzwzWquf/Ra8pPt6s6a8RNiiFUZ9UTwPw5ilfviskFzFYks+fKPj5lZMWdTxRu0KhXJU+1J3vO5GHGxCvkHs+/GwNi+76koaP5Zubdk3IC4fWNJl88DdZgbC7iaB/PtQlyEJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmKz3ggB; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmKz3ggB"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-866de72bb82so595128241.1;
        Fri, 07 Feb 2025 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738941688; x=1739546488; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8o/GhPihbNO9n7sVY3uJzY0pqAnywK5EAV3nB+mum0=;
        b=PmKz3ggBh65lBiTpYhTtPqTf+c0ngM5XX/BHbw7EEnOJicFZ/TYtAAjcwBlpai/KT2
         UTTRz7LmXoKLSrlIYYbwkACy8UMx9a7jYGam6xsEgk48Kqam19aFoRhBFHOfAba1zxi6
         mPQRKrF/Juzfm5lr5ryri0A+MGN7/WPhr6UHn+bf4TeRdMg3Sf8OSSPXGP4GZb0jHhXB
         2IrG42elUwYkSECM9CHPoVfSmlyA7pRNxQmPI+O4Iegur5tjNNJDmJNh83Vke9+AnOQk
         +6ltdbEXK+Mkie0qnGrPY/LhIgpNUzfXXb9+qp215dc5Rll3aUNm1/orvJQTRBwYCGzM
         5gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941688; x=1739546488;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8o/GhPihbNO9n7sVY3uJzY0pqAnywK5EAV3nB+mum0=;
        b=PXs7Z1rwJfeIugI7TktfvuIo0R7sFYarlBTPPmE53vAaN3Lh+A//AcCWVwKzB3KM5R
         OjBjsB1SCP5T9WT794H+H+cNmOq2mrFowz6yv+vnT3EvqvSxxbfILmi6AQUQX8tZa5oY
         4NDe+gRXgQx2RsZ2JtT74WbpvevWAhdWQcHRU+YI02D0aNrP2puJCXxqLdZc7Euhq0T0
         q7H1NKw5xBuyHIzZQGuBqtxOFUsSYimw7itmbUjYsbOXyqd76BJPFKq7qLdnb2Z7a7rF
         Do9YmJLtv/Vg5tNq0AugagoJ1+d36pI4PpCncIH+IC8fk1y26Z4DG4+EEhUdWXVzHIel
         1d8w==
X-Forwarded-Encrypted: i=1; AJvYcCU7uKl55+w8r27SkFRfYNEdT873e1+4yxqa5y0dHvn31HYVyqW0rZqeQQfAKLLs6xEB4NFBwKyE6Rnrg3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcD4Q9f54uatWTE75448F8v01OK/fvIuZ64CW+/pn/1ZTiVNL
	C7BWMBAg2bDfI7tZPvVqw+Mc9ahmKujMV9OKXLgEYelmjYC0ImSv
X-Gm-Gg: ASbGnctM6FUs6Ku5Elrm5QlifjC+W8DehvxdCMG6k6Fop6BJGmA0BxhEQ/HUZZrBQgb
	2KhHFcax4C/NUIi8PVnHdOPBD1Wc9lhz3frxyvupqFbMVZ6UVnzS7EMHEnu/vLRs3EXIj0bjhCx
	KUjT6MIFvz4EIPiOKmZt3ggY/gXlH37B71P9gHBnTIbfZQrOU5AjluZiK2CXxtNRT6AXbLnVY5F
	SypkEb8tojRIF8ZLVB131xgVzboLabF3t51SGEKBgXfmumdeyZ48W2c80cWHdkYPUyiY/4KSS4D
	6O6P7zg=
X-Google-Smtp-Source: AGHT+IH4HSLNswnaBV+62T9qy945S5J+DA4t49k1tTtj0C2j6pL0p1EbbH3BUqbk6oRJea2LtqwlQw==
X-Received: by 2002:a05:6122:2191:b0:518:6286:87a4 with SMTP id 71dfb90a1353d-51f2e0f7e02mr2796332e0c.4.1738941687215;
        Fri, 07 Feb 2025 07:21:27 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f2295a7fcsm531558e0c.46.2025.02.07.07.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 07:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:21:24 -0500
Message-Id: <D7MBDPIDK7XS.3DONIQK22EIBH@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 11/14] platform/x86: Split the alienware-wmi driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207140743.16822-1-kuurtb@gmail.com>
 <20250207140743.16822-12-kuurtb@gmail.com>
 <85e378b4-a434-efe1-fd16-416fc3ce3691@linux.intel.com>
In-Reply-To: <85e378b4-a434-efe1-fd16-416fc3ce3691@linux.intel.com>

On Fri Feb 7, 2025 at 10:05 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Fri, 7 Feb 2025, Kurt Borja wrote:
>
>> Split alienware-wmi WMI drivers into different files. This is done
>> seamlessly by copying and pasting, however some blocks are reordered.
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
> Hi,
>
> Can you please check there's no error in driver_data assignments as the=
=20
> numbers in removed & added lines do not match:

Hi Ilpo,

There was indeed a wrong assignment to Alienware m16 r1 AMD, I'm not
really sure how it happened but it's fixed now!

I'll send a v10. I apologize for the noise.

>
> $ git diff-tree -p 73224c076cf2fa2968d61584c62937f6180c8e71 | grep driver=
_data | rev | sort | rev | uniq -c

Thanks for this amazing trick btw.

~ Kurt

>       1 +               awcc =3D id->driver_data;
>       1 -               awcc =3D id->driver_data;
>       4 +               .driver_data =3D &generic_quirks,
>       5 -               .driver_data =3D &generic_quirks,
>       7 +               .driver_data =3D &g_series_quirks,
>       6 -               .driver_data =3D &g_series_quirks,
>
> (That commit id is from my staging tree, not available to you but it's=20
> this patch.)

