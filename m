Received: from e240-9.smtp-out.eu-north-1.amazonses.com (e240-9.smtp-out.eu-north-1.amazonses.com [23.251.240.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68181E25F8;
	Fri,  9 May 2025 20:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746823217; cv=none; b=jW55zAsKBwlQAEnXFgs6EfpE6MVDVyuwm0TBiFkjvtX4fT9ykJroITgllgSEGDejyJ2EXuEEPNLAPbtGBEBlLjY7tSirTyQ2W/EaEJyacrDHnurQGqW687j33YZM04vBHWUxutli8HBBP3IdOgcL3ObP68TdgCbDRZpkiWyBsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746823217; c=relaxed/simple;
	bh=3LomidA6G5RjtKPeXX6J3KBSUJmiCMfwhmYfs3b0Me8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UP2izGiHHa9uEg4CgkA4oSOr+0MuGg/7B6UMLNAH9BroVDx43fT+JiHfepB9PM8kzcmBU51oTV32a4M51z3mtIbRINSkRbg0rj7MIRJq1X5Cfg0vJViIhD99D1S/CYstT9jVbb3fLqyqlxqrpxLsY08uaoOrAay15u41Zx5nNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=cbqDRNl4; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=zfohqNG4; arc=none smtp.client-ip=23.251.240.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="cbqDRNl4";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="zfohqNG4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1746823213;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3LomidA6G5RjtKPeXX6J3KBSUJmiCMfwhmYfs3b0Me8=;
	b=cbqDRNl4DvDvKAGP3p+4EthN6EXOeEQwiWcelrmqoTV28jE3az+ghoZtLdXkAwl3
	YOmO7a5KAAFiyPaoXOoQen7BTapoZaJp+BJYSzZ0gvsDnSQXEw00I9YjFT858w7WhEb
	8R8M31xmGqvPRnqFo2FHQBQWzh3hRF2EFlqVN/H+po8diKaBJPEoRQKLE+NDUPec+GZ
	vj9OQjLDGD1WTFsHDGWjsB39BmbsHnSniJu45cIVgODUgsVJhrUx0EuN0h9bAt3Y1B/
	8ULYeUAe/wXvSklqGCYgNg4lbzuzQP09pNsCEn63I9zLf4hMDDNWhgq/sy7VlvwuSHf
	UG5AFQPdLw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1746823213;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=3LomidA6G5RjtKPeXX6J3KBSUJmiCMfwhmYfs3b0Me8=;
	b=zfohqNG4SuN4huP01sOqw4pADGfi6JTYxYu/SOfOD1ccPwQ77E3qTBhuxXJr9f4s
	Yc+KLaZnnBPk2h7RgVBMFDWvSM/hUo3VpJsCAJNJrDDY0+D4/h8MAM4oE8J3TOmJ/iF
	uc+VJiTNh5GpkZpFqmIA2a8ZT/2e7sUKp5zH2Fng=
X-Forwarded-Encrypted: i=1; AJvYcCU3C+mEiKadWL3HKK61EU0ICYUcy64YF3j+pIo1gumnf13VlkgDLTx7jgpwWuDEzpo0x1xsr41Q42fYMh4=@vger.kernel.org, AJvYcCWxDkYgW+5b8XJ0Yni20eHFPPPZYSMjyiqGwT9J9K9QccgYEMHYC+1N3WvRMHgT2+Tpm276UYwEqhNH@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKiq1nqtUwac+PPl0qfbaOmXjsC2y2cEclZJ2JnI5Prn5IrE+
	tZ+MzYwVnBzepb5BmB1aE2z4ENuBapmgGj6l9WkJuT/TjoG8Izg3z2aZisSTUawAg+ipf7lOicN
	UCZNDt8yx7GJl6uhhhlNg+U1ba4k=
X-Google-Smtp-Source: AGHT+IGVq3i239wek8IKLEaNnIbRTcNddfEHFGsWuxwOmrCoyO5WOAU/lEVl5fhrtNsdg19944Y3lfshAfSb24UJ5Io=
X-Received: by 2002:a17:903:1904:b0:21b:d105:26b8 with SMTP id
 d9443c01a7336-22fc8affe3fmr61614245ad.7.1746823200851; Fri, 09 May 2025
 13:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509203430.3448-1-adobriyan@gmail.com>
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Fri, 9 May 2025 20:40:13 +0000
X-Gmail-Original-Message-ID: <CADvZ6ErFnL59beXeXyqHzb4EtztF2N7hxQGEnjV+U-YURZOBhw@mail.gmail.com>
X-Gm-Features: ATxdqUFulZDgWzdscdTT0SKhmSq-Wu3ATehyZIt9Q7iAbbkGwvQtqwhlXhx5BtE
Message-ID: <01100196b6c6f293-4e0c53f4-3e50-426c-9519-3040faac2eaa-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into symlink
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.09-23.251.240.9

Alexey Dobriyan <adobriyan@gmail.com>, 9 May 2025 Cum, 23:35 tarihinde
=C5=9Funu yazd=C4=B1:
>
> Every time I open Documentation/CodingStyle it says the party moved
> somewhere else. :-(
>

Hello,

I dont understand, this already exists so when you look in
Documentation/CodingStyle file it will guide you?

$ cat Documentation/CodingStyle
This file has moved to process/coding-style.rst

$ cat Documentation/process/coding-style.rst

This was processed for .rst file.

Regards

Ozgur

> Of course, I forget where it moved to by the next time.
>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/CodingStyle | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 =3D> 120000 Documentation/CodingStyle
>
> diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
> deleted file mode 100644
> index 320983ca114e..000000000000
> --- a/Documentation/CodingStyle
> +++ /dev/null
> @@ -1 +0,0 @@
> -This file has moved to process/coding-style.rst
> diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
> new file mode 120000
> index 000000000000..b4a9864269eb
> --- /dev/null
> +++ b/Documentation/CodingStyle
> @@ -0,0 +1 @@
> +process/coding-style.rst
> \ No newline at end of file
> --
> 2.49.0
>
>
>
>
