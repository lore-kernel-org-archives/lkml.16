Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8977627A915
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151844; cv=none; b=I0DkTTy47w1bS7I+wcAnk3H7AbBg8sEn5otox4VEew5pjzFKsHv42XoBwZhbFywdTmf+88Q2YYcIThgngUyV7khNVQhp+fYpHl0Zu8obQr4bukM4TLgRexmG8OaGIixDR32g+nmRos0c6oIfEyvDqSnj8gX/wMYVN+vTG00JY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151844; c=relaxed/simple;
	bh=KEh1yiVEKNTX4q4ml5ZgM4snH34x3J3VViEJQ8GPrQc=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=AL8/X9UPZ7slj7kIutGayf1DtS9b8tWUfrsl/Cdcr61+04tKqbYwqgzQaBp+jH6poYh7jvaXFlOeG7PK9tqOb40Kob/2sfuVkM/NZA+C7sn92OjoKqK02Xq0ArRIdCGtzTkRHUNK2y5Q2XIFR77FXKXBNfZIFRSOUVXaptIyzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=pYV2TFa+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="pYV2TFa+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235a3dd4f0dso10179465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749151842; x=1749756642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jROYtYTPQvilvpyW4Qe3eC5Eh/PZAY7qm3rDeIniogg=;
        b=pYV2TFa+KuntgRgLGdhU+wd3zyzWmf7GAziZ76YzLHq1QJUROFaCjRwt7oITj9/Gfo
         M66HYIIJFvFwZYA0WrpmwmCj34LEgl7IXQDvm8TnIAFUvyeQhGk+UQXxvKI8GKrydTnO
         9OUc2S0KWDVJPU5PxMndBgBLPuK2v35t6HufGTnr9tvashkiD+1xvtTFGEWUN7LFMY77
         6PAJg+AMbc8VmEGH0njnQHYhd0ErB2tEB5AbFvKQsT9IWfwXUtN8E6E81VFzPm+HTGWx
         hxKt/VAs3X5RingTYZicrtlvbCRaNYOjUZQFkiFFkHGGfqrT8ZAjfUVF7hfI58Cp8T52
         QDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151842; x=1749756642;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jROYtYTPQvilvpyW4Qe3eC5Eh/PZAY7qm3rDeIniogg=;
        b=QCluQtulK0SSRo5JgM0Pa4ycLUoFDDP38ELsl+6PoZt2Zn6yd1waVpPmqt4St0+Mu0
         jYx+ruy0ZqqsYH8SQpeHWYgKYPdul3L90PGVV8HiAsWeVhtdOiWyki40w9228yYy054x
         mufcbRbYF7X/O4QxSiTqcWFry2guncAWfssxsEAVbbvY/ZXd+vCjqVs1qcZkqSV1l6B0
         6+MUwRJEEfNhm+lu9CU9V3MaJJhqJTJqLW3tvWTnXBodBs6lr4YMm/cMctB4tYiXFQu+
         d0UuBRH+Zpi5qWnQ3s51w2E8BN0MyW9XQ+HEq2AjwNi0dL35HNePp7EzATz2UAXWcCaa
         D62g==
X-Forwarded-Encrypted: i=1; AJvYcCVD1uyOCbnSdFBmNp3woDC+hy9pNY/Nzm943fnll7r8AAH+0V/wU59DzLYUyNdvEBLwQYjkC7k9Y46IfJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNv820O650JzISnlxFgU9N/O6LjeXka40s+O+2T2osDGgdoIxa
	i3pKWJV8QrEUKxffHnYbwGAXOzoOnixK/4bJda5ycapmaaK8VGzYc5QqaZjB+KHSb1Q=
X-Gm-Gg: ASbGnctivBfNrLQ6EZPGpMfHe0cpGAf0GIpAL00oZsMWlpnI/nWaAJe4hUixLQysyvP
	Tl4cX6BzRR5PzzYlLYVb/+//qUGjmOAcEx1y0PGVOw3UlaHSqq8ssV+BUJYv+/VgTVxc3cIzoCO
	XGhnViuju8czLGjv6gsUnouvgDStw7Q2SbIXfhL0xBtQlLvd6e4PYJfpv9c/ZF/qIvzxnyCANaS
	dNKTnEJZq4DAWGGxSPP7uuFQFEccUrFEPvcRK6e3vow5oDmM+oCKhq0wDXsBEVtKgaGE5sckq7B
	pSOw4PQ+2rfb+MVJ1qTGvq22rU+nnDfrCkUwLE56NLMi9k2G6bbIW2HYoLSVcMn7iw==
X-Google-Smtp-Source: AGHT+IFg/aVzzdMBcl7ReG3/5sPCFFbOq6UBzqC3+N+7F+KKqtZIyk6WWy/cn5IsLDoKduJNoilMEQ==
X-Received: by 2002:a17:903:1446:b0:220:ea90:191e with SMTP id d9443c01a7336-23601e21de2mr7806635ad.4.1749151841684;
        Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8480])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23506cd7623sm123248095ad.114.2025.06.05.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
Date: Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Jun 2025 12:30:37 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v tree
In-Reply-To: <CAHVXubicfhkX15S=fSo2yQcSCUmA57cJATk6=ayy5OCWvRx0MA@mail.gmail.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>,
  cyrilbur@tenstorrent.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-0BFF3412-041F-491C-BFDA-D83B5213E1D5@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 05 Jun 2025 10:08:15 PDT (-0700), alexghiti@rivosinc.com wrote:
> On Thu, Jun 5, 2025 at 6:23 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > In commit
>> >
>> >   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
>> >
>> > Fixes tag
>> >
>> >   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
>> >
>> > has these problem(s):
>> >
>> >   - Target SHA1 does not exist
>> >
>> > Maybe you meant
>> >
>> > Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
>> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
>> > or
>> > Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
>> >
>> > (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)
>>
>> Ya, thanks.  Something's gone way off the rails here, let me try to
>> figure it out...
>
> I expected to send this fix (along with other fixes) next week, after
> the -rc1 was released, with the proper fixes tag, so maybe Palmer you
> can just drop it?

The actual problem is that you've got some sort of rebasing going on, 
which is causing duplicate patches.  We just got lucky and this Fixes 
checked happened to stumble on it, but there's a bunch of these.

I'm going through and rebasing your PRs to try and get it cleaned up, 
but next week we should talk about some workflow stuff because something 
is wrong.

>
>>
>> > --
>> > Cheers,
>> > Stephen Rothwell
