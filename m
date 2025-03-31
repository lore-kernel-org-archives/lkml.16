Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56326213E83
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437547; cv=none; b=STsJAA9R0Kjlrd8wON52f+kqmBgyUbqv+ihzSwyhPKNYaUhKbfb/utQ5DwcHVEYKRD+mby9w0Z3AHEJcbY2fiteVomr5CdxjYpO5n6R9fZ2fNA4Rs6LLFAR824C5GW4DTkHkh6JS3UA5E0b7R5YGPh7Q6CzRZsSY7e5I0u6Hgos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437547; c=relaxed/simple;
	bh=an1+g/h3bnaPeIBepE6aMJ/6ukgx++5dzCS3i3DiqDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEt0VRoM2HnLay6ZHJ0Vn0T9uSjwKO/rSADKCFRZ08MTnlpGReU9VUwQPhOIGkr4IiU3SfVJa/bIJmzF4nKhI1jxqQr1vtXCdjqh8pWnsobmCuVQ0PhEXKxnl1ELG8rG3ivS2Ks2fHDXm5n40+5Mgiy7r18FWLH7980rrKKIQ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W2zaazU2; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W2zaazU2"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d5bc35ed3aso577725ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743437545; x=1744042345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an1+g/h3bnaPeIBepE6aMJ/6ukgx++5dzCS3i3DiqDU=;
        b=W2zaazU2qTKxCwXisZL/xY9mDKvOZ+06dsud+XxJ0GnPr8G0EscyngW6xMOeLe3EM7
         B2aBKbl0VdZo7ZIM4JiLlycGF13qgpEXsbRrdQh1rYCAKgA9NvPKp5v9VeqPP1hLJgaQ
         j5env/gxeZXe4U4J0AL6cPB5r7I2tZWZpKuKr4y5/qVSnIsr6y0ndHplEHUZ2tcPojMw
         3IkvN3w37MouiYFz0nn1lOT8LiENQlaWe8MUr7zguBCNGybf77WqWc2XdZ6R6tzN8Min
         YV/EPI3oXVKi2+qImQDMkbG2hrdNzTBrlTFSymtGaZWZmYy2AYNofeH13D/FUNQ7kfgG
         0g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437545; x=1744042345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=an1+g/h3bnaPeIBepE6aMJ/6ukgx++5dzCS3i3DiqDU=;
        b=SBnktcjOMozO4/R4MPoog4wiDk0VvSA1suI2aTYYjEI7df8nXo0rbDWDi4lweMN5hv
         F9B/6JzkytsDq+ZPlbZ9vSKyeKLWDt7PDRRdnk87AxuISa//m9nCvZfJdADAD/qegy+4
         H/oUOtE/hyS/SPAqHD9DIVEV4SKcrXtNzm81psoCRhlJV8gydItzfVZtgef5EbTkz6zQ
         0DVwkZMfO4MXkOoQRL3zK8Xim46ueFddv9YDegnI1qvf/3oV5S3uVSgAqYRFDlFKE2NK
         z5BPAbGpj5YJ00+t3hpUP7joUURvtq8Mjm+cKgmHjvP2Yz4vwVADM+zL++i+np0Q3L3k
         LxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMeAxJDHToNacBfiekjJI3XhZ2/7mo73oqpDUVSt5atfyLL9AWLH5xReS6rzSqHuiEPLdyx0pB1ulIPQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc75bzMxTfAK+Av7d9DQuod6Xs9R891wi7uYEkGQcHzKsgvPWp
	YZLYbb1mDqJX5oHHyPBhQ7r7cSapHAnAxlRbMXmjIWQyLXJNp4g1BWc1XXlWu+SGgRaAYA07mk1
	KcMmFMy/YlVTQQrQCxmjKt49vNvxLi7ND+S1K
X-Gm-Gg: ASbGncuxMlvK0STaY3JhpbOfbZ0Qlq0kFEytDbexUhr+FltBtDE4mUe3kBgZ6dhOfyN
	KHrH1jMOl4N7yQvuYiFSONUvEdHMZ/Gx/A1cT59OIgCx3v/wbm6LNc5EcRMzzV0aX9UKhCROwYo
	yWKl/P+dlzgSIjObuOQ0GcBsdKCkY=
X-Google-Smtp-Source: AGHT+IHkkrnJidXNy1ORXW0y5wmiSeC6Z+atM6xwCyKPc4zUkW9tuui2BDyeFn4t44wEgufSUXTW6I8SJc78PrrsIxo=
X-Received: by 2002:a05:6e02:2386:b0:3d3:cd81:e7c5 with SMTP id
 e9e14a558f8ab-3d5e0f479a7mr7942495ab.8.1743437545077; Mon, 31 Mar 2025
 09:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324065328.107678-1-avagin@google.com> <7263e869-d733-44f4-bd2b-9c6f89202909@lucifer.local>
In-Reply-To: <7263e869-d733-44f4-bd2b-9c6f89202909@lucifer.local>
From: Andrei Vagin <avagin@google.com>
Date: Mon, 31 Mar 2025 09:12:14 -0700
X-Gm-Features: AQ5f1JpNhLVBHOZ1scUgN574PAKvq55Nm3GTeM5MgiHWALnnJEtPRQSdKckpLU8
Message-ID: <CAEWA0a6KdODW2hD3G0PO+yUFC4rZCaTGU_orC3CAuHXRXoqREQ@mail.gmail.com>
Subject: Re: [PATCH 0/3 v2] fs/proc: extend the PAGEMAP_SCAN ioctl to report
 guard regions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	criu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:26=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Mar 24, 2025 at 06:53:25AM +0000, Andrei Vagin wrote:
> > Introduce the PAGE_IS_GUARD flag in the PAGEMAP_SCAN ioctl to expose
> > information about guard regions. This allows userspace tools, such as
> > CRIU, to detect and handle guard regions.
> >
> > Currently, CRIU utilizes PAGEMAP_SCAN as a more efficient alternative t=
o
> > parsing /proc/pid/pagemap. Without this change, guard regions are
> > incorrectly reported as swap-anon regions, leading CRIU to attempt
> > dumping them and subsequently failing.
> >
> > This series should be applied on top of "[PATCH 0/2] fs/proc/task_mmu:
> > add guard region bit to pagemap":
> > https://lore.kernel.org/all/2025031926-engraved-footer-3e9b@gregkh/T/
> >
> > The series includes updates to the documentation and selftests to
> > reflect the new functionality.
> >
> > v2:
> > - sync linux/fs.h with the kernel sources
> > - address comments from Lorenzo and David.
>
> Thanks, sorry for delay, LSF/MM/BPF is why :)

Yep, I know. I hope it was productive. You mentioned in another thread that
you are going to handle compatibility for the older kernel. Let me know if =
I can
help with anything.

Thanks for your cooperation.
