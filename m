Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3222256E;
	Tue, 15 Apr 2025 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738209; cv=none; b=Dj9ywcZTN2FhjOsWQp9j+wvQbCoTtbfSvAL9mNwJ4FM7tHHFGFxAfmMj7FjTHsbWwSFyPWAPqFo7av5x8pl4ySFSvxsol2jWuSYdItnk1+Ywqs+2EKpDx6vUv5Ww/zoklyMQ/FBrkfC968NaSSNHlhZ0AMaXOyreedTj2RxLqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738209; c=relaxed/simple;
	bh=GYW2X8FQOVtwK7x6XyjPOY0TPOt+vwaoQKbnExVr3jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3o1wppNQAIh1EmgF6oTOjrSV59LCjfILONKqhg5g2tTS5t/YtvXXTf62y5I0KlIzxLoxgdLOcBC65pUrOAG83pXsXdIU75ohBWY4cHGT4nYEg0cbt9SxyZnKY3phVV1fHKRHiHZK1YAgx5ZToOUBLhkZ94AmhXuqs6KFC4zpKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv+xMQSF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv+xMQSF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22792ef6215so7993245ad.2;
        Tue, 15 Apr 2025 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744738207; x=1745343007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Js5M+95wLTneRomTBU32Yp3P2fILyuAwj0B/Yofyb0=;
        b=Pv+xMQSFbEh8f/IfRJQhdVNDCXv2S3Hp3ktSVUCYKsgdzacDJZ+grNr8OkllRHLuBX
         6qlSjq6r7Cq4UXePE9T2YnaW3Yock1/oHsZR5Hqltlpip7wa68WvxlFYTPvgJ1oLmWV5
         oHpvkJVamldOMNabe2o7KhrZRHMjKoQW+9cDIOlRMitsoKLzKR7I8rICIH13H59Ovc++
         15GHJxLH9wuWdyDz+J4bIMYNdzwfgYNKa7Wal7tO2FIjdbLS8w8t/NLsLbbonmnMYbAm
         JErIEWV8LHXiyEOFreuCze/ILzy7DOjR2QBJnL91Meqdx9Dsrn4YxKbBFdcjPtScf4nO
         lq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738207; x=1745343007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Js5M+95wLTneRomTBU32Yp3P2fILyuAwj0B/Yofyb0=;
        b=AM/URYEuzPfVqJY8ZfJq1OqUWl7gOxmWFr7A8EAxhPvx+lvDiN4HkEbNp8hI8+BiYk
         8MBxtgW8d0VjlKhHHME2On0c+qVLHZjDGnI5szE/0vxOfQTZmQQvlPo8pPiNzszydJAC
         ICdnxd0M8g8BS6hKfwIFnHN+SnKUtd8LkItlVYNoU3xeqm+GQFmwSDbrEaAEcnRuDHBE
         A0ZPcjRL6vmcRb7BXIhyTnCyRLMFgJs9rbA3ZD3j3aPu0bK0VkX9B+PE5UhWj22dE/oR
         IAuzrG7Y8HzCx77XLPxdgn1MVW21eyMqgHaIpqPCX/kYJuXstU4AIeEFRAKh3hpVURTG
         EAsA==
X-Forwarded-Encrypted: i=1; AJvYcCWYFHX4k3XM+eXiHgpZk2nfN+BX7ex1L7zHHC9dh52MZS3SBtu6f5Sef4TATAbO7D4A+//yJkm/LNmRgyM=@vger.kernel.org, AJvYcCWfvle+raJPiVDAN2Wpa2XA0xfjcvliChdfS7OwTCsZXnu9WlmdIJll3Tbr95v8WgX/OVbBIapVH18LRFLH+l4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydt+aOkcOvWK48+Wupqy/dMHd3iVBusls4/EjTgbYTkkYhVk7a
	5DqUgCqKcwY8gNs9oP0Xd73mU/nxTZU1MivMkvzJZsXCVOoN20Q1UqvSteQQEuXeEOtF18WtPXP
	ai1IFDqUKHzNowHRVTHO/GXFvdLiKdZtoTCVXOw==
X-Gm-Gg: ASbGncvz7H6ekv8bY7ql+S8JHWykXXnDcvWPWC7079oukbbVHxEfsiwuM0JJDD+ggIH
	y7CYkKV5lYtahchksBNSizzG2vIxhzRHPQX/YsWhvADVlj2BV9a+on9BM9Z9k36Cdz7QfBwxbpF
	+tx8VlOsRzQsmzDhq7GoWagQ==
X-Google-Smtp-Source: AGHT+IF86/W5joyNhnMKEOp6FpUc1iEdUNMAZtE7UId0k2IgQ1cdYhnfxa5fKD6bVVMc42q5MQVfnb/y9HWpGm6PJeU=
X-Received: by 2002:a17:903:2282:b0:224:1579:b347 with SMTP id
 d9443c01a7336-22bea4c6a86mr93429145ad.7.1744738207158; Tue, 15 Apr 2025
 10:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412005341.157150-1-fujita.tomonori@gmail.com>
 <CANiq72=Grg+T-c0+TxcyubHj4kvHPQKiVm3AZp5DgeUVXsitEQ@mail.gmail.com> <0c844b70-19c7-4b14-ba29-fc99ae0d69f0@app.fastmail.com>
In-Reply-To: <0c844b70-19c7-4b14-ba29-fc99ae0d69f0@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 19:29:54 +0200
X-Gm-Features: ATxdqUGlMo9mwnVK9FU0IkQMA7-diVybbG5Se3U2h-rLaU0Lq9-uXtFdgpVIojY
Message-ID: <CANiq72mLAMQ8T7qK738SKRKUrywxwE4xYdtLrYfL49-TKO-qnA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: helpers: Remove volatile qualifier from io helpers
To: Arnd Bergmann <arnd@arndb.de>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Geert Uytterhoeven <geert@linux-m68k.org>, logang@deltatee.com, 
	Stephen Bates <sbates@raithlin.com>, Danilo Krummrich <dakr@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:54=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> Rihgt, I tried this last week when it came up first, removing the
> 'volatile' annotations in the asm-generic/io.h header and then
> all the ones that caused build regressions on arm/arm64/x86
> randconfig and allmodconfig builds.  This patch is a little
> longer than my original version as I did run into a few
> regressions later.
>
> As far as I can tell, none of these volatile annotations have
> any actual effect, and most of them date back to ancient kernels
> where this may have been required.
>
> Leaving it out of the rust interface is clearly the right way,
> and it shouldn't be too hard to upstream the changes below
> when we need to, but I also don't see any priority to send these.
> If anyone wants to help out, I can send them the whole patch.

Thanks a lot Arnd -- then let's go without them on the Rust side. I
will pick it as a fix.

I added an issue in case someone wants to help:

    https://github.com/Rust-for-Linux/linux/issues/1156

Cheers,
Miguel
