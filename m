Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D629A9F9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891684; cv=none; b=SGvnpixti1EzammzPoGyy+2V1X9DTtyPb39DrOSv/+BL05blTvOJEOYVDIFkM6ovNl22fkS15zMBAEiY9WT+JmqOWYTrk+jSsRRyZul4nj0hpWxUEOXPP/JltT3XwRZDK5+hpaC2qMwLdRw+A/OI2pQIxU7UZJdjey4w8EH6ukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891684; c=relaxed/simple;
	bh=ciuhiRaoNpFx8uv0i3S5oEjGJUszgKy8bu0RS3jVlvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGLVsyI7j7CDdHuCycQjrA1nGf/JJ/lNltDbhkDt3xB/5nr0XbGyiE5YMrB7lFHmwiLLj5eZr99z8YktXZ+2zVXRNC1vcSvc5r/64GyfKHL4ILeDczeHE9LtU0Xn0JV8zmxHgoi66E3o7agAlOxLLEKdGvMS1pglJpzjQGP/G3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Twbp3KKj; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Twbp3KKj"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-710e344bbf9so25502087b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751891680; x=1752496480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciuhiRaoNpFx8uv0i3S5oEjGJUszgKy8bu0RS3jVlvY=;
        b=Twbp3KKjTMdhz72DjSsNEyF71Z2zU/Oc6Mp6FUbWhrartfSY/Lb2k9VuJSSYL/fwMO
         dOnJG3Iyfleot0EEd5gaMAdmhYvQAENANaQGJB3v+6NdDX0/BjKEt0/YH5LufiRLAp6X
         58JNit++QcqLg2VNljDUUEtxrIqHxPn1XHT8IVaoDtgVrbZYK7uh05/lUSS6l36ia4V8
         wAlZaGQ31SWkGSr9Ic/fO3KtHZlhekMs2vN0spJMl5cRUW22dplit4731zSdpbISFL4j
         p6dRs21Uge4cUmDYEOVM/XgFpFz4eTvPODHsXLT1dImShzV2Ni5zHjoZSc6hKU1CBBuS
         mGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751891680; x=1752496480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciuhiRaoNpFx8uv0i3S5oEjGJUszgKy8bu0RS3jVlvY=;
        b=S4n/j3cHQEJ+hzo0KW9sm8qm/9fpOguQAgPv6at3Z5xmhA3JmsKdo6/Fvsxlfbjsvk
         8ZhQSRjUynjKDo3kMbtCD3hxs9zMOOCqX4Wzsr2LuyN5HDCG1jBS8JkZfYJ+2HVZp9MM
         HGeRRNOs2D9d0TZyWJMdtB9kl1W0TdB0ah+xWXWwAgcifOwQkFfsaOkIjwlcwrONTlVC
         PN1HJjX4RTit0VwT7gIxosypjJcHt4poWOTCdPIfRf/vfilhsFXHEqyGyIIfqcqSLJgH
         VmMv7wLZZETF3bmB5ceVi+EblJjxnR6dNEpqCsZVo0JZIl9MJNZJrrjPFBitfzt0ukFo
         WGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWywBG2Zq1iBBlhnPFd6ewwaqADkCsUwkOwSj//katS7jq+iwvvIS/sao3Z+wWAvG2zFW966zxWO9K/Y1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7GT/lL32pAi0NwEsbWiscuTNiTlSO1fvN1ZBABYpG4hcxxQFi
	f0L+Dp658h5R3uxY0GQCDsBAJxOYYGBA1P94Rgh6Mhr8ANYZKqGrHTnBOpZOJirRZn4qvSdcNlv
	IIcjK58bHD25T1OywZi0XMJHD0OC1WQ3xDNKOIp5Md8a7JKuzgxGTaX+fC6w=
X-Gm-Gg: ASbGncscgKWP7FllFxNzO17+LhfDTU967zEPouw/Q9ZI8YKlWViUNCWZ4UdCmUAnXV3
	AOBLXKfguRMyW7bvgfLED4DhcXwUhvLlYleMFzS13BkMqIGPuNbKYgxIxUg/JAYd5AF9n6mzmMC
	tuEini2MUAl6gtm5w6Wse5M4RDwIlAZzsxo3foHeLENE+wmOlTizfo2q86rrSpmRj4NfDdCzOWH
	ZVRQCGgxIo=
X-Google-Smtp-Source: AGHT+IHhAOIKJHBlleR6lkwGm21nEqLGAnY2t+v9+E3nEsiqfIJaOPqLez2JblQOcgFrZpe83/0Nyr1Fn9ssBIoIe8o=
X-Received: by 2002:a05:690c:640d:b0:70c:a57c:94a3 with SMTP id
 00721157ae682-7166b6cd964mr156878117b3.19.1751891680369; Mon, 07 Jul 2025
 05:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706210940.1720720-1-sidnayyar@google.com> <CAK7LNATbinPVLDqxzPQn9QNQGyacB5rDFsjQwwygy2KEjbhRFA@mail.gmail.com>
In-Reply-To: <CAK7LNATbinPVLDqxzPQn9QNQGyacB5rDFsjQwwygy2KEjbhRFA@mail.gmail.com>
From: Sid Nayyar <sidnayyar@google.com>
Date: Mon, 7 Jul 2025 13:34:28 +0100
X-Gm-Features: Ac12FXycrHdSmwbObL3rEnm5r-YMh5Xm9PPZd1Vpp9_5IcdhcLYezo7pWnL3HHc
Message-ID: <CA+OvW8aVreTHV8crcaX7Rbis67-YV=s1qSf7wuURY85MLWMoLQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: check for NULL filename pointer in find_module()
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 11:25=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Mon, Jul 7, 2025 at 6:09=E2=80=AFAM Siddharth Nayyar <sidnayyar@google=
.com> wrote:
> >
> > Pointer for dump filename can be NULL when a module is not created from
> > a dump file in modpost. The find_module() function should therefore
> > check whether the dump filename pointers are NULL before comparing them
> > using strcmp().
>
> I do not understand.
> I do not think that scenario would happen.
>
> There are two call-sites for new_module():
> [1] https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L1=
576
> [2] https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L2=
117
>
>
> For [2], mod->dump_file is set in the next line.
>
> [1] is always called after read_dump(), where
> is the only user of find_module(). [3]
>
> [3]: https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L=
2115

I see that this is not broken at the moment.

I was working on a patch series where I am making use of find_module() afte=
r
read_symbols() is called on vmlinux and other object files for modules. I
realised that find_module() does not work as expected and decided to send a=
 fix
generally. If you think find_module() does not need to support the general =
case
of finding modules after read_symbols(), I can keep this change in my patch
series and not submit it separately.

--
Regards,
Sid
