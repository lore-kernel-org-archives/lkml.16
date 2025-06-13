Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A62E11BF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822672; cv=none; b=UCa4sGzcJKJ540lUFNhQsAeRQrOHPbDQidqVVagP3AYZ7KH2bvyBtca7Hl/ok7iLA21H1cWLXHh0qcl3SUyjZc9iBmBWAXINWLGpxHqpz3Ef2JH9LsSTkv7yrPRP2CITGxoBLT76WNF8jZ4Kz7hynWaH6oNeQ8hZGIqCS7JKQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822672; c=relaxed/simple;
	bh=uhAeS2/IvRl+3Bzj9D4bvlYHg9ng/8TcHwD+T7mUEOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYcy1SaIx4tMftkSmSP1fXtN6y7dNnsbGROCmF6FR0g7vV2dEZQVkYPMHDlW97atTof6pL7fp4xuS5NEn9+e/0XLzz+7Qw0i84i7eFqdyojQajYTpwoyYiSF+PeMUjHcQCx/XDwTJLAi2O1Q6YT4aH1htfJXz17EiWKkiiH7XUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=huqrzQs8; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="huqrzQs8"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a58b120bedso24886511cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749822669; x=1750427469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhAeS2/IvRl+3Bzj9D4bvlYHg9ng/8TcHwD+T7mUEOQ=;
        b=huqrzQs87Z28MSP/P7C7S/+f6Ra/WHAhh7ivKjzQQMXNvcjgZ6EJ6QJLC9PklLdUo+
         GUD+hXWAcEk33Kq3/tnuaqS8ud2jcNA+3MeBtKR6pBdYKQjk6ndiB31TOQALb4XuUi+l
         7CZB0TkgzD7GpvuOEy3fP1vLQl1YuvHFpuj+dvh3up9YLNB96EQtls4RYvoZucAHGiQ8
         6Lo7rtCbmP18tZ/uA+88LKGWLIu7lT/ds5LJH+9MfuppjIfjFAykXtYxZHBKH61ofxvi
         +hxQ4aUsA+BZAL0rp1SLDzSxcnFF3qOH/HWPda67jVpPNUyyYiTXilcVWLOme8xDkc8U
         Q2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822669; x=1750427469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhAeS2/IvRl+3Bzj9D4bvlYHg9ng/8TcHwD+T7mUEOQ=;
        b=Q8ZGoplGHJR/Jn0H00LPhc1BAN6Y/odrBT/ybB+t1JK97OEsKCyz4aFGMMIaUtpzYe
         bT9Rj393vC1f5NE5cpmQ6Non17r4ynUgoG4lv6hY5Hs2gAGPI7ago1WUB/tPscIyuZb0
         NSmB1/YYOw7DgANxWYbZpwGnxY+VbFGkevu+9Vsug9/kR/bt6bCsuZXLFw2SiUfITUuT
         2HGb7GmXMAvpEhfrTm8vLdrh1QIYmHanKRWfi9K3jJGkOSVCHjP8xUscshq+Zb2LaL8y
         Y7XB9snvscKGHx+yZxffxgg95VHTnW8e+/6VLewPI5O5hrlvFZk2MpejT7SkPuOecQe/
         eVUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5+jqQ8zc++DFcGAcHJ/QqPsScor/4L3oIf1fjkmbwi4RHgeXvfBhntBhzo3PwatwlNjEB6ig2uatmcIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSirFKyyPCCdfMwqueudL5EAyMNJG2CMqCBG4x6tYwgYBVAjY
	IJMeLlRrC8Pdh5+ZeOoHhB8k608X42CevPUFdDKB+kmgAlJDJ230v4PAmT7s6SOk1DQG8d5pm1c
	LKoyUM99Gz181GJ8nycTWSn3c8+MDJXhTR772DQszXQ==
X-Gm-Gg: ASbGncvNJTC8SIcZpjmYtg/e2e4VfB9jSZYdIFsi9+HCMsQrDd5ZP+CzaSCigEcV+M0
	Usz4hhvKjPFsFcbZVKc/d1TaXMSpnln4yhU/CF9ZRQ0MR1wncjjQh/ov6cDKzc26FClb7mapOwH
	rggeKEJQ+IsA6NxaGh3PTZcxrHLrQX9dmSh92ZPwfE
X-Google-Smtp-Source: AGHT+IFYcaXWQwJ8CBpk9W1pt46Bf4+vPWaFiVIFLbCoUB7H481bLuHjLj5oM5Papt7OZLf3AWNII0ghPNALr5CtPag=
X-Received: by 2002:a05:622a:1f8a:b0:4a4:30e7:77a with SMTP id
 d75a77b69052e-4a72fed8a6fmr52111111cf.15.1749822669449; Fri, 13 Jun 2025
 06:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613131917.4488-1-pratyush@kernel.org>
In-Reply-To: <20250613131917.4488-1-pratyush@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 13 Jun 2025 09:50:32 -0400
X-Gm-Features: AX0GCFvePpc0ixNyG8y1MRzHM9QVpjSrRM-vz2PlJH3pXBP9NTCDv51Jt8TZsu4
Message-ID: <CA+CK2bD_+0a_Z9R+0O9ZCc-30PP4U9rbxXVaenx=S2r3W1kV0w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add linux-mm@ list to Kexec Handover
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Pratyush Yadav <ptyadav@amazon.de>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 9:19=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> From: Pratyush Yadav <ptyadav@amazon.de>
>
> Along with kexec, KHO also has parts dealing with memory management,
> like page/folio initialization, memblock, and preserving/unpreserving
> memory for next kernel. Copy linux-mm@ to KHO patches so the right set
> of eyes can look at changes to those parts.
>
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Pasha
