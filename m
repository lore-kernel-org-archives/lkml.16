Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE8A79CF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000965; cv=none; b=oS53TOUNpCSEI1YYDdOp1lkHuMGKU1lJmOVRYRc1Fqv0V3gyzJbrhVGwygGxVuUO7HqGgFR2cRP0JAhKIq9QR15P6EZit9/nunj/1O5VxXKVKAjoAk4Zvh/sqm5wtaimbX/93kmdlv7DDUXepJoxJX49Delxi8vyVYI4tKfPb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000965; c=relaxed/simple;
	bh=XNryYVyz7ltmvgn5c1i5prN/gX+O/uSmqX1pTQgvSaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIDCOQuqjOQngqUfnCK+4r6649a4i2MLQR435R7Fka7ZkzVNFoZip+0MbURxXV/mex8zDy1b9tkOUWbDZhyF0KBRLWn4zrXo+ckWt527zlcqWbeph6g3VEJSXQxhDk3RBIu+YEyAS8a/Oc4MxNTI6y/iEyBXs2jIe/AeyZw2wUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1n2oeVx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1n2oeVx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6967592a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744000962; x=1744605762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNryYVyz7ltmvgn5c1i5prN/gX+O/uSmqX1pTQgvSaw=;
        b=U1n2oeVxUZywsIFCUk7564t/IxsyAeW9wK3cAciScLS/uW8DriEUMy7KCIQC6c6NWG
         wCu28a8rl1n0vX4fg1dNDBqmMDygUo4ppfxahcKpBNZbIM/ThMR5/8n5HusskSb//h4O
         RIjBY3n6LqlzaxzY7vovJzh9RtTNlGnrZQRCV8GFh1CRNJXjn8YGIx63unlU2UNZNQxY
         tS01sOXed79z1kgCXbsVWJh22tRqrMY4P1eocR6BjdUk95l2AqDVyDJ1xQdlMR2RSWRK
         yGi51Bcz631iA53bTSIctw0Bh1/MkRhSBp+WARUJIK3eNNpVV279TW5URBhw4XkFwpES
         loCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000962; x=1744605762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNryYVyz7ltmvgn5c1i5prN/gX+O/uSmqX1pTQgvSaw=;
        b=JV0m8PlBbhdkwhHNLmghwlgUoxxD+idrGNfYk7z6bPa3I5+hckhaJZ5j5+vXjOV+ZT
         l69Us8Eg79JgP4tR1eg3u1M0QILtjIEsOYbf9I5/52btxf98BjDtkBt8OpbpNmimJcMX
         CUqDaPBfdFg2ASOHFO1n+usPw23VTBCMHpnd4UlzO4fGUl2vJkEeT2X6NCvulyrNcZQ+
         kaUpahLIq1Y8jCCenAnNHvSgtTRfNEFwlO+552w1+13RqESypAGOwOJHckpKAAiwcuJj
         QNYeKfoelnDFK/0n+vqqOzLKhqix14HM7XfX81lej0BxhYxwUTlUwNV6uW7nMnRqur6B
         RMxg==
X-Forwarded-Encrypted: i=1; AJvYcCXDeF9pLN0FldMKWKkRPgJHyPQMQEZ3lvxwbOdGl3gOEvRVDnNLEv2X+cqQ2lW+HAISk+a8ZDZs3EYUjno=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbiLR8F1Dzh/yH0gfcMqCBXsGdW7KpsDH0xwVpLHfanaNJMPi
	tYafUKe4e4LMqYMyTJcmuFW78rMTm6gWXi9hz4ujfaY14668l5Jw4n7HTg7GMcnUtjpO6oHwBnF
	v3hhvHytAv8EMC8Cp45YX04owMCg=
X-Gm-Gg: ASbGnctzAf1vl/VwiBc6FzPn+OcuhBO96xZxLy71ufZ4lubOvCpxNcKnu6ReuJPfLcN
	2RyxV6LyOaNi+3lEvnHn2rwyorf1HXV87u9+bGkEo5BlCom0Dv95jSCxpC/FIz6L0fh9WjdK8kq
	p/PLHFyYPTQ0KzNPmgbcGusbmW7Q==
X-Google-Smtp-Source: AGHT+IEUy44iLnNQ8SpSrtXBGU0km9Y3x5Z+EvZGzUdXB5WIOYyJsDsllzNHJYKrFuXMvS11MwqIugDAYfTd1KthS+4=
X-Received: by 2002:a17:907:981:b0:ac3:1763:cc32 with SMTP id
 a640c23a62f3a-ac7d191b295mr1105521966b.29.1744000961796; Sun, 06 Apr 2025
 21:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/McCdceSpyL2A2p@ubuntu>
In-Reply-To: <Z/McCdceSpyL2A2p@ubuntu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Apr 2025 07:42:05 +0300
X-Gm-Features: ATxdqUFIOsiX9auunU8SgWM2VGdjyhz41zblW_hhfHcha4c9Oi76sVF3z270wrk
Message-ID: <CAHp75Vfy0KMs1STmS4_5MqdCysKiZs_GaG1ahRNDr8ARhjRAUg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	outreachy@lists.linux.dev, andy@kernel.org, dan.carpenter@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 3:27=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
>
> Using a modulo operation with `4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the sequence
> number cycles though a range of 4096 values.
>
> The use of `4096u` also guarantees that the modulo operation is performed
> with unsigned arithmetic, preventing potential issues with signed types.

Also there are a couple of important things about modulo vs. AND:

The modulo use for wrapping around is making code robust against
potential changes of the upper range, especially when it becomes
non-power-of-2 value, the AND works solely for power-of-2 values. The
modulo in case of power-of-2 is optimised by the compiler to the same
or equivalent code.

> Suggested-by: Andy Shevchenko <andy@kernel.org>
> David Laight <david.laight.linux@gmail.com>

Not sure what tag David's name is meant for.

>

This blank line shouldn't be here. It's a tag block where we don't put
blank lines.

> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
