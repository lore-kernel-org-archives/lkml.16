Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ADE22ACE3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127076; cv=none; b=WPxdleYcGNnXc9O1umAbgzdjQdvcVSbGfiMxhNN+7s/+jwNKyeDVPhd5vFcvglMs2Eh/DjILow9944IJOB7yWTwjJMdWNJJG+Zn7ENS4flixVwIgf35qRz+gKNz/vQeVK8cHJrlbkqJ+WOfyc7h6W8llQBMJJUWQlrDW4J6tuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127076; c=relaxed/simple;
	bh=K5G2ZwYExtfm1cVAQRkf9bRTo5tSCqqa0BaWlL4b0yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXCoPS0VRwGcek0uwnTi4nchk0FtzCLjJ2HTYudhxTAunfLNYJjgakc0jEQGnQ1JYF9QVeohytiw1I2tYSe+Z6d5V/0jW/3IwhtbRSsXz7stXjYwaivgfHxgZ4v4AhA7bI6mKiEhYsv39FMqC/wzgM+6cVCTnr8PjDDjQOAin8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhsCs2J3; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhsCs2J3"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5259331b31eso2684219e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127073; x=1744731873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5G2ZwYExtfm1cVAQRkf9bRTo5tSCqqa0BaWlL4b0yM=;
        b=lhsCs2J3gOyhayGbJJCr5daX8DGMpL/PpE6juWE9N7TiUDLu/agnvLUcPrEgRTRH94
         2O6dFCsvAgmK6qTTjUBev7I5N+OX5QADs/KXQI+u5B4fNB1l2BMKZWqKRfwUKIrc89U6
         EG30ZqkMPkIr+1dPzaoccueNqSuPjdmXLWxTSjH6L7tiNUhEzJh8D7E0HfB6ZHumj1x+
         EfWxDwyfY+jraO0Gt5B8DgJN3ySOqPj122cyZLxV0t+lgt7WZti0xkp5jYkZAyR9k8bp
         4Ywg+PVz810RPg8TFZKwms2AoXmYxfspEYT9uUXvG5DWBOGJCYOcLpK1kH8JwtWv1T8V
         7hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127073; x=1744731873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5G2ZwYExtfm1cVAQRkf9bRTo5tSCqqa0BaWlL4b0yM=;
        b=Z+wdJKM7+TC1bYj+DYE4u/um+mpXaxd5u96zyJ+ychzVUAk28PaqiD8EFDLClqZ55k
         er+bWefnoftjwhYVzs0GE4EM6/I8AM+LseOpSOgCZ5u1uXedz9/zxWBPpUCM+jfw3dUU
         hXk0Vx75qKXRQRBgs5/aNkTIenYWzI2XQlu1HlUq5dHoKhA6e2g/gw1o629k4fmYUh8U
         hAFgHcC/znhzqKwvutuvX0K1CBCWRZxUbNuyMnKHiL3c4tYpa5PTOFHrtN0Cm3jZD8EH
         CNrGaHDcswMYhKMaga4x1tKhPEYcuxst0WfZxM2+zOybqW+y8Q18/BMG40hUpAzQoF14
         wQlg==
X-Forwarded-Encrypted: i=1; AJvYcCXMblHH8Wh9IXMVILH6C2gKilO/B0PBjRzvq1+MVb0FtxBwC54yENRVdDQHxYPy5rAsN2reWKA+N3u3hEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ZZp1uGXL2hyaJzq61FIrnhS/1DqVQroWZHbS4HQl2xcLa2bR
	9shVNrUXidYJMyjo8yRmEVPvXiFSgoAJQrbG88NngVnA6aNThpWSVkG5KKdnbD30yD90E0zkvai
	8Ibf2NqaDf2p6ctI97lQ5HE/PkRc=
X-Gm-Gg: ASbGnctOBJ7CEhghTEhKeGZ5eI6K9kJ1hEgvBNRpsN3QuXePukoJQDu+jCCsY0Ypb51
	90sfaZa5DgYnBHKOdoOyPSDwCjYJBI/C2Sf22/W5jFVznet05zhBQ1rvguIlhryqdlmt/mfzTy7
	mu+1qBTS/8p9Nkljmsxj2nt1PAPA==
X-Google-Smtp-Source: AGHT+IEOAhODFXCQCQCyky6pL+wFmfnADJsayHXZE3pW2I0MMTvuO6cpstPg2O9EQVXHQS/6scTNoBoqj0OUtwsn1mE=
X-Received: by 2002:a05:6122:1daa:b0:51f:3eee:89f2 with SMTP id
 71dfb90a1353d-52765c2973fmr10907463e0c.2.1744127073729; Tue, 08 Apr 2025
 08:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
 <c71ec1f13a2a5cc38a745314f134f6e7eb935227.1744117091.git.abrahamadekunle50@gmail.com>
 <Z_U2ohN4wbbOtepn@smile.fi.intel.com>
In-Reply-To: <Z_U2ohN4wbbOtepn@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 16:44:24 +0100
X-Gm-Features: ATxdqUHHI5EBrUMCMRukwAxv7kKLnF4ZevAVt444jh7qUnEHaPD1eIkis-CJSoA
Message-ID: <CADYq+fZFRF5SLLyfG12hUJLjNk+njWyC6H34S_warp61zYv8wQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 4:12=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Tue, Apr 08, 2025 at 01:31:42PM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
>
> power-of-2
>
> > the AND(&) works solely for power of 2 values.
>
> power-of-2
>
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you, Andy for your patience with me and guidance and the review.

I have sent the updated patch.

Adekunle.
