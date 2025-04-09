Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8021DA61B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233679; cv=none; b=PncFtGAZe8fOFCJI3lvkojVHKfKxe8BHyiX0YP3iAhqSzD52Hh5RNKiG43WZ20dCiTb2qnqxYYSyTypLQ8qhlb91NM9c1iDHh/BNIxBYPPupy2N8UKAfDeo65d2Hi1WM4eiV+7Bez3Ax09g6TassJIhETTF9qNRcQ3Gm/kNPYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233679; c=relaxed/simple;
	bh=JctmxEqORIs/qobly8TAxYS65hZ+r3fxmrYpUoOy4no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWa4/r+JkuZ2u/gneJaeJFRfE8epf2ftbqP0B+JxBus7u5mfprYDvODmjLOg4ibFqP22obglwSA0RViF1HrxfRSVFHH3afxVmJikP+0f42uasU0OSrt9ack/7kpSHIEiP0thw3pjgem1D2INSvzVOUVL9mcMO+pXBrF5t5GJIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QP2YPL6w; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QP2YPL6w"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so347239a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744233674; x=1744838474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=buPe9q2pIFl1+XWfQxs4eptqi71z7xZe6Y0D7OVnE/8=;
        b=QP2YPL6wSrmypHamoQzDI8t7QNnnS3pumze9fFnpTMsNsCZTMJ0XtsMLIrPeCaxI0G
         IM6lezOM4OY9c2ye6tzoXIWCoMytcT8OZBT9N/sAanUCzI7ozxJdaawDNKK2g+PKNK19
         7SkMkVuiSbTi6S3IgInBAT351DtvgQDWyLblc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233674; x=1744838474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buPe9q2pIFl1+XWfQxs4eptqi71z7xZe6Y0D7OVnE/8=;
        b=n2qaHxS+RRXFdPK/SUG7YgPHaQcXrcdInqDJbmuhhZqq8K8Qz3XLZ0jwUtnVu3/nxu
         3I/0tsw7hnLhm0QgpLrJ6hW2Q53QYU3RiHe1vQY6kPrB39NPXwZrVh7PxpwnC2mbihb+
         Aumv1xo0yG5dKjAEojQOVFd+KsEVlHdBzZLa5Xx9wodNOCgV683ijUiTJmyNVcUlD8/k
         oZVkT1E/qBPvkBtf0V36Q7uI6x2fs6AxlHwb2yLucFmrpTTajjXWZ8D1psd2MF6bRD5Q
         bzhdABgeCfCHn9GmSPo1rsPaQHYYsbdHqMKxnKVzC6Dnk+pxyoqozkdivkgoA0OAHSBd
         ws3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtyIVU62Fjqlx2wo7qrsygnau2yZC8bd1jSILC9Ky3QgugxgdiFh6Tv0v1/ic4wYarKNwGDM7uugILaN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsI7pP51pOyQDkqJ89RJY0gB5p0eZanFG5KdRScbsAz24zzrB
	eDtKZ117hY26zavB4w5czkWn1gYueUtbmkd8+EzeaneCjSq9/KBVFgz2G8iPgJGW0lhUfTgkiyI
	Ab38=
X-Gm-Gg: ASbGncsJLOm+1XitkdETs7yf/8lzjLT/KsJz5jdlyhg42i8TfUxWk8iNQg528IXrf/D
	o07o+WRoy+tcgs4mxGJcs6j1L8MnguUaVZDhSuZhHoC+eoujMS2LHaQkDXZVyhH90cIDPecpI18
	Qu19wfkNryCJHI3k90pqjPWp1RAZA6FjRVvyBt5q9vkmZ0ueq5D5DTdgon58GHkIkT3VYvKLJlM
	uiUJqamSOTDJapDV11ge4K5xQ63yQEALuYytGTCVu7aN+7F564DwYZOimQBWDOYzQ4PyrHAhr0D
	eOUlDcZS2zPMfebyADmwXfzLaTT0fQrux1NpHsNXdz68nt/B1zBbGLEKTHdofOciIGEfzbjhwai
	wBuCu2xtzJQmUz4exB6AKVT7HZQ==
X-Google-Smtp-Source: AGHT+IF8hNYul/+3vTlO9ZRfAODl8uwFsZtRy+PalT8MwFPOgz3KdG/aANB7QnwSFSm488p2lNpYXg==
X-Received: by 2002:a05:6402:354c:b0:5e0:8840:5032 with SMTP id 4fb4d7f45d1cf-5f329f7d855mr234204a12.3.1744233673957;
        Wed, 09 Apr 2025 14:21:13 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbbac7efsm1317004a12.4.2025.04.09.14.21.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 14:21:12 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac7bd86f637so237043566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIuJEs6UkrLiJ5qBr1NPkw9A+M5FOv5p3kSf8sozE8xcxcPSi0hEXNBunj4KXD6AIItl44eR+HJZSkE20=@vger.kernel.org
X-Received: by 2002:a17:907:3e03:b0:ac4:3d0:8bca with SMTP id
 a640c23a62f3a-acabd3d0008mr15534666b.29.1744233672221; Wed, 09 Apr 2025
 14:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744098446.git.jpoimboe@kernel.org> <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
 <20250409143821.GE9833@noisy.programming.kicks-ass.net> <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
 <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com> <qik3dltarxj5trsbgzoifhf545nss4vwnabhql7i2b7qiowq52@y3d5pirwd4ni>
In-Reply-To: <qik3dltarxj5trsbgzoifhf545nss4vwnabhql7i2b7qiowq52@y3d5pirwd4ni>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Apr 2025 14:20:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiL8J8v3+XKJGM4Ro83UqJTh7q0GD9UUYrDnwx24jR83A@mail.gmail.com>
X-Gm-Features: ATxdqUEBdx-85Mkx0CMFS-itK6BiScBBS7fXJDNR22U3-XpHuoRmmUR6hSViEGM
Message-ID: <CAHk-=wiL8J8v3+XKJGM4Ro83UqJTh7q0GD9UUYrDnwx24jR83A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation readability
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 12:51, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> What if we were to use a global asm() to define an alternative .macro
> whenever "alternative.h" gets included?

Yeah, I wouldn't mind that, but I have this dim memory of us having
tried it at some point and it didn't work.

I think the issue was that the in-compiler assembler was not as
complete as the external one (ie not doing macros at all or something
like that).

             Linus
