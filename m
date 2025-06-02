Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A11FF61E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876568; cv=none; b=OzcZ7L6L3/Qpa2w0JjTH6OxBMwFeewKzIF5pjmxHfOHQdPpsQu6aZXPhnU/arpprx3DJcW5Ur9qjm6+o4PjHB9JKycZAC+/dQRdya34EK81NrqjuKRHHhL28/a/OTnGzOCFGr+lpWV740bHTNgXho6rmICanFFwf41dl/xeeiYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876568; c=relaxed/simple;
	bh=8xh4Wdfx0IrBIANNQwP1lqmb4pcov9CSoSmBDHrPf14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLJrWVTY3JMzUv6i4s09+Glj8c5yPR3+zaFcBuuAWfuvPlZPiO8pliH9o6iZRQhZoNr4RHVYj8IknWX4QN4mwbvmkci4TVyvrVEX4jWG4GsE0GYtQHKHdxM+4VX0A2IsEZG5cNAs9+meWtmhg38/VJ+E7HdthkpAm27qcqXsoYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Deriqo+G; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Deriqo+G"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad89d8a270fso1158505566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748876564; x=1749481364; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i5WbDaBctDC5jJrSvPrQ0RBIPnx7rY0yvfszp3NiWH8=;
        b=Deriqo+GfaHoFbIeHAHpA48UTL6i5YNuF7TXghaJLJObkvDPwKMdqiP45fF+GFl17b
         t3D4Ntw6sNdv4uo4uwL+rcFswT1Dnd4L0sSzb2MP4whvd/mCVZqMbtsdztBjSWz5EJCP
         BQ/dpvK4JH/5cpe4/vEl3UbEZUEzBq5gTR1Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748876564; x=1749481364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5WbDaBctDC5jJrSvPrQ0RBIPnx7rY0yvfszp3NiWH8=;
        b=jFn6yZLq/3QxyUtpkAFfTppPpHmJnRHnaqQUwnOYkLWWxxgKb7GPVwBb3WV3uDFf9/
         WOjBchRtSUg5IHZurdcCX20lMOtdF794PNnrSDw8G0SDg5S3VZIeOVfsKsGQ60hjYLXC
         1Ebs3ocPznM73iAn06DnY+3YnJvcUcEYBKRlmUKMkEbDEXXzp6ETQjSWCl7Oqho7kc6s
         JnRVxfNTKq4kvUI0Vo0YUab6GhDgDOZHn6T7X5A/iGlp7NHqTOlO0hD/fuaVqEzO8dNm
         9QUutRw0Ax6Val6Tuw24cU5u6m5innP76/DPj+8iiBeYFAAvSqCW2+WBljgY3Jwjez4z
         /x/A==
X-Forwarded-Encrypted: i=1; AJvYcCXjE0nmfjDbo3FxhZDrlaRvnd7n1VUmDYTtHxyFtaqIa4H5jmTxjR0EQdYMFXSM2vPRLWkP+fizaM2MYZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3EUU6uRQARYyi5C+A4sTyIX7mzUXvWHG0R7pi6sPeuYGfbi8
	RgSjPMjmZ192d3pHFw2x5abNhy99tN7L4+avR+2Oxb1NB1Ywvfsq69aSOMiXlATsbK2AupoNORt
	PRhK/HvI=
X-Gm-Gg: ASbGncttFirGriSbhmS6UYuzxTR8tflDK0z1sVOtkz/9ko8YTRlKq+wsa5pzkDba5oH
	sfMpXoLilTVTOm/eaRbsK4rkD5pTBBKkGu30Kjv7yHU8JydtvHOrygvfRAhaym0bQtkWDt75wz3
	yFwrc1f/53KwHkUG8oMQr9pGkwBkMhpeq1C8+qCxQ0wi3NovHP8vxyOt5CBOY8JEGDCp4aGWXEh
	5Wxxc5azD6083U/ozwUw+bvIAT7QDN7uKlHEwcf8yUSKycKv5KHjjgdXHfuzBJuz4CrzmNXtDrA
	kG5eP1d+djUNMUIHWdVGAd5qGou0DdgLX4r5Dcz6RSzjEQR0JsQYaVDXvwvDK9q1tRnkC71uC4V
	o/UbvjFUqF4d8a8jwUwregfBcrtEdlk7OTiZKoltAjyphiQ==
X-Google-Smtp-Source: AGHT+IGcCdESpmX1Vy6F09hgFZDjeDjd459/LsopM+NqSVzbOIAk7kkT6pcc4fl7eBxr0s2gV81IXg==
X-Received: by 2002:a17:907:7206:b0:ad5:5a7e:bcd with SMTP id a640c23a62f3a-ad8b0a47cdbmr1700740666b.8.1748876563568;
        Mon, 02 Jun 2025 08:02:43 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3952esm809211466b.126.2025.06.02.08.02.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 08:02:43 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-602c4eae8d5so673518a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYEtN8wAD/l8BCkBbesM0NwVRvRFxoCoVIgCsxz7QZMsDcPeSelu4yJGk1OubCp2EBYoGiRs8G49D6ipc=@vger.kernel.org
X-Received: by 2002:a05:6402:50cb:b0:602:427c:452b with SMTP id
 4fb4d7f45d1cf-6056eefe1damr11457450a12.3.1748876561750; Mon, 02 Jun 2025
 08:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602144201.301974933@infradead.org> <20250602144755.928750774@infradead.org>
In-Reply-To: <20250602144755.928750774@infradead.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 2 Jun 2025 08:02:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
X-Gm-Features: AX0GCFtrf0u7pmdAyvnKC2JVvnUeAuZ2_710eriCGmXtZpWIAnVqF36OkbqCADA
Message-ID: <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 07:52, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Use the normal COUNT_ARGS() trick to split the variadic WARN() macro
> into per nr_args sub-marcos, except use a custom mapping such that 4
> and above map to another variadic that does the current thing as
> fallback.

Does this horror work with clang? Because I suspect not. The games you
play with inline asm are too disgusting for words.

But honestly, even if it does,I really hate this kind of insane
complexity for dubious reasons.

If you have a warning that is *so* critical for performance that you
can't deal with the register movement that comes from the compiler
doing this for you, just remove the warning.

Don't make our build system do something this disgusting.

                 Linus
